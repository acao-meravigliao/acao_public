/*
 * Copyright (C) 2014-2014, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

Ext.define('AcaoServices.Application', {
  extend: 'Extgui.app.Base',
  requires: [
    'AcaoServices.LoginDialog',
  ],

  name: 'AcaoServicesFoo',
  mainControllerClass: 'AcaoServices.MainController',
  loginDialogClass: 'AcaoServices.LoginDialog',
  requiredCapability: 'simple_interface',
});
