import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
	import news from '@/views/modules/news/list'
	import aboutus from '@/views/modules/aboutus/list'
	import diqu from '@/views/modules/diqu/list'
	import discussjiuyexinxi from '@/views/modules/discussjiuyexinxi/list'
	import sensitivewords from '@/views/modules/sensitivewords/list'
	import toudixinxi from '@/views/modules/toudixinxi/list'
	import qiyepingjia from '@/views/modules/qiyepingjia/list'
	import qiye from '@/views/modules/qiye/list'
	import forum from '@/views/modules/forum/list'
	import forumtype from '@/views/modules/forumtype/list'
	import luyongxinxi from '@/views/modules/luyongxinxi/list'
	import systemintro from '@/views/modules/systemintro/list'
	import gangweifenlei from '@/views/modules/gangweifenlei/list'
	import jiuyexinxi from '@/views/modules/jiuyexinxi/list'
	import mianshixinxi from '@/views/modules/mianshixinxi/list'
	import forumreport from '@/views/modules/forumreport/list'
	import messages from '@/views/modules/messages/list'
	import qiuzhizhe from '@/views/modules/qiuzhizhe/list'
	import config from '@/views/modules/config/list'
	import jianlixinxi from '@/views/modules/jianlixinxi/list'
	import newstype from '@/views/modules/newstype/list'


//2.配置路由   注意：名字
export const routes = [{
	path: '/',
	name: '系统首页',
	component: Index,
	children: [{
		// 这里不设置值，是把main作为默认页面
		path: '/',
		name: '系统首页',
		component: Home,
		meta: {icon:'', title:'center', affix: true}
	}, {
		path: '/updatePassword',
		name: '修改密码',
		component: UpdatePassword,
		meta: {icon:'', title:'updatePassword'}
	}, {
		path: '/pay',
		name: '支付',
		component: pay,
		meta: {icon:'', title:'pay'}
	}, {
		path: '/center',
		name: '个人信息',
		component: center,
		meta: {icon:'', title:'center'}
	}
	,{
		path: '/news',
		name: '新闻资讯',
		component: news
	}
	,{
		path: '/aboutus',
		name: '关于我们',
		component: aboutus
	}
	,{
		path: '/diqu',
		name: '地区',
		component: diqu
	}
	,{
		path: '/discussjiuyexinxi',
		name: '招聘信息评论',
		component: discussjiuyexinxi
	}
	,{
		path: '/sensitivewords',
		name: '敏感词',
		component: sensitivewords
	}
	,{
		path: '/toudixinxi',
		name: '应聘信息',
		component: toudixinxi
	}
	,{
		path: '/qiyepingjia',
		name: '企业评价',
		component: qiyepingjia
	}
	,{
		path: '/qiye',
		name: '企业',
		component: qiye
	}
	,{
		path: '/forum',
		name: '互动社区',
		component: forum
	}
	,{
		path: '/forumtype',
		name: '互动社区分类',
		component: forumtype
	}
	,{
		path: '/luyongxinxi',
		name: '录用信息',
		component: luyongxinxi
	}
	,{
		path: '/systemintro',
		name: '系统简介',
		component: systemintro
	}
	,{
		path: '/gangweifenlei',
		name: '岗位分类',
		component: gangweifenlei
	}
	,{
		path: '/jiuyexinxi',
		name: '招聘信息',
		component: jiuyexinxi
	}
	,{
		path: '/mianshixinxi',
		name: '面试信息',
		component: mianshixinxi
	}
	,{
		path: '/forumreport',
		name: '举报记录',
		component: forumreport
	}
	,{
		path: '/qiuzhizhe',
		name: '求职者',
		component: qiuzhizhe
	}
	,{
		path: '/config',
		name: '轮播图管理',
		component: config
	}
	,{
		path: '/jianlixinxi',
		name: '应聘信息',
		component: jianlixinxi
	}
	,{
		path: '/newstype',
		name: '新闻资讯分类',
		component: newstype
	}
	]
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {icon:'', title:'login'}
	},
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {icon:'', title:'register'}
	},
	{
		path: '*',
		component: NotFound
	}
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
	mode: 'hash',
	/*hash模式改为history*/
	routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}
export default router;
