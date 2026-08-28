package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import java.util.Collections;

import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;

import com.utils.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.DiscussjiuyexinxiEntity;
import com.entity.view.DiscussjiuyexinxiView;

import com.service.DiscussjiuyexinxiService;
import com.service.TokenService;

import java.io.IOException;

/**
 * 招聘信息评论表
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:21
 */
@RestController
@RequestMapping("/discussjiuyexinxi")
public class DiscussjiuyexinxiController {
    @Autowired
    private DiscussjiuyexinxiService discussjiuyexinxiService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscussjiuyexinxiEntity discussjiuyexinxi,
		HttpServletRequest request){
        EntityWrapper<DiscussjiuyexinxiEntity> ew = new EntityWrapper<DiscussjiuyexinxiEntity>();



		PageUtils page = discussjiuyexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussjiuyexinxi), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DiscussjiuyexinxiEntity discussjiuyexinxi, 
		HttpServletRequest request){
        EntityWrapper<DiscussjiuyexinxiEntity> ew = new EntityWrapper<DiscussjiuyexinxiEntity>();

		PageUtils page = discussjiuyexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussjiuyexinxi), params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscussjiuyexinxiEntity discussjiuyexinxi){
       	EntityWrapper<DiscussjiuyexinxiEntity> ew = new EntityWrapper<DiscussjiuyexinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discussjiuyexinxi, "discussjiuyexinxi")); 
        return R.ok().put("data", discussjiuyexinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscussjiuyexinxiEntity discussjiuyexinxi){
        EntityWrapper< DiscussjiuyexinxiEntity> ew = new EntityWrapper< DiscussjiuyexinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discussjiuyexinxi, "discussjiuyexinxi")); 
		DiscussjiuyexinxiView discussjiuyexinxiView =  discussjiuyexinxiService.selectView(ew);
		return R.ok("查询招聘信息评论表成功").put("data", discussjiuyexinxiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscussjiuyexinxiEntity discussjiuyexinxi = discussjiuyexinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(discussjiuyexinxi,deSens);
        return R.ok().put("data", discussjiuyexinxi);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscussjiuyexinxiEntity discussjiuyexinxi = discussjiuyexinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(discussjiuyexinxi,deSens);
        return R.ok().put("data", discussjiuyexinxi);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiscussjiuyexinxiEntity discussjiuyexinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(discussjiuyexinxi);
        if(StringUtils.isNotBlank(discussjiuyexinxi.getContent())) {
            discussjiuyexinxi.setContent(SensitiveFilterUtil.filter(discussjiuyexinxi.getContent()));
        }
        discussjiuyexinxiService.insert(discussjiuyexinxi);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiscussjiuyexinxiEntity discussjiuyexinxi, HttpServletRequest request){
        if(StringUtils.isNotBlank(discussjiuyexinxi.getContent())) {
            discussjiuyexinxi.setContent(SensitiveFilterUtil.filter(discussjiuyexinxi.getContent()));
        }
        discussjiuyexinxiService.insert(discussjiuyexinxi);
        return R.ok().put("data",discussjiuyexinxi.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        DiscussjiuyexinxiEntity discussjiuyexinxi = discussjiuyexinxiService.selectOne(new EntityWrapper<DiscussjiuyexinxiEntity>().eq("", username));
        return R.ok().put("data", discussjiuyexinxi);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody DiscussjiuyexinxiEntity discussjiuyexinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussjiuyexinxi);
        //全部更新
        if(StringUtils.isNotBlank(discussjiuyexinxi.getContent())) {
            discussjiuyexinxi.setContent(SensitiveFilterUtil.filter(discussjiuyexinxi.getContent()));
        }
        discussjiuyexinxiService.updateById(discussjiuyexinxi);

        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        discussjiuyexinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	
	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,DiscussjiuyexinxiEntity discussjiuyexinxi, HttpServletRequest request,String pre){
        EntityWrapper<DiscussjiuyexinxiEntity> ew = new EntityWrapper<DiscussjiuyexinxiEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicktime");
        params.put("order", "desc");
		PageUtils page = discussjiuyexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussjiuyexinxi), params), params));
        return R.ok().put("data", page);
    }












}
