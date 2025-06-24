import matplotlib.pyplot as plt
import schemdraw
from schemdraw import logic

# 绘制电路图
with schemdraw.Drawing() as d:
    d += (V := logic.Vdd().label('恒压源'))
    d += (R := logic.Resistor().right().label('R'))
    d += (RT := logic.Resistor().down().label('$R_T$', loc='bottom'))
    d += logic.Line().left()
    d += logic.Ground()
    d += logic.MeterV().at(R.end).label('$U_R$')
    d += logic.MeterV().at(RT.end).label('$U_{RT}$')
    d.savefig('circuit_fig1-1.svg', format='svg')  # 导出为SVG
