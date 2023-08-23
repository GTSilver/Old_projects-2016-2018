unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCoder = class(TForm)
    Coding: TButton;
    Decoding: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Large: TLabel;
    Time: TLabel;
    procedure CodingClick(Sender: TObject);
    procedure DecodingClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Coder: TCoder;

implementation

{$R *.dfm}

var
C1,C2,C3 : char;
i1,i2,i3,n,R1,R2,R4: integer;
F1,F2,F3 : Text;
t : longint;
R3 : TDateTime;

procedure TCoder.CodingClick(Sender: TObject);
begin
t := GetTickCount;
n := 0;
AssignFile(F1,'Text.txt');
AssignFile(F2,'Key.txt');
AssignFile(F3,'CText.txt');
Reset(F1);
Rewrite(F2);
Rewrite(F3);

while NOT eof(F1) do
  begin
    Read(F1,C1);
    Repeat
      Repeat
        i2 := Random(255);
      Until i2 <> 26;
      i1 := ord(c1);
      i3 := i1 xor i2;
    Until i3 <> 26;
    C2 := char(ord(i2));
    C3 := char(ord(i3));
    write(F2,C2);
    write(F3,C3);
    inc(n);
  end;

CloseFile(F1);
CloseFile(F2);
CloseFile(F3);

t := t - GetTickCount;
Large.Caption := inttostr(n);
Time.Caption := inttostr(t);
end;

procedure TCoder.DecodingClick(Sender: TObject);
begin
t := GetTickCount;
n := 0;
AssignFile(F1,'CText.txt');
AssignFile(F2,'Key.txt');
AssignFile(F3,'DText.txt');
Reset(F1);
Reset(F2);
Rewrite(F3);

while NOT eof(F1) do
  begin
    Read(F1,C1);
    Read(F2,C2);
    i1 := ord(C1);
    i2 := ord(C2);
    i3 := i1 xor i2;
    C3 := char(ord(i3));
    write(F3,C3);
    inc(n);
  end;

CloseFile(F1);
CloseFile(F2);
CloseFile(F3);

t := abs(t - GetTickCount);
Large.Caption := inttostr(n);
Time.Caption := inttostr(t);
end;

procedure TCoder.FormCreate(Sender: TObject);
begin
R3 := now;
R4 := round(R3*24*60*60*10000) mod 10000;
for R2 := 0 to R4 do R1 := random(255);
end;

end.
