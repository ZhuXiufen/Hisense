$(function(){
    //1. 轮播图
    var i=0,timer;
    var $carousel=$('.carousel-items');
    var $indicator=$('.indicators-item');

    $carousel.first().css('opacity','1')
        .nextAll().css('opacity','0');
    $indicator.addClass('active')
        .nextAll().removeClass('active');

    // 轮播定时循环
    function loop(i,next){

       timer=setInterval(()=>{
           //先设置自己的透明度为0，当前对应的指示器移除active 
           $carousel.eq(i).css('opacity','0');
           $indicator.eq(i).removeClass('active');
           //再为下一张图片设置透明度为
           $carousel.eq(next).css('opacity','1');
           $indicator.eq(next).addClass('active');

            i=next;
            next++;
            if(next==7){
                next=0;
            }
            console.log(i,next);
       },3000); 
    }
    loop(i,i+1);

    $indicator.each(function(index,elem){
        $(elem).click(()=>{
            clearInterval(timer);
            timer=null;
            
            i=index;
            loop(i,i+1);

            console.log(i,index);

            //为当前设置active,移除其他active
            // $indicator.removeClass('active')
            //     .eq(index).addClass('active');
            // $carousel.css('opacity','0')
            //     .eq(index).css('opacity','1');
            //     console.log(index);


        })
        
    })
    console.log(timer);









})