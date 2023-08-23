unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ColorGrd, StdCtrls, ExtCtrls;

type
  TTragectory = class(TForm)
    EdiSpeed: TEdit;
    EdiDeg: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Fone: TShape;
    Graffic: TImage;
    Button1: TButton;
    Button2: TButton;
    EdiWhi: TEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    LabDist: TLabel;
    LabHig: TLabel;
    LabTime: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Tragectory: TTragectory;

implementation

{$R *.dfm}

procedure TTragectory.Button2Click(Sender: TObject);
begin
Graffic.Picture := nil;
Graffic.Canvas.Pen.Color := clBlack;
Graffic.Canvas.Pen.Width := 1;
Graffic.Canvas.MoveTo(0,201);
Graffic.Canvas.LineTo(401,201);
Graffic.Canvas.MoveTo(5,0);
Graffic.Canvas.LineTo(5,401);
Graffic.Canvas.Pen.Color := clBlue;
Graffic.Canvas.Pen.Width := strToint(EdiWhi.Text);
end;

procedure TTragectory.FormCreate(Sender: TObject);
begin
Graffic.Picture := nil;
Graffic.Canvas.Pen.Color := clBlack;
Graffic.Canvas.Pen.Width := 1;
Graffic.Canvas.MoveTo(0,201);
Graffic.Canvas.LineTo(401,201);
Graffic.Canvas.MoveTo(5,0);
Graffic.Canvas.LineTo(5,401)
end;

procedure TTragectory.Button1Click(Sender: TObject);
var
t1, t2, X1, Y1, V, g, L, h, deg : real;
X2, Y2 : integer;
begin
t2 := 0;
g := 9.8;
V := strTofloat(EdiSpeed.Text);
deg := strTofloat(EdiDeg.Text);
t1 := (2 * V * sin((Pi / 180) * deg));
LabTime.Caption := floatTostr(t1);
L := V * cos(((Pi / 180) * deg)) * t1;
LabDist.Caption := floatTostr(L);
h := V * sin(((Pi / 180) * deg)) * (t1 / 2);
LabHig.Caption := floatTostr(h);
while t1 > t2 do
begin
X1 := V * cos(((Pi / 180) * deg)) * t2;
Y1 := V * sin(((Pi / 180) * deg)) * t2 - ((g * t2 * t2) / 2);
X2 := round(X1);
Y2 := round(Y1);
Graffic.Canvas.Pen.Color := clRed;
Graffic.Canvas.Pen.Width := strToint(EdiWhi.Text);
Graffic.Canvas.MoveTo(5 + X2, 201 - Y2);
Graffic.Canvas.LineTo(5 + X2, 201 - Y2);
t2 := t2 + 0.01;
end;
end;

end.
