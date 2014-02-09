/*
 * Copyright (C) 2014-2014, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

Ext.define('Acao.Application', {
  extend: 'Extgui.app.Base',
  loginDialogClass: 'Acao.LoginDialog',
  mainControllerClass: 'Acao.MainController',
  stage2File: '/assets/acao-stage2.js',
  name: 'AcaoApp',
});

