unit uEntradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask;

type
  TFentradas = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    DBGrid3: TDBGrid;
    Button3: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure refresca;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fentradas: TFentradas;

implementation

uses uDMentradas;

{$R *.DFM}
procedure TFentradas.refresca;
begin
DMentradas.Tproducte.Close;
DMentradas.Tproducte.open;
DMentradas.TproducteProveidor.Close;
DMentradas.TproducteProveidor.open;
DMentradas.TProveidor.Close;
DMentradas.TProveidor.open;
DMentradas.Tentrada.Close;
DMentradas.Tentrada.open;
end;

procedure TFentradas.FormCreate(Sender: TObject);
begin
application.createform(TDMentradas, DMentradas);
DMentradas.Tentrada.active:=true;
DMentradas.TProducte.active:=true;
DMentradas.TProducteProveidor.active:=true;
DMentradas.TProveidor.active:=true;
refresca;
end;

procedure TFentradas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
release;
DMentradas.free;
end;

procedure TFentradas.BitBtn1Click(Sender: TObject);
begin
Edit1.enabled:=true;
Edit2.enabled:=true;
DBGrid2.enabled:=true;
DBGrid2.SetFocus;
DMentradas.Tentrada.append;

end;

procedure TFentradas.BitBtn2Click(Sender: TObject);
begin
DMentradas.Tentrada.delete;
end;

procedure TFentradas.Button1Click(Sender: TObject);
var preu: real;
    quantitat:integer;
begin
if (Edit1.text='') or (Edit2.text='') then showmessage('has de introducir todos los datos') else begin
DMentradas.SPinsertentrada.prepare;
DMentradas.SPinsertentrada.parambyname('idpp').value:=DMentradas.TproducteProveidoridproducteproveidor.value;
DMentradas.SPinsertentrada.parambyname('quantitat').value:=Edit1.text;
DMentradas.SPinsertentrada.parambyname('preu').value:=Edit2.text;
DMentradas.SPinsertentrada.execproc;
DMentradas.SPinsertentrada.unprepare;
Edit1.enabled:=false;
Edit2.enabled:=false;

end;
end;


procedure TFentradas.Button2Click(Sender: TObject);
begin
DMentradas.Tentrada.cancel;
Edit1.enabled:=true;
Edit2.enabled:=true;

end;

procedure TFentradas.FormActivate(Sender: TObject);
begin
Fentradas.WindowState:=wsMaximized;
end;

procedure TFentradas.Button3Click(Sender: TObject);
begin
DMentradas.Tproducte.Close;
DMentradas.Tproducte.open;
DMentradas.TproducteProveidor.Close;
DMentradas.TproducteProveidor.open;
DMentradas.TProveidor.Close;
DMentradas.TProveidor.open;
DMentradas.Tentrada.Close;
DMentradas.Tentrada.open;
end;

procedure TFentradas.SpeedButton1Click(Sender: TObject);
begin
DMentradas.Tproducte.prior;
end;

procedure TFentradas.SpeedButton2Click(Sender: TObject);
begin
DMentradas.Tproducte.next;
end;

end.
