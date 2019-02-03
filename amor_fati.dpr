program amor_fati;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  calendar_unit in 'calendar_unit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
