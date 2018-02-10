<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgf7b514c">1. 回归分析</a>
<ul>
<li><a href="#org05cd462">1.1. 概述</a></li>
<li><a href="#org3c4b015">1.2. 拟合方法</a></li>
<li><a href="#orgf11510c">1.3. 模型拟合</a></li>
</ul>
</li>
<li><a href="#orgffa84f4">2. 简单线性回归</a>
<ul>
<li><a href="#org85befe4">2.1. 协方差与相关系数</a></li>
<li><a href="#org8708cb2">2.2. 简单线性回归模型</a></li>
<li><a href="#orgb9cbc83">2.3. 参数估计</a></li>
<li><a href="#org204ec5e">2.4. 假设检验</a></li>
</ul>
</li>
</ul>
</div>
</div>

<a id="orgf7b514c"></a>

# 回归分析


<a id="org05cd462"></a>

## 概述

  变量之间的关系可以表示 为方程或模型的形式，将 **响应变量** 或 **因变量** 与一个或多个 **解释变量** 或 **预测变量** 联系起来 ，如我们想知道香烟的消费量是否与社会经济变量和人口统计学变量有关,那响应变量 是香烟的消费量,解释变量或预测变量是一些社会经济变量和人口统计学变量
      用Y表示响应变量，用\(X_{1},X_{2},\cdots,X_{p}\)表示预测变量,其中p是预测变量个数,公式如下: 
\[Y=f(X_{1},X_{2},\cdots,X_{p})+\epsilon\]
其中\(\epsilon\)是随机误差，代表近似过程中产生的偏差,最简单情形为:
\[Y=\beta_{0}+\beta_{1}X_{1}+\beta_{2}X_{2}+\cdots+\beta_{p}X_{p}+\epsilon\]
其中\(\beta_{1},\beta_{2},\cdots,\beta_{p}\)称为 **回归系数** ,\(\beta_{0}\)称为 **截距**,它们是未知常数,称为模型的 **回归参数** ,这些参数可由数据确定(估计),通常希腊字母表示未知参数
解释变量或预测变量也可以称为 **独立变量**, **协变量** ,\*回归变量\* 或 因素.
      仅包含一个预测变量的称: **简单回归方程**,包含多于一个预测变量的方程称为 **多元回归方程** .
      只有一个 **响应变量** 的回归分析称为 **单变量回归** ,一个以上的称 **多变量回归**.


<a id="org3c4b015"></a>

## 拟合方法

利用数据估计模型参数称为 **参数估计** 或 **模型拟合**,最常见是 **最小二乘法** ,其他方法还有: 加权最小二乘法，最大似然估计法，岭回归法,主成分分析法


<a id="orgf11510c"></a>

## 模型拟合

   利用估算方法和收集到的数据进行回归参数估计,回归分析方程估计可以写成:
\[\hat{Y}=\hat{\beta}_{0}+\hat{\beta}_{1}X_{1}+\cdots+\hat{\beta}_{p}X_{p}\]
参数上方的记号"^"表示该参数的估计, \(\hat{Y}\)读作Y-hat,称为 **似合值** .利用上面的公式 可以对数据中的n个观测计算n个拟合值，第i个拟合值\(\hat{y}\)是
\[\hat{Y}=\hat{\beta}_{0}+\hat{\beta}_{1}X_{i1}+\hat{\beta}_{2}X_{i2}+\cdots++\hat{\beta}_{p}X_{ip} ,  i = 1,2,\cdots,n,\] 
其中，\(x_{i1},x_{i2},\cdots,x_{ip}\)是第i个观测中p个预测的变量的值,\(\hat{\beta}\)称为预测值


<a id="orgffa84f4"></a>

# 简单线性回归


<a id="org85befe4"></a>

## 协方差与相关系数

见P26,我们希望度量Y和X之间关系方向和强度,于是引入 **协议差** 和 **相关系数** 两个工具

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">观测序号</th>
<th scope="col" class="org-left">响应变量Y</th>
<th scope="col" class="org-left">预测变量X</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">1</td>
<td class="org-left">y1</td>
<td class="org-left">x1</td>
</tr>


<tr>
<td class="org-left">2</td>
<td class="org-left">y2</td>
<td class="org-left">x2</td>
</tr>


<tr>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
<td class="org-left">&#x2026;</td>
</tr>


<tr>
<td class="org-left">n</td>
<td class="org-left">yn</td>
<td class="org-left">xn</td>
</tr>
</tbody>
</table>

  在Y对X散点图上,过\(\overline{x}\)作一条垂线，过\(\overline{y}\)过一条水平线
\[\overline{y}=\frac{\sum_{i=1}^{n} y_{i}}{n}, \overline{x}=\frac{\sum_{i=1}^{n}x_{i}}{n}\]
分别为Y,X的样本均值
定义Y和X **协方差** 为:
\[ Cov(Y,X) = \frac{\sum_{i=1}^{n}(y_i-\overline{y})(x_{i}-\overline{x})}{n-1} \]
其符号反映了Y和X线性关系的方向，如果Cov(Y,X)>0,则Y和X关系为正,如果Cov(Y,X)<0，则Y和X关系为负,但是协方差所度量影响较大,在计算协方差前，对数据进行标准化,
Cov(Y,X)受度量单位影响大,不能反应变量之间的线性强度.在计算协议差之前，要对数据进行标准化, 对Y数据标准化是指对每个观测值\(y_{i}\)减去均值\(\overline{y}\),再除以标准差,即
\[z_{i}=\frac{y_{i}-\overline{y}}{s_y}\]

其中

\begin{equation}
s_y = \sqrt{\frac{\sum_{i=1}^{n}(y_i-\overline{y})^2}{n-1}}
\end{equation}

是Y的 **样本标准差** ,同样对X,Y经标准化后再进行算协方差，就是Y和X的 **相关系数** :

\begin{equation}
Cor(Y,X)=\frac{1}{n-1}\sum_{i=1}^{n}\left(\frac{y_{i}-\overline{y}}{s_{y}}\right)\left(\frac{x_{i}-\overline{x}}{s_{x}}\right).
\end{equation}

**相关系数** 等价公式有:

\begin{eqnarray}
Cor(Y,X) & = &  - \frac{Cov(Y,X)}{S_{y}S_{x}} \\
         & = & \frac{\sum(y_{i}-\overline{y})(x_{i}-\overline{x})}{\sqrt{\sum(y_{i}-\overline{y})^2\sum(x_{i}-\overline{x})^2}}
\end{eqnarray}

**相关系数** 具有对称性即 Cor(Y,X) = Cor(X,Y)
\[ -1 \leq Cor(Y,X) \leq 1 \]
相关系数成为度量Y和X之间线性关系与强度的重要工具，越靠近1或-1,说明Y和X之间的线性关系越强，Cor(Y,X)符号反映Y和X之间线性关系的方向，当Cor(Y,X)>0说明Y和X是正相关,否则是负相关
当Cor(Y,X)=0不意味Y和X没有相关性，只是他们之间没有线性相关性.P24


<a id="org8708cb2"></a>

## 简单线性回归模型

   响应变量 Y 与预测变量 X之间的关系可以用如下线性模型表示:
\[Y = \beta_{0}+\beta_{1}X+\epsilon\]
其中\(\beta_{0}\)是 **常数项** ,\(\beta_{1}\)是模型的 **回归系数** 它们都是常数，称为模型参数, \(\epsilon\)是 **随机扰动或误差** 也叫 **随机误差** ,不再包含Y与X之间的关系信息
回归系数\(\beta_{1}\)称为 **斜率** \(\beta_{0}\)称为 **截距** 是当X=0时,Y的值
每个观测都可以写为:
\[y_{i} = \beta_{0}+\beta_{1}x_{i}+\epsilon_{i}, i = 1,2,\cdots,n.\]  
其中\(y_{i}\)是响应变量Y的第i个观测值,\(x_{i}\)是预测变量X的第i个观察值,\(\epsilon_{i}\)是用\(x_{i}\)线性函数近似\(y_{i}\)的误差


<a id="orgb9cbc83"></a>

## 参数估计

    最小二乘法估计参数: 当每个点到直线的铅直距离(也可以用点到直线的垂直距离)的平方和达到最小时,对应的直线就是要找的直线 ，铅直距离代表响应变量的误差\(\epsilon_{i}\) ,误差表达式:
\[\epsilon_{i} = y_{i}-\beta_{0}-\beta_{1}x_{i}, i = 1,2,\cdots,n.\]
所有铅直距离的平方和可表示为:

\begin{equation}
 S(\beta_{0},\beta_{1}) = \sum_{i=1}^{n}\epsilon_{i}^{2}=\sum_{i=1}^{n}(y_{i}-\beta_{0}-\beta_{1}x_{i})^2
\end{equation}

最小化\(S(\beta_{0},\beta_{i})\)可以得到参数估计\(\hat{\beta}_{0}\) 和 \(\hat{\beta_{1}}\) 如下:

\begin{equation}
\hat{\beta}_{1} = \frac{\sum(y_{i}-\overline{y})(x_{i}-\overline{x})}{\sum(x_{i}-\overline{x})^2}
\end{equation}

\begin{equation}
\hat{\beta}_{0} = \overline{y} -\hat{b}_{1}\overline{x}
\end{equation}

\(\hat{\beta}_{0}\)和\(\hat{\beta}_{1}\)称为\(\beta_{0}\)和\(\beta_{1}\)的最小二乘估计,分别是当点到直线的铅直距离的平方和达到最小时，对应的直线的截距和斜率，这条直线称为最小二乘回归直线,表示为:
\[\hat{y}=\hat{\beta}_{0}+\hat{\beta}_{1}x\]
第i个观测处的铅直距离是
\[e_{i}=y_i-\hat{y}_{i}, i = 1,2,\cdots,n.\]
这些铅直距离称为普通 **最小二乘残差** ,这些残差之和为0.


<a id="org204ec5e"></a>

## 假设检验

\(\delta^2\)的一个 **无偏估计** 是
\[\delta^2 = \frac{\sum e_{i}^{2}}{n-2}=\frac{\sum(y_{i}-\hat{y_{i}})^2}{n-2}=\frac{SSE}{n-2}\]
其中SSE是 **残差** 平方和,分母中的 n-2 是 **自由度** .自由度等于样本中观测个数减去待估的回归参数的个数
标准差的估计量称为标准误，于是\(\beta_{0}\) 和 \(\beta_{1}\) 的标准误分别为:
\[s.e.(\hat{\beta}_{0})= \hat{\delta}\sqrt{\frac{1}{n}+\frac{\overline{x}^2}{\sum(x_{i}-\overline{x})^2}}\]
\[s.e.(\hat{\beta}_{1})= \frac{\delta}{\sqrt{\sum(x_{i}-\overline{x})^2}}\]
其中\(\hat{\beta}_{1}\)标准误刻画斜率的估计精度，标准误越小估计精度越高
    利用\(\hat{\beta}_{0}\)和\(\hat{\beta}_{1}\)的抽样分布,可以分析同预测变量X对响应变量Y的预测能力,在正态分布假设下,检验原假设 \(H_{0}:\beta_{1}=0\)对备择假设\(H_{1}:\beta_{1} \not 0 \) (简记为\(H_{0}:\beta_{1} = 0 \leftrightarrow H_{1}:\beta_{1} \not 0\)) 的检验是t检验,所用的统计量是
\[t_{1}=\frac{\hat{\beta}_{1}}{s.e.(\hat{\beta}_{1})}\]

