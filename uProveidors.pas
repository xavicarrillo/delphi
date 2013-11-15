unit uProveidors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, db, IBCustomDataSet,
  Buttons;

type
  TFproveidors = class(TForm)
    ToolBar1: TToolBar;
    DBGrid1: TDBGrid;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public

//  procedure actualitza(taula:Tibcustomdataset);
     { Public declarations }
  end;

var
  Fproveidors: TFproveidors;

implementation

uses uDMproveidors,upublica;

{$R *.DFM}
{
procedure TFproveidors.actualitza(taula:Tibcustomdataset);

begin

Fproveidors.setfocus;//hem de treure-li el focus o sino no insereix be
DMmain.MainTransaction.Commit;
DMmain.MainTransaction.Active:=true;
taula.active:=true;
//taula.CachedUpdates:=true;  //es necessari que estigui a true, sino el applyUpdates peta
//DMmain.DBaok.ApplyUpdates([taula]);
taula.ApplyUpdates;
taula.close;
taula.open;
end;
}

procedure TFproveidors.ToolButton1Click(Sender: TObject);
begin
dbedit1.enabled:=true;
dbedit1.text:='';
dbEdit1.setfocus;
DMproveidors.Tproveidors.append;

ToolButton1.enabled:=false;
ToolButton3.enabled:=false;
ToolButton5.enabled:=false;
SpeedButton1.enabled:=false;
SpeedButton2.enabled:=false;

BitBtn1.enabled:=true;
BitBtn2.enabled:=true;
end;

procedure TFproveidors.ToolButton12Click(Sender: TObject);
begin
DMproveidors.Tproveidors.prior;
end;

procedure TFproveidors.ToolButton15Click(Sender: TObject);
begin
Fproveidors.close;
end;

procedure TFproveidors.FormCreate(Sender: TObject);
begin
application.createform(TDMproveidors, DMproveidors);
DMproveidors.Tproveidors.active:=true;
end;

procedure TFproveidors.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
release;
DMproveidors.free;
end;

procedure TFproveidors.ToolButton3Click(Sender: TObject);
begin

ToolButton1.enabled:=false;
ToolButton5.enabled:=false;
ToolButton3.enabled:=false;
BitBtn1.enabled:=true;
BitBtn2.enabled:=true;
SpeedButton1.enabled:=false;
SpeedButton2.enabled:=false;

dbEdit1.enabled:=true;
//Edit1.text:=DMproveidors.Tproveidorsproveidor.value;
dbEdit1.setfocus;
DMproveidors.Tproveidors.edit;
end;

procedure TFproveidors.ToolButton5Click(Sender: TObject);
begin
if Application.MessageBox('No podrás eliminar un proveedor que ya tengo asociado algún producto',' ELIMINAR',MB_OKCANCEL)=IDOK then
   begin
        DMproveidors.Tproveidors.edit;
        DMproveidors.Tproveidors.delete;
   end;
DMproveidors.Tproveidors.close;
DMproveidors.Tproveidors.open;
SpeedButton1.enabled:=true;
SpeedButton2.enabled:=true;
end;

procedure TFproveidors.ToolButton8Click(Sender: TObject);
begin
DMproveidors.Tproveidors.prior;
end;

procedure TFproveidors.ToolButton10Click(Sender: TObject);
begin
DMproveidors.Tproveidors.next;
end;

procedure TFproveidors.ToolButton11Click(Sender: TObject);
begin
DMproveidors.Tproveidors.next;
end;

procedure TFproveidors.SpeedButton2Click(Sender: TObject);
begin
DMproveidors.Tproveidors.next;
end;

procedure TFproveidors.SpeedButton1Click(Sender: TObject);
begin
DMproveidors.Tproveidors.prior;
end;

procedure TFproveidors.Button1Click(Sender: TObject);
begin
showmessage(inttostr(DMproveidors.Tproveidorsidproveidor.value));
end;

procedure TFproveidors.BitBtn1Click(Sender: TObject);
begin
if (dbEdit1.text='') then showmessage('has de introducir todos los datos') else begin

//al stored procedure no cal ficar l'active:=false;
dbEdit1.setfocus;//hem de treure-li el focus al dbgrid o sino no insereix els comentaris

if DMproveidors.Tproveidors.State=dsEdit then begin
 DMproveidors.SPeditaProveidor.prepare;
 DMproveidors.SPeditaProveidor.parambyname('proveidor').value:=dbedit1.text;
 DMproveidors.SPeditaProveidor.parambyname('idproveidor').value:=DMproveidors.Tproveidorsidproveidor.value;
 DMproveidors.SPeditaProveidor.execproc;
 DMproveidors.SPeditaProveidor.unprepare;
end else begin
 DMproveidors.SPInsertproveidor.prepare;
 DMproveidors.SPInsertproveidor.parambyname('proveidor').value:=dbedit1.text;
 DMproveidors.SPInsertproveidor.execproc;
 DMproveidors.SPInsertproveidor.unprepare;
end;

//DMproveidors.Tproveidors.cancel; //ens carreguem l'append

DMproveidors.Tproveidors.close;
DMproveidors.Tproveidors.open;

Toolbutton1.enabled:=true;
Toolbutton3.enabled:=true;
Toolbutton5.enabled:=true;
BitBtn1.enabled:=false;
BitBtn2.enabled:=false;
SpeedButton1.enabled:=true;
SpeedButton2.enabled:=true;

dbEdit1.enabled:=false;

end;

end;

procedure TFproveidors.BitBtn2Click(Sender: TObject);
begin
DMproveidors.Tproveidors.cancel;

Toolbutton1.enabled:=true;
Toolbutton3.enabled:=true;
Toolbutton5.enabled:=true;

BitBtn1.enabled:=false;
BitBtn2.enabled:=false;
SpeedButton1.enabled:=true;
SpeedButton2.enabled:=true;

dbEdit1.enabled:=false;

end;

end.
