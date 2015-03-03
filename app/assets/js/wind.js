
var wind = {
  initialize: function() {
    var me = this;

    faye.subscribe('/wind/updates', function(message) {
      me.onMessage(message);
    }, null, function() {
      alert('Error subscribing to wall!');
    });
  },

  onMessage: function(message) {
    var me = this;

console.log("MSG=", message);

    switch(message.msg_type) {
    }
  },
};

var faye = new Faye.Client(app.faye_interface_uri);

$( document ).ready(function() {
  wind.initialize();
});
