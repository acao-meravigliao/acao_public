/*
 * Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *          Lele Forzani <lele@windmill.it>
 *          Alfredo Cerutti <acerutti@intercom.it>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

Ext.define('Extgui.Acao.Plugin', {
  extend: 'Extgui.Plugin',

  css: '/assets/acao.css',

  refs: [
  ],

  init: function() {
    var me = this;

    this.callParent(arguments);

    me.control({
      'viewport > tabpanel > panel[klass=Extgui.Acao.Flight.IndexPanel] > panel > toolbar button[name=new]':
       { click: function(el, record) { me.openUri('ygg/acao/flights/new'); }, },
    });
  },
});
