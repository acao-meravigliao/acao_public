/*
 * Copyright (C) 2014-2014, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

Ext.define('Acao.MainController', {
  extend: 'Extgui.MainControllerBase',
  requires: [
    'Acao.Viewport',
    'Acao.LoginDialog'
  ],
  stores: [ ],
  views: [
    'Acao.Viewport',
    'Acao.LoginDialog'
  ],
  refs: [
    { ref: 'mainpanel', selector: 'viewport container[name=mainpanel]' },
  ],

  init: function() {
    var me = this;

    me.callParent(arguments);

    me.control({
      'viewport > toolbar[region=north] button[name=logout]': { click: me.onLogout },
      'viewport > toolbar[region=north] textfield[name=search]': { specialkey: me.onSearchSpecialKey },
      'viewport > toolbar[region=west] button': { click: me.onMenuButton },
    });

    me.getView('Acao.Viewport').create();

    me.openUri('ygg/acao/flights/');
  },

  handleUriChange: function(uri) {
    var me = this;

    if (!uri)
      return;

    uri = unescape(uri);

    if (!me.getMainpanel() || me.getMainpanel().uri == uri)
      return;

    me.openUriWithConfig(uri);
  },

  onSearchSpecialKey: function(field, event) {
    var me = this;

    if (event.getKey() == Ext.EventObject.ENTER)
      me.openUri('search/' + field.getValue());

    if (event.getKey() == Ext.EventObject.ESC)
      field.setValue('');
  },

  openUriWithConfig: function(uri, contentConfig) {
    var me = this;

console.log("OOOOOOOO", uri, contentConfig);
    contentConfig = contentConfig || {};

    var card = new Extgui.Card({
      uri: uri,
      contentConfig: contentConfig,
      title: null,
      closable: false,
    });

    me.getMainpanel().removeAll(true);
    me.getMainpanel().add(card);
  },

  onMenuButton: function(button) {
    var me = this;

    switch(button.name) {
//    case 'anagraphic': me.openUri('ygg/vpn/devices/'); break;
    case 'flights': me.openUri('ygg/acao/flights/'); break;
    case 'planes': me.openUri('ygg/acao/planes/'); break;
    case 'logout': me.onLogout(); break;
    }
  },
});
