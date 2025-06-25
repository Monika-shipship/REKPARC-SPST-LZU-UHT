#import "../template.typ": *
#import "@preview/physica:0.9.5": *

= 序言
本文档适用于光学基础Ⅰ考前突击，今后计划在此基础上编纂出适合”lzuer“的完整光学讲义
= 论述题
下面将列出可能出现在考试中的论述题，并附上参考答案，请你先遮住答案，在心中默念答案，或在纸上写下答案，然后再对照参考答案，看看缺漏了哪些部分

#problem("问题")[惠更斯原理的主要内容是什么？请你使用惠更斯原理证明光的折射和反射定律？惠更斯原理的缺陷是什么？]
#answer("答案")[
  
  #grid(
  columns: (70%, 1fr),  // 第一列30%宽度，第二列自动填充剩余空间
  gutter: 1em,          // 列间距
  [     // 第二列放置文字
    + 惠更斯原理的表述：设 $S$ 为波源，在 $t$ 时刻由振源发处的波振动传播到了面 $Sigma$ 上，#highlight()[我们认为 S 上的每一面元都可以看作次波的波源]，由各个面元发出的次波将在 $t ^prime$ 时刻形成一个新的次波面，这些次波面的包络面 $Sigma ^prime$ 就是 $t ^prime$ 时刻的波面。\
    + 折射定理 $ #text[AB]=v_2 t, #text[CD]=v_1 t\ #text[AB]=#text[AD]sin theta_2,#text[CD]=#text[AD]sin theta_1\ arrow.double (sin theta_1)/v_1=(sin theta_2)/v_2 arrow.double n_1 sin theta_1=n_2 sin theta_2 $  反射定理同理可得
    + 缺陷：惠更斯原理未能#highlight()[定量地]给出次波面的包络面上和包络面以外#highlight()[波扰动强度的分布]（即对次波面的振动相位不清楚，#highlight()[未能反映出波动的时空周期性，只反映了扰动的传播]，实际上在惠更斯的年代，他所认为的波源的振动是爆发式的无规则脉冲，而非今天所理解的正弦式振动）
  ],
  [#figure(
    image("../figures/prob1.svg",width:100%), 
    caption: "惠更斯原理的示意图"
  ),
  #figure(
    image("../figures/prob1-2.svg",width:120%), 
    caption: "惠更斯原理的示意图"
  )
  ]
  )
  
)
]
#problem("问题")[惠更斯-菲涅尔原理的主要内容是什么？，他和惠更斯原理的主要区别是什么？]

#answer("答案")[
  #grid(
    columns: (70%, 1fr),  // 第一列30%宽度，第二列自动填充剩余空间
    gutter: 1em,          // 列间距
      [     // 第二列放置文字
        波前$Sigma$上每个面元$dd(Sigma)$都可看作是新的振动中心，他们发出的次波在空间一点P中相干叠加就是P点的振动，其中 $Sigma$ 可以是将 $P,S$ 隔开的任意曲面
      ],
      [
        #figure(
        image("../figures/prob1.svg",width:100%), 
        caption: "{3:示意图}"
        ),
        #figure(
        image("../figures/prob1.svg",width:100%), 
        caption: "{5:示意图}"
        )
      ]
    )
]
= 画图题

= 大题解法
我们将按照《新概念光学》中的顺序罗列出基础知识点和公式，如果你不发现有不熟悉的地方，请去翻书

= 作业题及参考答案汇总
下面将列出所有布置过的作业，并附上答案（以作业布置的时间为序）
== 第四章
=== 原书4.5
#figure(
  image("../figures/4.5.png")
)
#blockquote[

  + （设L代表光程差，r代表真实的距离差)\
  对零级条纹，其光程差有$ L_1-L_2=0 $
  $ L_1=(n-n_0)l + n_0r_1 $
  $ L_2= n_0r_2 $
  可以解出$ (n-n_0)l + r_1-r_2=0 $<eq:l-n-r>
  所以$r_1-r_2$ 小于零，有 $r_2$ 更大，所以上移

  2. $ (n_0-n_0)l= r_2-20 lambda \ n_0=n_0+ (20 lambda)/l = 1.000865 $
]

=== 原书4.6
#figure(
  image("../figures/4.6.png")
)
#blockquote[
  由 @eq:l-n-r 可知， $ (n_0-1)l=r_2-r_1=98.5lambda \ n_0=1+(98.5lambda)/l = 1.000290 $
]

=== 原书4.7
#figure(
  image("../figures/4.7.png")
)
#blockquote[
  + $ d_0 = (lambda R )/b_0  approx 0.74 #text[nm] $
  + $ gamma= |(sin u)/u| \ u= pi b/ b_0= pi/2 \ gamma= 2/pi approx 0.64 $
]

=== 原书4.9
#figure(
  image("../figures/4.9.png")
)
#blockquote[
  $ b d lt.eq.slant lambda R\ d lt.eq (lambda R)/b =6.5 times 10^(-5) #text[m] $
]

=== 原书4.18
#figure(
  image("../figures/4.18.png")
)
#blockquote[
  我们设纳光的波长为 $ lambda approx = 589.3 $ 中心的级数为 $k_0 $ $quad i_b$ 的定义如图
  #figure(
  image("../figures/4.9-sol.svg",width: 40%)
)
  在移动前有 $ 2h&= 50 lambda \ 2h cos i_b &= (k_0-12)lambda $
  在移动后有 $ 2(h-Delta h)&= (k_0-10)lambda \ 2(h- Delta h)cos i_b ^prime = (k_0-10-5)lambda $
  我们假设 $ i_b approx i_b ^prime $
  可以解出 $ Delta h =5lambda approx 2.95 mu m \ k_0 approx 17.1 \ h_0 approx 5 mu m $
]

=== 原书4.19
#figure(
  image("../figures/4.19.png")
)
#blockquote[
  1.衬比度的公式为
  $ gamma=|cos 1/2 Delta k Delta L|=|cos pi (Delta lambda)/lambda^(2) Delta L| $
  从清晰到模糊，光程差为 $ Delta L=lambda^(2)/(2Delta lambda) $
  $ Delta L=2 n h= N lambda $
  $ Delta lambda approx lambda/(2N) approx 6 Å $
  $ lambda_1 approx 5890 Å\ lambda_2 approx 5896 Å $
  2. $ lambda^(2)/(2 Delta lambda) = N lambda \ N approx lambda /(2 Delta lambda) approx 137.6 $
]

=== 原书4.20
#figure(
  image("../figures/4.20.png")
)
#blockquote[
  $ 2 h= N lambda $
  $ Delta h= (Delta lambda)/2=lambda /16 approx 39.55 mu m $
  $ L_M approx lambda^(2)/(2 lambda) approx 2 m $

]

=== 原书4.22
#figure(
  image("../figures/4.22.png")
)
#blockquote[
  1.
  $ L_0 approx lambda^(2)/(Delta lambda) approx 0.413 m \ tau_0 = L_0/c approx 1.38 n s $
  2. $ Delta nu tau_0=1 \ Delta nu=1/tau_0 approx 726 #text[MHz] $
  3. $ gamma=|(sin u)/u| $
  其中 $u=1/2 Delta k Delta L = pi (Delta L)/(L_0) $
  当 $Delta L$ 从 $-L_0$ 变化到 $2L_0$ 时，刚好经过主波包和次波包，即要通过三倍的 $L_0 $
  $ 3L_0=2h | t = h/v=1200s =20 #text[min] $

]

=== 原书4.24
#figure(
  image("../figures/4.24.png")
)
#blockquote[
  设中心处的级数为 $k_0$
  在中心处有 $ 2 h_0=k_0 lambda $
  在边缘处有 $ 2 h_0 cos theta= (k_0-10)lambda $
  由于 $theta$ 很小，可作近似 $cos theta approx 1- theta^(2)/2$ 
  $ theta approx sqrt( (10 lambda)/h_0   )approx 0.022 #text[rad] $
  $ d approx 2 f theta approx 13.5 #text[ mm] $
]


== 第二章

=== 原书2.17
#figure(
 image("../figures/2.17.png",width:100%), 
)
#blockquote[
  $ A approx S \ A(P) = 1/2 A_0 \ I(P) = 1/4 I_0 $
]

=== 原书2.18

#figure(
 image("../figures/2.18.png",width:100%), 
)
+ (a)
#blockquote[
  #figure(
 image("../figures/sol2.18.svg",width:40%), 
)
  第一个半波带未被遮挡，第二个半波带前半遮挡，后半通过，以后的所有半波带都被遮挡，如图
  $ A_p = sqrt( 2 ) A_0 \ I(P) = 2 I_0 $
]

+ (b)
#blockquote[
  #figure(
 image("../figures/sol2.18b.svg",width:40%), 
)
  只有第三个半波带前半通过，后半遮挡
  $ A_p = sqrt( 2 ) A_0 \ I(P) = 2 I_0 $
]

+ (c)
#blockquote[
  #figure(
 image("../figures/sol2.18c.svg",width:40%), 
)
  所有半波带的振幅都减半
  $ A_p = 1/2  A_0 \ I(P) = 1/4 I_0 $
]

+ (d)
#blockquote[
  #figure(
 image("../figures/sol2.18d.svg",width:40%), 
)
  第一个半波带全通过，第二个半波带振幅减半，其余全被遮挡
  $ A_p = A_0 \ I(P) =  I_0 $
]

+ (e)
#blockquote[
  #figure(
 image("../figures/sol2.18e.svg",width:90%), 
)
  第一个半波带全通过，第二个半波带前半遮挡，后半通过，第三半波带至无穷半波带全通过，相当于第一个半波带的一半振幅(记为 $A_3$)，
  只有第三个半波带前半通过，后半遮挡
  $ A_p^(2) = A_0^(2) + (sqrt( 2 ) A_0)^(2) - 2 A_0 sqrt( 2 ) A_0 cos(135 degree )= 5 A_0^(2) \ I(P) = 5 I_0 $
]

+ (f)
#blockquote[
  #figure(
 image("../figures/sol2.18f.svg",width:40%), 
)
  只有第三个半波带前半通过，后半遮挡
  $ A_p = + 2 A_0 dot 3/4 + (-2A_0) + A_0 dot 3/4 =1/4 A_0 \ I(P) = 1/16 I_0 $
]

=== 原书2.20
#figure(
 image("../figures/2.20.png",width:100%), 
)
#blockquote[
  半波带的公式有 $ 1/R + 1/b =(k lambda)/rho_k^(2) \ k=1 quad R arrow oo \ f=b= rho^(2)/lambda prop 1/lambda $
  $ f^prime = (lambda)/(lambda^prime) f= (900 #text[nm])/(633 #text[nm]) times 30 #text[cm] approx 43 #text[cm] $
]

=== 原书2.22
#figure(
 image("../figures/2.22.png",width:100%), 
)
#blockquote[
  #figure(
 image("../figures/sol2.22.svg",width:100%), 
)
$ U(p)= 1/(i lambda) integral.double_Sigma (cos theta_0+ cos theta)/2 dot U(Q) dot 1/r e^(i k r) d Sigma $
入射光是平行光， $U(Q)=A$ ，由傍轴条件可得 $cos theta approx 1 , cos theta_0 approx 1 , 1/r approx 1/r_0 = #text[Const]$ \ 
综上，有 $ U(p)=A/(i lambda r_0)integral.double_Sigma  e^(i k r) d Sigma $ 
关于 $1/r_0$ 下面给出详细计算（实际上我们已经由经验知道在接收屏刚好在透镜的焦平面上时有 $1/r_0 approx 1/f$）
在 $A$ 点，振幅为 $A(A)=A$ \ 在 $B$ 点，振幅为 $A(B)=alpha/r$ \ 在 $C$ 点，振幅为 $A(C)=alpha^prime/r^prime$ \ 我们要计算就是 $P$ 点的振幅 $A(P)=?$
假设透镜不影响振幅，则有 $alpha = alpha^prime$ \
傍轴条件可得 $r approx s,r^prime approx s^prime$
由透镜的成像公式 $ f/s + f/s^prime =1 \ f/s = 1- f/s^prime  $
$ A(P)= alpha^prime / (A^prime P)= r^prime/ (A^prime P) A(C) approx s^prime/(s ^prime - f) A(C)  \ A(C) approx A(B) = alpha /r approx alpha /s\ A(P) approx (s ^prime)/(s ^prime - f) alpha/s = 1/(1- f/s^prime) alpha /s $
由于 $f/s=1- f/s^prime$
可得 $ A(P) approx alpha/(f/s dot s)= alpha /f $ 
故 $ 1/r_0 approx 1/f $ 当接收屏刚好在透镜的焦平面上\

下面计算斜入射时接收屏上的光强分布：
光线1相对于光线2的光程差为 $ Delta L = x sin theta_0- x sin theta = -x(sin theta- sin theta_0) $
$ U(P)&= A/(i lambda f) integral.double_Sigma e^(i k Delta L) d Sigma \ &= A/(i lambda f) integral_(-a/2)^(a/2) e^(- i k x (sin theta- sin theta_0)) b dot d x $
为方便计算，我们设常数： $ alpha = k a/2 (sin theta- sin theta_0)= (pi a)/lambda (sin theta- sin theta_0) $
$ U(P)&= (A b)/(i lambda f) integral_(-a/2)^(a/2) e^(- i (2alpha)/a x)  d x \
  &= (A b)/ (i lambda f) 1/(- i (2alpha)/a) (e^(-i alpha)- e^(i alpha))\ 
  &= -(A a b)/(lambda f) (sin alpha)/alpha  $
  光强则为
  $ I(theta,theta_0)&=((a b)/(lambda f))^(2) A^(2) ((sin alpha)/alpha)^(2) \ 
  &= I_0 ((sin alpha)/alpha)^(2)  $
  其中 $ alpha&= k a/2 (sin theta-sin theta_0) \ &=(pi a)/ lambda (sin theta-sin theta_0  ) $
  下面计算零级条纹的半角宽 $Delta theta$ \
  $I/I_0=0$ 时， $alpha = k pi quad a(sin theta- sin theta_0)= k lambda$
  $ k&=0 quad theta = theta_0 \ k&=1 quad a (sin(theta_0+Delta theta)- sin theta_0) &= lambda\ a cos theta_0 dot Delta theta &=lambda \ Delta theta &= lambda/(a cos theta_0)  $
  证毕

]

=== 原书2.24
#figure(
 image("../figures/2.24.png",width:100%), 
)
#blockquote[
  + $ Delta theta = 1.22 lambda / D approx 4 times 10^(-4) #text[rad] $
  + $ rho = z dot Delta theta approx 4 #text[mm] $
  + $ rho = z dot Delta theta approx 1.5 times 10^(3) #text[m] $
]

=== 原书2.30
#figure(
 image("../figures/2.30.png",width:100%), 
)
#blockquote[
  + $ (1 #text[m])/(200 #text[km]) &= 1.22 lambda/D\ D &= 1.22 lambda (200#text[km])/(1 #text[m]) approx 98 #text[mm] $
  + $ Delta theta = 1.2 lambda / D approx 5 times 10^(-6) #text[rad] $
  $ N gt.eq 1/(f dot Delta theta ) approx 2500 #text[/mm] $
]

=== 原书2.32
#figure(
 image("../figures/2.32.png",width:100%), 
)
#blockquote[
  + $ lambda = v/f = (1.5 #text[km/s])/(40#text[kHz]) approx 3.8 #text[cm] \ Delta theta = 1.22 lambda/D approx 7.7 times 10^(-2) #text[rad] $
  + $ rho = z dot Delta theta approx 77 #text[m] $
]

== 第八章

=== 原书8.1
#figure(
  image("../figures/8.1.png",width:100%), 
)
#blockquote[
  #figure(
  image("../figures/8.1solve.svg",width:70%), 
)
$ A_o=A sin alpha,A_e= A cos alpha \ A_o / A_e = tan alpha = tan 20 degree approx 0.36 \ I prop n A^(2) \ I_o / I_e  = n_o/n_e tan^(2) alpha approx 0.15 $
]

=== 原书8.3
#figure(
  image("../figures/8.3.png",width:100%), 
)
#blockquote[
  光轴平行于表面，且入射光为正入射，此时oe光方向相同，但是传播速度不同，两者光程分别为
  $ L_o= n_o d approx 1.314 #text[mm] \ L_e = n_e d approx 1.322 #text[mm] $
]

=== 原书8.4
#figure(
  image("../figures/8.4.png",width:100%), 
)
#blockquote[
  在光轴垂直于入射面时，oe光分别符合折射定律，有
  $ n_e sin i_e =sin i , n_o sin i_o = sin i \ i_e = arcsin((sin i)/n_e) approx 31.03 degree\ i_o = arcsin((sin i)/n_o)approx 27.52 degree $
]

=== 原书8.5
#figure(
  image("../figures/8.5.png",width:100%), 
)
#blockquote[
  #figure(
  image("../figures/8.5solve.svg",width:60%), 
)
  在光轴垂直于入射面时，oe光分别符合折射定律，有
  $ n_e sin i_e =sin i approx 1 \ n_o sin i_o = sin i approx 1 \ i_e = arcsin((sin i)/n_e) approx 49.74 degree\ i_o = arcsin((sin i)/n_o)approx 49.81 degree \ x_e = d tan i_e approx 4.9595 #text[mm] \ x_o = d tan i_o approx 4.9718 #text[mm] \ Delta x  = x_o - x_e approx 12.13 mu#text[m] $
  
]
=== 原书8.8
#figure(
  image("../figures/8.8.png",width:100%), 
)
#blockquote[
  #figure(
  image("../figures/8.8solve.svg",width:70%), 
)
]

=== 原书8.10
#figure(
  image("../figures/8.10.png",width:100%), 
)
#blockquote[
  #figure(
  image("../figures/8.10solve.svg",width:60%), 
)
  光束正入射，厚度均匀，e光法线就与晶片表面法线一致
  $ theta = 90 degree - 40 degree = 50 degree $
  法向角 $theta$ 和射线角 $xi$ 的关系为
  $ tan xi = n_o^(2)/n_e^(2) tan theta  approx 1.4836 \ xi approx 56 degree\ alpha = xi - theta approx 6 degree \ Delta = d tan alpha approx 2.1 #text[mm] $
]
=== 原书8.22
#figure(
  image("../figures/8.22.png",width:100%), 
)
#blockquote[
  #figure(
  image("../figures/8.22solve.svg",width:100%), 
)
  + $ A_e = A_1 cos alpha approx 0.68 A \ I_e = A_e ^(2) approx 0.46 I_0 \ A_o = A sin alpha  approx 0.18 A \ I_o = A_o^(2) approx 0.033 I_0   $
  + 投影到 $P_2 $ 方向的两个振幅和光强为 $ A_(2e) = A_e cos alpha approx 0.66 A \ I_(2e) = A_(2e)^(2) approx 0.44I_0 \ A_(2o) = A_o cos alpha approx 0.047 A \ I_(2o) = A_(2o)^(2) approx 0.0022I_0  $
  + $ I_2 = A_(2e)^(2) +A_(2o)^(2) + 2 A_(2e) A_(2o) cos delta\ delta = delta_(o e)+pi = 3/2 pi \ I_2 approx 0.44 I_0 $
]

=== 原书8.25
#figure(
  image("../figures/8.25.png",width:100%), 
)
#blockquote[
  #figure(
  image("../figures/8.25solve.svg",width:60%), 
)

+ 因为是右旋偏振光，已有相位差 $delta_(#text[入])=pi/2$
  $ A_(2e ) = A_e cos 30 degree = sqrt( 3 )/2 A_e \ A_(2o) = A_o sin 30 degree = 1/2 A_o $
  $ I_o = 4 I_e , A_o = 2 A_e $
  $ delta_(o e)= 2pi/lambda (n_e-n_e)d=- pi/3  $
  在P处振动的两相位差为 $ delta = delta_(#text[入] + delta_(o e)=pi/6 $
  $ I_2 = A_(2e)^(2)+A_(2o)^(2) + 2A_(2e)^(2) A_(2o)^(2) cos delta = 13/4 I_e = 13/20 I_o $
+ 若改为左旋，则 $delta_(#text[入]= - pi/2$
  $ delta = delta_(#text[入] + delta_(o e)=- 5/6 pi $
  $ I_2^prime = A_(2e)^(2)+A_(2o)^(2) + 2A_(2e)^(2) A_(2o)^(2) cos delta = 1/4 I_e = 1/20 I_o $
+ 套用公式 $ I_M = 1/2 I_0 + 1/2 sqrt( I_x^(2)+I_y^(2)+2I_x I_y cos 2delta ) = (5+ sqrt( 13 ))/10 I_0 approx 0.86 I_0 \ I_m = I_0-I_M approx 0.14 I_0 $
]
== 第五章
=== 原书5.3
#figure(
  image("../figures/5.3.png",width:100%), 
)
#blockquote[
  选择最左侧的单缝为原点处，则第二个缝的位移为 $d$ ，相移 $e^(-k d sin theta)=e^(i delta)$ ，第二个缝的位移为 $3d$ ，相移 $e^(-k 3d sin theta)=e^(i 3delta)$
  $ delta = - k d sin theta , alpha =(pi a sin theta)/lambda \ U(theta)=(1+e^(i delta)+e^(i 3delta)) dot U_1(theta) \ U_1(theta)= c_1 (sin alpha)/alpha \ I(theta)= U dot U^(star) = (1+e^(i delta)+e^(i 3delta)) dot (1+e^(-i delta)+e^(-i 3delta)) I_1(theta) = (3+2 cos delta + 2 cos(2delta)+2 cos(3delta)) I_1 $
]

=== 原书5.4
#figure(
  image("../figures/5.4.png",width:100%), 
)
#blockquote[
  $ U_1= c_1 (sin alpha_1)/alpha_1 ,alpha_1 = (pi a sin theta)/lambda \ 
    U_2= c_2 (sin alpha_2)/alpha_2 dot e^(i delta) ,alpha_2 = (pi 2 a sin theta)/lambda = 2 alpha_1 \  $
    $ delta = k d sin theta = k 3 a sin theta = 6 alpha_1, quad c_2/c_1= 2a/a = 2 \ U(theta)= U_1+U_2 = c_1 (sin alpha_1)/alpha_1+ c_2 (sin alpha_2)/alpha_2 dot e^(i delta) = c_1 ((sin alpha)/alpha ) (1+ 2 e^(i delta) cos alpha) \ I=U dot U^(star) = I_0 ((sin alpha)/alpha)^(2 ) (3+2(cos 2alpha + cos 5alpha + cos 7alpha))  $
]

=== 原书5.6
#figure(
  image("../figures/5.6.png",width:100%), 
)
#blockquote[
  正入射时多缝的衍射公式为 
  $ I(theta)= I_0 ((sin alpha)/alpha)^(2 ) ((sin N beta)/beta)^(2) \ alpha= (pi a sin theta)/lambda , beta= (pi d sin theta)/lambda $
  当由正入射变成斜入射时，相距x的两束光的光程差由 $x sin theta$  变为 $x (sin theta- sin theta_0)$ 所以斜入射的公式只需要替换掉 $sin theta$ 即可，即\
  斜入射时多缝的衍射公式为 
  $ I(theta)= I_0 ((sin alpha)/alpha)^(2 ) ((sin N beta)/beta)^(2) \ alpha= (pi a )/lambda  (sin theta- sin theta_0) , beta= (pi d )/lambda (sin theta- sin theta_0) $
  + 主极强衍射角应满足公式 $ beta= k pi quad d(sin theta_k - sin theta_0)=k lambda,k in ZZ  $
  + 设 $theta_k$ 附近的第一个暗点衍射角为 $(theta_k + Delta theta_k)$
  $ d( sin (theta_k+Delta theta_k)-sin theta_0)= (k+1/N) lambda\ sin (theta_k+Delta theta_k)- sin theta_k = lambda/(N d)\ cos theta_k Delta theta_k = lambda/(N d) \ Delta theta_k = lambda / (N d cos theta_k ) $
]
=== 原书5.15
#figure(
  image("../figures/5.15.png",width:100%), 
)
#blockquote[
  + $ delta_0 = 2pi/lambda Delta L_0 = 2pi/lambda (1-n)h=-2.5pi $
  + 上缝的相位差 $ delta_1= - 2pi/lambda sin theta dot(3/2 a + a/2) = - 4pi/lambda a sin theta $
    下缝的相位差 $ delta_2 = - delta_1 $
  + $ U=U_1+U_2+U_3= c_0 ((sin alpha_0)/alpha_0) e^(i delta_0) + c_1 ((sin alpha)/alpha) e^(i delta_1)+ c_2 ((sin alpha)/alpha) e^(i delta_2) \ alpha_0=(pi 3 a sin theta)/lambda quad alpha = (pi a sin theta)/lambda quad c_1=c_2=1/3c_0\ U= c_1(2((sin alpha)/alpha) dot cos(k 2 a sin theta)- 3 i ((sin alpha_0)/alpha_0)) \ I(theta)= U dot U^(star) = I_0(4((sin alpha)/alpha)^(2)cos^(2)(k 2 a sin theta)+ 9 ((sin alpha_0)/alpha_0)^(2)) $
]

== 第九章
=== 原书9.1
#figure(
  image("../figures/9.1.png",width:100%), 
)
#blockquote[
  $ I=I_0 e^(- alpha l) \  I/I_0=10% quad l=7.2#text[cm] \ I/I_0=20% quad l=5.0#text[cm] \ I/I_0=30% quad l=2.2#text[cm] \ I/I_0=80% quad l=0.70#text[cm] \  $
]

=== 原书9.4
#figure(
  image("../figures/9.4.png",width:100%), 
)
#blockquote[
  $ L= - 1/alpha ln(I/I_0) approx 41 #text[m] $
]

=== 原书9.5
#figure(
  image("../figures/9.5.png",width:100%), 
)
#blockquote[
  $ overline(n)= n i + (c alpha)/(2w)\ arrow.double (c alpha)/(2w) = 5 times 10^(-8) quad alpha approx 1.0 #text[m]^(-1)\ v= c/n approx 2times 10^(8) #text[m/s]  $
]