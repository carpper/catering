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
 * 录用信息
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@TableName("luyongxinxi")
public class LuyongxinxiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public LuyongxinxiEntity() {
		
	}
	
	public LuyongxinxiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
    @TableId(type = IdType.AUTO)
	private Long id;
	/**
	 * 录用编号
	 */
					
	private String luyongbianhao;
	
	/**
	 * 企业名称
	 */
					
	private String qiyemingcheng;
	
	/**
	 * 企业图片
	 */
					
	private String qiyetupian;
	
	/**
	 * 录用岗位
	 */
					
	private String gangweileixing;
	
	/**
	 * 录用时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 		
	private Date luyongshijian;
	
	/**
	 * 录用地址
	 */
					
	private String luyongdizhi;
	
	/**
	 * 通知内容
	 */
					
	private String tongzhineirong;
	
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
	 * 设置：录用编号
	 */
	public void setLuyongbianhao(String luyongbianhao) {
		this.luyongbianhao = luyongbianhao;
	}
	/**
	 * 获取：录用编号
	 */
	public String getLuyongbianhao() {
		return luyongbianhao;
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
	 * 设置：录用岗位
	 */
	public void setGangweileixing(String gangweileixing) {
		this.gangweileixing = gangweileixing;
	}
	/**
	 * 获取：录用岗位
	 */
	public String getGangweileixing() {
		return gangweileixing;
	}
	/**
	 * 设置：录用时间
	 */
	public void setLuyongshijian(Date luyongshijian) {
		this.luyongshijian = luyongshijian;
	}
	/**
	 * 获取：录用时间
	 */
	public Date getLuyongshijian() {
		return luyongshijian;
	}
	/**
	 * 设置：录用地址
	 */
	public void setLuyongdizhi(String luyongdizhi) {
		this.luyongdizhi = luyongdizhi;
	}
	/**
	 * 获取：录用地址
	 */
	public String getLuyongdizhi() {
		return luyongdizhi;
	}
	/**
	 * 设置：通知内容
	 */
	public void setTongzhineirong(String tongzhineirong) {
		this.tongzhineirong = tongzhineirong;
	}
	/**
	 * 获取：通知内容
	 */
	public String getTongzhineirong() {
		return tongzhineirong;
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
