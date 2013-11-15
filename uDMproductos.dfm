object DMproductos: TDMproductos
  OldCreateOrder = False
  Left = 213
  Top = 106
  Height = 422
  Width = 544
  object DSinsertProductos: TDataSource
    DataSet = SPinsertProductos
    Left = 304
    Top = 256
  end
  object SPinsertProductos: TStoredProc
    DatabaseName = 'DBstock AOK'
    StoredProcName = 'INSERTPRODUCTE'
    Left = 216
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'PRODUCTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CODI'
        ParamType = ptInput
      end>
  end
  object SPeditaProducte: TStoredProc
    DatabaseName = 'Stock OAK'
    StoredProcName = 'EDITAPRODUCTE'
    Left = 200
    Top = 320
  end
  object DSeditProductos: TDataSource
    DataSet = SPinsertProductos
    Left = 288
    Top = 320
  end
  object TProveidor: TTable
    Active = True
    DatabaseName = 'Stock OAK'
    IndexFieldNames = 'IDPROVEIDOR'
    TableName = 'PROVEIDOR'
    Left = 16
    Top = 176
    object TProveidorPROVEIDOR: TStringField
      FieldName = 'PROVEIDOR'
      Size = 50
    end
    object TProveidorIDPROVEIDOR: TIntegerField
      FieldName = 'IDPROVEIDOR'
      Required = True
    end
  end
  object DSProveidor: TDataSource
    DataSet = TProveidor
    Left = 91
    Top = 184
  end
  object Tproductos: TTable
    Active = True
    AfterScroll = TproductosAfterScroll
    DatabaseName = 'Stock OAK'
    IndexFieldNames = 'IDPRODUCTE'
    TableName = 'PRODUCTE'
    Left = 8
    Top = 240
    object TproductosIDPRODUCTE: TIntegerField
      DisplayWidth = 14
      FieldName = 'IDPRODUCTE'
      Required = True
    end
    object TproductosPRODUCTE: TStringField
      DisplayWidth = 15
      FieldName = 'PRODUCTE'
      Size = 40
    end
    object TproductosCODI: TStringField
      DisplayWidth = 12
      FieldName = 'CODI'
      Required = True
      Size = 10
    end
    object TproductosQUANTITAT: TFloatField
      DisplayWidth = 13
      FieldName = 'QUANTITAT'
    end
  end
  object DSproductos: TDataSource
    DataSet = Tproductos
    Left = 72
    Top = 240
  end
  object TProducteProveidor: TTable
    Active = True
    DatabaseName = 'Stock OAK'
    IndexFieldNames = 'IDPRODUCTE'
    MasterFields = 'IDPRODUCTE'
    MasterSource = DSproductos
    TableName = 'PRODUCTEPROVEIDOR'
    Left = 32
    Top = 96
    object TProducteProveidorIDPRODUCTEPROVEIDOR: TIntegerField
      FieldName = 'IDPRODUCTEPROVEIDOR'
      Required = True
    end
    object TProducteProveidorIDPRODUCTE: TIntegerField
      FieldName = 'IDPRODUCTE'
      Required = True
    end
    object TProducteProveidorIDPROVEIDOR: TIntegerField
      FieldName = 'IDPROVEIDOR'
      Required = True
    end
    object TProducteProveidorproveidor: TStringField
      FieldKind = fkLookup
      FieldName = 'proveidor'
      LookupDataSet = TProveidor
      LookupKeyFields = 'IDPROVEIDOR'
      LookupResultField = 'PROVEIDOR'
      KeyFields = 'IDPROVEIDOR'
      Lookup = True
    end
  end
  object DSProducteProveidor: TDataSource
    DataSet = TProducteProveidor
    Left = 104
    Top = 112
  end
  object DSproveidorsDreta: TDataSource
    DataSet = QproveidorsDreta
    Left = 368
    Top = 16
  end
  object DSafegeixProveidor: TDataSource
    Left = 360
    Top = 144
  end
  object DStreuProveidor: TDataSource
    DataSet = SPtreuProveidor
    Left = 344
    Top = 192
  end
  object QproveidorsDreta: TQuery
    Active = True
    DatabaseName = 'Stock OAK'
    SQL.Strings = (
      
        'select * from proveidor where idproveidor not in (select idprove' +
        'idor  from producteproveidor where idproducte=:idproducte)')
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idproducte'
        ParamType = ptInput
        Value = 0
      end>
    object QproveidorsDretaIDPROVEIDOR: TIntegerField
      FieldName = 'IDPROVEIDOR'
    end
    object QproveidorsDretaPROVEIDOR: TStringField
      FieldName = 'PROVEIDOR'
      Size = 50
    end
  end
  object SPAfegeixProveidors: TStoredProc
    DatabaseName = 'Stock OAK'
    StoredProcName = 'AFEGEIXPROVEIDORS'
    Left = 272
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPRODUCTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPROVEIDOR'
        ParamType = ptInput
      end>
  end
  object SPtreuProveidor: TStoredProc
    DatabaseName = 'Stock OAK'
    StoredProcName = 'TREUPROVEIDORS'
    Left = 272
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPRODUCTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPROVEIDOR'
        ParamType = ptInput
      end>
  end
  object SPBorraProductes: TStoredProc
    DatabaseName = 'Stock OAK'
    StoredProcName = 'BORRPRODUCTES'
    Left = 280
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPRODUCTE'
        ParamType = ptInput
      end>
  end
  object DSBorraProductes: TDataSource
    DataSet = SPBorraProductes
    Left = 368
    Top = 80
  end
end
