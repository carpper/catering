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
				<el-form-item class="input" v-if="type!='info'"  label="负责人" prop="fuzeren" >
					<el-input v-model="ruleForm.fuzeren" placeholder="负责人" clearable  :readonly="ro.fuzeren"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="负责人" prop="fuzeren" >
					<el-input v-model="ruleForm.fuzeren" placeholder="负责人" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="企业地址" prop="qiyedizhi" >
					<el-input v-model="ruleForm.qiyedizhi" placeholder="企业地址" clearable  :readonly="ro.qiyedizhi"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="企业地址" prop="qiyedizhi" >
					<el-input v-model="ruleForm.qiyedizhi" placeholder="企业地址" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="地区" prop="diqu" >
					<el-input v-model="ruleForm.diqu" placeholder="地区" clearable  :readonly="ro.diqu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="地区" prop="diqu" >
					<el-input v-model="ruleForm.diqu" placeholder="地区" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="岗位类型" prop="gangweileixing" >
					<el-input v-model="ruleForm.gangweileixing" placeholder="岗位类型" clearable  :readonly="ro.gangweileixing"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="岗位类型" prop="gangweileixing" >
					<el-input v-model="ruleForm.gangweileixing" placeholder="岗位类型" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="求职状态" prop="qiuzhizhuangtai" >
					<el-select :disabled="ro.qiuzhizhuangtai" v-model="ruleForm.qiuzhizhuangtai" placeholder="请选择求职状态" >
						<el-option
							v-for="(item,index) in qiuzhizhuangtaiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="求职状态" prop="qiuzhizhuangtai" >
					<el-input v-model="ruleForm.qiuzhizhuangtai"
						placeholder="求职状态" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="投递时间" prop="toudishijian" >
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.toudishijian" 
						type="datetime"
						:readonly="ro.toudishijian"
						placeholder="投递时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.toudishijian" label="投递时间" prop="toudishijian" >
					<el-input v-model="ruleForm.toudishijian" placeholder="投递时间" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="求职账号" prop="qiuzhizhanghao" >
					<el-input v-model="ruleForm.qiuzhizhanghao" placeholder="求职账号" clearable  :readonly="ro.qiuzhizhanghao"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="求职账号" prop="qiuzhizhanghao" >
					<el-input v-model="ruleForm.qiuzhizhanghao" placeholder="求职账号" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="求职姓名" prop="qiuzhixingming" >
					<el-input v-model="ruleForm.qiuzhixingming" placeholder="求职姓名" clearable  :readonly="ro.qiuzhixingming"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="求职姓名" prop="qiuzhixingming" >
					<el-input v-model="ruleForm.qiuzhixingming" placeholder="求职姓名" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" clearable  :readonly="ro.lianxidianhua"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" readonly></el-input>
				</el-form-item>
				<el-form-item class="upload" v-if="type!='info'&& !ro.gerenjianli" label="个人简历" prop="gerenjianli" >
					<file-upload
						tip="点击上传个人简历"
						action="file/upload"
						:limit="1"
						:type="3"
						:multiple="true"
						:fileUrls="ruleForm.gerenjianli?ruleForm.gerenjianli:''"
						@change="gerenjianliUploadChange"
					></file-upload>
				</el-form-item>  
				<el-form-item v-else-if="ruleForm.gerenjianli" label="个人简历" prop="gerenjianli" >
					<el-button class="downBtn" type="text" size="small" @click="download($base.url+ruleForm.gerenjianli)">
						<span class="icon iconfont icon-xiazai6"></span>
						下载
					</el-button>
				</el-form-item>
				<el-form-item v-else-if="!ruleForm.gerenjianli" label="个人简历" prop="gerenjianli" >
					<el-button class="unBtn" type="text" size="small">
						<span class="icon iconfont icon-xihuan"></span>
						暂无
					</el-button>
				</el-form-item>
			</template>
			<el-form-item class="textarea" v-if="type!='info'" label="个人经历" prop="gerenjingli" >
				<el-input
					style="min-width: 200px; max-width: 600px;"
					type="textarea"
					:rows="8"
					placeholder="个人经历"
					v-model="ruleForm.gerenjingli" >
				</el-input>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.gerenjingli" label="个人经历" prop="gerenjingli" >
				<span class="text">{{ruleForm.gerenjingli}}</span>
			</el-form-item>
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
					qiyetupian : false,
					fuzeren : false,
					qiyedizhi : false,
					diqu : false,
					gangweileixing : false,
					qiuzhizhuangtai : false,
					toudishijian : false,
					qiuzhizhanghao : false,
					qiuzhixingming : false,
					lianxidianhua : false,
					gerenjingli : false,
					gerenjianli : false,
					sfsh : false,
					shhf : false,
				},
			
				ruleForm: {
					qiyemingcheng: '',
					qiyetupian: '',
					fuzeren: '',
					qiyedizhi: '',
					diqu: '',
					gangweileixing: '',
					qiuzhizhuangtai: '待通知',
					toudishijian: '',
					qiuzhizhanghao: '',
					qiuzhixingming: '',
					lianxidianhua: '',
					gerenjingli: '',
					gerenjianli: '',
					shhf: '',
				},
		
				qiuzhizhuangtaiOptions: [],

				rules: {
					qiyemingcheng: [
					],
					qiyetupian: [
					],
					fuzeren: [
					],
					qiyedizhi: [
					],
					diqu: [
					],
					gangweileixing: [
					],
					qiuzhizhuangtai: [
					],
					toudishijian: [
					],
					qiuzhizhanghao: [
					],
					qiuzhixingming: [
					],
					lianxidianhua: [
						{ validator: validateMobile, trigger: 'blur' },
					],
					gerenjingli: [
						{ required: true, message: '个人经历不能为空', trigger: 'blur' },
					],
					gerenjianli: [
						{ required: true, message: '个人简历不能为空', trigger: 'blur' },
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
			this.ruleForm.toudishijian = this.getCurDateTime()
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
						if(o=='qiyetupian'){
							this.ruleForm.qiyetupian = obj[o];
							this.ro.qiyetupian = true;
							continue;
						}
						if(o=='fuzeren'){
							this.ruleForm.fuzeren = obj[o];
							this.ro.fuzeren = true;
							continue;
						}
						if(o=='qiyedizhi'){
							this.ruleForm.qiyedizhi = obj[o];
							this.ro.qiyedizhi = true;
							continue;
						}
						if(o=='diqu'){
							this.ruleForm.diqu = obj[o];
							this.ro.diqu = true;
							continue;
						}
						if(o=='gangweileixing'){
							this.ruleForm.gangweileixing = obj[o];
							this.ro.gangweileixing = true;
							continue;
						}
						if(o=='qiuzhizhuangtai'){
							this.ruleForm.qiuzhizhuangtai = obj[o];
							this.ro.qiuzhizhuangtai = true;
							continue;
						}
						if(o=='toudishijian'){
							this.ruleForm.toudishijian = obj[o];
							this.ro.toudishijian = true;
							continue;
						}
						if(o=='qiuzhizhanghao'){
							this.ruleForm.qiuzhizhanghao = obj[o];
							this.ro.qiuzhizhanghao = true;
							continue;
						}
						if(o=='qiuzhixingming'){
							this.ruleForm.qiuzhixingming = obj[o];
							this.ro.qiuzhixingming = true;
							continue;
						}
						if(o=='lianxidianhua'){
							this.ruleForm.lianxidianhua = obj[o];
							this.ro.lianxidianhua = true;
							continue;
						}
						if(o=='gerenjingli'){
							this.ruleForm.gerenjingli = obj[o];
							this.ro.gerenjingli = true;
							continue;
						}
						if(o=='gerenjianli'){
							this.ruleForm.gerenjianli = obj[o];
							this.ro.gerenjianli = true;
							continue;
						}
					}
					this.ruleForm.qiuzhizhuangtai = '待通知'; 				}
				// 获取用户信息
				this.$http({
					url: `${this.$storage.get('sessionTable')}/session`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						var json = data.data;
						if(this.$storage.get("role")!="管理员") {
							this.ro.qiuzhizhuangtai = true;
						}
						if(((json.qiuzhizhanghao!=''&&json.qiuzhizhanghao) || json.qiuzhizhanghao==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiuzhizhanghao = json.qiuzhizhanghao
							this.ro.qiuzhizhanghao = true;
						}
						if(((json.qiuzhixingming!=''&&json.qiuzhixingming) || json.qiuzhixingming==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiuzhixingming = json.qiuzhixingming
							this.ro.qiuzhixingming = true;
						}
						if(((json.lianxidianhua!=''&&json.lianxidianhua) || json.lianxidianhua==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.lianxidianhua = json.lianxidianhua
							this.ro.lianxidianhua = true;
						}
					} else {
						this.$message.error(data.msg);
					}
				});
				this.qiuzhizhuangtaiOptions = "已邀请,待通知".split(',')
			
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `toudixinxi/info/${id}`,
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
					if(this.ruleForm.qiyetupian!=null) {
						this.ruleForm.qiyetupian = this.ruleForm.qiyetupian.replace(new RegExp(this.$base.url,"g"),"");
					}
					if(this.ruleForm.gerenjianli!=null) {
						this.ruleForm.gerenjianli = this.ruleForm.gerenjianli.replace(new RegExp(this.$base.url,"g"),"");
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
								url: `toudixinxi/${!this.ruleForm.id ? "save" : "update"}`,
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
											this.parent.toudixinxiCrossAddOrUpdateFlag = false;
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
				this.parent.toudixinxiCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
			},
			qiyetupianUploadChange(fileUrls) {
				this.ruleForm.qiyetupian = fileUrls;
			},
			gerenjianliUploadChange(fileUrls) {
				this.ruleForm.gerenjianli = fileUrls;
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
