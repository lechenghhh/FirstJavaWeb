<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>成建监理</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/jquery-weui.min.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/weui.css">
    <style>

        @font-face {
            font-family: "iconfont";
            src: url('iconfont.eot?t=1516255650044'); /* IE9*/
            src: url('iconfont.eot?t=1516255650044#iefix') format('embedded-opentype'), /* IE6-IE8 */ url('data:application/x-font-woff;charset=utf-8;base64,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') format('woff'),
            url('iconfont.ttf?t=1516255650044') format('truetype'), /* chrome, firefox, opera, Safari, Android, iOS 4.2+*/ url('iconfont.svg?t=1516255650044#iconfont') format('svg'); /* iOS 4.1- */
        }

        .iconfont {
            font-family: "iconfont" !important;
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .myicon {
            height: 48px;
            width: 48px;
        }

        .myicon_text {
            color: #999;
        }

        .myicon_text:active {
            color: #619fee;
        }

        /*加载动画*/
        .spinner {
            width: 60px;
            height: 60px;
            background-color: #2366cf;
            margin: 100px auto;
            -webkit-animation: rotateplane 1.2s infinite ease-in-out;
            animation: rotateplane 1.2s infinite ease-in-out;
        }

        @-webkit-keyframes rotateplane {
            0% {
                -webkit-transform: perspective(120px)
            }
            50% {
                -webkit-transform: perspective(120px) rotateY(180deg)
            }
            100% {
                -webkit-transform: perspective(120px) rotateY(180deg) rotateX(180deg)
            }
        }

        @keyframes rotateplane {
            0% {
                transform: perspective(120px) rotateX(0deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
            }
            50% {
                transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
                -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
            }
            100% {
                transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
                -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
            }
        }

        /*weui tabbar*/
        .weui-bar__item--on i {
            color: #619fee;
        }

        body, html {
            width: 100%;
            height: 100%;
        }

        .container {
            width: 100%;
            height: 100%;
            padding-bottom: 54px;
            box-sizing: border-box;
        }

        .container div {
            display: none;
            width: 100%;
            height: 100%;
        }

        .container .active {
            display: block;
        }

        iframe {
            border: none;
            width: 100%;
            height: 100%;
        }

        .weui-tabbar {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
        }

    </style>
</head>
<body>
<div class="spinner"></div>
<div class="container">
    <div class="home active">
        <iframe src="${request.contextPath}/wx/wmss"></iframe>
    </div>
    <div class="msg">
        <iframe src="${request.contextPath}/wx/xwzx"></iframe>
    </div>
    <div class="me">
        <iframe src="${request.contextPath}/wx/zxns"></iframe>
    </div>
</div>

<div class="weui-tabbar">
    <a href="javascript:;" class="weui-tabbar__item weui-bar__item--on">
        <!-- <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span> -->
        <div class="weui-tabbar__icon">
            <img src="${request.contextPath}/img/wx/ic_wmss.png" class="myicon" id="ic0">
        <#--<i class="iconfont icon-home"></i>-->
        </div>
        <p class="weui-tabbar__label myicon_text" id="text0">我们是谁</p>
    </a>
    <a href="javascript:;" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="${request.contextPath}/img/wx/ic_xwzx.png" class="myicon" id="ic1">
        </div>
        <p class="weui-tabbar__label myicon_text" id="text1">新闻中心</p>
    </a>
    <a href="javascript:;" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="${request.contextPath}/img/wx/ic_zxns.png" class="myicon" id="ic2">
        </div>
        <p class="weui-tabbar__label myicon_text" id="text2">招贤纳士</p>
    </a>
</div>

<script type="text/javascript" src="${request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/weui.min.js"></script>
<script>
    (function () {
        $('.spinner').hide(1000)

        var projectPath = "";//项目路径 var projectPath = "";
        $('#text0').css("color", "#619fee");
        $('#ic0').attr('src', projectPath + "/img/wx/ic_wmss_p.png");

        var currentIndex = 0;
        viewDidLoad(${p});
        setTabbarChange(${p});

        $('.weui-tabbar .weui-tabbar__item').on('click', function (event) {
            event.preventDefault();
            if (currentIndex != $(this).index()) {
                currentIndex = $(this).index();
                console.log('currentIndex=' + currentIndex)
                $('.weui-bar__item--on').removeClass('weui-bar__item--on');
                $('.weui-tabbar .weui-tabbar__item').eq($(this).index()).addClass('weui-bar__item--on');
                $('.container div').removeClass('active');
                $('.container div').eq(currentIndex).addClass('active');

                setTabbarChange(currentIndex);

            }
        });

        //选择哪一个bar图标点亮
        function setTabbarChange(currentIndex) {
            viewDidLoad(currentIndex)
            for (var i = 0; i < 3; i++) {
                $('#text' + i).css("color", "#999");
            }
            $('#text' + currentIndex).css("color", "#619fee");
            switch (currentIndex) {
                case 0:
                    $('#ic' + currentIndex).attr('src', projectPath + "/img/wx/ic_wmss_p.png");
                    $('#ic1').attr('src', projectPath + "/img/wx/ic_xwzx.png");
                    $('#ic2').attr('src', projectPath + "/img/wx/ic_zxns.png");
                    break;
                case 1:
                    $('#ic0').attr('src', projectPath + "/img/wx/ic_wmss.png");
                    $('#ic' + currentIndex).attr('src', projectPath + "/img/wx/ic_xwzx_p.png");
                    $('#ic2').attr('src', projectPath + "/img/wx/ic_zxns.png");
                    break;
                case 2:
                    $('#ic0').attr('src', projectPath + "/img/wx/ic_wmss.png");
                    $('#ic1').attr('src', projectPath + "/img/wx/ic_xwzx.png");
                    $('#ic' + currentIndex).attr('src', projectPath + "/img/wx/ic_zxns_p.png");
                    break;
            }
        }

        //选择容器展示哪一个页面
        function viewDidLoad(position) {
            $('.home iframe').attr('src', retSrcByRole(position));
        }

        function retSrcByRole(role) {
            console.log('role=' + role)
            switch (role) {
                case 0:
                    return '/wx/wmss';
                case 1:
                    return '/wx/xwzx';
                case 2:
                    return '/wx/zxns';
                case 3:
                    return '';
            }
        }
    }())
</script>

</body>
</html>