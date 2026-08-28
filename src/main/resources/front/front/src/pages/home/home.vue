<template>
<!--  关于我们-->
	<div class="home-preview">
		<div id="about" class="animate__animated">
			<div class="about_item">
				<div class="about_title_box">
					<div class="about_title">{{aboutUsDetail.title}}</div>
					<div class="about_subtitle">{{aboutUsDetail.subtitle}}</div>
				</div>
				<div class="about_img">
					<img :src="baseUrl + aboutUsDetail.picture1">
					<img :src="baseUrl + aboutUsDetail.picture2">
					<img :src="baseUrl + aboutUsDetail.picture3">
				</div>
				<div class="about_content ql-snow ql-editor" v-html="aboutUsDetail.content"></div>
				<div class="about_idea1" />
				<div class="about_idea2" />
				<div class="about_idea3" />
				<div class="about_idea4" />
				<div class="about_more" @click="toDetail('aboutusDetail',aboutUsDetail)">
					<span>查看更多</span>
					<span class="icon iconfont "></span>
				</div>
			</div>
		</div>


<!--系统简介-->
		<div id="system" class="animate__animated">
			<div class="system_item">
				<div class="system_title_box">
					<div class="system_title">{{systemIntroductionDetail.title}}</div>
					<div class="system_subtitle">{{systemIntroductionDetail.subtitle}}</div>
				</div>
				<div class="system_img">
					<img :src="baseUrl + systemIntroductionDetail.picture1">
					<img :src="baseUrl + systemIntroductionDetail.picture2">
					<img :src="baseUrl + systemIntroductionDetail.picture3">
				</div>
				<div class="system_content ql-snow ql-editor" v-html="systemIntroductionDetail.content"></div>
				<div class="system_idea1" />
				<div class="system_idea2" />
				<div class="system_idea3" />
				<div class="system_idea4" />
				<div class="system_more" @click="toDetail('systemintroDetail',systemIntroductionDetail)">
					<span>查看更多</span>
					<span class="icon iconfont "></span>
				</div>
			</div>
		</div>
<!--新闻资讯-->
		<div id="animate_newsnews" class="news animate__animated">
			<div class="news_title_box">
				<span class="news_title">新闻资讯</span>
				<span class="news_subhead">{{'news'.toUpperCase()}}</span>
			</div>
			<div v-if="newsList.length" class="list list22 index-pv1">
				<div class="top-list">
					<template v-for="(item,index) in newsList">
						<div v-if="index < 3" class="list-item animation-box" @click="toDetail('newsDetail', item)">
							<img :src="baseUrl + item.picture" alt="" />
							<div class="infoBox">
								<div class="name">{{item.title}}</div>
								<div class="time_item">
									<span class="icon iconfont "></span>
									<span class="label">发布时间：</span>
									<span class="text">{{item.addtime.split(' ')[0]}}</span>
								</div>
								<div class="publisher_item">
									<span class="icon iconfont "></span>
									<span class="label">发布人：</span>
									<span class="text">{{item.name}}</span>
								</div>
								<div class="like_item">
									<span class="icon iconfont "></span>
									<span class="label">点赞数：</span>
									<span class="text">{{item.thumbsupnum}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont "></span>
									<span class="label">收藏量：</span>
									<span class="text">{{item.storeupnum}}</span>
								</div>
								<div class="view_item">
									<span class="icon iconfont "></span>
									<span class="label">点击量：</span>
									<span class="text">{{item.clicknum}}</span>
								</div>
							</div>
						</div>
					</template>
				</div>
				<div class="list-body">
					<template v-for="(item,index) in newsList">
            <div v-if="index > 2" class="list-item animation-box" @click="toDetail('newsDetail', item)">
							<img :src="baseUrl + item.picture" alt="" />
							<div class="infoBox">
								<div class="name">{{item.title}}</div>
								<div class="time_item">
									<span class="icon iconfont "></span>
									<span class="label">发布时间：</span>
									<span class="text">{{item.addtime.split(' ')[0]}}</span>
								</div>
								<div class="publisher_item">
									<span class="icon iconfont "></span>
									<span class="label">发布人：</span>
									<span class="text">{{item.name}}</span>
								</div>
								<div class="like_item">
									<span class="icon iconfont "></span>
									<span class="label">点赞数：</span>
									<span class="text">{{item.thumbsupnum}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont "></span>
									<span class="label">收藏量：</span>
									<span class="text">{{item.storeupnum}}</span>
								</div>
								<div class="view_item">
									<span class="icon iconfont "></span>
									<span class="label">点击量：</span>
									<span class="text">{{item.clicknum}}</span>
								</div>
							</div>
						</div>
					</template>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('news')">
				<span class="text">查看更多</span>
				<i class="icon iconfont "></i>
			</div>
		</div>
<!--招聘信息推荐-->
		<div id="animate_recommendjiuyexinxi" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">招聘信息推荐</span>
				<span class="recommend_subhead">{{'jiuyexinxi'.toUpperCase()}} RECOMMEND</span>
			</div>
			<div v-if="jiuyexinxiRecommend.length" class="list list12 index-pv1 list12jiuyexinxi">
				<div class="list-body">
					<div class="item list-item animation-box" v-for="(item,index) in jiuyexinxiRecommend" :key="index" @click="toDetail('jiuyexinxiDetail', item)">
						<img :name="item.id" v-if="preHttp(item.qiyetupian)" :src="item.qiyetupian.split(',')[0]" alt="" />
						<img :name="item.id" v-else :src="baseUrl + (item.qiyetupian?item.qiyetupian.split(',')[0]:'')" alt="" />
						<div class="name">{{item.qiyemingcheng}}</div>
						<div class="name">{{item.gangweileixing}}</div>
						<div class="name">发布时间:{{item.fabushijian}}</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('jiuyexinxi')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
	</div>
</template>

<script>
import 'animate.css'

	export default {
		//数据集合
		data() {
			return {
				baseUrl: '',
				aboutUsDetail: {},
				systemIntroductionDetail: {},
				newsList: [],
				jiuyexinxiRecommend: [],





			}
		},
		created() {
			this.baseUrl = this.$config.baseUrl;
			this.getNewsList();
			this.getAboutUs();
			this.getSystemIntroduction();
			this.getList();
		},
		mounted() {
			window.addEventListener('scroll', this.handleScroll)
			setTimeout(()=>{
				this.handleScroll()
			},100)
			
			this.swiperChanges()
		},
		beforeDestroy() {
			window.removeEventListener('scroll', this.handleScroll)
		},
		//方法集合
		methods: {
			swiperChanges() {
				setTimeout(()=>{
				},750)
			},

			handleScroll() {
				let arr = [
					{id:'about',css:'animate__bounce'},
					{id:'system',css:'animate__bounce'},
					{id:'animate_recommendjiuyexinxi',css:'animate__bounce'},
					{id:'animate_newsnews',css:'animate__bounce'},
				]
			
				for (let i in arr) {
					let doc = document.getElementById(arr[i].id)
					if (doc) {
						let top = doc.offsetTop
						let win_top = window.innerHeight + window.pageYOffset
						// console.log(top,win_top)
						if (win_top > top && doc.classList.value.indexOf(arr[i].css) < 0) {
							// console.log(doc)
							doc.classList.add(arr[i].css)
						}
					}
				}
			},
			preHttp(str) {
				return str && str.substr(0,4)=='http';
			},
			getAboutUs() {
				this.$http.get('aboutus/detail/1', {}).then(res => {
					if(res.data.code == 0) {
						this.aboutUsDetail = res.data.data;
					}
				})
			},
			getSystemIntroduction() {
				this.$http.get('systemintro/detail/1', {}).then(res => {
					if(res.data.code == 0) {
						this.systemIntroductionDetail = res.data.data;
					}
				})
			},
			getNewsList() {
				let data = {
					page: 1,
					limit: 6,
					sort: 'addtime',
					order: 'desc'
				}
				this.$http.get('news/list', {params: data}).then(res => {
					if (res.data.code == 0) {
						this.newsList = res.data.data.list;

					}
				});
			},
      getList() {
        let data = {
          page: 1,
          limit: 5,
          sort: 'id',
          order: 'desc'
        }
        this.$http.get('jiuyexinxi/list', {params: data}).then(res => {
          if (res.data.code == 0) {
            this.jiuyexinxiRecommend = res.data.data.list;
          }
        });
      },
			toDetail(path, item) {
				this.$router.push({path: '/index/' + path, query: {id: item.id}});
			},
			moreBtn(path) {
				this.$router.push({path: '/index/' + path});
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
		margin: 0;
		flex-direction: column;
		background: #FFF;
		display: flex;
		width: 100%;
		#about {
			padding: 0 calc(50% - 635px);
			box-shadow: none;
			margin: 0;
			background: linear-gradient(to bottom, #896D8B 420px, #FFF 420px);
			width: 100%;
			position: relative;
			height: 650px;
			order: 3;
			.about_item {
				box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.3);
				margin: 165px 0 0 0;
				background: #FFF;
				width: 100%;
				height: 440px;
				.about_title_box {
					padding: 10px 0 0 0;
					top: 20px;
					background: url(http://codegen.caihongy.cn/20241122/6a399e675b9f4081a86f2bea34ed59cb.webp);
					width: 1270px;
					position: absolute;
					height: 120px;
					.about_title {
						color: #FFF;
						font-weight: 600;
						width: 100%;
						font-size: 36px;
						line-height: 1.5;
						text-align: center;
					}
					.about_subtitle {
						margin: 0 0 10px;
						color: #999;
						display: none;
						width: 100%;
						font-size: 20px;
						line-height: 1.5;
						text-align: center;
					}
				}
				.about_img {
					padding: 0;
					display: inline-block;
					width: 700px;
					float: left;
					height: 100%;
					img:nth-child(1) {
						margin: 0;
						flex: 1;
						object-fit: cover;
						display: block;
						width: 100%;
						height: 100%;
					}
					img:nth-child(2) {
						margin: 0 10px;
						flex: 1;
						object-fit: cover;
						display: none;
						height: 120px;
					}
					img:nth-child(3) {
						margin: 0 10px;
						flex: 1;
						object-fit: cover;
						display: none;
						height: 120px;
					}
				}
				.about_content {
					padding: 30px 40px 0 30px;
					margin: 0;
					overflow: hidden;
					color: rgb(102, 102, 102);
					display: inline-block;
					width: 560px;
					font-size: 16px;
					line-height: 2;
					float: right;
					height: 350px;
				}
				.about_idea1 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.about_idea2 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.about_idea3 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.about_idea4 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.about_more {
					border: 0;
					padding: 0 20px 0 0;
					margin: 10px 0 0 auto;
					display: flex;
					width: 180px;
					line-height: 50px;
					justify-content: flex-end;
					float: right;
					text-align: center;
					height: 50px;
					span:nth-child(1) {
						cursor: pointer;
						color: #000000;
						background: url(http://codegen.caihongy.cn/20241122/6413041513c84d3ca9148687c9fed9f7.webp) center / 100% 100%;
						width: 500px;
						font-size: 18px;
						height: 50px;
					}
					span:nth-child(2) {
						color: #f5f5f5;
						font-size: 12px;
					}
				}
				.about_more:hover {
					opacity: 1;
				}
			}
		}
		#system {
			padding: 30px 30px 0;
			box-shadow: 0 1px 6px rgba(255, 255, 255, .3);
			margin: 0;
			background: url(http://codegen.caihongy.cn/20241122/92b5685e62774cb3b32e432eb26dc67b.webp);
			width: 100%;
			position: relative;
			height: 980px;
			order: 5;
			.system_item {
				padding: 40px 90px 0 0;
				margin: 165px auto 0;
				background: url(http://codegen.caihongy.cn/20241122/c9f94588a94446de892d3c1c1a289992.webp);
				display: flex;
				width: 1290px;
				position: relative;
				flex-wrap: wrap;
				height: 710px;
				.system_title_box {
					padding: 10px 0 0 0;
					top: -165px;
					background: url(http://codegen.caihongy.cn/20241122/6a399e675b9f4081a86f2bea34ed59cb.webp);
					width: 1270px;
					position: absolute;
					height: 120px;
					.system_title {
						color: #FFF;
						font-weight: 600;
						width: 100%;
						font-size: 36px;
						line-height: 1.5;
						text-align: center;
					}
					.system_subtitle {
						margin: 0 0 10px;
						color: #999;
						display: none;
						width: 100%;
						font-size: 20px;
						line-height: 1.5;
						text-align: center;
					}
				}
				.system_img {
					padding: 0;
					display: flex;
					gap: 20px;
					width: 700px;
					flex-wrap: wrap;
					height: 600px;
					order: 2;
					img:nth-child(1) {
						margin: 0;
						object-fit: cover;
						display: block;
						width: 100%;
						height: 350px;
					}
					img:nth-child(2) {
						margin: 0;
						object-fit: cover;
						display: block;
						width: 340px;
						height: 230px;
					}
					img:nth-child(3) {
						margin: 0;
						object-fit: cover;
						display: block;
						width: 340px;
						height: 230px;
					}
				}
				.system_content {
					padding: 0 40px 0 73px;
					margin: 0;
					color: rgb(102, 102, 102);
					width: 500px;
					font-size: 16px;
					line-height: 2;
					order: 1;
				}
				.system_idea1 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.system_idea2 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.system_idea3 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.system_idea4 {
					background: url(http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg) 0% 0% / cover no-repeat;
					display: none;
					width: 285px;
					height: 100px;
				}
				.system_more {
					border: 0;
					margin: 0;
					left: 280px;
					background: url(http://codegen.caihongy.cn/20241122/6413041513c84d3ca9148687c9fed9f7.webp) center / 100% 100%;
					bottom: 70px;
					display: block;
					width: 173px;
					line-height: 50px;
					position: absolute;
					text-align: center;
					span:nth-child(1) {
						color: #000000;
						font-size: 18px;
					}
					span:nth-child(2) {
						color: #f5f5f5;
						font-size: 12px;
					}
				}
				.system_more:hover {
					opacity: 0.5;
				}
			}
		}
		.news {
			padding: 25px 0 55px 0;
			margin: 0 auto;
			background: #FFFFFF;
			width: 1270px;
			position: relative;
			order: 2;
			.news_title_box {
				padding: 14px 0 0 0;
				margin: 0 0 40px 0;
				background: url(http://codegen.caihongy.cn/20241122/cda88df66d42496fa403c0ed98bac06b.webp);
				width: 100%;
				text-align: center;
				height: 120px;
				.news_title {
					color: #896785;
					font-weight: 700;
					font-size: 36px;
				}
				.news_subhead {
					margin: 0 0 10px;
					color: #999;
					display: none;
					width: 100%;
					font-size: 20px;
					line-height: 1.5;
					text-align: center;
				}
			}
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 10px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1.1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list22 {
				padding: 10px;
				width: 100%;
				position: relative;
				height: auto;
				.top-list {
					display: flex;
					width: 100%;
					justify-content: space-between;
					flex-wrap: wrap;
					height: auto;
					.list-item {
						width: 31%;
						position: relative;
						height: auto;
						img {
							object-fit: cover;
							display: block;
							width: 100%;
							height: 300px;
						}
						.infoBox {
							padding: 10px;
							left: 0;
							bottom: 0;
							background: rgba(22, 31, 59, 0.70);
							width: 100%;
							position: absolute;
							.name {
								padding: 0 0px;
								overflow: hidden;
								color: #fff;
								white-space: nowrap;
								font-size: 16px;
								line-height: 44px;
								text-overflow: ellipsis;
							}
							.time_item {
								padding: 0 10px 0 0;
								display: inline-block;
								.icon {
									margin: 0 2px 0 0;
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.label {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.text {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
							}
							.publisher_item {
								padding: 0 10px 0 0;
								display: inline-block;
								.icon {
									margin: 0 2px 0 0;
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.label {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.text {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
							}
							.like_item {
								padding: 0 10px 0 0;
								display: inline-block;
								.icon {
									margin: 0 2px 0 0;
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.label {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.text {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
							}
							.collect_item {
								padding: 0 10px 0 0;
								display: inline-block;
								.icon {
									margin: 0 2px 0 0;
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.label {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.text {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
							}
							.view_item {
								padding: 0 10px 0 0;
								display: inline-block;
								.icon {
									margin: 0 2px 0 0;
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.label {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
								.text {
									color: #fff;
									font-size: 12px;
									line-height: 1.5;
								}
							}
						}
					}
				}
				.list-body {
					display: flex;
					width: 100%;
					justify-content: space-between;
					flex-wrap: wrap;
					height: auto;
					.list-item {
						margin: 20px 0 0 0;
						display: flex;
						width: 31%;
						border-bottom: 4px solid #161F3B;
						height: auto;
						img {
							object-fit: cover;
							display: block;
							width: 150px;
							height: 131px;
						}
						.infoBox {
							padding: 10px;
							overflow: hidden;
							flex: 1;
							height: auto;
							.name {
								padding: 0 10px;
								overflow: hidden;
								color: #333;
								white-space: nowrap;
								width: 100%;
								font-size: 14px;
								line-height: 1.5;
								text-overflow: ellipsis;
							}
							.time_item {
								padding: 0 10px;
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
								padding: 0 10px;
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
								padding: 0 10px;
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
								padding: 0 10px;
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
								padding: 0 10px;
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
						}
					}
				}
			}
			.moreBtn {
				border: 0;
				cursor: pointer;
				margin: 0;
				top: 40px;
				background: url(http://codegen.caihongy.cn/20241122/6413041513c84d3ca9148687c9fed9f7.webp);
				display: block;
				width: 173px;
				line-height: 50px;
				position: absolute;
				right: 0;
				text-align: center;
				height: 50px;
				.text {
					color: #000000;
					font-size: 18px;
				}
				.icon {
					color: #f5f5f5;
					font-size: 12px;
				}
			}
		}
		.recommend {
			margin: 0;
			background: #fff;
			position: relative;
			order: 1;
			.recommend_title_box {
				margin: 0;
				background: url(http://codegen.caihongy.cn/20241120/db3281a5ee5942b0a240b02cb82baf02.webp) no-repeat left;
				width: 100%;
				height: 220px;
				.recommend_title {
					padding: 0 0 0 425px;
					margin: 20px 0 0;
					color: #896785;
					font-weight: 600;
					display: inline-block;
					font-size: 36px;
				}
				.recommend_subhead {
					margin: 0 0 10px;
					color: #999;
					display: none;
					width: 100%;
					font-size: 20px;
					line-height: 1.5;
					text-align: center;
				}
			}
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1.2) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list12 {
				padding: 40px 0 0 0;
				flex-direction: column;
				background: url(http://codegen.caihongy.cn/20241120/4688a445041f4e79912a6367713301d9.webp);
				display: flex;
				width: 100%;
				justify-content: flex-start;
				align-items: center;
				height: 620px;
				.tab_view {
					padding: 40px 0 10px 0;
					margin: 0 auto;
					background: #FFFFFF;
					display: flex;
					gap: 20px;
					width: 1270px;
					justify-content: center;
					height: auto;
					.tab {
						cursor: pointer;
						border-radius: 10px;
						padding: 10px 20px;
						box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3), inset 0px 4px 10px 0px rgba(231,231,231,0.3);
						margin: 0;
						color: #9E9E9E;
						background: #FFFFFF;
						display: flex;
						align-items: center;
						min-width: auot;
						height: 70px;
						img {
							border-radius: 5px;
							margin: 0 15px 0 0;
							object-fit: cover;
							display: block;
							width: 40px;
							height: 40px;
						}
						.text {
							color: inherit;
							font-size: 16px;
						}
					}
					.tab:hover {
						color: #896785;
					}
					.tab.active {
						color: #896785;
						border-color: #999;
						border-width: 0 0 1px 0;
						border-style: solid;
					}
					.more_btn {
						cursor: pointer;
						padding: 5px 10px;
						margin: 0 10px;
						color: #666;
						background: #fff;
						display: flex;
						line-height: 44px;
						align-items: center;
						.text {
							color: inherit;
							font-size: 14px;
						}
						.icon {
							margin: 0 0 0 2px;
							color: inherit;
							font-size: 14px;
						}
					}
					.more_btn:hover {
						color: #896785;
					}
					.tab.active {
						animation-name: mymove;
					
						&:nth-of-type(1) {
							animation-duration: 1s;
						}
						&:nth-of-type(2) {
							animation-duration: 1.2s;
						}
						&:nth-of-type(3) {
							animation-duration: 1.4s;
						}
						&:nth-of-type(4) {
							animation-duration: 1.6s;
						}
						&:nth-of-type(5) {
							animation-duration: 1.8s;
						}
						&:nth-of-type(6) {
							animation-duration: 2s;
						}
					}
					
					@keyframes mymove {
						from {top: 320px;}
						to {top: 0;}
					}
				}
				.list-body {
					padding: 40px 60px 40px ;
					background: #fff;
					display: flex;
					width: 1270px;
					justify-content: space-between;
					height: auto;
					.list-item {
						border-radius: 10px;
						box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3), inset 0px 4px 10px 0px rgba(231,231,231,0.3);
						overflow: hidden;
						background: #FFF;
						width: 16%;
						position: relative;
						height: auto;
						img {
							object-fit: cover;
							display: block;
							width: 100%;
							height: 160px;
						}
						.name {
							padding: 0 10px;
							overflow: hidden;
							color: #333;
							white-space: nowrap;
							font-size: 18px;
							line-height: 32px;
							text-overflow: ellipsis;
							text-align: center;
						}
						.price {
							padding: 10px;
							color: #fff;
							background: #896785;
							font-size: 13px;
							line-height: 1.5;
							text-align: center;
						}
					}
					.list-item.active {
						animation-name: mymove;
					
						&:nth-of-type(1) {
							animation-duration: 1s;
						}
						&:nth-of-type(2) {
							animation-duration: 1.2s;
						}
						&:nth-of-type(3) {
							animation-duration: 1.4s;
						}
						&:nth-of-type(4) {
							animation-duration: 1.6s;
						}
						&:nth-of-type(5) {
							animation-duration: 1.8s;
						}
						&:nth-of-type(6) {
							animation-duration: 2s;
						}
					}
					
					@keyframes mymove {
						from {top: 320px;}
						to {top: 0;}
					}
				}
			}
			.moreBtn {
				border: 0;
				cursor: pointer;
				margin: 0;
				top: 85px;
				background: url(http://codegen.caihongy.cn/20241122/6413041513c84d3ca9148687c9fed9f7.webp);
				display: block;
				width: 173px;
				line-height: 50px;
				position: absolute;
				right: calc(50% - 635px);
				text-align: center;
				height: 50px;
				.text {
					color: #000000;
					font-size: 18px;
				}
				.icon {
					color: #f5f5f5;
					display: none;
					font-size: 12px;
				}
			}
		}
	}
</style>
