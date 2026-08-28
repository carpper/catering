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
				<el-form-item class="input" v-if="type!='info'"  label="岗位类型" prop="gangweileixing" >
					<el-input v-model="ruleForm.gangweileixing" placeholder="岗位类型" clearable  :readonly="ro.gangweileixing"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="岗位类型" prop="gangweileixing" >
					<el-input v-model="ruleForm.gangweileixing" placeholder="岗位类型" readonly></el-input>
				</el-form-item>
				<!-- 面试形式 -->
				<el-form-item class="select" v-if="type!='info'" label="面试形式" prop="mianshixingshi">
					<el-select :disabled="ro.mianshixingshi" v-model="ruleForm.mianshixingshi" placeholder="请选择面试形式">
						<el-option
								v-for="(item,index) in mianshixingshiOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item v-else class="input" label="面试形式" prop="mianshixingshi">
					<el-input v-model="ruleForm.mianshixingshi" placeholder="面试形式" readonly></el-input>
				</el-form-item>
				<!-- 面试地点/链接 -->
				<el-form-item class="input" v-if="type!='info'" label="面试地点/链接" prop="mianshididian">
					<el-input v-model="ruleForm.mianshididian" placeholder="现场面试请填写地址，视频面试请填写链接" clearable :readonly="ro.mianshididian"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="面试地点/链接" prop="mianshididian">
					<el-input v-model="ruleForm.mianshididian" placeholder="面试地点/链接" readonly></el-input>
				</el-form-item>
				<!-- 面试通知 -->
				<el-form-item class="input" v-if="type!='info'" label="面试通知" prop="mianshitongzhi">
					<el-input type="textarea" :rows="4" v-model="ruleForm.mianshitongzhi" placeholder="请输入面试通知内容，如：请携带简历、身份证等材料" clearable :readonly="ro.mianshitongzhi"></el-input>
				</el-form-item>
				<el-form-item v-else class="input" label="面试通知" prop="mianshitongzhi">
					<el-input type="textarea" :rows="4" v-model="ruleForm.mianshitongzhi" placeholder="面试通知" readonly></el-input>
				</el-form-item>
				<el-form-item class="date" v-if="type!='info'" label="面试时间" prop="mianshishijian" >
					<el-date-picker
						value-format="yyyy-MM-dd HH:mm:ss"
						v-model="ruleForm.mianshishijian" 
						type="datetime"
						:readonly="ro.mianshishijian"
						placeholder="面试时间"
					></el-date-picker>
				</el-form-item>
				<el-form-item class="input" v-else-if="ruleForm.mianshishijian" label="面试时间" prop="mianshishijian" >
					<el-input v-model="ruleForm.mianshishijian" placeholder="面试时间" readonly></el-input>
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
	export default {
		data() {
			return {
				id: '',
				type: '',
			
			
				ro:{
					qiyemingcheng : false,
					qiyetupian : false,
					fuzeren : false,
					qiyedizhi : false,
					gangweileixing : false,
					mianshixingshi : false,
					mianshididian : false,
					mianshitongzhi : false,
					mianshishijian : false,
					qiuzhizhanghao : false,
					qiuzhixingming : false,
				},

        ruleForm: {
          qiyemingcheng: '',
          qiyetupian: '',
          fuzeren: '',
          qiyedizhi: '',
          gangweileixing: '',
          mianshixingshi: '',
          mianshididian: '',
          mianshitongzhi: '',
          mianshishijian: '',
          qiuzhizhanghao: '',
          qiuzhixingming: '',
        },

        mianshixingshiOptions: [],

				rules: {
					qiyemingcheng: [
					],
					qiyetupian: [
					],
					fuzeren: [
					],
					qiyedizhi: [
					],
					gangweileixing: [
					],
					mianshixingshi: [
					],
					mianshididian: [
					],
					mianshitongzhi: [
					],
					mianshishijian: [
					],
					qiuzhizhanghao: [
					],
					qiuzhixingming: [
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
      this.mianshixingshiOptions = "现场面试,视频面试,电话面试".split(',');
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
            if(o=='gangweileixing'){
              this.ruleForm.gangweileixing = obj[o];
              this.ro.gangweileixing = true;
              continue;
            }
            // 面试时间由企业填写，不设为只读
            // if(o=='mianshishijian'){
            //   this.ruleForm.mianshishijian = obj[o];
            //   this.ro.mianshishijian = true;
            //   continue;
            // }
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
            if(((json.qiyetupian!=''&&json.qiyetupian) || json.qiyetupian==0) && this.$storage.get("role")!="管理员"){
              this.ruleForm.qiyetupian = json.qiyetupian
              this.ro.qiyetupian = true;
            }
            if(((json.fuzeren!=''&&json.fuzeren) || json.fuzeren==0) && this.$storage.get("role")!="管理员"){
              this.ruleForm.fuzeren = json.fuzeren
              this.ro.fuzeren = true;
            }
            if(((json.qiyedizhi!=''&&json.qiyedizhi) || json.qiyedizhi==0) && this.$storage.get("role")!="管理员"){
              this.ruleForm.qiyedizhi = json.qiyedizhi
              this.ro.qiyedizhi = true;
            }
          } else {
            this.$message.error(data.msg);
          }
        });
      },
			// 多级联动参数

			info(id) {
				this.$http({
					url: `mianshixinxi/info/${id}`,
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
								url: `mianshixinxi/${!this.ruleForm.id ? "save" : "update"}`,
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
											this.parent.mianshixinxiCrossAddOrUpdateFlag = false;
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
				this.parent.mianshixinxiCrossAddOrUpdateFlag = false;
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

/* 🔥 核心：强制所有文字 黑色 + 四号字 18px */
.add-update-preview ::v-deep .el-input__inner,
.add-update-preview ::v-deep .el-textarea__inner,
.add-update-preview ::v-deep .el-input__inner[readonly],
.add-update-preview ::v-deep .el-textarea__inner[readonly],
.add-update-preview ::v-deep .el-input.is-readonly .el-input__inner,
.add-update-preview ::v-deep .el-textarea.is-readonly .el-textarea__inner {
  color: #000 !important;
  font-size: 18px !important;
  opacity: 1 !important;
  -webkit-text-fill-color: #000 !important;
  background-color: #fff !important;
}

/* 标签也变黑四号字 */
.add-update-preview ::v-deep .el-form-item__label {
  color: #000 !important;
  font-size: 18px !important;
  background: #F3F4F3 !important;
}

.add-update-preview ::v-deep .el-form-item {
  width: 49%;
}
.add-update-preview ::v-deep .el-form-item__content {
  margin-left: 180px;
}
.add-update-preview ::v-deep .el-input__inner,
.add-update-preview ::v-deep .el-textarea__inner {
  height: 70px;
  line-height: 70px;
  border: 1px solid #C4C4C4;
  border-radius: 0;
  padding: 0 12px;
}
.add-update-preview ::v-deep .el-textarea__inner {
  min-height: 120px;
  line-height: 24px;
  padding: 12px;
}
.add-update-preview .el-form-item.btn {
  width: 100%;
  margin-top: 20px;
  display: flex;
}
</style>