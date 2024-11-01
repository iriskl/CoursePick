# **项目学习笔记**

## **1.在导入脚手架过程中导包报错**

- 具体原因：使用npm install命令需要管理员权限才能正常导包，而我一开始没有以管理员身份运行IDEA，导致导包失败。

- 解决方法：以管理员身份运行IDEA后，重新运行npm install命令即可。

## **2.项目启动时要同时启动前后端**

- 因为该项目是前后端分离的，springboot与vue需同时启动

## **3.项目启动前要运行数据库脚本**

- 具体方法：在navicat中打开数据库连接

## **4.在navicat中使用sql语句的方法**

- 在需要的位置点击“新建查询”，接着写入sql语句后运行

## **5.用户管理功能的增删改查**

- 在navicat中创建新表，并在表中创建字段

- 在springboot中创建实体类，并在实体类中添加相应的属性，并一键生成get、set方法

- 在vue项目中的views文件夹下创建对应的页面，并在页面中添加相应的表单，比如新建、编辑、删除、查询功能，可以查询element-ui的表格组件来实现

- 在springboot中创建controller，并在controller中编写相应的方法，从前端接受数据

- 在controller层中调用service层做一些业务逻辑的处理

- service层调用mapper层，mapper层负责与数据库交互，实现数据的持久化

## 6.往数据库写入内容的方法

- Mybatis提供两种方法：
    - 第一种方法：使用xml文件，在xml文件中编写sql语句，并在Mybatis的配置文件中配置sql语句的位置
    - 第二种方法：使用注解，在实体类中添加注解，并在Mybatis的配置文件中配置实体类与数据库表的映射关系

- 第一种方法适合复杂的sql语句，第二种方法适合简单的sql语句

## 7.在教师功能新增向数据传输时出现问题

- 原因：在xml中的insert into中我insert了id字段，实际上并不需要，数据库会自动递增生成id

## 8.处理教师新增信息时抛出异常“用户名已存在”存在问题

- 该功能增加前数据库存在zhang，而后新增功能后再添加zhang是显示”请求失败“，但在功能增加后往数据库新增li后再新增li则能正常显示“用户名已存在”的提示信息

- 原因未知，解决方法未知

## 9.教师信息页面刚加载无法显示教师信息

- 原因：忘记在Teacher.vue最后加上load()，load函数是加载教师信息到表单的函数，加上这一行才能使教师信息页面默认加载教师信息
- 解决方法：加上load()

## 10.在写教师信息更新时遇到405错误码

- 原因是前端一开始写的是`Post`请求，后端接口是`Put`请求，请求方式不一致导致405报错

![image.png](https://cdn.nlark.com/yuque/0/2024/png/38425080/1722245687591-0987001f-6183-40fe-b7da-8d43f7463e37.png#averageHue=%23f5f4f4&clientId=u0da10289-cd52-4&from=paste&height=136&id=u5ff8cea8&originHeight=170&originWidth=685&originalType=binary&ratio=1.25&rotation=0&showTitle=false&size=12222&status=done&style=none&taskId=u6bb27e23-c0d8-4033-8fe5-988a1cebbac&title=&width=548)

## 11.在写教师信息的头像上传时出现上传路径错误的问题

- 原因是我把文件上传接口写错了，原来是：

  ```javascript
  //文件上传接口
  const uploadUrl = import.meta.env.VITE_BASE_API + '/files/upload'
  ```

  实际上是：

  ```javascript
  //文件上传接口
  const uploadUrl = import.meta.env.VITE_BASE_URL + '/files/upload'
  ```

  与`.env.development`的路径名一致

## 12.在写学生信息（复制粘贴）时出现问题

原因是我的`StudentMapper.xml`中一些字段写错了，比如`collegeId`写成了`college_id`

```sql
values (#{username}, #{password}, #{name}, #{role}, #{sex}, #{code}, #{collegeId}, #{score}, #{avatar})
```

这里是values所以要写实体类Student中的字段，而不是`#{college_id}`

## 13.Cannot read properties of undefined (reading 'sex')

![image-20241014222423048](C:\Users\Iris\AppData\Roaming\Typora\typora-user-images\image-20241014222423048.png)

原因如图，读取了未定义的`sex`属性，因为`TPerson.vue`的`data`没有定义`form`，只有`user`

解决办法：将`data.form`改为`data.user`

