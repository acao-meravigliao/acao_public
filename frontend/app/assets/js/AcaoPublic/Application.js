/*
 * Copyright (C) 2014-2014, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

Ext.define('AcaoPublic.Application', {
  extend: 'Extgui.app.Base',
  requires: [
    'AcaoPublic.LoginDialog',
  ],

  name: 'AcaoPublicFoo',
  mainControllerClass: 'AcaoPublic.MainController',
  loginDialogClass: 'AcaoPublic.LoginDialog',
  requiredCapability: 'simple_interface',
});
