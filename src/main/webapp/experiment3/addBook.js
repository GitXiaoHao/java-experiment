$(function () {
    new Vue({
        el: '#app',
        data() {
            return {
                //类别
                name: '',
                //类别选项
                options: [{
                    bId: '选项1',
                    name: '黄金糕'
                }],
                delivery: false,
                book: {
                    //图书名
                    name: '',
                    //价格
                    price: '',
                    //类别
                    category: '',
                    //作者
                    author: '',
                    //库存
                    stock: 0,
                    //图片
                    lImage: '',
                    //介绍
                    introduce: '',
                    remarks: '',
                },
                rules: {
                    name: [
                        {required: true, message: '请输入图书名称', trigger: 'blur'},
                        {min: 1, max: 32, message: '长度在 1 到 32 个字符', trigger: 'blur'}
                    ],
                    price: [
                        {type: 'number', message: '必须为数字值'}
                    ],
                    stock: [
                        { required: true, message: '请输入库存', trigger: 'blur'}
                    ],
                    author: [
                        { required: true, message: '请输入作者', trigger: 'blur'}
                    ],
                    lImage: [
                        {required: true, message: '请选择图片', trigger: 'blur'}
                    ],
                    introduce: [
                        {required: true, message: '请输入图书介绍', trigger: 'blur'}
                    ],
                    remarks: [
                        {required: false, message: '请输入图书介绍', trigger: 'blur'}
                    ],
                }
            };
        },
        watch: {
            name(val){
                this.book.category = val
            }
        },
        created() {
            this.options = JSON.parse(localStorage.getItem('options'))
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        let _this = this
                        console.log(_this.book)
                        axios({
                            method: 'post',
                            url: '../library/addBook',
                            data: _this.book
                        }).then(function (response) {
                            const data = response.data;
                            if (data.code) {
                                _this.book = {
                                    //图书名
                                    name: '',
                                    //价格
                                    price: '',
                                    //类别
                                    category: '',
                                    stock: 1,
                                    //作者
                                    author: '',
                                    //图片
                                    lImage: '',
                                    //介绍
                                    introduce: '',
                                    remarks: '',
                                }
                                Vue.prototype.$message({
                                    message: '添加成功',
                                    type: 'success'
                                });
                            } else {
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
            //改变库存数量
            handleChange(value) {
                console.log(value);
            },
            goBack() {
                window.history.back();  //返回上一页
            },
            //上传完成之后
            handleAvatarSuccess(response, file, fileList) {
                this.book.lImage = `/common/download?name=${response.data}`
            },
            beforeUpload(file) {
                if (file) {
                    const suffix = file.name.split('.')[1]
                    const size = file.size / 1024 / 1024 < 2
                    if (['png', 'jpeg', 'jpg'].indexOf(suffix) < 0) {
                        Vue.prototype.$message.error('上传图片只支持 png、jpeg、jpg 格式！')
                        this.$refs.upload.clearFiles()
                        return false
                    }
                    if (!size) {
                        Vue.prototype.$message.error('上传文件大小不能超过 2MB!')
                        return false
                    }
                    return file
                }
            },

        }
    })
})