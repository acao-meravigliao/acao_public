/*
 * Copyright (C) 2008-2013, Intercom Srl, Daniele Orlandi
 *
 * Author:: Daniele Orlandi <daniele@orlandi.com>
 *          Lele Forzani <lele@windmill.it>
 *          Alfredo Cerutti <acerutti@intercom.it>
 *
 * License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
 *
 */

Ext.define('Acao.LoginDialog', {
  extend: 'Ext.window.Window',
  requires: [
    'Ext.form.Panel',
    'Extgui.AjaxJson',
    'Extgui.JsonSubmit',
  ],
  alias: 'widget.logindialog',
  title: 'Login...',
  width: 400,
  height: 180,
  closable: false,
  border: false,
  layout: 'fit',
  items: [
   {
    xtype: 'form',
    layout: 'anchor',
    frame: false,
    border: false,
    labelWidth: 80,
    items: [
     {
      xtype: 'textfield',
      name: 'pilot_code',
      anchor: '100%',
      margin: 20,
      tabIndex: 1,
      maxLength: 256,
      fieldLabel: 'Codice Pilota',
      disableKeyFilter: true,
      allowBlank: false,
     },
     {
      xtype: 'textfield',
      anchor: '100%',
      margin: 20,
      tabIndex: 2,
      name: 'password',
      inputType: 'password',
      fieldLabel: 'Password',
      disableKeyFilter: true,
      allowBlank: false,
     }
    ],
   },
  ],
  buttons: [
   { text: 'Login', name: 'login' },
  ],

  I18n: {
    fqda_label: 'E-mail',
    fqda_blank_text: 'E-mail is required',
    password_label: 'Password',
    password_blank_text:'Password is required',
    wait_title: 'Access',
    wait_message: 'Authentication process...',
    login_error_title: 'Login error',
    login_failure_title: 'Login failed',
    button_login: 'Login',
    fldset_fqda_auth: 'Fqda authentication',
    assoc_cert_label: 'Associate this certificate',
    title_certificate: 'You have presented a cryptographic certificate made out to',
    tooltip_assoc_cert: 'The email declared in the certificare has been found into the identities but is not yet associated. Associate it right now!',
    tooltip_login_with_cert: 'Login as '
  },


  initComponent: function() {
    var me = this;

    this.callParent(arguments);

//    this.down('textfield[name=fqda]').on('change', function(field,newV,oldV,opt) {
//      Ext.get('login_fqda').dom.value = newV;
//    });
//
//    this.down('textfield[name=fqda]').on('blur', function(field, opt) {
//      Ext.get('login_fqda').focus();
//      Ext.get('login_fqda').blur();
////      field.up('form').getComponent('password').setValue( Ext.get('login_passwd').getValue() );
//    });
//
//    this.down('textfield[name=password]').on('change', function(field,newV,oldV,opt) {
//      Ext.get('login_passwd').dom.value = newV;
//    });

    me.down('button[name=login]').on('click', function() {
      // Firefox's password manager is triggered by click on submit button
      //Ext.getDom('login_submit').click();

      // Chrome's password manager is triggered by actual submit
//      me.getComponent('form').el.dom.submit();

      me.setLoading('Sending...');
      Extgui.AjaxJson.request({
        url: '/ygg/session/authenticate_by_fqda_and_password',
        method: 'POST',
        jsonData: {
          fqda: me.down('textfield[name=pilot_code]').getValue() + '@legacy.acao.it',
          password: me.down('textfield[name=password]').getValue(),
        },
        callback: function() { me.setLoading(false); },
        success: function(res) {
//          var response = action.response, result = action.result;

          if (!res.responseJSON) {
            Ext.Msg.alert('Error decoding server response');
            return;
          }

          if (res.responseJSON.authenticated) {
            me.fireEvent('authenticated', res.responseJSON);
            me.close();
          } else {
            Ext.Msg.alert(me.I18n.login_failure_title, '<b>' +
                          Ext.util.Format.htmlEncode(res.responseJSON.msg) + '</b>');
          }
        },
        failure: Extgui.ExceptionWindow.ajaxFailure
      });
    });

//    this.on('afterrender', function() {
//      this.getComponent('form').getComponent('fqda').setValue(Ext.get('login_fqda').getValue());
//      this.getComponent('form').getComponent('password').setValue(Ext.get('login_passwd').getValue());
//    });
  },
});
