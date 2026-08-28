package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussjiuyexinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussjiuyexinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussjiuyexinxiView;


/**
 * 招聘信息评论表
 *
 * @author 
 * @email 
 * @date 2026-01-06 12:20:21
 */
public interface DiscussjiuyexinxiService extends IService<DiscussjiuyexinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussjiuyexinxiVO> selectListVO(Wrapper<DiscussjiuyexinxiEntity> wrapper);
   	
   	DiscussjiuyexinxiVO selectVO(@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);
   	
   	List<DiscussjiuyexinxiView> selectListView(Wrapper<DiscussjiuyexinxiEntity> wrapper);
   	
   	DiscussjiuyexinxiView selectView(@Param("ew") Wrapper<DiscussjiuyexinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussjiuyexinxiEntity> wrapper);

   	

}

