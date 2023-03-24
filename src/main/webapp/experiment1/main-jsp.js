function loginOrRegister() {
    //注册
    $(".register-wrapper").slideToggle(500 , "swing");
    $(".login-wrapper").slideToggle(500, "swing");
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
    new Vue({
        el: '#app',
        data(){
            return{
                loginForm:{
                    //用户名
                    loginUsername: '',
                    //密码
                    loginPassword: ''
                },
                registerForm:{
                    //用户名
                    registerUsername:'',
                    //密码
                    registerPassword:'',
                    //性别 男1 女0
                    sex: 1,
                    //爱好
                    hobby:{

                    }
                }
            }
        }
    });
});