unit DBConnectUnit;

interface

uses
  SysUtils, Classes, DB, ADODB, IBDatabase, IBCustomDataSet, IBTable,
  Dialogs, IBSQL, IBStoredProc, ActnList, DBActns, Variants, RpCon, RpConDS,
  RpDefine, RpRave, IBQuery, RpBase, RpSystem, Controls;

type
  TDBConnectDM = class(TDataModule)
    ADOConnection: TADOConnection;
    ClientByTypeADOTable: TADOTable;
    ClientByTypeDS: TDataSource;
    PTypeListDS: TDataSource;
    PTypeListADOTable: TADOTable;
    OrderByClientADOTable: TADOTable;
    OrderByClientDS: TDataSource;
    ClientByTypeIBTable: TIBTable;
    IBDatabase: TIBDatabase;
    PTypeListIBTable: TIBTable;
    IBTransaction: TIBTransaction;
    OrderByClientIBTable: TIBTable;
    AddPersonByTypeIBSP: TIBStoredProc;
    AddOrderByPersonIBSP: TIBStoredProc;
    LocationsIBTable: TIBTable;
    LocationsDS: TDataSource;
    SetLocationCoordsIBSP: TIBStoredProc;
    PlacesOfLocationDS: TDataSource;
    PlacesOfLocationIBTable: TIBTable;
    AddReklamPlaceToLocationIBSP: TIBStoredProc;
    AddItemToOrderIBSP: TIBStoredProc;
    OrdersASC_IBDS2: TIBDataSet;
    ItemsOfOrderIBTable: TIBTable;
    OrderASC_DS: TDataSource;
    ItemsOfOrderDS: TDataSource;
    ActionList: TActionList;
    NewLocationDSI: TDataSetInsert;
    NewPersonTypeDSI: TDataSetInsert;
    RvProject: TRvProject;
    PriceAppPosRvDSC: TRvDataSetConnection;
    PriceAppRvDSC: TRvDataSetConnection;
    OrderTypesIBTable: TIBTable;
    OrderTypesDS: TDataSource;
    WorksOfOrderIBTable: TIBTable;
    WorksOfOrderDS: TDataSource;
    AddWorkToOrderIBSP: TIBStoredProc;
    AddLocationIBSP: TIBStoredProc;
    AddOrderTypeIBSP: TIBStoredProc;
    RecalcOrderItemIBSP: TIBStoredProc;
    RecalcOrderIBSP: TIBStoredProc;
    PriceAppWorksRvDSC: TRvDataSetConnection;
    OrdersASC_IBDS: TIBTable;
    RvSystem: TRvSystem;
    LoadImgToDBIBSQL: TIBSQL;
    OrderItemByLocationIBQuery: TIBQuery;
    OrderLikeSearchIBQuery: TIBQuery;
    OrderItemByLocationDS: TDataSource;
    OrderLikeSearchDS: TDataSource;
    LikeSearchOrderIBTable: TIBTable;
    LikeSearchOrderDS: TDataSource;
    SearchOrderOtherItemsIBTable: TIBTable;
    SearchOrderItemsDS: TDataSource;
    StPlaceIBTable: TIBTable;
    StPlaceDS: TDataSource;
    AddFromStandPlIBSP: TIBStoredProc;
    CompleteOrderIBSQL: TIBSQL;
    CompleteOrderItemIBSQL: TIBSQL;
    CompleteCurrentOrderAction: TAction;
    CompleteCurrentOrderItemAction: TAction;
    AddOrderAction: TAction;
    AddOrderItemAction: TAction;
    DelCurrentOrderAction: TAction;
    DelCurrentOrderItemAction: TAction;
    AddWorkAction: TAction;
    DelCurrentWorkAction: TAction;
    DelCurrClientAction: TAction;
    DelCurrentLocationAction: TAction;
    DelCurrentRPlaceAction: TAction;
    AddClientAction: TAction;
    AddLocationAction: TAction;
    AddRPlaceAction: TAction;
    AddStPlaceIBSP: TIBStoredProc;
    UpdStdCoordsIBSP: TIBStoredProc;
    UpdReklCoordsIBSP: TIBStoredProc;
    IncStXCAction: TAction;
    DescStXCAction: TAction;
    IncStYCAction: TAction;
    DescStYCAction: TAction;
    IncStZCAction: TAction;
    DescStZCAction: TAction;
    IncReklXCAction: TAction;
    DescReklXCAction: TAction;
    IncReklYCAction: TAction;
    DescReklYCAction: TAction;
    IncReklZCAction: TAction;
    DescReklZCAction: TAction;
    Show3DMaketAction: TAction;
    LocationByIDIBQuery: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure ItemsOfOrderIBTableAfterPost(DataSet: TDataSet);
    procedure ItemsOfOrderIBTableAfterEdit(DataSet: TDataSet);
    procedure WorksOfOrderIBTableAfterPost(DataSet: TDataSet);
    procedure CompleteCurrentOrderItemActionExecute(Sender: TObject);
    procedure CompleteCurrentOrderActionExecute(Sender: TObject);
    procedure DelCurrentOrderActionExecute(Sender: TObject);
    procedure DelCurrentOrderItemActionExecute(Sender: TObject);
    procedure AddOrderActionExecute(Sender: TObject);
    procedure AddOrderItemActionExecute(Sender: TObject);
    procedure AddWorkActionExecute(Sender: TObject);
    procedure DelCurrentWorkActionExecute(Sender: TObject);
    procedure DelCurrClientActionExecute(Sender: TObject);
    procedure DelCurrentLocationActionExecute(Sender: TObject);
    procedure DelCurrentRPlaceActionExecute(Sender: TObject);
    procedure AddLocationActionExecute(Sender: TObject);
    procedure AddRPlaceActionExecute(Sender: TObject);
    procedure AddClientActionExecute(Sender: TObject);
    procedure IncStXCActionExecute(Sender: TObject);
    procedure DescStXCActionExecute(Sender: TObject);
    procedure IncStYCActionExecute(Sender: TObject);
    procedure DescStYCActionExecute(Sender: TObject);
    procedure IncStZCActionExecute(Sender: TObject);
    procedure DescStZCActionExecute(Sender: TObject);
    procedure IncReklXCActionExecute(Sender: TObject);
    procedure DescReklXCActionExecute(Sender: TObject);
    procedure IncReklYCActionExecute(Sender: TObject);
    procedure DescReklYCActionExecute(Sender: TObject);
    procedure IncReklZCActionExecute(Sender: TObject);
    procedure DescReklZCActionExecute(Sender: TObject);
    procedure Show3DMaketActionExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ActivateDeactIBConnection;
    function AddPerson(PersonType_ID: Integer): Integer;
    procedure AddPersonToCurrentType;
    function AddOrder(Person_ID, OrderType_ID: Integer; RTYPE_NAME, CUSTOMER_NAME: string): Integer;
    procedure AddOrderToCurrentPerson;
    function AddOrderItem(Order_ID, Location_ID, ReklamPlace_ID: Integer; RPL_NAME: string): Integer;
    procedure AddOrderItemToCurrentOrder;
    function AddWork(Order_ID: Integer): Integer;
    procedure AddWorkToCurrentOrder;
    function AddReklamPlace(Location_ID: Integer; PlaceName: string): Integer;
    procedure AddReklamPlaceToLocation;
    procedure AddReklamPlacesToLocationFromStandart(LocationID: Integer = -1);
    function AddLocation: Integer;
    procedure SetLocationCoords(X,Y,Loc_ID: Integer);
    procedure ReloadOrderASC;
    //procedure ReloadItemsOfOrder;
    //procedure ReloadWorksOfOrder;
    procedure ReloadDataSet(DST: TDataSet; KeyName: string;
      LastID: Integer=-1);
    procedure GeneratePriceAppReport;
    procedure LoadImageToDatabase(ItemId: Integer; FilePath: Widestring);
    procedure GetOrderItemsByLocID(Location_ID: Integer);
    procedure SearchOrders(LikeStr: Widestring);
    procedure LookLocOrdersInSearch(Location_ID: Integer);
    procedure DeleteCurrentItemPosition;
    procedure DeleteCurrentWorkPosition;
    procedure DeleteCurrentOrder;
    procedure DeleteCurrentLocation;
    procedure DeleteCurrentReklamPlace;
    procedure CompleteOrder(ORDER_ID: Integer);
    procedure CompleteCurrentOrder;
    procedure CompleteOrderItem(ORDER_ITEM_ID: Integer);
    procedure CompleteCurrentOrderItem;
    procedure DeleteCurrentClient;
    procedure AddStandartPlaceByCurrentOrdType;
    procedure UpdateStandCoords(STAND_PLACE_ID: Integer; DELTA_X, DELTA_Y, DELTA_Z: Double);
    procedure UpdateReklamCoords(RPLACE_ID: Integer; DELTA_X, DELTA_Y, DELTA_Z: Double);
    procedure UpdateCurrStandCoords(DELTA_X, DELTA_Y, DELTA_Z: Double);
    procedure UpdateCurrReklamCoords(DELTA_X, DELTA_Y, DELTA_Z: Double);
    procedure GetCurrentLocationReklamItems(ShowMaketWindow: Boolean=False);
    function GetLocationNameByID(LocationID: Integer): String;
  end;

var
  DBConnectDM: TDBConnectDM;
  last_order_id, last_order_item_id: Integer;

implementation

{$R *.dfm}

uses InterfaceDMUnit, MainUnit, Location3DUnit;

function TDBConnectDM.GetLocationNameByID(LocationID: Integer): String;
var res: String;
begin
  res:='Нет наименования местоположения';
  try
    LocationByIDIBQuery.Active:=False;
    LocationByIDIBQuery.ParamByName('LOCATION_ID').Value:=
      LocationID;
    LocationByIDIBQuery.Active:=True;
    if LocationByIDIBQuery.RecordCount>0 then
      res:=LocationByIDIBQuery.FieldByName('LOCATION_NAME').AsString;
  except
    ShowMessage('Неудачное прохождение инструкции по выбору текущего местоположения!');
  end;
  Result:=res;
end;

procedure TDBConnectDM.ReloadOrderASC;
var
  old_order_id: Integer;
  i: Integer;
begin
if OrdersASC_IBDS.RecordCount>0 then
  begin
  old_order_id:=OrdersASC_IBDS.FindField('ORDER_ID').AsInteger;
  OrdersASC_IBDS.Refresh;
  OrdersASC_IBDS.First;
  for i := 0 to OrdersASC_IBDS.RecordCount - 1 do
    begin

      if (OrdersASC_IBDS.RecNo=OrdersASC_IBDS.RecordCount)
          or (OrdersASC_IBDS.FindField('ORDER_ID').AsInteger=old_order_id) then
          begin
            Break;
          end
       else
         OrdersASC_IBDS.Next;

    end;
  end;
end;

procedure TDBConnectDM.ReloadDataSet(DST: TDataSet; KeyName: string;
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

//procedure ReloadItemsOfOrder;
//procedure ReloadWorksOfOrder;

procedure TDBConnectDM.AddWorkActionExecute(Sender: TObject);
begin
  DBConnectDM.AddWorkToCurrentOrder;
end;

procedure TDBConnectDM.ActivateDeactIBConnection;
begin
  if IBDatabase.Connected then
   begin
     IBDatabase.Connected:=False;
   end
  else
   begin
     IBDatabase.Connected:=True;
     PTypeListIBTable.Active:=True;
     ClientByTypeIBTable.Active:=True;
     OrderByClientIBTable.Active:=True;
     LocationsIBTable.Active:=True;
     PlacesOfLocationIBTable.Active:=True;
     OrdersASC_IBDS.Active:=True;
     ItemsOfOrderIBTable.Active:=True;
     OrderTypesIBTable.Active:=True;
     WorksOfOrderIBTable.Active:=True;
     LikeSearchOrderIBTable.Active:=True;
     SearchOrderOtherItemsIBTable.Active:=True;
     StPlaceIBTable.Active:=True;
     StPlaceIBTable.Last;
   end;

end;

procedure TDBConnectDM.DataModuleCreate(Sender: TObject);
begin
 IBDatabase.Connected:=False;
 IBDatabase.DatabaseName:=
    GetCurrentDir+'\CRM_system\crm_wbg\CRMWBG.FDB';
 RvProject.ProjectFile:=GetCurrentDir+'\reports\base.rav';
end;

procedure TDBConnectDM.IncReklXCActionExecute(Sender: TObject);
begin
  UpdateCurrReklamCoords(0.01,0,0);
end;

procedure TDBConnectDM.IncReklYCActionExecute(Sender: TObject);
begin
  UpdateCurrReklamCoords(0,0.01,0);
end;

procedure TDBConnectDM.IncReklZCActionExecute(Sender: TObject);
begin
  UpdateCurrReklamCoords(0,0,0.01);
end;

procedure TDBConnectDM.IncStXCActionExecute(Sender: TObject);
begin
  UpdateCurrStandCoords(0.01,0,0);
end;

procedure TDBConnectDM.IncStYCActionExecute(Sender: TObject);
begin
  UpdateCurrStandCoords(0,0.01,0);
end;

procedure TDBConnectDM.IncStZCActionExecute(Sender: TObject);
begin
  UpdateCurrStandCoords(0,0,0.01);
end;

procedure TDBConnectDM.ItemsOfOrderIBTableAfterEdit(DataSet: TDataSet);
begin
  last_order_id:=ItemsOfOrderIBTable.FieldByName('ORDER_ID').AsInteger;
  last_order_item_id:=ItemsOfOrderIBTable.FieldByName('ORDER_ITEM_ID').AsInteger;
  //ShowMessage(IntToStr(last_order_id)+'ddd'+IntToStr(last_order_item_id));
end;

procedure TDBConnectDM.ItemsOfOrderIBTableAfterPost(DataSet: TDataSet);
begin
  //ShowMessage(IntToSTr(RecalcOrderIBSP.));
  RecalcOrderItemIBSP.ParamByName('ORDER_ITEM_ID').Value:=
    ItemsOfOrderIBTable.FieldByName('ORDER_ITEM_ID').AsInteger;
  RecalcOrderItemIBSP.ExecProc;
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
  DBConnectDM.ReloadDataSet(DBConnectDM.ItemsOfOrderIBTable,'ORDER_ITEM_ID');
end;

procedure TDBConnectDM.AddPersonToCurrentType;
begin
  if PTypeListIBTable.RecordCount>0 then
  begin
    AddPerson(PTypeListIBTable.FieldByName('PERSON_TYPE_ID').Value);
    ClientByTypeIBTable.Refresh;
    ClientByTypeIBTable.Last;
  end
  else
   ShowMessage('Нет выделенного типа!');

end;

function TDBConnectDM.AddPerson(PersonType_ID: Integer): Integer;
var
  res: Integer;
begin
 res:=-1;
 AddPersonByTypeIBSP.ParamByName('PERSON_TYPE_ID').Value:=
  PersonType_ID;
 try
  AddPersonByTypeIBSP.ExecProc;
  res:= AddPersonByTypeIBSP.ParamByName('PERSON_ID').Value;
 except
  ShowMessage('Неудачное выполнение удаленной процедуры добавления клиента по типу!');
 end;
 Result:=res;
end;

function TDBConnectDM.AddOrder(Person_ID, OrderType_ID: Integer; RTYPE_NAME, CUSTOMER_NAME: string): Integer;
var
  res: Integer;
begin
 res:=-1;
 AddOrderByPersonIBSP.ParamByName('PERSON_ID').Value:=
  Person_ID;
 AddOrderByPersonIBSP.ParamByName('ORDER_TYPE_ID').Value:=
  OrderType_ID;
  AddOrderByPersonIBSP.ParamByName('RTYPE_NAME').Value:=
  RTYPE_NAME;
  AddOrderByPersonIBSP.ParamByName('CUSTOMER_NAME').Value:=
  CUSTOMER_NAME;
 try
  AddOrderByPersonIBSP.ExecProc;
  res:= AddOrderByPersonIBSP.ParamByName('ORDER_ID').Value;
 except
  ShowMessage('Неудачное выполнение удаленной процедуры добавления заказа клиента!');
 end;
 Result:=res;
end;

procedure TDBConnectDM.AddOrderActionExecute(Sender: TObject);
begin
  DBConnectDM.AddOrderToCurrentPerson;
end;

procedure TDBConnectDM.AddOrderToCurrentPerson;
var ShortName, ShortSurname: string;
    PShortName, PShortSurname: array[0..255] of Char;
begin
 if DBConnectDM.OrderTypesIBTable.RecordCount>0 then
 begin
  if ClientByTypeIBTable.RecordCount>0 then
  begin

    ShortName:=ClientByTypeIBTable.FieldByName('NAME').AsString;
    ShortSurname:=ClientByTypeIBTable.FieldByName('SURNAME').AsString;
    StrPCopy(PShortName,ShortName);
    StrPCopy(PShortSurname,ShortSurname);
    ShortName:=StrLCopy(PShortName,PShortName,1);
    ShortSurname:=StrLCopy(PShortSurname,PShortSurname,1);

    AddOrder(ClientByTypeIBTable.FieldByName('PERSON_ID').AsInteger,
             OrderTypesIBTable.FieldByName('ORDER_TYPE_ID').AsInteger,
             OrderTypesIBTable.FieldByName('ORDER_TYPE_NAME').AsString,
             ClientByTypeIBTable.FieldByName('FAMILY').AsString+' '+
             ShortName+'.'+ShortSurname+'.');
    OrderByClientIBTable.Refresh;
    OrderByClientIBTable.Last;
    DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
    DBConnectDM.OrdersASC_IBDS.Last;
  end
  else
   ShowMessage('Нет выделенного клиента!');
 end
   else
   ShowMessage('Нет ни одного типа заказов!');
end;

procedure TDBConnectDM.AddStandartPlaceByCurrentOrdType;
begin
  if DBConnectDM.OrderTypesIBTable.RecordCount>0 then
    begin
      AddStPlaceIBSP.ParamByName('ORDER_TYPE_ID').Value:=
        OrderTypesIBTable.FieldByName('ORDER_TYPE_ID').AsInteger;
      try
        AddStPlaceIBSP.ExecProc;
        DBConnectDM.ReloadDataSet(DBConnectDM.StPlaceIBTable,'STAND_PLACE_ID');
      except
        ShowMessage('Неудачное выполнение процедуры добавления стандартного размещения рекламы!');
      end;
    end
  else
    ShowMessage('Нет выделенного типа заказа!');
end;

procedure TDBConnectDM.SetLocationCoords(X,Y,Loc_ID: Integer);
begin
 SetLocationCoordsIBSP.ParamByName('XCOORD').Value:=X;
 SetLocationCoordsIBSP.ParamByName('YCOORD').Value:=Y;
 SetLocationCoordsIBSP.ParamByName('LOCATION_ID').Value:=Loc_ID;
 try
  SetLocationCoordsIBSP.ExecProc;
 except
  ShowMessage('Неудачное выполнение удаленной процедуры установки координат местоположения!');
 end;
end;

procedure TDBConnectDM.Show3DMaketActionExecute(Sender: TObject);
begin
  GetCurrentLocationReklamItems(True);
end;

procedure TDBConnectDM.WorksOfOrderIBTableAfterPost(DataSet: TDataSet);
begin
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
end;

function TDBConnectDM.AddOrderItem(Order_ID, Location_ID, ReklamPlace_ID: Integer; RPL_NAME: string): Integer;
var
  res: Integer;
begin
 AddItemToOrderIBSP.ParamByName('ORDER_ID').Value:=Order_ID;
 AddItemToOrderIBSP.ParamByName('REKLAM_PLACE_ID').Value:=ReklamPlace_ID;
 AddItemToOrderIBSP.ParamByName('LOCATION_ID').Value:=Location_ID;
 AddItemToOrderIBSP.ParamByName('ORDER_ITEM_ADRESS').Value:=RPL_NAME;
 try
  AddItemToOrderIBSP.ExecProc;
  res:= AddItemToOrderIBSP.ParamByName('ORDER_ITEM_ID').Value;
 except
  ShowMessage('Неудачное выполнение удаленной процедуры добавления позиции заказа!');
 end;
 Result:=res;
end;

procedure TDBConnectDM.AddOrderItemActionExecute(Sender: TObject);
begin
  DBConnectDM.AddOrderItemToCurrentOrder;
end;

procedure TDBConnectDM.AddOrderItemToCurrentOrder;
begin
if OrdersASC_IBDS.RecordCount>0 then
  begin
   if LocationsIBTable.RecordCount>0 then
    begin
    if PlacesOfLocationIBTable.RecordCount>0 then
    begin
     if PlacesOfLocationIBTable.RecordCount>0 then
      AddOrderItem(OrdersASC_IBDS.FieldByName('ORDER_ID').AsInteger,
        LocationsIBTable.FieldByName('LOCATION_ID').AsInteger,
        PlacesOfLocationIBTable.FieldByName('RPLACE_ID').AsInteger,
        LocationsIBTable.FieldByName('LOCATION_NAME').AsString+'  '+
        PlacesOfLocationIBTable.FieldByName('REKLAM_PLACE_NAME').AsString)
      else
        AddOrderItem(OrdersASC_IBDS.FieldByName('ORDER_ID').Value,
        LocationsIBTable.FieldByName('LOCATION_ID').Value,
        NULL,
        LocationsIBTable.FieldByName('LOCATION_NAME').AsString);
        DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
        DBConnectDM.ReloadDataSet(DBConnectDM.ItemsOfOrderIBTable,'ORDER_ITEM_ID');
      end
      else
        ShowMessage('Нет выделенного рекламного места на местоположении');
    end
    else
     ShowMessage('Нет выделенного местоположения!');
  end
  else
   ShowMessage('Нет выделенного заказа!');
end;

function TDBConnectDM.AddWork(Order_ID: Integer): Integer;
var
  res: Integer;
begin
 AddWorkToOrderIBSP.ParamByName('ORDER_ID').Value:=Order_ID;
 try
  AddWorkToOrderIBSP.ExecProc;
  res:= AddWorkToOrderIBSP.ParamByName('WORK_ID').Value;
 except
  ShowMessage('Неудачное выполнение удаленной процедуры добавления работы заказа!');
 end;
 Result:=res;
end;

procedure TDBConnectDM.AddWorkToCurrentOrder;
begin
if OrdersASC_IBDS.RecordCount>0 then
  begin
    AddWork(OrdersASC_IBDS.FieldByName('ORDER_ID').AsInteger);
    DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
    DBConnectDM.ReloadDataSet(DBConnectDM.WorksOfOrderIBTable,'WORK_ID');
  end
  else
   ShowMessage('Нет выделенного заказа!');
end;

function TDBConnectDM.AddReklamPlace(Location_ID: Integer; PlaceName: string): Integer;
var
  res: Integer;
begin
 res:=-1;
 AddReklamPlaceToLocationIBSP.ParamByName('REKLAM_PLACE_NAME').Value:=
  PlaceName;
 AddReklamPlaceToLocationIBSP.ParamByName('LOCATION_ID').Value:=
  Location_ID;
 try
  AddReklamPlaceToLocationIBSP.ExecProc;
  res:= AddReklamPlaceToLocationIBSP.ParamByName('REKLAM_PLACE_ID').Value;
 except
  ShowMessage('Неудачное выполнение удаленной процедуры добавления рекламной позиции!');
 end;
 Result:=res;
end;

procedure TDBConnectDM.AddReklamPlaceToLocation;
begin
  if LocationsIBTable.RecordCount>0 then
  begin
    AddReklamPlace(LocationsIBTable.FieldByName('LOCATION_ID').Value,'Новое рекламное место');
    PlacesOfLocationIBTable.Refresh;
    PlacesOfLocationIBTable.Last;
  end
  else
   ShowMessage('Нет выделенного местоположения!');
end;

procedure TDBConnectDM.AddRPlaceActionExecute(Sender: TObject);
begin
  DBConnectDM.AddReklamPlaceToLocation;
end;

procedure TDBConnectDM.AddReklamPlacesToLocationFromStandart(LocationID: Integer = -1);
begin
  if LocationsIBTable.RecordCount>0 then
  begin
    if StPlaceIBTable.RecordCount>0 then
      begin
        //dReklamPlace(LocationsIBTable.FieldByName('LOCATION_ID').Value,'Новое рекламное место');
        //PlacesOfLocationIBTable.Refresh;
        //PlacesOfLocationIBTable.Last;
       StPlaceIBTable.First;
       while True do
       begin
       //ShowMessage(IntToStr(StPlaceIBTable.RecNo)+
       //  StPlaceIBTable.FieldByName('STAND_PLACE_NAME').Value+
       //  IntToStr(StPlaceIBTable.RecordCount));
       try
        if (LocationID=-1) then
          AddFromStandPlIBSP.ParamByName('LOCATION_ID').Value:=
            LocationsIBTable.FieldByName('LOCATION_ID').Value
        else
          AddFromStandPlIBSP.ParamByName('LOCATION_ID').Value:=
            LocationID;
        AddFromStandPlIBSP.ParamByName('REKLAM_PLACE_NAME').Value:=
          StPlaceIBTable.FieldByName('STAND_PLACE_NAME').Value;
        AddFromStandPlIBSP.ParamByName('STX').Value:=
          StPlaceIBTable.FieldByName('START_X_COORD').Value;
        AddFromStandPlIBSP.ParamByName('STY').Value:=
          StPlaceIBTable.FieldByName('START_Y_COORD').Value;
        AddFromStandPlIBSP.ParamByName('STZ').Value:=
          StPlaceIBTable.FieldByName('START_Z_COORD').Value;
        AddFromStandPlIBSP.ParamByName('ENX').Value:=
          StPlaceIBTable.FieldByName('END_X_COORD').Value;
        AddFromStandPlIBSP.ParamByName('ENY').Value:=
          StPlaceIBTable.FieldByName('END_Y_COORD').Value;
        AddFromStandPlIBSP.ParamByName('ENZ').Value:=
          StPlaceIBTable.FieldByName('END_Z_COORD').Value;
        AddFromStandPlIBSP.ExecProc;
       except
         ShowMessage('Неудачный перенос одного из стандартных расположений на эскизе!');
       end;
         if StPlaceIBTable.RecNo>=StPlaceIBTable.RecordCount then
           Break
         else
           StPlaceIBTable.Next;
       end;
       PlacesOfLocationIBTable.Refresh;
       PlacesOfLocationIBTable.Last;
      end
    else
   ShowMessage('Нет стандартных расположений для эскиза на данном виде рекламы!');
  end
  else
   ShowMessage('Нет выделенного местоположения!');
end;

procedure TDBConnectDM.GetCurrentLocationReklamItems(ShowMaketWindow: Boolean=False);
begin
  if LocationsIBTable.RecordCount>0 then
  begin
    if (ShowMaketWindow) then
      begin
        Location3DForm.Show;
      end;
    if Location3DForm.Visible then
      begin
        DBConnectDM.GetOrderItemsByLocID(
          LocationsIBTable.FieldByName('LOCATION_ID').Value);
        Location3DForm.Repaint;
      end;
  end
  else
   ShowMessage('Нет выделенного местоположения!');
end;

procedure TDBConnectDM.AddClientActionExecute(Sender: TObject);
begin
  DBConnectDM.AddPersonToCurrentType;
end;

function TDBConnectDM.AddLocation: Integer;
var
  res: Integer;
begin
 res:=-1;
 if OrderTypesIBTable.RecordCount>0 then
  begin
    try
      AddLocationIBSP.ParamByName('ORDER_TYPE_ID').Value:=
        OrderTypesIBTable.FindField('ORDER_TYPE_ID').Value;
      AddLocationIBSP.ExecProc;
      res:= AddLocationIBSP.ParamByName('LOCATION_ID').Value;
      DBConnectDM.ReloadDataSet(DBConnectDM.LocationsIBTable,'LOCATION_ID');
      AddReklamPlacesToLocationFromStandart(res);
    except
      ShowMessage('Неудачное выполнение удаленной процедуры добавления местоположения!');
    end;
  end
  else
   ShowMessage('Нет выделенного типа заказов (рекламы)!');
 Result:=res;
end;

procedure TDBConnectDM.AddLocationActionExecute(Sender: TObject);
begin
  DBConnectDM.AddLocation;
end;

procedure TDBConnectDM.GeneratePriceAppReport;
begin
  if DBConnectDM.OrdersASC_IBDS.RecordCount>0 then
    begin
      RecalcOrderIBSP.ParamByName('ORDER_ID').Value:=
         OrdersASC_IBDS.FieldByName('ORDER_ID').AsInteger;
      RecalcOrderIBSP.ExecProc;
      DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
      RvProject.SelectReport('OrderSummReport',False);
      RvProject.SetParam('DOC_NO',
        DBConnectDM.OrdersASC_IBDS.FieldByName('DOC_NO').AsString);
      RvProject.SetParam('DOC_DATE',
        DateToStr(DBConnectDM.OrdersASC_IBDS.FieldByName('DOC_DATE').AsDateTime));
      RvProject.SetParam('RTYPE_NAME',
        DBConnectDM.OrdersASC_IBDS.FieldByName('RTYPE_NAME').AsString);
      RvProject.SetParam('RPOS_COUNT',
        DBConnectDM.OrdersASC_IBDS.FieldByName('ITEMS_COUNT').AsString);
      RvProject.SetParam('REKLAM_SUMM',
        FloatToStr(DBConnectDM.OrdersASC_IBDS.FieldByName('REKLAM_SUMM').AsFloat));
      RvProject.SetParam('WORK_SUMM',
        FloatToStr(DBConnectDM.OrdersASC_IBDS.FieldByName('WORK_SUMM').AsFloat));
      RvProject.SetParam('ALL_SUMM',
        FloatToStr(DBConnectDM.OrdersASC_IBDS.FieldByName('SUMM').AsFloat));
      RvProject.SetParam('CUSTOMER_NAME',
        DBConnectDM.OrdersASC_IBDS.FieldByName('CUSTOMER_NAME').AsString);
      RvProject.ExecuteReport('OrderSummReport');
    end
   else
     ShowMessage('Нет выделенного заказа!');
end;

procedure TDBConnectDM.LoadImageToDatabase(ItemId: Integer; FilePath: Widestring);
begin
  try
      LoadImgToDBIBSQL.ParamByName('img').LoadFromFile(FilePath);
      LoadImgToDBIBSQL.ParamByName('oi_id').Value:=ItemId;
      LoadImgToDBIBSQL.ExecQuery;
      DBConnectDM.ReloadDataSet(DBConnectDM.ItemsOfOrderIBTable,'ORDER_ITEM_ID');
      except
       ShowMessage('Неудачное добавление графических данных к базе!');
     end;
end;

procedure TDBConnectDM.GetOrderItemsByLocID(Location_ID: Integer);
begin
 try
  OrderItemByLocationIBQuery.ParamByName('loc_id').Value:=
    Location_ID;
  //ShowMessage(IntToStr(Location_ID));
  OrderItemByLocationIBQuery.Active:=False;
  OrderItemByLocationIBQuery.Active:=True;
  //OrderItemByLocationIBQuery.ExecSQL;
  OrderItemByLocationIBQuery.Last;
 except
   ShowMessage('Ошибка выполнения запроса поиска позиций заказов по местоположению!');
 end;
end;

procedure TDBConnectDM.SearchOrders(LikeStr: Widestring);
begin
 try
  OrderLikeSearchIBQuery.SQL.Text:=
    'SELECT * FROM ORDERS, ORDER_ITEM WHERE ((CUSTOMER_NAME LIKE ''%'+
    LikeStr+'%'') OR (ORDER_ITEM_ADRESS LIKE ''%'+LikeStr+
    '%'')) AND (ORDERS.ORDER_ID=ORDER_ITEM.ORDER_ID)';
  OrderLikeSearchIBQuery.Active:=False;
  OrderLikeSearchIBQuery.Active:=True;
  OrderLikeSearchIBQuery.Last;
 except
   ShowMessage('Ошибка выполнения запроса поиска позиций заказов по вхождению строки!');
 end;
end;

procedure TDBConnectDM.LookLocOrdersInSearch(Location_ID: Integer);
begin
  try
  OrderLikeSearchIBQuery.SQL.Text:=
    'select *  from ORDER_ITEM oi, ORDERS ord '+
    'where oi.LOCATION_ID='+IntToStr(Location_ID)+
    ' AND oi.ORDER_ID=ord.ORDER_ID and ord.COMPLETE=0 and oi.COMPLETE=0';
  OrderLikeSearchIBQuery.Active:=False;
  OrderLikeSearchIBQuery.Active:=True;
  OrderLikeSearchIBQuery.Last;
 except
   ShowMessage('Ошибка выполнения запроса поиска позиций заказов по местоположению!');
 end;
end;

procedure TDBConnectDM.DelCurrClientActionExecute(Sender: TObject);
begin
if  MessageDlg('Удалить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            DBConnectDM.DeleteCurrentClient;
          end;
end;

procedure TDBConnectDM.DelCurrentLocationActionExecute(Sender: TObject);
begin
if  MessageDlg('Удалить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            DBConnectDM.DeleteCurrentLocation;
          end;
end;

procedure TDBConnectDM.DelCurrentOrderActionExecute(Sender: TObject);
begin
if  MessageDlg('Удалить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            DeleteCurrentOrder;
          end;
end;

procedure TDBConnectDM.DelCurrentOrderItemActionExecute(Sender: TObject);
begin
if  MessageDlg('Удалить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            DeleteCurrentItemPosition;
          end;
end;

procedure TDBConnectDM.DelCurrentRPlaceActionExecute(Sender: TObject);
begin
if  MessageDlg('Удалить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            DBConnectDM.DeleteCurrentReklamPlace;
          end;
end;

procedure TDBConnectDM.DelCurrentWorkActionExecute(Sender: TObject);
begin
if  MessageDlg('Удалить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            DBConnectDM.DeleteCurrentWorkPosition;
          end;
end;

procedure TDBConnectDM.DeleteCurrentItemPosition;
begin
if ItemsOfOrderIBTable.RecordCount>0 then
 begin
  try
    ItemsOfOrderIBTable.Delete;
  except on E:Exception do
    ShowMessage('Неудачное удаление позиции заказа!');
  end;
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
  DBConnectDM.ReloadDataSet(DBConnectDM.ItemsOfOrderIBTable,'ORDER_ITEM_ID');
 end
else
  ShowMessage('Нет выделенной позиции заказа!');
end;

procedure TDBConnectDM.DeleteCurrentWorkPosition;
begin
if WorksOfOrderIBTable.RecordCount>0 then
 begin
  try
    WorksOfOrderIBTable.Delete;
  except on E:Exception do
    ShowMessage('Неудачное удаление позиции работы заказа!');
  end;
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
  DBConnectDM.ReloadDataSet(DBConnectDM.WorksOfOrderIBTable,'WORK_ID');
 end
else
  ShowMessage('Нет выделенной позиции работы заказа!');
end;

procedure TDBConnectDM.DescReklXCActionExecute(Sender: TObject);
begin
  UpdateCurrReklamCoords(-0.01,0,0);
end;

procedure TDBConnectDM.DescReklYCActionExecute(Sender: TObject);
begin
  UpdateCurrReklamCoords(0,-0.01,0);
end;

procedure TDBConnectDM.DescReklZCActionExecute(Sender: TObject);
begin
  UpdateCurrReklamCoords(0,0,-0.01);
end;

procedure TDBConnectDM.DescStXCActionExecute(Sender: TObject);
begin
  UpdateCurrStandCoords(-0.01,0,0);
end;

procedure TDBConnectDM.DescStYCActionExecute(Sender: TObject);
begin
  UpdateCurrStandCoords(0,-0.01,0);
end;

procedure TDBConnectDM.DescStZCActionExecute(Sender: TObject);
begin
  UpdateCurrStandCoords(0,0,-0.01);
end;

procedure TDBConnectDM.DeleteCurrentOrder;
begin
if OrdersASC_IBDS.RecordCount>0 then
 begin
  try
    OrdersASC_IBDS.Delete;
  except on E:Exception do
    ShowMessage('Неудачное удаление заказа!');
  end;
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
 end
else
  ShowMessage('Нет выделенного заказа!');
end;

procedure TDBConnectDM.DeleteCurrentClient;
begin
if ClientByTypeIBTable.RecordCount>0 then
 begin
  try
    ClientByTypeIBTable.Delete;
  except on E:Exception do
    ShowMessage('Неудачное удаление клиента!');
  end;
  DBConnectDM.ReloadDataSet(DBConnectDM.ClientByTypeIBTable,'PERSON_ID');
 end
else
  ShowMessage('Нет выделенного клиента!');
end;

procedure TDBConnectDM.CompleteOrder(ORDER_ID: Integer);
begin
  try
    CompleteOrderIBSQL.ParamByName('order_id').Value:=
      ORDER_ID;
    CompleteOrderIBSQL.ExecQuery;
  except on E:Exception do
    ShowMessage('Неудачное удаление заказа!');
  end;

end;

procedure TDBConnectDM.CompleteCurrentOrder;
begin
if OrdersASC_IBDS.RecordCount>0 then
 begin
  CompleteOrder(OrdersASC_IBDS.FieldByName('ORDER_ID').AsInteger);
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
  DBConnectDM.ReloadDataSet(OrderByClientIBTable,'ORDER_ID');
 end
else
  ShowMessage('Нет выделенного заказа!');
end;

procedure TDBConnectDM.CompleteCurrentOrderActionExecute(Sender: TObject);
begin
if  MessageDlg('Пометить как выполненный?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            CompleteCurrentOrder;
          end;
end;

procedure TDBConnectDM.CompleteOrderItem(ORDER_ITEM_ID: Integer);
begin
  try
    CompleteOrderItemIBSQL.ParamByName('order_item_id').Value:=
      ORDER_ITEM_ID;
    CompleteOrderItemIBSQL.ExecQuery;
  except on E:Exception do
    ShowMessage('Неудачное удаление позиции заказа!');
  end;

end;

procedure TDBConnectDM.CompleteCurrentOrderItem;
begin
if ItemsOfOrderIBTable.RecordCount>0 then
 begin
  CompleteOrderItem(ItemsOfOrderIBTable.FieldByName('ORDER_ITEM_ID').AsInteger);
  DBConnectDM.ReloadDataSet(DBConnectDM.OrdersASC_IBDS,'ORDER_ID');
  DBConnectDM.ReloadDataSet(DBConnectDM.ItemsOfOrderIBTable,'ORDER_ITEM_ID');
 end
else
  ShowMessage('Нет выделенной позиции заказа!');
end;

procedure TDBConnectDM.CompleteCurrentOrderItemActionExecute(Sender: TObject);
begin
if  MessageDlg('Пометить как выполненное?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            CompleteCurrentOrderItem;
          end;
end;

procedure TDBConnectDM.DeleteCurrentLocation;
begin
if LocationsIBTable.RecordCount>0 then
 begin
  try
    LocationsIBTable.Delete;
  except on E:Exception do
    ShowMessage('Неудачное удаление местоположения!');
  end;
  DBConnectDM.ReloadDataSet(DBConnectDM.LocationsIBTable,'LOCATION_ID');
 end
else
  ShowMessage('Нет выделенного местоположения!');
end;

procedure TDBConnectDM.DeleteCurrentReklamPlace;
begin
if PlacesOfLocationIBTable.RecordCount>0 then
 begin
  try
    PlacesOfLocationIBTable.Delete;
  except on E:Exception do
    ShowMessage('Неудачное удаление рекламного места!');
  end;
  DBConnectDM.ReloadDataSet(DBConnectDM.PlacesOfLocationIBTable,'RPLACE_ID');
 end
else
  ShowMessage('Нет выделенного рекламного места!');
end;

procedure TDBConnectDM.UpdateStandCoords(STAND_PLACE_ID: Integer; DELTA_X, DELTA_Y, DELTA_Z: Double);
begin
  try
    UpdStdCoordsIBSP.ParamByName('STAND_PLACE_ID').Value:=STAND_PLACE_ID;
    UpdStdCoordsIBSP.ParamByName('DELTA_X').Value:=DELTA_X;
    UpdStdCoordsIBSP.ParamByName('DELTA_Y').Value:=DELTA_Y;
    UpdStdCoordsIBSP.ParamByName('DELTA_Z').Value:=DELTA_Z;
    UpdStdCoordsIBSP.ExecProc;
  except
    ShowMessage('Неудачное изменение стандартных координат размещения!');
  end;
end;

procedure TDBConnectDM.UpdateReklamCoords(RPLACE_ID: Integer; DELTA_X, DELTA_Y, DELTA_Z: Double);
begin
  try
    UpdReklCoordsIBSP.ParamByName('RPLACE_ID').Value:=RPLACE_ID;
    UpdReklCoordsIBSP.ParamByName('DELTA_X').Value:=DELTA_X;
    UpdReklCoordsIBSP.ParamByName('DELTA_Y').Value:=DELTA_Y;
    UpdReklCoordsIBSP.ParamByName('DELTA_Z').Value:=DELTA_Z;
    UpdReklCoordsIBSP.ExecProc;
  except
    ShowMessage('Неудачное изменение рекламных координат размещения!');
  end;
end;

procedure TDBConnectDM.UpdateCurrStandCoords(DELTA_X, DELTA_Y, DELTA_Z: Double);
begin
if StPlaceIBTable.RecordCount>0 then
 begin
    UpdateStandCoords(StPlaceIBTable.FindField('STAND_PLACE_ID').AsInteger,
      DELTA_X, DELTA_Y, DELTA_Z);
    ReloadDataSet(StPlaceIBTable, 'STAND_PLACE_ID');
 end
else
  ShowMessage('Нет выделенного стандартного рекламного места!');
end;

procedure TDBConnectDM.UpdateCurrReklamCoords(DELTA_X, DELTA_Y, DELTA_Z: Double);
begin
if PlacesOfLocationIBTable.RecordCount>0 then
 begin
   GetCurrentLocationReklamItems;
   UpdateReklamCoords(PlacesOfLocationIBTable.FindField('RPLACE_ID').AsInteger,
      DELTA_X, DELTA_Y, DELTA_Z);
   ReloadDataSet(PlacesOfLocationIBTable, 'RPLACE_ID');
 end
else
  ShowMessage('Нет выделенного рекламного места!');
end;

end.
