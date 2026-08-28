package com.entity.view;

import com.entity.ToudixinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 应聘信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@TableName("toudixinxi")
public class ToudixinxiView  extends ToudixinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ToudixinxiView(){
	}
 
 	public ToudixinxiView(ToudixinxiEntity toudixinxiEntity){
 	try {
			BeanUtils.copyProperties(this, toudixinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
