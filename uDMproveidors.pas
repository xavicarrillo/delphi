unit uDMproveidors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBTable, DBTables;

type
  TDMproveidors = class(TDataModule)
    DSInsertproveidor: TDataSource;
    SPInsertproveidor: TStoredProc;
    Tproveidors: TTable;
    DSproveidors: TDataSource;
    TproveidorsIDPROVEIDOR: TIntegerField;
    TproveidorsPROVEIDOR: TStringField;
    SPeditaProveidor: TStoredProc;
    DSeditaProveidor: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMproveidors: TDMproveidors;

implementation

uses uDMmain;

{$R *.DFM}

end.
