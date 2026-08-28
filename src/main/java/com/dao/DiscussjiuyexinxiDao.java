package com.dao;

import com.entity.DiscussjiuyexinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussjiuyexinxiVO;
import com.entity.view.DiscussjiuyexinxiView;


/**
 * 招聘信息评论表
 * 
 * @author 
 * @email 
 * @date 2026-01-06 12:20:21
 */
public interface DiscussjiuyexinxiDao extends BaseMapper<DiscussjiuyexinxiEntity> {
	
	List<DiscussjiuyexinxiVO> selectListVO(@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);
	
	DiscussjiuyexinxiVO selectVO(@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);
	
	List<DiscussjiuyexinxiView> selectListView(@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);

	List<DiscussjiuyexinxiView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);

	
	DiscussjiuyexinxiView selectView(@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);
	

}
