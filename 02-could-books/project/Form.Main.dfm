object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'CloudyBooks App'
  ClientHeight = 503
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 505
    Height = 487
    ActivePage = tshCatalog
    Align = alClient
    TabHeight = 26
    TabOrder = 0
    TabWidth = 120
    object tshReading: TTabSheet
      Caption = 'Reading Now'
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 481
        Height = 193
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alTop
        Caption = 'Reading: ... <Book title>'
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 0
        object Image1: TImage
          AlignWithMargins = True
          Left = 341
          Top = 23
          Width = 130
          Height = 119
          Align = alRight
          ExplicitLeft = 344
          ExplicitTop = 20
          ExplicitHeight = 126
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 10
          Top = 23
          Width = 325
          Height = 119
          Align = alClient
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Book details'
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 7
          Top = 145
          Width = 467
          Height = 41
          Align = alBottom
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = ' '
          TabOrder = 1
          object Button1: TButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 118
            Height = 31
            Align = alLeft
            Caption = 'Button1'
            TabOrder = 0
          end
          object Button2: TButton
            AlignWithMargins = True
            Left = 127
            Top = 3
            Width = 122
            Height = 31
            Align = alLeft
            Caption = 'Button2'
            TabOrder = 1
          end
        end
      end
    end
    object tshCatalog: TTabSheet
      Caption = 'Catalog'
      ImageIndex = 1
    end
    object tshBookDetails: TTabSheet
      Caption = 'Book Details'
      ImageIndex = 2
    end
  end
  object tmrFormReady: TTimer
    Interval = 1
    OnTimer = tmrFormReadyTimer
    Left = 56
    Top = 56
  end
end
