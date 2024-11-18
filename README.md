# 如何本地部署启动学生选课系统

系统技术栈：

- 后端：Springboot3、MyBatis、SpringMVC 
- 前端：Vue3、Element-Plus 
- 数据库：MySQL 5.7 或者 MySQL 8 
- 前后端：分离 
- 编辑器：IDEA2024

请按照以下步骤来启动`CoursePick`项目：

1. **环境准备**
   - 确保已经安装了 [JDK 21](https://www.oracle.com/java/technologies/downloads/#jdk21-windows)。
   - 确保已配置好[Node.js](https://nodejs.org/en/download/)
   - 确保已安装[MySQL](https://www.mysql.com/downloads/)
2. **数据库初始化**
   - 导入 `coursepick.sql` 文件到你的数据库中。
3. **前端开发环境搭建**
   - 打开终端并切换至 `CoursePick/vue` 文件夹。
   - 运行 `npm install` 安装前端依赖。
   - 使用 `npm run dev` 启动前端开发服务器。
4. **后端配置**
   - 编辑`CoursePick/springboot/src/main/resources/application.yml`文件，设置正确的数据库连接信息，如：
   - 
5. **服务启动**
   - 在MySQL中启动`coursepick`数据库
   - 前后端一起启动
     - 前端：如第三点所示，在`vue`文件夹的终端输入`npm run dev`启动前端服务器
     - 后端：运行`CoursePick/springboot/src/main/java/com/example/SpringbootApplication.java`
6. **网站链接**
   - 服务全都启动完后进入该网站：http://localhost:5173/

