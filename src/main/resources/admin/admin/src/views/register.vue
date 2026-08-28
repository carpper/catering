<template>
	<div>
		<div class="register-container">
			<el-form v-if="pageFlag=='register'" ref="ruleForm" class="rgs-form animate__animated animate__backInDown" :model="ruleForm" :rules="rules">
				<div class="rgs-form2">
					<div class="title">餐饮人员招聘系统</div>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('qiuzhizhanghao')?'required':''">求职账号：</div>
						<el-input  v-model="ruleForm.qiuzhizhanghao"  autocomplete="off" placeholder="求职账号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima"  autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('qiuzhixingming')?'required':''">求职姓名：</div>
						<el-input  v-model="ruleForm.qiuzhixingming"  autocomplete="off" placeholder="求职姓名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select v-model="ruleForm.xingbie" placeholder="请选择性别" >
							<el-option
								v-for="(item,index) in qiuzhizhexingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('lianxidianhua')?'required':''">联系电话：</div>
						<el-input  v-model="ruleForm.lianxidianhua"  autocomplete="off" placeholder="联系电话"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiuzhizhe'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="qiuzhizhetouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('qiyemingcheng')?'required':''">企业名称：</div>
						<el-input  v-model="ruleForm.qiyemingcheng"  autocomplete="off" placeholder="企业名称"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima"  autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('fuzeren')?'required':''">负责人：</div>
						<el-input  v-model="ruleForm.fuzeren"  autocomplete="off" placeholder="负责人"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('lianxidianhua')?'required':''">联系电话：</div>
						<el-input  v-model="ruleForm.lianxidianhua"  autocomplete="off" placeholder="联系电话"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('qiyedizhi')?'required':''">企业地址：</div>
						<el-input  v-model="ruleForm.qiyedizhi"  autocomplete="off" placeholder="企业地址"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('zhuyingfanwei')?'required':''">主营范围：</div>
						<el-input  v-model="ruleForm.zhuyingfanwei"  autocomplete="off" placeholder="主营范围"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('qiyezizhi')?'required':''">企业资质：</div>
						<file-upload
							tip="点击上传企业资质"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.qiyezizhi?ruleForm.qiyezizhi:''"
							@change="qiyeqiyezizhiUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='qiye'">
						<div class="lable" :class="changeRules('qiyetupian')?'required':''">企业图片：</div>
						<file-upload
							tip="点击上传企业图片"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.qiyetupian?ruleForm.qiyetupian:''"
							@change="qiyeqiyetupianUploadChange"
						></file-upload>
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="login()">注册</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">已有账号，直接登录</div>
						</div>
					</div>
				</div>
				<div class="idea-box1"></div>
				<div class="idea-box2">输入您的账号和密码以注册帐户</div>
			</el-form>
		</div>
	</div>
</template>

<script>
	import 'animate.css'
export default {
	data() {
		return {
			ruleForm: {
			},
			forgetForm: {},
            pageFlag : '',
			tableName:"",
			rules: {},
            qiuzhizhexingbieOptions: [],
		};
	},
	mounted(){
		this.pageFlag = this.$route.query.pageFlag
		if(this.$route.query.pageFlag=='register'){
			
			let table = this.$storage.get("loginTable");
			this.tableName = table;
			if(this.tableName=='qiuzhizhe'){
				this.ruleForm = {
					qiuzhizhanghao: '',
					mima: '',
					qiuzhixingming: '',
					xingbie: '',
					lianxidianhua: '',
					touxiang: '',
				}
			}
			if(this.tableName=='qiye'){
				this.ruleForm = {
					qiyemingcheng: '',
					mima: '',
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
				this.rules.qiuzhizhanghao = [{ required: true, message: '请输入求职账号', trigger: 'blur' }]
			}
			if ('qiuzhizhe' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('qiuzhizhe' == this.tableName) {
				this.rules.qiuzhixingming = [{ required: true, message: '请输入求职姓名', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyemingcheng = [{ required: true, message: '请输入企业名称', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.fuzeren = [{ required: true, message: '请输入负责人', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.lianxidianhua = [{ required: true, message: '请输入联系电话', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyedizhi = [{ required: true, message: '请输入企业地址', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.zhuyingfanwei = [{ required: true, message: '请输入主营范围', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyezizhi = [{ required: true, message: '请输入企业资质', trigger: 'blur' }]
			}
			if ('qiye' == this.tableName) {
				this.rules.qiyetupian = [{ required: true, message: '请输入企业图片', trigger: 'blur' }]
			}
			this.qiuzhizhexingbieOptions = "男,女".split(',')
		}
	},
	created() {
	},
	destroyed() {
		  	},
	methods: {
		changeRules(name){
			if(this.rules[name]){
				return true
			}
			return false
		},
		// 获取uuid
		getUUID () {
			return new Date().getTime();
		},
		close(){
			this.$router.push({ path: "/login" });
		},
        qiuzhizhetouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },
        qiyeqiyezizhiUploadChange(fileUrls) {
            this.ruleForm.qiyezizhi = fileUrls;
        },
        qiyeqiyetupianUploadChange(fileUrls) {
            this.ruleForm.qiyetupian = fileUrls;
        },

        // 多级联动参数


		// 注册
		login() {
			var url=this.tableName+"/register";
			if((!this.ruleForm.qiuzhizhanghao) && `qiuzhizhe` == this.tableName){
				this.$message.error(`求职账号不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `qiuzhizhe` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `qiuzhizhe` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.qiuzhixingming) && `qiuzhizhe` == this.tableName){
				this.$message.error(`求职姓名不能为空`);
				return
			}
			if(`qiuzhizhe` == this.tableName && this.ruleForm.lianxidianhua &&(!this.$validate.isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
			  if(this.tableName=='qiye'){
				  this.ruleForm.sfsh = '待审核'
			  }
			if((!this.ruleForm.qiyemingcheng) && `qiye` == this.tableName){
				this.$message.error(`企业名称不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `qiye` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `qiye` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.fuzeren) && `qiye` == this.tableName){
				this.$message.error(`负责人不能为空`);
				return
			}
			if((!this.ruleForm.lianxidianhua) && `qiye` == this.tableName){
				this.$message.error(`联系电话不能为空`);
				return
			}
			if(`qiye` == this.tableName && this.ruleForm.lianxidianhua &&(!this.$validate.isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}
			if((!this.ruleForm.qiyedizhi) && `qiye` == this.tableName){
				this.$message.error(`企业地址不能为空`);
				return
			}
			if((!this.ruleForm.zhuyingfanwei) && `qiye` == this.tableName){
				this.$message.error(`主营范围不能为空`);
				return
			}
            if(this.ruleForm.qiyezizhi!=null) {
                this.ruleForm.qiyezizhi = this.ruleForm.qiyezizhi.replace(new RegExp(this.$base.url,"g"),"");
            }
			if((!this.ruleForm.qiyezizhi) && `qiye` == this.tableName){
				this.$message.error(`企业资质不能为空`);
				return
			}
            if(this.ruleForm.qiyetupian!=null) {
                this.ruleForm.qiyetupian = this.ruleForm.qiyetupian.replace(new RegExp(this.$base.url,"g"),"");
            }
			if((!this.ruleForm.qiyetupian) && `qiye` == this.tableName){
				this.$message.error(`企业图片不能为空`);
				return
			}
			this.$http({
				url: url,
				method: "post",
				data:this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "注册成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							this.$router.replace({ path: "/login" });
						}
					});
				} else {
					this.$message.error(data.msg);
				}
			});
		}
	}
};
</script>

<style lang="scss" scoped>
.register-container {
	position: relative;
	background: #CCCCCC;
	background-repeat: no-repeat;
	background-size: cover;
	background: #CCCCCC;
	display: block;
	width: 100%;
	min-height: 100vh;
	justify-content: flex-start;
	align-items: center;
	background-position: center center;
	position: relative;
	.rgs-form {
		.rgs-form2 {
		padding: 0 85px;
		margin: auto 0 auto 50%;
		z-index: 2;
		flex-direction: column;
		background: #fff;
		display: flex;
		width: 837px;
		}
		padding: 0;
		margin: 0 56px;
		z-index: 999;
		display: flex;
		min-height: 100vh;
		flex-wrap: wrap;
		border-radius: 0;
		box-shadow: inset 0px 0px 0px 0px #000;
		flex-direction: column;
		background: none;
		width: calc(100% - 112px);
		align-items: flex-start;
		position: relative;
		height: auto;
		.title {
			padding: 50px  85px 20px ;
			margin: 0 0 0px 0;
			color: #000;
			top: 60px;
			left: 0;
			background: #fff;
			font-weight: 600;
			width: 100%;
			font-size: 28px;
			line-height: 40px;
			text-align: left;
		}
		.list-item {
			padding: 0 0 0 0px;
			margin: 0 0 15px 120px;
			width: calc(100% - 120px);
			position: relative;
			height: 46px;
			::v-deep  .el-form-item__content {
				display: block;
			}
			.lable {
				color: #000;
				left: -78px;
				letter-spacing: 1px;
				width: 120px;
				font-size: 16px;
				border-color: #000000;
				border-width: 0 0 2px 0;
				position: absolute!important;
				border-style: solid;
				text-align: left;
				height: 46px;
			}
			.el-input {
				width: 100%;
			}
			.el-input ::v-deep  .el-input__inner {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-input ::v-deep  .el-input__inner:focus {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-input-number {
				width: 100%;
			}
			.el-input-number ::v-deep  .el-input__inner {
				text-align: center;
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-input-number ::v-deep  .el-input__inner:focus {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
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
			.el-select ::v-deep  .el-input__inner {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-select ::v-deep  .el-input__inner:focus {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-date-editor {
				width: 100%;
			}
			.el-date-editor ::v-deep  .el-input__inner {
				border-radius: 0;
				padding: 0 30px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-date-editor ::v-deep  .el-input__inner:focus {
				border-radius: 0;
				padding: 0 30px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			.el-date-editor.el-input {
				width: 100%;
			}
			::v-deep  .el-upload--picture-card {
				background: transparent;
				border: 0;
				border-radius: 0;
				width: auto;
				height: auto;
				line-height: initial;
				vertical-align: middle;
			}
			::v-deep  .upload .upload-img {
				border: 2px solid #000;
				cursor: pointer;
				border-radius: 0px;
				margin: 0 45px;
				color:  #000;
				background: #fff;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			::v-deep  .el-upload-list .el-upload-list__item {
				border: 2px solid #000;
				cursor: pointer;
				border-radius: 0px;
				margin: 0 45px;
				color:  #000;
				background: #fff;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			::v-deep  .el-upload .el-icon-plus {
				border: 2px solid #000;
				cursor: pointer;
				border-radius: 0px;
				margin: 0 45px;
				color:  #000;
				background: #fff;
				width: 90px;
				font-size: 24px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			::v-deep  .el-upload__tip {
				color: #666;
				font-size: 15px;
			}
			::v-deep  .el-input__inner::placeholder {
				color: #999;
				font-size: 16px;
			}
			.required {
				position: relative;
			}
			.required::after{
				color: red;
				left: -5px;
				position: inherit;
				content: "*";
				order: -1;
			}
			.editor {
				background: #fff;
				width: 100%;
				height: auto;
			}
			.editor>.avatar-uploader {
				line-height: 0;
				height: 0;
			}
		}
		.list-item.email {
			input {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			input:focus {
				border-radius: 0;
				padding: 0 10px;
				color: #666;
				background: #fff;
				flex: 1;
				font-size: 16px;
				border-color: #000;
				border-width: 0 0 2px 0;
				border-style: solid;
				height: 46px;
			}
			input::placeholder {
				color: #999;
				font-size: 16px;
			}
			button {
				border: 0px solid #efeff7;
				cursor: pointer;
				border-radius: 0 4px 4px 0;
				padding: 0;
				margin: 1px 0 0;
				color: #333;
				background: #0d6efd20;
				width: 150px;
				font-size: 15px;
				height: 38px;
			}
			button:hover {
				opacity: 0.8;
			}
		}
		.register-btn {
			margin: 50px 0 60px 40px;
			background: none;
			display: flex;
			width: 100%;
			justify-content: space-between;
			align-items: center;
			flex-wrap: wrap;
		}
		.register-btn1 {
			width: 174px;
			height: 69px;
			order: 2;
		}
		.register-btn2 {
			width: auto;
			order: 1;
		}
		.r-btn {
			border: 0px solid rgba(0, 0, 0, 1);
			cursor: pointer;
			border-radius: 0;
			padding: 0 10px;
			margin: 0 0 10px;
			color: #fff;
			background: #0799D5;
			font-weight: 700;
			width: 100%;
			font-size: 30px;
			min-width: 68px;
			height: 100%;
		}
		.r-btn:hover {
			border: 0px solid rgba(0, 0, 0, 1);
			opacity: 0.8;
		}
		.r-login {
			border: 0;
			cursor: pointer;
			border-radius: 0;
			padding: 0;
			margin: 0;
			color: #000000;
			background: none;
			font-weight: 400;
			width: 100%;
			font-size: 15px;
			text-align: right;
			height: 34px;
		}
		.r-login:hover {
			opacity: 1;
		}
	}
	.idea-box1 {
		top: 35%;
		background: #3A3A3A;
		font-weight: 600;
		width: 100%;
		font-size: 20px;
		position: absolute;
		height: 350px;
		order: -2;
	}
	.idea-box2 {
		margin: 5px 0 40px;
		color: #fff;
		top: 50%;
		left: 82px;
		font-weight: 400;
		width: 100%;
		font-size: 16px;
		position: absolute;
		height: 30px;
		order: -1;
	}
}
	
	::-webkit-scrollbar {
	  display: none;
	}
</style>
