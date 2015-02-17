// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.onreadystatechange = function () {
    if (document.readyState == "interactive") {
        initApplication();
    }
}

function initApplication(){
    var appended = false, up_arrow = document.querySelector("#up");

    onscroll = function () {
        var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
        if (scrollTop > 500) {
            if (!appended) {
                up_arrow.hidden = false;
                appended = true;
            }
        } else {
            if (appended) {
                up_arrow.hidden = true;
                appended = false;
            }
        }
    };

}

function getPageVar(sVar) {
    return decodeURI(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + encodeURI(sVar).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));
}

function getGrep(text) {
    var sign;
    if (location.search == "") sign = "?"; else sign = "&";
    var search = sign + 'query=' + text;
    var query = location.pathname + 'grep' + location.search + search;
    sendRequest(query, true)
}

function sendRequest(url, isGoToBottom) {
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
        try {
            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            try {
                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e) {
            }
        }
    }
    if (!httpRequest) {
        return false;
    }
    httpRequest.open("GET", url);
    httpRequest.onreadystatechange = function () {
        if (httpRequest.readyState != 4 || httpRequest.status != 200) return;
        document.getElementById('main').innerHTML = httpRequest.responseText;
        if (isGoToBottom) {
            window.scrollTo(0, document.body.scrollHeight);
        }
    };
    httpRequest.send();
    return true;
}


;
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

;
