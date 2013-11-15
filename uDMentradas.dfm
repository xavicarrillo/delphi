object DMentradas: TDMentradas
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 375
  Width = 544
  object DSentrada: TDataSource
    DataSet = Tentrada
    Left = 136
    Top = 72
  end
  object DSproducteProveidor: TDataSource
    DataSet = TproducteProveidor
    Left = 160
    Top = 128
  end
  object Tentrada: TTable
    DatabaseName = 'DBstock AOK'
    TableName = 'ENTRADA'
    Left = 64
    Top = 72
    object TentradaIDENTRADA: TIntegerField
      FieldName = 'IDENTRADA'
      Required = True
    end
    object TentradaIDPRODUCTEPROVEIDOR: TIntegerField
      FieldName = 'IDPRODUCTEPROVEIDOR'
      Required = True
    end
    object TentradaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object TentradaQUANTITAT: TIntegerField
      FieldName = 'QUANTITAT'
      Required = True
    end
    object TentradaPREU: TFloatField
      FieldName = 'PREU'
    end
  end
  object TproducteProveidor: TTable
    DatabaseName = 'DBstock AOK'
    IndexFieldNames = 'IDPRODUCTE'
    MasterFields = 'IDPRODUCTE'
    MasterSource = DSproducte
    TableName = 'PRODUCTEPROVEIDOR'
    Left = 64
    Top = 128
    object TproducteProveidorIDPRODUCTEPROVEIDOR: TIntegerField
      FieldName = 'IDPRODUCTEPROVEIDOR'
      Required = True
    end
    object TproducteProveidorIDPRODUCTE: TIntegerField
      FieldName = 'IDPRODUCTE'
      Required = True
    end
    object TproducteProveidorIDPROVEIDOR: TIntegerField
      FieldName = 'IDPROVEIDOR'
      Required = True
    end
    object TproducteProveidorproveidor: TStringField
      FieldKind = fkLookup
      FieldName = 'proveidor'
      LookupDataSet = Tproveidor
      LookupKeyFields = 'IDPROVEIDOR'
      LookupResultField = 'PROVEIDOR'
      KeyFields = 'IDPROVEIDOR'
      Lookup = True
    end
  end
  object DSproducte: TDataSource
    DataSet = Tproducte
    Left = 168
    Top = 200
  end
  object Tproducte: TTable
    Active = True
    DatabaseName = 'Stock OAK'
    TableName = 'PRODUCTE'
    Left = 64
    Top = 192
    object TproducteIDPRODUCTE: TIntegerField
      FieldName = 'IDPRODUCTE'
      Required = True
    end
    object TproductePRODUCTE: TStringField
      FieldName = 'PRODUCTE'
      Size = 40
    end
    object TproducteCODI: TStringField
      FieldName = 'CODI'
      Required = True
      Size = 10
    end
    object TproducteQUANTITAT: TFloatField
      FieldName = 'QUANTITAT'
    end
  end
  object DSproveidor: TDataSource
    DataSet = Tproveidor
    Left = 128
    Top = 24
  end
  object Tproveidor: TTable
    DatabaseName = 'Stock OAK'
    TableName = 'PROVEIDOR'
    Left = 64
    Top = 24
    object TproveidorIDPROVEIDOR: TIntegerField
      FieldName = 'IDPROVEIDOR'
      Required = True
    end
    object TproveidorPROVEIDOR: TStringField
      FieldName = 'PROVEIDOR'
      Size = 50
    end
  end
  object SPinsertEntrada: TStoredProc
    DatabaseName = 'Stock OAK'
    StoredProcName = 'INSERTENTRADA'
    Left = 232
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'QUANTITAT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PREU'
        ParamType = ptInput
      end>
  end
  object DSinsertEntrada: TDataSource
    DataSet = SPinsertEntrada
    Left = 288
    Top = 48
  end
end
