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

import com.entity.GangweifenleiEntity;
import com.entity.view.GangweifenleiView;

import com.service.GangweifenleiService;
import com.service.TokenService;

import java.io.IOException;

/**
 * 岗位分类
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/gangweifenlei")
public class GangweifenleiController {
    @Autowired
    private GangweifenleiService gangweifenleiService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,GangweifenleiEntity gangweifenlei,
		HttpServletRequest request){
        EntityWrapper<GangweifenleiEntity> ew = new EntityWrapper<GangweifenleiEntity>();

        if(StringUtils.isNotBlank(gangweifenlei.getGangweileixing())) {
            gangweifenlei.setGangweileixing(SensitiveFilterUtil.filter(gangweifenlei.getGangweileixing()));
        }

		PageUtils page = gangweifenleiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, gangweifenlei), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,GangweifenleiEntity gangweifenlei, 
		HttpServletRequest request){
        EntityWrapper<GangweifenleiEntity> ew = new EntityWrapper<GangweifenleiEntity>();

		PageUtils page = gangweifenleiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, gangweifenlei), params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( GangweifenleiEntity gangweifenlei){
       	EntityWrapper<GangweifenleiEntity> ew = new EntityWrapper<GangweifenleiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( gangweifenlei, "gangweifenlei")); 
        return R.ok().put("data", gangweifenleiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(GangweifenleiEntity gangweifenlei){
        EntityWrapper< GangweifenleiEntity> ew = new EntityWrapper< GangweifenleiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( gangweifenlei, "gangweifenlei")); 
		GangweifenleiView gangweifenleiView =  gangweifenleiService.selectView(ew);
		return R.ok("查询岗位分类成功").put("data", gangweifenleiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        GangweifenleiEntity gangweifenlei = gangweifenleiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(gangweifenlei,deSens);
        return R.ok().put("data", gangweifenlei);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        GangweifenleiEntity gangweifenlei = gangweifenleiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(gangweifenlei,deSens);
        return R.ok().put("data", gangweifenlei);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody GangweifenleiEntity gangweifenlei, HttpServletRequest request){
        if(gangweifenleiService.selectCount(new EntityWrapper<GangweifenleiEntity>().eq("gangweileixing", gangweifenlei.getGangweileixing()))>0) {
            return R.error("岗位类型已存在");
        }
        if(StringUtils.isNotBlank(gangweifenlei.getGangweileixing())) {
            gangweifenlei.setGangweileixing(SensitiveFilterUtil.filter(gangweifenlei.getGangweileixing()));
        }
    	//ValidatorUtils.validateEntity(gangweifenlei);
        gangweifenleiService.insert(gangweifenlei);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody GangweifenleiEntity gangweifenlei, HttpServletRequest request){
        if(gangweifenleiService.selectCount(new EntityWrapper<GangweifenleiEntity>().eq("gangweileixing", gangweifenlei.getGangweileixing()))>0) {
            return R.error("岗位类型已存在");
        }
        if(StringUtils.isNotBlank(gangweifenlei.getGangweileixing())) {
            gangweifenlei.setGangweileixing(SensitiveFilterUtil.filter(gangweifenlei.getGangweileixing()));
        }
    	//ValidatorUtils.validateEntity(gangweifenlei);
        gangweifenleiService.insert(gangweifenlei);
        return R.ok().put("data",gangweifenlei.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody GangweifenleiEntity gangweifenlei, HttpServletRequest request){
        //ValidatorUtils.validateEntity(gangweifenlei);
        if(StringUtils.isNotBlank(gangweifenlei.getGangweileixing())) {
            gangweifenlei.setGangweileixing(SensitiveFilterUtil.filter(gangweifenlei.getGangweileixing()));
        }
        if(gangweifenleiService.selectCount(new EntityWrapper<GangweifenleiEntity>().ne("id", gangweifenlei.getId()).eq("gangweileixing", gangweifenlei.getGangweileixing()))>0) {
            return R.error("岗位类型已存在");
        }
        //全部更新
        gangweifenleiService.updateById(gangweifenlei);

        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        gangweifenleiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	












}
