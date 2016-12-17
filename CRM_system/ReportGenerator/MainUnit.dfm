object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 618
  Height = 648
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1086#1090#1095#1077#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 610
    Height = 614
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      TabVisible = False
      object Splitter3: TSplitter
        Left = 0
        Top = 305
        Width = 602
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Color = clMedGray
        ParentColor = False
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 602
        Height = 305
        Align = alTop
        Caption = #1047#1072#1082#1072#1079#1099' '#1074' '#1093#1088#1086#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1084' '#1087#1086#1088#1103#1076#1082#1077
        TabOrder = 0
        object DBGrid3: TDBGrid
          Left = 2
          Top = 15
          Width = 598
          Height = 247
          Align = alClient
          DataSource = RGenOrderSearchDS
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ORDER_START'
              Title.Caption = #1053#1072#1095#1072#1090
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDER_NAME'
              Title.Caption = #1050#1088#1072#1090#1082#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDER_END'
              Title.Caption = #1054#1082#1086#1085#1095#1077#1085
              Visible = True
            end
            item
              Color = clMoneyGreen
              Expanded = False
              FieldName = 'SUMM'
              ReadOnly = True
              Title.Caption = #1057#1091#1084#1084#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ITEMS_COUNT'
              Title.Caption = #1055#1086#1079#1080#1094#1080#1081
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUSTOMER_NAME'
              Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NO'
              Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_DATE'
              Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 2
          Top = 262
          Width = 598
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Button1: TButton
            Left = 384
            Top = 8
            Width = 211
            Height = 25
            Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1055#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#8470'1 - '#1089#1084#1077#1090#1072
            TabOrder = 0
            OnClick = Button1Click
          end
          object CheckBox1: TCheckBox
            Left = 8
            Top = 16
            Width = 185
            Height = 17
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1082#1086#1085#1095#1077#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
            TabOrder = 1
            OnClick = CheckBox1Click
          end
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 308
        Width = 602
        Height = 296
        Align = alClient
        Caption = #1055#1086#1079#1080#1094#1080#1080' '#1079#1072#1082#1072#1079#1072' ('#1074#1082#1083#1102#1095#1072#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077' '#1087#1086#1079#1080#1094#1080#1080')'
        TabOrder = 1
        object PageControl3: TPageControl
          Left = 2
          Top = 15
          Width = 598
          Height = 279
          ActivePage = TabSheet6
          Align = alClient
          TabOrder = 0
          object TabSheet6: TTabSheet
            Caption = #1056#1072#1079#1084#1077#1097#1077#1085#1080#1077
            object DBGrid4: TDBGrid
              Left = 0
              Top = 0
              Width = 590
              Height = 251
              Align = alClient
              DataSource = ItemsOfOrderDS
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ORDER_ITEM_ADRESS'
                  Title.Caption = #1055#1086#1079#1080#1094#1080#1103
                  Width = 170
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIME_DISTANCE'
                  Title.Caption = #1057#1088#1086#1082
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRICE'
                  Title.Caption = #1062#1077#1085#1072
                  Visible = True
                end
                item
                  Color = clMoneyGreen
                  Expanded = False
                  FieldName = 'SUMM'
                  ReadOnly = True
                  Title.Caption = #1057#1091#1084#1084#1072
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDER_ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ORDER_ITEM_ID'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'ORDER_ITEM_ADRESS'
                  Title.Caption = #1056#1072#1079#1084#1077#1097#1077#1085#1080#1077
                  Width = 300
                  Visible = True
                end>
            end
          end
          object TabSheet7: TTabSheet
            Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
            ImageIndex = 1
            object DBGrid6: TDBGrid
              Left = 0
              Top = 0
              Width = 590
              Height = 251
              Align = alClient
              DataSource = WorksOfOrderDS
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'WORK_NAME'
                  Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
                  Width = 250
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'WORK_PRICE'
                  Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      TabVisible = False
    end
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
  object PriceAppWorksRvDSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = WorksOfOrderIBTable
    Left = 40
    Top = 464
  end
  object PriceAppPosRvDSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ItemsOfOrderIBTable
    Left = 40
    Top = 424
  end
  object RvProject: TRvProject
    Engine = RvSystem
    ProjectFile = 
      'C:\Documents and Settings\Admin\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\Borland Studio Pro' +
      'jects\CRM_system\ReportGenerator\rep_gen.rav'
    Left = 40
    Top = 384
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase
    Left = 312
    Top = 24
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 
      'C:\Documents and Settings\Admin\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\Borland Studio Pro' +
      'jects\CRM_system\crm_wbg\CRMWBG.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    Left = 168
    Top = 24
  end
  object WorksOfOrderDS: TDataSource
    DataSet = WorksOfOrderIBTable
    Left = 424
    Top = 368
  end
  object WorksOfOrderIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'WORK_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'WORK_NAME'
        DataType = ftString
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
    MasterSource = RGenOrderSearchDS
    StoreDefs = True
    TableName = 'WORKS'
    Left = 312
    Top = 368
  end
  object ItemsOfOrderIBTable: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
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
        Size = 8
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
      end
      item
        Name = 'FK_ORDER_ITEM2'
        Fields = 'REKLAM_PLACE_ID'
      end>
    IndexFieldNames = 'ORDER_ID'
    MasterFields = 'ORDER_ID'
    MasterSource = RGenOrderSearchDS
    StoreDefs = True
    TableName = 'ORDER_ITEM'
    Left = 320
    Top = 312
  end
  object ItemsOfOrderDS: TDataSource
    DataSet = ItemsOfOrderIBTable
    Left = 424
    Top = 312
  end
  object RGenOrdSearchIBQuery: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select *  from ORDERS WHERE (COMPLETE=:complete) '
      'OR (0<> :complete2) '
      'ORDER BY ORDER_ADD_DATE ASC')
    Left = 288
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'complete'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftString
        Name = 'complete2'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object RGenOrderSearchDS: TDataSource
    DataSet = RGenOrdSearchIBQuery
    Left = 408
    Top = 192
  end
  object RecalcOrderIBSP: TIBStoredProc
    Database = IBDatabase
    Transaction = IBTransaction
    StoredProcName = 'RECALC_ORDER'
    Left = 288
    Top = 240
  end
end
