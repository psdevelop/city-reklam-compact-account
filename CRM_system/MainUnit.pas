unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CategoryButtons, Menus, ComCtrls, Grids, DBGrids, DBConnectUnit,
  ButtonGroup, DBCtrls, StdCtrls, Mask, DBCGrids, ToolWin, ExtDlgs, DB, Location3DUnit,
  ShellAPI, Buttons, ValEdit;

type
  TMainForm = class(TForm)
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    PageControl1: TPageControl;
    ClientByTypeTabSheet: TTabSheet;
    TabSheet2: TTabSheet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ButtonGroup1: TButtonGroup;
    ButtonGroup2: TButtonGroup;
    GroupBox1: TGroupBox;
    DBLookupListBox1: TDBLookupListBox;
    GroupBox2: TGroupBox;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    N3: TMenuItem;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    LocationsTabSheet: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    MapScrollBox: TScrollBox;
    MapImage: TImage;
    ExmplShape: TShape;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    Splitter1: TSplitter;
    CategoryPanel3: TCategoryPanel;
    ButtonGroup3: TButtonGroup;
    DBGrid3: TDBGrid;
    GroupBox9: TGroupBox;
    NewReklLocDBLookup: TDBLookupListBox;
    DBLookupListBox3: TDBLookupListBox;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    DBGrid4: TDBGrid;
    DBGrid6: TDBGrid;
    GroupBox10: TGroupBox;
    DBLookupListBox4: TDBLookupListBox;
    N4: TMenuItem;
    N5: TMenuItem;
    LocationBalloonHint: TBalloonHint;
    Splitter4: TSplitter;
    OrderItemsImagePopupMenu: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    OrderItemOpenPictureDialog: TOpenPictureDialog;
    N8: TMenuItem;
    SavePictureDialog: TSavePictureDialog;
    GroupBox11: TGroupBox;
    OrderItemImage: TImage;
    SearchTabSheet: TTabSheet;
    Panel3: TPanel;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    Splitter5: TSplitter;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    Label8: TLabel;
    SearchLikeStrEdit: TEdit;
    LocationShapePopupMenu: TPopupMenu;
    N9: TMenuItem;
    Button1: TButton;
    DBGrid7: TDBGrid;
    DBGrid8: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    N10: TMenuItem;
    N3D1: TMenuItem;
    TabSheet1: TTabSheet;
    GroupBox16: TGroupBox;
    DBLookupListBox2: TDBLookupListBox;
    GroupBox17: TGroupBox;
    DBLookupListBox5: TDBLookupListBox;
    GroupBox18: TGroupBox;
    DBGrid9: TDBGrid;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    OrderItemDBImage: TDBImage;
    OrderItemsDBImagePopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PageControl4: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet8: TTabSheet;
    GroupBox8: TGroupBox;
    DBGrid5: TDBGrid;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    DBCtrlGrid2: TDBCtrlGrid;
    Splitter6: TSplitter;
    DBImage1: TDBImage;
    N3D2: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;

    procedure N3Click(Sender: TObject);
    procedure ExmplShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MapImageDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure MapImageDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ExmplShapeStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure FormCreate(Sender: TObject);
    procedure RepaintMap;
    procedure TabSheet4Show(Sender: TObject);
    procedure MapScrollBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure MapScrollBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
    function DelShapeOnMap: Boolean;
    procedure N5Click(Sender: TObject);
    procedure ButtonGroup2Items0Click(Sender: TObject);
    procedure ButtonGroup3Items0Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure OrderItemsImagePopupMenuPopup(Sender: TObject);
    procedure LoadCurrentOrderItemImage;
    procedure OrderItemImageDblClick(Sender: TObject);
    procedure ExmplShapeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N3D1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure N3D2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function GetFileSizeInKbs(FileName: string): Int64;
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  StartX, StartY, CurrentLocID: Integer;
  AppMouse: TMouse;
  ShapePointer: ^TShape;
  TempImgFilePath, CDP: Widestring;

implementation

{$R *.dfm}

uses InterfaceDMUnit;

function TMainForm.GetFileSizeInKbs(FileName: string): Int64;
var F: TMemoryStream;
begin
  try
    F:=TMemoryStream.Create;
    F.LoadFromFile(FileName);
    //ShowMessage(IntToStr(F.Size  div 1024));
    Result:=(F.Size  div 1024);
  finally
    F.Free;
  end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
  DBConnectDM.AddStandartPlaceByCurrentOrdType;
end;

procedure TMainForm.BitBtn2Click(Sender: TObject);
begin
  DBConnectDM.AddReklamPlacesToLocationFromStandart;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  DBConnectDM.SearchOrders(SearchLikeStrEdit.Text);
end;

procedure TMainForm.ButtonGroup2Items0Click(Sender: TObject);
begin
  ClientByTypeTabSheet.Show;
end;

procedure TMainForm.ButtonGroup3Items0Click(Sender: TObject);
begin
  LocationsTabSheet.Show;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CDP:=GetCurrentDir+'\CRM_system';
  AppMouse:=TMouse.Create;
  new(ShapePointer);
  TempImgFilePath:=GetCurrentDir+'\temp.bmp';
  OrderItemImage.Picture.LoadFromFile(CDP+'\images\img1.bmp');
end;

procedure TMainForm.FormDeactivate(Sender: TObject);
begin
  //DBConnectDM.IBTransaction.Commit;
  //DBConnectDM.IBDatabase.Connected:=False;
  //DBConnectDM.ActivateDeactIBConnection;
end;

procedure TMainForm.MapImageDragDrop(Sender, Source: TObject; X, Y: Integer);
var CPosX, CPosY: Integer;
begin
if Source is TShape then
  begin
  CPosX:=AppMouse.CursorPos.X;
  CPosY:=AppMouse.CursorPos.Y;
  if  MessageDlg('Переместить?',
        mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
    DBConnectDM.SetLocationCoords(
      (Source as TShape).Left+(CPosX-StartX)+
      MapScrollBox.HorzScrollBar.ScrollPos,
      (Source as TShape).Top+(CPosY-StartY)+
      MapScrollBox.VertScrollBar.ScrollPos,
      StrToInt((Source as TShape).HelpKeyword));
    RepaintMap;
    end;
  end;
end;

procedure TMainForm.MapImageDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
if Sender is TShape then
  Accept:=True;
end;

procedure TMainForm.MapScrollBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  //if Source is TShape then
  //begin
  //  (Source as TShape).Left:=(Source as TShape).Left+
  //    (AppMouse.CursorPos.X-StartX);
  //  (Source as TShape).Top:=(Source as TShape).Top+
  //    (AppMouse.CursorPos.Y-StartY);
  //end;
end;

procedure TMainForm.MapScrollBoxDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
 if Sender is TShape then
  Accept:=True;
end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
begin
  if OrderItemOpenPictureDialog.Execute then
    begin
      if GetFileSizeInKbs(OrderItemOpenPictureDialog.FileName)<=300 then
      begin
      DBConnectDM.LoadImageToDatabase(
        DBConnectDM.ItemsOfOrderIBTable.FieldByName('ORDER_ITEM_ID').AsInteger,
        OrderItemOpenPictureDialog.FileName);
      //ShowMessage(OrderItemOpenPictureDialog.FileName);
      OrderItemDBImage.Picture.LoadFromFile(OrderItemOpenPictureDialog.FileName);
      OrderItemDBImage.LoadPicture;
      //DBConnectDM.ItemsOfOrderIBTable.Post;
      NewReklLocDBLookup.SetFocus;
      end
      else
        ShowMessage('Размер файла превышает 300 килобайт!');
    end;
end;

procedure TMainForm.MenuItem2Click(Sender: TObject);
begin
  if SavePictureDialog.Execute then
    begin
      OrderItemDBImage.Picture.SaveToFile(SavePictureDialog.FileName);
    end;
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
begin
  OrderItemDBImage.CutToClipboard;
  DBConnectDM.ItemsOfOrderIBTable.Post;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
 DBConnectDM.ActivateDeactIBConnection;
end;

procedure TMainForm.N3D1Click(Sender: TObject);
begin
 //Location3DForm.Show;
end;

procedure TMainForm.N3D2Click(Sender: TObject);
begin
  Location3DForm.Show;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
  DBConnectDM.IBTransaction.Commit;
  DBConnectDM.IBDatabase.Connected:=False;
  DBConnectDM.ActivateDeactIBConnection;
  ShellExecute(Application.Handle, 'Open', PChar('ReportGenerator.exe'), nil, PChar(CDP+'/ReportGenerator/'), SW_SHOWNORMAL);
end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  if OrderItemOpenPictureDialog.Execute then
    begin
      if GetFileSizeInKbs(OrderItemOpenPictureDialog.FileName)<=300 then
      begin
      DBConnectDM.LoadImageToDatabase(
        DBConnectDM.ItemsOfOrderIBTable.FieldByName('ORDER_ITEM_ID').AsInteger,
        OrderItemOpenPictureDialog.FileName);
      //ShowMessage(OrderItemOpenPictureDialog.FileName);
      OrderItemImage.Picture.LoadFromFile(OrderItemOpenPictureDialog.FileName);
      NewReklLocDBLookup.SetFocus;
      end
      else
        ShowMessage('Размер файла превышает 300 килобайт!');
    end;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  if SavePictureDialog.Execute then
    begin
      OrderItemImage.Picture.SaveToFile(SavePictureDialog.FileName);
    end;
end;

procedure TMainForm.N9Click(Sender: TObject);
begin
  DBConnectDM.LookLocOrdersInSearch(CurrentLocID);
  SearchTabSheet.Show;
end;

procedure TMainForm.OrderItemImageDblClick(Sender: TObject);
begin
  LoadCurrentOrderItemImage;
end;

procedure TMainForm.OrderItemsImagePopupMenuPopup(Sender: TObject);
begin
  if DBConnectDM.ItemsOfOrderIBTable.RecordCount>0 then
   begin
    N6.Enabled:=True;
    N7.Enabled:=True;
    N8.Enabled:=True;
   end
  else
   begin
    N6.Enabled:=False;
    N7.Enabled:=False;
    N8.Enabled:=False;
   end;

end;

procedure TMainForm.ExmplShapeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then
  begin
  //BeginDrag(True,1);

  //MainForm.LocationBalloonHint.
  MainForm.LocationBalloonHint.Title:=
    (Sender as TShape).Hint;
  MainForm.LocationBalloonHint.Description:='';
  DBConnectDM.GetOrderItemsByLocID(StrToInt((Sender as TShape).HelpKeyword));
  CurrentLocID:=StrToInt((Sender as TShape).HelpKeyword);
  //ShowMessage(IntToStr(DBConnectDM.OrderItemByLocationIBQuery.RecordCount));
  if DBConnectDM.OrderItemByLocationIBQuery.RecordCount>0 then
    begin
      DBConnectDM.OrderItemByLocationIBQuery.First;
      //DBConnectDM.OrderItemByLocationIBQuery.
      while True do
        begin
          MainForm.LocationBalloonHint.Description:=
            MainForm.LocationBalloonHint.Description+
            DBConnectDM.OrderItemByLocationIBQuery.
            FieldByName('ORDER_ITEM_ADRESS').AsString+' '+
            DBConnectDM.OrderItemByLocationIBQuery.
            FieldByName('CUSTOMER_NAME').AsString+#13#10;
          if DBConnectDM.OrderItemByLocationIBQuery.RecNo>=
             DBConnectDM.OrderItemByLocationIBQuery.RecordCount then
               Break
          else
             DBConnectDM.OrderItemByLocationIBQuery.Next;
        end;
        MainForm.LocationBalloonHint.Description:=
            MainForm.LocationBalloonHint.Description+' '#13#10;
    end;
  //MainForm.LocationBalloonHint.Description:=
  //MainForm.LocationBalloonHint.
  MainForm.LocationBalloonHint.ShowHint;
 end;
 if Button=mbRight then
   begin
     LocationShapePopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
   end;
end;

procedure TMainForm.ExmplShapeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
   begin

   end;
end;

procedure TMainForm.ExmplShapeStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  //OrderItemsDBImage.Picture.
  StartX:=AppMouse.CursorPos.X;
  StartY:=AppMouse.CursorPos.Y;
end;

procedure TMainForm.TabSheet4Show(Sender: TObject);
begin
  RepaintMap;
end;

function TMainForm.DelShapeOnMap: Boolean;
var
  res: Boolean;
  i: Integer;
begin
 res:=False;
  for i := 0 to MapScrollBox.ControlCount - 1 do
        begin
         //ShowMessage(IntToStr(i));
         if (MapScrollBox.Controls[i] is TShape) then
         if (MapScrollBox.Controls[i] as TShape).Name<>'ExmplShape' then
          begin
            //ShowMessage('iiii'+IntToStr(MapScrollBox.ControlCount));
            MapScrollBox.RemoveControl(MapScrollBox.Controls[i]);
            res:=True;
            Break;
          end;
        end;
  Result:=res;
end;

procedure TMainForm.RepaintMap;
var
  i: Integer;
begin

  //ShowMessage(IntToStr(MapScrollBox.ControlCount));
  if MapScrollBox.ControlCount>0 then
      begin
        while DelShapeOnMap do;
      end;

 if DBConnectDM.LocationsIBTable.Active then
 begin
  DBConnectDM.LocationsIBTable.Refresh;
  if DBConnectDM.LocationsIBTable.RecordCount>0 then
    begin
      DBConnectDM.LocationsIBTable.First;
      while True do
        begin
          ;
          //ShowMessage(IntToStr(DBConnectDM.LocationsIBTable.RecNo));
          ShapePointer^:=(TShape.Create(nil));
          ShapePointer^.OnStartDrag:=ExmplShape.OnStartDrag;
          ShapePointer^.OnMouseDown:=ExmplShape.OnMouseDown;
          (ShapePointer^).Shape:=stCircle;
          ShapePointer^.OnMouseDown:=ExmplShape.OnMouseDown;
          (ShapePointer^).Brush.Color:=clRed;
          (ShapePointer^).DragMode:=dmAutomatic;
          (ShapePointer^).Hint:=
            DBConnectDM.LocationsIBTable.FindField('LOCATION_NAME').AsString;
          (ShapePointer^).HelpKeyword:=
            IntToStr(DBConnectDM.LocationsIBTable.FindField('LOCATION_ID').AsInteger);
          (ShapePointer^).ShowHint:=True;
          (ShapePointer^).Height:=
            DBConnectDM.LocationsIBTable.FindField('MARKER_SIZE').AsInteger;
          (ShapePointer^).Width:=
            DBConnectDM.LocationsIBTable.FindField('MARKER_SIZE').AsInteger;
          (ShapePointer^).Left:=
            DBConnectDM.LocationsIBTable.FindField('MARKER_XCOORD').AsInteger-
            MapScrollBox.HorzScrollBar.ScrollPos;
          (ShapePointer^).Top:=
            DBConnectDM.LocationsIBTable.FindField('MARKER_YCOORD').AsInteger-
            MapScrollBox.VertScrollBar.ScrollPos;
          //(ShapePointer^).Owner:=MapScrollBox;
          (ShapePointer^).Parent:= MapScrollBox;
          //MapScrollBox.InsertControl(ShapePointer^);
          //Shape1.
          //MapScrollBox.Controls.Create(ShapePointer^);
          //MapScrollBox.InsertComponent(ShapePointer^);
          ShapePointer^.BringToFront;
          if DBConnectDM.LocationsIBTable.RecNo=
            DBConnectDM.LocationsIBTable.RecordCount then
            Break
          else
            DBConnectDM.LocationsIBTable.Next;
        end;
    end;
 end;
 //dispose(ShapePointer);
end;

procedure TMainForm.LoadCurrentOrderItemImage;
begin
  if DBConnectDM.ItemsOfOrderIBTable.RecordCount>0 then
    begin
      (DBConnectDM.ItemsOfOrderIBTable.
        FieldByName('IMAGE_FILE') as TBlobField).SaveToFile(TempImgFilePath);
      OrderItemImage.Picture.LoadFromFile(TempImgFilePath);
    end;
end;

end.
