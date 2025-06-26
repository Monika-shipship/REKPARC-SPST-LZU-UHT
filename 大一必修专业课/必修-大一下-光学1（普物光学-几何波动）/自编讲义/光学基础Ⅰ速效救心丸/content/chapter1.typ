#import "../template.typ": *
#import "@preview/physica:0.9.5": *

= 序言
本文档适用于光学基础Ⅰ考前突击，今后计划在此基础上编纂出适合”lzuer“的完整光学讲义
= 论述题
下面将列出可能出现在考试中的论述题，并附上参考答案，请你先遮住答案，在心中默念答案，或在纸上写下答案，然后再对照参考答案，看看缺漏了哪些部分

#problem("问题")[惠更斯原理的主要内容是什么？请你使用惠更斯原理证明光的折射和反射定律？惠更斯原理的缺陷是什么？]
#answer("答案")[

  #grid(
    columns: (70%, 1fr),
    // 第一列30%宽度，第二列自动填充剩余空间
    gutter: 1em,
    // 列间距
    [
      // 第二列放置文字
      + 惠更斯原理的表述：设 $S$ 为波源，在 $t$ 时刻由振源发处的波振动传播到了面 $Sigma$ 上，#highlight()[我们认为 S 上的每一面元都可以看作次波的波源]，由各个面元发出的次波将在 $t^prime$ 时刻形成一个新的次波面，这些次波面的包络面 $Sigma^prime$ 就是 $t^prime$ 时刻的波面。\
      + 折射定理 $ #text[AB]=v_2 t, #text[CD]=v_1 t\ #text[AB]=#text[AD]sin theta_2,#text[CD]=#text[AD]sin theta_1\ arrow.double (sin theta_1)/v_1=(sin theta_2)/v_2 arrow.double n_1 sin theta_1=n_2 sin theta_2 $  反射定理同理可得
      + 缺陷：惠更斯原理未能#highlight()[定量地]给出次波面的包络面上和包络面以外#highlight()[波扰动强度的分布]（即对次波面的振动相位不清楚，#highlight()[未能反映出波动的时空周期性，只反映了扰动的传播]，实际上在惠更斯的年代，他所认为的波源的振动是爆发式的无规则脉冲，而非今天所理解的周期性振动）
    ],
    [#figure(image("../figures/prob1.svg", width: 100%), caption: "惠更斯原理的示意图"),
      #figure(
        image("../figures/prob1-2.svg", width: 120%),
        caption: "惠更斯原理的示意图",
      )
    ],
  )

  )
]
#problem("问题")[惠更斯-菲涅尔原理的主要内容是什么？，他和惠更斯原理的主要区别是什么？]

#answer("答案")[
  #grid(
    columns: (70%, 1fr),
    // 第一列30%宽度，第二列自动填充剩余空间
    gutter: 1em,
    // 列间距
    [
      // 第二列放置文字
      波前$Sigma$上每个面元$dd(Sigma)$都可看作是新的振动中心，他们发出的次波在空间一点P中相干叠加就是P点的振动，其中 $Sigma$ 可以是将 $P,S$ 隔开的任意曲面
      $ U(P)=integral.surf_Sigma dd(U(Q)) $


      和惠更斯原理的主要区别是，菲涅尔#highlight()[考虑到了波动的时空周期性，能够相干叠加]，将“次波相干叠加”的思想运用到统一的原理中去
    ],
    [
      #figure(
        image("../figures/prob2.svg", width: 100%),
        // caption: "{3:示意图}"
      ),
      // #figure(
      // image("../figures/prob1.svg",width:100%),
      // caption: "{5:示意图}"
      // )
    ],
  )
]
#problem("问题")[如何利用马吕斯定理计算偏振光通过检偏器后的光强？\ 写出检测一束光的偏振度的方法和相关的理论公式。]
#answer("答案")[
  马吕斯定理：当光强为 $I_0$ 的线偏光进入检偏器后，透射光强为
  $ I=I_0 cos theta $ 其中 $theta$ 为线偏光的偏振方向与检偏器光轴方向的夹角
  检测方法：不断地旋转检偏器，记录下透射光的最大值 $I_M$ 和最小值 $I_m$
  $ P= (I_M-I_m)/(I_M+I_m) $
]
#problem("问题")[什么是光栅衍射？其条纹特点是什么？]
#blockquote[
  + 光栅衍射是指当光通过由大量等间距平行狭缝组成的光栅后，发生单缝衍射和多缝干涉的现象，可根据惠更斯-菲涅尔原理进行计算，若在光栅后置一光屏，光通过各狭缝的衍射光将相互干涉，形成明暗相间的条纹，如图所示
  + 条纹特点：
  设狭缝数为 $N$ ，光栅宽度为 $D$ ，狭缝间距为 $d$，入射光波长为 $lambda$，则条纹的特点包括：
    + 明暗相间，由多缝干涉主导，明纹条件：，满足公式 $d sin theta = m lambda $（$d$为光栅常数，$m$为整数级次）。且半角宽为 $Delta theta_k=(lambda)/(N d cos theta_k)$
    + 条纹锐利且明亮：由于多缝干涉，主极大条纹更窄、强度更高。
    + 等间距性：在入射光为单色且小角度时，条纹近似等间距分布。
    + 缺级现象：当单缝衍射的极小位置与多缝干涉的极大位置重合时，对应级次缺失。具体而言是
      $d sin theta = m lambda$ 且 $a sin theta = n lambda$ 同时满足时，$m$级次的条纹缺失，即$ d/a = m/n $其中 $a$ 为单缝宽度。
    + 色散作用：白光入射时，不同波长的光形成光谱，用于波长分析和光谱仪设计。可以由此推导光栅的色散本领：\
    我们关心波长差为 $delta lambda$ 的两条谱线的角间隔 $delta theta$ 或其在屏幕上的间距 $delta l$\
    利用$d sin theta = k lambda$取微分得$ d cos theta delta theta=k delta lambda $
      - 角色散本领为 $ D_theta = (delta theta) / (delta lambda)=k/(d cos theta_k) $
      - 线色散本领为 $ D_lambda = (delta l) / (delta lambda)=(f k)/(d cos theta_k) $ $f$为光栅后透镜的焦距
      - 色分辨本领
      设半角宽度为 $Delta theta_k =(lambda)/(N d cos theta_k)$ ,而两条谱线的角间隔是 $delta theta$ ，根据瑞利判据，只有当 $delta theta>=Delta theta_k$ 时，才能分辨出两条谱线，我们能分辨出的波长差为 $ delta lambda=(delta theta)/D_theta >= (Delta theta)/D_theta=lambda/(N d cos theta_k) dot (d cos theta_k)/k = lambda/(N k) $ 与级数无关\
      而我们关心的色分辨本领为
      $ R=lambda/(delta lambda)=N k $
]
#figure(
  image("../figures/5缝0.1m.png", width: 100%),
  caption: "五缝，间距0.1m，菲涅尔衍射",
)
#figure(
  image("../figures/5缝0.5m.png", width: 100%),
  caption: "五缝，间距0.5m，菲涅尔衍射",
)
#figure(
  image("../figures/5缝1.5m.png", width: 100%),
  caption: "五缝，间距0.5m，菲涅尔衍射",
)
#figure(
  image("../figures/双缝0.5m.png", width: 100%),
  caption: "双缝，间距0.5m，菲涅尔衍射",
)

#problem("问题")[解释光的散射现象中，瑞利散射和米氏散射的特点及适用范围。]
#answer("答案")[
  - 瑞利散射
    - 特点
      - 适用于波长远大于粒子尺寸的情况
      - 散射强度与波长的四次方成反比，即 $I prop 1/lambda^4$，因此短波长光（如蓝光）散射更强，导致天空呈现蓝色。
    - 现象
      - 白天天空呈现蓝色（蓝光散射最显著）
      - 日落时天空呈现红色（红光长波长散射少）
    - 解释
      - 一个简谐振荡的电偶极子，其偶极矩为 $p(t)=p_0e^(i omega t)$ 
      在远场区（$r>>lambda$）产生的电场和磁场为
      $ vb(E(t))= (mu_0p_0omega^(2))/(4pi r) sin theta e^(i omega t) vu(theta) $
      $ vb(B(t))= (mu_0p_0omega^(2))/(4pi c r) sin theta e^(i omega t) vu(phi) $
      $ S=E times H\ overline(S)=(mu_0p_0^(2)omega^(4))/(32pi^(2) c r^(2)) sin ^(2) theta\ arrow.double I prop lambda^(-4) $
  - 米氏散射
    - 特点
      - 适用于波长与粒子尺寸相当的情况
      - 散射强度与波长的关系更复杂，通常不遵循简单的 $1/lambda^4$ 规律。
    - 现象
      - 雾霾天气时，光线被大气中的微小水滴或灰尘散射，导致能见度降低和天空颜色变灰
      - 云层呈白色（所有波长光均被均匀散射）
]
#problem("问题")[给出几种不同的产生线偏振光的试验方案，并说明相应的光学规律、定理或原理。]
#answer("答案")[
  + 偏振片法，将自然光射入起偏器中，根据马吕斯定理，$I=I_0 cos^(2) theta$
  + 布儒斯特角反射法，将自然光以布儒斯特角入射透明介质中（如玻璃），反射光为s线偏光（振动方向垂直于入射面）$tan theta_b=n_2/n_1$ 假设是从介质1射入介质2
  + 双折射晶体法，如图oe光分别为线偏光
  
]
#figure(
  image("image.png",width:90%), 
)
#figure(
  image("image-1.png",width:90%), 
)
#figure(
  image("image-2.png",width:90%), 
)
#figure(
  image("image-3.png",width:90%), 
)
#figure(
  image("image-4.png",width:90%), 
)
#problem("问题")[给出圆偏振光产生的试验方案]
#answer("答案")[
  - 实验步骤
  让线偏振光通过四分之一波片，并使其振动方向与波片快慢轴成45°夹角,出射光就是圆偏振光。
  - 光学原理
  波片的相位延迟原理：
  四分之一波片在快轴和慢轴之间引入 $lambda/4$ 的相位差（即相位差为 $pi/2$）。
  
  偏振光的合成：
  当线偏振光的振动方向与波片快慢轴成45°时，分解的两个垂直分量振幅相等，相位差为 $pi/2$，合成后形成圆偏振光。]
#problem("问题")[给出光的偏振态检测区分的实验方案]
#answer("答案")[
  区分自然光、线偏振光、圆偏振光、椭圆偏振光:
  + 区分线偏和自然光，将光射入起偏器中，旋转起偏器
    - 若光强随角度周期性变化（遵循马吕斯定律$I=I_0 cos ^(2) theta$ ，则为线偏振光。
    - 若光强不随角度变化，则为自然光。
  + 区分圆偏，椭圆偏和自然光，将光先通入 $1/4$ 波片，再通入起偏器
    - 若光强随角度周期性变化，（遵循马吕斯定律$I=I_0 cos ^(2) theta$，有消光现象，即为圆偏（此时圆偏变线偏）
    - 若光强仍不变化，则为自然光
  + 区分椭圆偏振光
    + 先直接通入起偏器，旋转一周发现有最大值和最小值（即无消光），可证明是椭偏或者部分偏振光
    + 然后先通过$1/4$ 波片，然后通入起偏器，然后不断调整波偏和起偏器，存在消光现象，即为椭偏（如波片快轴正好与椭圆的长轴重合，此时为线偏，存在消光

]
#problem("问题")[给出费马原理的物理表述，利用费马原理证明光的反射折射定律。]
#answer("答案")[
  
  光在两点之间传播的实际路径是光程取极值的路径
  $ delta integral n dd(s) =0 $
  ]
  #problem("问题")[给出等厚干涉和等倾干涉的应用例子并阐述原理]
  #answer("答案")[
    + 等厚干涉
      - 定义：在等厚的地方发生干涉（当薄膜厚度不均匀时，干涉条纹由相同厚度的点组成）
      - 原理：#highlight()[光程差近似] $Delta L = 2n d cos theta + lambda/2$
      - 应用：
        - 牛顿环：测量透镜曲率半径、检测表面平整度
        - 劈尖干涉：测量微小物体厚度
        - 肥皂薄膜上的彩色条纹，不同颜色的光相互干涉
    + 等倾干涉
      - 定义：在倾角相同的地方发生干涉（当薄膜厚度均匀时，干涉条纹由相同入射角的光产生。） 
      - 光程差#highlight()[严格为] $Delta L = 2n d cos theta + lambda/2$
      - 应用：
        - 增反增透，用在相机和激光谐音振腔里
        
  ]
#problem("问题")[迈克尔逊干涉仪的工作原理及应用举例]
#answer("答案")[

  + 工作原理：分束器将入射光分为两束，分别射向固定镜（$M_1$）和移动镜（$M_2$），反射后重新合并产生干涉。通过调节两条路径的光程差，可以观察到明暗相间的干涉条纹。
  + 应用举例：
    - 测量光波长
    - 测量微小位移
    - 光学元件检测，用于检测透镜、棱镜等光学元件的质量和缺陷。
  
]
#image("image-5.png")
#problem("问题")[菲涅尔圆孔衍射和圆屏衍射的光强分布特点]
#answer("答案")[
  + 菲涅尔圆孔衍射
    - 光强轴向分布（沿圆孔轴线方向）：
    - 光强随观察点与圆孔的距离变化呈振荡衰减，呈现明暗交替的衍射条纹。
    - 中心点光强：可能存在极大值（亮斑）或极小值（暗斑），具体取决于观察点位置与圆孔半径的关系（由菲涅尔半波带数目决定）。
    - 横向光强分布（垂直于轴线方向）：
    - 呈同心圆环状，明暗交替分布，中心对称。
    - 随着离轴距离增大，条纹对比度逐渐降低。
  + 菲涅尔圆屏衍射
    - 中心点光强：
      圆屏中心始终为亮斑（称为泊松亮斑），无论观察距离如何，这一现象直接验证了光的波动性。
    - 周围光强分布：
      圆屏外侧的光强分布与圆孔衍射类似，呈现明暗交替的同心圆环。\
      光强整体衰减较快，边缘衍射效应显著。
  + 巴比涅原理的体现：
  #highlight()[圆孔与互补圆屏的衍射光强分布总和等于无障碍时的光强，只有在几何像点处两者的光强不同]（#highlight()[即圆孔光学像点处时暗时量，而圆屏光学像点处始终为亮]）
]

#problem("问题")[偏振光干涉应用举例。]
#answer("答案")[
  + 元件：
    - 起偏器：将入射自然光变为线偏振光。
    - 双折射元件（如波片、应力材料等）：将线偏振光分解为两束正交的偏振光（o光和e光），并引入相位差。
    - 检偏器：将两束光的偏振方向调整至一致，使其能够干涉。
  + 干涉原理
    - $Δ φ = Δ φ₁ + Δ φ₂$ ,$Δ φ₁ = lambda/2 (n_e - n_o)d$ ,$Δ φ₂$为几何相位差，由两束光经过检偏器后振动方向不一致导致
    - 若两束光的振幅分别为$A_1$和$A_2$，总光强为：
$
I = A_1^(2) + A_2^(2) + 2A_1 A_2 cos Δ φ 
$
  + 应用举例：
    - 光弹性效应,各向同性材料（如塑料、玻璃）在应力作用下会变为各向异性，导致两束偏振光发生干涉, 可测量内部应力分布
    - 液晶显示技术（LCD）
    - 滤光器，只允许特定波长的偏振光通过，阻挡其他波长的光，激光调谐、光谱仪中的波长选择
]

= 画图题
== 半波带

#figure(image("../figures/2.18.png", width: 100%))
+ (a)
#blockquote[
  #figure(image("../figures/sol2.18.svg", width: 40%))
  第一个半波带未被遮挡，第二个半波带前半遮挡，后半通过，以后的所有半波带都被遮挡，如图
  $ A_p = sqrt(2) A_0 \ I(P) = 2 I_0 $
]

+ (b)
#blockquote[
  #figure(image("../figures/sol2.18b.svg", width: 40%))
  只有第三个半波带前半通过，后半遮挡
  $ A_p = sqrt(2) A_0 \ I(P) = 2 I_0 $
]

+ (c)
#blockquote[
  #figure(image("../figures/sol2.18c.svg", width: 40%))
  所有半波带的振幅都减半
  $ A_p = 1/2 A_0 \ I(P) = 1/4 I_0 $
]

+ (d)
#blockquote[
  #figure(image("../figures/sol2.18d.svg", width: 40%))
  第一个半波带全通过，第二个半波带振幅减半，其余全被遮挡
  $ A_p = A_0 \ I(P) = I_0 $
]

+ (e)
#blockquote[
  #figure(image("../figures/sol2.18e.svg", width: 90%))
  第一个半波带全通过，第二个半波带前半遮挡，后半通过，第三半波带至无穷半波带全通过，相当于第一个半波带的一半振幅(记为 $A_3$)，
  只有第三个半波带前半通过，后半遮挡
  $ A_p^(2) = A_0^(2) + (sqrt(2) A_0)^(2) - 2 A_0 sqrt(2) A_0 cos(135 degree)= 5 A_0^(2) \ I(P) = 5 I_0 $
]

+ (f)
#blockquote[
  #figure(image("../figures/sol2.18f.svg", width: 40%))
  只有第三个半波带前半通过，后半遮挡
  $ A_p = + 2 A_0 dot 3/4 + (-2A_0) + A_0 dot 3/4 =1/4 A_0 \ I(P) = 1/16 I_0 $
]
== 双折射基本知识
- 晶体的光轴：光沿此方向入射时无双折射。
- 主截面：入射界面（晶体表面）的法线与光轴形成的平面。与晶体相关，与光线无关。
  #image("image-6.png")
- 主平面：晶体中的光线与光轴所形成的平面。
  #image("image-7.png")
  #image("image-8.png")
  #image("image-9.png")
  #image("image-10.png")
- 晶体中光波波面的特点：
  - 除了两个特殊的方向，e光的传播方向与其波面不垂直。这是因为其波面为椭球面。
  - o光的波面是球面，故其传播方向处处与其波面垂直。
- e光的主折射率：e光沿与光轴垂直方向传播时的速度为$v_e$，则其主折射率为$n_e=c/v_e$
- 正晶体：石英$v_o>v_e$，负晶体：冰洲石$v_o<v_e$
  #figure(
    image("image-11.png",width:90%), 
  )
== 惠更斯作图法
#image("image-12.png")
#image("image-13.png")
#image("image-14.png")
#image("image-15.png")
#image("image-16.png")
#image("image-17.png")
== 晶体偏振器，四种棱镜
#figure(
  image("image.png",width:90%), 
)
#figure(
  image("image-1.png",width:90%), 
)
#figure(
  image("image-2.png",width:90%), 
)
#figure(
  image("image-3.png",width:90%), 
)
#figure(
  image("image-4.png",width:90%), 
)
== 区分正负晶体
#image("image-18.png")
== 波片相位延迟
#image("image-19.png")
== 相位补偿器
#image("image-20.png")
#image("image-21.png")
= 公式罗列
我们将按照《新概念光学》中的顺序罗列出基础知识点和公式，如果你不发现有不熟悉的地方，请去翻书

=== 反射定律
$  theta_i = theta_r $

=== 折射定律（Snell）
$  n_1*sin(theta_1) = n_2*sin(theta_2) $

=== 临界角（全反射）
$  sin(theta_c) = n_2/n_1  $

=== 光速与折射率
$  v = c/n $


== 光程与相位

=== 光程
$  L = n*s $

=== 光程差
$  Delta = n_2*s_2 - n_1*s_1 $

=== 相位差
$  delta = 2*pi*Delta/lambda $


== 光在非均匀介质中的传播

=== 费马原理
$  delta  integral(n*d s) = 0 $

=== eikonal 方程
$  |grad(S)| = n $
== 第二章 几何光学成像

== 单球面与透镜

=== 单球面折射
$  n_1/u + n_2/v = (n_2 - n_1)/R $

=== 薄透镜焦距
$  1/f = (n - 1)(1/R_1 - 1/R_2) $

=== 厚透镜焦距
$  1/f = (n - 1)*(1/R_1 - 1/R_2 + (n - 1)*d/(n*R_1*R_2)) $

=== 成像公式
$  1/u + 1/v = 1/f $

=== 放大率
$  m = -v/u $


== 透镜组合

=== 两透镜间距 d
$  1/F = 1/f_1 + 1/f_2 - d/(f_1*f_2) $


== 物像对称（Newton 形式）
$  x*x' = f^(2) $



== 第三章 干涉

== 两光束干涉

=== 强度分布
$  I = I_1 + I_2 + 2*sqrt(I_1*I_2)*cos(delta) $

=== 对比度
$  V = (I_max - I_min)/(I_max + I_min) $


== 杨氏双缝

=== 条纹间距
$  Delta X = lambda*L/d $


== 多光束干涉

=== 薄膜等厚条纹
$  2*n*d*cos(theta) = m*lambda $

=== 等倾干涉
$  2*n*d*cos(theta) = (m + 1/2) lambda $


== 光源相干性质

=== 时间相干长度
$  L_c = c*tau_c $

=== 频谱宽度与相干时间
$  Delta Nu*tau_c = 1 $



== 第四章 衍射

== Fraunhofer 单缝

=== 强度
$  I(theta) = I_0*(sin(beta)/beta)^(2) $  
其中 $beta = pi*a*sin(theta)/lambda$

=== 最小值
$  sin(theta_m) = m*lambda/a $


== 圆孔 Airy

=== 第一暗环角
$  theta_1 = 1.22*lambda/D $


== 衍射光栅

=== 方向角
$  d*sin(theta_m) = k*lambda $

=== 光栅分辨力
$  R = k*N $  




== 第六章 偏振
== 马吕斯定律
$  I = I_0*cos(theta)^(2) $


== 双折射相移
$  delta = 2*pi*Delta N*d/lambda $



= 第七章 光与物质的相互作用

== 吸收

=== Beer-Lambert
$  I = I_0*e^(-alpha*l) $

=== 透射率
$  T = I/I_0 = exp(-alpha*l) $


== 散射

=== 瑞利散射
$  I_s ∝ 1/(lambda)^(4) $


== 折射率色散

=== Sellmeier
$  n^(2) = 1 + B_1*lambda^(2)/(lambda^(2) - C_1) + B_2*lambda^(2)/(lambda^(2) - C_2) + B_3*lambda^(2)/(lambda^(2) - C_3) $





= 作业题及参考答案汇总

下面将列出所有布置过的作业，并附上答案（以作业布置的时间为序）

== 第四章
=== 原书4.5
#figure(image("../figures/4.5.png"))
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
#figure(image("../figures/4.6.png"))
#blockquote[
  由 @eq:l-n-r 可知， $ (n_0-1)l=r_2-r_1=98.5lambda \ n_0=1+(98.5lambda)/l = 1.000290 $
]

=== 原书4.7
#figure(image("../figures/4.7.png"))
#blockquote[
  + $ d_0 = (lambda R )/b_0 approx 0.74 #text[nm] $
  + $ gamma= |(sin u)/u| \ u= pi b/ b_0= pi/2 \ gamma= 2/pi approx 0.64 $
]

=== 原书4.9
#figure(image("../figures/4.9.png"))
#blockquote[
  $ b d lt.eq.slant lambda R\ d lt.eq (lambda R)/b =6.5 times 10^(-5) #text[m] $
]

=== 原书4.18
#figure(image("../figures/4.18.png"))
#blockquote[
  我们设纳光的波长为 $ lambda approx = 589.3 $ 中心的级数为 $k_0$ $quad i_b$ 的定义如图
  #figure(image("../figures/4.9-sol.svg", width: 40%))
  在移动前有 $         2h & = 50 lambda      \
  2h cos i_b & = (k_0-12)lambda $
  在移动后有 $                                  2(h-Delta h) & = (k_0-10)lambda \
  2(h- Delta h)cos i_b^prime = (k_0-10-5)lambda $
  我们假设 $ i_b approx i_b^prime $
  可以解出 $ Delta h =5lambda approx 2.95 mu m \ k_0 approx 17.1 \ h_0 approx 5 mu m $
]

=== 原书4.19
#figure(image("../figures/4.19.png"))
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
#figure(image("../figures/4.20.png"))
#blockquote[
  $ 2 h= N lambda $
  $ Delta h= (Delta lambda)/2=lambda /16 approx 39.55 mu m $
  $ L_M approx lambda^(2)/(2 lambda) approx 2 m $

]

=== 原书4.22
#figure(image("../figures/4.22.png"))
#blockquote[
  1.
  $ L_0 approx lambda^(2)/(Delta lambda) approx 0.413 m \ tau_0 = L_0/c approx 1.38 n s $
  2. $ Delta nu tau_0=1 \ Delta nu=1/tau_0 approx 726 #text[MHz] $
  3. $ gamma=|(sin u)/u| $
  其中 $u=1/2 Delta k Delta L = pi (Delta L)/(L_0)$
  当 $Delta L$ 从 $-L_0$ 变化到 $2L_0$ 时，刚好经过主波包和次波包，即要通过三倍的 $L_0$
  $ 3L_0=2h | t = h/v=1200s =20 #text[min] $

]

=== 原书4.24
#figure(image("../figures/4.24.png"))
#blockquote[
  设中心处的级数为 $k_0$
  在中心处有 $ 2 h_0=k_0 lambda $
  在边缘处有 $ 2 h_0 cos theta= (k_0-10)lambda $
  由于 $theta$ 很小，可作近似 $cos theta approx 1- theta^(2)/2$
  $ theta approx sqrt((10 lambda)/h_0)approx 0.022 #text[rad] $
  $ d approx 2 f theta approx 13.5 #text[ mm] $
]


== 第二章

=== 原书2.17
#figure(image("../figures/2.17.png", width: 100%))
#blockquote[
  $ A approx S \ A(P) = 1/2 A_0 \ I(P) = 1/4 I_0 $
]

=== 原书2.18

#figure(image("../figures/2.18.png", width: 100%))
+ (a)
#blockquote[
  #figure(image("../figures/sol2.18.svg", width: 40%))
  第一个半波带未被遮挡，第二个半波带前半遮挡，后半通过，以后的所有半波带都被遮挡，如图
  $ A_p = sqrt(2) A_0 \ I(P) = 2 I_0 $
]

+ (b)
#blockquote[
  #figure(image("../figures/sol2.18b.svg", width: 40%))
  只有第三个半波带前半通过，后半遮挡
  $ A_p = sqrt(2) A_0 \ I(P) = 2 I_0 $
]

+ (c)
#blockquote[
  #figure(image("../figures/sol2.18c.svg", width: 40%))
  所有半波带的振幅都减半
  $ A_p = 1/2 A_0 \ I(P) = 1/4 I_0 $
]

+ (d)
#blockquote[
  #figure(image("../figures/sol2.18d.svg", width: 40%))
  第一个半波带全通过，第二个半波带振幅减半，其余全被遮挡
  $ A_p = A_0 \ I(P) = I_0 $
]

+ (e)
#blockquote[
  #figure(image("../figures/sol2.18e.svg", width: 90%))
  第一个半波带全通过，第二个半波带前半遮挡，后半通过，第三半波带至无穷半波带全通过，相当于第一个半波带的一半振幅(记为 $A_3$)，
  只有第三个半波带前半通过，后半遮挡
  $ A_p^(2) = A_0^(2) + (sqrt(2) A_0)^(2) - 2 A_0 sqrt(2) A_0 cos(135 degree)= 5 A_0^(2) \ I(P) = 5 I_0 $
]

+ (f)
#blockquote[
  #figure(image("../figures/sol2.18f.svg", width: 40%))
  只有第三个半波带前半通过，后半遮挡
  $ A_p = + 2 A_0 dot 3/4 + (-2A_0) + A_0 dot 3/4 =1/4 A_0 \ I(P) = 1/16 I_0 $
]

=== 原书2.20
#figure(image("../figures/2.20.png", width: 100%))
#blockquote[
  半波带的公式有 $ 1/R + 1/b =(k lambda)/rho_k^(2) \ k=1 quad R arrow oo \ f=b= rho^(2)/lambda prop 1/lambda $
  $ f^prime = (lambda)/(lambda^prime) f= (900 #text[nm])/(633 #text[nm]) times 30 #text[cm] approx 43 #text[cm] $
]

=== 原书2.22
#figure(image("../figures/2.22.png", width: 100%))
#blockquote[
  #figure(image("../figures/sol2.22.svg", width: 100%))
  $ U(p)= 1/(i lambda) integral.double_Sigma (cos theta_0+ cos theta)/2 dot U(Q) dot 1/r e^(i k r) d Sigma $
  入射光是平行光， $U(Q)=A$ ，由傍轴条件可得 $cos theta approx 1 , cos theta_0 approx 1 , 1/r approx 1/r_0 = #text[Const]$ \
  综上，有 $ U(p)=A/(i lambda r_0)integral.double_Sigma e^(i k r) d Sigma $
  关于 $1/r_0$ 下面给出详细计算（实际上我们已经由经验知道在接收屏刚好在透镜的焦平面上时有 $1/r_0 approx 1/f$）
  在 $A$ 点，振幅为 $A(A)=A$ \ 在 $B$ 点，振幅为 $A(B)=alpha/r$ \ 在 $C$ 点，振幅为 $A(C)=alpha^prime/r^prime$ \ 我们要计算就是 $P$ 点的振幅 $A(P)=?$
  假设透镜不影响振幅，则有 $alpha = alpha^prime$ \
  傍轴条件可得 $r approx s,r^prime approx s^prime$
  由透镜的成像公式 $ f/s + f/s^prime =1 \ f/s = 1- f/s^prime $
  $
    A(P)= alpha^prime / (A^prime P)= r^prime/ (A^prime P) A(C) approx s^prime/(s^prime - f) A(C) \ A(C) approx A(B) = alpha /r approx alpha /s\ A(P) approx (s^prime)/(s^prime - f) alpha/s = 1/(1- f/s^prime) alpha /s
  $
  由于 $f/s=1- f/s^prime$
  可得 $ A(P) approx alpha/(f/s dot s)= alpha /f $
  故 $ 1/r_0 approx 1/f $ 当接收屏刚好在透镜的焦平面上\

  下面计算斜入射时接收屏上的光强分布：
  光线1相对于光线2的光程差为 $ Delta L = x sin theta_0- x sin theta = -x(sin theta- sin theta_0) $
  $
    U(P) & = A/(i lambda f) integral.double_Sigma e^(i k Delta L) d Sigma                        \
         & = A/(i lambda f) integral_(-a/2)^(a/2) e^(- i k x (sin theta- sin theta_0)) b dot d x
  $
  为方便计算，我们设常数： $ alpha = k a/2 (sin theta- sin theta_0)= (pi a)/lambda (sin theta- sin theta_0) $
  $
    U(P) & = (A b)/(i lambda f) integral_(-a/2)^(a/2) e^(- i (2alpha)/a x) d x  \
         & = (A b)/ (i lambda f) 1/(- i (2alpha)/a) (e^(-i alpha)- e^(i alpha)) \
         & = -(A a b)/(lambda f) (sin alpha)/alpha
  $
  光强则为
  $
    I(theta,theta_0) & =((a b)/(lambda f))^(2) A^(2) ((sin alpha)/alpha)^(2) \
                     & = I_0 ((sin alpha)/alpha)^(2)
  $
  其中 $ alpha & = k a/2 (sin theta-sin theta_0)          \
        & =(pi a)/ lambda (sin theta-sin theta_0 ) $
  下面计算零级条纹的半角宽 $Delta theta$ \
  $I/I_0=0$ 时， $alpha = k pi quad a(sin theta- sin theta_0)= k lambda$
  $
                                k & =0 quad theta = theta_0                                      \
                                k & =1 quad a (sin(theta_0+Delta theta)- sin theta_0) & = lambda \
    a cos theta_0 dot Delta theta & =lambda                                                      \
                      Delta theta & = lambda/(a cos theta_0)
  $
  证毕

]

=== 原书2.24
#figure(image("../figures/2.24.png", width: 100%))
#blockquote[
  + $ Delta theta = 1.22 lambda / D approx 4 times 10^(-4) #text[rad] $
  + $ rho = z dot Delta theta approx 4 #text[mm] $
  + $ rho = z dot Delta theta approx 1.5 times 10^(3) #text[m] $
]

=== 原书2.30
#figure(image("../figures/2.30.png", width: 100%))
#blockquote[
  + $
      (1 #text[m])/(200 #text[km]) & = 1.22 lambda/D                                               \
                                 D & = 1.22 lambda (200#text[km])/(1 #text[m]) approx 98 #text[mm]
    $
  + $ Delta theta = 1.2 lambda / D approx 5 times 10^(-6) #text[rad] $
  $ N gt.eq 1/(f dot Delta theta ) approx 2500 #text[/mm] $
]

=== 原书2.32
#figure(image("../figures/2.32.png", width: 100%))
#blockquote[
  + $
      lambda = v/f = (1.5 #text[km/s])/(40#text[kHz]) approx 3.8 #text[cm] \ Delta theta = 1.22 lambda/D approx 7.7 times 10^(-2) #text[rad]
    $
  + $ rho = z dot Delta theta approx 77 #text[m] $
]

== 第八章

=== 原书8.1
#figure(image("../figures/8.1.png", width: 100%))
#blockquote[
  #figure(image("../figures/8.1solve.svg", width: 70%))
  $
    A_o=A sin alpha,A_e= A cos alpha \ A_o / A_e = tan alpha = tan 20 degree approx 0.36 \ I prop n A^(2) \ I_o / I_e = n_o/n_e tan^(2) alpha approx 0.15
  $
]

=== 原书8.3
#figure(image("../figures/8.3.png", width: 100%))
#blockquote[
  光轴平行于表面，且入射光为正入射，此时oe光方向相同，但是传播速度不同，两者光程分别为
  $ L_o= n_o d approx 1.314 #text[mm] \ L_e = n_e d approx 1.322 #text[mm] $
]

=== 原书8.4
#figure(image("../figures/8.4.png", width: 100%))
#blockquote[
  在光轴垂直于入射面时，oe光分别符合折射定律，有
  $
    n_e sin i_e =sin i , n_o sin i_o = sin i \ i_e = arcsin((sin i)/n_e) approx 31.03 degree\ i_o = arcsin((sin i)/n_o)approx 27.52 degree
  $
]

=== 原书8.5
#figure(image("../figures/8.5.png", width: 100%))
#blockquote[
  #figure(image("../figures/8.5solve.svg", width: 60%))
  在光轴垂直于入射面时，oe光分别符合折射定律，有
  $
    n_e sin i_e =sin i approx 1 \ n_o sin i_o = sin i approx 1 \ i_e = arcsin((sin i)/n_e) approx 49.74 degree\ i_o = arcsin((sin i)/n_o)approx 49.81 degree \ x_e = d tan i_e approx 4.9595 #text[mm] \ x_o = d tan i_o approx 4.9718 #text[mm] \ Delta x = x_o - x_e approx 12.13 mu#text[m]
  $

]
=== 原书8.8
#figure(image("../figures/8.8.png", width: 100%))
#blockquote[
  #figure(image("../figures/8.8solve.svg", width: 70%))
]

=== 原书8.10
#figure(image("../figures/8.10.png", width: 100%))
#blockquote[
  #figure(image("../figures/8.10solve.svg", width: 60%))
  光束正入射，厚度均匀，e光法线就与晶片表面法线一致
  $ theta = 90 degree - 40 degree = 50 degree $
  法向角 $theta$ 和射线角 $xi$ 的关系为
  $
    tan xi = n_o^(2)/n_e^(2) tan theta approx 1.4836 \ xi approx 56 degree\ alpha = xi - theta approx 6 degree \ Delta = d tan alpha approx 2.1 #text[mm]
  $
]
=== 原书8.22
#figure(image("../figures/8.22.png", width: 100%))
#blockquote[
  #figure(image("../figures/8.22solve.svg", width: 100%))
  + $
      A_e = A_1 cos alpha approx 0.68 A \ I_e = A_e^(2) approx 0.46 I_0 \ A_o = A sin alpha approx 0.18 A \ I_o = A_o^(2) approx 0.033 I_0
    $
  + 投影到 $P_2$ 方向的两个振幅和光强为 $ A_(2e) = A_e cos alpha approx 0.66 A \ I_(2e) = A_(2e)^(2) approx 0.44I_0 \ A_(2o) = A_o cos alpha approx 0.047 A \ I_(2o) = A_(2o)^(2) approx 0.0022I_0 $
  + $ I_2 = A_(2e)^(2) +A_(2o)^(2) + 2 A_(2e) A_(2o) cos delta\ delta = delta_(o e)+pi = 3/2 pi \ I_2 approx 0.44 I_0 $
]

=== 原书8.25
#figure(image("../figures/8.25.png", width: 100%))
#blockquote[
  #figure(image("../figures/8.25solve.svg", width: 60%))

  + 因为是右旋偏振光，已有相位差 $delta_(#text[入])=pi/2$
    $ A_(2e ) = A_e cos 30 degree = sqrt(3)/2 A_e \ A_(2o) = A_o sin 30 degree = 1/2 A_o $
    $ I_o = 4 I_e , A_o = 2 A_e $
    $ delta_(o e)= 2pi/lambda (n_e-n_e)d=- pi/3 $
    在P处振动的两相位差为 $ delta = delta_(#text[入] + delta_(o e)=pi/6 $
    $ I_2 = A_(2e)^(2)+A_(2o)^(2) + 2A_(2e)^(2) A_(2o)^(2) cos delta = 13/4 I_e = 13/20 I_o $
  + 若改为左旋，则 $delta_(#text[入]= - pi/2$
    $ delta = delta_(#text[入] + delta_(o e)=- 5/6 pi $
    $ I_2^prime = A_(2e)^(2)+A_(2o)^(2) + 2A_(2e)^(2) A_(2o)^(2) cos delta = 1/4 I_e = 1/20 I_o $
  + 套用公式 $ I_M = 1/2 I_0 + 1/2 sqrt(I_x^(2)+I_y^(2)+2I_x I_y cos 2delta) = (5+ sqrt(13))/10 I_0 approx 0.86 I_0 \ I_m = I_0-I_M approx 0.14 I_0 $
]
== 第五章
=== 原书5.3
#figure(image("../figures/5.3.png", width: 100%))
#blockquote[
  选择最左侧的单缝为原点处，则第二个缝的位移为 $d$ ，相移 $e^(-k d sin theta)=e^(i delta)$ ，第二个缝的位移为 $3d$ ，相移 $e^(-k 3d sin theta)=e^(i 3delta)$
  $
    delta = - k d sin theta , alpha =(pi a sin theta)/lambda \ U(theta)=(1+e^(i delta)+e^(i 3delta)) dot U_1(theta) \ U_1(theta)= c_1 (sin alpha)/alpha \ I(theta)= U dot U^(star) = (1+e^(i delta)+e^(i 3delta)) dot (1+e^(-i delta)+e^(-i 3delta)) I_1(theta) = (3+2 cos delta + 2 cos(2delta)+2 cos(3delta)) I_1
  $
]

=== 原书5.4
#figure(image("../figures/5.4.png", width: 100%))
#blockquote[
  $
    U_1= c_1 (sin alpha_1)/alpha_1 ,alpha_1 = (pi a sin theta)/lambda \
    U_2= c_2 (sin alpha_2)/alpha_2 dot e^(i delta) ,alpha_2 = (pi 2 a sin theta)/lambda = 2 alpha_1 \
  $
  $
    delta = k d sin theta = k 3 a sin theta = 6 alpha_1, quad c_2/c_1= 2a/a = 2 \ U(theta)= U_1+U_2 = c_1 (sin alpha_1)/alpha_1+ c_2 (sin alpha_2)/alpha_2 dot e^(i delta) = c_1 ((sin alpha)/alpha ) (1+ 2 e^(i delta) cos alpha) \ I=U dot U^(star) = I_0 ((sin alpha)/alpha)^(2 ) (3+2(cos 2alpha + cos 5alpha + cos 7alpha))
  $
]

=== 原书5.6
#figure(image("../figures/5.6.png", width: 100%))
#blockquote[
  正入射时多缝的衍射公式为
  $
    I(theta)= I_0 ((sin alpha)/alpha)^(2 ) ((sin N beta)/beta)^(2) \ alpha= (pi a sin theta)/lambda , beta= (pi d sin theta)/lambda
  $
  当由正入射变成斜入射时，相距x的两束光的光程差由 $x sin theta$  变为 $x (sin theta- sin theta_0)$ 所以斜入射的公式只需要替换掉 $sin theta$ 即可，即\
  斜入射时多缝的衍射公式为
  $
    I(theta)= I_0 ((sin alpha)/alpha)^(2 ) ((sin N beta)/beta)^(2) \ alpha= (pi a )/lambda (sin theta- sin theta_0) , beta= (pi d )/lambda (sin theta- sin theta_0)
  $
  + 主极强衍射角应满足公式 $ beta= k pi quad d(sin theta_k - sin theta_0)=k lambda,k in ZZ $
  + 设 $theta_k$ 附近的第一个暗点衍射角为 $(theta_k + Delta theta_k)$
  $
    d( sin (theta_k+Delta theta_k)-sin theta_0)= (k+1/N) lambda\ sin (theta_k+Delta theta_k)- sin theta_k = lambda/(N d)\ cos theta_k Delta theta_k = lambda/(N d) \ Delta theta_k = lambda / (N d cos theta_k )
  $
]
=== 原书5.15
#figure(image("../figures/5.15.png", width: 100%))
#blockquote[
  + $ delta_0 = 2pi/lambda Delta L_0 = 2pi/lambda (1-n)h=-2.5pi $
  + 上缝的相位差 $ delta_1= - 2pi/lambda sin theta dot(3/2 a + a/2) = - 4pi/lambda a sin theta $
    下缝的相位差 $ delta_2 = - delta_1 $
  + $
      U=U_1+U_2+U_3= c_0 ((sin alpha_0)/alpha_0) e^(i delta_0) + c_1 ((sin alpha)/alpha) e^(i delta_1)+ c_2 ((sin alpha)/alpha) e^(i delta_2) \ alpha_0=(pi 3 a sin theta)/lambda quad alpha = (pi a sin theta)/lambda quad c_1=c_2=1/3c_0\ U= c_1(2((sin alpha)/alpha) dot cos(k 2 a sin theta)- 3 i ((sin alpha_0)/alpha_0)) \ I(theta)= U dot U^(star) = I_0(4((sin alpha)/alpha)^(2)cos^(2)(k 2 a sin theta)+ 9 ((sin alpha_0)/alpha_0)^(2))
    $
]

== 第九章
=== 原书9.1
#figure(image("../figures/9.1.png", width: 100%))
#blockquote[
  $
    I=I_0 e^(- alpha l) \ I/I_0=10% quad l=7.2#text[cm] \ I/I_0=20% quad l=5.0#text[cm] \ I/I_0=30% quad l=2.2#text[cm] \ I/I_0=80% quad l=0.70#text[cm] \
  $
]

=== 原书9.4
#figure(image("../figures/9.4.png", width: 100%))
#blockquote[
  $ L= - 1/alpha ln(I/I_0) approx 41 #text[m] $
]

=== 原书9.5
#figure(image("../figures/9.5.png", width: 100%))
#blockquote[
  $
    overline(n)= n i + (c alpha)/(2w)\ arrow.double (c alpha)/(2w) = 5 times 10^(-8) quad alpha approx 1.0 #text[m]^(-1)\ v= c/n approx 2times 10^(8) #text[m/s]
  $
]
