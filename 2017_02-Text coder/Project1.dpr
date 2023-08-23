program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Coder};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCoder, Coder);
  Application.Run;
end.
