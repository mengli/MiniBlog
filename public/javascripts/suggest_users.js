/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var App = {
    followadd : function (fid, id, e) {
        var url = '/follow_user/follow';
        var pars = 'fid=' + fid + '&id=' + id;
        var myAjax = new Ajax.Updater(e, url, {
            method: 'get',
            parameters: pars
        });
        e.className = 'concernBtn_Yet';
    }
};


