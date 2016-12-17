unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, IBDatabase, RpRave, RpCon, RpConDS, RpDefine, RpBase, RpSystem,
  IBQuery, IBStoredProc;

type
  TMainForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox6: TGroupBox;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    DBGrid4: TDBGrid;
    TabSheet7: TTabSheet;
    DBGrid6: TDBGrid;
    Splitter3: TSplitter;
    RvSystem: TRvSystem;
    PriceAppWorksRvDSC: TRvDataSetConnection;
    PriceAppPosRvDSC: TRvDataSetConnection;
    RvProject: TRvProject;
    IBTransaction: TIBTransaction;
    IBDatabase: TIBDatabase;
    WorksOfOrderDS: TDataSource;
    WorksOfOrderIBTable: TIBTable;
    ItemsOfOrderIBTable: TIBTable;
    ItemsOfOrderDS: TDataSource;
    RGenOrdSearchIBQuery: TIBQuery;
    Panel1: TPanel;
    Button1: TButton;
    RGenOrderSearchDS: TDataSource;
    RecalcOrderIBSP: TIBStoredProc;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ReloadDataSet(DST: TDataSet; KeyName: string;
      LastID: Integer=-1);
    procedure ReloadAll;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  if RGenOrdSearchIBQuery.RecordCount>0 then
    begin
      RecalcOrderIBSP.ParamByName('ORDER_ID').Value:=
         RGenOrdSearchIBQuery.FieldByName('ORDER_ID').AsInteger;
      RecalcOrderIBSP.ExecProc;
      //DBConnectDM.ReloadDataSet(DBConnectDM.RGenOrdSearchIBQuery,'ORDER_ID');
      RvProject.SelectReport('App1Report',False);
      RvProject.SetParam('DOC_NO',
        RGenOrdSearchIBQuery.FieldByName('DOC_NO').AsString);
      RvProject.SetParam('DOC_DATE',
        DateToStr(RGenOrdSearchIBQuery.FieldByName('DOC_DATE').AsDateTime));
      RvProject.SetParam('RTYPE_NAME',
        RGenOrdSearchIBQuery.FieldByName('RTYPE_NAME').AsString);
      RvProject.SetParam('RPOS_COUNT',
        RGenOrdSearchIBQuery.FieldByName('ITEMS_COUNT').AsString);
      RvProject.SetParam('REKLAM_SUMM',
        FloatToStr(RGenOrdSearchIBQuery.FieldByName('REKLAM_SUMM').AsFloat));
      RvProject.SetParam('WORK_SUMM',
        FloatToStr(RGenOrdSearchIBQuery.FieldByName('WORK_SUMM').AsFloat));
      RvProject.SetParam('ALL_SUMM',
        FloatToStr(RGenOrdSearchIBQuery.FieldByName('SUMM').AsFloat));
      RvProject.SetParam('CUSTOMER_NAME',
        RGenOrdSearchIBQuery.FieldByName('CUSTOMER_NAME').AsString);
      RvProject.ExecuteReport('App1Report');
    end
   else
     ShowMessage('Нет выделенного заказа!');
end;

procedure TMainForm.ReloadDataSet(DST: TDataSet; KeyName: string;
      LastID: Integer=-1);
var
  old_order_id: Integer;
  i: Integer;
begin

old_order_id:=LastID;
if DST.Active then
  begin
  if (DST.RecordCount>0) and (LastID<0) then
    begin
    old_order_id:=DST.FindField(KeyName).AsInteger;
    end
  end;

  try
    DST.Active:=False;
    DST.Active:=True;
    DST.Last;

    if (DST.RecordCount>0) and (old_order_id>=0) then
      begin
        DST.First;
        for i := 0 to DST.RecordCount - 1 do
        begin

        if (DST.RecNo=DST.RecordCount)
            or (DST.FindField(KeyName).AsInteger=old_order_id) then
           begin
             Break;
           end
        else
           DST.Next;

        end;
      end;
  except on E:Exception do
    ShowMessage('Ошибка обновления источника данных '''+DST.Name+'''.');
  end;

end;

procedure TMainForm.ReloadAll;
begin
  if CheckBox1.Checked then
    begin
      RGenOrdSearchIBQuery.ParamByName('complete').Value:=1;
      RGenOrdSearchIBQuery.ParamByName('complete2').Value:=1;
    end
  else
    begin
      RGenOrdSearchIBQuery.ParamByName('complete').Value:=0;
      RGenOrdSearchIBQuery.ParamByName('complete2').Value:=0;
    end;
  ReloadDataSet(RGenOrdSearchIBQuery,'ORDER_ID');
  ReloadDataSet(ItemsOfOrderIBTable,'ORDER_ITEM_ID');
  ReloadDataSet(WorksOfOrderIBTable,'WORK_ID');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  IBDatabase.Connected:=False;
  RvProject.ProjectFile:=GetCurrentDir+'\rep_gen.rav';
  IBDatabase.DatabaseName:=GetCurrentDir+'/../crm_wbg/CRMWBG.FDB';
  IBDatabase.Connected:=True;
  ReloadAll;
  //ShowMessage('Файл проекта: '+RvProject.ProjectFile+'.');
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  ReloadAll;
end;

end.
