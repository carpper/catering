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
				<el-form-item class="input" v-if="type!='info'"  label="用户ID" prop="uid" >
					<el-input v-model="ruleForm.uid" placeholder="用户ID" clearable  :readonly="ro.uid"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="用户ID" prop="uid" >
					<el-input v-model="ruleForm.uid" placeholder="用户ID" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="好友用户ID" prop="fid" >
					<el-input v-model="ruleForm.fid" placeholder="好友用户ID" clearable  :readonly="ro.fid"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="好友用户ID" prop="fid" >
					<el-input v-model="ruleForm.fid" placeholder="好友用户ID" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="内容" prop="content" >
					<el-input v-model="ruleForm.content" placeholder="内容" clearable  :readonly="ro.content"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="内容" prop="content" >
					<el-input v-model="ruleForm.content" placeholder="内容" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="格式(1:文字，2:图片)" prop="format" >
					<el-input v-model.number="ruleForm.format" placeholder="格式(1:文字，2:图片)" clearable  :readonly="ro.format"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="格式(1:文字，2:图片)" prop="format" >
					<el-input v-model="ruleForm.format" placeholder="格式(1:文字，2:图片)" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="消息已读(0:未读，1:已读)" prop="isread" >
					<el-input v-model.number="ruleForm.isread" placeholder="消息已读(0:未读，1:已读)" clearable  :readonly="ro.isread"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="消息已读(0:未读，1:已读)" prop="isread" >
					<el-input v-model="ruleForm.isread" placeholder="消息已读(0:未读，1:已读)" readonly></el-input>
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
		isIntNumer,
	} from "@/utils/validate";
	export default {
		data() {
			var validateIntNumber = (rule, value, callback) => {
				if(!value){
					callback();
				} else if (!isIntNumer(value)) {
					callback(new Error("请输入整数"));
				} else {
					callback();
				}
			};
			return {
				id: '',
				type: '',
			
			
				ro:{
					uid : false,
					fid : false,
					content : false,
					format : false,
					isread : false,
				},
			
				ruleForm: {
					uid: '',
					fid: '',
					content: '',
					format: '',
				},
		

				rules: {
					uid: [
						{ required: true, message: '用户ID不能为空', trigger: 'blur' },
					],
					fid: [
						{ required: true, message: '好友用户ID不能为空', trigger: 'blur' },
					],
					content: [
					],
					format: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					isread: [
						{ validator: validateIntNumber, trigger: 'blur' },
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
						if(o=='uid'){
							this.ruleForm.uid = obj[o];
							this.ro.uid = true;
							continue;
						}
						if(o=='fid'){
							this.ruleForm.fid = obj[o];
							this.ro.fid = true;
							continue;
						}
						if(o=='content'){
							this.ruleForm.content = obj[o];
							this.ro.content = true;
							continue;
						}
						if(o=='format'){
							this.ruleForm.format = obj[o];
							this.ro.format = true;
							continue;
						}
						if(o=='isread'){
							this.ruleForm.isread = obj[o];
							this.ro.isread = true;
							continue;
						}
					}
				}
			
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `chatmessage/info/${id}`,
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
								url: `chatmessage/${!this.ruleForm.id ? "save" : "update"}`,
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
											this.parent.chatmessageCrossAddOrUpdateFlag = false;
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
				this.parent.chatmessageCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
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
