# 餐饮招聘管理系统 (Catering Recruitment System)

基于 Spring Boot + Vue 前后端分离的餐饮行业招聘管理平台，支持企业发布招聘信息、求职者投递简历、在线面试安排、录用管理、论坛交流等全流程功能。

## 技术栈

### 后端
- **Spring Boot** 2.2.2 — 核心框架
- **MyBatis-Plus** 2.3 — ORM 框架
- **Apache Shiro** 1.3.2 — 权限认证
- **Spring WebSocket** — 实时聊天
- **Baidu AI SDK** 4.4.1 — 人脸识别/文字识别
- **Apache POI** 3.11 — Excel 导入导出
- **Hutool** 4.0.12 — 工具类库
- **FastJson** 1.2.8 — JSON 处理

### 前端
- **Vue.js** — 前端框架（管理后台 + 用户前台）
- **Element UI** — UI 组件库

### 数据库
- **MySQL**

## 功能模块

| 模块 | 说明 |
|------|------|
| 用户管理 | 管理员/企业/求职者多角色登录注册 |
| 企业管理 | 企业信息维护、认证 |
| 求职者管理 | 求职者个人信息管理 |
| 简历管理 | 在线简历编辑与展示 |
| 就业信息 | 招聘岗位发布与浏览 |
| 投递管理 | 求职者投递简历、企业查看 |
| 面试管理 | 面试安排与结果记录 |
| 录用管理 | 录用信息管理 |
| 岗位分类 | 招聘岗位分类维护 |
| 论坛交流 | 发帖、回帖、举报 |
| 新闻资讯 | 行业新闻发布与管理 |
| 在线聊天 | 基于 WebSocket 的实时消息 |
| 好友系统 | 用户间添加好友 |
| 企业评价 | 求职者对企业评价 |
| 收藏功能 | 感兴趣的岗位/企业收藏 |
| 地区管理 | 地区数据维护 |
| 敏感词过滤 | 论坛/评论敏感词过滤 |
| 系统配置 | 系统基础设置 |

## 项目结构

```
Catering_Recruitment/
├── src/main/java/com/
│   ├── SpringbootSchemaApplication.java   # 启动类
│   ├── annotation/                         # 自定义注解
│   ├── config/                             # 配置类（拦截器、MyBatis等）
│   ├── controller/                         # 控制器（26个模块）
│   ├── dao/                                # 数据访问层
│   ├── entity/                             # 实体类
│   │   ├── model/                          # 数据模型
│   │   ├── view/                           # 视图模型
│   │   └── vo/                             # 值对象
│   ├── interceptor/                        # 权限拦截器
│   ├── service/                            # 业务逻辑层
│   │   ├── impl/                           # 服务实现
│   │   └── ...
│   └── utils/                              # 工具类
│       ├── BaiduUtil.java                  # 百度AI
│       ├── EncryptUtil.java                # 加密工具
│       └── ...
├── src/main/resources/
│   ├── application.yml                     # 配置文件（需自行创建，参见模板）
│   ├── application-template.yml            # 配置模板
│   ├── mapper/                             # MyBatis XML 映射
│   ├── admin/admin/                        # 管理后台前端（Vue）
│   └── front/front/                        # 用户前台前端（Vue）
├── db/
│   └── catering_recruitment.sql            # 数据库脚本
├── pom.xml                                 # Maven 依赖
└── pom-war.xml                             # WAR 打包配置
```

## 快速开始

### 环境要求

- JDK 1.8+
- Maven 3.6+
- MySQL 5.7+
- Node.js 12+（前端开发）

### 1. 数据库配置

```sql
CREATE DATABASE Catering_Recruitment DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

导入数据库脚本：

```bash
mysql -u root -p Catering_Recruitment < db/catering_recruitment.sql
```

### 2. 后端配置

复制配置模板并修改数据库连接信息：

```bash
cp src/main/resources/application-template.yml src/main/resources/application.yml
```

编辑 `application.yml`，填入你的数据库用户名和密码：

```yaml
spring:
    datasource:
        url: jdbc:mysql://127.0.0.1:3306/Catering_Recruitment?useUnicode=true&characterEncoding=utf-8&useSSL=false
        username: root
        password: <your_password>
```

### 3. 启动后端

```bash
mvn spring-boot:run
```

后端启动后访问：http://localhost:8080/Catering_Recruitment

### 4. 前端开发（可选）

管理后台前端：

```bash
cd src/main/resources/admin/admin
npm install
npm run serve
```

用户前台前端：

```bash
cd src/main/resources/front/front
npm install
npm run serve
```

### 5. 默认账号

| 角色 | 账号 | 密码 |
|------|------|------|
| 管理员 | admin | admin |

> 首次使用后请及时修改默认密码。

## 部署

### JAR 包部署

```bash
mvn clean package -DskipTests
java -jar target/Catering_Recruitment-0.0.1-SNAPSHOT.jar
```

### WAR 包部署

使用 `pom-war.xml` 打包后部署至 Tomcat：

```bash
mvn clean package -DskipTests -f pom-war.xml
```

## 注意事项

- `application.yml` 已在 `.gitignore` 中排除，请勿提交真实数据库密码
- 参考模板文件 `application-template.yml` 创建配置
- 前端 `node_modules/` 已在 `.gitignore` 中排除，需执行 `npm install` 安装依赖
- 管理后台前端已预编译（`dist/` 目录），可直接运行无需构建

## License

MIT
