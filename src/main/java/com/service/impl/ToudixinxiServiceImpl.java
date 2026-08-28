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


import com.dao.ToudixinxiDao;
import com.entity.ToudixinxiEntity;
import com.service.ToudixinxiService;
import com.entity.vo.ToudixinxiVO;
import com.entity.view.ToudixinxiView;

@Service("toudixinxiService")
public class ToudixinxiServiceImpl extends ServiceImpl<ToudixinxiDao, ToudixinxiEntity> implements ToudixinxiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ToudixinxiEntity> page = this.selectPage(
                new Query<ToudixinxiEntity>(params).getPage(),
                new EntityWrapper<ToudixinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ToudixinxiEntity> wrapper) {
		  Page<ToudixinxiView> page =new Query<ToudixinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<ToudixinxiVO> selectListVO(Wrapper<ToudixinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ToudixinxiVO selectVO(Wrapper<ToudixinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ToudixinxiView> selectListView(Wrapper<ToudixinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ToudixinxiView selectView(Wrapper<ToudixinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<ToudixinxiEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<ToudixinxiEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<ToudixinxiEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }




}
