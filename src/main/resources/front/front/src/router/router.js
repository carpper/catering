import VueRouter from 'vue-router'
//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import Forum from '../pages/forum/list'
import ForumAdd from '../pages/forum/add'
import ForumDetail from '../pages/forum/detail'
import MyForumList from '../pages/forum/myForumList'
import Storeup from '../pages/storeup/list'
import News from '../pages/news/news-list'
import NewsDetail from '../pages/news/news-detail'
import payList from '../pages/pay'

import qiuzhizheList from '../pages/qiuzhizhe/list'
import qiuzhizheDetail from '../pages/qiuzhizhe/detail'
import qiuzhizheAdd from '../pages/qiuzhizhe/add'
import qiyeList from '../pages/qiye/list'
import qiyeDetail from '../pages/qiye/detail'
import qiyeAdd from '../pages/qiye/add'
import diquList from '../pages/diqu/list'
import diquDetail from '../pages/diqu/detail'
import diquAdd from '../pages/diqu/add'
import gangweifenleiList from '../pages/gangweifenlei/list'
import gangweifenleiDetail from '../pages/gangweifenlei/detail'
import gangweifenleiAdd from '../pages/gangweifenlei/add'
import jiuyexinxiList from '../pages/jiuyexinxi/list'
import jiuyexinxiDetail from '../pages/jiuyexinxi/detail'
import jiuyexinxiAdd from '../pages/jiuyexinxi/add'
import toudixinxiList from '../pages/toudixinxi/list'
import toudixinxiDetail from '../pages/toudixinxi/detail'
import toudixinxiAdd from '../pages/toudixinxi/add'
import mianshixinxiList from '../pages/mianshixinxi/list'
import mianshixinxiDetail from '../pages/mianshixinxi/detail'
import mianshixinxiAdd from '../pages/mianshixinxi/add'
import luyongxinxiList from '../pages/luyongxinxi/list'
import luyongxinxiDetail from '../pages/luyongxinxi/detail'
import luyongxinxiAdd from '../pages/luyongxinxi/add'
import qiyepingjiaList from '../pages/qiyepingjia/list'
import qiyepingjiaDetail from '../pages/qiyepingjia/detail'
import qiyepingjiaAdd from '../pages/qiyepingjia/add'
import chatmessageList from '../pages/chatmessage/list'
import chatmessageDetail from '../pages/chatmessage/detail'
import chatmessageAdd from '../pages/chatmessage/add'
import friendList from '../pages/friend/list'
import friendDetail from '../pages/friend/detail'
import friendAdd from '../pages/friend/add'
import forumtypeList from '../pages/forumtype/list'
import forumtypeDetail from '../pages/forumtype/detail'
import forumtypeAdd from '../pages/forumtype/add'
import forumreportList from '../pages/forumreport/list'
import forumreportDetail from '../pages/forumreport/detail'
import forumreportAdd from '../pages/forumreport/add'
import newstypeList from '../pages/newstype/list'
import newstypeDetail from '../pages/newstype/detail'
import newstypeAdd from '../pages/newstype/add'
import aboutusList from '../pages/aboutus/list'
import aboutusDetail from '../pages/aboutus/detail'
import aboutusAdd from '../pages/aboutus/add'
import systemintroList from '../pages/systemintro/list'
import systemintroDetail from '../pages/systemintro/detail'
import systemintroAdd from '../pages/systemintro/add'
import sensitivewordsList from '../pages/sensitivewords/list'
import sensitivewordsDetail from '../pages/sensitivewords/detail'
import sensitivewordsAdd from '../pages/sensitivewords/add'
import discussjiuyexinxiList from '../pages/discussjiuyexinxi/list'
import discussjiuyexinxiDetail from '../pages/discussjiuyexinxi/detail'
import discussjiuyexinxiAdd from '../pages/discussjiuyexinxi/add'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

//配置路由
export default new VueRouter({
	routes:[
		{
      path: '/',
      redirect: '/index/home'
    },
		{
			path: '/index',
			component: Index,
			children:[
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'pay',
					component: payList,
				},
				{
					path: 'forum',
					component: Forum
				},
				{
					path: 'forumAdd',
					component: ForumAdd
				},
				{
					path: 'forumDetail',
					component: ForumDetail
				},
				{
					path: 'myForumList',
					component: MyForumList
				},
				{
					path: 'storeup',
					component: Storeup
				},
				{
					path: 'news',
					component: News
				},
				{
					path: 'newsDetail',
					component: NewsDetail
				},
				{
					path: 'qiuzhizhe',
					component: qiuzhizheList
				},
				{
					path: 'qiuzhizheDetail',
					component: qiuzhizheDetail
				},
				{
					path: 'qiuzhizheAdd',
					component: qiuzhizheAdd
				},
				{
					path: 'qiye',
					component: qiyeList
				},
				{
					path: 'qiyeDetail',
					component: qiyeDetail
				},
				{
					path: 'qiyeAdd',
					component: qiyeAdd
				},
				{
					path: 'diqu',
					component: diquList
				},
				{
					path: 'diquDetail',
					component: diquDetail
				},
				{
					path: 'diquAdd',
					component: diquAdd
				},
				{
					path: 'gangweifenlei',
					component: gangweifenleiList
				},
				{
					path: 'gangweifenleiDetail',
					component: gangweifenleiDetail
				},
				{
					path: 'gangweifenleiAdd',
					component: gangweifenleiAdd
				},
				{
					path: 'jiuyexinxi',
					component: jiuyexinxiList
				},
				{
					path: 'jiuyexinxiDetail',
					component: jiuyexinxiDetail
				},
				{
					path: 'jiuyexinxiAdd',
					component: jiuyexinxiAdd
				},
				{
					path: 'toudixinxi',
					component: toudixinxiList
				},
				{
					path: 'toudixinxiDetail',
					component: toudixinxiDetail
				},
				{
					path: 'toudixinxiAdd',
					component: toudixinxiAdd
				},
				{
					path: 'mianshixinxi',
					component: mianshixinxiList
				},
				{
					path: 'mianshixinxiDetail',
					component: mianshixinxiDetail
				},
				{
					path: 'mianshixinxiAdd',
					component: mianshixinxiAdd
				},
				{
					path: 'luyongxinxi',
					component: luyongxinxiList
				},
				{
					path: 'luyongxinxiDetail',
					component: luyongxinxiDetail
				},
				{
					path: 'luyongxinxiAdd',
					component: luyongxinxiAdd
				},
				{
					path: 'qiyepingjia',
					component: qiyepingjiaList
				},
				{
					path: 'qiyepingjiaDetail',
					component: qiyepingjiaDetail
				},
				{
					path: 'qiyepingjiaAdd',
					component: qiyepingjiaAdd
				},
				{
					path: 'chatmessage',
					component: chatmessageList
				},
				{
					path: 'chatmessageDetail',
					component: chatmessageDetail
				},
				{
					path: 'chatmessageAdd',
					component: chatmessageAdd
				},
				{
					path: 'friend',
					component: friendList
				},
				{
					path: 'friendDetail',
					component: friendDetail
				},
				{
					path: 'friendAdd',
					component: friendAdd
				},
				{
					path: 'forumtype',
					component: forumtypeList
				},
				{
					path: 'forumtypeDetail',
					component: forumtypeDetail
				},
				{
					path: 'forumtypeAdd',
					component: forumtypeAdd
				},
				{
					path: 'forumreport',
					component: forumreportList
				},
				{
					path: 'forumreportDetail',
					component: forumreportDetail
				},
				{
					path: 'forumreportAdd',
					component: forumreportAdd
				},
				{
					path: 'newstype',
					component: newstypeList
				},
				{
					path: 'newstypeDetail',
					component: newstypeDetail
				},
				{
					path: 'newstypeAdd',
					component: newstypeAdd
				},
				{
					path: 'aboutus',
					component: aboutusList
				},
				{
					path: 'aboutusDetail',
					component: aboutusDetail
				},
				{
					path: 'aboutusAdd',
					component: aboutusAdd
				},
				{
					path: 'systemintro',
					component: systemintroList
				},
				{
					path: 'systemintroDetail',
					component: systemintroDetail
				},
				{
					path: 'systemintroAdd',
					component: systemintroAdd
				},
				{
					path: 'sensitivewords',
					component: sensitivewordsList
				},
				{
					path: 'sensitivewordsDetail',
					component: sensitivewordsDetail
				},
				{
					path: 'sensitivewordsAdd',
					component: sensitivewordsAdd
				},
				{
					path: 'discussjiuyexinxi',
					component: discussjiuyexinxiList
				},
				{
					path: 'discussjiuyexinxiDetail',
					component: discussjiuyexinxiDetail
				},
				{
					path: 'discussjiuyexinxiAdd',
					component: discussjiuyexinxiAdd
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},
	]
})
