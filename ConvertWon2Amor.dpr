program ConvertWon2Amor;

uses
  System.StartUpCopy,
  FMX.Forms,
  ConvertMainForm in 'ConvertMainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
