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

	cout<<"������������� ��������(��) = ";
	cin>>R2;
	cout<<"��������� ����(��) = ";
	cin>>B;
	cout<<"���������� ������ �������(�) = ";
	cin>>r1;
	cout<<"������� ������ �������(�) = ";
	cin>>r2;
	cout<<"������ �� �������(�) = ";
	cin>>r3;
	cout<<"������ �������(�) = ";
	cin>>a;
	cout<<"����� ��������(��) = ";
	cin>>N;
	cout<<"������� �������(�) = ";
	cin>>b;
	cout<<"�������(��) = ";
	cin>>T;
	cout<<"�������� ������������� �������(�� * �) = ";
	cin>>p;

	V = (2 * Pi * r3) / T;
	cout<<"��������(�/�) = "<<V<<endl;
	l1 = ((2 * Pi * r3) / N) / 2;
	cout<<"���������� ����� ���������(�) = "<<l1<<endl;
	h = r2 - r1;
	c = ceil(h / b);
	r4 = r1 + (b / 2);
	S = 0;
	for(i = 0; i < c; i++)
	{
		S += Pi * (r4 + b * i);
	}
	S = S * ceil(a / b);
	cout<<"������� �������(�^2) = "<<S<<endl;
	Ei = (B * S * V) / l1;
	cout<<"��� ��������(�) = "<<Ei<<endl;
	l2 = ceil((Pi * (r2 * r2 - r1 * r1)) / b) * ceil(a / b);
	cout<<"������ �������(�) = "<<l2<<endl;
	R1 = (p * l2) / (Pi * (b/2) * (b/2));
	cout<<"������������� �������(��) = "<<R1<<endl;
	dI = Ei / (R1 + R2);
	cout<<"������� ���� ����(�) = "<<dI<<endl;
	n = ceil((r2 - r1) / b) * ceil(a / b);
	cout<<"���������� ������(��) = "<<n<<endl;
	L = (1.25663706 / 1000000) * n * n * (Pi * r2 * r2) * a;
	cout<<"������������� �������(��) = "<<L<<endl;
	Esi = L * (dI / (l1 / V));
	cout<<"��� ������������(�) = "<<Esi<<endl;
	I = (Ei - Esi) / (R1 + R2);
	cout<<"���� ����(�) = "<<I<<endl;
}
