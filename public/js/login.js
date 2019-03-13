$(function(){
    //1. 点击切换
    $('.tab-nav').on('click','li',function(){
        // 当前点击添加 active
        $(this).addClass('active')
            .siblings().removeClass('active');
        $('.tab-contents').find('.tab').toggleClass('display-none')
            
    })

    //2. 输入框点击效果
    $('.about-input').on('focus','input',function(){
        $(this).prev().addClass('active')
    })
    $('.about-input').on('blur','input',function(){
        var reg;
        var  val=$(this).val();
        if(!val)
            $(this).prev().removeClass('active');
        if($(this).hasClass('name')){
            reg=/^(1[3-8][\d]{9})$/;
        }else if($(this).hasClass('pwd')){
            reg=/^\d{8}$/;
        }else{
            reg=/^\d{6}$/;
        }
        
        if(!reg.test(val)){
            $(this).next().removeClass('display-none')
        }
    })















})