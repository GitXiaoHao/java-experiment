

new Vue({
    el: "#app",
    data() {
        let checkAge = (rule, value, callback) => {
            if (!value) {
                return callback(new Error('年龄不能为空'));
            }
            setTimeout(() => {
                if (!Number.isInteger(value)) {
                    callback(new Error('请输入数字值'));
                } else {
                    if (value < 18) {
                        callback(new Error('必须年满18岁'));
                    } else {
                        callback();
                    }
                }
            }, 1000);
        };
        let validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入密码'));
            } else {
                callback();
            }
        };
        let validateUsername = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入用户名!'));
            } else {
                callback();
            }
        };
        let validateName = (rule, value, callback) => {
            let regName =/^[\u4e00-\u9fa5]{2,5}$/;
            if (value === '') {
                callback(new Error('请输入姓名!'));
            } else if(!regName.test(value)){
                callback(new Error("请输入正确的姓名!"));
            }else{
                callback();
            }
        };
        let validateTel = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入手机号!'));
            } else if (!/^1[34578]\d{9}$/.test(value)) {
                callback(new Error('请输入正确的手机号!'));
            } else {
                callback();
            }
        };
        let validateEmail = (rule, value, callback) => {
            let verify = /^ [a-zA-Z0-9_-]+@ [a-zA-Z0-9_-]+ (. [a-zA-Z0-9_-]+)+$/;
            if (value === '') {
                callback(new Error('请输入邮箱!'));
            } else if (verify.test(value)) {
                callback(new Error('邮箱格式有误!'));
            } else {
                this.verificationStatus = 1;
                callback();
            }
        };
        let validateSchool = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入学校!'));
            } else {
                callback();
            }
        };
        let validateFaculty = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入院系!'));
            } else {
                callback();
            }
        };
        let validateCode = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入验证码!'));
            } else {
                callback();
            }
        }
        return {
            //定时器
            verificationTimer: null,
            //保存验证码
            verificationCode: "",
            //判断是否点击了发送验证码
            verificationStatus: 0,
            registerForm: {
                username: '',
                name: '',
                tel: '',
                email: '',
                // school:'',
                // faculty:'',
                password: '',
                age: '',
                code: '',
            },
            loginForm: {
                username: '',
                password: '',
            },
            loginRules: {
                username: [
                    {validator: validateUsername, trigger: 'blur'}
                ],
                password: [
                    {validator: validatePass, trigger: 'blur'}
                ],
            },
            rules: {
                username: [
                    {validator: validateUsername, trigger: 'blur'}
                ],
                name: [
                    {validator: validateName, trigger: 'blur'}
                ],
                tel: [
                    {validator: validateTel, trigger: 'blur'}
                ],
                email: [
                    {validator: validateEmail, trigger: 'blur'}
                ],
                school: [
                    {validator: validateSchool, trigger: 'blur'}
                ],
                faculty: [
                    {validator: validateFaculty, trigger: 'blur'}
                ],
                password: [
                    {validator: validatePass, trigger: 'blur'}
                ],
                age: [
                    {validator: checkAge, trigger: 'blur'}
                ],
                code: [
                    {validator: validateCode, trigger: 'blur'}
                ]
            }
        };
    },
    methods: {
        //发送验证码
        verificationForm(formName) {
            //点击进行验证 发送验证码
            // 后端发送验证码
            let _this = this;
            axios({
                method: 'post',
                url: '../user/getCode',
                data: _this.registerForm
            }).then(function (response) {
                const data = response.data;
                if(data.code){
                    _this.verificationCode = data.data;
                    console.log(_this.verificationCode)
                    Vue.prototype.$message({
                        message: '发送成功，请注意查收',
                        type: 'success'
                    });

                }else{
                    Vue.prototype.$message.error(data.msg);
                }
            })
            let num = 60;
            //不可点击
            _this.verificationStatus = 0;
            clearInterval(_this.verificationTimer);
            //设置个定时器
            _this.verificationTimer = setInterval(function () {
                num--;
                if (num) {
                    $('.verification').text(num + " 秒后再重试");
                } else {
                    //如果倒计时结束
                    _this.verificationStatus = 1;
                    clearInterval(_this.verificationTimer);
                    $('.verification').text("点击邮箱进行验证");
                }
            }, 1000);

        },
        async loginSubmitForm(formName) {
            this.$refs[formName].validate(async (valid) => {
                const _this = this;
                if (valid) {
                    //登录
                    await axios({
                        method: "post",
                        url: "../user/login",
                        data: _this.loginForm   //发送到服务器的数据
                    }).then(function (response) {  //请求过去获取响应数据
                        const data = (response.data)
                        if (data.code === 1) {
                            Vue.prototype.$message({
                                message: '欢迎你！' + data.data.username ? data.data.username : '',
                                type: 'success'
                            });
                            //跳转
                            _this.cancel();
                        } else {
                            //没有成功登录
                            Vue.prototype.$message.error(data.msg);
                        }
                    })
                } else {
                    console.log('error submit');
                    return false;
                }
            });
        },
        registerSubmitForm(formName) {
            const _this = this;
            this.$refs[formName].validate(async (valid) => {
                //先判断验证码是否正确
                if ("" === _this.verificationCode) {
                    return Vue.prototype.$message.error("请先激活邮箱，发送验证码");
                } else if (String(_this.verificationCode) !== String(_this.registerForm.code)) {
                    return Vue.prototype.$message.error("验证码错误");
                }
                if (valid) {
                    _this.verificationStatus = 1;
                    //注册
                    await axios({
                        method: "post",
                        url: "../user/register",
                        data: _this.registerForm   //发送到服务器的数据
                    }).then(function (response) {  //请求过去获取响应数据
                        let data = response.data;
                        if (data.code === 1) {
                            Vue.prototype.$message({
                                message: "注册成功",
                                type: 'success'
                            });
                            //跳转注册

                        }else{
                            Vue.prototype.$message.error(data.msg);
                        }
                    })
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        },
        cancel() {
            $(".register").slideUp(500, "swing");
            $(".container").slideDown(500, "swing");
        }
    }
});

function registerGo() {
    $(".register").slideDown(500, "swing");
    $(".container").slideUp(500, "swing");
}

