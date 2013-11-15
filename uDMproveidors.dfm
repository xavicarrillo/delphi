object DMproveidors: TDMproveidors
  OldCreateOrder = False
  Left = 155
  Top = 263
  Height = 375
  Width = 544
  object DSInsertproveidor: TDataSource
    DataSet = SPInsertproveidor
    Left = 104
    Top = 40
  end
  object SPInsertproveidor: TStoredProc
    DatabaseName = 'DBstock AOK'
    StoredProcName = 'INSERTPROVEIDOR'
    Left = 32
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'PROVEIDOR'
        ParamType = ptInput
      end>
  end
  object Tproveidors: TTable
    Active = True
    DatabaseName = 'DBstock AOK'
    TableName = 'PROVEIDOR'
    Left = 32
    Top = 112
    object TproveidorsIDPROVEIDOR: TIntegerField
      FieldName = 'IDPROVEIDOR'
      Required = True
    end
    object TproveidorsPROVEIDOR: TStringField
      FieldName = 'PROVEIDOR'
      Size = 50
    end
  end
  object DSproveidors: TDataSource
    DataSet = Tproveidors
    Left = 104
    Top = 112
  end
  object SPeditaProveidor: TStoredProc
    DatabaseName = 'Stock OAK'
    StoredProcName = 'EDITAPROVEIDOR'
    Left = 216
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'PROVEIDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPROVEIDOR'
        ParamType = ptInput
      end>
  end
  object DSeditaProveidor: TDataSource
    DataSet = SPeditaProveidor
    Left = 296
    Top = 80
  end
end
