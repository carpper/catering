<template>
	<div class="addEdit-block">
		<el-form
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="180px"
		>
			<template >
				<el-form-item class="input" v-if="type!='info'"  label="企业名称" prop="qiyemingcheng" >
					<el-input v-model="ruleForm.qiyemingcheng" placeholder="企业名称" clearable  :readonly="ro.qiyemingcheng"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="企业名称" prop="qiyemingcheng" >
					<el-input v-model="ruleForm.qiyemingcheng" placeholder="企业名称" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="密码" prop="mima" >
					<el-input v-model="ruleForm.mima" placeholder="密码" clearable  :readonly="ro.mima"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="密码" prop="mima" >
					<el-input v-model="ruleForm.mima" placeholder="密码" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="负责人" prop="fuzeren" >
					<el-input v-model="ruleForm.fuzeren" placeholder="负责人" clearable  :readonly="ro.fuzeren"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="负责人" prop="fuzeren" >
					<el-input v-model="ruleForm.fuzeren" placeholder="负责人" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" clearable  :readonly="ro.lianxidianhua"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="企业地址" prop="qiyedizhi" >
					<el-input v-model="ruleForm.qiyedizhi" placeholder="企业地址" clearable  :readonly="ro.qiyedizhi"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="企业地址" prop="qiyedizhi" >
					<el-input v-model="ruleForm.qiyedizhi" placeholder="企业地址" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="主营范围" prop="zhuyingfanwei" >
					<el-input v-model="ruleForm.zhuyingfanwei" placeholder="主营范围" clearable  :readonly="ro.zhuyingfanwei"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="主营范围" prop="zhuyingfanwei" >
					<el-input v-model="ruleForm.zhuyingfanwei" placeholder="主营范围" readonly></el-input>
				</el-form-item>
				<el-form-item class="upload" v-if="type!='info'&& !ro.qiyezizhi" label="企业资质" prop="qiyezizhi" >
					<file-upload
						tip="点击上传企业资质"
						action="file/upload"
						:limit="1"
						:type="3"
						:multiple="true"
						:fileUrls="ruleForm.qiyezizhi?ruleForm.qiyezizhi:''"
						@change="qiyezizhiUploadChange"
					></file-upload>
				</el-form-item>  
				<el-form-item v-else-if="ruleForm.qiyezizhi" label="企业资质" prop="qiyezizhi" >
					<el-button class="downBtn" type="text" size="small" @click="download($base.url+ruleForm.qiyezizhi)">
						<span class="icon iconfont icon-xiazai6"></span>
						下载
					</el-button>
				</el-form-item>
				<el-form-item v-else-if="!ruleForm.qiyezizhi" label="企业资质" prop="qiyezizhi" >
					<el-button class="unBtn" type="text" size="small">
						<span class="icon iconfont icon-xihuan"></span>
						暂无
					</el-button>
				</el-form-item>
				<el-form-item class="upload" v-if="type!='info' && !ro.qiyetupian" label="企业图片" prop="qiyetupian" >
					<file-upload
						tip="点击上传企业图片"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.qiyetupian?ruleForm.qiyetupian:''"
						@change="qiyetupianUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item class="upload" v-else-if="ruleForm.qiyetupian" label="企业图片" prop="qiyetupian" >
					<img v-if="ruleForm.qiyetupian.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.qiyetupian.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.qiyetupian.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
			</template>
			<el-form-item class="btn">
				<el-button class="btn3"  v-if="type!='info'" type="success" @click="onSubmit">
					<span class="icon iconfont icon-xihuan"></span>
					提交
				</el-button>
				<el-button class="btn4" v-if="type!='info'" type="success" @click="back()">
					<span class="icon iconfont icon-xihuan"></span>
					取消
				</el-button>
				<el-button class="btn5" v-if="type=='info'" type="success" @click="back()">
					<span class="icon iconfont icon-xihuan"></span>
					返回
				</el-button>
			</el-form-item>
		</el-form>
    

	</div>
</template>
<script>
	import { 
		isMobile,
	} from "@/utils/validate";
	export default {
		data() {
			var validateMobile = (rule, value, callback) => {
				if(!value){
					callback();
				} else if (!isMobile(value)) {
					callback(new Error("请输入正确的手机号码"));
				} else {
					callback();
				}
			};
			return {
				id: '',
				type: '',
			
			
				ro:{
					qiyemingcheng : false,
					mima : false,
					fuzeren : false,
					lianxidianhua : false,
					qiyedizhi : false,
					zhuyingfanwei : false,
					qiyezizhi : false,
					qiyetupian : false,
					sfsh : false,
					shhf : false,
				},
			
				ruleForm: {
					qiyemingcheng: '',
					mima: '',
					fuzeren: '',
					lianxidianhua: '',
					qiyedizhi: '',
					zhuyingfanwei: '',
					qiyezizhi: '',
					qiyetupian: '',
					shhf: '',
				},
		

				rules: {
					qiyemingcheng: [
						{ required: true, message: '企业名称不能为空', trigger: 'blur' },
					],
					mima: [
						{ required: true, message: '密码不能为空', trigger: 'blur' },
					],
					fuzeren: [
						{ required: true, message: '负责人不能为空', trigger: 'blur' },
					],
					lianxidianhua: [
						{ required: true, message: '联系电话不能为空', trigger: 'blur' },
						{ validator: validateMobile, trigger: 'blur' },
					],
					qiyedizhi: [
						{ required: true, message: '企业地址不能为空', trigger: 'blur' },
					],
					zhuyingfanwei: [
						{ required: true, message: '主营范围不能为空', trigger: 'blur' },
					],
					qiyezizhi: [
						{ required: true, message: '企业资质不能为空', trigger: 'blur' },
					],
					qiyetupian: [
						{ required: true, message: '企业图片不能为空', trigger: 'blur' },
					],
					sfsh: [
					],
					shhf: [
					],
				},
			};
		},
		props: ["parent"],
		computed: {



		},
		components: {
		},
		created() {
		},
		methods: {
			// 下载
			download(file){
				window.open(`${file}`)
			},
			// 初始化
			init(id,type) {
				if (id) {
					this.id = id;
					this.type = type;
				}
				if(this.type=='info'||this.type=='else'){
					this.info(id);
				}else if(this.type=='logistics'){
					this.logistics=false;
					this.info(id);
				}else if(this.type=='cross'){
					var obj = this.$storage.getObj('crossObj');
					for (var o in obj){
						if(o=='qiyemingcheng'){
							this.ruleForm.qiyemingcheng = obj[o];
							this.ro.qiyemingcheng = true;
							continue;
						}
						if(o=='mima'){
							this.ruleForm.mima = obj[o];
							this.ro.mima = true;
							continue;
						}
						if(o=='fuzeren'){
							this.ruleForm.fuzeren = obj[o];
							this.ro.fuzeren = true;
							continue;
						}
						if(o=='lianxidianhua'){
							this.ruleForm.lianxidianhua = obj[o];
							this.ro.lianxidianhua = true;
							continue;
						}
						if(o=='qiyedizhi'){
							this.ruleForm.qiyedizhi = obj[o];
							this.ro.qiyedizhi = true;
							continue;
						}
						if(o=='zhuyingfanwei'){
							this.ruleForm.zhuyingfanwei = obj[o];
							this.ro.zhuyingfanwei = true;
							continue;
						}
						if(o=='qiyezizhi'){
							this.ruleForm.qiyezizhi = obj[o];
							this.ro.qiyezizhi = true;
							continue;
						}
						if(o=='qiyetupian'){
							this.ruleForm.qiyetupian = obj[o];
							this.ro.qiyetupian = true;
							continue;
						}
					}
				}
				// 获取用户信息
				this.$http({
					url: `${this.$storage.get('sessionTable')}/session`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						var json = data.data;
					} else {
						this.$message.error(data.msg);
					}
				});
			
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `qiye/info/${id}`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.ruleForm = data.data;
						//解决前台上传图片后台不显示的问题
						let reg=new RegExp('../../../upload','g')//g代表全部
					} else {
						this.$message.error(data.msg);
					}
				});
			},

			// 提交
			async onSubmit() {
					if(this.ruleForm.qiyezizhi!=null) {
						this.ruleForm.qiyezizhi = this.ruleForm.qiyezizhi.replace(new RegExp(this.$base.url,"g"),"");
					}
					if(this.ruleForm.qiyetupian!=null) {
						this.ruleForm.qiyetupian = this.ruleForm.qiyetupian.replace(new RegExp(this.$base.url,"g"),"");
					}
					var objcross = this.$storage.getObj('crossObj');
					await this.$refs["ruleForm"].validate(async valid => {
						if (valid) {
							if(this.type=='cross'){
								var statusColumnName = this.$storage.get('statusColumnName');
								var statusColumnValue = this.$storage.get('statusColumnValue');
								if(statusColumnName!='') {
									var obj = this.$storage.getObj('crossObj');
									if(statusColumnName && !statusColumnName.startsWith("[")) {
										for (var o in obj){
											if(o==statusColumnName){
												obj[o] = statusColumnValue;
											}
										}
										var table = this.$storage.get('crossTable');
										await this.$http({
											url: `${table}/update`,
											method: "post",
											data: obj
										}).then(({ data }) => {});
									}
								}
							}
							
							await this.$http({
								url: `qiye/${!this.ruleForm.id ? "save" : "update"}`,
								method: "post",
								data: this.ruleForm
							}).then(async ({ data }) => {
								if (data && data.code === 0) {
									this.$message({
										message: "操作成功",
										type: "success",
										duration: 1500,
										onClose: () => {
											this.parent.showFlag = true;
											this.parent.addOrUpdateFlag = false;
											this.parent.qiyeCrossAddOrUpdateFlag = false;
											this.parent.search();
											this.parent.contentStyleChange();
										}
									});
								} else {
									this.$message.error(data.msg);
								}
							});
						}
					});
			},
			// 获取uuid
			getUUID () {
				return new Date().getTime();
			},
			// 返回
			back() {
				this.parent.showFlag = true;
				this.parent.addOrUpdateFlag = false;
				this.parent.qiyeCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
			},
			qiyezizhiUploadChange(fileUrls) {
				this.ruleForm.qiyezizhi = fileUrls;
			},
			qiyetupianUploadChange(fileUrls) {
				this.ruleForm.qiyetupian = fileUrls;
			},
		}
	};
</script>
<style lang="scss" scoped>
	.addEdit-block {
		border-radius: 30px;
		padding: 80px 74px;
		margin: 150px 20px 0 60px;
		background: #fff;
	}
	.add-update-preview {
		border: 0px solid #BFBFBF;
		padding: 0;
		margin: 0 auto;
		background: #fff;
		display: flex;
		flex-wrap: wrap;
	}
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	.add-update-preview ::v-deep  .el-form-item {
		border: 0px solid #eee;
		padding: 0;
		margin: 0!important;
		display: initial;
		width: 49%;
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
	.add-update-preview .el-form-item span.text {
		border: 1px solid #C4C4C4;
		cursor: pointer;
		padding: 0 15px;
		margin: 0 20px 0 0;
		color: #C4C4C4;
		font-weight: 400;
		display: block;
		font-size: 14px;
		min-height: 70px;
		line-height: 24px;
		border-radius: 0px;
		background: #fff;
		width: 100%;
		text-align: left;
		height: 100%;
	}
	
	.add-update-preview .el-input {
		width: 100%;
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
	.add-update-preview .el-input ::v-deep  .el-input__inner[readonly="readonly"] {
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
	.add-update-preview .el-input-number {
		text-align: left;
		width: 100%;
	}
	.add-update-preview .el-input-number ::v-deep  .el-input__inner {
		text-align: left;
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
	.add-update-preview .el-input-number ::v-deep  .is-disabled .el-input__inner {
		text-align: left;
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
	.add-update-preview .el-input-number ::v-deep  .el-input-number__decrease {
		display: none;
	}
	.add-update-preview .el-input-number ::v-deep  .el-input-number__increase {
		display: none;
	}
	.add-update-preview .el-select {
		width: 100%;
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
	.add-update-preview .el-select ::v-deep  .is-disabled .el-input__inner {
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
	.add-update-preview .el-date-editor {
		width: 100%;
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
	.add-update-preview .el-date-editor ::v-deep  .el-input__inner[readonly="readonly"] {
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
	.add-update-preview .viewBtn {
		border: 1px solid #85B3B9;
		cursor: pointer;
		padding: 0 15px;
		margin: 0 20px 0 0;
		color: #85B3B9;
		font-weight: 400;
		font-size: 14px;
		line-height: 70px;
		border-radius: 0px;
		background: #fff;
		width: 100%;
		text-align: left;
		height: 70px;
		.iconfont {
			margin: 0 2px;
			color: #C4C4C4;
			font-size: 14px;
			height: 70px;
		}
	}
	.add-update-preview .viewBtn:hover {
		opacity: 0.8;
	}
	.add-update-preview .downBtn {
		border: 1px solid #85B3B9;
		cursor: pointer;
		padding: 0 15px;
		margin: 0 20px 0 0;
		color: #85B3B9;
		font-weight: 400;
		font-size: 14px;
		line-height: 70px;
		border-radius: 0px;
		background: #fff;
		width: 100%;
		text-align: left;
		height: 70px;
		.iconfont {
			margin: 0 2px;
			color: #C4C4C4;
			font-size: 14px;
			height: 70px;
		}
	}
	.add-update-preview .downBtn:hover {
		opacity: 0.8;
	}
	.add-update-preview .unBtn {
		border: 1px solid #85B3B9;
		cursor: pointer;
		padding: 0 15px;
		margin: 0 20px 0 0;
		color: #85B3B9;
		font-weight: 400;
		font-size: 14px;
		line-height: 70px;
		border-radius: 0px;
		background: #fff;
		width: 100%;
		text-align: left;
		height: 70px;
		.iconfont {
			margin: 0 2px;
			color: #C4C4C4;
			display: none;
			font-size: 14px;
			height: 34px;
		}
	}
	.add-update-preview .unBtn:hover {
		opacity: 0.8;
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
	
	.add-update-preview ::v-deep  .upload .upload-img {
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
	.add-update-preview ::v-deep  .el-upload__tip {
		color: #666;
		display: none;
		font-size: 15px;
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
	.add-update-preview .el-textarea ::v-deep  .el-textarea__inner[readonly="readonly"] {
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
	.add-update-preview .el-form-item.btn {
		padding: 0;
		margin: 20px 0 0 0;
		display: flex;
		width: 100%;
		.btn1 {
			border: 0px solid #ccc;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 10px;
			margin: 0 10px 0 0;
			color: #fff;
			background: #0799D5;
			width: auto;
			font-size: 16px;
			min-width: 110px;
			height: 40px;
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn1:hover {
			opacity: 0.8;
		}
		.btn2 {
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
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 34px;
			}
		}
		.btn2:hover {
			opacity: 0.8;
		}
		.btn3 {
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
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn3:hover {
			opacity: 0.8;
		}
		.btn4 {
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
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn4:hover {
			opacity: 0.8;
		}
		.btn5 {
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
			.iconfont {
				margin: 0 2px;
				color: #fff;
				display: none;
				font-size: 14px;
				height: 40px;
			}
		}
		.btn5:hover {
			opacity: 0.8;
		}
	}
</style>
