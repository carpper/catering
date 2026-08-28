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
import com.utils.ValidatorUtils;
import com.utils.DeSensUtil;
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

import com.entity.DiquEntity;
import com.entity.view.DiquView;

import com.service.DiquService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 地区
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/diqu")
public class DiquController {
    @Autowired
    private DiquService diquService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiquEntity diqu,
		HttpServletRequest request){
        EntityWrapper<DiquEntity> ew = new EntityWrapper<DiquEntity>();



		PageUtils page = diquService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, diqu), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DiquEntity diqu, 
		HttpServletRequest request){
        EntityWrapper<DiquEntity> ew = new EntityWrapper<DiquEntity>();

		PageUtils page = diquService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, diqu), params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiquEntity diqu){
       	EntityWrapper<DiquEntity> ew = new EntityWrapper<DiquEntity>();
      	ew.allEq(MPUtil.allEQMapPre( diqu, "diqu")); 
        return R.ok().put("data", diquService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiquEntity diqu){
        EntityWrapper< DiquEntity> ew = new EntityWrapper< DiquEntity>();
 		ew.allEq(MPUtil.allEQMapPre( diqu, "diqu")); 
		DiquView diquView =  diquService.selectView(ew);
		return R.ok("查询地区成功").put("data", diquView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiquEntity diqu = diquService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(diqu,deSens);
        return R.ok().put("data", diqu);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiquEntity diqu = diquService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(diqu,deSens);
        return R.ok().put("data", diqu);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiquEntity diqu, HttpServletRequest request){
        if(diquService.selectCount(new EntityWrapper<DiquEntity>().eq("diqu", diqu.getDiqu()))>0) {
            return R.error("地区已存在");
        }
    	//ValidatorUtils.validateEntity(diqu);
        diquService.insert(diqu);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiquEntity diqu, HttpServletRequest request){
        if(diquService.selectCount(new EntityWrapper<DiquEntity>().eq("diqu", diqu.getDiqu()))>0) {
            return R.error("地区已存在");
        }
    	//ValidatorUtils.validateEntity(diqu);
        diquService.insert(diqu);
        return R.ok().put("data",diqu.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DiquEntity diqu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(diqu);
        if(diquService.selectCount(new EntityWrapper<DiquEntity>().ne("id", diqu.getId()).eq("diqu", diqu.getDiqu()))>0) {
            return R.error("地区已存在");
        }
        //全部更新
        diquService.updateById(diqu);

        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        diquService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	












}
