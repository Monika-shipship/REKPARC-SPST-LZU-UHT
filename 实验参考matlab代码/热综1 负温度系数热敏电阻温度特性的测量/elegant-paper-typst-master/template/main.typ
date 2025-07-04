// main.typ
#import "@preview/elegant-paper:0.1.0": *
#set math.equation(numbering: "(1)", )
#show: elegant-paper.with(
  paper: "a4",
  enable-outline: true,

  font: (
    font-size: 10pt
  ),

  title: (
    title: "热综1 负温度系数热敏电阻温度特性的测量",
    authors: (
      (
        name: "none",
        institution: "某某大学物理系",
        email: "researcher1@example.com"
      ),
    
    ),
    date: "2025年6月20日",
    abstract: "
      ",
    keywords: none
  ),
)
= 实验目的
测量负温度系数（NTC）热敏电阻的阻值与温度的关系。
= 实验仪器
DH4608T热学综合实验仪                              1台
DH4608T热学综合实验仪-温度控制器                   1台
透光真空管式炉                                      1台
NTC /AD590测试板                            1块 
= 实验原理
== 恒压源法测量热电阻特性
恒电压源法测量热电阻，电路如 @fig:电路图，
#figure(
  image("e57c2bcc667690d984df93f1ad2730cc.png",width:30%),
  caption: [电路图]
)<fig:电路图>
@fig:电路图 中，R为已知数值的固定电阻，RT为热电阻。Ur为R上的电压，Urt为RT上的电压。假设回路电流为I0，根据欧姆定律，I0=Ur/R,所以热电阻RT为：
$ R_T=U_(#text[rl])/I_O=(R U_(#text[rl]) )/ U_r $


== 负温度系数热敏电阻(NTC 1K)温度传感器
热敏电阻是利用半导体电阻阻值随温度变化的特性来测量温度的，按电阻阻值随温度升高而减小或增大，分为NTC型(负温度系数热敏电阻)、PTC型(正温度系数热敏电阻)和CTC（临界温度热敏电阻）。NTC型热敏电阻阻值与温度的关系呈指数下降关系，但也可以找出热敏电阻某一较小的、线性较好范围加以应用（如35-42℃）。如需对温度进行较准确的测量,则需配置线性化电路进行校正（本实验没进行全范围线性化校正，仅选取35-42℃温度范围内进行相对线性化处理）。以上三种热敏电阻特性曲线见@fig:热敏电阻特性曲线。
#figure(
  image("4443c88e9f5abd6ace3f6eac00c9f200.png",width:60%),
  caption: [热敏电阻特性曲线]
) <fig:热敏电阻特性曲线>

在一定的温度范围内（小于150℃）NTC热敏电阻的电阻RT与温度T之间有如下关系：
$ R_T=R_0 e^(B(1/T-1/T_0)) $<eq:RT-T>
@eq:RT-T 中RT、R0是温度为T,T0 时的电阻值( T为热力学温度,单位为K)；B是热敏电阻材料常数，一般情况下B为2000～6000K。对一定的热敏电阻而言，B为常数，
对@eq:RT-T 式两边取对数，则有：
$ ln R_T = B(1/T-1/T_0)+ ln R_0 $ <eq:lnrt>
由@eq:lnrt，$ln R_T$与$1/T$成线性关系，作$ln R_T -1/T$直线图，用直线拟合，由斜率即可求出常数$B$。 \
#figure(
  image("image.png",width:40%),
  caption: [NTC热敏电阻特性测量]
) <fig:NTC热敏电阻特性测量>
= 实验内容及步骤
+	将PT100测温板安置于管式炉一端，将其输出航空插座与温度控制器Pt100插座对应连接起来；将温度控制器加热电流输出插座与管式炉测试架加热电流输入插座对应相连；将NTC /AD590测试板安置于管式炉的另一端，并将NTC输出插孔与热学综合实验仪面板中对应的NTC插孔相连。
+	按@fig:NTC热敏电阻特性测量 ，电压表选择2V档；从32℃开始测量，然后每隔2.0℃设定一次温控器，待温度稳定后（2分钟内温度变化在±0.1℃以内），测量热敏电阻上对应电压URT（纽子开关打向Vo1）以及取样电阻R¬（1000Ω）上电压Ur（纽子开关打向Vo2），计入表1，根据 @eq:RT-T 求出RT与温度t的关系。（加热电流大小设置范围0.1-0.2A）
+	 作$ln R_T -1/T$直线图，用直线拟合，由斜率即可求出常数B。

= 数据处理
== 原始数据
#figure(
  table(
    columns: 7,
    stroke: (x: 0.5pt + black, y: 0.5pt + black),  // 所有单元格边框线
    inset: 5pt,                                      // 单元格内边距
    align: center, // 列对齐方式
    
    // 表头行
    [t（℃）], [URT（V）], [UR（V）], [$R_T = R * U_(R T) / U_R (Ω)$], [$ln(R_T)$], [T(K)], [$1/T (#text[K]^(-1))$],
    
    // 数据行
    [32], [2.148], [0.260], [8261.5], [9.019], [305.15], [0.00328],
    [34], [2.141], [0.260], [8234.6], [9.016], [307.15], [0.00326],
    [36], [2.132], [0.261], [8168.6], [9.008], [309.15], [0.00323],
    [38], [2.121], [0.262], [8095.4], [8.999], [311.15], [0.00321],
    [40], [2.121], [0.262], [8095.4], [8.999], [313.15], [0.00319],
    [42], [2.112], [0.263], [8030.4], [8.991], [315.15], [0.00317],
    [44], [2.109], [0.263], [8019.0], [8.990], [317.15], [0.00315],
    [46], [2.102], [0.264], [7962.1], [8.982], [319.15], [0.00313],
  ),
  caption: [表1 NTC热敏电阻与温度的关系 R=1000 Ω]
)

== 线性拟合
  $ln R_T-1/T $ 线性拟合可得 k1=0.0038, b1=-0.0310 (r=0.987)  \
  转换成对数式$R_T=A e^(B/T)$
  A=0.96948, B=0.0038
== 图像
#figure(
  image("images/lnRt-1t.svg",width:120%),
  caption: [$ln R_T-1/T $ 的线性拟合图像]
) <fig:P-C>

== 负温度系数热敏电阻(NTC)的物理机制
+ 半导体材料的载流子激发
  
  NTC由锰、钴、镍等过渡金属氧化物（半导体陶瓷）构成。在低温时，材料内自由电子或空穴（载流子）浓度较低，电阻较大。随温度升高，热振动能量增强，价带电子跃迁至导带（本征激发），同时杂质能级中的电子被激活（电离），导致载流子浓度指数级增长，电导率提升，电阻显著下降。


+ 电阻与温度的指数关系
  
  电阻值遵循经验公式：
  $
  R(T) = R_0 dot e^(B (1/T - 1/T_0))
  $
  其中$B$为材料特性常数，体现载流子激活所需能量。温度升高（$T$上升）时，指数项减小，电阻随温度升高而非线性降低，呈现负温度系数特征（典型值-2%~-6%/°C）。

+ 与金属导体的本质区别
  
  金属导体电阻随温度升高而上升（正温度系数），因其载流子（自由电子）浓度几乎恒定，但热振动加剧导致散射增强。而NTC的半导体特性使其载流子浓度主导电阻变化，实现灵敏的温度-电阻响应，广泛应用于温度传感、浪涌抑制等场景。


