/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var App = {
    collect : function (mid, id, e) {
        var url = '/collections/new';
        var pars = 'mid=' + mid + '&id=' + id;
        var myAjax = new Ajax.Updater(e, url, {
            method: 'get',
            parameters: pars
        });
        e.className = 'concernBtn_Yet';
    }
};

function fetch_profile(id) {
    var url = 'fetch_profile/fetch_profile';
    var pars = 'id=' + id;
    var myAjax = new Ajax.Updater($('profile_following_follower_update'), url, {
        method: 'get',
        parameters: pars
    });
}
