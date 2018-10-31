/**
 * Created by Cheng on 2016/7/11.
 */

var getDocId = function (id) {
    return document.getElementById(id);
}


window.onload = function () {
    var timer = null;
    var pagelookheight = document.documentElement.clientHeight;

    backtop.onclick = function () {
        // alert("hehheh");

        timer = setInterval(function () {

            var btopheight = document.body.scrollTop;
            var speedtop = btopheight / 5;
            document.body.scrollTop -= btopheight - speedtop;
            if (btopheight == 0) {
                clearInterval(timer);
            }
        }, 30);
    }

    window.onscroll = function () {
        var btopheight = document.body.scrollTop;
        if (btopheight >= pagelookheight / 3) {
            backtop.style.display = "block";
        } else {
            backtop.style.display = "none";
        }

    }
}