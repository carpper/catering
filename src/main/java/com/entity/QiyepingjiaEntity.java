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
 * 企业评价
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@TableName("qiyepingjia")
public class QiyepingjiaEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public QiyepingjiaEntity() {
		
	}
	
	public QiyepingjiaEntity(T t) {
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
	 * 评价编号
	 */
					
	private String pingjiabianhao;
	
	/**
	 * 求职账号
	 */
					
	private String qiuzhizhanghao;
	
	/**
	 * 求职姓名
	 */
					
	private String qiuzhixingming;
	
	/**
	 * 求职岗位
	 */
					
	private String gangweileixing;
	
	/**
	 * 个人经历
	 */
					
	private String gerenjingli;
	
	/**
	 * 评价内容
	 */
					
	private String pingjianeirong;
	
	/**
	 * 评价时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 		
	private Date pingjiashijian;
	
	/**
	 * 企业名称
	 */
					
	private String qiyemingcheng;
	
	/**
	 * 企业图片
	 */
					
	private String qiyetupian;
	
	
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
	 * 设置：评价编号
	 */
	public void setPingjiabianhao(String pingjiabianhao) {
		this.pingjiabianhao = pingjiabianhao;
	}
	/**
	 * 获取：评价编号
	 */
	public String getPingjiabianhao() {
		return pingjiabianhao;
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
	/**
	 * 设置：求职岗位
	 */
	public void setGangweileixing(String gangweileixing) {
		this.gangweileixing = gangweileixing;
	}
	/**
	 * 获取：求职岗位
	 */
	public String getGangweileixing() {
		return gangweileixing;
	}
	/**
	 * 设置：个人经历
	 */
	public void setGerenjingli(String gerenjingli) {
		this.gerenjingli = gerenjingli;
	}
	/**
	 * 获取：个人经历
	 */
	public String getGerenjingli() {
		return gerenjingli;
	}
	/**
	 * 设置：评价内容
	 */
	public void setPingjianeirong(String pingjianeirong) {
		this.pingjianeirong = pingjianeirong;
	}
	/**
	 * 获取：评价内容
	 */
	public String getPingjianeirong() {
		return pingjianeirong;
	}
	/**
	 * 设置：评价时间
	 */
	public void setPingjiashijian(Date pingjiashijian) {
		this.pingjiashijian = pingjiashijian;
	}
	/**
	 * 获取：评价时间
	 */
	public Date getPingjiashijian() {
		return pingjiashijian;
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

}
