
//= require markerwithlabel
//= require jquery

var faye = new Faye.Client(app.faye_interface_uri);

function initialize() {
  var map = new google.maps.Map(document.getElementById("map-canvas"), {
    center: new google.maps.LatLng(45.812709,8.763742),
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.SATELLITE,
  });

  var circuitLayer = new google.maps.KmlLayer(window.location.origin + '/circuit.kml');
  circuitLayer.setMap(map);

//  new google.maps.Marker({
//    position: new google.maps.LatLng(45.808025,8.772275),
//    title: 'Camera 1',
//    map: map
//  });

  var iw = new google.maps.InfoWindow({
  });

  objects = {};
  station = {
    station_id: 'FLARM1',
    data: {},
  };

  faye.subscribe('/glideradar/events', function(message) {

    if (message.msg_type == 'station_update') {
      station.data = message.msg;
      refreshStation(station);
    } else if (message.msg_type == 'traffic_update') {
      var keys = Object.keys(message.msg.objects);
      for (var i = 0 ; i< keys.length; i++) {
        var key = keys[i];
        var obj = objects[key];

        if (obj) {
          objects[key].data = message.msg.objects[key];
        } else {
console.log("NEW OBJECT", key);
          obj = {};
          obj.flarm_code = key;
          obj.data = message.msg.objects[key];

          obj.marker = new MarkerWithLabel({
            position: new google.maps.LatLng(obj.data.lat, obj.data.lng),
            labelContent: key,
            labelClass: 'label',
            map: map
          });

          google.maps.event.addListener(obj.marker, 'click', function (e) {
            iw.open(map, this);

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
              'Height: ' + obj.data.alt + ' m<br />' + 
              'Speed: ' + obj.data.sog + ' km/h<br />';

            iw.setContent(txt);
          });

          jQuery.ajax(window.location.origin + '/ygg/acao/planes/by_code/' + key, {
            accepts: 'application/json',
            cache: false,
            success: function(data) {
console.log("NEW OBJECT ", obj.flarm_code, ' DATA ', data);
              obj.plane = data;
              updateObjectData(obj);
            },
          });

          objects[key] = obj;
//          updateObjectData(obj);
        }

        obj.last_update = new Date;

        updateObjectPosition(obj);
      }
    }
  }, null, function() {
    alert('Error subscribing to wall!');
  });

  setInterval(function() {
    var now = new Date;

    var keys = Object.keys(objects);
    for (var i = 0 ; i < keys.length; i++) {
      var key = keys[i];
      var obj = objects[key];

      if (now - obj.last_update > 10000) {
        obj.marker.setMap(null);
        delete objects[key];
      } else if (now - obj.last_update > 2000) {
        updateObjectPosition(obj);
      }
    }
  }, 2000);

  function updateObjectPosition(obj) {
//console.log("O", obj.data);
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
  }

  function updateObjectData(obj) {
    console.log("UPDATEOBJECTDATA", obj.marker.getPosition());

    obj.marker.set('labelContent', obj.plane ? obj.plane.registration : obj.flarm_code);
    obj.marker.label.setStyles();
    obj.marker.label.draw();
  }

  var fix_type = {
    0: 'Not available',
    1: 'Not available',
    2: '2D',
    3: '3D'
  };

  function refreshStation(obj) {
    var pos = new google.maps.LatLng(obj.data.lat, obj.data.lng);

    if (!obj.marker) {
      obj.marker = new google.maps.Marker({
        position: pos,
        title: obj.station_id,
        map: map
      });

      google.maps.event.addListener(obj.marker, 'click', function (e) {
        iw.open(map, this);
        iw.setContent(
          'Station: ' + obj.station_id + '<br />' +
          'GPS fix type: ' + fix_type[obj.data.gps_fix_type] + ' (' + obj.data.gps_sats + ' sats)<br />' +
          'GPS fix quality: ' + obj.data.gps_fix_qual + '<br />' +
          'GPS precision: ' + obj.data.gps_pdop + '<br />' +
          'Lat: ' + obj.data.lat + '<br />' +
          'Lng: ' + obj.data.lng + '<br />' +
          'Altitude: ' + obj.data.alt + '<br />'
        );
      });
    }

    obj.marker.setPosition(pos);
  }

}

google.maps.event.addDomListener(window, 'load', initialize);
