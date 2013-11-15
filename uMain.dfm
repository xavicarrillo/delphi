object Fmain: TFmain
  Left = 217
  Top = 151
  Width = 544
  Height = 375
  Caption = 'Control de stock OAK'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 128
    Top = 112
    object Archivo: TMenuItem
      Caption = '&Archivo'
      object Nuevaentrada1: TMenuItem
        Caption = '&Nueva entrada'
        OnClick = Nuevaentrada1Click
      end
      object Salir1: TMenuItem
        Caption = '&Salir'
        OnClick = Salir1Click
      end
    end
    object Mantenimiento1: TMenuItem
      Caption = '&Mantenimiento'
      object Productos1: TMenuItem
        Caption = '&Productos'
        OnClick = Productos1Click
      end
      object Porveedores1: TMenuItem
        Caption = 'Pro&veedores'
        OnClick = Porveedores1Click
      end
    end
    object Moneda1: TMenuItem
      Caption = 'Mo&neda'
      object Euro1: TMenuItem
        Caption = '&Euro'
      end
      object Peseta1: TMenuItem
        Caption = '&Peseta'
      end
    end
  end
end
