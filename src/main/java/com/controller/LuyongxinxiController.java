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

import com.entity.LuyongxinxiEntity;
import com.entity.view.LuyongxinxiView;

import com.service.LuyongxinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 录用信息
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/luyongxinxi")
public class LuyongxinxiController {
    @Autowired
    private LuyongxinxiService luyongxinxiService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,LuyongxinxiEntity luyongxinxi,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("qiye")) {
			luyongxinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("qiuzhizhe")) {
			luyongxinxi.setQiuzhizhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
        
        // 从params中获取查询参数
        if (params.get("qiuzhizhanghao") != null && !params.get("qiuzhizhanghao").toString().isEmpty()) {
            ew.eq("qiuzhizhanghao", params.get("qiuzhizhanghao"));
        }
        if (params.get("gangweileixing") != null && !params.get("gangweileixing").toString().isEmpty()) {
            ew.eq("gangweileixing", params.get("gangweileixing"));
        }

		PageUtils page = luyongxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, luyongxinxi), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,LuyongxinxiEntity luyongxinxi, 
		HttpServletRequest request){
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
        
        // 从params中获取查询参数
        if (params.get("qiuzhizhanghao") != null && !params.get("qiuzhizhanghao").toString().isEmpty()) {
            ew.eq("qiuzhizhanghao", params.get("qiuzhizhanghao"));
        }

		PageUtils page = luyongxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(ew, params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( LuyongxinxiEntity luyongxinxi){
       	EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( luyongxinxi, "luyongxinxi")); 
        return R.ok().put("data", luyongxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(LuyongxinxiEntity luyongxinxi){
        EntityWrapper< LuyongxinxiEntity> ew = new EntityWrapper< LuyongxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( luyongxinxi, "luyongxinxi")); 
		LuyongxinxiView luyongxinxiView =  luyongxinxiService.selectView(ew);
		return R.ok("查询录用信息成功").put("data", luyongxinxiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        LuyongxinxiEntity luyongxinxi = luyongxinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(luyongxinxi,deSens);
        return R.ok().put("data", luyongxinxi);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        LuyongxinxiEntity luyongxinxi = luyongxinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(luyongxinxi,deSens);
        return R.ok().put("data", luyongxinxi);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody LuyongxinxiEntity luyongxinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(luyongxinxi);
        
        // 检查求职者账号是否为空
        if(luyongxinxi.getQiuzhizhanghao() == null || luyongxinxi.getQiuzhizhanghao().trim().isEmpty()) {
            return R.error("求职者账号不能为空");
        }
        
        // 检查该求职者是否已被其他企业录用（严格检查：一个人只能被录用一次）
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<>();
        ew.eq("qiuzhizhanghao", luyongxinxi.getQiuzhizhanghao().trim());
        int count = luyongxinxiService.selectCount(ew);
        if(count > 0) {
            return R.error("该求职者已被其他企业录用，不能重复录用");
        }
        
        luyongxinxiService.insert(luyongxinxi);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody LuyongxinxiEntity luyongxinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(luyongxinxi);
        
        // 检查求职者账号是否为空
        if(luyongxinxi.getQiuzhizhanghao() == null || luyongxinxi.getQiuzhizhanghao().trim().isEmpty()) {
            return R.error("求职者账号不能为空");
        }
        
        // 检查该求职者是否已被其他企业录用（严格检查：一个人只能被录用一次）
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<>();
        ew.eq("qiuzhizhanghao", luyongxinxi.getQiuzhizhanghao().trim());
        int count = luyongxinxiService.selectCount(ew);
        if(count > 0) {
            return R.error("该求职者已被其他企业录用，不能重复录用");
        }
        
        luyongxinxiService.insert(luyongxinxi);
        return R.ok().put("data",luyongxinxi.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody LuyongxinxiEntity luyongxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(luyongxinxi);
        
        // 检查求职者账号是否为空
        if(luyongxinxi.getQiuzhizhanghao() == null || luyongxinxi.getQiuzhizhanghao().trim().isEmpty()) {
            return R.error("求职者账号不能为空");
        }
        
        // 检查该求职者是否已被其他企业录用（排除当前记录）
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<>();
        ew.eq("qiuzhizhanghao", luyongxinxi.getQiuzhizhanghao().trim());
        // 排除当前记录
        if(luyongxinxi.getId() != null) {
            ew.ne("id", luyongxinxi.getId());
        }
        int count = luyongxinxiService.selectCount(ew);
        if(count > 0) {
            return R.error("该求职者已被其他企业录用，不能重复录用");
        }
        
        //全部更新
        luyongxinxiService.updateById(luyongxinxi);

        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        luyongxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








        /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName,HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_luyongxinxi_" + xColumnName + "_" + yColumnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("yColumn", yColumnName);
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
                if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                            if(tableName.equals("qiuzhizhe")) {
            ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
        }
                    List<Map<String, Object>> result = luyongxinxiService.selectValue(params, ew);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Map<String, Object> m : result) {
            for(String k : m.keySet()) {
                if(m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date)m.get(k)));
                }
            }
        }
        Collections.sort(result, (map1, map2) -> {
            // 假设 total 总是存在并且是数值类型
            Number total1 = (Number) map1.get("total");
            Number total2 = (Number) map2.get("total");
            if(total1==null)
            {
                total1 = 0;
            }
            if(total2==null)
            {
                total2 = 0;
            }
            return Double.compare(total2.doubleValue(), total1.doubleValue());
        });
        return R.ok().put("data", result);
        }
    }
    
    /**
     * （按值统计(多)）
     */
    @RequestMapping("/valueMul/{xColumnName}")
    public R valueMul(@PathVariable("xColumnName") String xColumnName,@RequestParam String yColumnNameMul,HttpServletRequest request)  throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_luyongxinxi_" + xColumnName + "_" + yColumnNameMul + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        String[] yColumnNames = yColumnNameMul.split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String,Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
String tableName = request.getSession().getAttribute("tableName").toString();
                if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                            if(tableName.equals("qiuzhizhe")) {
            ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
        }
                for(int i=0;i<yColumnNames.length;i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = luyongxinxiService.selectValue(params, ew);
            for(Map<String, Object> m : result) {
                for(String k : m.keySet()) {
                    if(m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date)m.get(k)));
                    }
                }
            }
            result2.add(result);
        }
        return R.ok().put("data", result2);
    }
}
    
    /**
     * （按值统计）时间统计类型
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}/{timeStatType}")
    public R valueDay(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType,HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_luyongxinxi_" + xColumnName + "_" + yColumnName + "_"+timeStatType+".json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("yColumn", yColumnName);
            params.put("timeStatType", timeStatType);
            EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
    String tableName = request.getSession().getAttribute("tableName").toString();
                                    if(tableName.equals("qiye")) {
                ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
            }
                                                                    if(tableName.equals("qiuzhizhe")) {
                ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
            }
                                            List<Map<String, Object>> result = luyongxinxiService.selectTimeStatValue(params, ew);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for(Map<String, Object> m : result) {
                for(String k : m.keySet()) {
                    if(m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date)m.get(k)));
                    }
                }
            }
            return R.ok().put("data", result);
        }
    }
    
        /**
     * （按值统计）时间统计类型(多)
     */
    @RequestMapping("/valueMul/{xColumnName}/{timeStatType}")
    public R valueMulDay(@PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType,@RequestParam String yColumnNameMul,HttpServletRequest request) throws IOException
    {
        java.nio.file.Path path = java.nio.file.Paths.get("value_luyongxinxi_" + xColumnName + "_" + yColumnNameMul + "_" + timeStatType + ".json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
            String[] yColumnNames = yColumnNameMul.split(",");
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("timeStatType", timeStatType);
            List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String,Object>>>();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
    String tableName = request.getSession().getAttribute("tableName").toString();
                                    if(tableName.equals("qiye")) {
                ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
            }
                                                                    if(tableName.equals("qiuzhizhe")) {
                ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
            }
                                    for(int i=0;i<yColumnNames.length;i++) {
                params.put("yColumn", yColumnNames[i]);
                List<Map<String, Object>> result = luyongxinxiService.selectTimeStatValue(params, ew);
                for(Map<String, Object> m : result) {
                    for(String k : m.keySet()) {
                        if(m.get(k) instanceof Date) {
                            m.put(k, sdf.format((Date)m.get(k)));
                        }
                    }
                }
                result2.add(result);
            }
            return R.ok().put("data", result2);
        }
    }
    
        /**
     * 分组统计
     */
    @RequestMapping("/group/{columnName}")
    public R group(@PathVariable("columnName") String columnName,HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("group_luyongxinxi_" + columnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)){
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("column", columnName);
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
String tableName = request.getSession().getAttribute("tableName").toString();
                if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                            if(tableName.equals("qiuzhizhe")) {
            ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
        }
                    List<Map<String, Object>> result = luyongxinxiService.selectGroup(params, ew);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Map<String, Object> m : result) {
            for(String k : m.keySet()) {
                if(m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date)m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
        }
    }    
    
    




    /**
     * 总数量
     */
    @RequestMapping("/count")
    public R count(@RequestParam Map<String, Object> params,LuyongxinxiEntity luyongxinxi, HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("qiye")) {
            luyongxinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
        }
        if(tableName.equals("qiuzhizhe")) {
            luyongxinxi.setQiuzhizhanghao((String)request.getSession().getAttribute("username"));
        }
        EntityWrapper<LuyongxinxiEntity> ew = new EntityWrapper<LuyongxinxiEntity>();
        int count = luyongxinxiService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, luyongxinxi), params), params));
        return R.ok().put("data", count);
    }




}
