unit uDMentradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBTable, IBDatabase, DBTables;

type
  TDMentradas = class(TDataModule)
    DSentrada: TDataSource;
    DSproducteProveidor: TDataSource;
    Tentrada: TTable;
    TproducteProveidor: TTable;
    TproducteProveidorIDPRODUCTEPROVEIDOR: TIntegerField;
    TproducteProveidorIDPRODUCTE: TIntegerField;
    TproducteProveidorIDPROVEIDOR: TIntegerField;
    TentradaIDENTRADA: TIntegerField;
    TentradaIDPRODUCTEPROVEIDOR: TIntegerField;
    TentradaDATA: TDateTimeField;
    TentradaQUANTITAT: TIntegerField;
    TentradaPREU: TFloatField;
    DSproducte: TDataSource;
    Tproducte: TTable;
    TproducteIDPRODUCTE: TIntegerField;
    TproductePRODUCTE: TStringField;
    TproducteCODI: TStringField;
    TproducteQUANTITAT: TFloatField;
    DSproveidor: TDataSource;
    Tproveidor: TTable;
    TproveidorIDPROVEIDOR: TIntegerField;
    TproveidorPROVEIDOR: TStringField;
    TproducteProveidorproveidor: TStringField;
    SPinsertEntrada: TStoredProc;
    DSinsertEntrada: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMentradas: TDMentradas;

implementation

uses uDMmain;

{$R *.DFM}

end.
