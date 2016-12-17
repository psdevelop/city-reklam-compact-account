object DBConnectDM: TDBConnectDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 767
  Width = 589
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 48
    Top = 24
  end
  object ClientByTypeADOTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'PERSON_TYPE_ID'
    MasterFields = 'PERSON_TYPE_ID'
    MasterSource = PTypeListDS
    TableName = 'PERSON'
    Left = 48
    Top = 120
  end
  object ClientByTypeDS: TDataSource
    DataSet = ClientByTypeIBTable
    Left = 512
    Top = 64
  end
  object PTypeListDS: TDataSource
    DataSet = PTypeListIBTable
    Left = 512
    Top = 24
  end
  object PTypeListADOTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'PERSON_TYPE'
    Left = 48
    Top = 72
  end
  object OrderByClientADOTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    TableName = 'ORDER'
    Left = 48
    Top = 168
  end
  object OrderByClientDS: TDataSource
    DataSet = OrderByClientIBTable
    Left = 512
    Top = 112
  end
  object ClientByTypeIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'PERSON_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FAMILY'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'SURNAME'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'PERSON_TYPE_ID'
        DataType = ftInteger
      end
      item
        Name = 'PHONES'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ADRESS'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 700
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'PERSON_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_PERSON'
        Fields = 'PERSON_TYPE_ID'
      end>
    IndexFieldNames = 'PERSON_TYPE_ID'
    MasterFields = 'PERSON_TYPE_ID'
    MasterSource = PTypeListDS
    StoreDefs = True
    TableName = 'PERSON'
    Left = 168
    Top = 120
  end
  object IBDatabase: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 168
    Top = 24
  end
  object PTypeListIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'PERSON_TYPE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PERSON_TYPE_NAME'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'PERSON_TYPE_ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'PERSON_TYPE'
    Left = 168
    Top = 72
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase
    Left = 312
    Top = 24
  end
  object OrderByClientIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'ORDER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORDER_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ORDER_START'
        DataType = ftDateTime
      end
      item
        Name = 'ORDER_END'
        DataType = ftDateTime
      end
      item
        Name = 'PERSON_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORDER_ADD_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'SUMM'
        DataType = ftFloat
      end
      item
        Name = 'ITEMS_COUNT'
        DataType = ftInteger
      end
      item
        Name = 'ORDERS_TYPE_ID'
        DataType = ftInteger
      end
      item
        Name = 'DOC_NO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DOC_DATE'
        DataType = ftDate
      end
      item
        Name = 'RTYPE_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CUSTOMER_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'REKLAM_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'WORK_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'COMPLETE'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'ORDER_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_ORDER_NEW'
        Fields = 'PERSON_ID'
      end>
    IndexFieldNames = 'PERSON_ID'
    MasterFields = 'PERSON_ID'
    MasterSource = ClientByTypeDS
    StoreDefs = True
    TableName = 'ORDERS'
    Left = 168
    Top = 168
  end
  object AddPersonByTypeIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_PERSON_BY_TYPE_SP'
    Left = 168
    Top = 216
  end
  object AddOrderByPersonIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_ORDER_BY_PERSON_SP'
    Left = 168
    Top = 264
  end
  object LocationsIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'LOCATION_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LOCATION_NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'MARKER_SIZE'
        DataType = ftInteger
      end
      item
        Name = 'MARKER_XCOORD'
        DataType = ftSmallint
      end
      item
        Name = 'MARKER_YCOORD'
        DataType = ftSmallint
      end
      item
        Name = 'LOCATIONS_ADRESS'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ORDER_TYPE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY6'
        Fields = 'LOCATION_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_LOCATIONS'
        Fields = 'ORDER_TYPE_ID'
      end>
    IndexFieldNames = 'ORDER_TYPE_ID'
    MasterFields = 'ORDER_TYPE_ID'
    MasterSource = OrderTypesDS
    StoreDefs = True
    TableName = 'LOCATIONS'
    Left = 312
    Top = 72
  end
  object LocationsDS: TDataSource
    DataSet = LocationsIBTable
    Left = 512
    Top = 160
  end
  object SetLocationCoordsIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'SET_LOCATION_COORDS'
    Left = 168
    Top = 312
  end
  object PlacesOfLocationDS: TDataSource
    DataSet = PlacesOfLocationIBTable
    Left = 512
    Top = 208
  end
  object PlacesOfLocationIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'RPLACE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'REKLAM_PLACE_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOCATION_ID'
        DataType = ftInteger
      end
      item
        Name = 'MARKER_SIZE'
        DataType = ftInteger
      end
      item
        Name = 'MARKER_XCOORD'
        DataType = ftInteger
      end
      item
        Name = 'MARKER_YCOORD'
        DataType = ftInteger
      end
      item
        Name = 'START_X_COORD'
        DataType = ftFloat
      end
      item
        Name = 'START_Y_COORD'
        DataType = ftFloat
      end
      item
        Name = 'START_Z_COORD'
        DataType = ftFloat
      end
      item
        Name = 'END_X_COORD'
        DataType = ftFloat
      end
      item
        Name = 'END_Y_COORD'
        DataType = ftFloat
      end
      item
        Name = 'END_Z_COORD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY15'
        Fields = 'RPLACE_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_REKLAM_PLACE'
        Fields = 'LOCATION_ID'
      end>
    IndexFieldNames = 'LOCATION_ID'
    MasterFields = 'LOCATION_ID'
    MasterSource = LocationsDS
    StoreDefs = True
    TableName = 'REKLAM_PLACE'
    Left = 312
    Top = 120
  end
  object AddReklamPlaceToLocationIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_REKLAM_PLACE_BY_LOCATION'
    Left = 312
    Top = 216
  end
  object AddItemToOrderIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_ORDER_ITEM_TO_ORDER'
    Left = 312
    Top = 168
  end
  object OrdersASC_IBDS2: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    SelectSQL.Strings = (
      'select * from ORDERS ORDER BY ORDER_ADD_DATE ASC')
    Left = 312
    Top = 264
  end
  object ItemsOfOrderIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterEdit = ItemsOfOrderIBTableAfterEdit
    AfterPost = ItemsOfOrderIBTableAfterPost
    FieldDefs = <
      item
        Name = 'ORDER_ITEM_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORDER_ID'
        DataType = ftInteger
      end
      item
        Name = 'ORDER_ITEM_NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'LOCATION_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'REKLAM_PLACE_ID'
        DataType = ftInteger
      end
      item
        Name = 'ORDER_ITEM_ADRESS'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TIME_DISTANCE'
        DataType = ftFloat
      end
      item
        Name = 'PRICE'
        DataType = ftFloat
      end
      item
        Name = 'SUMM'
        DataType = ftFloat
      end
      item
        Name = 'IMAGE_FILE'
        DataType = ftBlob
      end
      item
        Name = 'COMPLETE'
        DataType = ftSmallint
      end
      item
        Name = 'ORDER_ITEM_START'
        DataType = ftDate
      end
      item
        Name = 'ORDER_ITEM_END'
        DataType = ftDate
      end>
    Filter = 'COMPLETE=0'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'ORDER_ITEM_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_ORDER_ITEM1'
        Fields = 'LOCATION_ID'
      end
      item
        Name = 'FK_ORDER_ITEM'
        Fields = 'ORDER_ID'
      end>
    IndexFieldNames = 'ORDER_ID'
    MasterFields = 'ORDER_ID'
    MasterSource = OrderASC_DS
    StoreDefs = True
    TableName = 'ORDER_ITEM'
    Left = 312
    Top = 312
  end
  object OrderASC_DS: TDataSource
    DataSet = OrdersASC_IBDS
    Left = 512
    Top = 256
  end
  object ItemsOfOrderDS: TDataSource
    DataSet = ItemsOfOrderIBTable
    Left = 512
    Top = 304
  end
  object ActionList: TActionList
    Images = InterfaceDM.BaseCommandImageList
    Left = 416
    Top = 24
    object NewLocationDSI: TDataSetInsert
      Category = 'Dataset'
      Caption = #1053#1086#1074#1086#1077' '#1084#1077#1089#1090#1086#1087#1086#1083#1086#1078#1077#1085#1080#1077
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = LocationsDS
    end
    object NewPersonTypeDSI: TDataSetInsert
      Category = 'Dataset'
      Caption = #1053#1086#1074#1099#1081' '#1090#1080#1087' '#1082#1083#1080#1077#1085#1090#1072
      Hint = 'Insert'
      ImageIndex = 4
      DataSource = PTypeListDS
    end
    object CompleteCurrentOrderAction: TAction
      Caption = #1047#1072#1082#1072#1079' '#1074#1099#1087#1086#1083#1085#1077#1085'...'
      ImageIndex = 0
      OnExecute = CompleteCurrentOrderActionExecute
    end
    object CompleteCurrentOrderItemAction: TAction
      Caption = #1055#1086#1079#1080#1094#1080#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1072'...'
      ImageIndex = 0
      OnExecute = CompleteCurrentOrderItemActionExecute
    end
    object AddOrderAction: TAction
      Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
      ImageIndex = 2
      OnExecute = AddOrderActionExecute
    end
    object AddOrderItemAction: TAction
      Caption = #1053#1086#1074#1072#1103' '#1087#1086#1079#1080#1094#1080#1103' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 2
      OnExecute = AddOrderItemActionExecute
    end
    object DelCurrentOrderAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079
      ImageIndex = 1
      OnExecute = DelCurrentOrderActionExecute
    end
    object DelCurrentOrderItemAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 1
      OnExecute = DelCurrentOrderItemActionExecute
    end
    object AddWorkAction: TAction
      Caption = #1053#1086#1074#1072#1103' '#1088#1072#1073#1086#1090#1072
      ImageIndex = 2
      OnExecute = AddWorkActionExecute
    end
    object DelCurrentWorkAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 1
      OnExecute = DelCurrentWorkActionExecute
    end
    object DelCurrClientAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 1
      OnExecute = DelCurrClientActionExecute
    end
    object DelCurrentLocationAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1077#1089#1090#1086#1087#1086#1083#1086#1078#1077#1085#1080#1077
      ImageIndex = 1
      OnExecute = DelCurrentLocationActionExecute
    end
    object DelCurrentRPlaceAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1082#1083#1072#1084#1085#1086#1077' '#1084#1077#1089#1090#1086
      ImageIndex = 1
      OnExecute = DelCurrentRPlaceActionExecute
    end
    object AddClientAction: TAction
      Caption = #1053#1086#1074#1099#1081' '#1082#1083#1080#1077#1085#1090
      ImageIndex = 2
      OnExecute = AddClientActionExecute
    end
    object AddLocationAction: TAction
      Caption = #1053#1086#1074#1086#1077' '#1084#1077#1089#1090#1086#1087#1086#1083#1086#1078#1077#1085#1080#1077
      ImageIndex = 2
      OnExecute = AddLocationActionExecute
    end
    object AddRPlaceAction: TAction
      Caption = #1053#1086#1074#1086#1077' '#1088#1077#1082#1083#1072#1084#1085#1086#1077' '#1084#1077#1089#1090#1086
      ImageIndex = 2
      OnExecute = AddRPlaceActionExecute
    end
    object IncStXCAction: TAction
      Caption = 'X++'
      ImageIndex = 5
      OnExecute = IncStXCActionExecute
    end
    object DescStXCAction: TAction
      Caption = 'X--'
      ImageIndex = 6
      OnExecute = DescStXCActionExecute
    end
    object IncStYCAction: TAction
      Caption = 'Y++'
      ImageIndex = 5
      OnExecute = IncStYCActionExecute
    end
    object DescStYCAction: TAction
      Caption = 'Y--'
      ImageIndex = 6
      OnExecute = DescStYCActionExecute
    end
    object IncStZCAction: TAction
      Caption = 'Z++'
      ImageIndex = 5
      OnExecute = IncStZCActionExecute
    end
    object DescStZCAction: TAction
      Caption = 'Z--'
      ImageIndex = 6
      OnExecute = DescStZCActionExecute
    end
    object IncReklXCAction: TAction
      Caption = 'X++'
      ImageIndex = 5
      OnExecute = IncReklXCActionExecute
    end
    object DescReklXCAction: TAction
      Caption = 'X--'
      ImageIndex = 6
      OnExecute = DescReklXCActionExecute
    end
    object IncReklYCAction: TAction
      Caption = 'Y++'
      ImageIndex = 5
      OnExecute = IncReklYCActionExecute
    end
    object DescReklYCAction: TAction
      Caption = 'Y--'
      ImageIndex = 6
      OnExecute = DescReklYCActionExecute
    end
    object IncReklZCAction: TAction
      Caption = 'Z++'
      ImageIndex = 5
      OnExecute = IncReklZCActionExecute
    end
    object DescReklZCAction: TAction
      Caption = 'Z--'
      ImageIndex = 6
      OnExecute = DescReklZCActionExecute
    end
    object Show3DMaketAction: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' 3D '#1084#1072#1082#1077#1090
      ImageIndex = 0
      OnExecute = Show3DMaketActionExecute
    end
  end
  object RvProject: TRvProject
    Engine = RvSystem
    Left = 40
    Top = 384
  end
  object PriceAppPosRvDSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ItemsOfOrderIBTable
    Left = 40
    Top = 480
  end
  object PriceAppRvDSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = OrdersASC_IBDS
    Left = 40
    Top = 432
  end
  object OrderTypesIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'ORDER_TYPE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORDER_TYPE_NAME'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY16'
        Fields = 'ORDER_TYPE_ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'ORDER_TYPE'
    Left = 312
    Top = 360
  end
  object OrderTypesDS: TDataSource
    DataSet = OrderTypesIBTable
    Left = 512
    Top = 352
  end
  object WorksOfOrderIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    AfterPost = WorksOfOrderIBTableAfterPost
    FieldDefs = <
      item
        Name = 'WORK_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'WORK_NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'WORK_PRICE'
        DataType = ftFloat
      end
      item
        Name = 'ORDER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY19'
        Fields = 'WORK_ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ORDER_ID'
    MasterFields = 'ORDER_ID'
    MasterSource = OrderASC_DS
    StoreDefs = True
    TableName = 'WORKS'
    Left = 312
    Top = 408
  end
  object WorksOfOrderDS: TDataSource
    DataSet = WorksOfOrderIBTable
    Left = 512
    Top = 400
  end
  object AddWorkToOrderIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_WORK_TO_ORDER'
    Left = 168
    Top = 360
  end
  object AddLocationIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_LOCATION'
    Left = 168
    Top = 408
  end
  object AddOrderTypeIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_ORDER_TYPE'
    Left = 168
    Top = 456
  end
  object RecalcOrderItemIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'RECALC_ORDER_ITEM'
    Left = 168
    Top = 504
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ORDER_ITEM_ID'
        ParamType = ptInput
      end>
  end
  object RecalcOrderIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'RECALC_ORDER'
    Left = 168
    Top = 552
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ORDER_ID'
        ParamType = ptInput
      end>
  end
  object PriceAppWorksRvDSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = WorksOfOrderIBTable
    Left = 40
    Top = 528
  end
  object OrdersASC_IBDS: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'ORDER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORDER_NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ORDER_START'
        DataType = ftDateTime
      end
      item
        Name = 'ORDER_END'
        DataType = ftDateTime
      end
      item
        Name = 'PERSON_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORDER_ADD_DATE'
        DataType = ftDateTime
      end
      item
        Name = 'SUMM'
        DataType = ftFloat
      end
      item
        Name = 'ITEMS_COUNT'
        DataType = ftInteger
      end
      item
        Name = 'ORDERS_TYPE_ID'
        DataType = ftInteger
      end
      item
        Name = 'DOC_NO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'DOC_DATE'
        DataType = ftDate
      end
      item
        Name = 'RTYPE_NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'CUSTOMER_NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'REKLAM_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'WORK_SUMM'
        DataType = ftFloat
      end>
    Filter = 'COMPLETE=0'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'ORDER_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_ORDER_NEW'
        Fields = 'PERSON_ID'
      end
      item
        Name = 'FK_ORDERS'
        Fields = 'ORDERS_TYPE_ID'
      end>
    StoreDefs = True
    TableName = 'ORDERS'
    Left = 312
    Top = 504
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 40
    Top = 336
  end
  object LoadImgToDBIBSQL: TIBSQL
    Database = IBDatabase
    SQL.Strings = (
      'UPDATE ORDER_ITEM SET IMAGE_FILE=:img '
      'WHERE ORDER_ITEM_ID=:oi_id')
    Transaction = IBTransaction
    Left = 312
    Top = 456
  end
  object OrderItemByLocationIBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select oi.IMAGE_FILE, oi.ORDER_ITEM_ADRESS, '
      'ord.CUSTOMER_NAME, rp.REKLAM_PLACE_NAME, '
      'rp.START_X_COORD, rp.START_Y_COORD, '
      'rp.START_Z_COORD '
      'from ORDER_ITEM oi, ORDERS ord, REKLAM_PLACE rp  '
      'where rp.LOCATION_ID=:loc_id and '
      'oi.REKLAM_PLACE_ID=rp.RPLACE_ID AND '
      'oi.ORDER_ID=ord.ORDER_ID and ord.COMPLETE=0 '
      ' and oi.COMPLETE=0 ')
    Left = 312
    Top = 552
    ParamData = <
      item
        DataType = ftString
        Name = 'loc_id'
        ParamType = ptUnknown
        Value = '-1'
      end>
  end
  object OrderLikeSearchIBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from ORDERS')
    Left = 312
    Top = 600
  end
  object OrderItemByLocationDS: TDataSource
    DataSet = OrderItemByLocationIBQuery
    Left = 512
    Top = 448
  end
  object OrderLikeSearchDS: TDataSource
    DataSet = OrderLikeSearchIBQuery
    Left = 512
    Top = 496
  end
  object LikeSearchOrderIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    IndexFieldNames = 'ORDER_ID'
    MasterFields = 'ORDER_ID'
    MasterSource = OrderLikeSearchDS
    TableName = 'ORDERS'
    Left = 168
    Top = 600
  end
  object LikeSearchOrderDS: TDataSource
    DataSet = LikeSearchOrderIBTable
    Left = 512
    Top = 544
  end
  object SearchOrderOtherItemsIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    IndexFieldNames = 'ORDER_ID'
    MasterFields = 'ORDER_ID'
    MasterSource = LikeSearchOrderDS
    TableName = 'ORDER_ITEM'
    Left = 168
    Top = 648
  end
  object SearchOrderItemsDS: TDataSource
    DataSet = SearchOrderOtherItemsIBTable
    Left = 512
    Top = 592
  end
  object StPlaceIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'STAND_PLACE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'STAND_PLACE_NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'START_X_COORD'
        DataType = ftFloat
      end
      item
        Name = 'START_Y_COORD'
        DataType = ftFloat
      end
      item
        Name = 'START_Z_COORD'
        DataType = ftFloat
      end
      item
        Name = 'END_X_COORD'
        DataType = ftFloat
      end
      item
        Name = 'END_Y_COORD'
        DataType = ftFloat
      end
      item
        Name = 'END_Z_COORD'
        DataType = ftFloat
      end
      item
        Name = 'ORDER_TYPE_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY21'
        Fields = 'STAND_PLACE_ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'FK_STAND_PLACE'
        Fields = 'ORDER_TYPE_ID'
      end>
    IndexFieldNames = 'ORDER_TYPE_ID'
    MasterFields = 'ORDER_TYPE_ID'
    MasterSource = OrderTypesDS
    StoreDefs = True
    TableName = 'STAND_PLACE'
    Left = 416
    Top = 72
  end
  object StPlaceDS: TDataSource
    DataSet = StPlaceIBTable
    Left = 416
    Top = 120
  end
  object AddFromStandPlIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_RPL_BY_LOCATION_WITH_COORDS'
    Left = 312
    Top = 648
    ParamData = <
      item
        DataType = ftInteger
        Name = 'REKLAM_PLACE_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'LOCATION_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'REKLAM_PLACE_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'STX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'STY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'STZ'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ENX'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ENY'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ENZ'
        ParamType = ptInput
      end>
  end
  object CompleteOrderIBSQL: TIBSQL
    Database = IBDatabase
    SQL.Strings = (
      'UPDATE ORDERS SET COMPLETE=1 WHERE '
      'ORDER_ID=:order_id')
    Transaction = IBTransaction
    Left = 416
    Top = 168
  end
  object CompleteOrderItemIBSQL: TIBSQL
    Database = IBDatabase
    SQL.Strings = (
      'UPDATE ORDER_ITEM SET COMPLETE=1 '
      'WHERE ORDER_ITEM_ID=:order_item_id')
    Transaction = IBTransaction
    Left = 416
    Top = 216
  end
  object AddStPlaceIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'ADD_ST_PL_BY_ORD_TYPE'
    Left = 40
    Top = 576
  end
  object UpdStdCoordsIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'UPDATE_STAND_COORDS'
    Left = 40
    Top = 624
  end
  object UpdReklCoordsIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'UPDATE_REKLAM_COORDS'
    Left = 40
    Top = 672
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DELTA_X'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DELTA_Y'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'DELTA_Z'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RPLACE_ID'
        ParamType = ptInput
      end>
  end
  object LocationByIDIBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT * FROM LOCATIONS WHERE LOCATION_ID=:LOCATION_ID')
    Left = 312
    Top = 696
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'LOCATION_ID'
        ParamType = ptUnknown
      end>
  end
end
