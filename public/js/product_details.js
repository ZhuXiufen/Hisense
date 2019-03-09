$(function(){
    //1.小图 点击边框变色，并切换到中图视图
    $('.carousel-item').on('click','img',function(){
        //1.1边框变色
        $(this).addClass('active')
            .parent().siblings().children().removeClass('active');
        //2.切换到中图
        //没有中图片
        // var src=$(this).attr('src');
        // $('#img-md').attr({src});
    });
    //2.左右箭头切换照片
    // 总图片个数
    var len=$('.carousel-item').length;
    // 要修改的ul
    var $mvul=$('.carousel-list');
    if(len<5){
        $('.carousel-wrap span').addClass('disabled');
    }
    var moved=0;
    $('.arr-prev').addClass('disabled');
    $('.carousel-wrap').on('click','span:not(".disabled")',function(){
        var i;
        //左边按钮
        if($(this).next().length==1){ 
            moved--;
            //点左边按钮，ul往右移动
            $mvul.css('margin-left',-96*moved);
            //如果ul没有往右移过，即moved=0时，禁止左边按钮
            if(moved==0)
                $(this).addClass('disabled');
        }
        else if($(this).next().length==0){//右边按钮
            //点右边按钮，ul往左移动
            moved++;
            $mvul.css('margin-left',-96*moved);
            //当左移的个数完，只剩下显示的5个时，禁用右边按钮
            if(len-moved==5)
                $(this).addClass('disabled');
            //只要点击了右边按钮一下，左边按钮就处于活动状态，可以被点击
            $(this).prev().removeClass('disabled');
        }
    });
    //3.放大镜
    //进入图片 ，小方块和大图片显示
    $('.super-mask').hover(function(){
        $(this).prev().toggleClass('display-none');
        $(this).next().toggleClass('display-none');
    })
    //为super-mask 绑定鼠标移动事件
    .on('mousemove',function(e){
        var offsetX=e.offsetX;
        var offsetY=e.offsetY;
        var top=offsetY-275/2;
        var left=offsetX-275/2;

        if(top<0) top=0;
        if(top>275) top=275;
        if(left<0) left=0;
        if(left>275) left=275;
        //设置小方块随鼠标移动
        $('.mask').css({top,left});

        //设置放大镜
        var src=$('#img-md').attr('src');
        $('.div-lg').css(
            'background',`#f7f7f7 url(${src}) no-repeat ${-800/550*left}px ${-800/550*top}px`
        )
    })

    //4.图片分享
    $('.share-img').on('click',function(){
        $(this).next().toggleClass('display-none');
    })

    //5.下拉服务
    $('.service-list').on('click','.item-content,.item-arrow',function(){
        $('.service-box').toggleClass('display-none');
    })

    //详情评论切换
    $('.tab-navs').on('click','li',function(){
        var i=$(this).index();
        $(this).addClass('active')
            .siblings().removeClass('active');
        $('.tab-sel').eq(i).removeClass('display-none')
            .siblings().addClass('display-none');
    })
















})