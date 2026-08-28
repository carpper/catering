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
					<div class="lable">地区：</div>
					<el-input v-model="formSearch.diqu" placeholder="地区" @keydown.enter.native="getList(1, curFenlei)" clearable></el-input>
				</el-form-item>
				<el-button class="list-search-btn" v-if=" true " type="primary" @click="getList(1, curFenlei)">
					<i class="el-icon-search"></i>
					查询
				</el-button>
				<el-button class="list-add-btn" v-if="btnAuth('toudixinxi','新增')" type="primary" @click="add('/index/toudixinxiAdd')">
					<i class="el-icon-circle-plus-outline"></i>
					添加
				</el-button>
			</el-form>
			<div class="select2">
				<div class="select2-list" v-for="(item,index) in selectOptionsList" :key="index">
					<div class="label">{{item.name}}：</div>
					<div class="item-body">
						<div class="item" @click="selectClick2(item,-1)" :class="item.check ==-1 ? 'active' : ''">全部</div>
						<div class="item" @click="selectClick2(item,index1)" :class="item.check == index1 ? 'active' : ''" v-for="(item1,index1) in item.list" :key="index1">{{item1}}</div>
					</div>
				</div>
			</div>
			<div class="list">
				<!-- 样式二 -->
				<div class="list2 index-pv1">
					<div v-for="(item, index) in dataList" :key="index" class="list-item animation-box">
						<div class="img">
							<img @click.stop="imgPreView(item.qiyetupian.split(',')[0])" v-if="item.qiyetupian && item.qiyetupian.substr(0,4)=='http'" :src="item.qiyetupian.split(',')[0]" class="image" />
							<img @click.stop="imgPreView(baseUrl + (item.qiyetupian?item.qiyetupian.split(',')[0]:''))" v-else :src="baseUrl + (item.qiyetupian?item.qiyetupian.split(',')[0]:'')" class="image" />
						</div>
						<div class="item-info">
							<div class="name">{{item.qiyemingcheng}}</div>
								<div class="name">岗位：{{item.gangweileixing}}</div>
							<div class="name">求职状态：{{item.qiuzhizhuangtai}}</div>
							<div class="name" v-if="item.mianshijieguo">面试结果：{{item.mianshijieguo}}</div>
							<div class="name" v-if="item.mianshishijian">面试时间：{{item.mianshishijian}}</div>
							<div class="name">投递时间：{{item.toudishijian}}</div>
							<div class="time_item">
								<span class="icon iconfont icon-shijian21"></span>
								<span class="label">发布时间：</span>
								<span class="text">{{item.addtime.split(' ')[0]}}</span>
							</div>
							<div class="publisher_item">
								<span class="icon iconfont icon-geren16"></span>
								<span class="label">发布人：</span>
								<span class="text">{{item.qiuzhizhanghao}}</span>
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
		//数据集合
		data() {
			return {
				selectIndex2: 0,
				selectOptionsList: [],
				layouts: '',
				swiperIndex: -1,
				baseUrl: '',
				breadcrumbItem: [
					{
						name: '应聘信息'
					}
				],
				formSearch: {
					qiyemingcheng: '',
					diqu: '',
					qiuzhizhuangtai: '',
					mianshijieguo: '',
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
				qiuzhizhuangtaiOptions: [],
				mianshijieguoOptions: [],
				mianshiList: [],
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
			this.qiuzhizhuangtaiOptions = '已邀请,待通知,未通过'.split(',');
			this.selectOptionsList.push({name:'求职状态',list:this.qiuzhizhuangtaiOptions,tableName: 'qiuzhizhuangtai',check: -1})
			// 获取面试信息列表用于关联
			await this.getMianshiList();
			await this.getFenlei();
			let fenlei = '全部'
			if(this.$route.query.homeFenlei){
				fenlei = this.$route.query.homeFenlei
			}
			this.getList(1, fenlei);
		},
		watch:{
			$route(newValue){
				this.getList(1, newValue.query.homeFenlei);
			}
		},
		//方法集合
		methods: {
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
				if (this.formSearch.diqu != '') searchWhere.diqu = '%' + this.formSearch.diqu + '%';
				// 求职状态筛选：未通过表示审核未通过
				if (this.formSearch.qiuzhizhuangtai != '') {
					if (this.formSearch.qiuzhizhuangtai === '未通过') {
						// 未通过表示审核状态为'否'
						searchWhere.sfsh = '否';
					} else {
						searchWhere.qiuzhizhuangtai = this.formSearch.qiuzhizhuangtai;
					}
				}
				if(!this.centerType && !searchWhere.sfsh){
					params['sfsh'] = '是';
				}
				let user = JSON.parse(localStorage.getItem('sessionForm'))
				// 添加用户筛选：求职者只看自己的投递，企业只看投自己的投递
				if (user && user.qiuzhizhanghao) {
					searchWhere.qiuzhizhanghao = user.qiuzhizhanghao;
				} else if (user && user.qiyemingcheng) {
					searchWhere.qiyemingcheng = user.qiyemingcheng;
				}
				if (this.sortType) searchWhere.sort = this.sortType
				if (this.sortOrder) searchWhere.order = this.sortOrder
				this.$http.get(`toudixinxi/${this.centerType?'page':'list'}`, {params: Object.assign(params, searchWhere)}).then(async res => {
					if (res.data.code == 0) {
						let list = res.data.data.list;
						// 关联面试信息
						await this.mergeMianshiInfo(list);
						// 如果有面试结果筛选条件，进行过滤（使用字符串比较）
						if (this.formSearch.mianshijieguo) {
							let filterValue = String(this.formSearch.mianshijieguo).trim();
							list = list.filter(item => {
								let itemValue = item.mianshijieguo ? String(item.mianshijieguo).trim() : '';
								return itemValue === filterValue;
							});
						}
						this.dataList = list;
						console.log('最终数据列表:', list.map(item => ({
							qiyemingcheng: item.qiyemingcheng,
							qiuzhizhuangtai: item.qiuzhizhuangtai,
							mianshijieguo: item.mianshijieguo || '无面试结果',
							mianshizhuangtai: item.mianshizhuangtai || '未安排'
						})));
						this.total = Number(res.data.data.total);
						this.pageSize = Number(res.data.data.pageSize);
						this.totalPage = res.data.data.totalPage;
						if(this.pageSizes.length==0){
							this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
						}
					}
				});
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
				this.$router.push({path: '/index/toudixinxiDetail', query: params});
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
			// 获取面试信息列表
			async getMianshiList() {
				let params = {
					page: 1,
					limit: 1000,
				};
				let user = null;
				try {
					user = JSON.parse(localStorage.getItem('sessionForm'));
				} catch(e) {
					console.log('获取sessionForm失败:', e);
				}
				if (user && user.qiuzhizhanghao) {
					// 求职者用户：只获取自己的面试信息
					params['qiuzhizhanghao'] = user.qiuzhizhanghao;
					console.log('求职者获取面试信息, 账号:', user.qiuzhizhanghao);
				} else if (user && user.qiyemingcheng) {
					// 企业用户：只获取自己企业的面试信息
					params['qiyemingcheng'] = user.qiyemingcheng;
					console.log('企业获取面试信息, 名称:', user.qiyemingcheng);
				} else {
					console.log('未能获取用户信息，获取所有面试信息');
				}
				console.log('获取面试信息参数:', params);
				await this.$http.get('mianshixinxi/list', {params: params}).then(res => {
					console.log('面试信息返回:', res.data);
					if (res.data.code == 0) {
						this.mianshiList = res.data.data.list || [];
						console.log('面试信息列表:', this.mianshiList);
						// 设置固定的面试结果筛选选项：已录用，未录用（与后台管理保持一致）
						this.mianshijieguoOptions = ['已录用', '未录用'];
						// 添加面试结果筛选选项
						let mianshiFilter = this.selectOptionsList.find(item => item.tableName === 'mianshijieguo');
						if (!mianshiFilter) {
							this.selectOptionsList.push({name:'面试结果',list:this.mianshijieguoOptions,tableName: 'mianshijieguo',check: -1});
						}
					}
				});
			},
			// 合并面试信息到应聘信息
			async mergeMianshiInfo(toudiList) {
				console.log('开始合并面试信息, 投递数量:', toudiList.length, '面试数量:', this.mianshiList.length);
				console.log('面试列表详情:', this.mianshiList.map(m => ({
					qiyemingcheng: m.qiyemingcheng,
					qiuzhizhanghao: m.qiuzhizhanghao,
					mianshijieguo: m.mianshijieguo
				})));
				toudiList.forEach((toudi, index) => {
					console.log(`投递${index + 1}:`, toudi.qiyemingcheng, toudi.qiuzhizhanghao);
								// 根据企业名称、岗位类型和求职账号匹配面试信息（必须匹配岗位类型）
					let mianshi = this.mianshiList.find(m => {
						let mQiye = m.qiyemingcheng ? String(m.qiyemingcheng).trim() : '';
						let mQiuzhi = m.qiuzhizhanghao ? String(m.qiuzhizhanghao).trim() : '';
						let mGangwei = m.gangweileixing ? String(m.gangweileixing).trim() : '';
						let tQiye = toudi.qiyemingcheng ? String(toudi.qiyemingcheng).trim() : '';
						let tQiuzhi = toudi.qiuzhizhanghao ? String(toudi.qiuzhizhanghao).trim() : '';
						let tGangwei = toudi.gangweileixing ? String(toudi.gangweileixing).trim() : '';
						let match = mQiye === tQiye && mGangwei === tGangwei && mQiuzhi === tQiuzhi;
						if (match) {
							console.log('  匹配成功:', mQiye, mGangwei, mQiuzhi);
						}
						return match;
					});
					if (mianshi) {
						console.log('匹配到面试信息:', toudi.qiyemingcheng, toudi.qiuzhizhanghao, '结果:', mianshi.mianshijieguo);
						toudi.mianshizhuangtai = '已安排';
						// 设置面试结果
						if (mianshi.mianshijieguo) {
							toudi.mianshijieguo = String(mianshi.mianshijieguo).trim();
						}
						toudi.mianshishijian = mianshi.mianshishijian;
						toudi.mianshixingshi = mianshi.mianshixingshi;
						toudi.shifoucanchu = mianshi.shifoucanchu || '未确认';
					} else {
						console.log('  未匹配到面试信息');
					}
				});
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
			.list-add-btn {
				cursor: pointer;
				border: 0;
				border-radius: 25px;
				padding: 0px 15px;
				margin: 0 10px 0 0;
				outline: none;
				color: #fff;
				background: #161F3B;
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
		.select2 {
			padding: 0;
			background: none;
			width: 100%;
			height: auto;
			order: 2;
			.select2-list {
				border-radius: 30px;
				padding: 0 0 0 52px;
				box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3);
				margin: 0 0 20px 0;
				background: #FFF;
				display: flex;
				width: 100%;
				justify-content: center;
				align-items: center;
				position: relative;
				height: 60px;
				.label {
					padding: 0 5px;
					color: #999;
					white-space: nowrap;
					display: inline-block;
					font-size: 14px;
					line-height: 32px;
				}
				.item-body {
					display: flex;
					gap: 20px;
					width: 100%;
					flex-wrap: wrap;
					height: auto;
					.item {
						cursor: pointer;
						border-radius: 25px;
						padding: 4px 20px;
						color: #333;
						background: none;
						font-size: 14px;
						line-height: 32px;
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
