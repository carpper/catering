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
				<el-form-item class="input" v-if="type!='info'"  label="性别" prop="xingbie" >
					<el-input v-model="ruleForm.xingbie" placeholder="性别" clearable  :readonly="ro.xingbie"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="性别" prop="xingbie" >
					<el-input v-model="ruleForm.xingbie" placeholder="性别" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" clearable  :readonly="ro.lianxidianhua"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="联系电话" prop="lianxidianhua" >
					<el-input v-model="ruleForm.lianxidianhua" placeholder="联系电话" readonly></el-input>
				</el-form-item>
				<el-form-item class="upload" v-if="type!='info' && !ro.touxiang" label="头像" prop="touxiang" >
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="touxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item class="upload" v-else-if="ruleForm.touxiang" label="头像" prop="touxiang" >
					<img v-if="ruleForm.touxiang.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.touxiang.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.touxiang.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="专业" prop="zhuanye" >
					<el-input v-model="ruleForm.zhuanye" placeholder="专业" clearable  :readonly="ro.zhuanye"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="专业" prop="zhuanye" >
					<el-input v-model="ruleForm.zhuanye" placeholder="专业" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="学历" prop="zizhi" >
					<el-select :disabled="ro.zizhi" v-model="ruleForm.zizhi" placeholder="请选择学历" >
						<el-option
							v-for="(item,index) in zizhiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="学历" prop="zizhi" >
					<el-input v-model="ruleForm.zizhi"
						placeholder="学历" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="出生日期" prop="chushengriqi" >
					<el-date-picker
						format="yyyy 年 MM 月 dd 日"
						value-format="yyyy-MM-dd"
						v-model="ruleForm.chushengriqi" 
						type="date"
						:readonly="ro.chushengriqi"
						placeholder="出生日期"
					></el-date-picker> 
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.chushengriqi" label="出生日期" prop="chushengriqi" >
					<el-input v-model="ruleForm.chushengriqi" placeholder="出生日期" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="求职意向" prop="qiuzhiyixiang" >
					<el-input v-model="ruleForm.qiuzhiyixiang" placeholder="求职意向" clearable  :readonly="ro.qiuzhiyixiang"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="求职意向" prop="qiuzhiyixiang" >
					<el-input v-model="ruleForm.qiuzhiyixiang" placeholder="求职意向" readonly></el-input>
				</el-form-item>
				<el-form-item class="select" v-if="type!='info'"  label="意向职位" prop="yixiangzhiwei" >
					<el-select :disabled="ro.yixiangzhiwei" v-model="ruleForm.yixiangzhiwei" placeholder="请选择意向职位" >
						<el-option
							v-for="(item,index) in yixiangzhiweiOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="意向职位" prop="yixiangzhiwei" >
					<el-input v-model="ruleForm.yixiangzhiwei"
						placeholder="意向职位" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="意向城市" prop="yixiangchengshi" >
					<el-input v-model="ruleForm.yixiangchengshi" placeholder="意向城市" clearable  :readonly="ro.yixiangchengshi"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="意向城市" prop="yixiangchengshi" >
					<el-input v-model="ruleForm.yixiangchengshi" placeholder="意向城市" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="薪资要求" prop="xinziyaoqiu" >
					<el-input v-model="ruleForm.xinziyaoqiu" placeholder="薪资要求" clearable  :readonly="ro.xinziyaoqiu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="薪资要求" prop="xinziyaoqiu" >
					<el-input v-model="ruleForm.xinziyaoqiu" placeholder="薪资要求" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="教育背景" prop="jiaoyubeijing" >
					<el-input v-model="ruleForm.jiaoyubeijing" placeholder="教育背景" clearable  :readonly="ro.jiaoyubeijing"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="教育背景" prop="jiaoyubeijing" >
					<el-input v-model="ruleForm.jiaoyubeijing" placeholder="教育背景" readonly></el-input>
				</el-form-item>
				<el-form-item class="input" v-if="type!='info'"  label="获奖证书" prop="huojiangzhengshu" >
					<el-input v-model="ruleForm.huojiangzhengshu" placeholder="获奖证书" clearable  :readonly="ro.huojiangzhengshu"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="获奖证书" prop="huojiangzhengshu" >
					<el-input v-model="ruleForm.huojiangzhengshu" placeholder="获奖证书" readonly></el-input>
				</el-form-item>
				<el-form-item class="upload" v-if="type!='info'&& !ro.jianliwenjian" label="简历文件" prop="jianliwenjian" >
					<file-upload
						tip="点击上传简历文件"
						action="file/upload"
						:limit="1"
						:type="3"
						:multiple="true"
						:fileUrls="ruleForm.jianliwenjian?ruleForm.jianliwenjian:''"
						@change="jianliwenjianUploadChange"
					></file-upload>
				</el-form-item>  
				<el-form-item v-else-if="ruleForm.jianliwenjian" label="简历文件" prop="jianliwenjian" >
					<el-button class="downBtn" type="text" size="small" @click="download($base.url+ruleForm.jianliwenjian)">
						<span class="icon iconfont icon-xiazai6"></span>
						下载
					</el-button>
				</el-form-item>
				<el-form-item v-else-if="!ruleForm.jianliwenjian" label="简历文件" prop="jianliwenjian" >
					<el-button class="unBtn" type="text" size="small">
						<span class="icon iconfont icon-xihuan"></span>
						暂无
					</el-button>
				</el-form-item>
			</template>
			<el-form-item class="textarea" v-if="type!='info'" label="工作经验" prop="gongzuojingyan" >
				<el-input
					style="min-width: 200px; max-width: 600px;"
					type="textarea"
					:rows="8"
					placeholder="工作经验"
					v-model="ruleForm.gongzuojingyan" >
				</el-input>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.gongzuojingyan" label="工作经验" prop="gongzuojingyan" >
				<span class="text">{{ruleForm.gongzuojingyan}}</span>
			</el-form-item>
			<el-form-item class="textarea" v-if="type!='info'" label="项目经验" prop="xiangmujingyan" >
				<el-input
					style="min-width: 200px; max-width: 600px;"
					type="textarea"
					:rows="8"
					placeholder="项目经验"
					v-model="ruleForm.xiangmujingyan" >
				</el-input>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.xiangmujingyan" label="项目经验" prop="xiangmujingyan" >
				<span class="text">{{ruleForm.xiangmujingyan}}</span>
			</el-form-item>
			<el-form-item class="textarea" v-if="type!='info'" label="个人技能" prop="gerenjineng" >
				<el-input
					style="min-width: 200px; max-width: 600px;"
					type="textarea"
					:rows="8"
					placeholder="个人技能"
					v-model="ruleForm.gerenjineng" >
				</el-input>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.gerenjineng" label="个人技能" prop="gerenjineng" >
				<span class="text">{{ruleForm.gerenjineng}}</span>
			</el-form-item>
			<el-form-item class="textarea" v-if="type!='info'" label="自我评价" prop="ziwopingjia" >
				<el-input
					style="min-width: 200px; max-width: 600px;"
					type="textarea"
					:rows="8"
					placeholder="自我评价"
					v-model="ruleForm.ziwopingjia" >
				</el-input>
			</el-form-item>
			<el-form-item v-else-if="ruleForm.ziwopingjia" label="自我评价" prop="ziwopingjia" >
				<span class="text">{{ruleForm.ziwopingjia}}</span>
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
					qiuzhizhanghao : false,
					qiuzhixingming : false,
					xingbie : false,
					lianxidianhua : false,
					touxiang : false,
					zhuanye : false,
					zizhi : false,
					chushengriqi : false,
					qiuzhiyixiang : false,
					yixiangzhiwei : false,
					yixiangchengshi : false,
					xinziyaoqiu : false,
					jiaoyubeijing : false,
					huojiangzhengshu : false,
					gongzuojingyan : false,
					xiangmujingyan : false,
					gerenjineng : false,
					ziwopingjia : false,
					jianliwenjian : false,
					storeupnum : false,
				},
			
				ruleForm: {
					qiuzhizhanghao: '',
					qiuzhixingming: '',
					xingbie: '',
					lianxidianhua: '',
					touxiang: '',
					zhuanye: '',
					zizhi: '',
					chushengriqi: '',
					qiuzhiyixiang: '',
					yixiangzhiwei: '',
					yixiangchengshi: '',
					xinziyaoqiu: '',
					jiaoyubeijing: '',
					huojiangzhengshu: '',
					gongzuojingyan: '',
					xiangmujingyan: '',
					gerenjineng: '',
					ziwopingjia: '',
					jianliwenjian: '',
				},
		
				zizhiOptions: [],
				yixiangzhiweiOptions: [],

				rules: {
					qiuzhizhanghao: [
					],
					qiuzhixingming: [
					],
					xingbie: [
					],
					lianxidianhua: [
					],
					touxiang: [
					],
					zhuanye: [
					],
					zizhi: [
					],
					chushengriqi: [
					],
					qiuzhiyixiang: [
					],
					yixiangzhiwei: [
					],
					yixiangchengshi: [
					],
					xinziyaoqiu: [
					],
					jiaoyubeijing: [
					],
					huojiangzhengshu: [
					],
					gongzuojingyan: [
					],
					xiangmujingyan: [
					],
					gerenjineng: [
					],
					ziwopingjia: [
					],
					jianliwenjian: [
					],
					storeupnum: [
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
			this.ruleForm.chushengriqi = this.getCurDate()
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
						if(o=='xingbie'){
							this.ruleForm.xingbie = obj[o];
							this.ro.xingbie = true;
							continue;
						}
						if(o=='lianxidianhua'){
							this.ruleForm.lianxidianhua = obj[o];
							this.ro.lianxidianhua = true;
							continue;
						}
						if(o=='touxiang'){
							this.ruleForm.touxiang = obj[o];
							this.ro.touxiang = true;
							continue;
						}
						if(o=='zhuanye'){
							this.ruleForm.zhuanye = obj[o];
							this.ro.zhuanye = true;
							continue;
						}
						if(o=='zizhi'){
							this.ruleForm.zizhi = obj[o];
							this.ro.zizhi = true;
							continue;
						}
						if(o=='chushengriqi'){
							this.ruleForm.chushengriqi = obj[o];
							this.ro.chushengriqi = true;
							continue;
						}
						if(o=='qiuzhiyixiang'){
							this.ruleForm.qiuzhiyixiang = obj[o];
							this.ro.qiuzhiyixiang = true;
							continue;
						}
						if(o=='yixiangzhiwei'){
							this.ruleForm.yixiangzhiwei = obj[o];
							this.ro.yixiangzhiwei = true;
							continue;
						}
						if(o=='yixiangchengshi'){
							this.ruleForm.yixiangchengshi = obj[o];
							this.ro.yixiangchengshi = true;
							continue;
						}
						if(o=='xinziyaoqiu'){
							this.ruleForm.xinziyaoqiu = obj[o];
							this.ro.xinziyaoqiu = true;
							continue;
						}
						if(o=='jiaoyubeijing'){
							this.ruleForm.jiaoyubeijing = obj[o];
							this.ro.jiaoyubeijing = true;
							continue;
						}
						if(o=='huojiangzhengshu'){
							this.ruleForm.huojiangzhengshu = obj[o];
							this.ro.huojiangzhengshu = true;
							continue;
						}
						if(o=='gongzuojingyan'){
							this.ruleForm.gongzuojingyan = obj[o];
							this.ro.gongzuojingyan = true;
							continue;
						}
						if(o=='xiangmujingyan'){
							this.ruleForm.xiangmujingyan = obj[o];
							this.ro.xiangmujingyan = true;
							continue;
						}
						if(o=='gerenjineng'){
							this.ruleForm.gerenjineng = obj[o];
							this.ro.gerenjineng = true;
							continue;
						}
						if(o=='ziwopingjia'){
							this.ruleForm.ziwopingjia = obj[o];
							this.ro.ziwopingjia = true;
							continue;
						}
						if(o=='jianliwenjian'){
							this.ruleForm.jianliwenjian = obj[o];
							this.ro.jianliwenjian = true;
							continue;
						}
						if(o=='storeupnum'){
							this.ruleForm.storeupnum = obj[o];
							this.ro.storeupnum = true;
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
						if(((json.qiuzhizhanghao!=''&&json.qiuzhizhanghao) || json.qiuzhizhanghao==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiuzhizhanghao = json.qiuzhizhanghao
							this.ro.qiuzhizhanghao = true;
						}
						if(((json.qiuzhixingming!=''&&json.qiuzhixingming) || json.qiuzhixingming==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.qiuzhixingming = json.qiuzhixingming
							this.ro.qiuzhixingming = true;
						}
						if(((json.xingbie!=''&&json.xingbie) || json.xingbie==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.xingbie = json.xingbie
							this.ro.xingbie = true;
						}
						if(((json.lianxidianhua!=''&&json.lianxidianhua) || json.lianxidianhua==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.lianxidianhua = json.lianxidianhua
							this.ro.lianxidianhua = true;
						}
						if(((json.touxiang!=''&&json.touxiang) || json.touxiang==0) && this.$storage.get("role")!="管理员"){
							this.ruleForm.touxiang = json.touxiang
							this.ro.touxiang = true;
						}
					} else {
						this.$message.error(data.msg);
					}
				});
				this.zizhiOptions = "国家职业资格五级,国家职业资格四级,国家职业资格三级,国家职业资格二级,国家职业资格一级,其他".split(',')
				this.$http({
					url: `option/gangweifenlei/gangweileixing`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.yixiangzhiweiOptions = data.data;
					} else {
						this.$message.error(data.msg);
					}
				});
			
			},
			// 多级联动参数

			info(id) {
				this.$http({
					url: `jianlixinxi/info/${id}`,
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
					if(this.ruleForm.touxiang!=null) {
						this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
					}
					if(this.ruleForm.jianliwenjian!=null) {
						this.ruleForm.jianliwenjian = this.ruleForm.jianliwenjian.replace(new RegExp(this.$base.url,"g"),"");
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
								url: `jianlixinxi/${!this.ruleForm.id ? "save" : "update"}`,
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
											this.parent.jianlixinxiCrossAddOrUpdateFlag = false;
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
				this.parent.jianlixinxiCrossAddOrUpdateFlag = false;
				this.parent.contentStyleChange();
			},
			touxiangUploadChange(fileUrls) {
				this.ruleForm.touxiang = fileUrls;
			},
			jianliwenjianUploadChange(fileUrls) {
				this.ruleForm.jianliwenjian = fileUrls;
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
