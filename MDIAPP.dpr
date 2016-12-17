program Mdiapp;

uses
  Forms,
  Main in 'Main.pas' {MainMDIForm},
  CHILDWIN in 'CHILDWIN.PAS' {MDIChild},
  about in 'about.pas' {AboutBox},
  InterfaceDMUnit in 'CRM_system\InterfaceDMUnit.pas' {InterfaceDM: TDataModule},
  Location3DUnit in 'CRM_system\Location3DUnit.pas' {Location3DForm},
  DBConnectUnit in 'CRM_system\DBConnectUnit.pas' {DBConnectDM: TDataModule},
  MainUnit in 'CRM_system\MainUnit.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainMDIForm, MainMDIForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TInterfaceDM, InterfaceDM);
  Application.CreateForm(TLocation3DForm, Location3DForm);
  Application.CreateForm(TDBConnectDM, DBConnectDM);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
