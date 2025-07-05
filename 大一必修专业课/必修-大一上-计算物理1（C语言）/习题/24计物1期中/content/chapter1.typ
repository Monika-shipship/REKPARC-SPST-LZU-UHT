#import "../template.typ": *

= .
(编程, 100.0 分) 1. a) 某工厂一月份产值为 t 万元，以后的每一个月都比上一个月增产 x %，编写函数计算前 n 个月的总产值。b) 调用该函数计算当 t = 3, x = 10, n = 6 情况下的总产值。
如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double chanzhi(double t,int x,int n)
{
    double sum=0;
    double temp=t;
    for(int i=0;i<n-1;i++){
        sum+=temp;
        temp*=1+x/100.;
    }
    return sum;
}

int main()
{
    double t=3;
    int x=10,n=6;
    printf("t=%lf,x=%d,n=%d,chanzhi=%lf",t,x,n,chanzhi(t,x,n));
    return 0;
}
```
#image("image-32.png")
score:80（扣分原因未知）
= .
(编程, 100.0 分) 2. 已知面包价格 x 元/个，牛奶是 y 元/袋。小明的妈妈给了小明 m 元钱，编写函数计算并输出小明能买到的牛奶和面包的数量的所有可能的组合。这里假设x, y, m都是正整数。
如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double chanzhi(double t,int x,int n)
{
    double sum=0;
    double temp=t;
    for(int i=0;i<n-1;i++){
        sum+=temp;
        temp*=1+x/100.;
    }
    return sum;
}

int main()
{
    double t=3;
    int x=10,n=6;
    printf("t=%lf,x=%d,n=%d,chanzhi=%lf",t,x,n,chanzhi(t,x,n));
    return 0;
}
```
#image("image-33.png")
score:95.0
= .
编写函数计算两正整数的所有公因数的乘积并返回该值。

如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int min(int x,int y)
{
    return x<y?x:y;
}

int mutifactor(int x,int y){
    int muty=1;
    for(int i=1;i<=min(x,y);i++){
        if(x%i==0 && y%i==0){
            muty=muty*i;
        }

    }
    return muty;
}


int main()
{
    int x,y;
    scanf("%d%d",&x,&y);
    printf("%d",mutifactor(x,y));
    return 0;
}
```
score:100.0
= .
(编程, 100.0 分) 4. 已知  中两向量 u，v 和标量 x, y， 计算  W = xu + yv 并输出到屏幕，自行设定标量以及向量中元素的值。
如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{   int x,y;
    int n;
    printf("input x y n:");
    scanf("%d %d %d",&x,&y,&n);
    double u[10];
    double v[10];
    for(int i=0;i<n;i++){
        u[i]=0;
        v[i]=0;
    }
    printf("input u:");
    for(int i=0;i<n;i++){
        scanf("%lf",&u[i]);
    }
    printf("input v:");
    for(int i=0;i<n;i++){
        scanf("%lf",&v[i]);
    }
    double result[10];
    for(int i=0;i<n;i++){
        result[i]=x*u[i]+y*v[i];
    }
    printf("xu+yv=\n");

    for(int i=0;i<n;i++){
        printf("%lf ",result[i]);
    }
    return 0;
}
```
#image("image-34.png")
= .
编写函数返回组成某一正整数的所有数字之和，如：组成1056的数字和为12。
如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int sumeach(int x){
    int sum=0;
    int temp=x;
    for(int i=0;x>0;i++){
        temp=x%10;//当前个位数
        sum+=temp;
        x=x/10;
    }
    return sum;
}

int main()
{   
    printf("%d\n",sumeach(1056));
    return 0;
}
```
score:100.0

#image("image-35.png")

= .
(编程, 100.0 分) 6. 一口水井深 a 米，一只青蛙在井底，一次向上跳 b 米，编写函数计算青蛙至少需要跳多少次才能跳出水井。这里假设 a , b 都是正整数。
如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。
```c
#include <stdio.h>

#include <stdlib.h>

#include <math.h>



    int times(int a,int b){
    int sum=0;
    for(int i=0;i<a/b+2;i++){
        if(b*i<a){
            sum++;
        }
    }
    return sum;
    }
int main()
{
  int a,b;
  scanf("%d%d",&a,&b);
  printf("%d\n",times(a,b));
  return 0;

}
```
#image("image-36.png")
score:100.0
= .
从键盘读入四个0-9之间的数字，输出这四个数字能组成的最大十进制数，比如：读入0, 3, 1, 9， 输出9310。

如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。

#attention("注意")[
  请注意，此题中的输出必须是以整型的形式输出，你不能逐个输出字符串，虽然这很奇怪，但是zjz就是这样要求的
]
```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void sort(int a[],int n){
    for(int i=0;i<n;i++){
        for(int j=i;j<n;j++){
            if(a[j]>a[i]){
                int temp=a[j];
                a[j]=a[i];
                a[i]=temp;
            }
        }
    }
}
int main()
{   
    int a[4];
    for(int i=0;i<4;i++){
        scanf("%d",&a[i]);
    }
    sort(a,4);
    for(int i=0;i<4;i++){
        printf("%d",a[i]);
    }
    return 0;
}
```
#image("image-37.png")
score:70.0
= .
已知矩阵 B 是 4 X 4 的矩阵，写程序利用初等行变换将矩阵 B 化为阶梯型矩阵，矩阵 B 中元素的值用 rand()%4 产生，并检查你的计算结果是否正确。

如果没有特别说明，计算机语言为C语言，将程序源代码（注意源代码上传，不是截图上传）及运行结果截图请粘贴在答案区。

```c
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
int min(int a, int b) { return a < b ? a : b; }
//交换
void swap(double* a, double* b) {
    double temp = *a;
    *a = *b;
    *b = temp;
}
//给出第 i 列绝对值最大的位置
int placemax(double a[], int n) {
    double b = a[0];
    int q = 0;
    for (int i = 0; i < n; i++) {
        if (fabs(a[i]) > fabs(b)) {
            b = a[i];
            q = i;
        }
    }
    return q;
}

int main() {
    int m, n;
    scanf("%d%d", &m,&n);
    double del = pow(10, -6);
    double **matrix = malloc(m * sizeof(double*));
    for (int i = 0; i < m; i++) {
        matrix[i] = malloc(n * sizeof(double));
    }
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            matrix[i][j]=rand()%4;
        }
    }
    for(int i=0;i<m;i++,puts("")){
        for(int j=0;j<n;j++){
        printf("%lf ",matrix[i][j]);
        }
    }
    printf("\n");
    //将矩阵化为阶梯型矩阵
    for (int i = 0; i < min(m, n); i++) {
        int skip = 0;
        double* coltemp = malloc(m * sizeof(double));
        for (int j = 0; j < i; j++)
            coltemp[j] = 0;
        //第 i列的主元列以下
        for (int j = i; j < m; j++) {
            coltemp[j] = matrix[j][i];
        }
        skip=1;
        for (int j=i;j<m;j++) {
            if(fabs(coltemp[j])>del){
                skip=0;
                break;
            }
        }
        if(skip==1){
            break;
        }
        //将第 i 列中绝对值最大的行交换到 i,i 位置上
        int placetemp = placemax(coltemp, m);
            for (int j = 0; j < n; j++) {
            swap(&matrix[placetemp][j], &matrix[i][j]);
        }
        //第 i行全除以主元列
        for (int j = n - 1; j >= 0; j--) {
            if (fabs(matrix[i][i]) > del) {
                matrix[i][j] = matrix[i][j] / (matrix[i][i]);
            } 
            else {
                break;
            }
        }
        /*
        ai,i ..... ai,i+k   ...  ai,n
        ...
        ai+j,i ....ai+j,i+k ... ai+j,n
        ...
        am,i
        */
        if (skip == 0) {
            for (int j = m - i - 1; j >= 1; j--) {
                for (int k = n - i - 1; k >= 0; k--) {
                    matrix[i+j][i+k]-=matrix[i][i+k]*matrix[i+j][i];
                }
            }
        }
        free(coltemp);
    }
    for(int i=0;i<m;i++,puts("")){
        for(int j=0;j<n;j++){
            printf("%lf ",matrix[i][j]);
        }
    }
    for(int i=0;i<m;i++){
        free(matrix[i]);
    }
    free(matrix);
}
```
#image("image-38.png")
score:70.0 (rand的种子需要设置)
