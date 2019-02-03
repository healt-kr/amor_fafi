unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Calendar, FMX.DateTimeCtrls, FMX.Edit;

type
  TfrmMain = class(TForm)
    Calendar1: TCalendar;
    DateEdit1: TDateEdit;
    Edit1: TEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses calendar_unit, DateUtils;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  SolarYear: Integer;
  SolarMonth, SolarDay, SolarHour, SolarMinute, SolarSecond, SolarMilli: SmallInt;
  Year, Month, Day, Hour, Minute, Second, Milli: Word;
  So24: Integer;
  So24Year, So24Month, So24Day, So24Hour: ShortInt;
begin
  DateEdit1.Text := FormatDateTime('yyyy-mm-dd', now);
  DecodeDateTime(now, Year, Month, Day, Hour,
    Minute, Second, Milli);
  SolarYear := Year;
  SolarMonth := Month;
  SolarDay := Day;
  SolarHour := Hour;
  SolarMinute := Minute;
  sydtoso24yd(SolarYear, SolarMonth, SolarDay, SolarHour, SolarMinute,
    So24, So24Year, So24Month, So24Day, So24Hour);

  Edit1.Text := format('%s %s %s %s',
    [ ganji[So24Year], ganji[So24Month], ganji[So24Day], ganji[So24Hour] ]);
end;

end.
