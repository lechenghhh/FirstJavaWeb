/**
 * Created by Cheng on 2016/7/10.
 */

var className = "tooltip-box";

var getDocID = function (id) {        //重构id获取方法
    return document.getElementById(id);
}

var parentdiv = getDocID("div");


function showToolTip(obj, id, html, width, height) {
    if (getDocID(id) == null) {
        var tooltipbox;
        tooltipbox = document.createElement("div");
        tooltipbox.className = className;
        tooltipbox.id = id;
        tooltipbox.innerHTML = html;

        obj.appendChild(tooltipbox);

        tooltipbox.style.width = width ? width + "px" : "auto";
        tooltipbox.style.height = height ? height + "px" : "auto";
        tooltipbox.style.position = "absolute";
        tooltipbox.style.display = "block";

        var left = obj.offsetLeft;
        var top = obj.offsetTop + 20;

        tooltipbox.style.left = left + "px";
        tooltipbox.style.top = top + "px";

        obj.addEventListener("mouseout", function () {   //新写法，符合w3c标准
            setTimeout(function () {                    //监听鼠标移出，对提示框做隐藏
                getDocID(id).style.display = "none"
            }, 200);
        })
        // obj.onmouseout = function () {               //旧的写法
        //     setTimeout(function () {
        //         document.getElementById(id).style.display = "none"
        //     },500);
        // }
    } else {
        getDocID(id).style.display = "block";
    }
}

var wb = getDocID("weibo");
var wx = getDocID("weixin");
var lg = getDocID("logo");
var jk = getDocID("jike");

parentdiv.addEventListener("mouseover", function (e) {      //w3c标准
    var target = e.target;
    if (target.className == "tooltip") {
        var _html;
        var _id;
        var _width;
        switch (target.id) {
            case "weibo":
                _html = "海都记者 章微/文包华/图";
                _width = 200;
                _id = "wb";
                break;
            case "weixin":
                _html = "摄影之友 " +
                    "《摄影之友》杂志官方微博";
                _width = 200;
                _id = "wx";
                break;
            case "logo":
                _html = "logo";
                _width = 200;
                _id = "lg";
                break;
            case "jike":
                var wangzhi = "<iframe src='http://www.baidu.com'" +
                    "width='500'height='300'></iframe>"
                _html = wangzhi;
                _width = 500;
                _id = "jk";
                break;
        }
        showToolTip(target, _id, _html, _width);
    }
})

// wb.onmousemove = function () {                       //旧办法
//     showToolTip(this, "wb", "海都记者 章微/文包华/图", 150);
// }
// wx.onmousemove = function () {
//     showToolTip(this, "wx", "海都记者 章微/文包华/图", 150);
// }
// lg.onmousemove = function () {
//     showToolTip(this, "lg", "海都记者 章微/文包华/图", 150);
// }
// jk.onmousemove = function () {
//     var wangzhi = "<iframe src='http://www.xialv.com/news/2693' width='500'height='300'></iframe>"
//     showToolTip(this, "jk", wangzhi, 500);
// }



