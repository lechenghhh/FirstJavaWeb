(function () {
    var map;//地图对象
    getLocation();//教程地址：https://www.cnblogs.com/lijuntao/p/6439596.html

    //获取get参数
    function getParameter(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }

    //获取自身地址
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
            alert("浏览器不支持地理定位。");
        }
    }

    //显示定位错误的提示
    function showError(error) {
        switch (error.code) {
            case error.PERMISSION_DENIED:
                alert("定位失败,用户拒绝请求地理定位");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("定位失败,位置信息是不可用");
                break;
            case error.TIMEOUT:
                alert("定位失败,请求获取用户位置超时");
                break;
            case error.UNKNOWN_ERROR:
                alert("定位失败,定位系统失效");
                break;
        }
    }

    //获取经纬度
    function showPosition(position) {
        var lat = position.coords.latitude; //纬度
        var lng = position.coords.longitude; //经度
        $('#p1').append('纬度:' + lat + '经度:' + lng);
        showLocationWithAMap(lng, lat);
    }

    //显示自己所在地图中的位置
    function showLocationWithAMap(lng, lat) {//
        map = new AMap.Map('amap1', {
            resizeEnable: true,
            zoom: 15,
            center: [lng, lat],
            // center: [119.275003, 26.076465],//默认地址
        });
        AMap.plugin(['AMap.ToolBar', 'AMap.Scale'/*, 'AMap.OverView'*/],
            function () {
                map.addControl(new AMap.ToolBar());
                map.addControl(new AMap.Scale());
                // map.addControl(new AMap.OverView({isOpen: false}));
            });
        var marker = new AMap.Marker({
            position: [lng, lat],//marker所在的位置
            // position: [119.275133, 26.076465],//默认地址
            map: map//创建时直接赋予map属性
        });
        marker.setMap(map);

    }

    $('#btn1').click(function () {
        searchAddress2LagLat($('#ip1').val());
    });

    function searchAddress2LagLat(address) {//将地址转化成坐标
        AMap.service('AMap.Geocoder', function () {//回调函数
            //实例化Geocoder
            geocoder = new AMap.Geocoder({
                city: "福州"//城市，默认：“全国”
            });
            //地理编码
            geocoder.getLocation(address, function (status, result) {
                if (status === 'complete' && result.info === 'OK') {
                    var lng = result.geocodes[0].location.lng;
                    var lat = result.geocodes[0].location.lat;
                    // console.log('lat=' + lat + '-lng=' + lng);
                    showTatgetAddressWithAMap(lat, lng);//将客户地址显示在地图中
                    $('#p2').append(address + '-纬度:' + lat + '经度:' + lng + "<br>");
                } else {
                    alert(result);
                }
            });
            //逆地理编码
            // var lnglatXY = [119.265862, 26.075393];//地图上所标点的坐标
            // geocoder.getAddress(lnglatXY, function (status, result) {
            //     if (status === 'complete' && result.info === 'OK') {
            //         //获得了有效的地址信息:
            //         //即，result.regeocode.formattedAddress
            //         alert(result)
            //         console.log(result);
            //     } else {
            //         alert(result)
            //         //获取地址失败
            //     }
            // });
        })
    }

    //传入地址对应坐标，并显示在地图上
    function showTatgetAddressWithAMap(lat, lng) {

        var marker2 = new AMap.Marker({
            icon: 'ic_customer.png',//24px*24px
            position: [lng, lat],//marker所在的位置
            offset: new AMap.Pixel(-24, -24),//偏移量
            map: map,
        });
        marker2.setMap(map);
    }

}())