package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.LuyongxinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.LuyongxinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.LuyongxinxiView;


/**
 * 录用信息
 *
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
public interface LuyongxinxiService extends IService<LuyongxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<LuyongxinxiVO> selectListVO(Wrapper<LuyongxinxiEntity> wrapper);
   	
   	LuyongxinxiVO selectVO(@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);
   	
   	List<LuyongxinxiView> selectListView(Wrapper<LuyongxinxiEntity> wrapper);
   	
   	LuyongxinxiView selectView(@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<LuyongxinxiEntity> wrapper);

   	

    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<LuyongxinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<LuyongxinxiEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<LuyongxinxiEntity> wrapper);



}

