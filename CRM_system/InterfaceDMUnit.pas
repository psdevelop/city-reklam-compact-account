unit InterfaceDMUnit;

interface

uses
  SysUtils, Classes, Menus, ImgList, Controls;

type
  TInterfaceDM = class(TDataModule)
    ActiveOrdersPopupMenu: TPopupMenu;
    OrderItemsPopupMenu: TPopupMenu;
    BaseCommandImageList: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    OrderWorksPopupMenu: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    LocationsPopupMenu: TPopupMenu;
    RPlacesPopupMenu: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ClientsPopupMenu: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    N3D1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InterfaceDM: TInterfaceDM;

implementation

{$R *.dfm}

uses DBConnectUnit;

end.
