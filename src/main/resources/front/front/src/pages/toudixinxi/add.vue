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
      <el-form-item class="add-item" label="企业地址" prop="qiyedizhi">
        <el-input v-model="ruleForm.qiyedizhi"
                  placeholder="企业地址" clearable :disabled=" false  ||ro.qiyedizhi"></el-input>
      </el-form-item>
      <el-form-item class="add-item" label="地区" prop="diqu">
        <el-input v-model="ruleForm.diqu"
                  placeholder="地区" clearable :disabled=" false  ||ro.diqu"></el-input>
      </el-form-item>
      <el-form-item class="add-item" label="岗位类型" prop="gangweileixing">
        <el-input v-model="ruleForm.gangweileixing"
                  placeholder="岗位类型" clearable :disabled=" false  ||ro.gangweileixing"></el-input>
      </el-form-item>
      <el-form-item class="add-item"  label="求职状态" prop="qiuzhizhuangtai">
        <el-select v-model="ruleForm.qiuzhizhuangtai" placeholder="请选择求职状态" :disabled="true  ||ro.qiuzhizhuangtai" >
          <el-option
              v-for="(item,index) in qiuzhizhuangtaiOptions"
              :key="index"
              :label="item"
              :value="item">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item class="add-item" label="投递时间" prop="toudishijian">
        <el-date-picker
            :disabled=" false  ||ro.toudishijian"
            value-format="yyyy-MM-dd HH:mm:ss"
            v-model="ruleForm.toudishijian"
            type="datetime"
            placeholder="投递时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item class="add-item" label="求职账号" prop="qiuzhizhanghao">
        <el-input v-model="ruleForm.qiuzhizhanghao"
                  placeholder="求职账号" clearable :disabled=" false  ||ro.qiuzhizhanghao"></el-input>
      </el-form-item>
      <el-form-item class="add-item" label="求职姓名" prop="qiuzhixingming">
        <el-input v-model="ruleForm.qiuzhixingming"
                  placeholder="求职姓名" clearable :disabled=" false  ||ro.qiuzhixingming"></el-input>
      </el-form-item>
      <el-form-item class="add-item" label="联系电话" prop="lianxidianhua">
        <el-input v-model="ruleForm.lianxidianhua"
                  placeholder="联系电话" clearable :disabled=" false  ||ro.lianxidianhua"></el-input>
      </el-form-item>
      <el-form-item class="add-item" label="个人简历" prop="gerenjianli">
        <file-upload
            tip="点击上传个人简历"
            action="file/upload"
            :limit="1"
            :type="3"
            :multiple="true"
            :fileUrls="ruleForm.gerenjianli?ruleForm.gerenjianli:''"
            @change="gerenjianliUploadChange"
        ></file-upload>
        <!-- 添加选择简历按钮 -->
        <el-button @click="selectResume" type="primary" size="small" style="margin-top: 10px;">从简历库选择</el-button>
      </el-form-item>
      <el-form-item class="add-item" label="个人经历" prop="gerenjingli">
        <el-input
            type="textarea"
            :rows="8"
            placeholder="个人经历"
            v-model="ruleForm.gerenjingli">
        </el-input>
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

    <!-- 简历选择弹窗 -->
    <el-dialog title="选择简历" :visible.sync="resumeDialogVisible" width="80%">
      <el-table
          :data="resumeList"
          @current-change="handleCurrentChange"
          highlight-current-row
          ref="resumeTable">
        <!-- 注意：移除了 type="selection" 列，改用 current-row 方式 -->
        <el-table-column prop="qiuzhixingming" label="求职姓名" width="120"></el-table-column>
        <el-table-column prop="yixiangzhiwei" label="意向职位" width="150"></el-table-column>
        <el-table-column prop="addtime" label="创建时间" width="180"></el-table-column>
        <el-table-column prop="zhuanye" label="专业"></el-table-column>
        <el-table-column prop="zizhi" label="学历" width="120"></el-table-column>
        <el-table-column label="操作" width="100">
          <template slot-scope="scope">
            <el-button @click="previewResume(scope.row)" type="text" size="small">下载简历</el-button>
          </template>
        </el-table-column>
      </el-table>

      <span slot="footer" class="dialog-footer">
                <el-button @click="resumeDialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="confirmResumeSelection">确 定</el-button>
            </span>
    </el-dialog>
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
      type: '',
      userTableName: localStorage.getItem('UserTableName'),
      ruleForm: {
        qiyemingcheng: '',
        qiyetupian: '',
        fuzeren: '',
        qiyedizhi: '',
        diqu: '',
        gangweileixing: '',
        qiuzhizhuangtai: '待通知' ,
        toudishijian: '',
        qiuzhizhanghao: '',
        qiuzhixingming: '',
        lianxidianhua: '',
        gerenjingli: '',
        gerenjianli: '',
      },
      qiuzhizhuangtaiOptions: [],
      // 新增简历相关数据
      resumeDialogVisible: false,
      resumeList: [],
      selectedResume: null,


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
          { validator: this.$validate.isMobile, trigger: 'blur' },
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
    this.ruleForm.toudishijian = this.getCurDateTime()
  },
  methods: {
    getMakeZero(s) {
      return s < 10 ? '0' + s : s;
    },
    // 下载
    download(file){
      window.open(`${file}`)
    },
    // 处理当前行变化
    handleCurrentChange(currentRow, oldCurrentRow) {
      this.selectedResume = currentRow;
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
      }else if(type=='edit'){
        this.info()
      }
      // 获取用户信息
      this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
        if (res.data.code == 0) {
          var json = res.data.data;
          if((json.qiuzhizhanghao!=''&&json.qiuzhizhanghao) || json.qiuzhizhanghao==0){
            this.ruleForm.qiuzhizhanghao = json.qiuzhizhanghao;
            this.ro.qiuzhizhanghao = true;
          }
          if((json.qiuzhixingming!=''&&json.qiuzhixingming) || json.qiuzhixingming==0){
            this.ruleForm.qiuzhixingming = json.qiuzhixingming;
            this.ro.qiuzhixingming = true;
          }
          if((json.lianxidianhua!=''&&json.lianxidianhua) || json.lianxidianhua==0){
            this.ruleForm.lianxidianhua = json.lianxidianhua;
            this.ro.lianxidianhua = true;
          }
        }
      });
      this.qiuzhizhuangtaiOptions = "已邀请,待通知".split(',')

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
      this.$http.get(`toudixinxi/detail/${this.$route.query.id}`, {emulateJSON: true}).then(res => {
        if (res.data.code == 0) {
          this.ruleForm = res.data.data;
        }
      });
    },
    // 检查是否可以投递
    async checkCanSubmit() {
      const qiyemingcheng = this.ruleForm.qiyemingcheng;
      const gangweileixing = this.ruleForm.gangweileixing;
      const qiuzhizhanghao = this.ruleForm.qiuzhizhanghao;
      
      console.log('检查投递参数:', {qiyemingcheng, gangweileixing, qiuzhizhanghao});
      
      if (!qiyemingcheng || !gangweileixing || !qiuzhizhanghao) {
        console.log('必填字段不全，跳过检查');
        return true; // 必填字段不全，让表单验证处理
      }
      
      // 首先检查是否已被其他企业录用（一个人只能被录用一次）
      const luyongRes = await this.$http.get('luyongxinxi/list', {
        params: {
          page: 1,
          limit: 1,
          qiuzhizhanghao: qiuzhizhanghao
        }
      });
      
      console.log('录用记录查询结果:', luyongRes.data);
      
      if (luyongRes.data.code === 0 && luyongRes.data.data.list && luyongRes.data.data.list.length > 0) {
        const luyongInfo = luyongRes.data.data.list[0];
        console.log('已有录用记录:', luyongInfo);
        // 检查是否是当前企业录用的
        if (luyongInfo.qiyemingcheng === qiyemingcheng && luyongInfo.gangweileixing === gangweileixing) {
          console.log('当前企业岗位已录用，不允许投递');
          this.$message.warning('您已被该企业录用，不能重复投递');
          return false;
        } else {
          console.log('已被其他企业录用，不允许投递');
          this.$message.warning('您已被其他企业录用，不能再投递');
          return false;
        }
      }
      
      // 查询是否有待处理的投递记录
      const res = await this.$http.get('toudixinxi/list', {
        params: {
          page: 1,
          limit: 100,
          qiyemingcheng: qiyemingcheng,
          gangweileixing: gangweileixing,
          qiuzhizhanghao: qiuzhizhanghao
        }
      });
      
      console.log('投递记录查询结果:', res.data);
      
      if (res.data.code !== 0 || !res.data.data.list || res.data.data.list.length === 0) {
        console.log('没有投递记录，可以投递');
        return true; // 没有投递记录，可以投递
      }
      
      // 有投递记录，检查是否有面试结果
      const toudiList = res.data.data.list;
      console.log('已有投递记录:', toudiList);
      
      // 查询该投递是否有面试记录（必须匹配企业和岗位）
      const mianshiRes = await this.$http.get('mianshixinxi/list', {
        params: {
          page: 1,
          limit: 1,
          qiyemingcheng: qiyemingcheng,
          gangweileixing: gangweileixing,
          qiuzhizhanghao: qiuzhizhanghao
        }
      });
      
      console.log('面试信息查询结果:', mianshiRes.data);
      
      if (mianshiRes.data.code === 0 && mianshiRes.data.data.list && mianshiRes.data.data.list.length > 0) {
        const mianshi = mianshiRes.data.data.list[0];
        console.log('找到面试信息:', mianshi);
        // 有面试记录，检查是否有面试结果
        if (mianshi.mianshijieguo && (mianshi.mianshijieguo === '已录用' || mianshi.mianshijieguo === '未录用')) {
          // 面试已结束（已录用或未录用），可以投递
          console.log('面试已结束，允许重新投递');
          return true;
        } else {
          // 有面试记录但还没结果（待审核/已邀请等）
          console.log('面试进行中，不允许投递');
          this.$message.warning('您已投递该企业该岗位，等面试结束后才能重新投递');
          return false;
        }
      } else {
        // 没有面试记录，说明投递还在待处理中
        console.log('没有面试记录，不允许投递');
        this.$message.warning('您已投递该企业该岗位，等面试结束后才能重新投递');
        return false;
      }
      
      return true;
    },
    
    // 提交
    async onSubmit() {
      await this.$refs["ruleForm"].validate(async valid => {
        if(valid) {
          // 检查是否重复投递：同一企业同一岗位只能投递一次
          if (!this.ruleForm.id) {
            // 新增投递时检查
            const canSubmit = await this.checkCanSubmit();
            if (!canSubmit) {
              return;
            }
          }
          
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


          await this.$http.post(`toudixinxi/${this.ruleForm.id?'update':this.centerType?'save':'add'}`, this.ruleForm).then(async res => {
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
    gerenjianliUploadChange(fileUrls) {
      this.ruleForm.gerenjianli = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
    },

    // 新增方法：选择简历
    selectResume() {
      this.loadResumes();
      this.resumeDialogVisible = true;
    },

    // 加载简历列表
    loadResumes() {
      this.$http.get('jianlixinxi/lists', {emulateJSON: true}).then(res => {
        if (res.data.code == 0) {
          this.resumeList = res.data.data;
        } else {
          this.$message.error('获取简历列表失败');
        }
      }).catch(err => {
        this.$message.error('获取简历列表失败: ' + err.message);
      });
    },

    // 处理简历选择变化
    handleResumeSelection(selection) {
      if (selection.length > 0) {
        this.selectedResume = selection[0];
      } else {
        this.selectedResume = null;
      }
    },

    // 确认选择简历
    confirmResumeSelection() {
      if (!this.selectedResume) {
        this.$message.warning('请先选择一份简历');
        return;
      }

      // 将选中的简历文件路径赋值给gerenjianli字段
      this.ruleForm.gerenjianli = this.selectedResume.jianliwenjian;
      this.resumeDialogVisible = false;
      this.$message.success('简历选择成功');
    },

    // 预览简历
    previewResume(row) {
      if (row.jianliwenjian) {
        window.open(this.baseUrl + row.jianliwenjian);
      } else {
        this.$message.warning('该简历没有附件');
      }
    }
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
