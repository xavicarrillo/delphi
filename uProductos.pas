unit uProductos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons,
  ExtCtrls;

type
  TFProductos = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton16: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton15: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid3: TDBGrid;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    DBGrid4: TDBGrid;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure refresca(posicio: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProductos: TFProductos;

implementation

uses uDMproductos,upublica, uMain, db,uDMmain;

{$R *.DFM}

procedure TFProductos.refresca(posicio: string);

begin
 DMproductos.TProducteProveidor.close;
 DMproductos.TProducteProveidor.open;
 DMproductos.QproveidorsDreta.close;
 DMproductos.QproveidorsDreta.open;
 DMproductos.Tproductos.close;
 DMproductos.Tproductos.open;
 DMproductos.Tproductos.locate('producte',posicio,[]);
end;

procedure TFProductos.SpeedButton1Click(Sender: TObject);
begin
DMproductos.Tproductos.Prior;
end;

procedure TFProductos.SpeedButton2Click(Sender: TObject);
begin
DMproductos.Tproductos.next;
end;

procedure TFProductos.ToolButton3Click(Sender: TObject);
begin
ToolButton1.enabled:=false;
ToolButton5.enabled:=false;
ToolButton3.enabled:=false;
BitBtn1.enabled:=true;
BitBtn2.enabled:=true;
SpeedButton1.enabled:=false;
SpeedButton2.enabled:=false;
SpeedButton3.enabled:=true;
SpeedButton4.enabled:=true;
DBGrid1.enabled:=false;
dbEdit1.enabled:=true;
dbEdit2.enabled:=true;
dbEdit1.setfocus;

DMproductos.TProveidor.MasterSource:=nil;
DMproductos.Tproductos.edit;
DMproductos.TProducteProveidor.edit;
end;

procedure TFProductos.ToolButton1Click(Sender: TObject);
begin
DBGrid1.enabled:=false;
dbEdit1.enabled:=true;
dbEdit2.enabled:=true;
dbEdit1.text:='';
dbEdit2.text:='';
dbEdit1.setfocus;


DMproductos.TProveidor.MasterSource:=nil;
DMproductos.Tproductos.append;

ToolButton1.enabled:=false;
ToolButton3.enabled:=false;
ToolButton5.enabled:=false;
SpeedButton1.enabled:=false;
SpeedButton2.enabled:=false;
SpeedButton3.enabled:=true;
SpeedButton4.enabled:=true;
BitBtn1.enabled:=true;
BitBtn2.enabled:=true;
BitBtn3.visible:=false;

DBgrid3.visible:=false;
DBgrid2.visible:=false;

end;

procedure TFProductos.ToolButton5Click(Sender: TObject);
begin

if Application.MessageBox('                  ¿SEGURO?',' ELIMINAR',MB_OKCANCEL)=IDOK then
   begin
     DMproductos.SPborraProductes.prepare;
     DMproductos.SPborraProductes.parambyname('idproducte').value:=DMproductos.Tproductosidproducte.value;
     DMproductos.SPborraProductes.execproc;
     DMproductos.SPborraProductes.unprepare;
   end;
refresca(DBEdit1.text);
SpeedButton1.enabled:=true;
SpeedButton2.enabled:=true;
end;

procedure TFProductos.ToolButton15Click(Sender: TObject);
begin
Fproductos.close;
end;

procedure TFProductos.FormCreate(Sender: TObject);
begin
application.createform(TDMproductos, DMproductos);
DMproductos.QproveidorsDreta.active:=false;
//DMproductos.Tproductos.active:=true;
//dbEdit3.Field.Alignment:=taLeftJustify;
end;
procedure TFProductos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
release;
DMproductos.free;
end;

procedure TFProductos.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
 if (Key in ['a'..'Z']) or (key='.') or (key='e') or (key=',') or (key='+') or (key='-') then key:=' ';
end;

procedure TFProductos.BitBtn1Click(Sender: TObject);
begin
DBGrid1.enabled:=true;
if (dbEdit1.text='') or (dbEdit2.text='') then showmessage('has de introducir todos los datos') else begin
if DMproductos.Tproductos.State=dsEdit then begin

 DMproductos.SPeditaProducte.prepare;
 DMproductos.SPeditaProducte.parambyname('producte').value:=DMproductos.Tproductosproducte.value;
 DMproductos.SPeditaProducte.parambyname('codi').value:=DMproductos.Tproductoscodi.value;
 DMproductos.SPeditaProducte.parambyname('idproducte').value:=DMproductos.Tproductosidproducte.value;
 DMproductos.SPeditaProducte.parambyname('idproveidor').value:=DMproductos.TProducteproveidoridProveidor.value;
 DMproductos.SPeditaProducte.execproc;
 DMproductos.SPeditaProducte.unprepare;
 DMproductos.TProducteProveidor.cancel;
 DMproductos.Tproductos.cancel;
 refresca(DBEdit1.text);
 end else begin
 dbEdit1.setfocus;//hem de treure-li el focus al dbmemo o sino no insereix els comentaris
 DMproductos.SPInsertproductos.prepare;
 DMproductos.SPInsertproductos.parambyname('producte').value:=DMproductos.Tproductosproducte.value;
 DMproductos.SPInsertproductos.parambyname('codi').value:=DMproductos.Tproductoscodi.value;
 DMproductos.SPInsertproductos.execproc;
 DMproductos.SPInsertproductos.unprepare;
end;
refresca(DBEdit1.text);
//Hem inserit el producte, ara preparem perque vagin posant proveidors a la taula producteProveidor
BitBtn1.enabled:=false;
BitBtn2.enabled:=false;
BitBtn3.visible:=true;
dbEdit1.enabled:=false;
dbEdit2.enabled:=false;
DBGrid1.enabled:=true;
DBGrid3.visible:=true;
DBGrid2.visible:=true;

Toolbutton1.enabled:=false;
Toolbutton3.enabled:=false;
Toolbutton5.enabled:=false;

SpeedButton1.enabled:=true;
SpeedButton2.enabled:=true;
SpeedButton3.visible:=true;
SpeedButton4.visible:=true;

DMproductos.TProducteProveidor.append;
end;

end;

procedure TFProductos.BitBtn2Click(Sender: TObject);
begin

DMproductos.Tproductos.cancel;
DBGrid1.enabled:=true;
Toolbutton1.enabled:=true;
Toolbutton3.enabled:=true;
Toolbutton5.enabled:=true;
BitBtn1.enabled:=false;
BitBtn2.enabled:=false;
SpeedButton1.enabled:=true;
SpeedButton2.enabled:=true;
dbEdit1.enabled:=false;
dbEdit2.enabled:=false;
Toolbutton1.enabled:=true;
Toolbutton3.enabled:=true;
Toolbutton5.enabled:=true;

end;


procedure TFProductos.SpeedButton3Click(Sender: TObject);
begin
if DMproductos.QproveidorsDreta.RecordCount> 0 then begin
 DMproductos.TproducteProveidor.append;
  DMproductos.SPAfegeixProveidors.prepare;
  DMproductos.SPAfegeixProveidors.parambyname('idproducte').value:=DMproductos.Tproductosidproducte.value;
  DMproductos.SPAfegeixProveidors.parambyname('idproveidor').value:=DMproductos.QproveidorsDretaidproveidor.value;
  DMproductos.SPAfegeixProveidors.execproc;
  DMproductos.SPAfegeixProveidors.unprepare;
 DMproductos.TproducteProveidor.cancel;
 refresca(DBEdit1.text);
 end;
end;

procedure TFProductos.BitBtn4Click(Sender: TObject);
begin
Toolbutton1.enabled:=true;
Toolbutton3.enabled:=true;
Toolbutton5.enabled:=true;
BitBtn3.visible:=false;
DBGrid3.visible:=false;
DBGrid2.visible:=false;
SpeedButton3.visible:=false;
SpeedButton4.visible:=false;
end;

procedure TFProductos.BitBtn3Click(Sender: TObject);
begin
if DMproductos.TProducteProveidor.RecordCount>0 then showmessage('has de introducir un proveedor')
else begin
BitBtn3.visible:=false;
DBGrid3.visible:=false;
DBGrid2.visible:=false;
SpeedButton3.visible:=false;
SpeedButton4.visible:=false;
Toolbutton1.enabled:=true;
Toolbutton3.enabled:=true;
Toolbutton5.enabled:=true;
end;

end;


procedure TFProductos.SpeedButton4Click(Sender: TObject);
begin

  DMproductos.SPTreuProveidor.prepare;
  DMproductos.SPTreuProveidor.parambyname('idproducte').value:=DMproductos.Tproductosidproducte.value;
  DMproductos.SPTreuProveidor.parambyname('idproveidor').value:=DMproductos.TProducteProveidoridproveidor.value;
  DMproductos.SPTreuProveidor.execproc;
  DMproductos.SPTreuProveidor.unprepare;
  refresca(DBEdit1.text);

end;

end.
