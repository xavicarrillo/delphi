unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus;

type
  TFmain = class(TForm)
    MainMenu1: TMainMenu;
    Archivo: TMenuItem;
    Salir1: TMenuItem;
    Mantenimiento1: TMenuItem;
    Nuevaentrada1: TMenuItem;
    Productos1: TMenuItem;
    Porveedores1: TMenuItem;
    Moneda1: TMenuItem;
    Euro1: TMenuItem;
    Peseta1: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure Nuevaentrada1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Productos1Click(Sender: TObject);
    procedure Porveedores1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmain: TFmain;

implementation

uses uEntradas, uDMmain, uProductos, uProveidors, Upublica;

{$R *.DFM}

procedure TFmain.Salir1Click(Sender: TObject);
begin
Fmain.close;
end;

procedure TFmain.Nuevaentrada1Click(Sender: TObject);
begin
 Application.CreateForm(TFentradas, Fentradas);
 show;
end;

procedure TFmain.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDMmain, DMmain);
end;

procedure TFmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
release;
DMmain.free;
end;

procedure TFmain.Productos1Click(Sender: TObject);
begin

if estaFormulari('Fproductos') then Fproductos.windowstate:=wsMaximized
        else begin
                  Application.CreateForm(TFproductos, Fproductos);
                  show;
        end;

end;

procedure TFmain.Porveedores1Click(Sender: TObject);
begin
if estaFormulari('Fproveidors') then Fproveidors.windowstate:=wsMaximized
        else begin
                  Application.CreateForm(TFproveidors, Fproveidors);
                  show;
        end;
end;

procedure TFmain.FormActivate(Sender: TObject);
begin
//Application.CreateForm(TFentradas, Fentradas);
Application.CreateForm(TFproductos, Fproductos);
show;
end;

end.
