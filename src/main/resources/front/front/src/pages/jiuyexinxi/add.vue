<template>
	<div class="add-update-preview">
		<el-form
			class="add-update-form"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="160px"
			>
			<el-form-item class="add-item" label="企业名称" prop="qiyemingcheng">
				<el-input v-model="ruleForm.qiyemingcheng" 
					placeholder="企业名称" clearable :disabled=" false  ||ro.qiyemingcheng"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="企业地址" prop="qiyedizhi">
				<el-input v-model="ruleForm.qiyedizhi" 
					placeholder="企业地址" clearable :disabled=" false  ||ro.qiyedizhi"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="企业图片" v-if="type!='cross' || (type=='cross' && !ro.qiyetupian)" prop="qiyetupian">
				<file-upload
					tip="点击上传企业图片"
					action="file/upload"
					:limit="3"
					:multiple="true"
					:fileUrls="ruleForm.qiyetupian?ruleForm.qiyetupian:''"
					@change="qiyetupianUploadChange"
					></file-upload>
			</el-form-item>
			<el-form-item class="add-item" v-else label="企业图片" prop="qiyetupian">
				<img v-if="ruleForm.qiyetupian.substring(0,4)=='http'" class="upload-img" v-bind:key="index" :src="ruleForm.qiyetupian.split(',')[0]">
				<img v-else class="upload-img" v-bind:key="index" v-for="(item,index) in ruleForm.qiyetupian.split(',')" :src="baseUrl+item">
			</el-form-item>
			<el-form-item class="add-item" label="负责人" prop="fuzeren">
				<el-input v-model="ruleForm.fuzeren" 
					placeholder="负责人" clearable :disabled=" false  ||ro.fuzeren"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="联系电话" prop="lianxidianhua">
				<el-input v-model="ruleForm.lianxidianhua" 
					placeholder="联系电话" clearable :disabled=" false  ||ro.lianxidianhua"></el-input>
			</el-form-item>
			<el-form-item class="add-item"  label="岗位类型" prop="gangweileixing">
				<el-select v-model="ruleForm.gangweileixing" placeholder="请选择岗位类型" :disabled=" false  ||ro.gangweileixing" >
					<el-option
						v-for="(item,index) in gangweileixingOptions"
						:key="index"
						:label="item"
						:value="item">
					</el-option>
				</el-select>
			</el-form-item>
			<el-form-item class="add-item"  label="地区" prop="diqu">
				<el-select v-model="ruleForm.diqu" placeholder="请选择地区" :disabled=" false  ||ro.diqu" >
					<el-option
						v-for="(item,index) in diquOptions"
						:key="index"
						:label="item"
						:value="item">
					</el-option>
				</el-select>
			</el-form-item>
			<el-form-item class="add-item" label="行业" prop="xingye">
				<el-input v-model="ruleForm.xingye" 
					placeholder="行业" clearable :disabled=" false  ||ro.xingye"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="招聘人数" prop="zhaopinrenshu">
				<el-input v-model.number="ruleForm.zhaopinrenshu" 
					placeholder="招聘人数" clearable :disabled=" false  ||ro.zhaopinrenshu"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="薪资待遇" prop="xinzidaiyu">
				<el-input v-model.number="ruleForm.xinzidaiyu" 
					placeholder="薪资待遇" clearable :disabled=" false  ||ro.xinzidaiyu"></el-input>
			</el-form-item>
			<el-form-item class="add-item"  label="厨师资质" prop="zizhiyaoqiu">
				<el-select v-model="ruleForm.zizhiyaoqiu" placeholder="请选择厨师资质" :disabled=" false  ||ro.zizhiyaoqiu" multiple filterable>
					<el-option
						v-for="(item,index) in zizhiyaoqiuOptions"
						:key="index"
						:label="item"
						:value="item">
					</el-option>
				</el-select>
			</el-form-item>
			<el-form-item class="add-item" label="经验要求" prop="jingyanyaoqiu">
				<el-input v-model="ruleForm.jingyanyaoqiu" 
					placeholder="经验要求" clearable :disabled=" false  ||ro.jingyanyaoqiu"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="工作时间" prop="gongzuoshijian">
				<el-input v-model="ruleForm.gongzuoshijian" 
					placeholder="工作时间" clearable :disabled=" false  ||ro.gongzuoshijian"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="发布时间" prop="fabushijian">
				<el-date-picker
					:disabled=" false  ||ro.fabushijian"
					value-format="yyyy-MM-dd HH:mm:ss"
					v-model="ruleForm.fabushijian" 
					type="datetime"
					placeholder="发布时间">
				</el-date-picker>
			</el-form-item>
			<el-form-item class="add-item" label="倒计结束时间" prop="reversetime">
				<el-date-picker
					:disabled=" false  ||ro.reversetime"
					value-format="yyyy-MM-dd HH:mm:ss"
					v-model="ruleForm.reversetime" 
					type="datetime"
					placeholder="倒计结束时间">
				</el-date-picker>
			</el-form-item>
			<el-form-item class="add-item" label="岗位介绍" prop="gangweijieshao">
				<editor 
					v-model="ruleForm.gangweijieshao" 
					class="editor" 
					action="file/upload">
				</editor>
			</el-form-item>

			<el-form-item class="add-btn-item">
				<el-button class="submitBtn"  type="primary" @click="onSubmit">
					<span class="icon iconfont icon-kaitongfuwu"></span>
					<span class="text">更新信息</span>
				</el-button>
				<el-button class="closeBtn" @click="back()">
					<span class="icon iconfont icon-shanchu1"></span>
					<span class="text">取消</span>
				</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				id: '',
				baseUrl: '',
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
				},
				type: '',
				userTableName: localStorage.getItem('UserTableName'),
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
					zizhiyaoqiu: '',
					jingyanyaoqiu: '',
					gongzuoshijian: '',
					gangweijieshao: '',
					fabushijian: '',
					thumbsupnum: '',
					crazilynum: '',
					clicktime: '',
					reversetime: '',
					clicknum: '',
					discussnum: '',
					storeupnum: '',
				},
				gangweileixingOptions: [],
				diquOptions: [],
				zizhiyaoqiuOptions: [],


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
						{ validator: this.$validate.isMobile, trigger: 'blur' },
					],
					gangweileixing: [
					],
					diqu: [
					],
					xingye: [
					],
					zhaopinrenshu: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					xinzidaiyu: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
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
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					crazilynum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					clicktime: [
					],
					reversetime: [
					],
					clicknum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					discussnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					storeupnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
				},
				centerType: false,
			};
		},
		computed: {



		},
		components: {
		},
		created() {
			if(this.$route.query.centerType){
				this.centerType = true
			}
			//this.bg();
			let type = this.$route.query.type ? this.$route.query.type : '';
			this.init(type);
			this.baseUrl = this.$config.baseUrl;
			this.ruleForm.fabushijian = this.getCurDateTime()
		},
		methods: {
			getMakeZero(s) {
				return s < 10 ? '0' + s : s;
			},
			// 下载
			download(file){
				window.open(`${file}`)
			},
			// 初始化
			init(type) {
				this.type = type;
				if(type=='cross'){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
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
							this.ruleForm.qiyetupian = obj[o].split(",")[0];
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
					}
				}else if(type=='edit'){
					this.info()
				}
				// 获取用户信息
				this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						var json = res.data.data;
						if((json.qiyemingcheng!=''&&json.qiyemingcheng) || json.qiyemingcheng==0){
							this.ruleForm.qiyemingcheng = json.qiyemingcheng;
							this.ro.qiyemingcheng = true;
						}
						if((json.qiyedizhi!=''&&json.qiyedizhi) || json.qiyedizhi==0){
							this.ruleForm.qiyedizhi = json.qiyedizhi;
							this.ro.qiyedizhi = true;
						}
						if((json.qiyetupian!=''&&json.qiyetupian) || json.qiyetupian==0){
							this.ruleForm.qiyetupian = json.qiyetupian;
							this.ro.qiyetupian = true;
						}
						if((json.fuzeren!=''&&json.fuzeren) || json.fuzeren==0){
							this.ruleForm.fuzeren = json.fuzeren;
							this.ro.fuzeren = true;
						}
						if((json.lianxidianhua!=''&&json.lianxidianhua) || json.lianxidianhua==0){
							this.ruleForm.lianxidianhua = json.lianxidianhua;
							this.ro.lianxidianhua = true;
						}
					}
				});
				this.$http.get('option/gangweifenlei/gangweileixing', {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						this.gangweileixingOptions = res.data.data;
					}
				});
				this.$http.get('option/diqu/diqu', {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						this.diquOptions = res.data.data;
					}
				});
				this.zizhiyaoqiuOptions = "国家职业资格五级,国家职业资格四级,国家职业资格三级,国家职业资格二级,国家职业资格一级,其他".split(',')

				if (localStorage.getItem('raffleType') && localStorage.getItem('raffleType') != null) {
					localStorage.removeItem('raffleType')
					setTimeout(() => {
						this.onSubmit()
					}, 300)
				}
			},

			// 多级联动参数
			// 多级联动参数
			info() {
				this.$http.get(`jiuyexinxi/detail/${this.$route.query.id}`, {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						this.ruleForm = res.data.data;
						this.ruleForm.zizhiyaoqiu = this.ruleForm.zizhiyaoqiu.split(",");
					}
				});
			},
			// 提交
			async onSubmit() {
				await this.$refs["ruleForm"].validate(async valid => {
					if(valid) {
						if(this.type=='cross'){
							var statusColumnName = localStorage.getItem('statusColumnName');
							var statusColumnValue = localStorage.getItem('statusColumnValue');
							if(statusColumnName && statusColumnName!='') {
								var obj = JSON.parse(localStorage.getItem('crossObj'));
								if(!statusColumnName.startsWith("[")) {
									for (var o in obj){
										if(o==statusColumnName){
											obj[o] = statusColumnValue;
										}
									}
									var table = localStorage.getItem('crossTable');
									await this.$http.post(table+'/update', obj).then(res => {});
								}
							}
						}


						this.ruleForm.zizhiyaoqiu = this.ruleForm.zizhiyaoqiu.join(",");
						await this.$http.post(`jiuyexinxi/${this.ruleForm.id?'update':this.centerType?'save':'add'}`, this.ruleForm).then(async res => {
							if (res.data.code == 0) {
								this.$message({
									message: '操作成功',
									type: 'success',
									duration: 1500,
									onClose: () => {
										this.$router.go(-1);
										
									}
								});
							} else {
								this.$message({
									message: res.data.msg,
									type: 'error',
									duration: 1500
								});
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
				this.$router.go(-1);
			},
			qiyetupianUploadChange(fileUrls) {
				this.ruleForm.qiyetupian = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
			},
		}
	};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.add-update-preview {
		padding: 20px;
		margin: 10px auto;
		background: #fff;
		width: 1270px;
		position: relative;
		.add-update-form {
			width: 100%;
			position: relative;
			.add-item.el-form-item {
				padding: 0;
				margin: 0 0 16px;
				background: none;
				::v-deep  .el-form-item__label {
					padding: 0 10px 0 0;
					color: #666;
					font-weight: 500;
					width: 160px;
					font-size: 14px;
					line-height: 40px;
					text-align: right;
				}
				::v-deep  .el-form-item__content {
					margin-left: 160px;
				}
				.el-input {
					width: 100%;
				}
				.el-input ::v-deep  .el-input__inner {
					border: 1px solid #E2E3E5;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: rgba(64, 158, 255, 1);
					width: 400px;
					font-size: 14px;
					height: 40px;
				}
				.el-input ::v-deep  .el-input__inner[readonly="readonly"] {
					border: 1px solid #E2E3E5;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: rgba(85, 85, 127, 1.0);
					width: 400px;
					font-size: 14px;
					height: 40px;
				}
				.el-input-number ::v-deep  .el-input__inner {
					text-align: left;
					border: 1px solid #E2E3E5;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: rgba(64, 158, 255, 1);
					width: 400px;
					font-size: 14px;
					height: 40px;
				}
				.el-input-number ::v-deep  .is-disabled .el-input__inner {
					text-align: left;
					border: 1px solid #E2E3E5;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: rgba(85, 85, 127, 1.0);
					width: 400px;
					font-size: 14px;
					height: 40px;
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
					border: 1px solid #E2E3E5;
					border-radius: 4px;
					padding: 0 10px;
					box-shadow: none;
					outline: none;
					color: rgba(64, 158, 255, 1);
					width: 200px;
					font-size: 14px;
					height: 40px;
				}
				.el-select ::v-deep  .is-disabled .el-input__inner {
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 10px;
					box-shadow: none;
					outline: none;
					color: rgba(85, 85, 127, 1.0);
					background: #eee;
					width: 200px;
					font-size: 14px;
					height: 40px;
				}
				.el-date-editor {
					width: 100%;
				}
				.el-date-editor ::v-deep  .el-input__inner {
					border: 1px solid #E2E3E5;
					border-radius: 4px;
					padding: 0 10px 0 30px;
					box-shadow: none;
					outline: none;
					color: rgba(64, 158, 255, 1);
					width: 200px;
					font-size: 14px;
					height: 40px;
				}
				.el-date-editor ::v-deep  .el-input__inner[readonly="readonly"] {
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 10px 0 30px;
					box-shadow: none;
					outline: none;
					color: rgba(85, 85, 127, 1.0);
					background: #eee;
					width: 200px;
					font-size: 14px;
					height: 40px;
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
					border: 1px solid #ddd;
					cursor: pointer;
					border-radius: 6px;
					color: #999;
					width: 90px;
					font-size: 32px;
					line-height: 60px;
					text-align: center;
					height: 60px;
				}
				::v-deep  .el-upload-list .el-upload-list__item {
					border: 1px solid #ddd;
					cursor: pointer;
					border-radius: 6px;
					color: #999;
					width: 90px;
					font-size: 32px;
					line-height: 60px;
					text-align: center;
					height: 60px;
					font-size: 14px;
					line-height: 1.8;
				}
				::v-deep  .el-upload .el-icon-plus {
					border: 1px solid #ddd;
					cursor: pointer;
					border-radius: 6px;
					color: #999;
					width: 90px;
					font-size: 32px;
					line-height: 60px;
					text-align: center;
					height: 60px;
				}
				::v-deep  .el-upload__tip {
					color: #666;
					font-size: 14px;
				}
				.el-textarea ::v-deep  .el-textarea__inner {
					border: 1px solid #E2E3E5;
					border-radius: 4px;
					padding: 12px;
					box-shadow: none;
					outline: none;
					color: rgba(64, 158, 255, 1);
					width: 400px;
					font-size: 14px;
					height: 120px;
				}
				.el-textarea ::v-deep  .el-textarea__inner[readonly="readonly"] {
					border: 1px solid #E2E3E5;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 12px;
					box-shadow: none;
					outline: none;
					color: rgba(85, 85, 127, 1.0);
					width: 400px;
					font-size: 14px;
					height: 120px;
				}
				::v-deep  .el-input__inner::placeholder {
					color: #123;
					font-size: 16px;
				}
				::v-deep  textarea::placeholder {
					color: #123;
					font-size: 16px;
				}
				.editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					box-shadow: none;
					margin: 0;
					width: 100%;
					border-color: #ccc;
					border-width: 0;
					border-style: solid;
					height: auto;
				}
				.upload-img {
					width: 150px;
					height: 150px;
				}
				.viewBtn {
					border: 0;
					cursor: pointer;
					padding: 0 10px;
					margin: 0;
					color: #fff;
					display: inline-block;
					font-size: 14px;
					line-height: 30px;
					border-radius: 4px;
					outline: none;
					background: rgba(64, 158, 255, 1);
					width: auto;
					height: 30px;
				}
				.viewBtn:hover {
					color: #666;
					background: rgba(64, 158, 255, .5);
				}
				.unviewBtn {
					border: 0;
					cursor: pointer;
					padding: 0 10px;
					margin: 0;
					color: #fff;
					display: inline-block;
					font-size: 14px;
					line-height: 30px;
					border-radius: 4px;
					outline: none;
					background: rgba(85, 85, 127, 1.0);
					width: auto;
					height: 30px;
				}
				.unviewBtn:hover {
					color: #666;
					background: rgba(85, 85, 127, .5);
				}
			}
			.add-btn-item {
				padding: 0;
				margin: 0;
				.submitBtn {
					border: 0;
					cursor: pointer;
					border-radius: 4px;
					padding: 0 15px;
					margin: 0 20px 0 0;
					outline: none;
					background: #896785;
					display: inline-block;
					width: auto;
					font-size: 14px;
					line-height: 40px;
					height: 40px;
					.icon {
						color: rgba(255, 255, 255, 1);
					}
					.text {
						color: rgba(255, 255, 255, 1);
					}
				}
				.submitBtn:hover {
					background: #896785;
					.icon {
						color: #000;
					}
					.text {
						color: #000;
					}
				}
				.closeBtn {
					cursor: pointer;
					border-radius: 4px;
					padding: 0 15px;
					margin: 0 20px 0 0;
					outline: none;
					background: #2D2747;
					display: inline-block;
					width: auto;
					font-size: 14px;
					line-height: 40px;
					height: 40px;
					.icon {
						color: #fff;
					}
					.text {
						color: #fff;
					}
				}
				.closeBtn:hover {
					color: #fff;
					border-color: #fff;
					.icon {
						color: #fff;
					}
					.text {
						color: #fff;
					}
				}
			}
		}
	}
	.el-date-editor.el-input {
		width: auto;
	}
</style>
