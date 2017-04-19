/**
 * Created by Cheng on 2016/7/14.
 */

window.onload = function () {
    imgLoaction("container", "boxes");
    var imgData = {
            "data": [{"src": "1.jpg"}, {"src": "3.jpg"},
            {"src": "4.jpg"}, {"src": "11.jpg"}, {"src": "12.jpg"},
            {"src": "7.jpg"}, {"src": "8.jpg"}, {"src": "2.jpg"}]
    }

    window.onscroll = function () {             //瀑布流不加载  问题在这里
        if (checkFlag()) {
            var cparent = document.getElementById("container");
            for (var i = 0; i < imgData.data.length; i++) {
                var ccontent = document.createElement("div");
                ccontent.className = "boxes";
                cparent.appendChild(ccontent);
                // var boximg = document.createElement("div");
                // boxing.className = "box";
                // ccontent.appendChild(boximg);
                // var img = document.createElement("img");
                // img.src = "./images/" + imgData.data[i].src;
                // boximg.appendChild(img);
            }
            imgLoaction();
        }
    }//监听滚动条
}

function checkFlag() {
    var cparent = document.getElementById("container");
    var ccontent = getChild(cparent, "boxes");
    var lastContentHeight = ccontent[ccontent.length - 1].offsetTop;
    console.log(lastContentHeight);     //展示最后一张图片距离顶部距离
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    console.log(scrollTop);             //
    var pageHeight = document.documentElement.clientHeight || document.body.clientHeight;

    if (lastContentHeight < scrollTop + pageHeight) {
        return true;
    }
}

function imgLoaction(parent, content) {
    //将父级控件下的所有内容全部取出
    var cparent = document.getElementById(parent);//从父级控件取出所有内容

    var ccontent = getChild(cparent, content);
    console.log(ccontent);

    var imgwidth = ccontent[0].offsetWidth;
    var num = Math.floor(document.documentElement.clientWidth / imgwidth);
    cparent.style.cssText = "width:" + imgwidth * num + "px;";

    var BoxHeightArr = [];
    for (var i = 0; i < ccontent.length; i++) {
        if (i < num) {
            BoxHeightArr[i] = ccontent[i].offsetHeight;
            console.log(BoxHeightArr[i]);           //调试信息
        } else {
            var minHeight = Math.min.apply(null, BoxHeightArr);//可以获取数组最小值
            var minIndex = getminheightLocation(BoxHeightArr, minHeight)

            ccontent[i].style.position = "absolute";
            ccontent[i].style.top = minHeight + "px";
            ccontent[i].style.left = ccontent[minIndex].offsetLeft + "px";
            BoxHeightArr[minIndex] = BoxHeightArr[minIndex] + ccontent[i].offsetHeight;
        }

    }
}
function getminheightLocation(BoxHeightArr, minHeight) {
    for (var i in BoxHeightArr) {
        if (BoxHeightArr[i] == minHeight) {
            return i;
        }
    }

}

function getChild(parent, content) {
    var contentArray = [];
    var allContentArray = parent.getElementsByTagName("*");
    for (var i = 0; i < allContentArray.length; i++) {
        if (allContentArray[i].className == content) {
            contentArray.push(allContentArray[i]);
        }
    }
    return contentArray;
}