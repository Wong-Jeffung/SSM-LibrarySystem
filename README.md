# 基于SSM的简单图书管理系统

## 系统功能分析

#### 1、数据流图

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E6%95%B0%E6%8D%AE%E6%B5%81%E5%9B%BE.png)

 

#### 2、数据字典

数据项条目:

**用户表**

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E7%94%A8%E6%88%B7%E8%A1%A8.png)

 

 

 

**图书表**

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E5%9B%BE%E4%B9%A6%E8%A1%A8.png)

**用户类型表**

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E7%94%A8%E6%88%B7%E7%B1%BB%E5%9E%8B%E8%A1%A8.png)

**图书类型表**

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E5%9B%BE%E4%B9%A6%E7%B1%BB%E5%9E%8B%E8%A1%A8.png)

**用户登陆表**

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E7%94%A8%E6%88%B7%E7%99%BB%E9%99%86%E8%A1%A8.png)

 

#### 3、关系模型设计，E-R图设计

关系模型：

用户（编号，姓名，性别，单位，住址，电话，邮箱，日期，备注）

图书（编号，名称，作者，出版社，日期，页码，价格，关键词，登记日期，是否借出，备注）

用户类型（编号，名称，关键词，备注）

图书类型（编号，名称，借书数量，期限，备注）

用户登陆（用户名，密码，备注）

E-R图：

![img](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/E-R%E5%9B%BE.png)

 

 ### 部分功能展示

![1553007032690](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E5%8A%9F%E8%83%BD%E5%B1%95%E7%A4%BA1.jpg)

![1553007000550](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E5%8A%9F%E8%83%BD%E5%B1%95%E7%A4%BA2.jpg)

![1553007068017](https://github.com/Wong-Jeffung/img-folder/blob/master/library-imgs/%E5%8A%9F%E8%83%BD%E5%B1%95%E7%A4%BA3.jpg)
