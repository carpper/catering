const menu = {
    list() {
        return [
            {
                "backMenu": [
                    // 求职者管理（放在最前面，优先显示，确保能看到）
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "求职者统计", "首页总数", "首页统计", "私聊"],
                                "appFrontIcon": "cuIcon-pay",
                                "buttons": ["新增", "查看", "修改", "删除", "首页总数", "首页统计"],
                                "menu": "求职者",
                                "menuJump": "列表",
                                "tableName": "qiuzhizhe"
                            }
                        ],
                        "menu": "求职者管理" // 菜单名称明确，确保前端渲染
                    },
                    // 其他管理员菜单不变
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "审核", "私聊"],
                                "appFrontIcon": "cuIcon-news",
                                "buttons": ["新增", "查看", "修改", "删除", "审核"],
                                "menu": "企业",
                                "menuJump": "列表",
                                "tableName": "qiye"
                            }
                        ],
                        "menu": "企业管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-keyboard",
                                "buttons": ["新增", "查看", "修改", "删除"],
                                "menu": "地区",
                                "menuJump": "列表",
                                "tableName": "diqu"
                            }
                        ],
                        "menu": "地区管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-pic",
                                "buttons": ["新增", "查看", "修改", "删除"],
                                "menu": "岗位分类",
                                "menuJump": "列表",
                                "tableName": "gangweifenlei"
                            }
                        ],
                        "menu": "岗位分类管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "招聘岗位", "查看评论", "首页总数", "首页统计", "私聊", "投递简历"],
                                "appFrontIcon": "cuIcon-present",
                                "buttons": ["新增", "查看", "修改", "删除", "查看评论", "首页总数", "首页统计", "投递简历"],
                                "menu": "招聘信息",
                                "menuJump": "列表",
                                "tableName": "jiuyexinxi"
                            }
                        ],
                        "menu": "招聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "审核", "热门岗位", "首页总数", "首页统计", "邀请面试", "评价"],
                                "appFrontIcon": "cuIcon-keyboard",
                                "buttons": ["新增", "查看", "修改", "删除", "查看评论", "首页总数", "首页统计"],
                                "menu": "应聘信息",
                                "menuJump": "列表",
                                "tableName": "toudixinxi"
                            }
                        ],
                        "menu": "应聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "录用通知"],
                                "appFrontIcon": "cuIcon-flashlightopen",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "面试信息",
                                "menuJump": "列表",
                                "tableName": "mianshixinxi"
                            }
                        ],
                        "menu": "面试信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-discover",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "应聘信息",
                                "menuJump": "列表",
                                "tableName": "jianlixinxi"
                            }
                        ],
                        "menu": "应聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-album",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "企业评价",
                                "menuJump": "列表",
                                "tableName": "qiyepingjia"
                            }
                        ],
                        "menu": "企业评价管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-brand",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "我的收藏",
                                "menuJump": "列表",
                                "tableName": "storeup"
                            }
                        ],
                        "menu": "我的收藏管理"
                    }
                ],
                "frontMenu": [
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-present",
                                "buttons": ["新增", "查看", "修改", "删除"],
                                "menu": "招聘信息",
                                "menuJump": "列表",
                                "tableName": "jiuyexinxi"
                            }
                        ],
                        "menu": "招聘信息"
                    }
                ],
                "hasBackLogin": "是",
                "hasBackRegister": "否",
                "hasFrontLogin": "否",
                "hasFrontRegister": "否",
                "roleName": "管理员", // 明确管理员角色，确保权限匹配
                "tableName": "users"
            },
            // 企业角色菜单（不变）
            {
                "backMenu": [
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "招聘岗位", "查看评论", "首页总数", "首页统计", "私聊", "投递简历"],
                                "appFrontIcon": "cuIcon-present",
                                "buttons": ["新增", "查看", "修改", "删除", "查看评论", "首页总数", "首页统计", "投递简历"],
                                "menu": "招聘信息",
                                "menuJump": "列表",
                                "tableName": "jiuyexinxi"
                            }
                        ],
                        "menu": "招聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "审核", "热门岗位", "首页总数", "首页统计", "邀请面试", "评价"],
                                "appFrontIcon": "cuIcon-keyboard",
                                "buttons": ["新增", "查看", "修改", "删除", "查看评论", "首页总数", "首页统计"],
                                "menu": "应聘信息",
                                "menuJump": "列表",
                                "tableName": "toudixinxi"
                            }
                        ],
                        "menu": "应聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "录用通知"],
                                "appFrontIcon": "cuIcon-flashlightopen",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "面试信息",
                                "menuJump": "列表",
                                "tableName": "mianshixinxi"
                            }
                        ],
                        "menu": "面试信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-discover",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "应聘信息",
                                "menuJump": "列表",
                                "tableName": "jianlixinxi"
                            }
                        ],
                        "menu": "应聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-album",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "企业评价",
                                "menuJump": "列表",
                                "tableName": "qiyepingjia"
                            }
                        ],
                        "menu": "企业评价管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-brand",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "我的收藏",
                                "menuJump": "列表",
                                "tableName": "storeup"
                            }
                        ],
                        "menu": "我的收藏管理"
                    }
                ],
                "frontMenu": [
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-keyboard",
                                "buttons": ["新增", "查看", "修改", "删除"],
                                "menu": "应聘信息",
                                "menuJump": "列表",
                                "tableName": "toudixinxi"
                            }
                        ],
                        "menu": "应聘信息"
                    }
                ],
                "hasBackLogin": "否",
                "hasBackRegister": "否",
                "hasFrontLogin": "是",
                "hasFrontRegister": "是",
                "roleName": "企业",
                "tableName": "qiye"
            },
            // 求职者角色菜单（不变）
            {
                "backMenu": [
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除", "审核", "热门岗位", "首页总数", "首页统计", "邀请面试", "评价"],
                                "appFrontIcon": "cuIcon-keyboard",
                                "buttons": ["新增", "查看", "修改", "删除", "查看评论", "首页总数", "首页统计"],
                                "menu": "应聘信息",
                                "menuJump": "列表",
                                "tableName": "toudixinxi"
                            }
                        ],
                        "menu": "应聘信息管理"
                    },
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-brand",
                                "buttons": ["查看", "修改", "删除"],
                                "menu": "我的收藏",
                                "menuJump": "列表",
                                "tableName": "storeup"
                            }
                        ],
                        "menu": "我的收藏管理"
                    }
                ],
                "frontMenu": [
                    {
                        "child": [
                            {
                                "allButtons": ["新增", "查看", "修改", "删除"],
                                "appFrontIcon": "cuIcon-present",
                                "buttons": ["新增", "查看", "修改", "删除", "投递简历", "私聊"],
                                "menu": "招聘信息",
                                "menuJump": "列表",
                                "tableName": "jiuyexinxi"
                            }
                        ],
                        "menu": "招聘信息"
                    }
                ],
                "hasBackLogin": "否",
                "hasBackRegister": "否",
                "hasFrontLogin": "是",
                "hasFrontRegister": "是",
                "roleName": "求职者",
                "tableName": "qiuzhizhe"
            }
        ]
    }
}
export default menu;