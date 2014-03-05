
//= require markerwithlabel
//= require jquery

var radar = {

  fix_types: {
    0: 'Not available',
    1: 'Not available',
    2: '2D',
    3: '3D'
  },

  initialize: function() {
    var me = this;

    me.map = new google.maps.Map(document.getElementById("map-canvas"), {
      center: new google.maps.LatLng(45.812709,8.763742),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.SATELLITE,
    });

    me.circuitLayer = new google.maps.KmlLayer(window.location.origin + '/circuit.kml');
    me.circuitLayer.setMap(me.map);

  //  new google.maps.Marker({
  //    position: new google.maps.LatLng(45.808025,8.772275),
  //    title: 'Camera 1',
  //    map: map
  //  });

    me.iw = new google.maps.InfoWindow({
    });

    me.objects = {};

    me.station = {
      station_id: 'FLARM1',
      data: {},
    };

    faye.subscribe('/glideradar/events', function(message) {
      me.onMessage(message);
    }, null, function() {
      alert('Error subscribing to wall!');
    });

    setInterval(function() { me.periodicCleanup(); }, 2000);
    setInterval(function() { me.extrapolate(); }, 100);
  },

  onMessage: function(message) {
    var me = this;

    switch(message.msg_type) {
    case 'station_update': me.onStationUpdate(message); break;
    case 'traffic_update': me.onTrafficUpdate(message); break;
    }
  },

  onStationUpdate: function(message) {
    var me = this;

    me.station.data = message.msg;
    me.refreshStation(me.station);
  },

  onTrafficUpdate: function(message) {
    var me = this;

    var keys = Object.keys(message.msg.objects);
    for (var i = 0 ; i< keys.length; i++) {
      var key = keys[i];
      var obj = me.objects[key];

      if (obj) {
        obj.prev_sog = obj.data.sog;
        obj.data = message.msg.objects[key];
      } else {
        obj = {};
        obj.flarm_code = key;
        obj.data = message.msg.objects[key];
        obj.prev_sog = obj.data.sog;

        obj.marker = new MarkerWithLabel({
          position: new google.maps.LatLng(obj.data.lat, obj.data.lng),
          labelContent: key,
          labelClass: 'label',
          map: me.map,
          obj: obj,
        });

        google.maps.event.addListener(obj.marker, 'click', function (e, marker) {
          me.iw.open(me.map, this);
          me.iw.obj = this.obj;
          me.updateObjectIw(this.obj);
        });

        jQuery.ajax(window.location.origin + '/ygg/acao/planes/by_code/' + key, {
          dataType: 'json',
          // FIXME usare obj nella closure non funziona???? Il binding è sempre quello dell'ultima funzione anonima definita
          context: obj,
          success: function(data) {
            this.plane = data;
            me.updateObjectData(this);
          },
        });

        me.objects[key] = obj;
  //      me.updateObjectData(obj);
      }

      obj.last_update = new Date;

      me.updateObjectPosition(obj);
    }
  },

  periodicCleanup: function() {
    var me = this;

    var now = new Date;

    var keys = Object.keys(me.objects);
    for (var i = 0 ; i < keys.length; i++) {
      var key = keys[i];
      var obj = me.objects[key];

      if (now - obj.last_update > 10000) {
        obj.marker.setMap(null);
        delete me.objects[key];
      } else if (now - obj.last_update > 2000) {
        me.updateObjectPosition(obj);
      }
    }
  },

  extrapolate: function() {
    var me = this;

    var keys = Object.keys(me.objects);
    for (var i = 0 ; i < keys.length; i++) {
      var key = keys[i];
      var obj = me.objects[key];
      var del = (new Date - obj.last_update) / 1000; // DeltaT in seconds
      var spd = obj.data.sog + (obj.data.sog - obj.prev_sog) * del;
      var cograd = ((obj.data.cog + obj.data.tr * del) / 180) * Math.PI;

      obj.marker.setPosition(new google.maps.LatLng(
        obj.data.lat + (Math.cos(cograd) * spd * del) / 111111,
        obj.data.lng + (Math.sin(cograd) * spd * del) / (111111 * Math.cos((obj.data.lat / 180) * Math.PI))
      ));
    }
  },

  updateObjectPosition: function(obj) {
    var me = this;

console.log("O", obj.data.at);
    obj.marker.setPosition(new google.maps.LatLng(obj.data.lat, obj.data.lng));

    obj.marker.setIcon({
      path: 'M -5,0 5,0 M 0,-2 0,4 M -1,4 1,4 z',
      fillColor: 'white',
      strokeColor: 'white',
      strokeWeight: 2,
      scale: 6,
      rotation: obj.data.cog || 0,
      strokeOpacity: 1 - ((new Date - obj.last_update) / 10000),
    });

    if (me.iw.obj == obj)
      me.updateObjectIw(obj);
  },

  updateObjectIw: function(obj) {
    var me = this;

    var txt = '';

    if (obj.plane) {
      txt +=
        '<b>' +
        obj.plane.type_name + ' ' + obj.plane.registration +
        (obj.plane.race_registration ? (' (' + obj.plane.race_registration + ')') : '') +
        '</b><br />';

      txt +=
        'Owner: ' + obj.plane.owner_name + '<br />';
    }

    txt +=
      'Height: ' + obj.data.alt.toFixed(0) + ' m<br />' +
      'Speed: ' + (obj.data.sog * 3.6).toFixed(0) + ' km/h<br />';

    me.iw.setContent(txt);
  },

  updateObjectData: function(obj) {
    var me = this;

    obj.marker.set('labelContent', obj.plane ? obj.plane.registration : obj.flarm_code);
    obj.marker.label.setStyles();
    obj.marker.label.draw();
  },

  refreshStation: function(station) {
    var me = this;

    var pos = new google.maps.LatLng(station.data.lat, station.data.lng);

    if (!station.marker) {
      station.marker = new google.maps.Marker({
        position: pos,
        title: station.station_id,
        map: me.map,
      });

      google.maps.event.addListener(station.marker, 'click', function (e) {
        me.iw.open(me.map, this);
        me.iw.obj = station;
        me.updateStationIw(station);
      });
    }

    station.marker.setPosition(pos);

    if (me.iw.obj == station)
      me.updateStationIw(station);
  },

  updateStationIw: function(station) {
    var me = this;

    me.iw.setContent(
      'Station: ' + station.station_id + '<br />' +
      'GPS fix type: ' + me.fix_types[station.data.gps_fix_type] + ' (' + station.data.gps_sats + ' sats)<br />' +
      'GPS fix quality: ' + station.data.gps_fix_qual + '<br />' +
      'GPS precision: ' + station.data.gps_pdop + '<br />' +
      'Lat: ' + station.data.lat + '<br />' +
      'Lng: ' + station.data.lng + '<br />' +
      'Altitude: ' + station.data.alt + '<br />'
    );
  },
};

var faye = new Faye.Client(app.faye_interface_uri);

google.maps.event.addDomListener(window, 'load', function() {
  radar.initialize();
});
