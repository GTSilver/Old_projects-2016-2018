unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TNeuroWeb = class(TForm)
    EII1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EIO1: TEdit;
    EII2: TEdit;
    EIO2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EHI1: TEdit;
    EHO1: TEdit;
    EHI2: TEdit;
    EHO2: TEdit;
    Label7: TLabel;
    EEO1: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EEI1: TEdit;
    Label10: TLabel;
    EA1: TEdit;
    Label11: TLabel;
    EE1: TEdit;
    EW1: TEdit;
    EW2: TEdit;
    EW3: TEdit;
    EW4: TEdit;
    Label12: TLabel;
    EW5: TEdit;
    EW6: TEdit;
    Label13: TLabel;
    Calculate: TButton;
    procedure CalculateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NeuroWeb: TNeuroWeb;

implementation

{$R *.dfm}
var
I1I, I2I, I1O, I2O, H1I, H2I, H1O, H2O, O1I, O1O, W1, W2, W3, W4, W5, W6, A, E :real;
procedure TNeuroWeb.CalculateClick(Sender: TObject);
begin
I1I := strtofloat(EII1.Text);
I2I := strtofloat(EII2.Text);
W1  := strtofloat(EW1.Text);
W2  := strtofloat(EW2.Text);
W3  := strtofloat(EW3.Text);
W4  := strtofloat(EW4.Text);
W5  := strtofloat(EW5.Text);
W6  := strtofloat(EW6.Text);
A   := strtofloat(EA1.Text);


I1O := I1I;
I2O := I2I;

H1I := I1O*W1+I2O*W2;
H2I := I1O*W3+I2O*W4;
H1O := 1/(1+exp(-1*H1I));
H2O := 1/(1+exp(-1*H2I));

O1I := H1O*W5+H2O*W6;
O1O := 1/(1+exp(-1*O1I));

E := sqr(A-O1O);


EIO1.Text := floattostr(I1O);
EIO2.Text := floattostr(I2O);

EHI1.Text := floattostr(H1I);
EHI2.Text := floattostr(H2I);

EHO1.Text := floattostr(H1O);
EHO2.Text := floattostr(H2O);

EEI1.Text := floattostr(O1I);
EEO1.Text := floattostr(O1O);

EE1.Text := floattostr(E);
end;

end.
