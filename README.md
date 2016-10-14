# index.github.io
my first page

## 报告
#### 预警
![sql查询语句](http://f.hiphotos.baidu.com/image/pic/item/4ec2d5628535e5dd22552b397ec6a7efcf1b62df.jpg)
    
    
SELECT * 
FROM 保养记录表,保养消耗表,设备表
where 保养记录表.保养记录id=保养消耗表.保养记录id
and 保养记录表.设备编号=设备表.设备编号
and 保养记录表.设备编号= 'S11' ;


