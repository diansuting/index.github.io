# index.github.io
my first page

## 报告
#### 预警sql语句
![sql查询语句](http://f.hiphotos.baidu.com/image/pic/item/4ec2d5628535e5dd22552b397ec6a7efcf1b62df.jpg)
    
    
SELECT * 
      
FROM 保养记录表,保养消耗表,设备表
         
where 保养记录表.保养记录id=保养消耗表.保养记录id
        
and 保养记录表.设备编号=设备表.设备编号
          
and 保养记录表.设备编号= 'S11' ;
           
#### 通过设备编号查询检修报告sql语句
![sql查询语句](http://c.hiphotos.baidu.com/image/pic/item/91ef76c6a7efce1b5752462ca751f3deb58f65df.jpg)
          
SELECT DISTINCT 设备表.设备编号,设备表.设备类型编号,设备表.设备
       
FROM 设备表,设备类型表,保养记录表
          
where 保养记录表.设备编号=设备表.设备编号
         
and 设备类型表. 设备类型编号=设备表.设备类型编号
          
and datediff(current_date,时间)>检修周期;
      
#### ER图截图
![ER 图]()



