program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {NeuroWeb};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TNeuroWeb, NeuroWeb);
  Application.Run;
end.
