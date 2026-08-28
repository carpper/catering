package com.entity.model;

import com.entity.JianlixinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 应聘信息
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
public class JianlixinxiModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 求职姓名
	 */
	
	private String qiuzhixingming;
		
	/**
	 * 性别
	 */
	
	private String xingbie;
		
	/**
	 * 联系电话
	 */
	
	private String lianxidianhua;
		
	/**
	 * 头像
	 */
	
	private String touxiang;
		
	/**
	 * 专业
	 */
	
	private String zhuanye;
		
	/**
	 * 学历
	 */
	
	private String zizhi;
		
	/**
	 * 出生日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date chushengriqi;
		
	/**
	 * 求职意向
	 */
	
	private String qiuzhiyixiang;
		
	/**
	 * 意向职位
	 */
	
	private String yixiangzhiwei;
		
	/**
	 * 意向城市
	 */
	
	private String yixiangchengshi;
		
	/**
	 * 薪资要求
	 */
	
	private String xinziyaoqiu;
		
	/**
	 * 教育背景
	 */
	
	private String jiaoyubeijing;
		
	/**
	 * 获奖证书
	 */
	
	private String huojiangzhengshu;
		
	/**
	 * 工作经验
	 */
	
	private String gongzuojingyan;
		
	/**
	 * 项目经验
	 */
	
	private String xiangmujingyan;
		
	/**
	 * 个人技能
	 */
	
	private String gerenjineng;
		
	/**
	 * 自我评价
	 */
	
	private String ziwopingjia;
		
	/**
	 * 简历文件
	 */
	
	private String jianliwenjian;
		
	/**
	 * 收藏数
	 */
	
	private Integer storeupnum;
				
	
	/**
	 * 设置：求职姓名
	 */
	 
	public void setQiuzhixingming(String qiuzhixingming) {
		this.qiuzhixingming = qiuzhixingming;
	}
	
	/**
	 * 获取：求职姓名
	 */
	public String getQiuzhixingming() {
		return qiuzhixingming;
	}
				
	
	/**
	 * 设置：性别
	 */
	 
	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
	}
	
	/**
	 * 获取：性别
	 */
	public String getXingbie() {
		return xingbie;
	}
				
	
	/**
	 * 设置：联系电话
	 */
	 
	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}
	
	/**
	 * 获取：联系电话
	 */
	public String getLianxidianhua() {
		return lianxidianhua;
	}
				
	
	/**
	 * 设置：头像
	 */
	 
	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
	}
	
	/**
	 * 获取：头像
	 */
	public String getTouxiang() {
		return touxiang;
	}
				
	
	/**
	 * 设置：专业
	 */
	 
	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}
	
	/**
	 * 获取：专业
	 */
	public String getZhuanye() {
		return zhuanye;
	}
				
	
	/**
	 * 设置：学历
	 */
	 
	public void setzizhi(String zizhi) {
		this.zizhi = zizhi;
	}
	
	/**
	 * 获取：学历
	 */
	public String getzizhi() {
		return zizhi;
	}
				
	
	/**
	 * 设置：出生日期
	 */
	 
	public void setChushengriqi(Date chushengriqi) {
		this.chushengriqi = chushengriqi;
	}
	
	/**
	 * 获取：出生日期
	 */
	public Date getChushengriqi() {
		return chushengriqi;
	}
				
	
	/**
	 * 设置：求职意向
	 */
	 
	public void setQiuzhiyixiang(String qiuzhiyixiang) {
		this.qiuzhiyixiang = qiuzhiyixiang;
	}
	
	/**
	 * 获取：求职意向
	 */
	public String getQiuzhiyixiang() {
		return qiuzhiyixiang;
	}
				
	
	/**
	 * 设置：意向职位
	 */
	 
	public void setYixiangzhiwei(String yixiangzhiwei) {
		this.yixiangzhiwei = yixiangzhiwei;
	}
	
	/**
	 * 获取：意向职位
	 */
	public String getYixiangzhiwei() {
		return yixiangzhiwei;
	}
				
	
	/**
	 * 设置：意向城市
	 */
	 
	public void setYixiangchengshi(String yixiangchengshi) {
		this.yixiangchengshi = yixiangchengshi;
	}
	
	/**
	 * 获取：意向城市
	 */
	public String getYixiangchengshi() {
		return yixiangchengshi;
	}
				
	
	/**
	 * 设置：薪资要求
	 */
	 
	public void setXinziyaoqiu(String xinziyaoqiu) {
		this.xinziyaoqiu = xinziyaoqiu;
	}
	
	/**
	 * 获取：薪资要求
	 */
	public String getXinziyaoqiu() {
		return xinziyaoqiu;
	}
				
	
	/**
	 * 设置：教育背景
	 */
	 
	public void setJiaoyubeijing(String jiaoyubeijing) {
		this.jiaoyubeijing = jiaoyubeijing;
	}
	
	/**
	 * 获取：教育背景
	 */
	public String getJiaoyubeijing() {
		return jiaoyubeijing;
	}
				
	
	/**
	 * 设置：获奖证书
	 */
	 
	public void setHuojiangzhengshu(String huojiangzhengshu) {
		this.huojiangzhengshu = huojiangzhengshu;
	}
	
	/**
	 * 获取：获奖证书
	 */
	public String getHuojiangzhengshu() {
		return huojiangzhengshu;
	}
				
	
	/**
	 * 设置：工作经验
	 */
	 
	public void setGongzuojingyan(String gongzuojingyan) {
		this.gongzuojingyan = gongzuojingyan;
	}
	
	/**
	 * 获取：工作经验
	 */
	public String getGongzuojingyan() {
		return gongzuojingyan;
	}
				
	
	/**
	 * 设置：项目经验
	 */
	 
	public void setXiangmujingyan(String xiangmujingyan) {
		this.xiangmujingyan = xiangmujingyan;
	}
	
	/**
	 * 获取：项目经验
	 */
	public String getXiangmujingyan() {
		return xiangmujingyan;
	}
				
	
	/**
	 * 设置：个人技能
	 */
	 
	public void setGerenjineng(String gerenjineng) {
		this.gerenjineng = gerenjineng;
	}
	
	/**
	 * 获取：个人技能
	 */
	public String getGerenjineng() {
		return gerenjineng;
	}
				
	
	/**
	 * 设置：自我评价
	 */
	 
	public void setZiwopingjia(String ziwopingjia) {
		this.ziwopingjia = ziwopingjia;
	}
	
	/**
	 * 获取：自我评价
	 */
	public String getZiwopingjia() {
		return ziwopingjia;
	}
				
	
	/**
	 * 设置：简历文件
	 */
	 
	public void setJianliwenjian(String jianliwenjian) {
		this.jianliwenjian = jianliwenjian;
	}
	
	/**
	 * 获取：简历文件
	 */
	public String getJianliwenjian() {
		return jianliwenjian;
	}
				
	
	/**
	 * 设置：收藏数
	 */
	 
	public void setStoreupnum(Integer storeupnum) {
		this.storeupnum = storeupnum;
	}
	
	/**
	 * 获取：收藏数
	 */
	public Integer getStoreupnum() {
		return storeupnum;
	}
			
}
