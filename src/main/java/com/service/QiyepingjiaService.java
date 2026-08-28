package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QiyepingjiaEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QiyepingjiaVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QiyepingjiaView;


/**
 * 企业评价
 *
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
public interface QiyepingjiaService extends IService<QiyepingjiaEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QiyepingjiaVO> selectListVO(Wrapper<QiyepingjiaEntity> wrapper);
   	
   	QiyepingjiaVO selectVO(@Param("ew") Wrapper<QiyepingjiaEntity> wrapper);
   	
   	List<QiyepingjiaView> selectListView(Wrapper<QiyepingjiaEntity> wrapper);
   	
   	QiyepingjiaView selectView(@Param("ew") Wrapper<QiyepingjiaEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QiyepingjiaEntity> wrapper);

   	

}

