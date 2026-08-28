<template>
	<div class="home-content">
		<!-- title -->
		<div id="home-title" class="home-title animate__animated">
			<div class="titles" >
				{{this.$project.projectName}}
			</div>
		</div>
		<!-- statis -->
		<div class="statis-box">
			<div id="statis1" v-if="isAdmin" class="statis1 animate__animated">
				<div class="left">
					<span class="icon iconfont icon-zhangjie8"></span>
				</div>
				<div class="right">
					<div class="num">{{qiuzhizheCount}}</div>
					<div class="name">求职者总数</div>
				</div>
			</div>
			<div id="statis2" class="statis2 animate__animated">
				<div class="left">
					<span class="icon iconfont icon-chujia3"></span>
				</div>
				<div class="right">
					<div class="num">{{jiuyexinxiCount}}</div>
					<div class="name">招聘信息总数</div>
				</div>
			</div>
			<div id="statis3" class="statis3 animate__animated">
				<div class="left">
					<span class="icon iconfont icon-qita3"></span>
				</div>
				<div class="right">
					<div class="num">{{toudixinxiCount}}</div>
					<div class="name">应聘信息总数</div>
				</div>
			</div>
			<div id="statis4" class="statis4 animate__animated">
				<div class="left">
					<span class="icon iconfont icon-liulan12"></span>
				</div>
				<div class="right">
					<div class="num">{{luyongxinxiCount}}</div>
					<div class="name">录用信息总数</div>
				</div>
			</div>
		</div>
		<!-- statis -->
	
		<!-- echarts -->
		<!-- 4 -->
		<div class="type4">
			<div id="qiuzhizheChart1" v-if="isAdmin" class="echarts1 animate__animated"></div>
			<div id="jiuyexinxiChart1" class="echarts2 animate__animated"></div>
			<div id="toudixinxiChart1" class="echarts3 animate__animated"></div>
			<div id="luyongxinxiChart1" class="echarts4 animate__animated"></div>
		</div>
	</div>
</template>
<script>
import 'animate.css'
//4
import router from '@/router/router-static'
import * as echarts from 'echarts'
export default {
	data() {
		return {
			qiuzhizheCount: 0,
			jiuyexinxiCount: 0,
			toudixinxiCount: 0,
			luyongxinxiCount: 0,
			line: {"backgroundColor":"transparent","yAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":15,"backgroundColor":"transparent","borderColor":"#000","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":true,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#666","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,0.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"xAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":4,"backgroundColor":"transparent","borderColor":"#000","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":true,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":false},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"color":["#02DFD8","#91cc75","#fac858","#ee6666","#73c0de","#3ba272","#fc8452","#9a60b4","#ea7ccc"],"legend":{"padding":0,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"orient":"horizontal","shadowBlur":0,"bottom":"auto","itemHeight":14,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"#333","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"right":"auto","top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"right","borderWidth":0,"width":"80%","itemWidth":20,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":24,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"showSymbol":true,"symbol":"emptyCircle","symbolSize":4},"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"title":{"borderType":"solid","padding":0,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"left","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","fontSize":14,"lineHeight":24,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":600,"textBorderColor":"#666","textShadowBlur":0},"shadowColor":"transparent"}},
			bar: {"backgroundColor":"transparent","yAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":12,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":true,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#666","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,0.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"xAxis":{"axisLabel":{"borderType":"solid","rotate":0,"padding":0,"shadowOffsetX":0,"margin":4,"backgroundColor":"transparent","borderColor":"#000","shadowOffsetY":0,"color":"#333","shadowBlur":0,"show":true,"inside":false,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"width":"","fontSize":12,"lineHeight":24,"shadowColor":"transparent","fontWeight":"normal","height":""},"axisTick":{"show":true,"length":5,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"inside":false},"splitLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":false},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"cap":"butt","color":"#333","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"rgba(0,0,0,.5)"},"show":true},"splitArea":{"show":false,"areaStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"rgba(25,25,25,.3)","opacity":1,"shadowBlur":10,"shadowColor":"rgba(0,0,0,.5)"}}},"color":["#0091ce","#00c3d5","#566dad","#00c3d5","#566dad","#00c3d5","#566dad"],"legend":{"padding":0,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"orient":"horizontal","shadowBlur":0,"bottom":"auto","itemHeight":14,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"#333","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"right":"auto","top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"right","borderWidth":0,"width":"80%","itemWidth":20,"textStyle":{"textBorderWidth":0,"color":"inherit","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":12,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"barWidth":"auto","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"#666","shadowOffsetY":0,"color":"","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"#000"},"colorBy":"data","barCategoryGap":"20%"},"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"title":{"borderType":"solid","padding":0,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"left","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","fontSize":14,"lineHeight":24,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":600,"textBorderColor":"#666","textShadowBlur":0},"shadowColor":"transparent"},"base":{"animate":false,"interval":2000}},
			pie: {"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"backgroundColor":"transparent","color":["#FF6A01","#91cc75","#fac858","#ee6666","#73c0de","#3ba272","#fc8452","#9a60b4","#ea7ccc"],"title":{"borderType":"solid","padding":0,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"left","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#333","textShadowColor":"transparent","fontSize":14,"lineHeight":14,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":600,"textBorderColor":"#666","textShadowBlur":0},"shadowColor":"transparent"},"legend":{"padding":0,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#666","shadowOffsetY":0,"orient":"horizontal","shadowBlur":0,"bottom":"auto","itemHeight":2,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"inherit","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"right":0,"top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"right","borderWidth":0,"width":"80%","itemWidth":2,"textStyle":{"textBorderWidth":0,"color":"inherit","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":12,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"#666","shadowOffsetY":0,"color":"","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"#000"},"label":{"borderType":"solid","rotate":0,"padding":0,"textBorderWidth":0,"backgroundColor":"transparent","borderColor":"#666","color":"inherit","show":true,"textShadowColor":"transparent","distanceToLabelLine":5,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"fontSize":12,"lineHeight":18,"textShadowOffsetX":0,"position":"outside","textShadowOffsetY":0,"textBorderType":"solid","textBorderColor":"#666","textShadowBlur":0},"labelLine":{"show":true,"length":10,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"#666","shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"#000"},"length2":14,"smooth":false}}},
			funnel: {"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"backgroundColor":"transparent","color":["#5470c6","#91cc75","#fac858","#ee6666","#73c0de","#3ba272","#fc8452","#9a60b4","#ea7ccc"],"title":{"borderType":"solid","padding":2,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#ccc","shadowOffsetY":0,"shadowBlur":0,"bottom":"auto","show":true,"right":"auto","top":"auto","borderRadius":0,"left":"center","borderWidth":0,"textStyle":{"textBorderWidth":0,"color":"#666","textShadowColor":"transparent","fontSize":14,"lineHeight":12,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"#ccc","textShadowBlur":0},"shadowColor":"transparent"},"legend":{"padding":5,"itemGap":10,"shadowOffsetX":0,"backgroundColor":"transparent","borderColor":"#ccc","shadowOffsetY":0,"orient":"vertical","shadowBlur":0,"bottom":"auto","itemHeight":2,"show":true,"icon":"roundRect","itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"inherit","shadowOffsetY":0,"color":"inherit","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"transparent"},"top":"auto","borderRadius":0,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"color":"inherit","shadowBlur":0,"width":"auto","type":"inherit","opacity":1,"shadowColor":"transparent"},"left":"left","borderWidth":0,"width":"auto","itemWidth":2,"textStyle":{"textBorderWidth":0,"color":"inherit","textShadowColor":"transparent","ellipsis":"...","overflow":"none","fontSize":12,"lineHeight":20,"textShadowOffsetX":0,"textShadowOffsetY":0,"textBorderType":"solid","fontWeight":500,"textBorderColor":"transparent","textShadowBlur":0},"shadowColor":"rgba(0,0,0,.3)","height":"auto"},"series":{"itemStyle":{"borderType":"solid","shadowOffsetX":0,"borderColor":"#000","shadowOffsetY":0,"color":"","shadowBlur":0,"borderWidth":0,"opacity":1,"shadowColor":"#000"},"label":{"borderType":"solid","rotate":0,"padding":0,"textBorderWidth":0,"backgroundColor":"transparent","borderColor":"#fff","color":"","show":true,"textShadowColor":"transparent","distanceToLabelLine":5,"ellipsis":"...","overflow":"none","borderRadius":0,"borderWidth":0,"fontSize":12,"lineHeight":18,"textShadowOffsetX":0,"position":"outside","textShadowOffsetY":0,"textBorderType":"solid","textBorderColor":"#fff","textShadowBlur":0},"labelLine":{"show":true,"length":10,"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"shadowBlur":0,"width":1,"type":"solid","opacity":1,"shadowColor":"#000"},"length2":14,"smooth":false}}},
			boardBase: {"funnelNum":15,"lineNum":15,"gaugeNum":15,"barNum":15,"pieNum":15},
			gauge: {"tooltip":{"backgroundColor":"#123","textStyle":{"color":"#fff"}},"backgroundColor":"transparent","color":["#5470c6","#91cc75","#fac858","#ee6666","#73c0de","#3ba272","#fc8452","#9a60b4","#ea7ccc"],"title":{"top":"top","left":"left","textStyle":{"fontSize":14,"lineHeight":24,"color":"#333","fontWeight":600}},"series":{"pointer":{"offsetCenter":[0,"10%"],"icon":"path://M2.9,0.7L2.9,0.7c1.4,0,2.6,1.2,2.6,2.6v115c0,1.4-1.2,2.6-2.6,2.6l0,0c-1.4,0-2.6-1.2-2.6-2.6V3.3C0.3,1.9,1.4,0.7,2.9,0.7z","width":8,"length":"80%"},"axisLine":{"lineStyle":{"shadowOffsetX":0,"shadowOffsetY":0,"opacity":0.5,"shadowBlur":1,"shadowColor":"#000"},"roundCap":true},"anchor":{"show":true,"itemStyle":{"color":"inherit"},"size":18,"showAbove":true},"emphasis":{"disabled":false},"progress":{"show":true,"roundCap":true,"overlap":true},"splitNumber":25,"detail":{"formatter":"{value}","backgroundColor":"inherit","color":"#fff","borderRadius":3,"width":20,"fontSize":12,"height":10},"title":{"fontSize":14},"animation":true}},
		};
	},
	mounted(){
		this.init();
		if(this.isAdmin) {
			this.getqiuzhizheCount();
			this.qiuzhizheChat1();
		}
		this.getjiuyexinxiCount();
		this.jiuyexinxiChat1();
		this.gettoudixinxiCount();
		this.toudixinxiChat1();
		this.getluyongxinxiCount();
		this.luyongxinxiChat1();
		window.addEventListener('scroll', this.handleScroll)
		setTimeout(()=>{
			this.handleScroll()
		},100)
	},
	computed: {
		avatar(){
			return this.$storage.get('headportrait')?this.$storage.get('headportrait'):''
		},
		isAdmin(){
			return this.$storage.get('sessionTable') === 'users'
		},
	},
	methods:{
		handleScroll() {
			let arr = [
				{id:'home-title',css:'animate__fadeInUp'},
				{id:'statis1',css:'animate__fadeInUp'},
				{id:'statis2',css:'animate__fadeInUp'},
				{id:'statis3',css:'animate__fadeInUp'},
				{id:'statis4',css:'animate__fadeInUp'},
				{id:'qiuzhizheChart1',css:'animate__fadeInUp'},
				{id:'jiuyexinxiChart1',css:'animate__fadeInUp'},
				{id:'toudixinxiChart1',css:'animate__fadeInUp'},
				{id:'luyongxinxiChart1',css:'animate__fadeInUp'},
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
		// 统计图动画
		myChartInterval(type, xAxisData, seriesData, myChart) {
			this.$nextTick(() => {
				setInterval(() => {
					let xAxis = xAxisData.shift()
					xAxisData.push(xAxis)
					let series = seriesData.shift()
					seriesData.push(series)
				
					if (type == 1) {
						myChart.setOption({
							xAxis: [{
								data: xAxisData
							}],
							series: [{
								data: seriesData
							}]
						});
					}
					if (type == 2) {
						myChart.setOption({
							yAxis: [{
								data: xAxisData
							}],
							series: [{
								data: seriesData
							}]
						});
					}
				}, $template2.back.board.bar.base.interval);
			})
		},
		init(){
			if(this.$storage.get('Token')){
				this.$http({
					url: `${this.$storage.get('sessionTable')}/session`,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code != 0) {
						router.push({ name: 'login' })
					}
				});
			}else{
				router.push({ name: 'login' })
			}
		},
		getqiuzhizheCount() {
			this.$http({
				url: `qiuzhizhe/count`,
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code == 0) {
					this.qiuzhizheCount = data.data
				}
			})
		},
// 1234 饼3 - 求职者性别统计
		qiuzhizheChat1() {
			this.$nextTick(()=>{
				var qiuzhizheChart1 = echarts.init(document.getElementById("qiuzhizheChart1"),'macarons');
				this.$http({
					url: "qiuzhizhe/group/xingbie",
					method: "get",
				}).then(({ data }) => {
					if (data && data.code === 0) {
						let res = data.data;
						console.log('求职者性别统计数据:', res);
						
						// 处理数据：过滤掉空值，合并男女数据
						let genderData = {};
						res.forEach(item => {
							let gender = item.xingbie;
							if (!gender || gender.trim() === '') {
								gender = '未填写';
							}
							if (!genderData[gender]) {
								genderData[gender] = 0;
							}
							genderData[gender] += parseInt(item.total);
						});
						
						let pArray = Object.keys(genderData).map(key => ({
							value: genderData[key],
							name: key
						}));
						
						// 如果没有数据，显示默认数据
						if (pArray.length === 0) {
							pArray = [
								{value: 0, name: '暂无数据'}
							];
						}
						
						let option = {
							title: {
								text: '求职者性别统计',
								left: 'center',
								top: 10,
								textStyle: {
									fontSize: 16,
									fontWeight: 'bold'
								}
							},
							tooltip: {
								trigger: 'item',
								formatter: '{b}: {c}人 ({d}%)'
							},
							legend: {
								orient: 'vertical',
								left: 'left',
								top: 'middle',
								itemWidth: 14,
								itemHeight: 14
							},
							series: [{
								type: 'pie',
								radius: ['40%', '70%'],
								center: ['60%', '55%'],
								avoidLabelOverlap: true,
								itemStyle: {
									borderRadius: 10,
									borderColor: '#fff',
									borderWidth: 2
								},
								label: {
									show: true,
									formatter: '{b}\n{c}人 ({d}%)'
								},
								emphasis: {
									label: {
										show: true,
										fontSize: 16,
										fontWeight: 'bold'
									}
								},
								data: pArray
							}]
						};
						
						qiuzhizheChart1.setOption(option);
						window.onresize = function() {
							qiuzhizheChart1.resize();
						};
					} else {
						console.error('求职者统计数据加载失败:', data.msg);
						// 显示默认空数据
						let option = {
							title: {
								text: '求职者性别统计',
								left: 'center',
								top: 10
							},
							series: [{
								type: 'pie',
								radius: ['40%', '70%'],
								center: ['50%', '55%'],
								data: [{value: 0, name: '暂无数据'}]
							}]
						};
						qiuzhizheChart1.setOption(option);
					}
				}).catch(err => {
					console.error('求职者统计请求异常:', err);
				});
			})
		},


		getjiuyexinxiCount() {
			this.$http({
				url: `jiuyexinxi/count`,
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code == 0) {
					this.jiuyexinxiCount = data.data
				}
			})
		},
// 1234 圆
		jiuyexinxiChat1() {
			this.$nextTick(()=>{

				var jiuyexinxiChart1 = echarts.init(document.getElementById("jiuyexinxiChart1"),'macarons');
				this.$http({
					url: "jiuyexinxi/group/gangweileixing",
					method: "get",
				}).then(({ data }) => {
					if (data && data.code === 0) {
						let res = data.data;
						let xAxis = [];
						let yAxis = [];
						let pArray = []
						for(let i=0;i<res.length;i++){
							if(this.boardBase&&i==this.boardBase.barNum){
								break;
							}
							xAxis.push(res[i].gangweileixing);
							yAxis.push(parseFloat((res[i].total)));
							pArray.push({
								value: parseFloat((res[i].total)),
								name: res[i].gangweileixing
							})
						}
						var option = {};
						let titleObj = this.bar.title
						titleObj.text = '招聘岗位'
						
						const legendObj = this.bar.legend
						let tooltipObj = {trigger: 'item',formatter: '{b} : {c}'}
						tooltipObj = Object.assign(tooltipObj , this.bar.tooltip?this.bar.tooltip:{})
				
						let seriesObj = {
							data: yAxis,
							type: 'bar',
							coordinateSystem: 'polar',
							label: {
								show: true,
								position: 'middle',
								formatter: '{b}: {c}'
							}
						}
						seriesObj = Object.assign(seriesObj , this.bar.series)
						const gridObj = this.bar.grid
						
						option = {
							backgroundColor: this.bar.backgroundColor,
							color: this.bar.color,
							title: titleObj,
							legend: legendObj,
							grid: gridObj,
							tooltip: tooltipObj,
							polar: {
								radius: [0, '80%']
							},
							angleAxis: {
								// max: 'auto',
								startAngle: 75
							},
							radiusAxis: {
								type: 'category',
								data: xAxis
							},
							series: [seriesObj]
						};
						// 使用刚指定的配置项和数据显示图表。
						jiuyexinxiChart1.setOption(option);
				
						//根据窗口的大小变动图表
						window.onresize = function() {
							jiuyexinxiChart1.resize();
						};
					}else{
						this.$message({
							message: data.msg,
							type: "warning",
							duration: 1500,
						})
					}
				});
			})
		},


		gettoudixinxiCount() {
			this.$http({
				url: `toudixinxi/count`,
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code == 0) {
					this.toudixinxiCount = data.data
				}
			})
		},
// 1234 竖 - 热门岗位统计（柱状图）
		toudixinxiChat1() {
			this.$nextTick(()=>{
				var toudixinxiChart1 = echarts.init(document.getElementById("toudixinxiChart1"),'macarons');
				this.$http({
					url: "toudixinxi/group/gangweileixing",
					method: "get",
				}).then(({ data }) => {
					if (data && data.code === 0) {
						let res = data.data;
						console.log('热门岗位数据:', res);
						
						// 处理数据：限制显示数量，避免过多
						let maxItems = 8;
						if (res.length > maxItems) {
							res = res.slice(0, maxItems);
						}
						
						let xAxis = [];
						let yAxis = [];
						res.forEach(item => {
							// 截断过长的岗位名称
							let name = item.gangweileixing || '未知';
							if (name.length > 6) {
								name = name.substring(0, 6) + '...';
							}
							xAxis.push(name);
							yAxis.push(parseInt(item.total));
						});
						
						let option = {
							title: {
								text: '热门岗位统计',
								left: 'center',
								top: 10,
								textStyle: {
									fontSize: 16,
									fontWeight: 'bold'
								}
							},
							tooltip: {
								trigger: 'axis',
								axisPointer: {
									type: 'shadow'
								},
								formatter: '{b}: {c}人投递'
							},
							grid: {
								left: '3%',
								right: '4%',
								bottom: '15%',
								top: '20%',
								containLabel: true
							},
							xAxis: {
								type: 'category',
								data: xAxis,
								axisLabel: {
									rotate: 30,
									interval: 0,
									fontSize: 11,
									formatter: function(value) {
										return value.length > 4 ? value.substring(0, 4) + '...' : value;
									}
								},
								axisTick: {
									alignWithLabel: true
								}
							},
							yAxis: {
								type: 'value',
								name: '投递人数',
								minInterval: 1
							},
							series: [{
								data: yAxis,
								type: 'bar',
								barWidth: '50%',
								itemStyle: {
									borderRadius: [4, 4, 0, 0]
								},
								label: {
									show: true,
									position: 'top',
									formatter: '{c}'
								}
							}]
						};
						
						toudixinxiChart1.setOption(option);
						window.onresize = function() {
							toudixinxiChart1.resize();
						};
					} else {
						console.error('热门岗位数据加载失败:', data.msg);
					}
				}).catch(err => {
					console.error('热门岗位请求异常:', err);
				});
			})
		},


		getluyongxinxiCount() {
			this.$http({
				url: `luyongxinxi/count`,
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code == 0) {
					this.luyongxinxiCount = data.data
				}
			})
		},
// 1234 折滑 - 聘用岗位统计（折线图）
		luyongxinxiChat1() {
			this.$nextTick(()=>{
				var luyongxinxiChart1 = echarts.init(document.getElementById("luyongxinxiChart1"),'macarons');
				this.$http({
					url: "luyongxinxi/group/gangweileixing",
					method: "get",
				}).then(({ data }) => {
					if (data && data.code === 0) {
						let res = data.data;
						console.log('聘用岗位数据:', res);
						
						// 处理数据：限制显示数量
						let maxItems = 10;
						if (res.length > maxItems) {
							res = res.slice(0, maxItems);
						}
						
						let xAxis = [];
						let yAxis = [];
						res.forEach(item => {
							// 截断过长的岗位名称
							let name = item.gangweileixing || '未知';
							if (name.length > 6) {
								name = name.substring(0, 6) + '...';
							}
							xAxis.push(name);
							yAxis.push(parseInt(item.total));
						});
						
						let option = {
							title: {
								text: '聘用岗位统计',
								left: 'center',
								top: 10,
								textStyle: {
									fontSize: 16,
									fontWeight: 'bold'
								}
							},
							tooltip: {
								trigger: 'axis',
								formatter: '{b}: {c}人聘用'
							},
							grid: {
								left: '3%',
								right: '4%',
								bottom: '15%',
								top: '20%',
								containLabel: true
							},
							xAxis: {
								type: 'category',
								boundaryGap: false,
								data: xAxis,
								axisLabel: {
									rotate: 30,
									interval: 0,
									fontSize: 11,
									formatter: function(value) {
										return value.length > 4 ? value.substring(0, 4) + '...' : value;
									}
								}
							},
							yAxis: {
								type: 'value',
								name: '聘用人数',
								minInterval: 1
							},
							series: [{
								data: yAxis,
								type: 'line',
								smooth: true,
								symbol: 'circle',
								symbolSize: 8,
								lineStyle: {
									width: 3
								},
								areaStyle: {
									opacity: 0.3
								},
								label: {
									show: true,
									position: 'top',
									formatter: '{c}'
								}
							}]
						};
						
						luyongxinxiChart1.setOption(option);
						window.onresize = function() {
							luyongxinxiChart1.resize();
						};
					} else {
						console.error('聘用岗位数据加载失败:', data.msg);
					}
				}).catch(err => {
					console.error('聘用岗位请求异常:', err);
				});
			})
		},


	}
};
</script>
<style lang="scss" scoped>
	.home-content {
		padding: 60px 120px;
		margin: 130px 0 0 25px;
		display: flex;
		justify-content: flex-start;
		position: relative;
		flex-wrap: wrap;
		.home-title {
			border-radius: 5px;
			padding: 10px 0;
			box-shadow: 0 0px 0px rgba(0,0,0,.3);
			margin: 10px 0;
			display: none;
			width: 100%;
			justify-content: center;
			align-items: center;
			transition: 0.3s;
			.titles {
				padding: 0 0 0 12px;
				color: #333;
				font-size: 24px;
				line-height: 44px;
			}
		}
		.home-title:hover {
			transform: translate3d(0, 0px, 0);
			z-index: 1;
			background: rgba(255,255,255,.12);
		}
		.statis-box {
			padding: 0;
			max-height: 400px;
			margin: 0 10px 0 0;
			display: flex;
			width: 30%;
			justify-content: space-between;
			flex-wrap: wrap;
			.statis1 {
				border: 0px solid #ccc;
				border-radius: 2px;
				padding: 10px  10px 100px 10px;
				margin: 10px 10px 10px;
				flex-direction: column;
				background: url(http://codegen.caihongy.cn/20241019/3521ac89a69145638066034177d9de1b.png)   left top /  100% 100%;
				display: flex;
				width: 270px;
				justify-content: flex-start;
				transition: 0.3s;
				height: 180px;
				.left {
					border-radius: 100%;
					background: #E1FAFE;
					display: flex;
					width: 66px;
					justify-content: center;
					align-items: center;
					height: 66px;
					.iconfont {
						color: #0799D5;
						font-size: 40px;
					}
				}
				.right {
					margin: 20px 0 0 0;
					flex-direction: column;
					background: none;
					display: flex;
					width: 160px;
					justify-content: center;
					.num {
						margin: 5px 0;
						color: #000;
						font-weight: 500;
						font-size: 30px;
						line-height: 24px;
						height: 24px;
					}
					.name {
						margin: 5px 0;
						color: #6E7079;
						font-weight: 400;
						font-size: 15px;
						line-height: 24px;
						height: 24px;
						order: 2;
					}
				}
			}
			.statis1:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.statis2 {
				border: 0px solid #ccc;
				border-radius: 2px;
				padding: 10px  10px 100px 10px;
				margin: 10px 10px 10px;
				flex-direction: column;
				background: url(http://codegen.caihongy.cn/20241019/3521ac89a69145638066034177d9de1b.png)   left top /  100% 100%;
				display: flex;
				width: 270px;
				justify-content: flex-start;
				transition: 0.3s;
				height: 180px;
				.left {
					border-radius: 100%;
					background: #E1FAFE;
					display: flex;
					width: 66px;
					justify-content: center;
					align-items: center;
					height: 66px;
					.iconfont {
						color: #0799D5;
						font-size: 40px;
					}
				}
				.right {
					margin: 20px 0 0 0;
					flex-direction: column;
					background: none;
					display: flex;
					width: 160px;
					justify-content: center;
					.num {
						margin: 5px 0;
						color: #000;
						font-weight: 500;
						font-size: 30px;
						line-height: 24px;
						height: 24px;
					}
					.name {
						margin: 5px 0;
						color: #6E7079;
						font-weight: 400;
						font-size: 15px;
						line-height: 24px;
						height: 24px;
						order: 2;
					}
				}
			}
			.statis2:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.statis3 {
				border: 0px solid #ccc;
				border-radius: 2px;
				padding: 10px  10px 100px 10px;
				margin: 10px 10px 10px;
				flex-direction: column;
				background: url(http://codegen.caihongy.cn/20241019/3521ac89a69145638066034177d9de1b.png)   left top /  100% 100%;
				display: flex;
				width: 270px;
				justify-content: flex-start;
				transition: 0.3s;
				height: 180px;
				.left {
					border-radius: 100%;
					background: #E1FAFE;
					display: flex;
					width: 66px;
					justify-content: center;
					align-items: center;
					height: 66px;
					.iconfont {
						color: #0799D5;
						font-size: 40px;
					}
				}
				.right {
					margin: 20px 0 0 0;
					flex-direction: column;
					background: none;
					display: flex;
					width: 160px;
					justify-content: center;
					.num {
						margin: 5px 0;
						color: #000;
						font-weight: 500;
						font-size: 30px;
						line-height: 24px;
						height: 24px;
					}
					.name {
						margin: 5px 0;
						color: #6E7079;
						font-weight: 400;
						font-size: 15px;
						line-height: 24px;
						height: 24px;
						order: 2;
					}
				}
			}
			.statis3:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.statis4 {
				border: 0px solid #ccc;
				border-radius: 2px;
				padding: 10px  10px 100px 10px;
				margin: 10px 10px 10px;
				flex-direction: column;
				background: url(http://codegen.caihongy.cn/20241019/3521ac89a69145638066034177d9de1b.png)   left top /  100% 100%;
				display: flex;
				width: 270px;
				justify-content: flex-start;
				transition: 0.3s;
				height: 180px;
				.left {
					border-radius: 100%;
					background: #E1FAFE;
					display: flex;
					width: 66px;
					justify-content: center;
					align-items: center;
					height: 66px;
					.iconfont {
						color: #0799D5;
						font-size: 40px;
					}
				}
				.right {
					margin: 20px 0 0 0;
					flex-direction: column;
					background: none;
					display: flex;
					width: 160px;
					justify-content: center;
					.num {
						margin: 5px 0;
						color: #000;
						font-weight: 500;
						font-size: 30px;
						line-height: 24px;
						height: 24px;
					}
					.name {
						margin: 5px 0;
						color: #6E7079;
						font-weight: 400;
						font-size: 15px;
						line-height: 24px;
						height: 24px;
						order: 2;
					}
				}
			}
			.statis4:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.statis5 {
				border: 0px solid #ccc;
				border-radius: 0px;
				box-shadow: 0 0px 0px rgba(0,0,0,.3);
				padding: 10px;
				margin: 0 10px 10px;
				background: #fff;
				display: none;
				width: calc(20% - 20px);
				transition: 0.3s;
				.left {
					border-radius: 100%;
					background: #fbe8db;
					display: flex;
					width: 60px;
					justify-content: center;
					align-items: center;
					height: 60px;
					.iconfont {
						color: #d26515;
						font-size: 40px;
					}
				}
				.right {
					flex-direction: column;
					display: flex;
					width: 160px;
					justify-content: center;
					align-items: center;
					.num {
						margin: 5px 0;
						color: #333;
						font-weight: bold;
						font-size: 30px;
						line-height: 24px;
						height: 24px;
					}
					.name {
						margin: 5px 0;
						color: #666;
						font-size: 15px;
						line-height: 24px;
						height: 24px;
						order: -1;
					}
				}
			}
			.statis5:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
		}
		// echarts4
		.type4 {
			padding: 0;
			align-content: flex-start;
			background: none;
			display: flex;
			width: 60%;
			justify-content: space-between;
			flex-wrap: wrap;
			height: auto;
			.echarts1 {
				border: 0px solid #ccc;
				border-radius: 10px;
				padding: 20px;
				margin: 10px;
				background: rgba(255,255,255,1);
				width: calc(50% - 20px);
				transition: 0.3s;
				height: 380px;
			}
			.echarts1:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.echarts2 {
				border: 0px solid #ccc;
				border-radius: 10px;
				padding: 20px;
				margin: 10px;
				background: rgba(255,255,255,1);
				width: calc(50% - 20px);
				transition: 0.3s;
				height: 380px;
			}
			.echarts2:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.echarts3 {
				border: 0px solid #ccc;
				border-radius: 10px;
				padding: 20px;
				margin: 10px;
				background: rgba(255,255,255,1);
				width: calc(50% - 20px);
				transition: 0.3s;
				height: 380px;
			}
			.echarts3:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
			.echarts4 {
				border: 0px solid #ccc;
				border-radius: 10px;
				padding: 20px;
				margin: 10px;
				background: rgba(255,255,255,1);
				width: calc(50% - 20px);
				transition: 0.3s;
				height: 380px;
			}
			.echarts4:hover {
				transform: translate3d(0, 0px, 0);
				z-index: 1;
				background: rgba(255,255,255,1);
			}
		}
	}
	
	.echarts-flag-2 {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
		padding: 10px 20px;
		background: rebeccapurple;
	
		&>div {
			width: 32%;
			height: 300px;
			margin: 10px 0;
			background: rgba(255,255,255,.1);
			border-radius: 8px;
			padding: 10px 20px;
		}
	}
	.animate__animated {
		animation-fill-mode: none;
	}
</style>
