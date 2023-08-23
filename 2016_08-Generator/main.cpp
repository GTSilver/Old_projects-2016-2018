#include <iostream>
#include <math.h>
#include <cmath>

using namespace std;

int main()
{
	setlocale(LC_ALL, "rus");
	int i = 0;
	double
	Pi = M_PI,
	dI,R1,Ei,V,l1,S,h,c,r4,l2,I,dE,n,L,Esi,
	R2,B,r1,r2,r3,T,N,a,b,p;

	cout<<"Сопротивление нагрузки(Ом) = ";
	cin>>R2;
	cout<<"Магнитное поле(Тл) = ";
	cin>>B;
	cout<<"Внутренний радиус катушки(м) = ";
	cin>>r1;
	cout<<"Внешний радиус катушки(м) = ";
	cin>>r2;
	cout<<"Радиус до магнита(м) = ";
	cin>>r3;
	cout<<"Ширина катушки(м) = ";
	cin>>a;
	cout<<"Число магнитов(ед) = ";
	cin>>N;
	cout<<"Диаметр провода(м) = ";
	cin>>b;
	cout<<"Частота(Гц) = ";
	cin>>T;
	cout<<"Удельное сопротивление провода(Ом * м) = ";
	cin>>p;

	V = (2 * Pi * r3) / T;
	cout<<"Скорость(м/с) = "<<V<<endl;
	l1 = ((2 * Pi * r3) / N) / 2;
	cout<<"Расстояние между магнитами(м) = "<<l1<<endl;
	h = r2 - r1;
	c = ceil(h / b);
	r4 = r1 + (b / 2);
	S = 0;
	for(i = 0; i < c; i++)
	{
		S += Pi * (r4 + b * i);
	}
	S = S * ceil(a / b);
	cout<<"Площадь обмотки(м^2) = "<<S<<endl;
	Ei = (B * S * V) / l1;
	cout<<"ЭДС индукции(В) = "<<Ei<<endl;
	l2 = ceil((Pi * (r2 * r2 - r1 * r1)) / b) * ceil(a / b);
	cout<<"Длинна провода(м) = "<<l2<<endl;
	R1 = (p * l2) / (Pi * (b/2) * (b/2));
	cout<<"Сопротивление катушки(Ом) = "<<R1<<endl;
	dI = Ei / (R1 + R2);
	cout<<"Целевая сила тока(А) = "<<dI<<endl;
	n = ceil((r2 - r1) / b) * ceil(a / b);
	cout<<"Количество витков(ед) = "<<n<<endl;
	L = (1.25663706 / 1000000) * n * n * (Pi * r2 * r2) * a;
	cout<<"Индуктивность катушки(Гн) = "<<L<<endl;
	Esi = L * (dI / (l1 / V));
	cout<<"ЭДС самоиндукции(В) = "<<Esi<<endl;
	I = (Ei - Esi) / (R1 + R2);
	cout<<"Сила тока(А) = "<<I<<endl;
}
