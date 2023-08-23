unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JPEG, Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Shape1: TShape;
    Shape2: TShape;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i, j, Tk, Ak : integer;
  MyPath : string;
  t : TDateTime;
  Hou,Min,Sec,Mil : Word;
  searchResult : TSearchRec;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Tk := 0;
Ak := 0;


if FindFirst('Task\*.jpg', faAnyFile, searchResult) = 0 then
  begin
    repeat
      Tk := Tk + 1;
    until FindNext(searchResult) <> 0;
  end;

if FindFirst('Answer\*.jpg', faAnyFile, searchResult) = 0 then
  begin
    repeat
      Ak := Ak + 1;
    until FindNext(searchResult) <> 0;
  end;

if Tk <> Ak then
  begin
  if Tk > Ak then ShowMessage('Ошибка! Количество ЗАДАЧЬ больше количества ОТВЕТОВ на ' + inttostr(Tk-Ak));
  if Tk < Ak then ShowMessage('Ошибка! Количество ОТВЕТОВ больше количества ЗАДАЧЬ на ' + inttostr(Ak-Tk));
  Close;
  end;

t := now;
DecodeTime(t, Hou, Min, Sec, Mil);
for j := 0 to Min*60 + Sec do
  i := random(Tk)+1;
MyPath := ExtractFilePath(Application.ExeName);
Image1.Picture.LoadFromFile(MyPath + 'Task\' + inttostr(i) + '.jpg');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Image2.Picture.LoadFromFile(MyPath + 'Answer\' + inttostr(i) + '.jpg');
end;

end.
