unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, jpeg;

type
  TForm2 = class(TForm)
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Button2: TButton;
    Button3: TButton;
    Label11: TLabel;
    Label12: TLabel;
    Image1: TImage;
    Shape2: TShape;
    RadioButton1: TRadioButton;
    Label13: TLabel;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Label14: TLabel;
    Shape3: TShape;
    Label15: TLabel;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Button4: TButton;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Button5: TButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Label28: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure RadioButton6Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
Form2: TForm2;
F : Text;
A, C, Cube : array[1..8,1..4] of real;
T : array[1..4,1..4] of real;
M : array[1..8,1..3] of string[8];
Skip1 : String[1];
Skip5 : String[5];
i,j,k, Triger : integer;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
AssignFile(F,'Матрица фигуры.txt');
Reset(F);
Readln(F,Skip5);
  for i:=1 to 8 do
  begin
  Read(F,Skip5);
  Read(F,M[i,1]);
  Read(F,Skip1);
  Read(F,M[i,2]);
  Read(F,Skip1);
  Readln(F,M[i,3]);
  end;
CloseFile(F);
//-------------------------------------------------------------------------
  for i:=1 to 8 do
  begin
  A[i,1]:=strtofloat(M[i,1]);
  A[i,2]:=strtofloat(M[i,2]);
  A[i,3]:=strtofloat(M[i,3]);
  A[i,4]:=1;
  end;
//-------------------------------------------------------------------------
  Form2.Edit1.Text  := floattostr(A[1,1]);
  Form2.Edit2.Text  := floattostr(A[1,2]);
  Form2.Edit3.Text  := floattostr(A[1,3]);
  Form2.Edit4.Text  := floattostr(A[2,1]);
  Form2.Edit5.Text  := floattostr(A[2,2]);
  Form2.Edit6.Text  := floattostr(A[2,3]);
  Form2.Edit7.Text  := floattostr(A[3,1]);
  Form2.Edit8.Text  := floattostr(A[3,2]);
  Form2.Edit9.Text  := floattostr(A[3,3]);
  Form2.Edit10.Text := floattostr(A[4,1]);
  Form2.Edit11.Text := floattostr(A[4,2]);
  Form2.Edit12.Text := floattostr(A[4,3]);
  Form2.Edit13.Text := floattostr(A[5,1]);
  Form2.Edit14.Text := floattostr(A[5,2]);
  Form2.Edit15.Text := floattostr(A[5,3]);
  Form2.Edit16.Text := floattostr(A[6,1]);
  Form2.Edit17.Text := floattostr(A[6,2]);
  Form2.Edit18.Text := floattostr(A[6,3]);
  Form2.Edit19.Text := floattostr(A[7,1]);
  Form2.Edit20.Text := floattostr(A[7,2]);
  Form2.Edit21.Text := floattostr(A[7,3]);
  Form2.Edit22.Text := floattostr(A[8,1]);
  Form2.Edit23.Text := floattostr(A[8,2]);
  Form2.Edit24.Text := floattostr(A[8,3]);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  A[1,1]:= strtofloat(Form2.Edit1.Text);
  A[1,2]:= strtofloat(Form2.Edit2.Text);
  A[1,3]:= strtofloat(Form2.Edit3.Text);
  A[2,1]:= strtofloat(Form2.Edit4.Text);
  A[2,2]:= strtofloat(Form2.Edit5.Text);
  A[2,3]:= strtofloat(Form2.Edit6.Text);
  A[3,1]:= strtofloat(Form2.Edit7.Text);
  A[3,2]:= strtofloat(Form2.Edit8.Text);
  A[3,3]:= strtofloat(Form2.Edit9.Text);
  A[4,1]:= strtofloat(Form2.Edit10.Text);
  A[4,2]:= strtofloat(Form2.Edit11.Text);
  A[4,3]:= strtofloat(Form2.Edit12.Text);
  A[5,1]:= strtofloat(Form2.Edit13.Text);
  A[5,2]:= strtofloat(Form2.Edit14.Text);
  A[5,3]:= strtofloat(Form2.Edit15.Text);
  A[6,1]:= strtofloat(Form2.Edit16.Text);
  A[6,2]:= strtofloat(Form2.Edit17.Text);
  A[6,3]:= strtofloat(Form2.Edit18.Text);
  A[7,1]:= strtofloat(Form2.Edit19.Text);
  A[7,2]:= strtofloat(Form2.Edit20.Text);
  A[7,3]:= strtofloat(Form2.Edit21.Text);
  A[8,1]:= strtofloat(Form2.Edit22.Text);
  A[8,2]:= strtofloat(Form2.Edit23.Text);
  A[8,3]:= strtofloat(Form2.Edit24.Text);
//-------------------------------------------------------------------------
  for i:=1 to 8 do
  begin
  Cube[i,1]:=A[i,1];
  Cube[i,2]:=A[i,2];
  Cube[i,3]:=A[i,3];
  Cube[i,4]:=1;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
Form1.Repaint;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile('T(angle,x).jpg');
Label15.Show; Edit25.Show; Label15.Caption := 'Угол поворота';
Label16.Hide; Label17.Hide; Label18.Hide; Edit26.Hide; Edit27.Hide; Edit28.Hide;
Button4.Show;
Triger := 1;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile('T(angle,y).jpg'); 
Label15.Show; Edit25.Show; Label15.Caption := 'Угол поворота';
Label16.Hide; Label17.Hide; Label18.Hide; Edit26.Hide; Edit27.Hide; Edit28.Hide;
Button4.Show;
Triger := 2;
end;

procedure TForm2.RadioButton3Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile('T(angle,z).jpg');
Label15.Show; Edit25.Show; Label15.Caption := 'Угол поворота';
Label16.Hide; Label17.Hide; Label18.Hide; Edit26.Hide; Edit27.Hide; Edit28.Hide;
Button4.Show;
Triger := 3;
end;

procedure TForm2.RadioButton4Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile('T(Dx, Dy, Dz).jpg');
Edit25.Hide;
Label15.Show; Label15.Caption := 'Дистанция вдоль...';
Label16.Show; Label17.Show; Label18.Show; Edit26.Show; Edit27.Show; Edit28.Show;
Button4.Show;
Edit26.Text := '0'; Edit27.Text := '0'; Edit28.Text := '0';
Triger := 4;
end;

procedure TForm2.RadioButton5Click(Sender: TObject);
begin
Image1.Picture.LoadFromFile('T(Sx, Sy, Sz).jpg');
Edit25.Hide;
Label15.Show; Label15.Caption := 'Масштаб вдоль...';
Label16.Show; Label17.Show; Label18.Show; Edit26.Show; Edit27.Show; Edit28.Show;
Button4.Show;
Edit26.Text := '1'; Edit27.Text := '1'; Edit28.Text := '1';
Triger := 5;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
Label15.Hide; Edit25.Hide; Edit26.Hide; Edit27.Hide; Edit28.Hide;
Label16.Hide; Label17.Hide; Label18.Hide;
Button4.Hide;
Triger := 0;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
Case Triger of
1:
  begin
    Grad := strtofloat(Edit25.Text);
    Grad := Grad * pi / 180;

    T[1,1]:=1; T[1,2]:=0;          T[1,3]:=0;         T[1,4]:=0;
    T[2,1]:=0; T[2,2]:=cos(Grad);  T[2,3]:=sin(Grad); T[2,4]:=0;
    T[3,1]:=0; T[3,2]:=-sin(Grad); T[3,3]:=cos(Grad); T[3,4]:=0;
    T[4,1]:=0; T[4,2]:=0;          T[4,3]:=0;         T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
  end;
2:
  begin
    Grad := strtofloat(Edit25.Text);
    Grad := Grad * pi / 180;

    T[1,1]:=cos(Grad); T[1,2]:=0; T[1,3]:=-sin(Grad); T[1,4]:=0;
    T[2,1]:=0;         T[2,2]:=1; T[2,3]:=0;          T[2,4]:=0;
    T[3,1]:=sin(Grad); T[3,2]:=0; T[3,3]:=cos(Grad);  T[3,4]:=0;
    T[4,1]:=0;         T[4,2]:=0; T[4,3]:=0;          T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
  end;

3:
  begin
    Grad := strtofloat(Edit25.Text);
    Grad := Grad * pi / 180;

    T[1,1]:=cos(Grad);  T[1,2]:=sin(Grad); T[1,3]:=0; T[1,4]:=0;
    T[2,1]:=-sin(Grad); T[2,2]:=cos(Grad); T[2,3]:=0; T[2,4]:=0;
    T[3,1]:=0;          T[3,2]:=0;         T[3,3]:=1; T[3,4]:=0;
    T[4,1]:=0;          T[4,2]:=0;         T[4,3]:=0; T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
  end;

4:
  begin
    Dx := strtofloat(Edit26.Text);
    Dy := strtofloat(Edit27.Text);
    Dz := strtofloat(Edit28.Text);

    T[1,1]:=1;  T[1,2]:=0;  T[1,3]:=0;  T[1,4]:=0;
    T[2,1]:=0;  T[2,2]:=1;  T[2,3]:=0;  T[2,4]:=0;
    T[3,1]:=0;  T[3,2]:=0;  T[3,3]:=1;  T[3,4]:=0;
    T[4,1]:=Dx; T[4,2]:=Dy; T[4,3]:=Dz; T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
  end;

5:
  begin
    Dx := strtofloat(Edit26.Text);
    Dy := strtofloat(Edit27.Text);
    Dz := strtofloat(Edit28.Text);

    T[1,1]:=Dx; T[1,2]:=0;  T[1,3]:=0;  T[1,4]:=0;
    T[2,1]:=0;  T[2,2]:=Dy; T[2,3]:=0;  T[2,4]:=0;
    T[3,1]:=0;  T[3,2]:=0;  T[3,3]:=Dz; T[3,4]:=0;
    T[4,1]:=0;  T[4,2]:=0;  T[4,3]:=0;  T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
  end;
end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Form2.Edit1.Text  := Form2.Edit29.Text;
  Form2.Edit2.Text  := Form2.Edit30.Text;
  Form2.Edit3.Text  := Form2.Edit31.Text;
  Form2.Edit4.Text  := Form2.Edit32.Text;
  Form2.Edit5.Text  := Form2.Edit33.Text;
  Form2.Edit6.Text  := Form2.Edit34.Text;
  Form2.Edit7.Text  := Form2.Edit35.Text;
  Form2.Edit8.Text  := Form2.Edit36.Text;
  Form2.Edit9.Text  := Form2.Edit37.Text;
  Form2.Edit10.Text := Form2.Edit38.Text;
  Form2.Edit11.Text := Form2.Edit39.Text;
  Form2.Edit12.Text := Form2.Edit40.Text;
  Form2.Edit13.Text := Form2.Edit41.Text;
  Form2.Edit14.Text := Form2.Edit42.Text;
  Form2.Edit15.Text := Form2.Edit43.Text;
  Form2.Edit16.Text := Form2.Edit44.Text;
  Form2.Edit17.Text := Form2.Edit45.Text;
  Form2.Edit18.Text := Form2.Edit46.Text;
  Form2.Edit19.Text := Form2.Edit47.Text;
  Form2.Edit20.Text := Form2.Edit48.Text;
  Form2.Edit21.Text := Form2.Edit49.Text;
  Form2.Edit22.Text := Form2.Edit50.Text;
  Form2.Edit23.Text := Form2.Edit51.Text;
  Form2.Edit24.Text := Form2.Edit52.Text;
end;

procedure TForm2.RadioButton6Click(Sender: TObject);
begin
    SpinEdit1.Value := 0;
    Pl := 0;
    XZero := 0.0000000000001;
    YZero := 0;
    ZZero := 1;

    T[1,1]:=1; T[1,2]:=0; T[1,3]:=0; T[1,4]:=0;
    T[2,1]:=0; T[2,2]:=1; T[2,3]:=0; T[2,4]:=0;
    T[3,1]:=0; T[3,2]:=0; T[3,3]:=0; T[3,4]:=0;
    T[4,1]:=0; T[4,2]:=0; T[4,3]:=0; T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
end;

procedure TForm2.RadioButton7Click(Sender: TObject);
begin
    SpinEdit1.Value := 0;
    Pl := 0;
    XZero := 0;
    YZero := 1;
    ZZero := 0;

    T[1,1]:=1; T[1,2]:=0; T[1,3]:=0; T[1,4]:=0;
    T[2,1]:=0; T[2,2]:=0; T[2,3]:=0; T[2,4]:=0;
    T[3,1]:=0; T[3,2]:=0; T[3,3]:=1; T[3,4]:=0;
    T[4,1]:=0; T[4,2]:=0; T[4,3]:=0; T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
end;

procedure TForm2.RadioButton8Click(Sender: TObject);
begin
    SpinEdit1.Value := 0;
    Pl := 0;
    XZero := 1;
    YZero := 0;
    ZZero := 0;

    T[1,1]:=0; T[1,2]:=0; T[1,3]:=0; T[1,4]:=0;
    T[2,1]:=0; T[2,2]:=1; T[2,3]:=0; T[2,4]:=0;
    T[3,1]:=0; T[3,2]:=0; T[3,3]:=1; T[3,4]:=0;
    T[4,1]:=0; T[4,2]:=0; T[4,3]:=0; T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
end;

procedure TForm2.RadioButton9Click(Sender: TObject);
begin
    SpinEdit1.Value := 45;
    Pl := 1;
    XZero := 1;
    YZero := 0;
    ZZero := 1;

    T[1,1]:=1; T[1,2]:=0; T[1,3]:=0; T[1,4]:=0;
    T[2,1]:=0; T[2,2]:=1; T[2,3]:=0; T[2,4]:=0;
    T[3,1]:=0; T[3,2]:=0; T[3,3]:=1; T[3,4]:=0;
    T[4,1]:=0; T[4,2]:=0; T[4,3]:=0; T[4,4]:=1;

    C[1,1]:=0; C[1,2]:=0; C[1,3]:=0; C[1,4]:=0;
    C[2,1]:=0; C[2,2]:=0; C[2,3]:=0; C[2,4]:=0;
    C[3,1]:=0; C[3,2]:=0; C[3,3]:=0; C[3,4]:=0;
    C[4,1]:=0; C[4,2]:=0; C[4,3]:=0; C[4,4]:=0;
    C[5,1]:=0; C[5,2]:=0; C[5,3]:=0; C[5,4]:=0;
    C[6,1]:=0; C[6,2]:=0; C[6,3]:=0; C[6,4]:=0;
    C[7,1]:=0; C[7,2]:=0; C[7,3]:=0; C[7,4]:=0;
    C[8,1]:=0; C[8,2]:=0; C[8,3]:=0; C[8,4]:=0;

    for i:=1 to 8 do
      for j:=1 to 4 do
        for k:=1 to 4 do
        begin
          C[i,j]:= C[i,j] + Cube[i,k]*T[k,j];
        end;

    Form2.Edit29.Text  := floattostr(C[1,1]);
    Form2.Edit30.Text  := floattostr(C[1,2]);
    Form2.Edit31.Text  := floattostr(C[1,3]);
    Form2.Edit32.Text  := floattostr(C[2,1]);
    Form2.Edit33.Text  := floattostr(C[2,2]);
    Form2.Edit34.Text  := floattostr(C[2,3]);
    Form2.Edit35.Text  := floattostr(C[3,1]);
    Form2.Edit36.Text  := floattostr(C[3,2]);
    Form2.Edit37.Text  := floattostr(C[3,3]);
    Form2.Edit38.Text := floattostr(C[4,1]);
    Form2.Edit39.Text := floattostr(C[4,2]);
    Form2.Edit40.Text := floattostr(C[4,3]);
    Form2.Edit41.Text := floattostr(C[5,1]);
    Form2.Edit42.Text := floattostr(C[5,2]);
    Form2.Edit43.Text := floattostr(C[5,3]);
    Form2.Edit44.Text := floattostr(C[6,1]);
    Form2.Edit45.Text := floattostr(C[6,2]);
    Form2.Edit46.Text := floattostr(C[6,3]);
    Form2.Edit47.Text := floattostr(C[7,1]);
    Form2.Edit48.Text := floattostr(C[7,2]);
    Form2.Edit49.Text := floattostr(C[7,3]);
    Form2.Edit50.Text := floattostr(C[8,1]);
    Form2.Edit51.Text := floattostr(C[8,2]);
    Form2.Edit52.Text := floattostr(C[8,3]);
end;

end.
