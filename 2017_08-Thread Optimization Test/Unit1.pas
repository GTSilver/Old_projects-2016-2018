unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyThread1 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread2 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread3 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread4 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread5 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread6 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread7 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

  TMyThread8 = class(TThread)
  private
    { Private declarations }
protected
  procedure Execute; override;
  end;

var
  Form1: TForm1;
  Thread1: TMyThread1;
  Thread2: TMyThread2;
  Thread3: TMyThread3;
  Thread4: TMyThread4;
  Thread5: TMyThread5;
  Thread6: TMyThread6;
  Thread7: TMyThread7;
  Thread8: TMyThread8;
  n1, n2, n3, n4, n5 ,n6 ,n7 ,n8 : double;
  a1, a2, a3, a4, a5 ,a6 ,a7 ,a8 : double;
  i1, i2, i3, i4, i5 ,i6 ,i7 ,i8 : double;
  j1, j2, j3, j4, j5 ,j6 ,j7 ,j8 : double;
  p1, p2, p3, p4, p5 ,p6 ,p7 ,p8 : double;
  Min1, Min2, Min3, Min4, Min5, Min6, Min7, Min8 : double;
  Max1, Max2, Max3, Max4, Max5, Max6, Max7, Max8 : double;

implementation

{$R *.dfm}

procedure TMyThread1.Execute;      //��� ������
begin
i1 := 2;
j1 := 2;
while i1 <= 100000 do
  begin
    while j1 <= i1 do
      begin
        if (round(i1) mod round(j1)) = 0 then
          a1 := a1 + 1;
        j1 := j1 + 1;
        n1 := n1 + 1;
        if Thread1.Terminated then break;
      end;
    if a1 = 1 then
      p1 := p1 + 1;
    a1 := 0;
    i1 := i1 + 1;
    j1 := 2;
    if Thread1.Terminated then break;
  end;
end;

procedure TMyThread2.Execute;
begin
i2 := 100001;
j2 := 2;
while i2 <= 200000 do
  begin
    while j2 <= i2 do
      begin
        if (round(i2) mod round(j2)) = 0 then
          a2 := a2 + 1;
        j2 := j2 + 1;
        n2 := n2 + 1;
        if Thread1.Terminated then break;
      end;
    if a2 = 1 then
      p2 := p2 + 1;
    a2 := 0;
    i2 := i2 + 1;
    j2 := 2;
    if Thread2.Terminated then break;
  end;
end;

procedure TMyThread3.Execute;
begin
i3 := 200001;
j3 := 2;
while i3 <= 300000 do
  begin
    while j3 <= i3 do
      begin
        if (round(i3) mod round(j3)) = 0 then
          a3 := a3 + 1;
        j3 := j3 + 1;
        n3 := n3 + 1;
        if Thread3.Terminated then break;
      end;
    if a3 = 1 then
      p3 := p3 + 1;
    a3 := 0;
    i3 := i3 + 1;
    j3 := 2;
    if Thread3.Terminated then break;
  end;
end;

procedure TMyThread4.Execute;
begin
i4 := 300001;
j4 := 2;
while i4 <= 400000 do
  begin
    while j4 <= i4 do
      begin
        if (round(i4) mod round(j4)) = 0 then
          a4 := a4 + 1;
        j4 := j4 + 1;
        n4 := n4 + 1;
        if Thread4.Terminated then break;
      end;
    if a4 = 1 then
      p4 := p4 + 1;
    a4 := 0;
    i4 := i4 + 1;
    j4 := 2;
    if Thread4.Terminated then break;
  end;
end;

procedure TMyThread5.Execute;
begin
i5 := 400001;
j5 := 2;
while i5 <= 500000 do
  begin
    while j5 <= i5 do
      begin
        if (round(i5) mod round(j5)) = 0 then
          a5 := a5 + 1;
        j5 := j5 + 1;
        n5 := n5 + 1;
        if Thread5.Terminated then break;
      end;
    if a5 = 1 then
      p5 := p5 + 1;
    a5 := 0;
    i5 := i5 + 1;
    j5 := 2;
    if Thread5.Terminated then break;
  end;
end;

procedure TMyThread6.Execute;
begin
i6 := 500001;
j6 := 2;
while i6 <= 600000 do
  begin
    while j6 <= i6 do
      begin
        if (round(i6) mod round(j6)) = 0 then
          a6 := a6 + 1;
        j6 := j6 + 1;
        n6 := n6 + 1;
        if Thread6.Terminated then break;
      end;
    if a6 = 1 then
      p6 := p6 + 1;
    a6 := 0;
    i6 := i6 + 1;
    j6 := 2;
    if Thread6.Terminated then break;
  end;
end;

procedure TMyThread7.Execute;
begin
i7 := 600001;
j7 := 2;
while i7 <= 700000 do
  begin
    while j7 <= i7 do
      begin
        if (round(i7) mod round(j7)) = 0 then
          a7 := a7 + 1;
        j7 := j7 + 1;
        n7 := n7 + 1;
        if Thread7.Terminated then break;
      end;
    if a7 = 1 then
      p7 := p7 + 1;
    a7 := 0;
    i7 := i7 + 1;
    j7 := 2;
    if Thread7.Terminated then break;
  end;
end;

procedure TMyThread8.Execute;
begin
i8 := 700001;
j8 := 2;
while i8 <= 800000 do
  begin
    while j8 <= i8 do
      begin
        if (round(i8) mod round(j8)) = 0 then
          a8 := a8 + 1;
        j8 := j8 + 1;
        n8 := n8 + 1;
        if Thread8.Terminated then break;
      end;
    if a8 = 1 then
      p8 := p8 + 1;
    a8 := 0;
    i8 := i8 + 1;
    j8 := 2;
    if Thread8.Terminated then break;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    begin
      Thread1:=TMyThread1.Create(True); //False - ����� ����������� ����� �������� ��� Resume
      Thread1.Priority:=tpNormal;       //��������� ���������� ������
      Thread1.FreeOnTerminate := True;  //���������� ����� ����� ����������
      Thread1.Resume;                   //��������� �����
    end;
  if CheckBox2.Checked then
    begin
      Thread2:=TMyThread2.Create(True);
      Thread2.Priority:=tpNormal;
      Thread2.FreeOnTerminate := True;
      Thread2.Resume;
    end;
  if CheckBox3.Checked then
    begin
      Thread3:=TMyThread3.Create(True);
      Thread3.Priority:=tpNormal;
      Thread3.FreeOnTerminate := True;
      Thread3.Resume;
    end;
  if CheckBox4.Checked then
    begin
      Thread4:=TMyThread4.Create(True);
      Thread4.Priority:=tpNormal;
      Thread4.FreeOnTerminate := True;
      Thread4.Resume;
    end;
  if CheckBox5.Checked then
    begin
      Thread5:=TMyThread5.Create(True);
      Thread5.Priority:=tpNormal;
      Thread5.FreeOnTerminate := True;
      Thread5.Resume;
    end;
  if CheckBox6.Checked then
    begin
      Thread6:=TMyThread6.Create(True);
      Thread6.Priority:=tpNormal;
      Thread6.FreeOnTerminate := True;
      Thread6.Resume;
    end;
  if CheckBox7.Checked then
    begin
      Thread7:=TMyThread7.Create(True);
      Thread7.Priority:=tpNormal;
      Thread7.FreeOnTerminate := True;
      Thread7.Resume;
    end;
  if CheckBox8.Checked then
    begin
      Thread8:=TMyThread8.Create(True);
      Thread8.Priority:=tpNormal;
      Thread8.FreeOnTerminate := True;
      Thread8.Resume;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if CheckBox1.Checked then Thread1.Terminate; //������ �������� ���������.Terminated �� True
if CheckBox2.Checked then Thread2.Terminate;
if CheckBox3.Checked then Thread3.Terminate;
if CheckBox4.Checked then Thread4.Terminate;
if CheckBox5.Checked then Thread5.Terminate;
if CheckBox6.Checked then Thread6.Terminate;
if CheckBox7.Checked then Thread7.Terminate;
if CheckBox8.Checked then Thread8.Terminate;

Edit1.Text := floattostr(n1+n2+n3+n4+n5+n6+n7+n8);
Edit2.Text := floattostr(n1);
Edit3.Text := floattostr(n2);
Edit4.Text := floattostr(n3);
Edit5.Text := floattostr(n4);
Edit6.Text := floattostr(n5);
Edit7.Text := floattostr(n6);
Edit8.Text := floattostr(n7);
Edit9.Text := floattostr(n8);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
n1 := 0;
n2 := 0;
n3 := 0;
n4 := 0;
n5 := 0;
n6 := 0;
n7 := 0;
n8 := 0;
end;

end.
