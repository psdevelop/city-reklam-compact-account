program CRM_system;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DBConnectUnit in 'DBConnectUnit.pas' {DBConnectDM: TDataModule},
  Location3DUnit in 'Location3DUnit.pas' {Location3DForm},
  InterfaceDMUnit in 'InterfaceDMUnit.pas' {InterfaceDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDBConnectDM, DBConnectDM);
  Application.CreateForm(TLocation3DForm, Location3DForm);
  Application.CreateForm(TInterfaceDM, InterfaceDM);
  Application.Run;
end.
