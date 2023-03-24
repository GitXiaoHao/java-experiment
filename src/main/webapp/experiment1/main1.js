function loginOrRegister() {
    //注册
    // let register = $(window.frames['loginFrame']).find(".register-wrapper");
    let register = parent.document.getElementById("loginFrame").contentWindow.$(".register-wrapper");
    let login = parent.document.getElementById("loginFrame").contentWindow.$(".login-wrapper");
    $(register).slideToggle(500, "swing");
    $(login).slideToggle(500, "swing");
    // $(".register-wrapper").slideToggle(500 , "swing");
    // $(".login-wrapper").slideToggle(500, "swing");
    $(".msg-login").toggle();
    $(".msg-register").toggle();
}

$(function () {
    $(".switch-register").click(loginOrRegister);
    $(".switch-login").click(loginOrRegister);
    $(".left .personalInformation").click(function () {
        //点击链接 隐藏链接
        $(this).hide();
        //个人信息显示
        $(".left .information").show();
    });
});
