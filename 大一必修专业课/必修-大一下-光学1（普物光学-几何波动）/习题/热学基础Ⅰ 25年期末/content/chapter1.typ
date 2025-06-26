#import "../template.typ": *

= .
+ 请你解释平均自由程 $overline(lambda)$ 和碰撞频率 $overline(Z)$ 的物理含义，并解释他们和什么物理量有关
+ 若 $P=1.01 times 10^(5)#text[Pa],T=273.15#text[K],M=28times 10^(-3) #text[kg/mol],d=3.8times 10^(-10)#text[m]$ 试计算平均自由程 $overline(lambda)$ 和碰撞频率 $overline(Z)$ 的数值

= .
《热学（第三版）》李椿 P78原题
#image("image-30.png")

#figure(
  image("image-31.png",width:30%), 
)
= .
帕克拉龙方程 $ dv(P,T)) = l/(T(nu_beta-nu_alpha)),nu_beta>>nu_alpha $
+ 若 $l=c$ 求 $P(T)$
+ 若 $l=a T+b$ 求 $P(T)$
= .
已知 $ alpha= 1/V (dv(V,T))_P kappa_T=-1/V  (dv(V,P))_T $
若$ alpha=(2a T-b p)/V quad kappa_T =(b T)/V $
求 $V$ 关于 $V,P$ 的函数 $V(T,P)$
$ V=a T^(2)-b P T $
= .
+ 写出克劳修斯等式和不等式，并简述其物理含义
+ 克劳修斯熵是状态量还是过程量？是强度量还是广延量？
+ 如图，左右绝热刚性盒中各置 $1#text[mol]$ 温度为 $T$ 的同种气体，体积分别为 $V_1,V_2$ 两气体，中间由挡板隔开，抽走档板，系统达到稳定状态后，请你计算此过程中的熵变 $Delta S$
#figure(
  image("../figures/no.5.svg",width:50%), 
)
= .
卡诺温熵图
#figure(
  image("../figures/no.6.svg",width:50%), 
)
+ 此过程是卡诺循环还是奥托循环？为什么？
+ 此过程的效率是多少？
+ 计算循环一此，气体对外所做功
= .
若速率分布为
$ v=cases(
  c quad v<v_0,
  1/v^(4) quad v>= v_0
) $
+ 求出 $c,v_0$ 的具体数值
+ 求出速率平均值 $overline(v)$
+ 求出单个分子的平均动能$overline(epsilon)$，设单个分子质量为 $m$
