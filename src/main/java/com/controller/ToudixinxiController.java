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

import com.entity.ToudixinxiEntity;
import com.entity.view.ToudixinxiView;

import com.service.ToudixinxiService;
import com.service.MianshixinxiService;
import com.entity.MianshixinxiEntity;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 应聘信息
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/toudixinxi")
public class ToudixinxiController {
    @Autowired
    private ToudixinxiService toudixinxiService;
    
    @Autowired
    private MianshixinxiService mianshixinxiService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ToudixinxiEntity toudixinxi,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("qiye")) {
			toudixinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("qiuzhizhe")) {
			toudixinxi.setQiuzhizhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();



		PageUtils page = toudixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, toudixinxi), params), params));
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,ToudixinxiEntity toudixinxi, 
		HttpServletRequest request){
        EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
        
        // 从params中获取查询参数（用于重复投递校验）
        if (params.get("qiyemingcheng") != null && !params.get("qiyemingcheng").toString().isEmpty()) {
            ew.eq("qiyemingcheng", params.get("qiyemingcheng"));
        }
        if (params.get("gangweileixing") != null && !params.get("gangweileixing").toString().isEmpty()) {
            ew.eq("gangweileixing", params.get("gangweileixing"));
        }
        if (params.get("qiuzhizhanghao") != null && !params.get("qiuzhizhanghao").toString().isEmpty()) {
            ew.eq("qiuzhizhanghao", params.get("qiuzhizhanghao"));
        }
        
        // 调试：打印查询参数
        System.out.println("toudixinxi/list 查询参数: " + params);
        System.out.println("toudixinxi/list SQL条件: " + ew.getSqlSegment());

		PageUtils page = toudixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(ew, params), params));
		
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ToudixinxiEntity toudixinxi){
       	EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( toudixinxi, "toudixinxi")); 
        return R.ok().put("data", toudixinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ToudixinxiEntity toudixinxi){
        EntityWrapper< ToudixinxiEntity> ew = new EntityWrapper< ToudixinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( toudixinxi, "toudixinxi")); 
		ToudixinxiView toudixinxiView =  toudixinxiService.selectView(ew);
		return R.ok("查询应聘信息成功").put("data", toudixinxiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        ToudixinxiEntity toudixinxi = toudixinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(toudixinxi,deSens);
        return R.ok().put("data", toudixinxi);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        ToudixinxiEntity toudixinxi = toudixinxiService.selectById(id);
				Map<String, String> deSens = new HashMap<>();
				DeSensUtil.desensitize(toudixinxi,deSens);
        return R.ok().put("data", toudixinxi);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ToudixinxiEntity toudixinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(toudixinxi);
        toudixinxiService.insert(toudixinxi);
        return R.ok();
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ToudixinxiEntity toudixinxi, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(toudixinxi);
    	
    	// 检查是否重复投递：同一企业同一岗位只能投递一次，面试结束后才能重新投递
    	String qiyemingcheng = toudixinxi.getQiyemingcheng();
    	String gangweileixing = toudixinxi.getGangweileixing();
    	String qiuzhizhanghao = toudixinxi.getQiuzhizhanghao();
    	
    	System.out.println("投递校验参数: qiyemingcheng=" + qiyemingcheng + ", gangweileixing=" + gangweileixing + ", qiuzhizhanghao=" + qiuzhizhanghao);
    	
    	if (StringUtils.isNotBlank(qiyemingcheng) && StringUtils.isNotBlank(gangweileixing) && StringUtils.isNotBlank(qiuzhizhanghao)) {
    		// 查询是否已有投递记录
    		EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<>();
    		ew.eq("qiyemingcheng", qiyemingcheng);
    		ew.eq("gangweileixing", gangweileixing);
    		ew.eq("qiuzhizhanghao", qiuzhizhanghao);
    		int count = toudixinxiService.selectCount(ew);
    		System.out.println("投递记录数量: " + count);
    		
    		if (count > 0) {
    			// 有投递记录，检查是否有面试结果（必须匹配岗位类型）
    			EntityWrapper<MianshixinxiEntity> mianshiEw = new EntityWrapper<>();
    			mianshiEw.eq("qiyemingcheng", qiyemingcheng);
    			mianshiEw.eq("qiuzhizhanghao", qiuzhizhanghao);
    			mianshiEw.eq("gangweileixing", gangweileixing);
    			List<MianshixinxiEntity> mianshiList = mianshixinxiService.selectList(mianshiEw);
    			System.out.println("面试记录数量: " + (mianshiList == null ? 0 : mianshiList.size()));
    			
    			if (mianshiList != null && !mianshiList.isEmpty()) {
    				// 有面试记录，检查是否有结果
    				boolean hasResult = false;
    				String mianshijieguo = null;
    				for (MianshixinxiEntity mianshi : mianshiList) {
    					mianshijieguo = mianshi.getMianshijieguo();
    					System.out.println("面试结果: " + mianshijieguo);
    					if ("已录用".equals(mianshijieguo) || "未录用".equals(mianshijieguo)) {
    						hasResult = true;
    						break;
    					}
    				}
    				System.out.println("是否有面试结果: " + hasResult);
    				if (!hasResult) {
    					System.out.println("拒绝投递: 面试进行中");
    					return R.error(300, "您已投递该企业该岗位，等面试结束后才能重新投递");
    				}
    				// 面试已结束，可以继续投递
    				System.out.println("允许投递: 面试已结束");
    			} else {
    				// 没有面试记录，说明投递还在待处理中
    				System.out.println("拒绝投递: 没有面试记录");
    				return R.error(300, "您已投递该企业该岗位，等面试结束后才能重新投递");
    			}
    		} else {
    			System.out.println("没有投递记录，允许投递");
    		}
    	} else {
    		System.out.println("字段为空，跳过校验: qiyemingcheng=" + qiyemingcheng + ", gangweileixing=" + gangweileixing + ", qiuzhizhanghao=" + qiuzhizhanghao);
    	}
    	
        toudixinxiService.insert(toudixinxi);
        return R.ok().put("data",toudixinxi.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ToudixinxiEntity toudixinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(toudixinxi);
        //全部更新
        toudixinxiService.updateById(toudixinxi);

        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf){
        List<ToudixinxiEntity> list = new ArrayList<ToudixinxiEntity>();
        for(Long id : ids) {
            ToudixinxiEntity toudixinxi = toudixinxiService.selectById(id);
            toudixinxi.setSfsh(sfsh);
            toudixinxi.setShhf(shhf);
            list.add(toudixinxi);
        }
        toudixinxiService.updateBatchById(list);
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        toudixinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








        /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName,HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_toudixinxi_" + xColumnName + "_" + yColumnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("yColumn", yColumnName);
        EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
            if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                                            if(tableName.equals("qiuzhizhe")) {
            ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
        }
                                        List<Map<String, Object>> result = toudixinxiService.selectValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_toudixinxi_" + xColumnName + "_" + yColumnNameMul + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        String[] yColumnNames = yColumnNameMul.split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String,Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
String tableName = request.getSession().getAttribute("tableName").toString();
            if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                                            if(tableName.equals("qiuzhizhe")) {
            ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
        }
                                    for(int i=0;i<yColumnNames.length;i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = toudixinxiService.selectValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_toudixinxi_" + xColumnName + "_" + yColumnName + "_"+timeStatType+".json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("yColumn", yColumnName);
            params.put("timeStatType", timeStatType);
            EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
    String tableName = request.getSession().getAttribute("tableName").toString();
                        if(tableName.equals("qiye")) {
                ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
            }
                                                                                                                    if(tableName.equals("qiuzhizhe")) {
                ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
            }
                                                                                                        List<Map<String, Object>> result = toudixinxiService.selectTimeStatValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_toudixinxi_" + xColumnName + "_" + yColumnNameMul + "_" + timeStatType + ".json");
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
            EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
    String tableName = request.getSession().getAttribute("tableName").toString();
                        if(tableName.equals("qiye")) {
                ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
            }
                                                                                                                    if(tableName.equals("qiuzhizhe")) {
                ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
            }
                                                                                                for(int i=0;i<yColumnNames.length;i++) {
                params.put("yColumn", yColumnNames[i]);
                List<Map<String, Object>> result = toudixinxiService.selectTimeStatValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("group_toudixinxi_" + columnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)){
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("column", columnName);
        EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
String tableName = request.getSession().getAttribute("tableName").toString();
            if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                                            if(tableName.equals("qiuzhizhe")) {
            ew.eq("qiuzhizhanghao", (String)request.getSession().getAttribute("username"));
        }
                                        List<Map<String, Object>> result = toudixinxiService.selectGroup(params, ew);
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
    public R count(@RequestParam Map<String, Object> params,ToudixinxiEntity toudixinxi, HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("qiye")) {
            toudixinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
        }
        if(tableName.equals("qiuzhizhe")) {
            toudixinxi.setQiuzhizhanghao((String)request.getSession().getAttribute("username"));
        }
        EntityWrapper<ToudixinxiEntity> ew = new EntityWrapper<ToudixinxiEntity>();
        int count = toudixinxiService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, toudixinxi), params), params));
        return R.ok().put("data", count);
    }




}
