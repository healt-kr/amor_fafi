unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Calendar, FMX.DateTimeCtrls, FMX.Edit,
  FMX.Objects, FMX.StdCtrls, FMX.ListBox, FMX.Layouts, FMX.MultiView;

type
  TfrmMain = class(TForm)
    Calendar1: TCalendar;
    DateEdit1: TDateEdit;
    Edit1: TEdit;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Text1: TText;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Calendar1DateSelected(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses calendar_unit, DateUtils, SexagesimalCalendar;

procedure TfrmMain.Calendar1DateSelected(Sender: TObject);
var
  sYear, sMonth, sDay, sHour: string;
begin
  DateEdit1.DateTime := Calendar1.DateTime;
  TimeToSexagesiamlText(Calendar1.DateTime, sYear, sMonth, sDay, sHour);
  Edit1.Text := sYear + ' ' + sMonth + ' ' + sDay;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  SolarYear: Integer;
  SolarMonth, SolarDay, SolarHour, SolarMinute, SolarSecond, SolarMilli: SmallInt;
  Year, Month, Day, Hour, Minute, Second, Milli: Word;
  So24: Integer;
  So24Year, So24Month, So24Day, So24Hour: ShortInt;
begin
  DateEdit1.Text := FormatDateTime('yyyy-mm-dd', now);
  Calendar1.Date := now;
  Calendar1DateSelected(Sender);
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  MultiView1.ShowMaster;
end;

end.
