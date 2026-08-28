package com.utils;

import com.entity.SensitivewordsEntity;
import com.service.SensitivewordsService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import javax.annotation.PostConstruct;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class SensitiveFilterUtil {

    // 注入敏感词Service
    @Autowired
    private SensitivewordsService sensitivewordsService;

    // 静态实例
    public static SensitiveFilterUtil sensitiveFilterUtil;

    // 初始化
    @PostConstruct
    public void init() {
        sensitiveFilterUtil = this;
        sensitiveFilterUtil.sensitivewordsService = this.sensitivewordsService;
    }

    // 过滤方法
    public static String filter(String content) {
        if (StringUtils.isBlank(content)) {
            return content;
        }

        // 从数据库读取所有敏感词
        List<String> sensitiveList = sensitiveFilterUtil.sensitivewordsService.selectList(null)
                .stream()
                .map(SensitivewordsEntity::getContent)
                .filter(StringUtils::isNotEmpty)
                .collect(Collectors.toList());

        // 替换成 ***
        for (String word : sensitiveList) {
            content = content.replace(word, "***");
        }

        return content;
    }
}