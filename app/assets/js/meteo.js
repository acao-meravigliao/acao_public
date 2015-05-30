//= require jquery
//= require jquery.sprintf

var wind = {
  initialize: function() {
    var me = this;

    faye.subscribe('/meteo/updates/*', function(message) {
      me.onMessage(message);
    }, null, function() {
      alert('Error subscribing to meteo data!');
    });

    me.meteo = {};
    me.meteo_upd = {};

    me.wxUpdated();

  },

  onMessage: function(message) {
    var me = this;

    //console.log("MSG=", message);

    switch(message.type) {
    case 'WX_UPDATE':
      var u = {};

      jQuery.each(message.payload.data, function(k,v) {
        me.meteo[k] = v;
        me.meteo_upd[k] = Date.parse(message.timestamp);
        u[k] = true;
      });

      me.wxUpdated(u);
    }
  },

  wxUpdated: function(u) {
    var me = this;
    var m = me.meteo;

    u = u || {};

    jQuery.each(me.meteo_upd, function(k,v) {
      if (v < (Date.now() - 15000) && m[k]) {
        u[k] = true;
        m[k] = null;
      }
    });

    if (u.wind_speed) $('#wind_speed').text(m.wind_speed !== undefined ? (m.wind_speed * 3.6).toFixed(1) : "INOP");
    if (u.wind_dir) $('#wind_dir').text(m.wind_dir !== undefined ? m.wind_dir.toFixed(1) : "INOP");

    if (u.wind_dir) {
      if (m.wind_dir !== undefined) {
        $('#needle').show().attr('transform', 'rotate(' + m.wind_dir + ')');
        $('#needle_shadow').show().attr('transform', 'rotate(' + m.wind_dir + ')');
      } else {
        $('#needle').hide();
        $('#needle_shadow').hide();
      }
    }

    if (u.wind_speed) {
      if (m.wind_speed !== undefined) {
        $('#red_slider').attr('transform', 'translate(0,' + (-(m.wind_speed/16.7)*60) + ')');
        $('#red_slider text').text((m.wind_speed * 3.6).toFixed(1));
      } else {
        $('#red_slider text').text("INOP");
      }
    }

    //----------------------------------

    if (u.wind_2m_avg) {
      if (m.wind_2m_avg !== undefined) {
        $('#wind_2m_avg').text((m.wind_2m_avg * 3.6).toFixed(1));
        $('#green_slider').attr('transform', 'translate(0,' + (-(m.wind_2m_avg/16.7)*60) + ')');
        $('#green_slider text').text((m.wind_2m_avg * 3.6).toFixed(1));
      } else {
        $('#wind_2m_avg').text("INOP");
        $('#green_slider text').text("INOP");
      }
    }

    if (u.wind_2m_vec_mag) {
      $('#wind_2m_vec_mag').text(m.wind_2m_vec_mag !== undefined ? (m.wind_2m_vec_mag * 3.6).toFixed(1) : "INOP");
    }

    if (u.wind_2m_vec_dir) {
      $('#wind_2m_vec_dir').text(m.wind_2m_vec_dir !== undefined ? m.wind_2m_vec_dir.toFixed(1) : "INOP");

      if (m.wind_2m_vec_dir !== undefined) {
        $('#needle_2m').show().attr('transform', 'rotate(' + m.wind_2m_vec_dir + ')');
        $('#needle_2m_shadow').show().attr('transform', 'rotate(' + m.wind_2m_vec_dir + ')');
      } else {
        $('#needle_2m').hide();
        $('#needle_2m_shadow').hide();
      }
    }

    if (u.wind_2m_gst) {
      if (m.wind_2m_gst !== undefined) {
        $('#wind_2m_gst').text((m.wind_2m_gst * 3.6).toFixed(1));
        $('#green_slider_gst').show().attr('transform', 'translate(0,' + (-(m.wind_2m_gst/16.7)*60) + ')');
      } else {
        $('#wind_2m_gst').text("INOP");
        $('#green_slider_gst').hide();
      }
    }

    if (u.wind_2m_gst_dir) $('#wind_2m_gst_dir').text(m.wind_2m_gst_dir !== undefined ? m.wind_2m_gst_dir.toFixed(1) : "INOP");

    if (u.wind_2m_gst_ts) {
      if (m.wind_2m_gst_ts !== undefined) {
        var d = new Date(Date.parse(m.wind_2m_gst_ts));
        $('#wind_2m_gst_ts').text($.sprintf("%02d:%02d:%02d", d.getHours(), d.getMinutes(), d.getSeconds()));
      } else
        $('#wind_2m_gst_ts').text("INOP");
    }

    //----------------------------------

    if (u.wind_10m_avg) {
      if (m.wind_10m_avg !== undefined) {
        $('#wind_10m_avg').text((m.wind_10m_avg * 3.6).toFixed(1));
        $('#blue_slider').attr('transform', 'translate(0,' + (-(m.wind_10m_avg/16.7)*60) + ')');
        $('#blue_slider text').text((m.wind_10m_avg * 3.6).toFixed(1));
      } else {
        $('#wind_10m_avg').text("INOP");
        $('#blue_slider text').text("INOP");
      }
    }

    if (u.wind_10m_vec_mag) {
      $('#wind_10m_vec_mag').text(m.wind_10m_vec_mag !== undefined ? (m.wind_10m_vec_mag * 3.6).toFixed(1) : "INOP");
    }

    if (u.wind_10m_vec_dir) {
      $('#wind_10m_vec_dir').text(m.wind_10m_vec_dir !== undefined ? m.wind_10m_vec_dir.toFixed(1) : "INOP");

      if (m.wind_10m_vec_dir !== undefined) {
        $('#needle_10m').show().attr('transform', 'rotate(' + m.wind_10m_vec_dir + ')');
        $('#needle_10m_shadow').show().attr('transform', 'rotate(' + m.wind_10m_vec_dir + ')');
      } else {
        $('#needle_10m').hide();
        $('#needle_10m_shadow').hide();
      }
    }

    if (u.wind_10m_gst) {
      if (m.wind_10m_gst !== undefined) {
        $('#wind_10m_gst').text((m.wind_10m_gst * 3.6).toFixed(1));
        $('#blue_slider_gst').show().attr('transform', 'translate(0,' + (-(m.wind_10m_gst/16.7)*60) + ')');
      } else {
        $('#wind_10m_gst').text("INOP");
        $('blue_slider_gst').hide();
      }
    }

    if (u.wind_10m_gst_dir) $('#wind_10m_gst_dir').text(m.wind_10m_gst_dir !== undefined ? m.wind_10m_gst_dir.toFixed(1) : "INOP");

    if (u.wind_10m_gst_ts) {
      if (m.wind_10m_gst_ts !== undefined) {
        var d = new Date(Date.parse(m.wind_10m_gst_ts));
        $('#wind_10m_gst_ts').text($.sprintf("%02d:%02d:%02d", d.getHours(), d.getMinutes(), d.getSeconds()));
      } else
        $('#wind_10m_gst_ts').text("INOP");
    }

    //----------------------------------

    if (u.qfe) $('#qfe').text(m.qfe !== undefined ? (m.qfe / 100).toFixed(0) : "INOP");
    if (u.qfe_h) $('#qfe_h').text(m.qfe_h !== undefined ? m.qfe_h.toFixed(1) : "INOP");
    if (u.qnh) $('#qnh').text(m.qnh !== undefined ? (m.qnh / 100).toFixed(0) : "INOP");
    if (u.isa_h) $('#isa_h').text(m.isa_h !== undefined ? m.isa_h.toFixed(1) : "INOP");

    if (u.temperature) $('#temperature').text(m.temperature !== undefined ? m.temperature.toFixed(1) : "INOP");
    if (u.humidity) $('#humidity').text(m.humidity !== undefined ? m.humidity.toFixed(1) : "INOP");

    if (me.periodic)
      clearTimeout(me.periodic);

    me.periodic = setTimeout(function() {
      me.wxUpdated();
    }, 15000);

  },
};

var faye = new Faye.Client(app.faye_interface_uri);

$( document ).ready(function() {
  wind.initialize();
});
