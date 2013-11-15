program projecte;

uses
  Forms,
  uProveidors in 'uProveidors.pas' {Fproveidors},
  uDMmain in 'uDMmain.pas' {DMmain: TDataModule},
  uDMproveidors in 'uDMproveidors.pas' {DMproveidors: TDataModule},
  uProductos in 'uProductos.pas' {FProductos},
  uDMproductos in 'uDMproductos.pas' {DMproductos: TDataModule},
  Upublica in 'Upublica.pas',
  uEntradas in 'uEntradas.pas' {Fentradas},
  uMain in 'uMain.pas' {Fmain},
  uDMentradas in 'uDMentradas.pas' {DMentradas: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'stock AOK';

  Application.CreateForm(TFmain, Fmain);
//  Application.CreateForm(TFProductos, FProductos);
Application.CreateForm(TFEntradas, Fentradas);
  Application.Run;
end.
