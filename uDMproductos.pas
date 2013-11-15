unit uDMproductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBTable, DBTables;

type
  TDMproductos = class(TDataModule)
    DSinsertProductos: TDataSource;
    SPinsertProductos: TStoredProc;
    SPeditaProducte: TStoredProc;
    DSeditProductos: TDataSource;
    TProveidor: TTable;
    DSProveidor: TDataSource;
    TProveidorPROVEIDOR: TStringField;
    Tproductos: TTable;
    DSproductos: TDataSource;
    TproductosIDPRODUCTE: TIntegerField;
    TproductosPRODUCTE: TStringField;
    TproductosCODI: TStringField;
    TproductosQUANTITAT: TFloatField;
    TProducteProveidor: TTable;
    DSProducteProveidor: TDataSource;
    TProducteProveidorIDPRODUCTEPROVEIDOR: TIntegerField;
    TProducteProveidorIDPRODUCTE: TIntegerField;
    TProducteProveidorIDPROVEIDOR: TIntegerField;
    TProveidorIDPROVEIDOR: TIntegerField;
    TProducteProveidorproveidor: TStringField;
    DSproveidorsDreta: TDataSource;
    DSafegeixProveidor: TDataSource;
    DStreuProveidor: TDataSource;
    QproveidorsDreta: TQuery;
    QproveidorsDretaIDPROVEIDOR: TIntegerField;
    QproveidorsDretaPROVEIDOR: TStringField;
    SPAfegeixProveidors: TStoredProc;
    SPtreuProveidor: TStoredProc;
    SPBorraProductes: TStoredProc;
    DSBorraProductes: TDataSource;
    procedure TproductosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMproductos: TDMproductos;

implementation

uses uDMmain;

{$R *.DFM}


procedure TDMproductos.TproductosAfterScroll(DataSet: TDataSet);
begin
    qproveidorsdreta.close;
    qproveidorsdreta.ParamByName('idproducte').value:=tproductosidproducte.value;
    qproveidorsdreta.open;
end;

end.
