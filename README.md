# 基于SSM的简单图书管理系统

## 系统功能分析

#### 1、数据流图

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image002.jpg)

 

#### 2、数据字典

数据项条目:

**用户表**

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image004.jpg)

 

 

 

**图书表**

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image006.jpg)

**用户类型表**

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image008.jpg)

**图书类型表**

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image010.jpg)

**用户登陆表**

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image012.jpg)

 

#### 3、关系模型设计，E-R图设计

关系模型：

用户（编号，姓名，性别，单位，住址，电话，邮箱，日期，备注）

图书（编号，名称，作者，出版社，日期，页码，价格，关键词，登记日期，是否借出，备注）

用户类型（编号，名称，关键词，备注）

图书类型（编号，名称，借书数量，期限，备注）

用户登陆（用户名，密码，备注）

E-R图：

![img](file:///C:/Users/asus/AppData/Local/Temp/msohtmlclip1/01/clip_image014.jpg)

 

 ### 部分功能展示

![1553007032690](C:\Users\asus\AppData\Roaming\Typora\typora-user-images\1553007032690.png)

![1553007000550](C:\Users\asus\AppData\Roaming\Typora\typora-user-images\1553007000550.png)

![1553007068017](C:\Users\asus\AppData\Roaming\Typora\typora-user-images\1553007068017.png)

![1553007101114](C:\Users\asus\AppData\Roaming\Typora\typora-user-images\1553007101114.png)

### 心得体会

作为数据库课程的课程设计，本次开发后端部分使用了Spring，SpringMVC和Mybatis三个框架搭建，前端部分使用Bootstrap框架进行设计布局，在开发整个系统的过程中，功能模块的实现思路并不难，比较难的是前后端的数据传输，经常出现后端接收不到前端数据，而前端数据解析不了后端数据的情况，最后采用JSON解析数据，使得开发更加流畅。