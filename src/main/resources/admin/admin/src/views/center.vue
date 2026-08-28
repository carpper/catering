<template>
	<div :style='{"padding":"20px 30px 20px 30px","margin":"130px 0 0 20px","fontSize":"15px","background":"#F2F8FF"}'>
		<el-form
			:style='{"border":"0px solid #BFBFBF","padding":"0","margin":"0 auto","flexWrap":"wrap","background":"#fff","display":"flex"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			label-width="180px"
		>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiuzhizhe'"  label="求职账号" prop="qiuzhizhanghao">
					<el-input v-model="ruleForm.qiuzhizhanghao" readonly						placeholder="求职账号" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiuzhizhe'"  label="求职姓名" prop="qiuzhixingming">
					<el-input v-model="ruleForm.qiuzhixingming" 						placeholder="求职姓名" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}' v-if="flag=='qiuzhizhe'"  label="性别" prop="xingbie">
					<el-select v-model="ruleForm.xingbie"  placeholder="请选择性别">
						<el-option
							v-for="(item,index) in qiuzhizhexingbieOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiuzhizhe'"  label="联系电话" prop="lianxidianhua">
					<el-input v-model="ruleForm.lianxidianhua" 						placeholder="联系电话" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}' v-if="flag=='qiuzhizhe'" label="头像" prop="touxiang">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="qiuzhizhetouxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiye'"  label="企业名称" prop="qiyemingcheng">
					<el-input v-model="ruleForm.qiyemingcheng" readonly						placeholder="企业名称" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiye'"  label="负责人" prop="fuzeren">
					<el-input v-model="ruleForm.fuzeren" 						placeholder="负责人" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiye'"  label="联系电话" prop="lianxidianhua">
					<el-input v-model="ruleForm.lianxidianhua" 						placeholder="联系电话" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiye'"  label="企业地址" prop="qiyedizhi">
					<el-input v-model="ruleForm.qiyedizhi" 						placeholder="企业地址" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}'   v-if="flag=='qiye'"  label="主营范围" prop="zhuyingfanwei">
					<el-input v-model="ruleForm.zhuyingfanwei" 						placeholder="主营范围" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}' v-if="flag=='qiye'" label="企业资质" prop="qiyezizhi">
					<file-upload
						tip="点击上传企业资质"
						action="file/upload"
						:limit="3"
						:type="3"
						:multiple="true"
						:fileUrls="ruleForm.qiyezizhi?ruleForm.qiyezizhi:''"
						@change="qiyeqiyezizhiUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}' v-if="flag=='qiye'" label="企业图片" prop="qiyetupian">
					<file-upload
						tip="点击上传企业图片"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.qiyetupian?ruleForm.qiyetupian:''"
						@change="qiyeqiyetupianUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}' v-if="flag=='users'" label="用户名" prop="username">
					<el-input v-model="ruleForm.username" placeholder="用户名"></el-input>
				</el-form-item>
				<el-form-item :style='{"border":"0px solid #eee","width":"49%","padding":"0","margin":"0!important","display":"initial"}' v-if="flag=='users'" label="头像" prop="image">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="1"
						:multiple="false"
						:fileUrls="ruleForm.image?ruleForm.image:''"
						@change="usersimageUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"100%","padding":"0","margin":"20px 0 0 0","display":"flex"}'>
					<el-button class="btn3" :style='{"border":"2px solid #0799D5","cursor":"pointer","padding":"0 10px","margin":"0 10px 0 0","color":"#0799D5","borderRadius":"4px","background":"none","width":"auto","fontSize":"16px","minWidth":"110px","height":"40px"}' type="primary" @click="onUpdateHandler">
						<span class="icon iconfont icon-xihuan" :style='{"margin":"0 2px","fontSize":"14px","color":"#fff","display":"none","height":"40px"}'></span>
						提交
					</el-button>
				</el-form-item>
		</el-form>
	</div>
</template>
<script>
// 校验引入
import { 
	isMobile,
} from "@/utils/validate";

export default {
	data() {
		return {
			ruleForm: {},
			flag: '',
			usersFlag: false,
			qiuzhizhexingbieOptions: [],
		};
	},
	mounted() {
		var table = this.$storage.get("sessionTable");
		this.flag = table;
		this.$http({
			url: `${this.$storage.get("sessionTable")}/session`,
			method: "get"
		}).then(({ data }) => {
			if (data && data.code === 0) {
				this.ruleForm = data.data;
			} else {
				this.$message.error(data.msg);
			}
		});
		this.qiuzhizhexingbieOptions = "男,女".split(',')
	},
	methods: {
		qiuzhizhetouxiangUploadChange(fileUrls) {
			this.ruleForm.touxiang = fileUrls;
		},
		qiyeqiyezizhiUploadChange(fileUrls) {
			this.ruleForm.qiyezizhi = fileUrls;
		},
		qiyeqiyetupianUploadChange(fileUrls) {
			this.ruleForm.qiyetupian = fileUrls;
		},
		usersimageUploadChange(fileUrls) {
			this.ruleForm.image = fileUrls;
		},
		onUpdateHandler() {
			if((!this.ruleForm.qiuzhizhanghao)&& 'qiuzhizhe'==this.flag){
				this.$message.error('求职账号不能为空');
				return
			}


			if((!this.ruleForm.mima)&& 'qiuzhizhe'==this.flag){
				this.$message.error('密码不能为空');
				return
			}

			if((!this.ruleForm.qiuzhixingming)&& 'qiuzhizhe'==this.flag){
				this.$message.error('求职姓名不能为空');
				return
			}






			if( 'qiuzhizhe' ==this.flag && this.ruleForm.lianxidianhua&&(!isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}


			if(this.ruleForm.touxiang!=null) {
				this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
			}
			if((!this.ruleForm.qiyemingcheng)&& 'qiye'==this.flag){
				this.$message.error('企业名称不能为空');
				return
			}


			if((!this.ruleForm.mima)&& 'qiye'==this.flag){
				this.$message.error('密码不能为空');
				return
			}

			if((!this.ruleForm.fuzeren)&& 'qiye'==this.flag){
				this.$message.error('负责人不能为空');
				return
			}


			if((!this.ruleForm.lianxidianhua)&& 'qiye'==this.flag){
				this.$message.error('联系电话不能为空');
				return
			}


			if( 'qiye' ==this.flag && this.ruleForm.lianxidianhua&&(!isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}
			if((!this.ruleForm.qiyedizhi)&& 'qiye'==this.flag){
				this.$message.error('企业地址不能为空');
				return
			}


			if((!this.ruleForm.zhuyingfanwei)&& 'qiye'==this.flag){
				this.$message.error('主营范围不能为空');
				return
			}


			if((!this.ruleForm.qiyezizhi)&& 'qiye'==this.flag){
				this.$message.error('企业资质不能为空');
				return
			}


			if(this.ruleForm.qiyezizhi!=null) {
				this.ruleForm.qiyezizhi = this.ruleForm.qiyezizhi.replace(new RegExp(this.$base.url,"g"),"");
			}
			if((!this.ruleForm.qiyetupian)&& 'qiye'==this.flag){
				this.$message.error('企业图片不能为空');
				return
			}


			if(this.ruleForm.qiyetupian!=null) {
				this.ruleForm.qiyetupian = this.ruleForm.qiyetupian.replace(new RegExp(this.$base.url,"g"),"");
			}




			if('users'==this.flag && this.ruleForm.username.trim().length<1) {
				this.$message.error(`用户名不能为空`);
				return	
			}
			if(this.flag=='users'){
				this.ruleForm.image = this.ruleForm.image.replace(new RegExp(this.$base.url,"g"),"")
			}
			this.$http({
				url: `${this.$storage.get("sessionTable")}/update`,
				method: "post",
				data: this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "修改信息成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							if(this.flag=='users'){
								this.$storage.set('headportrait',this.ruleForm.image)
							}
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
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item ::v-deep  .el-form-item__label {
				border: 1px solid #C4C4C4;
				padding: 0 10px 0 0;
				margin: 0;
				color: #666;
				background: #F3F4F3;
				font-weight: 400;
				width: 180px;
				font-size: 14px;
				line-height: 70px;
				text-align: center;
				height: 70px;
			}
	
	.add-update-preview .el-form-item ::v-deep  .el-form-item__content {
		margin-left: 180px;
	}
	
	.add-update-preview .el-input ::v-deep  .el-input__inner {
				border-radius: 0px;
				padding: 0 12px;
				margin: 0;
				color: #C4C4C4;
				width: auto;
				font-size: 14px;
				border-color: #C4C4C4;
				border-width: 1px;
				border-style: solid ;
				min-width: 100%;
				height: 70px;
			}
	
	.add-update-preview .el-select ::v-deep  .el-input__inner {
				border-radius: 0px;
				padding: 0 12px;
				margin: 0;
				color: #C4C4C4;
				width: auto;
				font-size: 14px;
				border-color: #C4C4C4;
				border-width: 1px;
				border-style: solid ;
				min-width: 100%;
				height: 70px;
			}
	
	.add-update-preview .el-date-editor ::v-deep  .el-input__inner {
				border-radius: 0px;
				padding: 0 30px;
				color: #C4C4C4;
				width: auto;
				font-size: 14px;
				border-color: #C4C4C4;
				border-width: 1px;
				border-style: solid ;
				min-width: 100%;
				height: 70px;
			}
	
	.add-update-preview ::v-deep  .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview ::v-deep  .el-upload-list .el-upload-list__item {
				padding: 0 12px;
				color: #C4C4C4;
				font-weight: 500;
				object-fit: cover;
				font-size: 32px;
				border-color: #C4C4C4;
				line-height: 70px;
				border-radius: 0px;
				width: 120px;
				border-width: 1px;
				border-style: solid ;
				min-width: 100%;
				height: 70px;
			}
	
	.add-update-preview ::v-deep  .el-upload .el-icon-plus {
				padding: 0 12px;
				color: #C4C4C4;
				font-weight: 500;
				object-fit: cover;
				font-size: 32px;
				border-color: #C4C4C4;
				line-height: 70px;
				border-radius: 0px;
				width: 120px;
				border-width: 1px;
				border-style: solid ;
				min-width: 100%;
				height: 70px;
			}
	
	.add-update-preview .el-textarea ::v-deep  .el-textarea__inner {
				border: 1px solid #C4C4C4;
				border-radius: 0px;
				padding: 12px;
				color: #C4C4C4;
				background: #fff;
				width: 100%;
				font-size: 14px;
				min-width: 400px;
				height: 70px;
			}
	
	.add-update-preview .btn3 {
				border: 2px solid #0799D5;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 10px;
				margin: 0 10px 0 0;
				color: #0799D5;
				background: none;
				width: auto;
				font-size: 16px;
				min-width: 110px;
				height: 40px;
			}
	
	.add-update-preview .btn3:hover {
				opacity: 0.8;
			}
	
	.editor>.avatar-uploader {
		line-height: 0;
		height: 0;
	}
</style>
