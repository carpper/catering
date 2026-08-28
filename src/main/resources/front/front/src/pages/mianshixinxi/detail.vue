<template>
  <div>
    <!--  -->
    <div class="breadcrumb-preview">
      <el-breadcrumb :separator="'Ξ'">
        <el-breadcrumb-item class="item1" to="/"><a>首页</a></el-breadcrumb-item>
        <el-breadcrumb-item class="item2" v-for="(item, index) in breadcrumbItem" :key="index" :to="'/index/mianshixinxi?centerType=' + (centerType?'1':'0')"><a>{{item.name}}</a></el-breadcrumb-item>
        <el-breadcrumb-item class="item3"><a href="javascript:void(0);">详情</a></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div class="back_box">
      <el-button class="backBtn" size="mini" @click="backClick">
        <span class="icon iconfont icon-jiantou33"></span>
        <span class="text">返回</span>
      </el-button>
    </div>
    <div class="detail-preview">
      <div class="attr">
        <div class="info">
          <div class="title-item">
            <div class="detail-title">
              {{detail.qiyemingcheng}}
            </div>
          </div>
          <div class="item">
            <div class="lable">负责人</div>
            <div class="text ">{{detail.fuzeren}}</div>
          </div>
          <div class="item">
            <div class="lable">企业地址</div>
            <div class="text ">{{detail.qiyedizhi}}</div>
          </div>
          <div class="item">
            <div class="lable">岗位类型</div>
            <div class="text ">{{detail.gangweileixing}}</div>
          </div>
          <div class="item">
            <div class="lable">面试结果</div>
            <div class="text ">{{detail.mianshijieguo}}</div>
          </div>
          <div class="item">
            <div class="lable">面试时间</div>
            <div class="text ">{{detail.mianshishijian}}</div>
          </div>
          <!-- 添加面试形式显示 -->
          <div class="item">
            <div class="lable">面试方式</div>
            <div class="text ">{{detail.mianshixingshi}}</div>
          </div>
          <!-- 添加面试地点/链接显示 -->
          <div class="item" v-if="detail.mianshididian">
            <div class="lable">面试地点/链接</div>
            <div class="text ">{{detail.mianshididian}}</div>
          </div>
          <!-- 添加面试通知显示 -->
          <div class="item" v-if="detail.mianshitongzhi">
            <div class="lable">面试通知</div>
            <div class="text " style="white-space: pre-wrap;">{{detail.mianshitongzhi}}</div>
          </div>
          <!-- 添加是否参加显示 -->
          <div class="item">
            <div class="lable">是否参加</div>
            <div class="text ">{{detail.shifoucanchu}}</div>
          </div>
          <div class="item">
            <div class="lable">求职账号</div>
            <div class="text ">{{detail.qiuzhizhanghao}}</div>
          </div>
          <div class="item">
            <div class="lable">求职姓名</div>
            <div class="text ">{{detail.qiuzhixingming}}</div>
          </div>
          <div class="btn_box">
            <!-- 删除修改功能，只允许删除 -->
            <el-button class="delBtn" v-if="btnAuth('mianshixinxi','删除')" @click="delClick">删除</el-button>
            <!-- 添加是否确认参加按钮 -->
            <!-- 只有求职者本人才能看到确认参加按钮 -->
            <el-button class="confirmBtn" v-if="detail.shifoucanchu === '未确认' && detail.qiuzhizhanghao === currentQiuzhizhanghao" @click="confirmAttendance" type="primary">确认是否参加</el-button>
            <el-button class="reserveBtn"
                       v-if="btnAuth('mianshixinxi','录用通知')"
                       @click="onAcross('luyongxinxi','','','mianshijieguo','已录用','已录用,未录用'.split(',')[0])" type="warning">
              录用通知
            </el-button>
          </div>
        </div>
      </div>

      <div class="detail-swpier2" v-if="detailBanner.length">
        <div class="swiper21">
          <div class="swiper-container mySwiper21">
            <div class="swiper-wrapper">
              <div class="swiper-slide" v-for="item in detailBanner" :key="item.id">
                <div class="swiper-item">
                  <img v-if="item.substr(0,4)=='http'" :src="item" class="image">
                  <img v-else :src="baseUrl + item" class="image">
                </div>
              </div>
            </div>
            <div class="swiper-button-prev">
              <span class="icon iconfont icon-jiantou39"></span>
            </div>
            <div class="swiper-button-next">
              <span class="icon iconfont icon-jiantou18"></span>
            </div>
          </div>
        </div>
        <div class="swiper22">
          <div class="swiper-container mySwiper22">
            <div class="swiper-wrapper">
              <div class="swiper-slide" v-for="item in detailBanner" :key="item.id">
                <div class="swiper-item">
                  <img v-if="item.substr(0,4)=='http'" :src="item" class="image">
                  <img v-else :src="baseUrl + item" class="image">
                </div>
              </div>
            </div>
            <div class="swiper-button-prev">
              <span class="icon iconfont icon-jiantou39"></span>
            </div>
            <div class="swiper-button-next">
              <span class="icon iconfont icon-jiantou18"></span>
            </div>
          </div>
        </div>
      </div>

      <el-tabs class="detail-tabs" v-model="activeName" type="border-card">
      </el-tabs>

      <div class="idea1"></div>
    </div>
    <div class="share_view">
    </div>

    <!-- 添加确认参加对话框 -->
    <el-dialog title="确认是否参加面试" :visible.sync="confirmDialogVisible" width="30%">
      <el-form>
        <el-form-item label="是否参加">
          <el-radio-group v-model="attendanceChoice">
            <el-radio label="是">参加</el-radio>
            <el-radio label="否">不参加</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="confirmDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitAttendance">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import axios from 'axios'
import Swiper from "swiper";
export default {
  //数据集合
  data() {
    return {
      tablename: 'mianshixinxi',
      baseUrl: '',
      breadcrumbItem: [
        {
          name: '面试信息'
        }
      ],
      title: '',
      detailBanner: [],
      userid: localStorage.getItem('frontUserid'),
      // 获取当前登录用户的求职账号
      currentQiuzhizhanghao: localStorage.getItem('sessionForm') ? JSON.parse(localStorage.getItem('sessionForm')).qiuzhizhanghao : '',
      id: 0,
      detail: {},
      activeName: 'first',
      total: 1,
      pageSize: 5,
      totalPage: 1,
      buynumber: 1,
      centerType: false,
      shareUrl: location.href,
      sensitiveWordsArr: [],
      // 添加确认参加相关数据
      confirmDialogVisible: false,
      attendanceChoice: '是'
    }
  },
  created() {
    if(this.$route.query.centerType&&this.$route.query.centerType!=0) {
      this.centerType = true
    }

    this.init();
  },
  mounted() {
    setTimeout(()=>{
      let mySwiper22 = new Swiper(".mySwiper22", {"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"freeMode":true,"watchSlidesVisibility":true,"watchSlidesProgress":true,"loopedSlides":5,"slidesPerView":4,"spaceBetween":10})
      let option21 = {...{"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"loopedSlides":5,"spaceBetween":10}}
      option21.thumbs = {
        swiper: mySwiper22
      }
      new Swiper(".mySwiper21", option21)
    },100)
  },
  //方法集合
  methods: {
    init() {
      this.id = this.$route.query.id
      this.baseUrl = this.$config.baseUrl;
      this.$http.get(this.tablename + '/detail/'  + this.id, {}).then(res => {
        if (res.data.code == 0) {
          this.detail = res.data.data;
          // 获取数据库敏感词
          this.getSensitiveWords()
          this.title = this.detail.qiyemingcheng;
          this.detailBanner = this.detail.qiyetupian ? this.detail.qiyetupian.split(",") : [];
          this.$forceUpdate();
          if(localStorage.getItem('frontToken')){
          }

        }
      });
    },
    getSensitiveWords(){
      this.$http.get('sensitivewords/detail/1').then(rs=>{
        this.sensitiveWordsArr = rs.data.data.content.split(',')
      })
    },
    async onAcross(acrossTable,crossOptAudit,crossOptPay,statusColumnName,tips,statusColumnValue,type=1){
      localStorage.setItem('crossTable',`mianshixinxi`);
      localStorage.setItem('crossObj', JSON.stringify(this.detail));
      localStorage.setItem('statusColumnName',statusColumnName);
      localStorage.setItem('statusColumnValue',statusColumnValue);
      localStorage.setItem('tips',tips);
      if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
        var obj = JSON.parse(localStorage.getItem('crossObj'));
        for (var o in obj){
          if(o==statusColumnName && obj[o]==statusColumnValue){
            this.$message({
              type: 'error',
              message: tips,
              duration: 1500
            });
            return
          }
        }
      }
      this.$router.push({path: '/index/' + acrossTable + 'Add', query: {type: 'cross'}});
    },
    curChange(page) {
      this.getDiscussList(page);
    },
    prevClick(page) {
      this.getDiscussList(page);
    },
    nextClick(page) {
      this.getDiscussList(page);
    },
    sizeChange(size){
      this.pageSize = size
      this.getDiscussList(1);
    },
    // 返回按钮
    backClick(){
      let params = {}
      if(this.centerType){
        params.centerType = 1
      }
      this.$router.push({path: '/index/mianshixinxi', query: params});
    },
    // 下载
    download(file ){
      if(!file) {
        this.$message({
          type: 'error',
          message: '文件不存在',
          duration: 1500,
        });
        return;
      }
      let arr = file.replace(new RegExp('upload/', "g"), "")
      axios.get(this.baseUrl + '/file/download?fileName=' + arr, {
        headers: {
          token: localStorage.getItem("frontToken")
        },
        responseType: "blob"
      }).then(({
                 data
               }) => {
        const binaryData = [];
        binaryData.push(data);
        const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
          type: 'application/pdf;chartset=UTF-8'
        }))
        const a = document.createElement('a')
        a.href = objectUrl
        a.download = arr
        // a.click()
        // 下面这个写法兼容火狐
        a.dispatchEvent(new MouseEvent('click', {
          bubbles: true,
          cancelable: true,
          view: window
        }))
        window.URL.revokeObjectURL(data)
      },err=>{
        axios.get((location.href.split(this.$config.name).length>1 ? location.href.split(this.$config.name)[0] :'') + this.$config.name + '/file/download?fileName=' + arr, {
          headers: {
            token: localStorage.getItem("frontToken")
          },
          responseType: "blob"
        }).then(({
                   data
                 }) => {
          const binaryData = [];
          binaryData.push(data);
          const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
            type: 'application/pdf;chartset=UTF-8'
          }))
          const a = document.createElement('a')
          a.href = objectUrl
          a.download = arr
          // a.click()
          // 下面这个写法兼容火狐
          a.dispatchEvent(new MouseEvent('click', {
            bubbles: true,
            cancelable: true,
            view: window
          }))
          window.URL.revokeObjectURL(data)
        })
      })
    },


    // 权限判断
    btnAuth(tableName,key){
      if(this.centerType){
        return this.isBackAuth(tableName,key)
      }else{
        return this.isAuth(tableName,key)
      }
    },
    // 修改
    editClick(){
      this.$router.push(`/index/mianshixinxiAdd?type=edit&&id=${this.detail.id}`);
    },
    // 删除
    async delClick(){
      await this.$confirm('是否删除此面试信息？') .then(_ => {
        this.$http.post('mianshixinxi/delete', [this.detail.id]).then(async res => {
          if (res.data.code == 0) {
            this.$message({
              type: 'success',
              message: '删除成功!',
              duration: 1500,
              onClose: () => {
                history.back()
              }
            });
          }
        });
      }).catch(_ => {});
    },
    // 添加确认参加相关方法
    confirmAttendance() {
      this.attendanceChoice = '是'; // 默认选择参加
      this.confirmDialogVisible = true;
    },
    submitAttendance() {
      // 创建更新对象
      const updateData = {
        id: this.detail.id,
        shifoucanchu: this.attendanceChoice
      };

      // 调用更新接口
      this.$http.post('mianshixinxi/update', updateData).then(res => {
        if (res.data.code == 0) {
          this.$message({
            type: 'success',
            message: '确认成功!',
            duration: 1500
          });
          // 更新本地数据
          this.detail.shifoucanchu = this.attendanceChoice;
          // 关闭对话框
          this.confirmDialogVisible = false;
        } else {
          this.$message({
            type: 'error',
            message: '确认失败: ' + res.data.msg,
            duration: 1500
          });
        }
      }).catch(err => {
        this.$message({
          type: 'error',
          message: '确认失败，请稍后重试',
          duration: 1500
        });
      });
    }
  },
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.detail-preview {
  padding: 0 0 40px 0;
  margin: 10px auto;
  display: flex;
  width: 1270px;
  position: relative;
  flex-wrap: wrap;
  .attr {
    padding: 30px;
    margin: 0 0 0 30px;
    background: #FFFFFF;
    flex: none;
    display: flex;
    width: 620px;
    position: relative;
    order: 2;
    .info {
      padding: 0;
      margin: 0;
      background: #fff;
      flex: 1;
      .title-item {
        padding: 0 0 0 20px;
        box-shadow: inset 0px 4px 10px 0px rgba(178,178,178,0.3);
        margin: 0 0 10px 0;
        background: #FFFFFF;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 70px;
        .detail-title {
          color: #333;
          font-weight: 700;
          font-size: 16px;
        }
      }
      .item {
        padding: 5px;
        box-shadow: inset 0px 4px 10px 0px rgba(178,178,178,0.3);
        margin: 0 0 10px 0;
        color: #000000;
        background: #FFF;
        display: flex;
        justify-content: space-between;
        .lable {
          padding: 0 10px;
          color: #9E9E9E;
          white-space: nowrap;
          width: auto;
          font-size: 14px;
          line-height: 40px;
          text-align: right;
          height: 40px;
        }
        .text {
          padding: 8px 10px 0 0;
          color: #000000;
          flex: 1;
          font-size: 14px;
          line-height: 24px;
          height: auto;
        }
        .price {
          color: #f00;
        }
        .bold {
          font-weight: bold;
        }
        .link {
          cursor: pointer;
          text-decoration: underline;
        }
      }
      .btn_box {
        padding: 10px 0;
        display: flex;
        flex-wrap: wrap;
      }
      .editBtn {
        border: 0;
        cursor: pointer;
        border-radius: 4px;
        padding: 0 10px;
        margin: 0 5px 0 0;
        outline: none;
        color: #fff;
        background: #7565F0;
        width: auto;
        font-size: 14px;
        line-height: 40px;
        height: 40px;
      }
      .editBtn:hover {
        background: #7565F0;
      }
      .delBtn {
        border: 0;
        cursor: pointer;
        border-radius: 4px;
        padding: 0 10px;
        margin: 0 5px 0 0;
        outline: none;
        color: #fff;
        background: #71CAD8;
        width: auto;
        font-size: 14px;
        line-height: 40px;
        height: 40px;
      }
      .delBtn:hover {
        background: #71CAD8;
      }
      .confirmBtn {
        border: 0;
        cursor: pointer;
        border-radius: 4px;
        padding: 0 10px;
        margin: 0 5px 0 0;
        outline: none;
        color: #fff;
        background: #409EFF;
        width: auto;
        font-size: 14px;
        line-height: 40px;
        height: 40px;
      }
      .confirmBtn:hover {
        background: #409EFF;
      }
    }
  }
  .detail-swpier2 {
    padding: 70px 30px 0 0;
    margin: 0;
    flex: none;
    background: #FFF;
    width: 590px;
    height: auto;
    order: 3;
    .swiper21 {
      margin: 0 0 20px 0;
      width: 560px;
      align-items: center;
      height: auto;
      .swiper-button-prev:after {
        display:none;
      }
      .swiper-button-next:after {
        display:none;
      }
      .swiper-item {
        width: 100%;
        height: auto;
        img {
          object-fit: cover;
          width: 100%;
          height: 400px;
        }
      }
      .swiper-button-prev {
        margin: -12px 0 0;
        top: 50%;
        width: 24px;
        height: 24px;
        .icon {
          color: #fff;
          width: 24px;
          font-size: 24px;
          height: 24px;
        }
      }
      .swiper-button-next {
        margin: -12px 0 0;
        top: 50%;
        width: 24px;
        height: 24px;
        .icon {
          color: #fff;
          width: 24px;
          font-size: 24px;
          height: 24px;
        }
      }
    }
    .swiper22 {
      width: 560px;
      height: auto;

      .swiper-button-prev:after {
        display:none;
      }
      .swiper-button-next:after {
        display:none;
      }

      .swiper-item {
        width: 100%;
        opacity: 0.4;
        height: auto;
        img {
          object-fit: cover;
          width: 100%;
          height: 100px;
        }
      }
      .swiper-slide.swiper-slide-thumb-active div {
        opacity: 1;
      }
      .swiper-button-prev {
        margin: -7px 0 0;
        top: 50%;
        width: 14px;
        height: 14px;
        .icon {
          color: #fff;
          width: 14px;
          font-size: 14px;
          height: 14px;
        }
      }
      .swiper-button-next {
        margin: -7px 0 0;
        top: 50%;
        width: 14px;
        height: 14px;
        .icon {
          color: #fff;
          width: 14px;
          font-size: 14px;
          height: 14px;
        }
      }
    }
  }
  .detail-tabs {
    border: none;
    border-radius: 10px;
    box-shadow: none;
    margin: 40px 0 0 0;
    background: #FFF;
    width: 100%;
    order: 7;
    & ::v-deep  .el-tabs__header .el-tabs__nav-wrap {
      margin-bottom: 0;
    }
    ::v-deep  .el-tabs__header {
      padding: 10px 10px;
      box-shadow: none;
      margin: 0;
      background: #fff;
      border-color: #E4E7ED;
      border-width: 0;
      border-style: solid;
    }

    ::v-deep  .el-tabs__header .el-tabs__item {
      border: 0;
      padding: 0 20px;
      margin: 0 0 10px 20px;
      color: #9E9E9E;
      font-weight: 500;
      font-size: 18px;
      line-height: 70px;
      border-radius: 10px;
      box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3), inset 0px 4px 10px 0px rgba(231,231,231,0.3);
      background: #FFF;
      text-align: center;
      min-width: 190px;
      height: 70px;
    }

    ::v-deep  .el-tabs__header .el-tabs__item:hover {
      border: 0;
      color: #896785;
      background: #F7E8F6;
    }

    ::v-deep  .el-tabs__header .el-tabs__item.is-active {
      border: 0;
      border-radius: 10px;
      box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3), inset 0px 4px 10px 0px rgba(231,231,231,0.3);
      margin: 0 0 10px 20px;
      color: #896785;
      background: #F7E8F6;
      font-size: 18px;
      line-height: 70px;
      text-align: center;
      min-width: 190px;
      height: 70px;
    }

    ::v-deep  .el-tabs__content {
      padding: 15px;
    }
  }
}
.share_view{
  box-shadow: 0 1px 6px rgba(0,0,0,.3);
  z-index: 11;
  bottom: 20%;
  background: #fff;
  position: fixed;
  right: 0;
  .share:last-of-type{
    border:none;
  }
}
.idea1 {
  border-radius: 30px  30px  30px  30px;
  box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3);
  background: #000000;
  width: 100%;
  order: 1;
  height: 30px;
}
</style>
