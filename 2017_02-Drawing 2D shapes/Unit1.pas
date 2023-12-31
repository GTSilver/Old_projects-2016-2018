unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OpenGL;

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
  SetDCPixelFormat(Canvas.Handle);
  hrc := wglCreateContext(Canvas.Handle);
  wglMakeCurrent(Canvas.Handle, hrc);
  glEnable(GL_DEPTH_TEST); // �������� �������� ���������� ����� (������� ������� ��������� ������ �� ���)
  glDepthFunc(GL_LEQUAL);  //��� ��������
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  FormResize(Sender); //��������� ����������
  
  if GetAsyncKeyState(VK_LEFT)<>0 then angle:=angle+0.5;
  if GetAsyncKeyState(VK_RIGHT)<>0 then angle:=angle-0.5;

  glRotatef(angle,0,0,1);

 glClearColor (0.5, 0.5, 0.75, 1.0); // ���� ����
 glClear (GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT); // ������� ������ �����

glPointSize(20);  //������ �����
glBegin(GL_POINTS);
glColor3f(1,0,0);  glVertex3f(-2,5,1);
glEnd;

glBegin(GL_LINES); //������ �����
glColor3f(1,0,0); {��������� ������ �������}    glVertex3f(-1,0,1); //������� ������ �������
glColor3f(0,1,0); {��������� ������ �������}    glVertex3f(-4,5,1); //������� ������ �������
glEnd;

glBegin(GL_TRIANGLES); //������ �����������
glColor3f(1,0,0);  glVertex3f(0,5,1); //������ �������
glColor3f(0,1,0);  glVertex3f(1,4,1); //������ �������
glColor3f(0,1,0);  glVertex3f(-1,4,1); //������ �������
glEnd;

glBegin(GL_QUADS); //������ �������
glColor3f(1,0,0);  glVertex3i(-1,1,0); //������ �������
glColor3f(0,1,0);  glVertex3f(1,1,-0); //������ �������
glColor3f(0,1,1);  glVertex3f(1,-1,-0); //������ �������
glColor3f(0,0,1);  glVertex3f(-1,-1,0); //�������� �������
glEnd;

SwapBuffers(Canvas.Handle);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  glViewport(0, 0, ClientWidth, ClientHeight); //�������� ������� ���� ����� ���������� ��� �����
  glMatrixMode ( GL_PROJECTION ); //��������� � ������� ��������
  glLoadIdentity;  //���������� ������� �������
  glFrustum ( -1 , 1 , -1 , 1 , 1.25 , 100.0 ); //������� ���������
  glMatrixMode ( GL_MODELVIEW ); //��������� � ��������� �������
  glLoadIdentity;//���������� ������� �������
  gluLookAt(5,5,5,0,0,0,0,0,1);  //������� �����������
  InvalidateRect ( Handle,nil,False );  //����������� �����
end;

end.
