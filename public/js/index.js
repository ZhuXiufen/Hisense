$(function(){
    //1. 轮播图
    var timer;
    var $carousel=$('.carousel-items');
    var $indicator=$('.indicators-item');
        //从第一张图开始循环
    $carousel.first().css('opacity','1')
        .nextAll().css('opacity','0');
    $indicator.addClass('active')
        .nextAll().removeClass('active');

    //1.1 轮播定时循环
    function loop(i=0,next=1){

       timer=setInterval(()=>{
            if(next>$carousel.length){
                next=0;
            }
           //先设置自己的透明度为0，当前对应的指示器移除active 
           $carousel.eq(i).css('opacity','0');
           $indicator.eq(i).removeClass('active');
           //再为下一张图片设置透明度为
           $carousel.eq(next).css('opacity','1');
           $indicator.eq(next).addClass('active');

            i=next;
            next++;
            
       },2000); 
    }
    loop();
    //1.2 指示器点击切换
    $('.indicators').on('click','li',function(){
            clearInterval(timer);
            timer=null;
            var i=$(this).index();
            //移除其他active,为当前设置active,
            $(this).addClass('active')
                .siblings().removeClass('active')
                //图片
            $carousel.css('opacity','0')
                .eq(i).css('opacity','1');  
            //更新 i
            
            //点击的图片，
            loop(i,i+1);  
            
        
    })
    //1.3 左右箭头
    $('.carousel').hover(function(){
        $('.arrow').toggleClass('display-none');
    })
    function slide(j){

        //清除定时器
        clearInterval(timer);
        timer=null;
        //获得当前正在播放的图片
        var i=$(".indicators-list>li.active").index();

        if($(this).hasClass('arrow-left')) j=-1;
        if($(this).hasClass('arrow-right')) j=1;

        var next=i+j;
        if(next>$carousel.length) next=0;
        if(next<0) next=6;
        //获得index 
        $carousel.eq(i).css('opacity','0')
        $carousel.eq(next).css('opacity','1');

        $indicator.eq(i).removeClass('active');
        $indicator.eq(next).addClass('active');

        loop(i,next);
    }
    $('.arrow').on('click','a',slide);

    //2.楼层九的动态效果
    $('.f9 .product-item').hover(function(){
        
        /* .item-img:hover{
            transform: scale(1.05);
        } */
        /* .product .product-content:hover{
            transform: translateY(-30px)
        } */
        $(this).find('.item-img').toggleClass('img-trans');
        $(this).find('.product-content').toggleClass('content-trans');
        // $(this).find('.product-desc').toggleClass('opacity-1');

    });

    //3.视频鼠标滑入静音播放
    $('video.item-video').hover(
        function(){
            this.play();
            //3.1.1 鼠标移入后，视频静音播放，图标变蓝
            $(this).attr('muted','true')
                .next().attr('src','../img/videoplay-after.png');
        },
        function(){
            //3.1.2 鼠标移出
            this.pause();
            $(this).next().attr('src','../img/videoplay-before.png'); 
        }       
    )
    //4.鼠标点击播放视频
    $('.product>.product-item').on('click',function(){
        // 获得当前视频的地址，添加到全屏播放处
        var src=$(this).find('video').attr('src');
        $('.play-top').removeClass('display-none')
            .find('video').attr({src});
    })

    //5.点击小叉子关掉视频
    $('.play-top a').on('click',function(){
        $('.play-top').addClass('display-none');
        document.querySelector('.play-top video').pause();
    })
    //6.服务更换图片
    $('.service img').hover(imgChange);

    function imgChange(){
        var next;
        //获取图片的src
        var src=$(this).attr('src');
        //看是否是before
        if(src.indexOf('before')!=-1)
            next='-after.';
        else
            next='-before.';
        var newSrc=src.replace(/-[a-z]*./,next);

        $(this).attr('src',newSrc);
    }

    //7.右侧手机商城二维码
    $('.enter-item').eq(2).hover(function(){
        $(this).find('.item-hidden').toggleClass('display-none');
    })









})