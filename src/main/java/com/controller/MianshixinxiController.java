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

import com.entity.MianshixinxiEntity;
import com.entity.view.MianshixinxiView;

import com.service.MianshixinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 面试信息
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/mianshixinxi")
public class MianshixinxiController {
    @Autowired
    private MianshixinxiService mianshixinxiService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,MianshixinxiEntity mianshixinxi,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("qiye")) {
			mianshixinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("qiuzhizhe")) {
			mianshixinxi.setQiuzhizhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<MianshixinxiEntity> ew = new EntityWrapper<MianshixinxiEntity>();



		PageUtils page = mianshixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, mianshixinxi), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,MianshixinxiEntity mianshixinxi, 
		HttpServletRequest request){
        EntityWrapper<MianshixinxiEntity> ew = new EntityWrapper<MianshixinxiEntity>();
        
        // 从params中获取查询参数
        if (params.get("qiyemingcheng") != null && !params.get("qiyemingcheng").toString().isEmpty()) {
            ew.eq("qiyemingcheng", params.get("qiyemingcheng"));
        }
        if (params.get("gangweileixing") != null && !params.get("gangweileixing").toString().isEmpty()) {
            ew.eq("gangweileixing", params.get("gangweileixing"));
        }
        if (params.get("qiuzhizhanghao") != null && !params.get("qiuzhizhanghao").toString().isEmpty()) {
            ew.eq("qiuzhizhanghao", params.get("qiuzhizhanghao"));
        }

		PageUtils page = mianshixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(ew, params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( MianshixinxiEntity mianshixinxi){
       	EntityWrapper<MianshixinxiEntity> ew = new EntityWrapper<MianshixinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( mianshixinxi, "mianshixinxi")); 
        return R.ok().put("data", mianshixinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(MianshixinxiEntity mianshixinxi){
        EntityWrapper< MianshixinxiEntity> ew = new EntityWrapper< MianshixinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( mianshixinxi, "mianshixinxi")); 
		MianshixinxiView mianshixinxiView =  mianshixinxiService.selectView(ew);
		return R.ok("查询面试信息成功").put("data", mianshixinxiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        MianshixinxiEntity mianshixinxi = mianshixinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(mianshixinxi,deSens);
        return R.ok().put("data", mianshixinxi);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        MianshixinxiEntity mianshixinxi = mianshixinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(mianshixinxi,deSens);
        return R.ok().put("data", mianshixinxi);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody MianshixinxiEntity mianshixinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(mianshixinxi);
        mianshixinxiService.insert(mianshixinxi);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody MianshixinxiEntity mianshixinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(mianshixinxi);
        mianshixinxiService.insert(mianshixinxi);
        return R.ok().put("data",mianshixinxi.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody MianshixinxiEntity mianshixinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(mianshixinxi);
        //全部更新
        mianshixinxiService.updateById(mianshixinxi);

        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        mianshixinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	












}
