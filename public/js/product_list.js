$(function(){
    //1.点击列表，跳转到详情
    $('.product-list-items').on('click','li',function(){
        window.open('./product_detail.html','_self')
    })

    //2.滚动侧边栏变化
    window.onscroll=function(){
        var scrollTop=document.body.scrollTop || document.documentElement.scrollTop;

        //获得到达侧边栏的高度
        var leftSideTop=$('.search-side').offset().top;
        if(scrollTop>=leftSideTop){
            $('.left').addClass('scroll-fixed')
        }
    //
    // window.onload = function(){
    //     // var obj = $('#newsMenu').contents().find('.news_list_item').outerHeight();
    //     // console.log(obj);
    //     //获取子页面的高度
    //     function refresh(){
    //         var childPageH = $('#ifa-header').contents().find('body').height();
    //         $('#ifa-header').height(childPageH);
    //         console.log(childPageH);
    //     }
    //     refresh();
    //     setInterval(refresh,100)
    // }



    }











})