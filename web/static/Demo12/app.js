/**
 * Created by Cheng on 2016/7/23.
 */
var jkcommon = {
    init: function () {
        this.lessImgShow();


    },
    stopEventBubble: function (event) {
        var e = event;
        if (e) {
            e.stopPropagation();
        }
    },
    lessImgShow: function () {
        $('.lessonimgbox').bind("mouseover", function (e) {
            var _pop = $(this).find('.imgpop');
            $(this).css({border: "2px solid #1avc9c", width: "226px", height: "226px"});
            TweenMax.to(_pop, 0.5, {top: 0, ease: Bounce.easeOut});
            jkcommon.stopEventBubble(e);
        });

        $(document).bind("mouseover", function () {
            $('.lessonimgbox').css({border: "0", width: "230px", height: "230px"});
            var _pop = $(this).find(".imgpop");
            TweenMax.to(_pop, 0.5, {top: 230, ease: Linear.easeNone});
            // TweenMax.to(_pop, 0.5, {top: 230, ease: Linear.easeNone});  //来自iwen
        })
    }
}
$(function () {
    jkcommon.init();
})