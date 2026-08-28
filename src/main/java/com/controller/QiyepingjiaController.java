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

import com.entity.QiyepingjiaEntity;
import com.entity.view.QiyepingjiaView;

import com.service.QiyepingjiaService;
import com.service.TokenService;

import java.io.IOException;

/**
 * 企业评价
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/qiyepingjia")
public class QiyepingjiaController {
    @Autowired
    private QiyepingjiaService qiyepingjiaService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,QiyepingjiaEntity qiyepingjia,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("qiuzhizhe")) {
			qiyepingjia.setQiuzhizhanghao((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("qiye")) {
			qiyepingjia.setQiyemingcheng((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<QiyepingjiaEntity> ew = new EntityWrapper<QiyepingjiaEntity>();



		PageUtils page = qiyepingjiaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qiyepingjia), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,QiyepingjiaEntity qiyepingjia, 
		HttpServletRequest request){
        EntityWrapper<QiyepingjiaEntity> ew = new EntityWrapper<QiyepingjiaEntity>();

		PageUtils page = qiyepingjiaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qiyepingjia), params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( QiyepingjiaEntity qiyepingjia){
       	EntityWrapper<QiyepingjiaEntity> ew = new EntityWrapper<QiyepingjiaEntity>();
      	ew.allEq(MPUtil.allEQMapPre( qiyepingjia, "qiyepingjia")); 
        return R.ok().put("data", qiyepingjiaService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(QiyepingjiaEntity qiyepingjia){
        EntityWrapper< QiyepingjiaEntity> ew = new EntityWrapper< QiyepingjiaEntity>();
 		ew.allEq(MPUtil.allEQMapPre( qiyepingjia, "qiyepingjia")); 
		QiyepingjiaView qiyepingjiaView =  qiyepingjiaService.selectView(ew);
		return R.ok("查询企业评价成功").put("data", qiyepingjiaView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        QiyepingjiaEntity qiyepingjia = qiyepingjiaService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(qiyepingjia,deSens);
        return R.ok().put("data", qiyepingjia);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        QiyepingjiaEntity qiyepingjia = qiyepingjiaService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(qiyepingjia,deSens);
        return R.ok().put("data", qiyepingjia);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody QiyepingjiaEntity qiyepingjia, HttpServletRequest request){
    	ValidatorUtils.validateEntity(qiyepingjia);
        if(StringUtils.isNotBlank(qiyepingjia.getPingjianeirong())) {
            qiyepingjia.setPingjianeirong(SensitiveFilterUtil.filter(qiyepingjia.getPingjianeirong()));
        }
        qiyepingjiaService.insert(qiyepingjia);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody QiyepingjiaEntity qiyepingjia, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(qiyepingjia);
        if(StringUtils.isNotBlank(qiyepingjia.getPingjianeirong())) {
            qiyepingjia.setPingjianeirong(SensitiveFilterUtil.filter(qiyepingjia.getPingjianeirong()));
        }
        qiyepingjiaService.insert(qiyepingjia);
        return R.ok().put("data",qiyepingjia.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody QiyepingjiaEntity qiyepingjia, HttpServletRequest request){
        //ValidatorUtils.validateEntity(qiyepingjia);
        //全部更新
        if(StringUtils.isNotBlank(qiyepingjia.getPingjianeirong())) {
            qiyepingjia.setPingjianeirong(SensitiveFilterUtil.filter(qiyepingjia.getPingjianeirong()));
        }

        qiyepingjiaService.updateById(qiyepingjia);

        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        qiyepingjiaService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	












}
