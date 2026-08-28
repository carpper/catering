package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QiuzhizheEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QiuzhizheVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QiuzhizheView;


/**
 * 求职者
 *
 * @author 
 * @email 
 * @date 2026-01-06 12:20:18
 */
public interface QiuzhizheService extends IService<QiuzhizheEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QiuzhizheVO> selectListVO(Wrapper<QiuzhizheEntity> wrapper);
   	
   	QiuzhizheVO selectVO(@Param("ew") Wrapper<QiuzhizheEntity> wrapper);
   	
   	List<QiuzhizheView> selectListView(Wrapper<QiuzhizheEntity> wrapper);
   	
   	QiuzhizheView selectView(@Param("ew") Wrapper<QiuzhizheEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QiuzhizheEntity> wrapper);

   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<QiuzhizheEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<QiuzhizheEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<QiuzhizheEntity> wrapper);



}

