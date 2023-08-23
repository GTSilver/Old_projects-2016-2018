unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OpenGL, DGLUT;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  HRC : HGLRC ;
  DC: HDC;
  angle: single;
implementation

{$R *.dfm}

procedure SetDCPixelFormat ( hdc : HDC );
 var
  pfd : TPixelFormatDescriptor;
  nPixelFormat : Integer;
 begin
  FillChar (pfd, SizeOf (pfd), 0);
  pfd.dwFlags  := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
   nPixelFormat := ChoosePixelFormat (hdc, @pfd);
  SetPixelFormat (hdc, nPixelFormat, @pfd);
 end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DC:= GetDC(Form1.Handle);
  SetDCPixelFormat(DC);
  hrc := wglCreateContext(DC);
  wglMakeCurrent(DC, hrc);

  glEnable(GL_DEPTH_TEST); // включаем проверку разрешения фигур (впереди стоящая закрывает фигуру за ней)
  glDepthFunc(GL_LEQUAL); //тип проверки
  glEnable(GL_LIGHTING);  //включаем освещение
  glEnable(GL_LIGHT0);    //включаем источник света №0
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
 FormResize(Sender);//процедура обновления

  if GetAsyncKeyState(VK_LEFT)<>0 then angle:=angle+0.5;
  if GetAsyncKeyState(VK_RIGHT)<>0 then angle:=angle-0.5;

 glClearColor (0.5, 0.5, 0.75, 1.0); // цвет фона
 glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );


 glRotatef(angle,0,0,1);

 glpushMatrix;
 glTranslatef(-5,0,0);
 glutSolidCube(1);      //Куб
 glPopmatrix;

 glpushMatrix;
 glTranslatef(5,0,0);
 glutSolidSphere(2,20,20);  //Сфера
 glPopmatrix;

 glpushMatrix;
 glTranslatef(0,5,0);
 glutSolidTorus(1,2,20,20);  //Тор
 glPopmatrix;

 glpushMatrix;
 glTranslatef(0,-5,0);
 glutSolidDodecahedron();   //Додекаэдр
 glPopmatrix;

 glpushMatrix;
 glTranslatef(0,0,2);
 glutSolidCone(2,3,10,10);   //Конус
 glPopmatrix;

SwapBuffers(Canvas.Handle);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  glViewport(0, 0, ClientWidth, ClientHeight); //выделяем область куда будет выводиться наш буфер
  glMatrixMode ( GL_PROJECTION ); //переходим в матрицу проекции
  glLoadIdentity;  //Сбрасываем текущую матрицу
  glFrustum ( -1 , 1 , -1 , 1 , 1.25 , 100.0 ); //Область видимости
  glMatrixMode ( GL_MODELVIEW ); //переходим в модельную матрицу
  glLoadIdentity;//Сбрасываем текущую матрицу
  gluLookAt(5,5,5,0,0,0,0,0,1);  //позиция наблюдателя
  InvalidateRect ( Handle,nil,False );  //перерисовка формы
end;

end.
