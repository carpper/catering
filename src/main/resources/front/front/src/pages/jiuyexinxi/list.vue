<template>
  <div>
    <div class="breadcrumb-preview">
      <el-breadcrumb :separator="'Ξ'">
        <el-breadcrumb-item class="item1" to="/"><a>首页</a></el-breadcrumb-item>
        <el-breadcrumb-item class="item2" v-for="(item, index) in breadcrumbItem" :key="index"><a>{{item.name}}</a></el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <div v-if="centerType" class="back_box">
      <el-button class="backBtn" size="mini" @click="backClick">
        <span class="icon iconfont icon-jiantou33"></span>
        <span class="text">返回</span>
      </el-button>
    </div>
    <div class="list-preview">
      <el-form :inline="true" :model="formSearch" class="list-form-pv">
        <el-form-item class="list-item">
          <div class="lable">企业名称：</div>
          <el-input v-model="formSearch.qiyemingcheng" placeholder="企业名称" @keydown.enter.native="getList(1, curFenlei)" clearable></el-input>
        </el-form-item>
        <el-form-item class="list-item">
          <div class="lable">薪资待遇：</div>
          <el-input v-model="formSearch.xinzidaiyustart" placeholder="最小薪资待遇" clearable></el-input>
        </el-form-item>
        <el-form-item class="list-item">
          <el-input v-model="formSearch.xinzidaiyuend" placeholder="最大薪资待遇" clearable></el-input>
        </el-form-item>
        <el-button class="list-search-btn" type="primary" @click="getList(1, curFenlei)">
          <i class="el-icon-search"></i>
          查询
        </el-button>
      </el-form>

      <!-- 核心：点击「更多」展开下拉，完美解决选择问题 -->
      <div class="select2">
        <!-- 岗位类型 -->
        <div class="select-dropdown-item">
          <div class="label">岗位类型：</div>
          <div class="tag-row">
            <div class="item" :class="formSearch.gangweileixing === '' ? 'active' : ''" @click="selectItem('gangwei', '')">全部</div>
            <div class="item" :class="formSearch.gangweileixing === item ? 'active' : ''"
                 v-for="item in gangweileixingOptions.slice(0,6)"
                 @click="selectItem('gangwei', item)">{{ item }}</div>
            <div class="more-btn" @click.stop="toggleDropdown('gangwei')">
              ▼ 更多
            </div>
          </div>
          <!-- 下拉面板 -->
          <div class="dropdown-panel" v-show="dropdownVisible.gangwei" @click.stop>
            <div class="item" :class="formSearch.gangweileixing === '' ? 'active' : ''" @click="selectItem('gangwei', '')">全部</div>
            <div class="item" :class="formSearch.gangweileixing === item ? 'active' : ''"
                 v-for="item in gangweileixingOptions"
                 @click="selectItem('gangwei', item)">{{ item }}</div>
          </div>
        </div>

        <!-- 地区 -->
        <div class="select-dropdown-item">
          <div class="label">地区：</div>
          <div class="tag-row">
            <div class="item" :class="formSearch.diqu === '' ? 'active' : ''" @click="selectItem('diqu', '')">全部</div>
            <div class="item" :class="formSearch.diqu === item ? 'active' : ''"
                 v-for="item in diquOptions.slice(0,10)"
                 @click="selectItem('diqu', item)">{{ item }}</div>
            <div class="more-btn" @click.stop="toggleDropdown('diqu')">
              ▼ 更多
            </div>
          </div>
          <div class="dropdown-panel" v-show="dropdownVisible.diqu" @click.stop>
            <div class="item" :class="formSearch.diqu === '' ? 'active' : ''" @click="selectItem('diqu', '')">全部</div>
            <div class="item" :class="formSearch.diqu === item ? 'active' : ''"
                 v-for="item in diquOptions"
                 @click="selectItem('diqu', item)">{{ item }}</div>
          </div>
        </div>

        <!-- 厨师资质 -->
        <div class="select-dropdown-item">
          <div class="label">厨师资质：</div>
          <div class="tag-row">
            <div class="item" :class="formSearch.zizhiyaoqiu === '' ? 'active' : ''" @click="selectItem('zizhi', '')">全部</div>
            <div class="item" :class="formSearch.zizhiyaoqiu === item ? 'active' : ''"
                 v-for="item in zizhiyaoqiuOptions.slice(0,8)"
                 @click="selectItem('zizhi', item)">{{ item }}</div>
            <div class="more-btn" @click.stop="toggleDropdown('zizhi')">

            </div>
          </div>
          <div class="dropdown-panel" v-show="dropdownVisible.zizhi" @click.stop>
            <div class="item" :class="formSearch.zizhiyaoqiu === '' ? 'active' : ''" @click="selectItem('zizhi', '')">全部</div>
            <div class="item" :class="formSearch.zizhiyaoqiu === item ? 'active' : ''"
                 v-for="item in zizhiyaoqiuOptions"
                 @click="selectItem('zizhi', item)">{{ item }}</div>
          </div>
        </div>
      </div>

      <div class="sort_view">
        <el-button class="click-sort-btn" @click="sortClick('clicknum')">
          <span class="icon iconfont icon-xiaoliang13" v-if="sortType!='clicknum'"></span>
          <span class="icon iconfont icon-xiaoliang13" v-else-if="sortType=='clicknum'&&sortOrder=='desc'"></span>
          <span class="icon iconfont icon-xiaoliang13" v-else-if="sortType=='clicknum'&&sortOrder=='asc'"></span>
          <span class="text">点击量：</span>
        </el-button>
        <el-button class="collect-sort-btn" @click="sortClick('storeupnum')">
          <span class="icon iconfont icon-xiaoliang13" v-if="sortType!='storeupnum'"></span>
          <span class="icon iconfont icon-xiaoliang13" v-else-if="sortType=='storeupnum'&&sortOrder=='desc'"></span>
          <span class="icon iconfont icon-xiaoliang13" v-else-if="sortType=='storeupnum'&&sortOrder=='asc'"></span>
          <span class="text">收藏数</span>
        </el-button>
        <el-button class="like-sort-btn" @click="sortClick('thumbsupnum')">
          <span class="icon iconfont icon-xiaoliang13" v-if="sortType!='thumbsupnum'"></span>
          <span class="icon iconfont icon-xiaoliang13" v-else-if="sortType=='thumbsupnum'&&sortOrder=='desc'"></span>
          <span class="icon iconfont icon-xiaoliang13" v-else-if="sortType=='thumbsupnum'&&sortOrder=='asc'"></span>
          <span class="text">点赞数</span>
        </el-button>
      </div>
      <div class="list">
        <div class="list2 index-pv1">
          <div v-for="(item, index) in dataList" :key="index" class="list-item animation-box">
            <div class="img">
              <img @click.stop="imgPreView(item.qiyetupian.split(',')[0])" v-if="item.qiyetupian && item.qiyetupian.substr(0,4)=='http'" :src="item.qiyetupian.split(',')[0]" class="image" />
              <img @click.stop="imgPreView(baseUrl + (item.qiyetupian?item.qiyetupian.split(',')[0]:''))" v-else :src="baseUrl + (item.qiyetupian?item.qiyetupian.split(',')[0]:'')" class="image" />
            </div>
            <div class="item-info">
              <div class="name">{{item.qiyemingcheng}}</div>
              <div class="name">{{item.gangweileixing}}</div>
              <div class="name">发布时间:{{item.fabushijian}}</div>
              <div class="time_item">
                <span class="icon iconfont icon-shijian21"></span>
                <span class="label">发布时间：</span>
                <span class="text">{{item.addtime.split(' ')[0]}}</span>
              </div>
              <div class="publisher_item">
                <span class="icon iconfont icon-geren16"></span>
                <span class="label">发布人：</span>
                <span class="text">{{item.qiyemingcheng}}</span>
              </div>
              <div class="like_item">
                <span class="icon iconfont icon-zan10"></span>
                <span class="label">点赞数：</span>
                <span class="text">{{item.thumbsupnum}}</span>
              </div>
              <div class="collect_item">
                <span class="icon iconfont icon-shoucang10"></span>
                <span class="label">收藏量：</span>
                <span class="text">{{item.storeupnum}}</span>
              </div>
              <div class="view_item">
                <span class="icon iconfont icon-chakan9"></span>
                <span class="label">点击量：</span>
                <span class="text">{{item.clicknum}}</span>
              </div>
              <div class="more_btn" @click.stop="toDetail(item)">
                查看详情
              </div>
            </div>
          </div>
        </div>
      </div>

      <el-pagination
          background
          id="pagination"
          class="pagination"
          :pager-count="7"
          :page-size="pageSize"
          prev-text="<"
          next-text=">"
          :hide-on-single-page="true"
          :layout='["total","prev","pager","next","sizes","jumper"].join()'
          :total="total"
          :page-sizes="pageSizes"
          @current-change="curChange"
          @size-change="sizeChange"
          @prev-click="prevClick"
          @next-click="nextClick"
      ></el-pagination>
    </div>
    <el-dialog title="预览图" :visible.sync="previewVisible" width="50%">
      <img :src="previewImg" alt="" style="width: 100%;">
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 控制下拉面板显示/隐藏
      dropdownVisible: {
        gangwei: false,
        diqu: false,
        zizhi: false
      },
      selectIndex2: 0,
      selectOptionsList: [],
      layouts: '',
      swiperIndex: -1,
      baseUrl: '',
      breadcrumbItem: [
        {
          name: '招聘信息'
        }
      ],
      formSearch: {
        qiyemingcheng: '',
        gangweileixing: '',
        diqu: '',
        xingye: '',
        xinzidaiyu: '',
        zizhiyaoqiu: '',
      },
      fenlei: [],
      dataList: [],
      total: 1,
      pageSize: 4,
      pageSizes: [],
      totalPage: 1,
      curFenlei: '全部',
      isPlain: false,
      indexQueryCondition: '',
      gangweileixingOptions: [],
      diquOptions: [],
      zizhiyaoqiuOptions: [],
      timeRange: [],
      centerType:false,
      previewImg: '',
      previewVisible: false,
      sortType: 'id',
      sortOrder: 'desc',
    }
  },
  async created() {
    if(this.$route.query.centerType&&this.$route.query.centerType!=0){
      this.centerType = true
    }
    this.baseUrl = this.$config.baseUrl;
    await this.$http.get('option/gangweifenlei/gangweileixing').then(res => {
      if (res.data.code == 0) {
        this.gangweileixingOptions = res.data.data;
      }
    });
    await this.$http.get('option/diqu/diqu').then(res => {
      if (res.data.code == 0) {
        this.diquOptions = res.data.data;
      }
    });
    this.zizhiyaoqiuOptions = '国家职业资格五级,国家职业资格四级,国家职业资格三级,国家职业资格二级,国家职业资格一级'.split(',');
    await this.getFenlei();
    let fenlei = '全部'
    if(this.$route.query.homeFenlei){
      fenlei = this.$route.query.homeFenlei
    }
    this.getList(1, fenlei);

    // 点击页面其他区域关闭所有下拉
    document.addEventListener('click', this.closeAllDropdowns)
  },
  beforeDestroy() {
    document.removeEventListener('click', this.closeAllDropdowns)
  },
  watch:{
    $route(newValue){
      this.getList(1, newValue.query.homeFenlei);
    }
  },
  methods: {
    // 关闭所有下拉面板
    closeAllDropdowns() {
      this.dropdownVisible = {
        gangwei: false,
        diqu: false,
        zizhi: false
      }
    },
    // 切换单个下拉面板
    toggleDropdown(type) {
      // 先关闭其他面板，再切换当前
      this.closeAllDropdowns()
      this.dropdownVisible[type] = !this.dropdownVisible[type]
    },
    // 选择选项
    selectItem(type, value) {
      // 更新筛选条件
      if (type === 'gangwei') {
        this.formSearch.gangweileixing = value
      } else if (type === 'diqu') {
        this.formSearch.diqu = value
      } else if (type === 'zizhi') {
        this.formSearch.zizhiyaoqiu = value
      }
      // 选择后关闭下拉
      this.closeAllDropdowns()
      // 重新查询列表
      this.getList(1, this.curFenlei)
    },
    selectClick2(row,index) {
      row.check = index
      if(index == -1){
        this.formSearch[row.tableName] = ''
      }else {
        this.formSearch[row.tableName] = row.list[index]
      }
      this.getList()
    },
    add(path) {
      let query = {}
      if(this.centerType){
        query.centerType = 1
      }
      this.$router.push({path: path,query:query});
    },
    async getFenlei() {
    },
    getList(page, fenlei, ref = '') {
      let params = {
        page,
        limit: this.pageSize,
      };
      let searchWhere = {};
      if (this.formSearch.qiyemingcheng != '') searchWhere.qiyemingcheng = '%' + this.formSearch.qiyemingcheng + '%';
      if (this.formSearch.gangweileixing != '') searchWhere.gangweileixing = this.formSearch.gangweileixing;
      if (this.formSearch.diqu != '') searchWhere.diqu = this.formSearch.diqu;
      if (this.formSearch.xingye != '') searchWhere.xingye = '%' + this.formSearch.xingye + '%';
      if(this.formSearch.xinzidaiyustart!='' && this.formSearch.xinzidaiyustart!=undefined ){
        searchWhere.xinzidaiyustart = this.formSearch.xinzidaiyustart
      }
      if(this.formSearch.xinzidaiyuend!='' && this.formSearch.xinzidaiyuend!=undefined){
        searchWhere.xinzidaiyuend = this.formSearch.xinzidaiyuend
      }
      if (this.formSearch.zizhiyaoqiu != '') searchWhere.zizhiyaoqiu = '%' + this.formSearch.zizhiyaoqiu + '%';
      let user = JSON.parse(localStorage.getItem('sessionForm'))
      if (this.sortType) searchWhere.sort = this.sortType
      if (this.sortOrder) searchWhere.order = this.sortOrder
      this.$http.get(`jiuyexinxi/${this.centerType?'page':'list'}`, {params: Object.assign(params, searchWhere)}).then(res => {
        if (res.data.code == 0) {
          this.dataList = res.data.data.list;
          this.total = Number(res.data.data.total);
          this.pageSize = Number(res.data.data.pageSize);
          this.totalPage = res.data.data.totalPage;
          if(this.pageSizes.length==0){
            this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
          }
        }
      });
    },
    sortClick(type){
      if(this.sortType==type){
        if(this.sortOrder == 'desc'){
          this.sortOrder = 'asc'
        }else{
          this.sortOrder = 'desc'
        }
      }else{
        this.sortType = type
        this.sortOrder = 'desc'
      }
      this.getList(1, '全部')
    },
    curChange(page) {
      this.getList(page);
    },
    prevClick(page) {
      this.getList(page);
    },
    sizeChange(size){
      this.pageSize = size
      this.getList(1);
    },
    nextClick(page) {
      this.getList(page);
    },
    imgPreView(url){
      this.previewImg = url
      this.previewVisible = true
    },
    toDetail(item) {
      let params = {
        id: item.id
      }
      if(this.centerType){
        params.centerType = 1
      }
      this.$router.push({path: '/index/jiuyexinxiDetail', query: params});
    },
    btnAuth(tableName,key){
      if(this.centerType){
        return this.isBackAuth(tableName,key)
      }else{
        return this.isAuth(tableName,key)
      }
    },
    backClick() {
      this.$router.push({path: '/index/center'});
    },
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.list-preview {
  margin: 10px auto;
  flex-direction: column;
  background: none;
  display: flex;
  width: 1270px;
  position: relative;
  .list-form-pv {
    padding: 10px 0;
    margin: 20px 0;
    background: none;
    display: flex;
    width: 100%;
    align-items: center;
    flex-wrap: wrap;
    height: auto;
    order: 1;
    .list-item {
      border-radius: 30px;
      box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3);
      margin: 0 10px 0 0;
      overflow: hidden;
      background: #FFFFFF;
      ::v-deep .el-form-item__content {
        display: flex;
        line-height: 60px;
        height: 60px;
      }
      .lable {
        padding: 0 10px;
        color: #9E9E9E;
        display: inline-block;
        width: auto;
        line-height: 60px;
      }
      .el-input {
        width: 100%;
      }
      .el-input ::v-deep  .el-input__inner {
        border: 0;
        border-radius: 8px;
        padding: 0 10px;
        margin: 0;
        outline: none;
        color: #333;
        width: 140px;
        font-size: 14px;
        line-height: 60px;
        height: 60px;
      }
      .datetimerange {
        border: 0;
        border-radius: 0;
        padding: 3px 10px;
        outline: none;
        background: #fff;
        width: auto;
        line-height: 60px;
        justify-content: center;
        height: 60px;
      }
      .el-select {
        width: 100%;
      }
      .el-select ::v-deep  .el-input__inner {
      }
      .el-date-editor {
        width: 100%;
      }
      .el-date-editor ::v-deep  .el-input__inner {
        border: 0;
        border-radius: 8px;
        padding: 0 30px;
        margin: 0;
        outline: none;
        color: #333;
        width: 140px;
        font-size: 14px;
        line-height: 60px;
        height: 60px;
      }
    }
    .list-search-btn {
      cursor: pointer;
      border: 0;
      border-radius: 25px;
      padding: 0px 15px;
      margin: 0 10px 0 0;
      outline: none;
      color: #fff;
      background: #896785;
      width: auto;
      font-size: 14px;
      line-height: 42px;
      height: 42px;
      i {
        margin: 0 10px 0 0;
        color: #fff;
        font-size: 14px;
      }
    }
  }

  /* 核心样式：点击更多展开下拉 */
  .select2 {
    padding: 0;
    background: none;
    width: 100%;
    height: auto;
    order: 2;
    display: flex;
    flex-direction: column;
    gap: 12px;
    .select-dropdown-item {
      border-radius: 30px;
      padding: 0 20px;
      box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3);
      margin: 0 0 20px 0;
      background: #FFF;
      display: flex;
      align-items: center;
      height: 60px;
      position: relative;
      .label {
        padding: 0 5px;
        color: #999;
        white-space: nowrap;
        display: inline-block;
        font-size: 18px; /* 四号字 */
        line-height: 32px;
      }
      .tag-row {
        display: flex;
        align-items: center;
        gap: 16px;
        flex: 1;
        .item {
          cursor: pointer;
          border-radius: 25px;
          padding: 4px 20px;
          color: #333;
          background: none;
          font-size: 18px; /* 四号字 */
          line-height: 32px;
          white-space: nowrap;
        }
        .item:hover {
          color: #fff;
          background: #896785;
        }
        .item.active {
          color: #fff;
          background: #896785;
        }
        .more-btn {
          cursor: pointer;
          color: #896785;
          font-size: 18px; /* 四号字 */
          margin-left: 8px;
          &:hover {
            color: #6a4f67;
          }
        }
      }
      /* 下拉面板样式 */
      .dropdown-panel {
        position: absolute;
        top: 66px;
        left: 0;
        right: 0;
        background: #fff;
        border-radius: 12px;
        padding: 12px 16px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        z-index: 9999;
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        max-height: 200px;
        overflow-y: auto;
        .item {
          cursor: pointer;
          border-radius: 20px;
          padding: 4px 16px;
          color: #333;
          font-size: 18px; /* 四号字 */
          line-height: 28px;
          white-space: nowrap;
        }
        .item:hover {
          color: #fff;
          background: #896785;
        }
        .item.active {
          color: #fff;
          background: #896785;
        }
      }
    }
  }
  .sort_view {
    border-radius: 50px;
    padding: 10px 5px;
    box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3);
    margin: 5px 0;
    color: #fff;
    background: #000;
    width: 100%;
    font-size: 15px;
    text-align: center;
    order: 3;
    .click-sort-btn {
      border: 0;
      border-radius: 8px;
      padding: 0 5px;
      margin: 0 5px;
      color: inherit;
      background: none;
      font-size: inherit;
      .icon {
        margin: 0 2px 0 0;
        line-height: 40px;
      }
      .text {
        line-height: 40px;
      }
    }
    .collect-sort-btn {
      border: 0;
      border-radius: 8px;
      padding: 0 5px;
      margin: 0 5px;
      color: inherit;
      background: none;
      font-size: inherit;
      .icon {
        margin: 0 2px 0 0;
        line-height: 40px;
      }
      .text {
        line-height: 40px;
      }
    }
    .like-sort-btn {
      border: 0;
      border-radius: 8px;
      padding: 0 5px;
      margin: 0 5px;
      color: inherit;
      background: none;
      font-size: inherit;
      .icon {
        margin: 0 2px 0 0;
        line-height: 40px;
      }
      .text {
        line-height: 40px;
      }
    }
  }
  .list {
    margin: 0 0 10px;
    background: none;
    width: 100%;
    order: 5;
    .index-pv1 .animation-box {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
      z-index: initial;
    }

    .index-pv1 .animation-box:hover {
      transform: rotate(0) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
      z-index: 1;
    }

    .index-pv1 .animation-box img {
      transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
    }

    .index-pv1 .animation-box img:hover {
      transform: rotate(0) scale(0.8) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
      -webkit-perspective: 1000px;
      perspective: 1000px;
      transition: 0.3s;
    }
    .list2 {
      padding: 0;
      background: none;
      display: flex;
      width: 100%;
      justify-content: space-between;
      flex-wrap: wrap;
      height: auto;
      .list-item {
        border-radius: 6px;
        padding: 10px;
        box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3), inset 0px 4px 10px 0px rgba(231,231,231,0.3);
        margin: 0 0 20px;
        background: #fff;
        display: flex;
        width: 49%;
        font-size: 0;
        position: relative;
        height: auto;
        .img {
          border: 1px solid #896785;
          border-radius: 4px;
          padding: 10px;
          overflow: hidden;
          width: 290px;
          height: 290px;
          .image {
            border-radius: 4px;
            object-fit: cover;
            display: block;
            width: 100%;
            transition: all 0.4s;
            height: 100%;
          }
        }
        .item-info {
          padding: 10px;
          z-index: 999;
          overflow: hidden;
          flex: 1;
          display: inline-block;
          height: auto;
          .name {
            padding: 0 0px;
            overflow: hidden;
            color: #333;
            white-space: nowrap;
            width: 100%;
            font-size: 14px;
            line-height: 24px;
            text-overflow: ellipsis;
          }
          .price {
            border-radius: 4px;
            padding: 0 10px;
            margin: 0 0 8px 0;
            color: #FFF;
            background: #896785;
            font-weight: 600;
            font-size: 16px;
            line-height: 32px;
          }
          .time_item {
            padding: 2px 0 8px 0;
            border-bottom: 1px solid #896785;
            .icon {
              margin: 0 2px 0 0;
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .label {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .text {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
          }
          .publisher_item {
            padding: 2px 0 8px 0;
            border-bottom: 1px solid #896785;
            .icon {
              margin: 0 2px 0 0;
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .label {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .text {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
          }
          .like_item {
            padding: 2px 0 8px 0;
            border-bottom: 1px solid #896785;
            .icon {
              margin: 0 2px 0 0;
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .label {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .text {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
          }
          .collect_item {
            padding: 2px 0 8px 0;
            border-bottom: 1px solid #896785;
            .icon {
              margin: 0 2px 0 0;
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .label {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .text {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
          }
          .view_item {
            padding: 2px 0 8px 0;
            border-bottom: 1px solid #896785;
            .icon {
              margin: 0 2px 0 0;
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .label {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
            .text {
              color: #666;
              font-size: 12px;
              line-height: 1.5;
            }
          }
          .more_btn {
            cursor: pointer;
            border-radius: 20px;
            margin: 20px 0 0;
            color: #fff;
            background: #896785;
            display: block;
            width: 108px;
            font-size: 14px;
            line-height: 32px;
            transition: all .4s ease;
            text-align: center;
            height: 32px;
          }
        }
      }
      .list-item::before {
        border: 5px solid #896785;
        border-radius: 6px;
        transform: scale3d(0, 1, 1);
        top: 0;
        left: 0;
        width: 100%;
        border-width: 5px 0;
        position: absolute;
        transform-origin: left;
        box-sizing: inherit;
        content: "";
        height: 100%;
      }
      .list-item::after {
        border: 5px solid #896785;
        transform: scale3d(1, 0, 1);
        top: 0;
        left: 0;
        width: 100%;
        border-width: 0 5px;
        position: absolute;
        transform-origin: bottom;
        box-sizing: inherit;
        content: "";
        height: 100%;
      }
      .list-item:hover {
        cursor: pointer;
        background: #fff;
        .img {
          .image {
            transform: scale(1.05);
          }
        }
        .item-info {
          .name {
            color: #2e89ff;
          }
          .more_btn {
            background: #896785;
          }
        }
      }
      .list-item:hover::before {
        border-radius: 6px;
        transform: scale3d(1, 1, 1);
        transition: transform 0.4s;
      }
      .list-item:hover::after {
        transform: scale3d(1, 1, 1);
        transition: transform 0.4s;
      }
    }
  }
}
</style>