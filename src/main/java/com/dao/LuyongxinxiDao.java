package com.dao;

import com.entity.LuyongxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.LuyongxinxiVO;
import com.entity.view.LuyongxinxiView;


/**
 * 录用信息
 * 
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
public interface LuyongxinxiDao extends BaseMapper<LuyongxinxiEntity> {
	
	List<LuyongxinxiVO> selectListVO(@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);
	
	LuyongxinxiVO selectVO(@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);
	
	List<LuyongxinxiView> selectListView(@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);

	List<LuyongxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);

	
	LuyongxinxiView selectView(@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<LuyongxinxiEntity> wrapper);



}
