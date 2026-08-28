package com.entity.model;

import com.entity.MianshixinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 面试信息
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
public class MianshixinxiModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 企业图片
	 */
	
	private String qiyetupian;
		
	/**
	 * 负责人
	 */
	
	private String fuzeren;
		
	/**
	 * 企业地址
	 */
	
	private String qiyedizhi;
		
	/**
	 * 岗位类型
	 */
	
	private String gangweileixing;
		
	/**
	 * 面试结果
	 */
	
	private String mianshijieguo;
		
	/**
	 * 面试时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date mianshishijian;
		
	/**
	 * 求职账号
	 */
	
	private String qiuzhizhanghao;
		
	/**
	 * 求职姓名
	 */
	
	private String qiuzhixingming;
				
	
	/**
	 * 设置：企业图片
	 */
	 
	public void setQiyetupian(String qiyetupian) {
		this.qiyetupian = qiyetupian;
	}
	
	/**
	 * 获取：企业图片
	 */
	public String getQiyetupian() {
		return qiyetupian;
	}
				
	
	/**
	 * 设置：负责人
	 */
	 
	public void setFuzeren(String fuzeren) {
		this.fuzeren = fuzeren;
	}
	
	/**
	 * 获取：负责人
	 */
	public String getFuzeren() {
		return fuzeren;
	}
				
	
	/**
	 * 设置：企业地址
	 */
	 
	public void setQiyedizhi(String qiyedizhi) {
		this.qiyedizhi = qiyedizhi;
	}
	
	/**
	 * 获取：企业地址
	 */
	public String getQiyedizhi() {
		return qiyedizhi;
	}
				
	
	/**
	 * 设置：岗位类型
	 */
	 
	public void setGangweileixing(String gangweileixing) {
		this.gangweileixing = gangweileixing;
	}
	
	/**
	 * 获取：岗位类型
	 */
	public String getGangweileixing() {
		return gangweileixing;
	}
				
	
	/**
	 * 设置：面试结果
	 */
	 
	public void setMianshijieguo(String mianshijieguo) {
		this.mianshijieguo = mianshijieguo;
	}
	
	/**
	 * 获取：面试结果
	 */
	public String getMianshijieguo() {
		return mianshijieguo;
	}
				
	
	/**
	 * 设置：面试时间
	 */
	 
	public void setMianshishijian(Date mianshishijian) {
		this.mianshishijian = mianshishijian;
	}
	
	/**
	 * 获取：面试时间
	 */
	public Date getMianshishijian() {
		return mianshishijian;
	}
				
	
	/**
	 * 设置：求职账号
	 */
	 
	public void setQiuzhizhanghao(String qiuzhizhanghao) {
		this.qiuzhizhanghao = qiuzhizhanghao;
	}
	
	/**
	 * 获取：求职账号
	 */
	public String getQiuzhizhanghao() {
		return qiuzhizhanghao;
	}
				
	
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
			
}
