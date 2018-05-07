<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#org62c82be">1. 索引</a>
<ul>
<li><a href="#org79bdd59">1.1. 二级索引</a>
<ul>
<li><a href="#org21a2ada">1.1.1. 自定义主键的聚簇索引</a></li>
<li><a href="#orge40af1f">1.1.2. 未定义主键聚簇索引</a></li>
<li><a href="#orga789846">1.1.3. 自定义主键的二级唯一索引</a></li>
<li><a href="#org981c331">1.1.4. 自定义主键的二级非唯一索引</a></li>
<li><a href="#orgb6d162e">1.1.5. 未定义主键的二级唯一索引</a></li>
<li><a href="#orgf9d6e7c">1.1.6. 未定义主键的二级非唯一索引</a></li>
</ul>
</li>
<li><a href="#org8092590">1.2. 查询B+ Tree索引的流程</a></li>
</ul>
</li>
</ul>
</div>
</div>

<a id="org62c82be"></a>

# 索引

聚簇索引并不是一种单独的索引类型,而是一种数据存储方式.InnoDB聚簇索引实际上是在同一结构中保存了b+Tree索引和数据行
当有聚簇索引时,它的数据行实际上存放的叶子节点.聚簇表示数据行和相邻的健值紧凑地存储在一起.
InnoDB的二级索引(Secondary Index)节点存储索引值,叶子节点保存的是"回表"的信息,所谓回表,就是使用二级索引的指针的值，来找到聚簇索引的全部数据.然后根据完整数据索引取出所需要的列的过程.
![img](images/index_cluster_secondary.png)


<a id="org79bdd59"></a>

## 二级索引

聚簇索引与二级索引之间的逻辑关系如下:


<a id="org21a2ada"></a>

### 自定义主键的聚簇索引

索引结构: [主键][TRXID][ROLLPTR][其他建表创建的非主键列]

参与记录比较的列: 主键列

内节点Key列: [主键列]+PageNo指针


<a id="orge40af1f"></a>

### 未定义主键聚簇索引

索引结构:[ROWID][TRXID][ROLLPTR][其他建表创建的非主键列]

参与记录比较列: 只ROWID一列而已

内节点Key列: [ROWID]+PageNo指针


<a id="orga789846"></a>

### 自定义主键的二级唯一索引

索引结构:[唯一索引列][主键列]

参与记录比较列:[唯一索引列][主键列]

内节点Key列:[唯一索引列]+PageNo指针


<a id="org981c331"></a>

### 自定义主键的二级非唯一索引

索引结构:[非唯一索引列][主键列]

参与记录比较的列:[非唯一索引列][主键列]

内节点Key列:[非唯一索引列][主键列]+PageNo指针


<a id="orgb6d162e"></a>

### 未定义主键的二级唯一索引

索引结构:[唯一索引列][ROWID]

参与记录比较的列:[唯一索引][ROWID]

内节点Key列: [唯一索引列]+PageNo指针


<a id="orgf9d6e7c"></a>

### 未定义主键的二级非唯一索引

索引结构:[非唯一索引列][ROWID]

参与记录比较的列:[非唯一索引列][ROWID]

内节点Key列:[非唯一索引][ROWID]+PageNo指针


<a id="org8092590"></a>

## 查询B+ Tree索引的流程

![img](images/page_index.jpg)

B+树索引定位到数据所在的页面后,将数据页加载到内存中,通过查找槽定位数据.多条记录对应一个槽(slot),槽占用两个字节,槽的增长是从高字节到低字节的顺序存储的.最高位槽代表的是页面内索引顺序最小的记录.

mysql通过二分法查找定位到具体的数据

