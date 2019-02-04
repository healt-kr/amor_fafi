unit SexagesimalCalendar;

interface

procedure TimeToSexagesiamlText(Time: TDateTime; var sYear, sMonth, sDay, sHour: string);

implementation

uses calendar_unit, DateUtils;

procedure TimeToSexagesiamlText(Time: TDateTime; var sYear, sMonth, sDay, sHour: string);
var
  SolarYear: Integer;
  SolarMonth, SolarDay, SolarHour, SolarMinute, SolarSecond, SolarMilli: SmallInt;
  Year, Month, Day, Hour, Minute, Second, Milli: Word;
  So24: Integer;
  So24Year, So24Month, So24Day, So24Hour: ShortInt;
begin
  DecodeDateTime(Time, Year, Month, Day, Hour, Minute, Second, Milli);

  SolarYear := Year;
  SolarMonth := Month;
  SolarDay := Day;
  SolarHour := Hour;
  SolarMinute := Minute;

  sydtoso24yd(SolarYear, SolarMonth, SolarDay, SolarHour, SolarMinute,
    So24, So24Year, So24Month, So24Day, So24Hour);

  sYear   := ganji[So24Year];
  sMonth  := ganji[So24Month];
  sDay    := ganji[So24Day];
  sHour   := ganji[So24Hour];
end;

end.
