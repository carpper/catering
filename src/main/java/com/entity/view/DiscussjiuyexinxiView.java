package com.entity.view;

import com.entity.DiscussjiuyexinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 招聘信息评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2026-01-06 12:20:21
 */
@TableName("discussjiuyexinxi")
public class DiscussjiuyexinxiView  extends DiscussjiuyexinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscussjiuyexinxiView(){
	}
 
 	public DiscussjiuyexinxiView(DiscussjiuyexinxiEntity discussjiuyexinxiEntity){
 	try {
			BeanUtils.copyProperties(this, discussjiuyexinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
