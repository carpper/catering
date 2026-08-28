<template>
	<div>

		<div class="container">
			<el-form class='rgs-form animate__animated animate__bounce' v-if="pageFlag=='register'" ref="registerForm" :model="registerForm" :rules="rules">
				<div class="rgs-form2">
					<div class="title">餐饮人员招聘系统注册</p></div>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="qiuzhizhanghao">
						<div class="label" :class="changeRules('qiuzhizhanghao')?'required':''">求职账号：</div>
						<el-input v-model="registerForm.qiuzhizhanghao"  placeholder="请输入求职账号" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="mima">
						<div class="label" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input v-model="registerForm.mima" type="password" placeholder="请输入密码" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="mima2">
						<div class="label" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input v-model="registerForm.mima2" type="password" placeholder="请再次输入密码" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="qiuzhixingming">
						<div class="label" :class="changeRules('qiuzhixingming')?'required':''">求职姓名：</div>
						<el-input v-model="registerForm.qiuzhixingming"  placeholder="请输入求职姓名" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="xingbie">
						<div class="label" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select v-model="registerForm.xingbie" placeholder="请选择性别" >
							<el-option
								v-for="(item,index) in qiuzhizhexingbieOptions"
								:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="lianxidianhua">
						<div class="label" :class="changeRules('lianxidianhua')?'required':''">联系电话：</div>
						<el-input v-model="registerForm.lianxidianhua"  placeholder="请输入联系电话" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'" prop="touxiang">
						<div class="label" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="1"
							:multiple="true"
							:fileUrls="registerForm.touxiang?registerForm.touxiang:''"
							@change="qiuzhizhetouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="qiyemingcheng">
						<div class="label" :class="changeRules('qiyemingcheng')?'required':''">企业名称：</div>
						<el-input v-model="registerForm.qiyemingcheng"  placeholder="请输入企业名称" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="mima">
						<div class="label" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input v-model="registerForm.mima" type="password" placeholder="请输入密码" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="mima2">
						<div class="label" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input v-model="registerForm.mima2" type="password" placeholder="请再次输入密码" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="fuzeren">
						<div class="label" :class="changeRules('fuzeren')?'required':''">负责人：</div>
						<el-input v-model="registerForm.fuzeren"  placeholder="请输入负责人" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="lianxidianhua">
						<div class="label" :class="changeRules('lianxidianhua')?'required':''">联系电话：</div>
						<el-input v-model="registerForm.lianxidianhua"  placeholder="请输入联系电话" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="qiyedizhi">
						<div class="label" :class="changeRules('qiyedizhi')?'required':''">企业地址：</div>
						<el-input v-model="registerForm.qiyedizhi"  placeholder="请输入企业地址" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="zhuyingfanwei">
						<div class="label" :class="changeRules('zhuyingfanwei')?'required':''">主营范围：</div>
						<el-input v-model="registerForm.zhuyingfanwei"  placeholder="请输入主营范围" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="qiyezizhi">
						<div class="label" :class="changeRules('qiyezizhi')?'required':''">企业资质：</div>
						<file-upload
							tip="点击上传企业资质"
							action="file/upload"
							:limit="1"
							:type="3"
							:multiple="true"
							:fileUrls="registerForm.qiyezizhi?registerForm.qiyezizhi:''"
							@change="qiyeqiyezizhiUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'" prop="qiyetupian">
						<div class="label" :class="changeRules('qiyetupian')?'required':''">企业图片：</div>
						<file-upload
							tip="点击上传企业图片"
							action="file/upload"
							:limit="1"
							:multiple="true"
							:fileUrls="registerForm.qiyetupian?registerForm.qiyetupian:''"
							@change="qiyeqiyetupianUploadChange"
						></file-upload>
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<el-button class="register_btn" type="primary" @click="submitForm('registerForm')">注册</el-button>
						</div>
						<div class="register-btn2">
							<router-link class="has_btn" to="/login">已有账号，直接登录</router-link>
						</div>
					</div>
				</div>
				<div class="idea1"></div>
				<div class="idea2"></div>
			</el-form>
		</div>
	</div>
</div>
</template>

<script>
	import 'animate.css';

export default {
    //数据集合
    data() {
		return {
            pageFlag : '',
			tableName: '',
			registerForm: {},
			forgetForm: {},
			rules: {},
			requiredRules: {},
            qiuzhizhexingbieOptions: [],
		}
    },
	mounted() {
		if(this.$route.query.pageFlag=='register'){
			this.tableName = this.$route.query.role;
			if(this.tableName=='qiuzhizhe'){
				this.registerForm = {
					qiuzhizhanghao: '',
					mima: '',
					mima2: '',
					qiuzhixingming: '',
					xingbie: '',
					lianxidianhua: '',
					touxiang: '',
				}
			}
			if(this.tableName=='qiye'){
				this.registerForm = {
					qiyemingcheng: '',
					mima: '',
					mima2: '',
					fuzeren: '',
					lianxidianhua: '',
					qiyedizhi: '',
					zhuyingfanwei: '',
					qiyezizhi: '',
					qiyetupian: '',
					sfsh: '',
					shhf: '',
				}
			}
			if ('qiuzhizhe' == this.tableName) {
				this.rules.qiuzhizhanghao = [{ required: true, message: '请输入求职账号', trigger: 'blur' }];
				this.requiredRules.qiuzhizhanghao = [{ required: true, message: '请输入求职账号', trigger: 'blur' }]
			}
			if ('qiuzhizhe' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }];
				this.requiredRules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('qiuzhizhe' == this.tableName) {
				this.rules.qiuzhixingming = [{ required: true, message: '请输入求职姓名', trigger: 'blur' }];
				this.requiredRules.qiuzhixingming = [{ required: true, message: '请输入求职姓名', trigger: 'blur' }]
			}
			this.qiuzhizhexingbieOptions = "男,女".split(',');
			if ('qiuzhizhe' == this.tableName) {
				this.rules.lianxidianhua = [{ required: true, validator: this.$validate.isMobile, trigger: 'blur' }];
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyemingcheng = [{ required: true, message: '请输入企业名称', trigger: 'blur' }];
				this.requiredRules.qiyemingcheng = [{ required: true, message: '请输入企业名称', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }];
				this.requiredRules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.fuzeren = [{ required: true, message: '请输入负责人', trigger: 'blur' }];
				this.requiredRules.fuzeren = [{ required: true, message: '请输入负责人', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.lianxidianhua = [{ required: true, validator: this.$validate.isMobileNotNull, trigger: 'blur' }];
				this.requiredRules.lianxidianhua = [{ required: true, message: '请输入联系电话', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyedizhi = [{ required: true, message: '请输入企业地址', trigger: 'blur' }];
				this.requiredRules.qiyedizhi = [{ required: true, message: '请输入企业地址', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.zhuyingfanwei = [{ required: true, message: '请输入主营范围', trigger: 'blur' }];
				this.requiredRules.zhuyingfanwei = [{ required: true, message: '请输入主营范围', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyezizhi = [{ required: true, message: '请输入企业资质', trigger: 'blur' }];
				this.requiredRules.qiyezizhi = [{ required: true, message: '请输入企业资质', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyetupian = [{ required: true, message: '请输入企业图片', trigger: 'blur' }];
				this.requiredRules.qiyetupian = [{ required: true, message: '请输入企业图片', trigger: 'blur' }]
			}
		}
	},
    created() {
		this.pageFlag = this.$route.query.pageFlag;
    },
    //方法集合
    methods: {
		changeRules(name){
			if(this.requiredRules[name]){
				return true
			}
			return false
		},
		// 获取uuid
		getUUID () {
			return new Date().getTime();
		},
        // 下二随
		qiuzhizhetouxiangUploadChange(fileUrls) {
			this.registerForm.touxiang = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
		},
		qiyeqiyezizhiUploadChange(fileUrls) {
			this.registerForm.qiyezizhi = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
		},
		qiyeqiyetupianUploadChange(fileUrls) {
			this.registerForm.qiyetupian = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
		},

		// 多级联动参数


		submitForm(formName) {
			this.$refs[formName].validate((valid) => {
				if (valid) {
					var url=this.tableName+"/register";
					if(`qiuzhizhe` == this.tableName && this.registerForm.mima!=this.registerForm.mima2) {
						this.$message.error(`两次密码输入不一致`);
						return
					}
					if(this.tableName=='qiye'){
						this.registerForm.sfsh = '待审核'
					}
					if(`qiye` == this.tableName && this.registerForm.mima!=this.registerForm.mima2) {
						this.$message.error(`两次密码输入不一致`);
						return
					}
					this.$http.post(url, this.registerForm).then(res => {
						if (res.data.code === 0) {
							this.$message({
								message: '注册成功',
								type: 'success',
								duration: 1500,
								onClose: () => {
									this.$router.push('/login');
								}
							});
						} else {
							this.$message.error(res.data.msg);
						}
					});
				} else {
					return false;
				}
			});
		},
		resetForm(formName) {
			this.$refs[formName].resetFields();
		}
    }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.container {
		background: url(http://codegen.caihongy.cn/20241119/d29fe23c4aa1479b93d17a78d1488b7f.jpg) no-repeat center / cover;
		display: flex;
		width: 100%;
		min-height: 100vh;
		justify-content: center;
		align-items: center;
		position: relative;
		background: url(http://codegen.caihongy.cn/20241119/d29fe23c4aa1479b93d17a78d1488b7f.jpg) no-repeat center / cover;
		.rgs-form {
			border-radius: 30px;
			padding: 4px;
			box-shadow: none;
			backdrop-filter: blur(5px);
			margin: 20px 0;
			z-index: 1;
			background: url(http://codegen.caihongy.cn/20241118/8f7a9988fb5e4c368c2f4469a80f6f99.webp) no-repeat center / 100% 100%;
			width: 710px;
			height: auto;
			.rgs-form2 {
				width: 100%;
				.title {
					border-radius: 30px 30px 0 0;
					margin: 0 0 40px 0;
					text-shadow: none;
					color: #FFF;
					background: #896785;
					font-weight: 700;
					width: 100%;
					font-size: 20px;
					line-height: 100px;
					text-align: center;
				}
				.subtitle {
					margin: 0 0 10px 0;
					text-shadow: 4px 4px 2px rgba(64, 158, 255, .5);
					color: rgba(64, 158, 255, 1);
					width: 100%;
					font-size: 20px;
					line-height: 44px;
					text-align: center;
				}
				.list-item {
					border-radius: 30px;
					padding: 0 0px;
					box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3);
					margin: 0 auto 30px auto;
					background: #FFFFFF;
					display: flex;
					width: 520px;
					::v-deep .el-form-item__content {
						padding: 0 0 0 120px;
						display: block;
						width: calc(100% - 0px);
						.label {
							padding: 0 5px 0 0;
							z-index: 9;
							color: #333;
							left: 0;
							width: 120px;
							font-size: 16px;
							line-height: 60px;
							position: absolute !important;
							text-align: right;
						}
						
						.required {
							position: relative;
						}
						.required::after{
							margin: 0 10px 0 0;
							color: red;
							left: 110px;
							position: inherit;
							content: "*";
						}
						.el-input {
							flex: 1 1 auto;
							width: 100%;
						}
						.el-input .el-input__inner {
							border: none;
							border-radius: 30px;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-input .el-input__inner:focus {
							border: none;
							border-radius: 30px;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-input-number {
							flex: 1 1 auto;
							width: 100%;
						}
						.el-input-number ::v-deep  .el-input__inner {
							text-align: left;
							border: none;
							border-radius: 30px;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-input-number ::v-deep  .el-input-number__decrease {
							display: none;
						}
						.el-input-number ::v-deep  .el-input-number__increase {
							display: none;
						}
						.el-select {
							width: 100%;
						}
						.el-select .el-input__inner {
							border: none;
							border-radius: 30px;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-select .el-input__inner:focus {
							border: none;
							border-radius: 30px;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-date-editor {
							width: 100%;
						}
						.el-date-editor .el-input__inner {
							border: none;
							border-radius: 30px;
							padding: 0 40px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-date-editor .el-input__inner:focus {
							border: none;
							border-radius: 30px;
							padding: 0 40px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-upload--picture-card {
							background: transparent;
							border: 0;
							border-radius: 0;
							width: auto;
							height: auto;
							line-height: initial;
							vertical-align: middle;
						}
						.upload .upload-img {
							border: 1px solid #ddd;
							cursor: pointer;
							border-radius: 8px;
							margin: 10px 0 0;
							color: #999;
							width: 80px;
							font-size: 26px;
							line-height: 60px;
							text-align: center;
							height: 60px;
						}
						.el-upload-list .el-upload-list__item {
							border: 1px solid #ddd;
							cursor: pointer;
							border-radius: 8px;
							margin: 10px 0 0;
							color: #999;
							width: 80px;
							font-size: 26px;
							line-height: 60px;
							text-align: center;
							height: 60px;
							font-size: 14px;
							line-height: 1.8;
						}
						.el-upload .el-icon-plus {
							border: 1px solid #ddd;
							cursor: pointer;
							border-radius: 8px;
							margin: 10px 0 0;
							color: #999;
							width: 80px;
							font-size: 26px;
							line-height: 60px;
							text-align: center;
							height: 60px;
						}
						.el-upload__tip {
							margin: 0;
							color: #838fa1;
							font-size: 14px;
						}
						.emailInput {
							border: none;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.emailInput:focus {
							border: none;
							padding: 0 10px;
							outline: none;
							color: #000;
							width: 100%;
							font-size: 14px;
							height: 60px;
						}
						.el-btn {
							border: 0;
							cursor: pointer;
							padding: 0;
							margin: 0;
							color: #fff;
							font-size: 14px;
							float: right;
							border-radius: 30px;
							box-shadow: none;
							outline: none;
							background: #896785;
							width: 140px;
							position: relative;
							height: 60px;
						}
						.el-btn:hover {
							opacity: 0.8;
						}
						
						.el-input__inner::placeholder {
							color: #9E9E9E;
							font-size: 14px;
						}
						input::placeholder {
							color: #9E9E9E;
							font-size: 14px;
						}
						.editor {
							padding: 15px;
							width: 100%;
							height: auto;
						}
					}
				}
				.register-btn {
					padding:  0 0 20px 0;
					margin: 0 auto;
					flex-direction: column;
					display: flex;
					width: 520px;
				}
				.register-btn1 {
					width: 100%;
				}
				.register-btn2 {
					margin: 0 0 20px 0;
					width: 100%;
					text-align: center;
					order: -1;
				}
				.register_btn {
					border: 0;
					cursor: pointer;
					border-radius: 30px;
					padding: 0 24px;
					margin: 0 5px;
					outline: none;
					color: #fff;
					background: #896785;
					font-weight: 700;
					width: 100%;
					font-size: 24px;
					height: 60px;
				}
				.register_btn:hover {
					opacity: 0.8;
				}
				.has_btn {
					cursor: pointer;
					padding: 0 20px;
					color: #000000;
					display: inline-block;
					text-decoration: none;
					font-size: 14px;
					line-height: 1;
				}
				.has_btn:hover {
					opacity: 0.5;
				}
			}
			.idea1 {
				background: red;
				display: none;
				width: 100%;
				height: 40px;
			}
			.idea2 {
				background: blue;
				display: none;
				width: 100%;
				height: 40px;
			}
		}
	}
	
	::-webkit-scrollbar {
		display: none;
	}
</style>
