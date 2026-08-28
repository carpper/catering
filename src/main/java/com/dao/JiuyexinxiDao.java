package com.dao;

import com.entity.JiuyexinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.JiuyexinxiVO;
import com.entity.view.JiuyexinxiView;


/**
 * 招聘信息
 * 
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
public interface JiuyexinxiDao extends BaseMapper<JiuyexinxiEntity> {
	
	List<JiuyexinxiVO> selectListVO(@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);
	
	JiuyexinxiVO selectVO(@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);
	
	List<JiuyexinxiView> selectListView(@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);

	List<JiuyexinxiView> selectListView(Pagination page,@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);

	
	JiuyexinxiView selectView(@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);
	

    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<JiuyexinxiEntity> wrapper);



}
