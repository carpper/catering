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

import com.entity.TokenEntity;
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

import com.entity.QiuzhizheEntity;
import com.entity.view.QiuzhizheView;

import com.service.QiuzhizheService;
import com.service.TokenService;
import com.service.ToudixinxiService;
import com.entity.ToudixinxiEntity;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;

import java.io.IOException;

/**
 * 求职者
 * 后端接口
 *
 * @author
 * @email
 * @date 2026-01-06 12:20:18
 */
@RestController
@RequestMapping("/qiuzhizhe")
public class QiuzhizheController {
    @Autowired
    private QiuzhizheService qiuzhizheService;

    @Autowired
    private ToudixinxiService toudixinxiService;


    @Autowired
    private TokenService tokenService;

    /**
     * 登录
     */
    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R login(String username, String password, String captcha, HttpServletRequest request) {
        QiuzhizheEntity u = qiuzhizheService.selectOne(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", username));
        if (u == null || !u.getMima().equals(password)) {
            return R.error("账号或密码不正确");
        }

        String token = tokenService.generateToken(u.getId(), username, "qiuzhizhe", "求职者");
        return R.ok().put("token", token);
    }


    /**
     * 注册
     */
    @IgnoreAuth
    @RequestMapping("/register")
    public R register(@RequestBody QiuzhizheEntity qiuzhizhe) {
        ValidatorUtils.validateEntity(qiuzhizhe);
        QiuzhizheEntity u = qiuzhizheService.selectOne(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", qiuzhizhe.getQiuzhizhanghao()));
        if (u != null) {
            return R.error("注册用户已存在");
        }
        Long uId = new Date().getTime();
        qiuzhizhe.setId(uId);
        qiuzhizheService.insert(qiuzhizhe);
        return R.ok();
    }


    /**
     * 退出
     */
    @RequestMapping("/logout")
    public R logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return R.ok("退出成功");
    }

    /**
     * 获取用户的session用户信息
     */
    @RequestMapping("/session")
    public R getCurrUser(HttpServletRequest request) {
        Long id = (Long) request.getSession().getAttribute("userId");
        QiuzhizheEntity u = qiuzhizheService.selectById(id);
        return R.ok().put("data", u);
    }

    /**
     * 密码重置
     */
    @IgnoreAuth
    @RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request) {
        QiuzhizheEntity u = qiuzhizheService.selectOne(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", username));
        if (u == null) {
            return R.error("账号不存在");
        }
        u.setMima("123456");
        qiuzhizheService.updateById(u);
        return R.ok("密码已重置为：123456");
    }


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, QiuzhizheEntity qiuzhizhe,
                  HttpServletRequest request) {
        EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();


        PageUtils page = qiuzhizheService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qiuzhizhe), params), params));
        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(page, deSens);
        return R.ok().put("data", page);
    }

    /**
     * 前台列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, QiuzhizheEntity qiuzhizhe,
                  HttpServletRequest request) {
        EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();

        PageUtils page = qiuzhizheService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qiuzhizhe), params), params));

        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(page, deSens);
        return R.ok().put("data", page);
    }


    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(QiuzhizheEntity qiuzhizhe) {
        EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();
        ew.allEq(MPUtil.allEQMapPre(qiuzhizhe, "qiuzhizhe"));
        return R.ok().put("data", qiuzhizheService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(QiuzhizheEntity qiuzhizhe) {
        EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();
        ew.allEq(MPUtil.allEQMapPre(qiuzhizhe, "qiuzhizhe"));
        QiuzhizheView qiuzhizheView = qiuzhizheService.selectView(ew);
        return R.ok("查询求职者成功").put("data", qiuzhizheView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        QiuzhizheEntity qiuzhizhe = qiuzhizheService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(qiuzhizhe, deSens);
        return R.ok().put("data", qiuzhizhe);
    }

    /**
     * 前台详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        QiuzhizheEntity qiuzhizhe = qiuzhizheService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        DeSensUtil.desensitize(qiuzhizhe, deSens);
        return R.ok().put("data", qiuzhizhe);
    }


    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody QiuzhizheEntity qiuzhizhe, HttpServletRequest request) {
        if (qiuzhizheService.selectCount(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", qiuzhizhe.getQiuzhizhanghao())) > 0) {
            return R.error("求职账号已存在");
        }
        qiuzhizhe.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        //ValidatorUtils.validateEntity(qiuzhizhe);
        QiuzhizheEntity u = qiuzhizheService.selectOne(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", qiuzhizhe.getQiuzhizhanghao()));
        if (u != null) {
            return R.error("用户已存在");
        }
        qiuzhizhe.setId(new Date().getTime());
        qiuzhizheService.insert(qiuzhizhe);
        return R.ok();
    }

    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody QiuzhizheEntity qiuzhizhe, HttpServletRequest request) {
        if (qiuzhizheService.selectCount(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", qiuzhizhe.getQiuzhizhanghao())) > 0) {
            return R.error("求职账号已存在");
        }
        qiuzhizhe.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        //ValidatorUtils.validateEntity(qiuzhizhe);
        QiuzhizheEntity u = qiuzhizheService.selectOne(new EntityWrapper<QiuzhizheEntity>().eq("qiuzhizhanghao", qiuzhizhe.getQiuzhizhanghao()));
        if (u != null) {
            return R.error("用户已存在");
        }
        qiuzhizhe.setId(new Date().getTime());
        qiuzhizheService.insert(qiuzhizhe);
        return R.ok().put("data", qiuzhizhe.getId());
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody QiuzhizheEntity qiuzhizhe, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(qiuzhizhe);
        if (qiuzhizheService.selectCount(new EntityWrapper<QiuzhizheEntity>().ne("id", qiuzhizhe.getId()).eq("qiuzhizhanghao", qiuzhizhe.getQiuzhizhanghao())) > 0) {
            return R.error("求职账号已存在");
        }
        //全部更新
        qiuzhizheService.updateById(qiuzhizhe);
        if (null != qiuzhizhe.getQiuzhizhanghao()) {
            // 修改token
            TokenEntity tokenEntity = new TokenEntity();
            tokenEntity.setUsername(qiuzhizhe.getQiuzhizhanghao());
            tokenService.update(tokenEntity, new EntityWrapper<TokenEntity>().eq("userid", qiuzhizhe.getId()));
        }


        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        qiuzhizheService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


    /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_qiuzhizhe_" + xColumnName + "_" + yColumnName + "_timeType.json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        } else {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("yColumn", yColumnName);
            EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();
            List<Map<String, Object>> result = qiuzhizheService.selectValue(params, ew);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (Map<String, Object> m : result) {
                for (String k : m.keySet()) {
                    if (m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date) m.get(k)));
                    }
                }
            }
            Collections.sort(result, (map1, map2) -> {
                // 假设 total 总是存在并且是数值类型
                Number total1 = (Number) map1.get("total");
                Number total2 = (Number) map2.get("total");
                if (total1 == null) {
                    total1 = 0;
                }
                if (total2 == null) {
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
    public R valueMul(@PathVariable("xColumnName") String xColumnName, @RequestParam String yColumnNameMul, HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_qiuzhizhe_" + xColumnName + "_" + yColumnNameMul + "_timeType.json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        } else {
            String[] yColumnNames = yColumnNameMul.split(",");
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String, Object>>>();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();
            for (int i = 0; i < yColumnNames.length; i++) {
                params.put("yColumn", yColumnNames[i]);
                List<Map<String, Object>> result = qiuzhizheService.selectValue(params, ew);
                for (Map<String, Object> m : result) {
                    for (String k : m.keySet()) {
                        if (m.get(k) instanceof Date) {
                            m.put(k, sdf.format((Date) m.get(k)));
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
    public R valueDay(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_qiuzhizhe_" + xColumnName + "_" + yColumnName + "_" + timeStatType + ".json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        } else {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("yColumn", yColumnName);
            params.put("timeStatType", timeStatType);
            EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();
            List<Map<String, Object>> result = qiuzhizheService.selectTimeStatValue(params, ew);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (Map<String, Object> m : result) {
                for (String k : m.keySet()) {
                    if (m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date) m.get(k)));
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
    public R valueMulDay(@PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, @RequestParam String yColumnNameMul, HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("value_qiuzhizhe_" + xColumnName + "_" + yColumnNameMul + "_" + timeStatType + ".json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        } else {
            String[] yColumnNames = yColumnNameMul.split(",");
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("xColumn", xColumnName);
            params.put("timeStatType", timeStatType);
            List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String, Object>>>();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();
            for (int i = 0; i < yColumnNames.length; i++) {
                params.put("yColumn", yColumnNames[i]);
                List<Map<String, Object>> result = qiuzhizheService.selectTimeStatValue(params, ew);
                for (Map<String, Object> m : result) {
                    for (String k : m.keySet()) {
                        if (m.get(k) instanceof Date) {
                            m.put(k, sdf.format((Date) m.get(k)));
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
    public R group(@PathVariable("columnName") String columnName, HttpServletRequest request) throws IOException {
        java.nio.file.Path path = java.nio.file.Paths.get("group_qiuzhizhe_" + columnName + "_timeType.json");
        if (java.nio.file.Files.exists(path)) {
            String content = new String(java.nio.file.Files.readAllBytes(path), java.nio.charset.StandardCharsets.UTF_8);
            return R.ok().put("data", (new org.json.JSONArray(content)).toList());
        } else {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("column", columnName);
            EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();

            // 企业登录时，只统计投递了该企业的求职者
            String tableName = request.getSession().getAttribute("tableName").toString();
            if (tableName.equals("qiye")) {
                String qiyemingcheng = (String) request.getSession().getAttribute("username");
                // 查询投递了该企业的所有求职者账号（使用distinct避免group by问题）
                List<ToudixinxiEntity> toudiList = toudixinxiService.selectList(
                    new EntityWrapper<ToudixinxiEntity>()
                        .eq("qiyemingcheng", qiyemingcheng)
                        .setSqlSelect("qiuzhizhanghao")
                );
                if (toudiList != null && !toudiList.isEmpty()) {
                    List<String> qiuzhizhanghaoList = toudiList.stream()
                            .map(ToudixinxiEntity::getQiuzhizhanghao)
                            .distinct()
                            .collect(Collectors.toList());
                    ew.in("qiuzhizhanghao", qiuzhizhanghaoList);
                } else {
                    // 没有投递记录，返回空结果
                    return R.ok().put("data", new ArrayList<Map<String, Object>>());
                }
            }

            List<Map<String, Object>> result = qiuzhizheService.selectGroup(params, ew);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for (Map<String, Object> m : result) {
                for (String k : m.keySet()) {
                    if (m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date) m.get(k)));
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
    public R count(@RequestParam Map<String, Object> params, QiuzhizheEntity qiuzhizhe, HttpServletRequest request) {
        EntityWrapper<QiuzhizheEntity> ew = new EntityWrapper<QiuzhizheEntity>();

        // 企业登录时，只统计投递了该企业的求职者
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("qiye")) {
            String qiyemingcheng = (String) request.getSession().getAttribute("username");
            // 查询投递了该企业的所有求职者账号（使用distinct避免group by问题）
            List<ToudixinxiEntity> toudiList = toudixinxiService.selectList(
                new EntityWrapper<ToudixinxiEntity>()
                    .eq("qiyemingcheng", qiyemingcheng)
                    .setSqlSelect("qiuzhizhanghao")
            );
            if (toudiList != null && !toudiList.isEmpty()) {
                List<String> qiuzhizhanghaoList = toudiList.stream()
                        .map(ToudixinxiEntity::getQiuzhizhanghao)
                        .distinct()
                        .collect(Collectors.toList());
                ew.in("qiuzhizhanghao", qiuzhizhanghaoList);
            } else {
                // 没有投递记录，返回0
                return R.ok().put("data", 0);
            }
        }

        int count = qiuzhizheService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qiuzhizhe), params), params));
        return R.ok().put("data", count);
    }


}
