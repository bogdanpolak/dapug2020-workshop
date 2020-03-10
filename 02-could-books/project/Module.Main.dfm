object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 367
  Width = 430
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_CloudyBooks')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from {id Books}')
    Left = 48
    Top = 80
  end
end
