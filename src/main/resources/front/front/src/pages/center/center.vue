<template>
	<div class="center-preview">
		<div class="center-title">{{ title }}</div>
		<div class="center-info">
			<div class="center-info-title">个人信息</div>
			<div class="img-box" v-if="userTableName=='qiuzhizhe'">
				<img :src="sessionForm.touxiang?baseUrl + sessionForm.touxiang:require('@/assets/avator.png')">
			</div>
			<div class="img-box" v-if="userTableName=='qiye'">
				<img :src="sessionForm.qiyetupian?baseUrl + sessionForm.qiyetupian:require('@/assets/avator.png')">
			</div>
			<div class="info-item1" v-if="userTableName=='qiuzhizhe'">
				<span class="icon iconfont icon-shouye-zhihui"></span>
				<div class="label">求职账号：</div>
				<div class="text">{{sessionForm.qiuzhizhanghao}}</div>
			</div>
			<div class="info-item2" v-if="userTableName=='qiuzhizhe'">
				<span class="icon iconfont icon-shouye-zhihui"></span>
				<div class="label">求职姓名：</div>
				<div class="text">{{sessionForm.qiuzhixingming}}</div>
			</div>
			<div class="info-item3" v-if="userTableName=='qiuzhizhe'">
				<span class="icon iconfont icon-shouye-zhihui"></span>
				<div class="label">性别：</div>
				<div class="text">{{sessionForm.xingbie}}</div>
			</div>
			<div class="info-item4" v-if="userTableName=='qiuzhizhe'">
				<span class="icon iconfont icon-shouye-zhihui"></span>
				<div class="label">联系电话：</div>
				<div class="text">{{sessionForm.lianxidianhua}}</div>
			</div>
		
		</div>
	
		<el-tabs class="center-tabs" tab-position="left" @tab-click="handleClick">
			<el-tab-pane label="个人中心">
				<el-form class="center-preview-pv" ref="sessionForm" :model="sessionForm" :rules="rules" label-width="150px">
					<el-form-item class="center-item" v-if="userTableName=='qiuzhizhe'" label="求职账号" prop="qiuzhizhanghao">
						<el-input v-model="sessionForm.qiuzhizhanghao" placeholder="求职账号" readonly></el-input>
					</el-form-item>
					<el-form-item class="center-item" v-if="userTableName=='qiuzhizhe'" label="求职姓名" prop="qiuzhixingming">
						<el-input v-model="sessionForm.qiuzhixingming" placeholder="求职姓名" ></el-input>
					</el-form-item>
					<el-form-item class="center-item" v-if="userTableName=='qiuzhizhe'" label="性别" prop="xingbie">
						<el-select v-model="sessionForm.xingbie" placeholder="请选择性别" >
							<el-option v-for="(item, index) in dynamicProp.xingbie" :key="index" :label="item" :value="item"></el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="center-item" v-if="userTableName=='qiuzhizhe'" label="联系电话" prop="lianxidianhua">
						<el-input v-model="sessionForm.lianxidianhua" placeholder="联系电话" ></el-input>
					</el-form-item>
					<el-form-item class="center-item" v-if="userTableName=='qiuzhizhe'" label="头像" prop="touxiang">
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="1"
							:multiple="true"
							:fileUrls="sessionForm.touxiang?sessionForm.touxiang:''"
							@change="qiuzhizhetouxiangHandleAvatarSuccess"
							></file-upload>
					</el-form-item>
					<el-form-item class="center-btn-item">
						<div class="updateBtn" type="primary" @click="onSubmit('sessionForm')">
							<span class="icon iconfont icon-kaitongfuwu"></span>
							<span class="text">更新信息</span>
						</div>
						<div class="closeBtn" type="danger" @click="logout">
							<span class="icon iconfont icon-shanchu1"></span>
							<span class="text">取消</span>
						</div>
					</el-form-item>
				</el-form>
				<!-- 密码修改区域 -->
				<div class="password-section">
					<div class="password-title">
						<span class="icon iconfont icon-shouye-zhihui"></span>
						<span>修改密码</span>
					</div>
					<el-form class="center-preview-pv" ref="passwordForm" :model="passwordForm" :rules="passwordRules" label-width="150px">
						<el-form-item class="center-item" label="原密码" prop="password">
							<el-input type="password" v-model="passwordForm.password" placeholder="请输入原密码"></el-input>
						</el-form-item>
						<el-form-item class="center-item" label="新密码" prop="newpassword">
							<el-input type="password" v-model="passwordForm.newpassword" placeholder="请输入新密码"></el-input>
						</el-form-item>
						<el-form-item class="center-item" label="确认密码" prop="repassword">
							<el-input type="password" v-model="passwordForm.repassword" placeholder="请确认新密码"></el-input>
						</el-form-item>
						<el-form-item class="center-btn-item">
							<div class="updateBtn" type="primary" @click="updatePassword">
								<span class="icon iconfont icon-kaitongfuwu"></span>
								<span class="text">修改密码</span>
							</div>
						</el-form-item>
					</el-form>
				</div>
			</el-tab-pane>
			<el-tab-pane label="聊天记录" style="width: 100%;" v-if="changeHasChat()">
				<div class="z-box">
						<div class="chat-search-box" style="padding: 0 0 10px 0; width: 100%;">
							<el-input 
								v-model="chatSearchKeyword" 
								placeholder="搜索聊天对象名称" 
								prefix-icon="el-icon-search"
								clearable
								style="width: 100%;">
							</el-input>
						</div>
					<div class="section-content" v-for="item in filteredRecordList" :key="item.id" @click.stop="chatClick(item)">
						<div class="chat-left">
							<img :src="item.picture?baseUrl + item.picture:require('@/assets/avator.png')">
							<div class="chat-info">
								<div class="chat-name">{{item.name}}</div>
								<div class="chat-text">
									<div class="chat-noread" v-if="item.notreadnum">{{item.notreadnum}}</div>
									{{item.content.split('/').length>1&&item.content.split('/')[0]=='upload'?'[图片]':item.content}}
								</div>
							</div>
						</div>
						<div class="chat-btn">
							<div class="friendBtn2" @click.stop="chatDel(item)">删除</div>
						</div>
					</div>
					<div class="noList" v-if="!filteredRecordList.length">
						暂无聊天记录
					</div>
				</div>
			
			</el-tab-pane>
			<el-tab-pane v-for="(item,index) in menuList" :key="index" v-if="hasBack(item.menu)" :label="item.child[0].menu" :name="item.child[0].tableName"></el-tab-pane>
			<el-tab-pane label="我的收藏"></el-tab-pane>
		</el-tabs>

		<el-dialog :visible.sync="chatVisible" @close="clearChat" :title="nowname">
			<div class="chat-content" id="chat-content">
				<div v-bind:key="item.id" v-for="item in chatList">
					<div v-if="item.addtime" class="addtime">{{timeFormat(item.addtime)}}</div>
					<div v-if="item.uid==sessionForm.id" class="right-content">
						<el-alert v-if="item.format==1" class="text-content" :title="item.content" :closable="false"
							type="warning"></el-alert>
						<el-image v-else fit="cover" :src="item.content?baseUrl + item.content:''" style="width: 100px;height: 100px;" :preview-src-list="[item.content?baseUrl + item.content:'']"></el-image>
						<img :src="mypic?baseUrl + mypic:require('@/assets/avator.png')" alt="" style="width: 30px;border-radius: 50%;height: 30px;margin: 0 0 0 10px;" />
					</div>
					<div v-else class="left-content">
						<img :src="nowfpic?baseUrl + nowfpic:require('@/assets/avator.png')" alt="" style="width: 30px;border-radius: 50%;height: 30px;margin: 0 10px 0 0;" />
						<el-alert v-if="item.format==1" class="text-content" :title="item.content" :closable="false"
							type="success"></el-alert>
						<el-image v-else fit="cover" :src="item.content?baseUrl + item.content:''" style="width: 100px;height: 100px;" :preview-src-list="[item.content?baseUrl + item.content:'']"></el-image>
					</div>
					<div class="clear-float"></div>
				</div>
			</div>
			<div slot="footer" class="dialog-footer">
				<el-input @keydown.enter.native="addChat(null)" v-model="chatForm.content" placeholder="请输入内容" style="width: calc(100% - 180px);float: left;">
				</el-input>
				<el-button :disabled="chatForm.content?false:true" type="primary" @click="addChat(null)">发送</el-button>
				<el-upload style="display: inline-block;margin: 0 0 0 6px;" class="upload-demo" :action="uploadUrl" :on-success="uploadSuccess"
					:show-file-list="false">
					<el-button type="success">上传图片</el-button>
				</el-upload>
			</div>
		</el-dialog>
	</div>
</template>

<script>
	import config from '@/config/config';
	import menu from '@/config/menu';
	import Vue from 'vue';
	import timeMethod from '@/common/timeMethod'
	import {
		WebsocketMixin
	} from '@/mixins/WebsocketMixin'
	export default {
		mixins: [WebsocketMixin],
		//数据集合
		data() {
			return {
				title: '个人中心',
				baseUrl: config.baseUrl,
				sessionForm: {},
				passwordForm: {},
				passwordRules: {
					password: [
						{
							required: true,
							message: "密码不能为空",
							trigger: "blur"
						}
					],
					newpassword: [
						{
							required: true,
							message: "新密码不能为空",
							trigger: "blur"
						}
					],
					repassword: [
						{
							required: true,
							message: "确认密码不能为空",
							trigger: "blur"
						}
					]
				},
				rules: {},
				menuList: [],
				disabled: false,
				uploadUrl: config.baseUrl + 'file/upload',
				imageUrl: '',
				headers: {Token: localStorage.getItem('frontToken')},
				userTableName: localStorage.getItem('UserTableName'),
				dynamicProp: {},
				recordList: [],
				chatSearchKeyword: '',
				chatVisible: false,
				nowfid: 0,
				nowfpic:'',
				nowname: '',
				mypic: localStorage.getItem('frontHeadportrait'),
				chatList: [],
				chatForm: {
					content: ''
				},
				hasChatList: [
					'qiuzhizhe',
					'qiye',
					'jiuyexinxi',
				],
				sensitiveWordsArr: [],
			}
		},
		created() {
			let menus = menu.list()
			for(let x in menus){
				if(menus[x].tableName == this.userTableName){
					for(let i in menus[x].backMenu){
						if(menus[x].backMenu[i].menu=='考试管理'){
							menus[x].backMenu.splice(i,1)
						}
					}
					this.menuList = menus[x].backMenu
				}
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.sessionForm, 'qiuzhizhanghao', null);
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.sessionForm, 'mima', null);
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.sessionForm, 'qiuzhixingming', null);
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.sessionForm, 'xingbie', null);
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.sessionForm, 'lianxidianhua', null);
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.sessionForm, 'touxiang', null);
			}

			if ('qiuzhizhe' == this.userTableName&&this.rules['qiuzhizhanghao']){
				this.rules['qiuzhizhanghao'].push({ required: true, message: '请输入求职账号', trigger: 'blur' })
			}else if('qiuzhizhe' == this.userTableName&&!this.rules['qiuzhizhanghao']) {
				this.$set(this.rules, 'qiuzhizhanghao', [{ required: true, message: '请输入求职账号', trigger: 'blur' }]);
			}
			if ('qiuzhizhe' == this.userTableName&&this.rules['mima']){
				this.rules['mima'].push({ required: true, message: '请输入密码', trigger: 'blur' })
			}else if('qiuzhizhe' == this.userTableName&&!this.rules['mima']) {
				this.$set(this.rules, 'mima', [{ required: true, message: '请输入密码', trigger: 'blur' }]);
			}
			if ('qiuzhizhe' == this.userTableName&&this.rules['qiuzhixingming']){
				this.rules['qiuzhixingming'].push({ required: true, message: '请输入求职姓名', trigger: 'blur' })
			}else if('qiuzhizhe' == this.userTableName&&!this.rules['qiuzhixingming']) {
				this.$set(this.rules, 'qiuzhixingming', [{ required: true, message: '请输入求职姓名', trigger: 'blur' }]);
			}
			if ('qiuzhizhe' == this.userTableName) {
				this.$set(this.rules, 'lianxidianhua', [{ required: false, validator: this.$validate.isMobile, trigger: 'blur' }]);
			}

			this.init();
			this.sessionForm = JSON.parse(localStorage.getItem('sessionForm'))
		},
		//计算属性
		computed: {
			// 过滤后的聊天记录列表
			filteredRecordList() {
				if (!this.chatSearchKeyword) {
					return this.recordList;
				}
				const keyword = this.chatSearchKeyword.toLowerCase();
				return this.recordList.filter(item => {
					return item.name && item.name.toLowerCase().includes(keyword);
				});
			}
		},
		//方法集合
		methods: {
			init() {
				if ('qiuzhizhe' == this.userTableName) {
					this.dynamicProp.xingbie = '男,女'.split(',');
				}
				this.getSensitiveWords()
			},
			getSensitiveWords(){
				this.$http.get('sensitivewords/detail/1').then(rs=>{
					this.sensitiveWordsArr = rs.data.data.content.split(',')
				})
			},
			setSession(){
				localStorage.setItem('sessionForm',JSON.stringify(this.sessionForm))
			},
			onSubmit(formName) {
				if(`qiuzhizhe` == this.userTableName && this.sessionForm.touxiang!=null){
					this.sessionForm.touxiang = this.sessionForm.touxiang.replace(new RegExp(this.$config.baseUrl,"g"),"");
				}
				this.$refs[formName].validate((valid) => {
					if (valid) {
						this.$http.post(this.userTableName + '/update', this.sessionForm).then(res => {
							if (res.data.code == 0) {
								this.setSession()
								this.$message({
									message: '更新成功',
									type: 'success',
									duration: 1500
								});
							}
						});
					} else {
						return false;
					}
				});
			},
			qiuzhizhetouxiangHandleAvatarSuccess(fileUrls) {
				this.sessionForm.touxiang = fileUrls;
			},
			handleClick(tab, event) {
				switch(event.target.outerText) {
					case '个人中心':
						tab.$router.push('/index/center');
						break;
					case '聊天记录':
						this.getRecordList()
						break;
					case '我的收藏':
						localStorage.setItem('storeupType', 1);
						tab.$router.push('/index/storeup');
						break;
					default:
						tab.$router.push(`/index/${tab.name}?centerType=1`);
				}

				this.title = event.target.outerText;
			},
			changeHasChat(){
				let table = localStorage.getItem('frontSessionTable')
				for(let x in this.hasChatList){
					if(this.hasChatList[x]==table){
						return true
					}
				}
				return false
			},
			getRecordList() {
				this.$http.get('friend/page2', {
					params: {
						uid: Number(localStorage.getItem('frontUserid')),
						type: 2
					}
				}).then(res => {
					if (res.data && res.data.code == 0) {
						this.recordList = res.data.data.list
					}
				})
			},
			chatClick(row) {
				this.nowfid = row.fid
				this.nowfpic = row.picture
				this.nowname = row.name
				this.initWebSocket(this.nowfid)
				this.getChatList()
				this.chatVisible = true
			},
			chatDel(row){
				this.$confirm('是否删除聊天记录？').then(_ => {
					let arr = []
					let brr = []
					this.$http.get('chatmessage/list',{params: {
						page: 1,
						limit: 10000,
						uid: Number(localStorage.getItem('frontUserid')),
						fid: row.fid
					}}).then(rs=>{
						if(rs.data.data.list.length){
							for(let x in rs.data.data.list){
								arr.push(rs.data.data.list[x].id)
							}
						}
						this.$http.get('chatmessage/list',{params: {
							page: 1,
							limit: 10000,
							uid: row.fid,
							fid: Number(localStorage.getItem('frontUserid'))
						}}).then(rs2=>{
							if(rs2.data.data.list.length){
								for(let x in rs2.data.data.list){
									arr.push(rs2.data.data.list[x].id)
								}
							}
							if(arr.length){
								this.$http.post('chatmessage/delete',arr).then(()=>{})
							}
							this.$http.get('friend/list',{params: {
								page: 1,
								limit: 10000,
								uid: row.fid,
								fid: Number(localStorage.getItem('frontUserid')),
								type: 0
							}}).then(rs3=>{
								if(rs3.data.data.list.length){
									for(let x in rs3.data.data.list){
										brr.push(rs3.data.data.list[x].id)
									}
								}
								this.$http.get('friend/list',{params: {
									page: 1,
									limit: 10000,
									fid: row.fid,
									uid: Number(localStorage.getItem('frontUserid')),
									type: 0
								}}).then(rs4=>{
									if(rs4.data.data.list.length){
										for(let x in rs4.data.data.list){
											brr.push(rs4.data.data.list[x].id)
										}
									}
									this.$http.get('friend/list',{params: {
										page: 1,
										limit: 10000,
										fid: row.fid,
										uid: Number(localStorage.getItem('frontUserid')),
										type: 2
									}}).then(rs5=>{
										if(rs5.data.data.list.length){
											for(let x in rs5.data.data.list){
												brr.push(rs5.data.data.list[x].id)
											}
										}
										this.$http.get('friend/list',{params: {
											page: 1,
											limit: 10000,
											uid: row.fid,
											fid: Number(localStorage.getItem('frontUserid')),
											type: 2
										}}).then(rs6=>{
											if(rs6.data.data.list.length){
												for(let x in rs6.data.data.list){
													brr.push(rs6.data.data.list[x].id)
												}
											}
											this.$http.post('friend/delete',brr).then(()=>{
												this.$message.success('删除成功')
												this.getRecordList()
											})
										})
									})
								})
							})
						})
					})
				}).catch(_ => {});
			},
			websocketOnopen: function() {
				
			},
			websocketOnmessage:function(e) {
				this.getChatList()
			},
			getChatList() {
				this.$http.get('chatmessage/mlist', {
					params: {
						page: 1,
						limit: 1000,
						uid: Number(localStorage.getItem('frontUserid')),
						fid: this.nowfid
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
				this.chatList = []
				this.getRecordList()
			},
			uploadSuccess(res) {
				if (res.code == 0) {
					this.addChat('upload/' + res.file);
				}
			},
			addChat(ask=null) {
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
					fid: this.nowfid,
					content: ask?ask:this.chatForm.content,
					format: ask?2:1
				}).then(res2 => {
					this.websocketSend(ask?ask:this.chatForm.content)
					this.chatForm = {
						content: ''
					}
					this.getChatList()
				})
			},
			async updatePassword(){
				this.$refs["passwordForm"].validate(async valid => {
					if (valid) {
						var password = "";
						if (this.sessionForm.mima) {
							password = this.sessionForm.mima;
						} else if (this.sessionForm.password) {
							password = this.sessionForm.password;
						}
						if (this.userTableName == 'qiuzhizhe') {
						}
						if (this.passwordForm.password != password) {
							this.$message.error("原密码错误");
							return;
						}
						if (this.passwordForm.newpassword != this.passwordForm.repassword) {
							this.$message.error("两次密码输入不一致");
							return;
						}
						if (this.passwordForm.newpassword == this.passwordForm.password) {
							this.$message.error("新密码与原密码相同！");
							return;
						}
						this.sessionForm.password = this.passwordForm.newpassword;
						this.sessionForm.mima = this.passwordForm.newpassword;
						this.$http.post(`${this.userTableName}/update`,this.sessionForm).then(({data})=>{
							if (data && data.code === 0) {
								this.$message({
									message: "修改密码成功,下次登录系统生效",
									type: "success",
									duration: 1500,
									onClose: () => {
									}
								});
								this.setSession()
							} else {
								this.$message.error(data.msg);
							}
						});
					}
				})
			},
			logout() {
				localStorage.clear();
				Vue.http.headers.common['Token'] = "";
				this.$router.push('/index/home');
				this.activeIndex = '0'
				localStorage.setItem('keyPath', this.activeIndex)
				this.$forceUpdate()
				this.$message({
					message: '登出成功',
					type: 'success',
					duration: 1500,
				});
			},
			hasBack(name){
				switch(name){
					case '我的收藏管理':
						return false
						break;
					default:
						return true
				}
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.center-preview {
		margin: 10px auto;
		align-content: flex-start;
		background: #FAFCFF;
		display: flex;
		width: 1270px;
		align-items: flex-start;
		position: relative;
		flex-wrap: wrap;
		.center-title {
			margin: 0 0 40px 0;
			color: #896785;
			background: url(http://codegen.caihongy.cn/20241122/cda88df66d42496fa403c0ed98bac06b.webp) no-repeat bottom;
			font-weight: 600px;
			width: 101%;
			font-size: 36px;
			line-height: 160px;
			text-align: center;
		}
		.center-info {
			border-radius: 10px;
			padding: 20px;
			box-shadow: 0 1px 6px rgba(0, 0, 0, 0.3);
			margin: 0 40px 0 0;
			background: #ffffff;
			display: none;
			vertical-align: top;
			width: 360px;
			height: auto;
			.center-info-title {
				color: #333;
				display: none;
				width: 100%;
				font-size: 15px;
				border-color: #efefef;
				border-width: 0 0 1px 0;
				line-height: 44px;
				border-style: solid;
				height: 44px;
			}
			.img-box {
				width: 100%;
				font-size: 0;
				height: auto;
				img {
					border-radius: 100%;
					margin: 10px auto;
					object-fit: cover;
					display: block;
					width: 80px;
					border-color: #efefef;
					border-width: 0 0 1px 0;
					border-style: solid;
					height: 80px;
				}
			}
			.info-item1 {
				border-radius: 10px;
				padding: 0 20px;
				margin: 0 0 10px 0;
				background: #F5F6FA;
				display: flex;
				width: 100%;
				line-height: 40px;
				height: auto;
				.icon {
					padding: 0 5px;
					color: #333;
					font-size: 14px;
				}
				.label {
					color: #333;
					font-size: 14px;
				}
				.text {
					color: #333;
					flex: 1;
					font-size: 14px;
					text-align: right;
				}
			}
			.info-item2 {
				border-radius: 10px;
				padding: 0 20px;
				margin: 0 0 10px 0;
				background: #F5F6FA;
				display: flex;
				width: 100%;
				line-height: 40px;
				height: auto;
				.icon {
					padding: 0 5px;
					color: #333;
					font-size: 14px;
				}
				.label {
					color: #333;
					font-size: 14px;
				}
				.text {
					color: #333;
					flex: 1;
					font-size: 14px;
					text-align: right;
				}
			}
			.info-item3 {
				border-radius: 10px;
				padding: 0 20px;
				margin: 0 0 10px 0;
				background: #F5F6FA;
				display: flex;
				width: 100%;
				line-height: 40px;
				height: auto;
				.icon {
					padding: 0 5px;
					color: #333;
					font-size: 14px;
				}
				.label {
					color: #333;
					font-size: 14px;
				}
				.text {
					color: #333;
					flex: 1;
					font-size: 14px;
					text-align: right;
				}
			}
			.info-item4 {
				border-radius: 10px;
				padding: 0 20px;
				margin: 0 0 10px 0;
				background: #F5F6FA;
				display: flex;
				width: 100%;
				line-height: 40px;
				height: auto;
				.icon {
					padding: 0 5px;
					color: #333;
					font-size: 14px;
				}
				.label {
					color: #333;
					font-size: 14px;
				}
				.text {
					color: #333;
					flex: 1;
					font-size: 14px;
					text-align: right;
				}
			}
			.info-item5 {
				border-radius: 10px;
				padding: 0 20px;
				margin: 0 0 10px 0;
				background: #F5F6FA;
				display: flex;
				width: 100%;
				line-height: 40px;
				height: auto;
				.icon {
					padding: 0 5px;
					color: #333;
					font-size: 14px;
				}
				.label {
					color: #333;
					font-size: 14px;
				}
				.text {
					color: #333;
					flex: 1;
					font-size: 14px;
					text-align: right;
				}
			}
			.info-item6 {
				border-radius: 10px;
				padding: 0 20px;
				margin: 0 0 10px 0;
				background: #F5F6FA;
				display: flex;
				width: 100%;
				line-height: 40px;
				height: auto;
				.icon {
					padding: 0 5px;
					color: #333;
					font-size: 14px;
				}
				.label {
					color: #333;
					font-size: 14px;
				}
				.text {
					color: #333;
					flex: 1;
					font-size: 14px;
					text-align: right;
				}
			}
		}
		.center-tabs.el-tabs {
			background: #F5F6FA;
			display: flex;
			width: 101%;
			::v-deep  .el-tabs__header {
				padding: 20px;
				margin: 0;
				background: #F5F6FA;
				width: 170px;
				border-color: #eee;
				border-width: 0 1px 0 0;
				position: relative;
				float: left;
				border-style: solid;
			}
			::v-deep  .el-tabs__header .el-tabs__item {
				padding: 0 10px;
				margin: 0 0 20px 0;
				color: #333;
				background: url(http://codegen.caihongy.cn/20241201/1440813c76a74d28b7a0b635b56afecd.webp) no-repeat center / 100% 100%;
				font-weight: 500;
				font-size: 14px;
				line-height: 50px;
				position: relative;
				text-align: center;
				height: 50px;
			}
			::v-deep  .el-tabs__header .el-tabs__item:hover {
				padding: 0 10px;
				margin: 0 0 20px 0;
				color: #333;
				background: url(http://codegen.caihongy.cn/20241201/d4371a7ade164da783f048aec24e518c.webp) no-repeat center / 100% 100%;
				font-weight: 500;
				font-size: 14px;
				line-height: 50px;
				position: relative;
				text-align: center;
				height: 50px;
			}
			::v-deep  .el-tabs__header .el-tabs__item.is-active {
				padding: 0 10px;
				margin: 0 0 20px 0;
				color: #333;
				background: url(http://codegen.caihongy.cn/20241201/d4371a7ade164da783f048aec24e518c.webp) no-repeat center / 100% 100%;
				font-weight: 500;
				font-size: 14px;
				line-height: 50px;
				position: relative;
				text-align: center;
				height: 50px;
			}
			::v-deep  .el-tabs__content {
				padding: 40px 40px 40px 0;
				background: #fff;
				flex: 1;
				width: 100%;
			}
			::v-deep  .el-tabs__content .el-tab-pane {
				width: 100%;
			}
			& ::v-deep  .el-tabs__header {
				.el-tabs__nav{
					overflow: auto;
				}
				::-webkit-scrollbar {
					-webkit-appearance: none;
					width: 6px;
					height: 6px;
				}
				::-webkit-scrollbar-track {
					background: rgba(0, 0, 0, 0.1);
					border-radius: 0;
				}
				::-webkit-scrollbar-thumb {
					cursor: pointer;
					border-radius: 5px;
					background: rgba(0, 0, 0, 0.15);
					transition: color 0.2s ease;
				}
				::-webkit-scrollbar-thumb:hover {
					background: rgba(0, 0, 0, 0.3);
				}
				.el-tabs__nav-wrap {
					margin: 0;
					&::after {
						content: none;
					}
				}
				.el-tabs__active-bar {
					display: none !important;
				}
			}
			.password-section {
				margin-top: 30px;
				padding-top: 20px;
				border-top: 1px dashed #ddd;
				.password-title {
					margin: 0 0 20px 150px;
					color: #896785;
					font-size: 16px;
					font-weight: 600;
					.icon {
						margin-right: 5px;
						font-size: 14px;
					}
				}
			}
			.center-preview-pv {
				.center-item.el-form-item {
					padding: 0;
					margin: 0 0 16px;
					background: none;
					::v-deep  .el-form-item__label {
						padding: 0 10px 0 0;
						color: #666;
						font-weight: 500;
						width: 150px;
						font-size: 14px;
						line-height: 40px;
						text-align: right;
					}
					.el-form-item__content {
						margin-left: 150px;
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
						width: 100%;
						font-size: 14px;
						height: 40px;
					}
					.el-input ::v-deep  .el-input__inner[readonly="readonly"] {
						border: 0;
						cursor: not-allowed;
						border-radius: 4px;
						padding: 0 12px;
						box-shadow: none;
						outline: none;
						color: rgba(85, 85, 127, 1.0);
						width: 100%;
						font-size: 14px;
						height: 40px;
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
						width: 100%;
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
						width: 100%;
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
					::v-deep  .el-input__inner::placeholder {
						color: #123;
						font-size: 14px;
					}
				}
				.center-btn-item {
					padding: 0;
					margin: 0;
					.updateBtn {
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
							color: #FFF;
						}
						.text {
							color: #FFF;
						}
					}
					.updateBtn:hover {
						background: #896785;
						.icon {
							color: #FFF;
						}
						.text {
							color: #FFF;
						}
					}
					.closeBtn {
						border: 1px solid #2D2747;
						cursor: pointer;
						padding: 0 15px;
						margin: 0 20px 0 0;
						color: #FFF;
						display: inline-block;
						font-size: 14px;
						line-height: 40px;
						border-radius: 4px;
						outline: none;
						background: #2D2747;
						width: auto;
						height: 40px;
						.icon {
							color: #FFF;
						}
						.text {
							color: #FFF;
						}
					}
					.closeBtn:hover {
						color: #FFF;
						border-color: #2D2747;
						.icon {
							color: #FFF;
						}
						.text {
							color: #FFF;
						}
					}
				}
				.el-date-editor.el-input {
					width: auto;
				}
			}
		}
	}
	.z-box {
		padding: 10px;
		margin: 0 auto;
		display: flex;
		width: 100%;
		justify-content: space-between;
		flex-wrap: wrap;
		.section-content {
			cursor: pointer;
			padding: 20px;
			box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.3), inset 0px 4px 10px 0px rgba(231,231,231,0.3);
			margin: 0 0 20px;
			color: #333;
			background: #fff;
			width: 48%;
			border-color: #efefef;
			border-width: 0;
			align-items: center;
			position: relative;
			border-style: solid;
			.chat-left {
				display: flex;
				align-items: center;
				img {
					border-radius: 10px;
					width: 60px;
					transition: all .4s;
					height: 60px;
				}
				.chat-info {
					margin: 0 0 0 10px;
					flex-direction: column;
					display: flex;
					align-items: flex-start;
					.chat-name {
						color: #888;
						flex: 1;
						font-weight: bold;
						font-size: 14px;
						transition: all .4s;
					}
					.chat-text {
						color: #888;
						flex: 1;
						display: flex;
						font-size: 12px;
						line-height: 1.5;
						align-items: center;
						transition: all .4s;
						.chat-noread {
							border-radius: 50%;
							padding: 0 5px;
							margin: 0 2px 0 0;
							color: #fff;
							background: #f00;
							width: auto;
							font-size: 12px;
							line-height: 16px;
							text-align: center;
							height: 16px;
						}
					}
				}
			}
			.chat-btn {
				margin: 10px 0 0 0;
				display: flex;
				width: 100%;
				justify-content: space-between;
				.friendBtn1 {
					padding: 0px 10px;
					margin: 0px;
					color: #fff;
					background: #896785;
					text-decoration: none;
					width: 80px;
					font-size: 12px;
					line-height: 30px;
					text-align: center;
					height: 30px;
				}
				.friendBtn1:hover {
					background: #896785;
				}
				.friendBtn2 {
					padding: 0px 10px;
					margin: 0px;
					color: #fff;
					background: #2D2747;
					text-decoration: none;
					width: 80px;
					font-size: 12px;
					line-height: 30px;
					text-align: center;
					height: 30px;
				}
				.friendBtn2:hover {
					background: #2D2747;
				}
			}
		}
		.section-content:hover {
			color: #fff;
			background: #DF847F10;
			.chat-left {
				img {
					border-radius: 5px;
				}
				.chat-info {
					.chat-name {
						color: #000;
					}
					.chat-text {
						color: #000;
						font-size: 13px;
					}
				}
			}
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
	.noList {
		color: #9e9e9e;
		width: 100%;
		text-align: center;
		padding: 60px 0;
	}
</style>
