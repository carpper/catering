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

import com.entity.JiuyexinxiEntity;
import com.entity.view.JiuyexinxiView;

import com.service.JiuyexinxiService;
import com.service.TokenService;

import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 招聘信息
 * 后端接口
 * @author 
 * @email 
 * @date 2026-01-06 12:20:19
 */
@RestController
@RequestMapping("/jiuyexinxi")
public class JiuyexinxiController {
    @Autowired
    private JiuyexinxiService jiuyexinxiService;

    @Autowired
    private StoreupService storeupService;




    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JiuyexinxiEntity jiuyexinxi,
                  @RequestParam(required = false) Double xinzidaiyustart,
                  @RequestParam(required = false) Double xinzidaiyuend,
                  HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("qiye")) {
            jiuyexinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
        }
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
        if(xinzidaiyustart!=null) ew.ge("xinzidaiyu", xinzidaiyustart);
        if(xinzidaiyuend!=null) ew.le("xinzidaiyu", xinzidaiyuend);



        PageUtils page = jiuyexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiuyexinxi), params), params));
        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }

    /**
     * 前台列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JiuyexinxiEntity jiuyexinxi,
                  @RequestParam(required = false) Double xinzidaiyustart,
                  @RequestParam(required = false) Double xinzidaiyuend,
                  HttpServletRequest request){
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
        if(xinzidaiyustart!=null) ew.ge("xinzidaiyu", xinzidaiyustart);
        if(xinzidaiyuend!=null) ew.le("xinzidaiyu", xinzidaiyuend);
        // 只显示审核通过的数据
        ew.eq("sfsh", "是");

        PageUtils page = jiuyexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiuyexinxi), params), params));

        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( JiuyexinxiEntity jiuyexinxi){
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre( jiuyexinxi, "jiuyexinxi"));
        return R.ok().put("data", jiuyexinxiService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(JiuyexinxiEntity jiuyexinxi){
        EntityWrapper< JiuyexinxiEntity> ew = new EntityWrapper< JiuyexinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre( jiuyexinxi, "jiuyexinxi"));
        JiuyexinxiView jiuyexinxiView =  jiuyexinxiService.selectView(ew);
        return R.ok("查询招聘信息成功").put("data", jiuyexinxiView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JiuyexinxiEntity jiuyexinxi = jiuyexinxiService.selectById(id);
        jiuyexinxi.setClicknum(jiuyexinxi.getClicknum()+1);
        jiuyexinxiService.updateById(jiuyexinxi);
        jiuyexinxi = jiuyexinxiService.selectView(new EntityWrapper<JiuyexinxiEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(jiuyexinxi,deSens);
        return R.ok().put("data", jiuyexinxi);
    }

    /**
     * 前台详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        JiuyexinxiEntity jiuyexinxi = jiuyexinxiService.selectById(id);
        jiuyexinxi.setClicknum(jiuyexinxi.getClicknum()+1);
        jiuyexinxiService.updateById(jiuyexinxi);
        jiuyexinxi = jiuyexinxiService.selectView(new EntityWrapper<JiuyexinxiEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(jiuyexinxi,deSens);
        return R.ok().put("data", jiuyexinxi);
    }



    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R vote(@PathVariable("id") String id,String type){
        JiuyexinxiEntity jiuyexinxi = jiuyexinxiService.selectById(id);
        if(type.equals("1")) {
            jiuyexinxi.setThumbsupnum(jiuyexinxi.getThumbsupnum()+1);
        } else {
            jiuyexinxi.setCrazilynum(jiuyexinxi.getCrazilynum()+1);
        }
        jiuyexinxiService.updateById(jiuyexinxi);
        return R.ok("投票成功");
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiuyexinxiEntity jiuyexinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiuyexinxi);

        // 默认待审核状态
        if(jiuyexinxi.getSfsh() == null || jiuyexinxi.getSfsh().isEmpty()) {
            jiuyexinxi.setSfsh("待审核");
        }


        String gangweijieshao = jiuyexinxi.getGangweijieshao();
        if(StringUtils.isNotBlank(gangweijieshao)){
            gangweijieshao = SensitiveFilterUtil.filter(gangweijieshao);
            jiuyexinxi.setGangweijieshao(gangweijieshao);
        }
        jiuyexinxiService.insert(jiuyexinxi);
        return R.ok();
    }

    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody JiuyexinxiEntity jiuyexinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiuyexinxi);
        // 默认待审核状态
        if(jiuyexinxi.getSfsh() == null || jiuyexinxi.getSfsh().isEmpty()) {
            jiuyexinxi.setSfsh("待审核");
        }


        String gangweijieshao = jiuyexinxi.getGangweijieshao();
        if(StringUtils.isNotBlank(gangweijieshao)){
            gangweijieshao = SensitiveFilterUtil.filter(gangweijieshao);
            jiuyexinxi.setGangweijieshao(gangweijieshao);
        }
        jiuyexinxiService.insert(jiuyexinxi);
        return R.ok().put("data",jiuyexinxi.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody JiuyexinxiEntity jiuyexinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiuyexinxi);
        //全部更新
        String gangweijieshao = jiuyexinxi.getGangweijieshao();
        if(StringUtils.isNotBlank(gangweijieshao)){
            gangweijieshao = SensitiveFilterUtil.filter(gangweijieshao);
            jiuyexinxi.setGangweijieshao(gangweijieshao);
        }
        jiuyexinxiService.updateById(jiuyexinxi);

        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jiuyexinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestParam String sfsh,@RequestParam String shhf,@RequestBody Long[] ids){
        List<JiuyexinxiEntity> list = new ArrayList<>();
        for(Long id : ids) {
            JiuyexinxiEntity jiuyexinxi = jiuyexinxiService.selectById(id);
            jiuyexinxi.setSfsh(sfsh);
            jiuyexinxi.setShhf(shhf);
            list.add(jiuyexinxi);
        }
        jiuyexinxiService.updateBatchById(list);
        return R.ok();
    }


    /**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,JiuyexinxiEntity jiuyexinxi, HttpServletRequest request,String pre){
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
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
		params.put("sort", "clicknum");
        params.put("order", "desc");
		PageUtils page = jiuyexinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiuyexinxi), params), params));
        return R.ok().put("data", page);
    }








        /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName,HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_jiuyexinxi_" + xColumnName + "_" + yColumnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("yColumn", yColumnName);
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
            if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                                                                                                    List<Map<String, Object>> result = jiuyexinxiService.selectValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_jiuyexinxi_" + xColumnName + "_" + yColumnNameMul + "_timeType.json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        String[] yColumnNames = yColumnNameMul.split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String,Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
String tableName = request.getSession().getAttribute("tableName").toString();
            if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                                                                                                for(int i=0;i<yColumnNames.length;i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = jiuyexinxiService.selectValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_jiuyexinxi_" + xColumnName + "_" + yColumnName + "_"+timeStatType+".json");
        if(java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("yColumn", yColumnName);
            params.put("timeStatType", timeStatType);
            EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
    String tableName = request.getSession().getAttribute("tableName").toString();
                        if(tableName.equals("qiye")) {
                ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
            }
                                                                                                                                                                                                                                                                                            List<Map<String, Object>> result = jiuyexinxiService.selectTimeStatValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("value_jiuyexinxi_" + xColumnName + "_" + yColumnNameMul + "_" + timeStatType + ".json");
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
            EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
    String tableName = request.getSession().getAttribute("tableName").toString();
                        if(tableName.equals("qiye")) {
                ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
            }
                                                                                                                                                                                                                                                                                    for(int i=0;i<yColumnNames.length;i++) {
                params.put("yColumn", yColumnNames[i]);
                List<Map<String, Object>> result = jiuyexinxiService.selectTimeStatValue(params, ew);
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
        java.nio.file.Path path = java.nio.file.Paths.get("group_jiuyexinxi_" + columnName + "_timeType.json");
        if(java.nio.file.Files.exists(path)){
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        }else{
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("column", columnName);
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
String tableName = request.getSession().getAttribute("tableName").toString();
            if(tableName.equals("qiye")) {
            ew.eq("qiyemingcheng", (String)request.getSession().getAttribute("username"));
        }
                                                                                                    List<Map<String, Object>> result = jiuyexinxiService.selectGroup(params, ew);
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
    public R count(@RequestParam Map<String, Object> params,JiuyexinxiEntity jiuyexinxi, HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("qiye")) {
            jiuyexinxi.setQiyemingcheng((String)request.getSession().getAttribute("username"));
        }
        EntityWrapper<JiuyexinxiEntity> ew = new EntityWrapper<JiuyexinxiEntity>();
        int count = jiuyexinxiService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiuyexinxi), params), params));
        return R.ok().put("data", count);
    }




}
