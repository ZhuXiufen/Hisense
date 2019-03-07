$(function(){
    //1. 轮播图
    var timer;
    var $carousel=$('.carousel-items');
    var $indicator=$('.indicators-item');
    
    $carousel.first().css('opacity','1')
        .nextAll().css('opacity','0');
    $indicator.addClass('active')
        .nextAll().removeClass('active');

    //1.1 轮播定时循环
    function loop(i=0,next=1){

       timer=setInterval(()=>{
            if(next==7){
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
            
            console.log(i,next);
       },2000); 
    }
    loop();
    //1.2 指示器点击切换
    $indicator.each(function(index,elem){
        $(elem).click(()=>{
            clearInterval(timer);
            timer=null;
            //移除其他active,为当前设置active,
            $indicator.removeClass('active')
                .eq(index).addClass('active');
                //图片
            $carousel.css('opacity','0')
                .eq(index).css('opacity','1');  
            //更新 i
            
            //点击的图片，2s后开启循环，共停留4s
            setTimeout(()=>{
                loop(index,index+1);  
            },2000)
        })
    })
    //1.3 左右箭头
    $('.carousel').hover(function(){
        console.log(123);
        $('.arrow').toggleClass('display-none');
    })
    function slide(j){
        //清除定时器
        

        $carousel.each(function(i,item){
            if($(item).css('opacity')=='1'){
                var next=i+j;
                if(next>6) next=0;
                if(next<0) next=6;
                //获得index 
                $carousel.eq(i).css('opacity','0')
                $carousel.eq(next).css('opacity','1');

                $indicator.eq(i).removeClass('active');
                $indicator.eq(next).addClass('active');
            }
            
        })
    }
    $('.arrow-left').click(function(){
        clearInterval(timer);
        timer=null;
        slide(-1);
    });
    $('.arrow-right').click(function(){
        clearInterval(timer);
        timer=null;
        slide(1);
    });










})