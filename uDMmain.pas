unit uDMmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Db, IBDatabase, DBTables;

type
  TDMmain = class(TDataModule)
    ImageList1: TImageList;
    Database1: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMmain: TDMmain;

implementation

{$R *.DFM}

end.
