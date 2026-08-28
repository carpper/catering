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
				<el-form-item class="input" v-if="type!='info'"  label="企业地址" prop="qiyedizhi" >
					<el-input v-model="ruleForm.qiyedizhi" placeholder="企业地址" clearable  :readonly="ro.qiyedizhi"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="企业地址" prop="qiyedizhi" >
					<el-input v-model="ruleForm.qiyedizhi" placeholder="企业地址" readonly></el-input>
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
				<el-form-item class="input" v-if="type!='info'"  label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" clearable  :readonly="ro.lianxidianhua"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="岗位类型" prop="gangweileixing" >
					<el-select :disabled="ro.gangweileixing" v-model="ruleForm.gangweileixing" placeholder="请选择岗位类型" >
						<el-option
							v-for="(item,index) in gangweileixingOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="岗位类型" prop="gangweileixing" >
					<el-input v-model="ruleForm.gangweileixing"
						placeholder="岗位类型" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="地区" prop="diqu" >
					<el-select :disabled="ro.diqu" v-model="ruleForm.diqu" placeholder="请选择地区" >
						<el-option
							v-for="(item,index) in diquOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="地区" prop="diqu" >
					<el-input v-model="ruleForm.diqu"
						placeholder="地区" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="行业" prop="xingye" >
					<el-input v-model="ruleForm.xingye" placeholder="行业" clearable  :readonly="ro.xingye"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="行业" prop="xingye" >
					<el-input v-model="ruleForm.xingye" placeholder="行业" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="招聘人数" prop="zhaopinrenshu" >
					<el-input v-model.number="ruleForm.zhaopinrenshu" placeholder="招聘人数" clearable  :readonly="ro.zhaopinrenshu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="招聘人数" prop="zhaopinrenshu" >
					<el-input v-model="ruleForm.zhaopinrenshu" placeholder="招聘人数" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="薪资待遇" prop="xinzidaiyu" >
					<el-input v-model.number="ruleForm.xinzidaiyu" placeholder="薪资待遇" clearable  :readonly="ro.xinzidaiyu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="薪资待遇" prop="xinzidaiyu" >
					<el-input v-model="ruleForm.xinzidaiyu" placeholder="薪资待遇" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="厨师资质" prop="zizhiyaoqiu" >
					<el-select :disabled="ro.zizhiyaoqiu" v-model="ruleForm.zizhiyaoqiu" placeholder="请选择厨师资质" multiple filterable>
						<el-option
							v-for="(item,index) in zizhiyaoqiuOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="厨师资质" prop="zizhiyaoqiu" >
					<el-input v-model="ruleForm.zizhiyaoqiu"
						placeholder="厨师资质" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="经验要求" prop="jingyanyaoqiu" >
					<el-input v-model="ruleForm.jingyanyaoqiu" placeholder="经验要求" clearable  :readonly="ro.jingyanyaoqiu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="经验要求" prop="jingyanyaoqiu" >
					<el-input v-model="ruleForm.jingyanyaoqiu" placeholder="经验要求" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="工作时间" prop="gongzuoshijian" >
					<el-input v-model="ruleForm.gongzuoshijian" placeholder="工作时间" clearable  :readonly="ro.gongzuoshijian"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="工作时间" prop="gongzuoshijian" >
					<el-input v-model="ruleForm.gongzuoshijian" placeholder="工作时间" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="发布时间" prop="fabushijian" >
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.fabushijian" 
						type="datetime"
						:readonly="ro.fabushijian"
						placeholder="发布时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.fabushijian" label="发布时间" prop="fabushijian" >
					<el-input v-model="ruleForm.fabushijian" placeholder="发布时间" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="倒计结束时间" prop="reversetime" >
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.reversetime" 
						type="datetime"
						:readonly="ro.reversetime"
						placeholder="倒计结束时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.reversetime" label="倒计结束时间" prop="reversetime" >
					<el-input v-model="ruleForm.reversetime" placeholder="倒计结束时间" readonly></el-input>
				</el-form-item>
				<!-- 只有管理员才能看到审核字段 -->
				<template v-if="isAdmin">
					<el-form-item class="select" v-if="type!='info'"  label="是否审核" prop="sfsh" >
						<el-select :disabled="ro.sfsh" v-model="ruleForm.sfsh" placeholder="是否审核" >
							<el-option
								v-for="(item,index) in sfshOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item v-else class="input" label="是否审核" prop="sfsh" >
						<el-input v-model="ruleForm.sfsh"
							placeholder="是否审核" readonly></el-input>
					</el-form-item>
					<el-form-item class="input" v-if="type!='info'"  label="审核回复" prop="shhf" >
						<el-input v-model="ruleForm.shhf" placeholder="审核回复" clearable  :readonly="ro.shhf"></el-input>
					</el-form-item>
					<el-form-item v-else class="input" label="审核回复" prop="shhf" >
						<el-input v-model="ruleForm.shhf" placeholder="审核回复" readonly></el-input>
					</el-form-item>
				</template>
			</template>
			<el-form-item v-if="type!='info'"  label="岗位介绍" prop="gangweijieshao" >
				<editor 
					style="min-width: 200px; max-width: 600px;"
					v-model="ruleForm.gangweijieshao" 
					class="editor" 
					action="file/upload">
				</editor>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.gangweijieshao" label="岗位介绍" prop="gangweijieshao" >
				<span class="text ql-snow ql-editor" v-html="ruleForm.gangweijieshao"></span>
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
		isIntNumer,
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
					qiyemingcheng : false,
					qiyedizhi : false,
					qiyetupian : false,
					fuzeren : false,
					lianxidianhua : false,
					gangweileixing : false,
					diqu : false,
					xingye : false,
					zhaopinrenshu : false,
					xinzidaiyu : false,
					zizhiyaoqiu : false,
					jingyanyaoqiu : false,
					gongzuoshijian : false,
					gangweijieshao : false,
					fabushijian : false,
					thumbsupnum : false,
					crazilynum : false,
					clicktime : false,
					reversetime : false,
					clicknum : false,
					discussnum : false,
					storeupnum : false,
					sfsh : false,
					shhf : false,
				},
			
				ruleForm: {
					qiyemingcheng: '',
					qiyedizhi: '',
					qiyetupian: '',
					fuzeren: '',
					lianxidianhua: '',
					gangweileixing: '',
					diqu: '',
					xingye: '',
					zhaopinrenshu: '',
					xinzidaiyu: '',
					zizhiyaoqiu: [],
					jingyanyaoqiu: '',
					gongzuoshijian: '',
					gangweijieshao: '',
					fabushijian: '',
					clicktime: '',
					reversetime: '',
					sfsh: '',
					shhf: '',
				},
		
				gangweileixingOptions: [],
				diquOptions: [],
				zizhiyaoqiuOptions: [],
				sfshOptions: [],

				rules: {
					qiyemingcheng: [
					],
					qiyedizhi: [
					],
					qiyetupian: [
					],
					fuzeren: [
					],
					lianxidianhua: [
						{ validator: validateMobile, trigger: 'blur' },
					],
					gangweileixing: [
					],
					diqu: [
					],
					xingye: [
					],
					zhaopinrenshu: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					xinzidaiyu: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					zizhiyaoqiu: [
					],
					jingyanyaoqiu: [
					],
					gongzuoshijian: [
					],
					gangweijieshao: [
					],
					fabushijian: [
					],
					thumbsupnum: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					crazilynum: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					clicktime: [
					],
					reversetime: [
					],
					clicknum: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					discussnum: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
					storeupnum: [
						{ validator: validateIntNumber, trigger: 'blur' },
					],
				},
			};
		},
		props: ["parent"],
		computed: {
			// 判断当前用户是否是管理员
			isAdmin() {
				const sessionTable = this.$storage.get('sessionTable');
				return sessionTable === 'users' || sessionTable === 'admin';
			}
		},
		components: {
		},
		created() {
			this.ruleForm.fabushijian = this.getCurDateTime()
			this.sfshOptions = "是,否,待审核".split(',')
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
						if(o=='qiyedizhi'){
							this.ruleForm.qiyedizhi = obj[o];
							this.ro.qiyedizhi = true;
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
						if(o=='lianxidianhua'){
							this.ruleForm.lianxidianhua = obj[o];
							this.ro.lianxidianhua = true;
							continue;
						}
						if(o=='gangweileixing'){
							this.ruleForm.gangweileixing = obj[o];
							this.ro.gangweileixing = true;
							continue;
						}
						if(o=='diqu'){
							this.ruleForm.diqu = obj[o];
							this.ro.diqu = true;
							continue;
						}
						if(o=='xingye'){
							this.ruleForm.xingye = obj[o];
							this.ro.xingye = true;
							continue;
						}
						if(o=='zhaopinrenshu'){
							this.ruleForm.zhaopinrenshu = obj[o];
							this.ro.zhaopinrenshu = true;
							continue;
						}
						if(o=='xinzidaiyu'){
							this.ruleForm.xinzidaiyu = obj[o];
							this.ro.xinzidaiyu = true;
							continue;
						}
						if(o=='zizhiyaoqiu'){
							this.ruleForm.zizhiyaoqiu = obj[o];
							this.ro.zizhiyaoqiu = true;
							continue;
						}
						if(o=='jingyanyaoqiu'){
							this.ruleForm.jingyanyaoqiu = obj[o];
							this.ro.jingyanyaoqiu = true;
							continue;
						}
						if(o=='gongzuoshijian'){
							this.ruleForm.gongzuoshijian = obj[o];
							this.ro.gongzuoshijian = true;
							continue;
						}
						if(o=='gangweijieshao'){
							this.ruleForm.gangweijieshao = obj[o];
							this.ro.gangweijieshao = true;
							continue;
						}
						if(o=='fabushijian'){
							this.ruleForm.fabushijian = obj[o];
							this.ro.fabushijian = true;
							continue;
						}
						if(o=='thumbsupnum'){
							this.ruleForm.thumbsupnum = obj[o];
							this.ro.thumbsupnum = true;
							continue;
						}
						if(o=='crazilynum'){
							this.ruleForm.crazilynum = obj[o];
							this.ro.crazilynum = true;
							continue;
						}
						if(o=='clicktime'){
							this.ruleForm.clicktime = obj[o];
							this.ro.clicktime = true;
							continue;
						}
						if(o=='reversetime'){
							this.ruleForm.reversetime = obj[o];
							this.ro.reversetime = true;
							continue;
						}
						if(o=='clicknum'){
							this.ruleForm.clicknum = obj[o];
							this.ro.clicknum = true;
							continue;
						}
						if(o=='discussnum'){
							this.ruleForm.discussnum = obj[o];
							this.ro.discussnum = true;
							continue;
						}
						if(o=='storeupnum'){
							this.ruleForm.storeupnum = obj[o];
							this.ro.storeupnum = true;
							continue;
						}
						if(o=='sfsh'){
							this.ruleForm.sfsh = obj[o];
							this.ro.sfsh = true;
							continue;
						}
						if(o=='shhf'){
							this.ruleForm.shhf = obj[o];
							this.ro.shhf = true;
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
						if(((json.qiyemingcheng!=''&&json.qiyemingcheng) || json.qiyemingcheng==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiyemingcheng = json.qiyemingcheng
							this.ro.qiyemingcheng = true;
						}
						if(((json.qiyedizhi!=''&&json.qiyedizhi) || json.qiyedizhi==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiyedizhi = json.qiyedizhi
							this.ro.qiyedizhi = true;
						}
						if(((json.qiyetupian!=''&&json.qiyetupian) || json.qiyetupian==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiyetupian = json.qiyetupian
							this.ro.qiyetupian = true;
						}
						if(((json.fuzeren!=''&&json.fuzeren) || json.fuzeren==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.fuzeren = json.fuzeren
							this.ro.fuzeren = true;
						}
						if(((json.lianxidianhua!=''&&json.lianxidianhua) || json.lianxidianhua==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.lianxidianhua = json.lianxidianhua
							this.ro.lianxidianhua = true;
						}
					} else {
						this.$message.error(data.msg);
					}
				});
				this.$http({
					url: `option/gangweifenlei/gangweileixing`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.gangweileixingOptions = data.data;
					} else {
						this.$message.error(data.msg);
					}
				});
				this.$http({
					url: `option/diqu/diqu`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.diquOptions = data.data;
					} else {
						this.$message.error(data.msg);
					}
				});
				this.zizhiyaoqiuOptions = "国家职业资格五级,国家职业资格四级,国家职业资格三级,国家职业资格二级,国家职业资格一级".split(',')
			
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `jiuyexinxi/info/${id}`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.ruleForm = data.data;
						//解决前台上传图片后台不显示的问题
						let reg=new RegExp('../../../upload','g')//g代表全部
						this.ruleForm.zizhiyaoqiu = this.ruleForm.zizhiyaoqiu.split(",");
						this.ruleForm.gangweijieshao = this.ruleForm.gangweijieshao.replace(reg,'../../../Catering_Recruitment/upload');
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
							this.ruleForm.zizhiyaoqiu = this.ruleForm.zizhiyaoqiu.join(",");
							
							await this.$http({
								url: `jiuyexinxi/${!this.ruleForm.id ? "save" : "update"}`,
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
											this.parent.jiuyexinxiCrossAddOrUpdateFlag = false;
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
				this.parent.jiuyexinxiCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
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
