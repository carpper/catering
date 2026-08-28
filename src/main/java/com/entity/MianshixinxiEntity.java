package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 面试信息
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@TableName("mianshixinxi")
public class MianshixinxiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public MianshixinxiEntity() {
		
	}
	
	public MianshixinxiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 是否参加
	private String shifoucanchu;

	// 面试形式
	private String mianshixingshi;

	// 面试地点/链接
	private String mianshididian;

	// 面试通知
	private String mianshitongzhi;

	/**
	 * 设置：是否参加
	 */
	public void setShifoucanchu(String shifoucanchu) {
		this.shifoucanchu = shifoucanchu;
	}

	/**
	 * 获取：是否参加
	 */
	public String getShifoucanchu() {
		return shifoucanchu;
	}

	/**
	 * 设置：面试形式
	 */
	public void setMianshixingshi(String mianshixingshi) {
		this.mianshixingshi = mianshixingshi;
	}

	/**
	 * 获取：面试形式
	 */
	public String getMianshixingshi() {
		return mianshixingshi;
	}

	/**
	 * 设置：面试地点/链接
	 */
	public void setMianshididian(String mianshididian) {
		this.mianshididian = mianshididian;
	}

	/**
	 * 获取：面试地点/链接
	 */
	public String getMianshididian() {
		return mianshididian;
	}

	/**
	 * 设置：面试通知
	 */
	public void setMianshitongzhi(String mianshitongzhi) {
		this.mianshitongzhi = mianshitongzhi;
	}

	/**
	 * 获取：面试通知
	 */
	public String getMianshitongzhi() {
		return mianshitongzhi;
	}




	/**
	 * 主键id
	 */
    @TableId(type = IdType.AUTO)
	private Long id;
	/**
	 * 企业名称
	 */
					
	private String qiyemingcheng;
	
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
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：企业名称
	 */
	public void setQiyemingcheng(String qiyemingcheng) {
		this.qiyemingcheng = qiyemingcheng;
	}
	/**
	 * 获取：企业名称
	 */
	public String getQiyemingcheng() {
		return qiyemingcheng;
	}
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
