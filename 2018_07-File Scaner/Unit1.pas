unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit3: TLabeledEdit;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
  public
  end;

type
  TLocalThread = class(TThread)
  private
  protected
  public
    procedure Execute; override;
    procedure Synch;
  end;

type
  TUpdateThread = class(TThread)
  private
  protected
  public
    procedure Execute; override;
    procedure Synch;
  end;

type
  TTimeThread = class(TThread)
  private
  protected
  public
    procedure Execute; override;
    procedure Synch;
  end;

var
  MainThread: TLocalThread;
  UpdateThread: TUpdateThread;
  TimeThread: TTimeThread;
  Form1: TForm1;
  input_folder : string;
  output_folder : string;
  saved_input_folder_mass : array[-1..99] of string;
  saved_output_folder_mass : array[-1..99] of string;
  level : integer;
  max_level : integer;
  separating_character : string;
  utc_time : string;
  global_folder_number : integer;
  global_file_number : integer;
  global_all_file_number : integer;
  CheckBox : integer;
  Global_Thread_Switch : integer;
  F2: TextFile;

implementation

{$R *.dfm}

procedure Scan;
var
i : integer;
serched_file : TSearchRec;
file_time : TFileTime;
file_system_time : TSystemTime;
file_create_time : TDateTime;
file_change_time : TDateTime;
file_open_time : TDateTime;
folder_number : integer;
file_number : integer;
input_folder_mass : array of string;
output_folder_mass : array of string;
file_mass : array of array of string;
F1: TextFile;
begin
SetLength(input_folder_mass,0);
SetLength(output_folder_mass,0);
SetLength(file_mass,0,0);
i := 0;
folder_number := 0;

//���� ���������� ����� � ��������� ������ ��� �������
if FindFirst(input_folder + '*',faAnyFile,serched_file) = 0 then
begin
  while FindNext(serched_file) = 0 do
  begin
    if ((serched_file.Attr = faDirectory) OR (serched_file.Attr = faDirectory + faReadOnly) OR (serched_file.Attr = faDirectory + faHidden) OR (serched_file.Attr = faDirectory + faArchive) OR (serched_file.Attr = faDirectory + faReadOnly + faHidden) OR (serched_file.Attr = faDirectory + faReadOnly + faHidden + faArchive) OR (serched_file.Attr = faDirectory + faHidden + faArchive) OR (serched_file.Attr = faDirectory + faReadOnly + faArchive)) AND (serched_file.Name <> '.') AND (serched_file.Name <> '..') then
    begin
    folder_number := folder_number + 1;
    i := i + 1;
    end;
  end;
end;
FindClose(serched_file);
global_folder_number := global_folder_number + folder_number;
SetLength(input_folder_mass,folder_number);
SetLength(output_folder_mass,folder_number);

//�������� ������ �����
i := 0;
if FindFirst(input_folder + '*',faAnyFile,serched_file) = 0 then
begin
  while FindNext(serched_file) = 0 do
  begin
    if ((serched_file.Attr = faDirectory) OR (serched_file.Attr = faDirectory + faReadOnly) OR (serched_file.Attr = faDirectory + faHidden) OR (serched_file.Attr = faDirectory + faArchive) OR (serched_file.Attr = faDirectory + faReadOnly + faHidden) OR (serched_file.Attr = faDirectory + faReadOnly + faHidden + faArchive) OR (serched_file.Attr = faDirectory + faHidden + faArchive) OR (serched_file.Attr = faDirectory + faReadOnly + faArchive)) AND (serched_file.Name <> '.') AND (serched_file.Name <> '..') then
    begin
    input_folder_mass[i] := serched_file.Name;
    output_folder_mass[i] := serched_file.Name; //*
    i := i + 1;
    end;
  end;
end;
FindClose(serched_file);

//�������� �����
ForceDirectories(output_folder);



//���� ���������� ������ � ��������� ������ ��� �������
i := 0;
file_number := 0;

if FindFirst(input_folder + '*.*',faAnyFile,serched_file) = 0 then
begin
  while FindNext(serched_file) = 0 do
  begin
    if (serched_file.Name <> '.') AND (serched_file.Name <> '..') AND (serched_file.Name <> '%s.') then
    begin
    file_number := file_number + 1;
    i := i + 1;
    end;
  end;
end;
FindClose(serched_file);
global_all_file_number := global_all_file_number + file_number;
SetLength(file_mass,6,file_number);

//������� ���������� �������������� ������
global_file_number := global_all_file_number - global_folder_number;

//�������� ������ ������
i := 0;
if FindFirst(input_folder + '*.*',faAnyFile,serched_file) = 0 then
begin
  while FindNext(serched_file) = 0 do
  begin
    if (serched_file.Name <> '.') AND (serched_file.Name <> '..') AND (serched_file.Name <> '%s') then
    begin
    file_time := serched_file.FindData.ftCreationTime;
    FileTimeToSystemTime(file_time,file_system_time);
    file_create_time := StrToDateTime(IntToStr(file_system_time.wDay) + '.' + IntToStr(file_system_time.wMonth) + '.' + IntToStr(file_system_time.wYear) + ' ' + IntToStr(file_system_time.wHour) + ':' + IntToStr(file_system_time.wMinute) + ':' + IntToStr(file_system_time.wSecond)) + StrToTime(utc_time + ':00:00');

    file_time := serched_file.FindData.ftLastWriteTime;
    FileTimeToSystemTime(file_time,file_system_time);
    file_change_time := StrToDateTime(IntToStr(file_system_time.wDay) + '.' + IntToStr(file_system_time.wMonth) + '.' + IntToStr(file_system_time.wYear) + ' ' + IntToStr(file_system_time.wHour) + ':' + IntToStr(file_system_time.wMinute) + ':' + IntToStr(file_system_time.wSecond)) + StrToTime(utc_time + ':00:00');

    file_time := serched_file.FindData.ftLastAccessTime;
    FileTimeToSystemTime(file_time,file_system_time);
    file_open_time := StrToDateTime(IntToStr(file_system_time.wDay) + '.' + IntToStr(file_system_time.wMonth) + '.' + IntToStr(file_system_time.wYear) + ' ' + IntToStr(file_system_time.wHour) + ':' + IntToStr(file_system_time.wMinute) + ':' + IntToStr(file_system_time.wSecond)) + StrToTime(utc_time + ':00:00');

    file_mass[0,i] := serched_file.Name;
    file_mass[1,i] := inttostr(serched_file.Size);
    file_mass[2,i] := DateTimeToStr(file_create_time);
    file_mass[3,i] := DateTimeToStr(file_change_time);
    file_mass[4,i] := DateTimeToStr(file_open_time);
    file_mass[5,i] := inttostr(serched_file.Attr);
    i := i + 1;
    end;
  end;
end;
FindClose(serched_file);

//�������� ���������� �����
i := 0;
if (Length(output_folder) + 13) < 246 then   //���� ������������ ������ ���� Windows (13 - ������ "File list.txt")
begin
AssignFile(F1, output_folder + 'File list.txt');
Rewrite(F1);
writeln(F1,'File Name' + separating_character + 'File Size' + separating_character + 'Create Time' + separating_character + 'Change Time' + separating_character + 'Last Open Time' + separating_character + 'Attribute');
while i < file_number do
begin
  writeln(F1, file_mass[0,i] + separating_character + file_mass[1,i] + separating_character + file_mass[2,i] + separating_character + file_mass[3,i] + separating_character + file_mass[4,i] + separating_character + file_mass[5,i]);
  if (CheckBox = 1) then writeln(F2, file_mass[0,i] + separating_character + file_mass[1,i] + separating_character + file_mass[2,i] + separating_character + file_mass[3,i] + separating_character + file_mass[4,i] + separating_character + file_mass[5,i] + separating_character + input_folder);
  i := i + 1;
end;
CloseFile(F1);
end;


//���������� �������� ����������
saved_input_folder_mass[level] := input_folder;
saved_output_folder_mass[level] := output_folder; //*

//��������� � ��������� ����������
i := 0;
if (level + 1 <= max_level) AND (folder_number > 0) then
begin
  while i < folder_number do
  begin
    input_folder := input_folder + input_folder_mass[i] + '\';
    output_folder := output_folder + output_folder_mass[i] + '\'; //*
    level := level + 1;
    Scan;
    i := i + 1;
  end;
  input_folder := saved_input_folder_mass[level - 1];
  output_folder := saved_output_folder_mass[level - 1]; //*
  level := level - 1;
  SetLength(input_folder_mass,0);
  SetLength(output_folder_mass,0);
  SetLength(file_mass,0,0);
end else
begin
  input_folder := saved_input_folder_mass[level - 1];
  output_folder := saved_output_folder_mass[level - 1]; //*
  level := level - 1;
  SetLength(input_folder_mass,0);
  SetLength(output_folder_mass,0);
  SetLength(file_mass,0,0);
end;
end;

procedure TLocalThread.Synch;
begin
Form1.Button1.Enabled := True;
Form1.Button1.Caption := 'Start Scaning';
end;

procedure TLocalThread.Execute;
begin
Scan;
Synchronize(Synch);
UpdateThread.Terminate;
TimeThread.Terminate;
Form1.Label5.Caption := inttostr(global_folder_number);
Form1.Label6.Caption := inttostr(global_file_number);
Global_Thread_Switch := 0;
Showmessage('End of scanning');
CloseFile(F2);
MainThread.Terminate;
end;

procedure TUpdateThread.Synch;
begin
Form1.Label5.Caption := inttostr(global_folder_number);
Form1.Label6.Caption := inttostr(global_file_number);
end;

procedure TUpdateThread.Execute;
begin
while Global_Thread_Switch = 1 do
begin
Synchronize(Synch);
sleep(100);
end;
end;

procedure TTimeThread.Synch;
begin
Form1.Label7.Caption := IntToStr(StrToInt(Form1.Label7.Caption) + 1);
end;

procedure TTimeThread.Execute;
begin
while Global_Thread_Switch = 1 do
begin
sleep(1000);
if Global_Thread_Switch = 1 then Synchronize(Synch);
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Button1.Enabled := False;
level := 0;
global_folder_number := 0;
global_all_file_number := 0;
global_file_number := 0;
Global_Thread_Switch := 1;
max_level := SpinEdit1.Value;
input_folder := LabeledEdit1.Text;
output_folder := LabeledEdit2.Text;
separating_character := LabeledEdit3.Text;
utc_time := IntToStr(SpinEdit2.Value);
MainThread := TLocalThread.Create(False);
UpdateThread := TUpdateThread.Create(False);
TimeThread := TTimeThread.Create(False);
MainThread.Priority := tpNormal;
UpdateThread.Priority := tpNormal;
TimeThread.Priority := tpNormal;
if (CheckBox1.Checked = True) then
begin
ForceDirectories(output_folder);
AssignFile(F2, output_folder + 'Full file list.txt');
Rewrite(F2);
writeln(F2,'File Name' + separating_character + 'File Size' + separating_character + 'Create Time' + separating_character + 'Change Time' + separating_character + 'Last Open Time' + separating_character + 'Attribute' + separating_character + 'Path');
CheckBox := 1;
end else CheckBox := 0;
Label7.Caption := inttostr(0);
MainThread.Resume;
UpdateThread.Resume;
TimeThread.Resume;
Button1.Caption := 'Scanning';
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
if (SpinEdit1.Value < 0) then SpinEdit1.Value := 0;
if (SpinEdit1.Value > 99) then SpinEdit1.Value := 99;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
LabeledEdit1.Text := '';
LabeledEdit2.Text := '';
end;

procedure TForm1.Button3Click(Sender: TObject);
var directory : string;
begin
directory := 'C:\Directory Scan Results' + inttostr(Random(99999-10000) + 10000) + '\';
ForceDirectories(directory);
LabeledEdit1.Text := 'C:\';
LabeledEdit2.Text := directory;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
level := 0;
global_folder_number := 0;
global_all_file_number := 0;
global_file_number := 0;
Global_Thread_Switch := 1;
max_level := SpinEdit1.Value;
input_folder := LabeledEdit1.Text;
output_folder := LabeledEdit2.Text;
separating_character := LabeledEdit3.Text;
utc_time := IntToStr(SpinEdit2.Value);

if (CheckBox1.Checked = True) then
begin
AssignFile(F2, output_folder + 'Full file list.txt');
Rewrite(F2);
writeln(F2,'File Name' + separating_character + 'File Size' + separating_character + 'Create Time' + separating_character + 'Change Time' + separating_character + 'Last Open Time' + separating_character + 'Attribute' + separating_character + 'Path');
CheckBox := 1;
end else CheckBox := 0;
Label7.Caption := inttostr(0);

Scan;
Form1.Label5.Caption := inttostr(global_folder_number);
Form1.Label6.Caption := inttostr(global_file_number);
Global_Thread_Switch := 0;
Showmessage('End of scanning');
CloseFile(F2);
end;

end.
