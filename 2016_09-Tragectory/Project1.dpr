program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Tragectory};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTragectory, Tragectory);
  Application.Run;
end.
