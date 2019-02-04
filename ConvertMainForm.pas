unit ConvertMainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, FMX.StdCtrls,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    FDConnection1: TFDConnection;
    FDConnection2: TFDConnection;
    FDTable1: TFDTable;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ToolBar1: TToolBar;
    Button1: TButton;
    StringGrid2: TStringGrid;
    FDTable2: TFDTable;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Button2: TButton;
    FDQueryDeleteAll: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses DateUtils;

procedure TForm1.Button1Click(Sender: TObject);
var
  birth_time: TDateTime;
  Sex: string;
begin
  with FDTable1 do
  begin
    First;

    while not Eof do begin

      try
        birth_time := EncodeDateTime(
          FieldByName('SUN_YEAR').AsInteger,
          FieldByName('SUN_MONTH').AsInteger,
          FieldByName('SUN_DAY').AsInteger,
          FieldByName('HOUR').AsInteger,
          FieldByName('MINUTE').AsInteger, 0, 0
        );

        case FieldByName('SEX').AsInteger of
          1: Sex := 'M';
          2: Sex := 'F';
        end;

        FDTable2.Append;
        FDTable2.FieldByName('birth_time').AsDateTime := birth_time;
        FDTable2.FieldByName('ganji_year').AsString :=
          FieldByName('GANCHUN_Y').AsString + FieldByName('JIJI_Y').AsString;
        FDTable2.FieldByName('ganji_month').AsString :=
          FieldByName('GANCHUN_M').AsString + FieldByName('JIJI_M').AsString;
        FDTable2.FieldByName('ganji_day').AsString :=
          FieldByName('GANCHUN_D').AsString + FieldByName('JIJI_D').AsString;
        FDTable2.FieldByName('ganji_hour').AsString :=
          FieldByName('GANCHUN_S').AsString + FieldByName('JIJI_S').AsString;

        FDTable2.FieldByName('sex').AsString := Sex;
        FDTable2.FieldByName('name').AsString := FieldByName('NAME').AsString;
        FDTable2.FieldByName('memo').AsString := FieldByName('MEMO').AsString;
        FDTable2.FieldByName('created_at').AsDateTime := FieldByName('RESIST_DATE').AsDateTime;
        FDTable2.FieldByName('updated_at').AsDateTime := FieldByName('RESIST_DATE').AsDateTime;
        FDTable2.Post;
      except

      end;

      Next;
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FDTable2.Close;
  FDQueryDeleteAll.ExecSQL;
  FDTable2.Open;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  FDTable1.Open;
  FDTable2.Open;
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  FDTable1.Close;
  FDTable2.Close;
end;

end.
