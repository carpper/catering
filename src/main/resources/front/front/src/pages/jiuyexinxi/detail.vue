<template>
	<div>
	<!--  -->
		<div class="breadcrumb-preview">
			<el-breadcrumb :separator="'Ξ'">
				<el-breadcrumb-item class="item1" to="/"><a>首页</a></el-breadcrumb-item>
				<el-breadcrumb-item class="item2" v-for="(item, index) in breadcrumbItem" :key="index" :to="'/index/jiuyexinxi?centerType=' + (centerType?'1':'0')"><a>{{item.name}}</a></el-breadcrumb-item>
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
						<div class="colectBtn" @click="storeup(1)" v-show="!isStoreup">
							<i class="icon iconfont icon-shoucang10"></i>
							<span class="text">收藏({{detail.storeupnum}})</span>
						</div>
						<div class="colectBtnActive" @click="storeup(-1)" v-show="isStoreup">
							<i class="icon iconfont icon-shoucang12"></i>
							<span class="text">已收藏({{detail.storeupnum}})</span>
						</div>
					</div>
					<div class="item">
						<div class="lable">倒计时</div>
						<count-down v-if="endTime&&startTime"
							class="count-down"
							:startTime="startTime"
							:endTime="endTime"
							:tipText="'距离开始 '"
							tipTextEnd="距离结束 "
							endText="倒计时已结束"
							dayTxt="天 "
							hourTxt="小时 "
							minutesTxt="分钟 "
							secondsTxt="秒">
						</count-down>
					</div>
					<div class="item">
						<div class="lable">企业地址</div>
						<div class="text "  >{{detail.qiyedizhi}}</div>
					</div>
					<div class="item">
						<div class="lable">负责人</div>
						<div class="text "  >{{detail.fuzeren}}</div>
					</div>
					<div class="item">
						<div class="lable">联系电话</div>
						<div class="text "  >{{detail.lianxidianhua}}</div>
					</div>
					<div class="item">
						<div class="lable">岗位类型</div>
						<div class="text "  >{{detail.gangweileixing}}</div>
					</div>
					<div class="item">
						<div class="lable">地区</div>
						<div class="text "  >{{detail.diqu}}</div>
					</div>
					<div class="item">
						<div class="lable">行业</div>
						<div class="text "  >{{detail.xingye}}</div>
					</div>
					<div class="item">
						<div class="lable">招聘人数</div>
						<div class="text "  >{{detail.zhaopinrenshu}}</div>
					</div>
					<div class="item">
						<div class="lable">薪资待遇</div>
						<div class="text "  >{{detail.xinzidaiyu}}</div>
					</div>
					<div class="item">
						<div class="lable">厨师资质</div>
						<div class="text "  >{{detail.zizhiyaoqiu}}</div>
					</div>
					<div class="item">
						<div class="lable">经验要求</div>
						<div class="text "  >{{detail.jingyanyaoqiu}}</div>
					</div>
					<div class="item">
						<div class="lable">工作时间</div>
						<div class="text "  >{{detail.gongzuoshijian}}</div>
					</div>
					<div class="item">
						<div class="lable">发布时间</div>
						<div class="text "  >{{detail.fabushijian}}</div>
					</div>
					<div class="item">
						<div class="lable">点击次数</div>
						<div class="text "  >{{detail.clicknum}}</div>
					</div>
					<div class="btn_box">
						<el-button class="chatBtn" v-if="btnAuth('jiuyexinxi','私聊')&&detail.id!=mid" @click="chatClick">联系TA</el-button>
						<el-button class="reserveBtn"
							v-if="btnAuth('jiuyexinxi','投递简历')"
							@click="onAcross('toudixinxi','','','','')" type="warning">
							投递简历
						</el-button>
					</div>
				</div>
			</div>

			<!-- 右侧内容区 -->
			<div class="right-content">
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


				<div class="gangwei-intro" v-if="detail.gangweijieshao">
					<h3 class="intro-title">岗位介绍</h3>
					<div class="ql-snow ql-editor" v-html="detail.gangweijieshao"></div>
				</div>
			</div>

			<div class="zancai">
				<div v-if="!isThumbsupnum && !isCrazilynum" class="zan" @click="thumbsupOrCrazily(21)">
					<i class="icon iconfont icon-zan07"></i>
					<span class="text">赞一下({{detail.thumbsupnum}})</span>
				</div>
				<div v-if="!isThumbsupnum && !isCrazilynum" class="cai" @click="thumbsupOrCrazily(22)">
					<i class="icon iconfont icon-cai01"></i>
					<span class="text">踩一下({{detail.crazilynum}})</span>
				</div>
				<div v-if="isThumbsupnum" class="zanActive" @click="cancelThumbsupOrCrazily(21)">
					<i class="icon iconfont icon-zan11"></i>
					<span class="text">已赞({{detail.thumbsupnum}})</span>
				</div>
				<div v-if="isCrazilynum" class="caiActive" @click="cancelThumbsupOrCrazily(22)">
					<i  class="icon iconfont icon-cai16"></i>
					<span class="text">已踩({{detail.crazilynum}})</span>
				</div>
			</div>




			<el-tabs class="detail-tabs" v-model="activeName" type="border-card">
				<!-- <el-tab-pane label="岗位介绍" name="first">
					<div class="ql-snow ql-editor" v-html="detail.gangweijieshao"></div>
				</el-tab-pane> -->
				<el-tab-pane label="评论" name="second">
					<el-form class="add commentForm" :model="form" :rules="rules" ref="form">
						<el-form-item class="item" label="评论" prop="content">
							<editor
								v-model="form.content"
								class="editor"
								action="file/upload">
							</editor>
						</el-form-item>
						<el-form-item class="commentBtn">
							<el-button class="submitBtn" type="primary" @click="submitForm('form')">立即提交</el-button>
							<el-button class="resetBtn" @click="resetForm('form')">重置</el-button>
						</el-form-item>
					</el-form>

					<div v-if="infoList.length" class="comment-list">
						<div class="comment-item" v-for="item in infoList" :key="item.id" @mouseenter="discussEnter(item.id)"
							@mouseleave="discussLeave">
							<div class="istop" v-if="item.istop">
								<span class="icon iconfont icon-jiantou24"></span>
							</div>
							<div class="user">
								<el-image v-if="item.avatarurl" :size="50" :src="baseUrl + item.avatarurl"></el-image>
								<el-image v-if="!item.avatarurl" :size="50" :src="require('@/assets/touxiang.png')"></el-image>
								<div class="name">{{item.nickname}}</div>
							</div>
							<div class="comment-content-box">
								<div class="ql-snow ql-editor" v-html="item.content"></div>
								<div class="zancai-box">
									<div v-if="!comcaiChange(item)" class="zan-item" :class="comzanChange(item)?'active':''" @click="comzanClick(item)">
										<span class="icon iconfont" :class="comzanChange(item)?'icon-zan11':'icon-zan07'"></span>
										<span class="label">{{comzanChange(item)?'已赞':'赞'}}</span>
										<span class="num">({{item.thumbsupnum}})</span>
									</div>
									<div v-if="!comzanChange(item)" class="cai-item" :class="comcaiChange(item)?'active':''" @click="comcaiClick(item)">
										<span class="icon iconfont" :class="comcaiChange(item)?'icon-cai16':'icon-cai01'"></span>
										<span class="label">{{comcaiChange(item)?'已踩':'踩'}}</span>
										<span class="num">({{item.crazilynum}})</span>
									</div>
								</div>
								<div class="comment-btn">
									<!-- <el-button :style='{"border":"0","cursor":"pointer","padding":"0 20px","margin":"0 10px","outline":"none","color":"rgba(255, 255, 255, 1)","borderRadius":"0","background":"#896785","width":"90px","lineHeight":"25px","fontSize":"14px","height":"25px"}'>回复</el-button> -->
								</div>
							</div>
							<div class="comment-content-box" v-if="item.reply">
								回复：<span class="ql-snow ql-editor" v-html="item.reply"></span>
							</div>
						</div>
					</div>

					<el-pagination
						background
						id="pagination" class="pagination"
						:pager-count="7"
						:page-size="pageSize"
						prev-text="<"
						next-text=">"
						:hide-on-single-page="true"
						:layout='["total","prev","pager","next","sizes","jumper"].join()'
						:total="total"
						@current-change="curChange"
						@prev-click="prevClick"
						@next-click="nextClick"
						></el-pagination>
				</el-tab-pane>
			</el-tabs>

			<div class="idea1"></div>
		</div>
		<div class="share_view">
		</div>
		<el-dialog :visible.sync="chatVisible" @close="clearChat" :title="fname">
			<div class="chat-content" id="chat-content">
				<div v-bind:key="item.id" v-for="item in chatList">
					<div v-if="item.addtime" class="addtime">{{timeFormat(item.addtime)}}</div>
					<div v-if="item.uid==mid" class="right-content">
						<el-alert v-if="item.format==1" class="text-content" :title="item.content" :closable="false"
							type="warning"></el-alert>
						<el-image v-else fit="cover" :src="item.content?baseUrl + item.content:''" style="width: 100px;height: 100px;" :preview-src-list="[item.content?baseUrl + item.content:'']"></el-image>
						<img :src="mpic?baseUrl + mpic:require('@/assets/avator.png')" alt="" style="width: 30px;border-radius: 50%;height: 30px;margin: 0 0 0 10px;" />
					</div>
					<div v-else class="left-content">
						<img :src="fpic?baseUrl + fpic:require('@/assets/avator.png')" alt="" style="width: 30px;border-radius: 50%;height: 30px;margin: 0 10px 0 0;" />
						<el-alert v-if="item.format==1" class="text-content" :title="item.content" :closable="false"
							type="success"></el-alert>
						<el-image v-else fit="cover" :src="item.content?baseUrl + item.content:''" style="width: 100px;height: 100px;" :preview-src-list="[item.content?baseUrl + item.content:'']"></el-image>

					</div>
					<div class="clear-float"></div>
				</div>
			</div>
			<div slot="footer" class="dialog-footer">
				<el-input size="small" @keydown.enter.native="addChat(null)" v-model="chatForm.content" placeholder="请输入内容" style="width: calc(100% - 240px);float: left;">
				</el-input>
				<el-button size="small" :disabled="chatForm.content?false:true" type="primary" @click="addChat(null)">发送</el-button>
				<el-upload style="display: inline-block;margin: 0 6px;" class="upload-demo" :action="uploadUrl" :on-success="uploadSuccess"
					:show-file-list="false">
					<el-button size="small" type="success">上传图片</el-button>
				</el-upload>
				<el-button v-if="showSaveType" size="small" type="primary" @click="saveGood">详情图发送</el-button>
			</div>
		</el-dialog>
	</div>
</template>

<script>
	import CountDown from '@/components/CountDown';
	import axios from 'axios'
	import Swiper from "swiper";
	import timeMethod from '@/common/timeMethod'
	import {
		WebsocketMixin
	} from '@/mixins/WebsocketMixin'
	export default {
		mixins: [WebsocketMixin],
		//数据集合
		data() {
			return {
				tablename: 'jiuyexinxi',
				baseUrl: '',
				breadcrumbItem: [
					{
						name: '招聘信息'
					}
				],
				title: '',
				detailBanner: [],
				userid: localStorage.getItem('frontUserid'),
				startTime:0,
				endTime: 0,
				id: 0,
				detail: {},
				activeName: 'second',
				form: {
					content: '',
					userid: localStorage.getItem('frontUserid'),
					nickname: localStorage.getItem('username'),
					avatarurl: '',
				},
				showIndex: -1,
				infoList: [],
				rules: {
					content: [
						{ required: true, message: '请输入内容', trigger: 'blur' }
					],
				},
				total: 1,
				pageSize: 5,
				totalPage: 1,
				storeupParams: {
					name: '',
					picture: '',
					refid: 0,
					tablename: 'jiuyexinxi',
					userid: localStorage.getItem('frontUserid')
				},
				isStoreup: false,
				storeupInfo: {},
				isCrazilynum: false,
				isThumbsupnum: false,
				thumbsupOrCrazilyInfo: {},
				buynumber: 1,
				centerType: false,
				shareUrl: location.href,
				mid: localStorage.getItem('frontUserid'),
				chatVisible: false,
				chatList: [],
				chatForm: {
					content: ''
				},
				uploadUrl: this.$config.baseUrl + 'file/upload',
				fpic: '',
				fname: '',
				fid: '',
				mpic: localStorage.getItem('frontHeadportrait'),
				showSaveType: true,
				sensitiveWordsArr: [],
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
						this.startTime = new Date().getTime();
						this.endTime = new Date(this.detail.reversetime).getTime();
						if(res.data.data.touxiang){
							this.fpic = res.data.data.touxiang.split(',')[0]
						}else if(res.data.data.headportrait){
							this.fpic = res.data.data.headportrait.split(',')[0]
						}
						this.$forceUpdate();
						this.getDiscussList(1);
						if(localStorage.getItem('frontToken')){
							this.getStoreupStatus();
							this.getThumbsupOrCrazilyStatus();
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
				if (new Date().getTime() > new Date(this.detail.reversetime).getTime()) {
					this.$message.error('倒计时已结束');
					return;
				}
				localStorage.setItem('crossTable',`jiuyexinxi`);
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
			storeup(type) {
				if (type == 1 && !this.isStoreup) {
					this.storeupParams.name = this.title;
					this.storeupParams.picture = this.detailBanner[0];
					this.storeupParams.refid = this.detail.id;
					this.storeupParams.type = type;
					this.$http.post('storeup/add', this.storeupParams).then(res => {
						if (res.data.code == 0) {
							this.isStoreup = true;
							this.detail.storeupnum++
							this.$http.post('jiuyexinxi/update', this.detail).then(res => {});
							this.$message({
								type: 'success',
								message: '收藏成功!',
								duration: 1500,
							});
						}
					});
				}
				if (type == -1 && this.isStoreup) {
					this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 1, refid: this.detail.id, tablename: 'jiuyexinxi', userid: localStorage.getItem('frontUserid')}}).then(res => {
						if (res.data.code == 0 && res.data.data.list.length > 0) {
							this.isStoreup = true;
							this.storeupInfo = res.data.data.list[0];
							let delIds = new Array();
							delIds.push(this.storeupInfo.id);
							this.$http.post('storeup/delete', delIds).then(res => {
								if (res.data.code == 0) {
									this.isStoreup = false;
									this.detail.storeupnum--
									this.$http.post('jiuyexinxi/update', this.detail).then(res => {});
									this.$message({
										type: 'success',
										message: '取消成功!',
										duration: 1500,
									});
								}
							});
						}
					});
				}
			},
			getStoreupStatus(){
				if(localStorage.getItem("frontToken")) {
					this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 1, refid: this.detail.id, tablename: 'jiuyexinxi', userid: localStorage.getItem('frontUserid')}}).then(res => {
						if (res.data.code == 0 && res.data.data.list.length > 0) {
							this.isStoreup = true;
							this.storeupInfo = res.data.data.list[0];
						}
					});
				}
			},
			thumbsupOrCrazily(type) {
				this.storeupParams.name = this.title;
				this.storeupParams.picture = this.detailBanner[0];
				this.storeupParams.refid = this.detail.id;
				this.storeupParams.type = type;
				this.$http.post('storeup/add', this.storeupParams).then(res => {
					if (res.data.code == 0) {
						this.getThumbsupOrCrazilyStatus();
						this.$message({
							type: 'success',
							message: '操作成功!',
							duration: 1500,
						});
					}
				});

				if (type == 21) this.detail.thumbsupnum = Number(this.detail.thumbsupnum) + 1;
				if (type == 22) this.detail.crazilynum = Number(this.detail.crazilynum) + 1;
				this.$http.post('jiuyexinxi/update', this.detail).then(res => {});
			},
			cancelThumbsupOrCrazily(type) {
				let delIds = new Array();
				delIds.push(this.thumbsupOrCrazilyInfo.id);
				this.$http.post('storeup/delete', delIds).then(res => {
					if (res.data.code == 0) {
						this.isThumbsupnum = false;
						this.isCrazilynum = false;
						this.$message({
							type: 'success',
							message: '取消成功!',
							duration: 1500,
						});
					}
				});
				if (type == 21) this.detail.thumbsupnum -= 1;
				if (type == 22) this.detail.crazilynum -= 1;
				this.$http.post('jiuyexinxi/update', this.detail).then(res => {});
			},
			getThumbsupOrCrazilyStatus() {
				if(localStorage.getItem("frontToken")) {
					this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 21, refid: this.detail.id, tablename: 'jiuyexinxi', userid: localStorage.getItem('frontUserid')}}).then(res => {
						if (res.data.code == 0 && res.data.data.list.length > 0) {
							this.isThumbsupnum = true;
							this.thumbsupOrCrazilyInfo = res.data.data.list[0];
						}
					});
					this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 22, refid: this.detail.id, tablename: 'jiuyexinxi', userid: localStorage.getItem('frontUserid')}}).then(res => {
						if (res.data.code == 0 && res.data.data.list.length > 0) {
							this.isCrazilynum = true;
							this.thumbsupOrCrazilyInfo = res.data.data.list[0];
						}
					});
				}
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
				this.$router.push({path: '/index/jiuyexinxi', query: params});
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
			getDiscussList(page) {
				this.$http.get('discussjiuyexinxi/list', {params: {page, limit: this.pageSize, refid: this.detail.id,sort: 'istop',order: 'desc'}}).then(res => {
					if (res.data.code == 0) {
						this.infoList = res.data.data.list;
						this.total = res.data.data.total;
						this.pageSize = Number(res.data.data.pageSize);
						this.totalPage = res.data.data.totalPage;
					}
				});
			},
			comzanChange(row){
				if(row.tuserids){
					let arr = row.tuserids.split(',')
					for(let x in arr){
						if(arr[x] == this.userid){
							return true
						}
					}
				}
				return false
			},
			comzanClick(row){
				if(!this.userid){
					return false
				}
				if(!this.comzanChange(row)){
					row.thumbsupnum++
					if(row.tuserids){
						row.tuserids = row.tuserids + ',' + this.userid
					}else {
						row.tuserids = this.userid
					}
					this.$http.post('discussjiuyexinxi/update',row).then(rs=>{
						this.$message.success('点赞成功')
					})
				}else {
					row.thumbsupnum--
					let arr = row.tuserids.split(',')
					for(let x in arr){
						if(arr[x] == this.userid){
							arr.splice(x,1)
						}
					}
					row.tuserids = arr.join(',')
					this.$http.post('discussjiuyexinxi/update',row).then(rs=>{
						this.$message.success('取消成功')
					})
				}
			},
			comcaiChange(row){
				if(row.cuserids){
					let arr = row.cuserids.split(',')
					for(let x in arr){
						if(arr[x] == this.userid){
							return true
						}
					}
				}
				return false
			},
			comcaiClick(row){
				if(!this.userid){
					return false
				}
				if(!this.comcaiChange(row)){
					row.crazilynum++
					if(row.cuserids){
						row.cuserids = row.cuserids + ',' + this.userid
					}else {
						row.cuserids = this.userid
					}
					this.$http.post('discussjiuyexinxi/update',row).then(rs=>{
						this.$message.success('点踩成功')
					})
				}else {
					row.crazilynum--
					let arr = row.cuserids.split(',')
					for(let x in arr){
						if(arr[x] == this.userid){
							arr.splice(x,1)
						}
					}
					row.cuserids = arr.join(',')
					this.$http.post('discussjiuyexinxi/update',row).then(rs=>{
						this.$message.success('取消成功')
					})
				}
			},
			discussEnter(index){
				this.showIndex = index
			},
			discussLeave(){
				this.showIndex = -1
			},
			discussDel(id){
				this.$confirm('是否删除此评论？').then(_ => {
					this.$http.post('discussjiuyexinxi/delete',[id]).then(res=>{
						if(res.data&&res.data.code==0){
							this.addDiscussNum(1)
							this.$message({
								type: 'success',
								message: '删除成功!',
								duration: 1500,
								onClose: () => {
									this.getDiscussList(1);
								}
							});
						}
					})
				}).catch(_ => {});
			},
			submitForm(formName) {
				for(var i=0; i<this.sensitiveWordsArr.length; i++){
					//全局替换
					var reg = new RegExp(this.sensitiveWordsArr[i],"g");
					//判断内容中是否包括敏感词
					if (this.form.content.indexOf(this.sensitiveWordsArr[i]) > -1) {
						// 将敏感词替换为 **
						this.form.content = this.form.content.replace(reg,"**");
					}
				}
				this.$refs[formName].validate((valid) => {
					if (valid) {
						this.form.refid = this.detail.id;
						this.form.avatarurl = localStorage.getItem('frontHeadportrait')?localStorage.getItem('frontHeadportrait'):'';
						this.$http.post('discussjiuyexinxi/add', this.form).then(rs2 => {
							if (rs2.data.code == 0) {
								this.form.content = '';
								this.addDiscussNum(2)
								this.getDiscussList(1);
								this.$message({
									type: 'success',
									message: '评论成功!',
									duration: 1500,
								});
							}
						});
					} else {
						return false;
					}
				});
			},
			resetForm(formName) {
				this.$refs[formName].resetFields();
			},
			addDiscussNum(type){
				if(type==2){
					this.detail.discussnum++
				}else if(type==1){
					if(this.detail.discussnum!=0){
						this.detail.discussnum--
					}else{
						this.detail.discussnum = 0
					}
				}
				this.$http.post('jiuyexinxi/update',this.detail).then(res=>{})
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
				this.$router.push(`/index/jiuyexinxiAdd?type=edit&&id=${this.detail.id}`);
			},
			// 删除
			async delClick(){
				await this.$confirm('是否删除此招聘信息？') .then(_ => {
					this.$http.post('jiuyexinxi/delete', [this.detail.id]).then(async res => {
						if (res.data.code == 0) {
							this.$http.get('storeup/list',{params:{
								page: 1,
								limit: 100,
								refid: this.detail.id,
								tablename: 'jiuyexinxi',
							}}).then(async obj=>{
								if(obj.data&&obj.data.code==0){
									let arr = []
									for(let x in obj.data.data.list){
										arr.push(obj.data.data.list[x].id)
									}
									if(arr.length){
										await this.$http.post('storeup/delete',arr).then(()=>{})
									}
									this.$message({
										type: 'success',
										message: '删除成功!',
										duration: 1500,
										onClose: () => {
											history.back()
										}
									});
								}
							})
						}
					});
				}).catch(_ => {});
			},

			chatClick() {
				let user = JSON.parse(localStorage.getItem('sessionForm'))
				if(this.detail.qiyemingcheng == user.qiyemingcheng){
					this.$message.error('不能给自己发信息')
					return false
				}
				this.$http.get('qiye/query', {
					params: {
						qiyemingcheng: this.detail.qiyemingcheng
					}
				}).then(res => {
					if (res.data && res.data.code == 0) {
						this.fid = res.data.data.id
						this.initWebSocket(this.fid)
						this.fname = res.data.data.qiyemingcheng
						if (res.data.data.touxiang) {
							this.fpic = res.data.data.touxiang.split(',')[0]
						} else if (res.data.data.headportrait) {
							this.fpic = res.data.data.headportrait.split(',')[0]
						}
						this.getChatList()
						this.chatVisible = true
					}
				})
			},
			saveGood(){
				this.showSaveType = false
				this.$http.get('friend/page', {
					params: {
						uid: Number(localStorage.getItem('frontUserid')),
						fid: this.fid,
					}
				}).then(obj => {
					if (obj.data && obj.data.code == 0) {
						if (!obj.data.data.list.length) {
							this.$http.post('friend/add', {
								uid: Number(localStorage.getItem('frontUserid')),
								fid: this.fid,
								name: this.fname,
								picture: this.fpic,
								type: 2,
								tablename:  'qiye' ,
							}).then(res => {
								this.$http.post('friend/add', {
									uid: this.fid,
									fid: Number(localStorage.getItem('frontUserid')),
									type: 2,
									tablename: localStorage.getItem('frontSessionTable'),
									name: localStorage.getItem('username'),
									picture: this.mpic,
								}).then(res1 => {

								})
							})
						}
						this.$http.post('chatmessage/add', {
							uid: Number(localStorage.getItem('frontUserid')),
							fid: this.fid,
							content: this.detailBanner[0],
							format: 2
						}).then(res2 => {
							this.chatForm = {
								content: ''
							}
							this.getChatList()
						})
					}
				})
			},
			getChatList() {
				this.$http.get('chatmessage/mlist', {
					params: {
						page: 1,
						limit: 1000,
						uid: Number(localStorage.getItem('frontUserid')),
						fid: this.fid
					}
				}).then(res => {
					if (res.data && res.data.code == 0) {
						this.chatList = this.formatMessages(res.data.data.list)
						let div = document.getElementsByClassName('chat-content')[0]
						setTimeout(() => {
							if (div)
								div.scrollTop = div.scrollHeight
						}, 0)
					}
				})
			},
			formatMessages(messages) {
				let lastTime = null;
				messages.forEach((message, index) => {
					const currentTime = new Date(message.addtime).getTime();
					if (lastTime !== null) {
						const timeDiff = (currentTime - lastTime) / 1000 / 60; // 转换为分钟
						if (timeDiff < 3) {
							message.addtime = ''; // 如果小于3分钟，不显示时间
						}
					}
					lastTime = currentTime;
				});
				return messages;
			},
			timeFormat(time) {
				const Time = timeMethod.getTime(time).split("T");
				//当前消息日期属于周
				const week = timeMethod.getDateToWeek(time);
				//当前日期0时
				const nti = timeMethod.setTimeZero(timeMethod.getNowTime());
				//消息日期当天0时
				const mnti = timeMethod.setTimeZero(timeMethod.getTime(time));
				//计算日期差值
				const diffDate = timeMethod.calculateTime(nti, mnti);
				//本周一日期0时 （后面+1是去除当天时间）
				const fwnti = timeMethod.setTimeZero(timeMethod.countDateStr(-timeMethod.getDateToWeek(timeMethod
					.getNowTime()).weekID + 1));
				//计算周日期差值
				const diffWeek = timeMethod.calculateTime(mnti, fwnti);

				if (diffDate === 0) { //消息发送日期减去当天日期如果等于0则是当天时间
					return Time[1].slice(0, 5);
				} else if (diffDate < 172800000) { //当前日期减去消息发送日期小于2天（172800000ms）则是昨天-  一天最大差值前天凌晨00:00:00到今天晚上23:59:59
					return "昨天 " + Time[1].slice(0, 5);
				} else if (diffWeek >= 0) { //消息日期减去本周一日期大于0则是本周
					return week.weekName;
				} else { //其他时间则是日期
					return Time[0].slice(5, 10);
				}
			},
			clearChat(){
				this.websocketOnclose();
			},
			uploadSuccess(res) {
				if (res.code == 0) {
					this.addChat('upload/' + res.file)
				}
			},
			addChat(ask=null) {
				this.$http.get('friend/page', {
					params: {
						uid: Number(localStorage.getItem('frontUserid')),
						fid: this.fid,
					}
				}).then(obj => {
					if (obj.data && obj.data.code == 0) {
						if (!obj.data.data.list.length) {
							this.$http.post('friend/add', {
								uid: Number(localStorage.getItem('frontUserid')),
								fid: this.fid,
								name: this.fname,
								picture: this.fpic,
								type: 2,
								tablename:  'qiye' ,
							}).then(res => {
								this.$http.post('friend/add', {
									uid: this.fid,
									fid: Number(localStorage.getItem('frontUserid')),
									type: 2,
									tablename: localStorage.getItem('frontSessionTable'),
									name: localStorage.getItem('username'),
									picture: this.mpic,
								}).then(res1 => {

								})
							})
						}
						if(!ask){
							for(var i=0; i<this.sensitiveWordsArr.length; i++){
								//全局替换
								var reg = new RegExp(this.sensitiveWordsArr[i],"g");
								//判断内容中是否包括敏感词
								if (this.chatForm.content.indexOf(this.sensitiveWordsArr[i]) > -1) {
									// 将敏感词替换为 **
									this.chatForm.content = this.chatForm.content.replace(reg,"**");
								}
							}
						}
						this.$http.post('chatmessage/add', {
							uid: Number(localStorage.getItem('frontUserid')),
							fid: this.fid,
							content: ask?ask:this.chatForm.content,
							format: ask?2:1
						}).then(res2 => {
							this.websocketSend(ask?ask:this.chatForm.content)
							this.chatForm = {
								content: ''
							}
							this.getChatList()
						})
					}
				})
			},
		},
		components: {
			CountDown
		}
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
					.colectBtn {
						cursor: pointer;
						padding: 10px;
						background: #896785;
						width: 70px;
						text-align: center;
						height: 100%;
						.icon {
							color: #FFF;
							font-size: 32px;
						}
						.text {
							color: #999;
							display: none;
							font-size: 14px;
						}
					}
					.colectBtnActive {
						background: #896785;
						.icon {
						}
						.text {
							color: #fff;
						}
					}
					.colectBtn:hover {
						background: #896785;
						.icon {
						}
						.text {
							color: #000;
						}
					}
					.colectBtnActive:hover {
						background: #896785;
						.icon {
						}
						.text {
							color: #000;
						}
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
					.count-down {
						padding: 8px 10px 0 0;
						color: #000000;
						flex: 1;
						font-size: 14px;
						line-height: 24px;
						height: auto;
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
				.chatBtn {
					border: 0;
					cursor: pointer;
					border-radius: 4px;
					padding: 0 10px;
					margin: 0 5px 0 0;
					outline: none;
					color: #fff;
					background: #313A5D;
					width: auto;
					font-size: 14px;
					line-height: 40px;
					height: 40px;
				}
				.chatBtn:hover {
					background: #313A5D;
				}
			}
		}
		.right-content {
			flex: none;
			width: 590px;
			order: 3;
			display: flex;
			flex-direction: column;
			max-height: 1000px;
			overflow-y: auto;
		}
		.detail-swpier2 {
			padding: 70px 30px 0 0;
			margin: 0;
			background: #FFF;
			width: 590px;
			height: auto;
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
		.gangwei-intro {
			padding: 20px;
			margin: 20px 0 0 0;
			background: #FFFFFF;
			width: 590px;
			.intro-title {
				color: #333;
				font-weight: bold;
				font-size: 18px;
				margin-bottom: 15px;
			}
		}
		.zancai {
			padding: 0;
			margin: 0;
			top: 60px;
			background: none;
			display: flex;
			width: 560px;
			justify-content: center;
			position: absolute;
			right: 60px;
			order: 4;
			.zan {
				border-radius: 0;
				padding: 10px 0;
				margin: 0;
				background: #896785;
				flex: none;
				display: flex;
				width: 280px;
				justify-content: center;
				align-items: center;
				height: 40px;
				.icon {
					margin: 0 3px;
					color: #FFFFFF;
					font-size: 14px;
				}
				.text {
					margin: 0 3px;
					color: #FFFFFF;
					font-size: 14px;
				}
			}
			.zan:hover {
				.icon {
					color: #FFFFFF;
				}
				.text {
					color: #FFFFFF;
				}
			}
			.zanActive {
				.icon {
					color: #fff;
				}
				.text {
					color: #FFFFFF;
				}
			}
			.zanActive:hover {
				.icon {
					color: #FFFFFF;
				}
				.text {
					color: #FFFFFF;
				}
			}

			.cai {
				border-radius: 0;
				padding: 10px 0;
				margin: 0;
				background: #212639;
				flex: none;
				display: flex;
				width: 280px;
				justify-content: center;
				align-items: center;
				.icon {
					margin: 0 3px;
					color: #FFF;
					font-size: 14px;
				}
				.text {
					margin: 0 3px;
					color: #FFF;
					font-size: 14px;
				}
			}
			.cai:hover {
				background: #212639;
				.icon {
					color: #FFF;
				}
				.text {
					color: #FFF;
				}
			}
			.caiActive {
				background: #212639;
				.icon {
					color: #FFF;
				}
				.text {
					color: #FFF;
				}
			}
			.caiActive:hover {
				background: #212639;
				.icon {
					color: #FFF;
				}
				.text {
					color: #FFF;
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
			.commentForm {
				box-shadow: none;
				padding: 15px;
				margin: 0 0 20px;
				.item {
					display: inline-block;
					width: 980px;
					position: relative;
					height: auto;
					::v-deep  .el-form-item__label {
						padding: 0 10px 0 0;
						color: #666;
						display: none;
						width: 80px;
						font-size: 14px;
						line-height: 40px;
						text-align: right;
					}
					.editor {
						border: 0;
						border-radius: 4px;
						box-shadow: inset 0px 4px 10px 0px rgba(178,178,178,0.3);
						outline: none;
						color: #333;
						width: 980px;
						font-size: 14px;
						min-height: 400px;
						line-height: 32px;
						::v-deep  .avatar-uploader {
							height: 0;
							line-height: 0;
						}
					}
				}
				.commentBtn {
					padding: 0;
					margin: 10px 0 0;
					display: inline-block;
					width: 100%;
					height: auto;
					.submitBtn {
						border: 0;
						cursor: pointer;
						border-radius: 4px;
						padding: 0;
						margin: 0 20px 0 0;
						outline: none;
						color: rgba(255, 255, 255, 1);
						background: #896785;
						width: 128px;
						font-size: 14px;
						line-height: 40px;
						height: 40px;
					}
					.submitBtn:hover {
						background: #896785;
					}
					.resetBtn {
						border: 0;
						cursor: pointer;
						border-radius: 4px;
						padding: 0;
						margin: 0 20px 0 0;
						outline: none;
						color: rgba(255, 255, 255, 1);
						background: #212639;
						width: 128px;
						font-size: 14px;
						line-height: 40px;
						height: 40px;
					}
					.resetBtn:hover {
						background: #212639;
					}
				}
			}
			.comment-list {
				box-shadow: none;
				padding: 15px;
				display: flex;
				justify-content: space-between;
				flex-wrap: wrap;
				.comment-item {
					padding: 20px;
					box-shadow: inset 0px 4px 10px 0px rgba(178,178,178,0.3);
					margin: 0 0 20px;
					background: #fff;
					width: 48%;
					border-color: #999;
					border-width: 0;
					align-items: center;
					position: relative;
					border-style: solid;
					height: auto;
					.istop {
						box-shadow: 0 4px 8px rgba(0,0,0,.1);
						top: 0;
						background: #fff;
						position: absolute;
						right: 10px;
						.icon {
							color: #000;
						}
					}
					.user {
						display: flex;
						width: 100%;
						align-items: center;
						height: auto;
						.el-image {
							border-radius: 100%;
							margin: 0 10px 0 0;
							object-fit: cover;
							width: 70px;
							height: 70px;
						}
						.name {
							color: #9E9E9E;
							font-weight: 600;
							font-size: 16px;
						}
					}
					.comment-content-box {
						border-radius: 4px;
						padding: 8px;
						box-shadow: none;
						margin: 10px 0px 0px;
						word-wrap: break-word;
						color: #6F6F6F;
						background: none;
						font-size: 14px;
						line-height: 30px;
						.zancai-box {
							margin: 0;
							display: flex;
							width: 100%;
							justify-content: flex-end;
							align-items: center;
							height: auto;
							.zan-item {
								display: flex;
								align-items: center;
								.icon {
								font-size: 14px;
								}
								.label {
								display: none;
								font-size: 14px;
								}
								.num {
								font-size: 14px;
								}
							}
							.zan-item.active {
								background: none;
								.icon {
								color: #ff0000;
								font-size: 14px;
								}
								.label {
								color: #ff0000;
								display: none;
								font-size: 14px;
								}
								.num {
								color: #ff0000;
								font-size: 14px;
								}
							}
							.zan-item:hover {
								opacity: 0.8;
								.icon {
								color: #ff000030;
								}
								.label {
								color: #ff000030;
								}
								.num {
								color: #ff000030;
								}
							}
							.cai-item {
								display: flex;
								align-items: center;
								.icon {
								font-size: 14px;
								}
								.label {
								display: none;
								font-size: 14px;
								}
								.num {
								font-size: 14px;
								}
							}
							.cai-item.active {
								background: none;
								.icon {
								color: #ff0000;
								font-size: 14px;
								}
								.label {
								color: #ff0000;
								display: none;
								font-size: 14px;
								}
								.num {
								color: #ff0000;
								font-size: 14px;
								}
							}
							.cai-item:hover {
								opacity: 0.8;
								.icon {
								color: #ff000030;
								}
								.label {
								color: #ff000030;
								}
								.num {
								color: #ff000030;
								}
							}
						}
						.comment-btn {
							margin: 8px 0 0 0;
							flex-direction: column;
							top: 30px;
							display: flex;
							gap: 10px;
							width: auto;
							justify-content: flex-end;
							align-items: center;
							position: absolute;
							right: 30px;
							height: 40px;
							.delBtn {
								border: 0;
								cursor: pointer;
								border-radius: 0;
								padding: 0 20px;
								margin: 0 10px;
								outline: none;
								color: rgba(255, 255, 255, 1);
								background: #161F3B;
								width: 90px;
								font-size: 14px;
								line-height: 25px;
								height: 25px;
							}
						}
					}
				}
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
	.chat-content {
		padding-bottom: 20px;
		width: 100%;
		margin-bottom: 10px;
		max-height: 300px;
		height: 300px;
		overflow-y: scroll;
		border: 1px solid #eeeeee;
		background: #fff;

		.addtime {
			width: 100%;
			text-align: center;
			font-size: 12px;
		}

		.left-content {
			float: left;
			margin-bottom: 10px;
			padding: 10px;
			max-width: 80%;
			display: flex;
			align-items: center;
		}

		.right-content {
			float: right;
			margin-bottom: 10px;
			padding: 10px;
			max-width: 80%;
			display: flex;
			align-items: center;
		}
	}

	.clear-float {
		clear: both;
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
