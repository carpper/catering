package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.DiscussjiuyexinxiDao;
import com.entity.DiscussjiuyexinxiEntity;
import com.service.DiscussjiuyexinxiService;
import com.entity.vo.DiscussjiuyexinxiVO;
import com.entity.view.DiscussjiuyexinxiView;

@Service("discussjiuyexinxiService")
public class DiscussjiuyexinxiServiceImpl extends ServiceImpl<DiscussjiuyexinxiDao, DiscussjiuyexinxiEntity> implements DiscussjiuyexinxiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussjiuyexinxiEntity> page = this.selectPage(
                new Query<DiscussjiuyexinxiEntity>(params).getPage(),
                new EntityWrapper<DiscussjiuyexinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussjiuyexinxiEntity> wrapper) {
		  Page<DiscussjiuyexinxiView> page =new Query<DiscussjiuyexinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<DiscussjiuyexinxiVO> selectListVO(Wrapper<DiscussjiuyexinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussjiuyexinxiVO selectVO(Wrapper<DiscussjiuyexinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussjiuyexinxiView> selectListView(Wrapper<DiscussjiuyexinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussjiuyexinxiView selectView(Wrapper<DiscussjiuyexinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
