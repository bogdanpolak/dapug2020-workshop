object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cloudy Configurator'
  ClientHeight = 326
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 13
  Padding.Top = 13
  Padding.Right = 13
  Padding.Bottom = 13
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 16
    Top = 16
    Width = 450
    Height = 185
    Align = alTop
    Caption = 'GroupBox1'
    Padding.Left = 5
    Padding.Top = 15
    Padding.Right = 5
    Padding.Bottom = 15
    TabOrder = 0
    ExplicitWidth = 354
    object Label1: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 33
      Width = 430
      Height = 13
      Align = alTop
      Caption = 'Database Folder:'
      ExplicitLeft = 144
      ExplicitTop = 104
      ExplicitWidth = 83
    end
    object lblDatabaseFolder: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 52
      Width = 430
      Height = 18
      Align = alTop
      Caption = 'lblDatabaseFolder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 144
      ExplicitTop = 104
      ExplicitWidth = 136
    end
    object btnChangeDatabaseFolder: TButton
      AlignWithMargins = True
      Left = 10
      Top = 76
      Width = 430
      Height = 37
      Align = alTop
      Caption = 'btnChangeDatabaseFolder'
      TabOrder = 0
      OnClick = btnChangeDatabaseFolderClick
      ExplicitWidth = 296
    end
    object btnCreateDatabase: TButton
      AlignWithMargins = True
      Left = 10
      Top = 128
      Width = 430
      Height = 37
      Align = alBottom
      Caption = 'btnCreateDatabase'
      TabOrder = 1
      OnClick = btnCreateDatabaseClick
      ExplicitLeft = 12
      ExplicitTop = 162
      ExplicitWidth = 296
    end
  end
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 16
    Top = 207
    Width = 450
    Height = 103
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitWidth = 354
  end
  object FDConnection1: TFDConnection
    Left = 216
    Top = 8
  end
  object FDScriptBuildDatabase: TFDScript
    SQLScripts = <
      item
        Name = 'StructureAndData'
        SQL.Strings = (
          'BEGIN TRANSACTION;'
          'CREATE TABLE IF NOT EXISTS "DBInfo" ('
          #9'"VersionNr"'#9'INTEGER'
          ');'
          'CREATE TABLE IF NOT EXISTS "Readers" ('
          #9'"ReaderId"'#9'VARCHAR[20] NOT NULL,'
          #9'"FirstName"'#9'NVARCHAR(100),'
          #9'"LastName"'#9'NVARCHAR(100),'
          #9'"Contact"'#9'NVARCHAR(200),'
          #9'"Created"'#9'DATETIME,'
          #9'PRIMARY KEY("ReaderId")'
          ');'
          'CREATE TABLE IF NOT EXISTS "Books" ('
          #9'"ISBN"'#9'NVARCHAR(20) NOT NULL,'
          #9'"Title"'#9'NVARCHAR(100) NOT NULL,'
          #9'"Authors"'#9'NVARCHAR(100),'
          #9'"Status"'#9'NVARCHAR(15) NOT NULL,'
          #9'"ReleseDate"'#9'DATE,'
          #9'"Pages"'#9'INTEGER,'
          #9'"Price"'#9'DECIMAL(12 , 2),'
          #9'"Currency"'#9'NVARCHAR(10),'
          #9'"Imported"'#9'DATETIME,'
          #9'"Description"'#9'NVARCHAR(2000),'
          #9'PRIMARY KEY("ISBN")'
          ');'
          'CREATE TABLE IF NOT EXISTS "Reports" ('
          #9'"ReaderId"'#9'VARCHAR[20] NOT NULL,'
          #9'"ISBN"'#9'NVARCHAR(20) NOT NULL,'
          #9'"Rating"'#9'INTEGER,'
          #9'"Oppinion"'#9'NVARCHAR(2000),'
          #9'"Reported"'#9'DATETIME,'
          #9'FOREIGN KEY("ReaderId") REFERENCES "Readers"("ReaderId"),'
          #9'FOREIGN KEY("ISBN") REFERENCES "Books"("ISBN")'
          ');'
          'COMMIT;'
          'BEGIN TRANSACTION;'
          
            'INSERT INTO "Books" VALUES ('#39'978-1941266229'#39','#39'Dependency Injecti' +
            'on In Delphi'#39','#39'Nick Hodges'#39','#39'on-shelf'#39','#39'2017-02-01'#39',132,18.18,'#39'U' +
            'SD'#39','#39'2017-12-23'#39','#39'Covers Dependency Injection, you'#39#39'll learn abo' +
            'ut Constructor Injection, Property Injection, and Method Injecti' +
            'on and about the right and wrong way to use it'#39');'
          
            'INSERT INTO "Books" VALUES ('#39'978-1788621304'#39','#39'Delphi Cookbook - ' +
            'Third Edition'#39','#39'Daniele Spinetti, Daniele Teti'#39','#39'avaliable'#39','#39'201' +
            '8-07-01'#39',668,30.13,'#39'EUR'#39','#39'2018-03-24'#39','#39'Quickly learn and employ ' +
            'practical recipes for developing real-world, cross-platform appl' +
            'ications using Delphi'#39');'
          
            'INSERT INTO "Books" VALUES ('#39'978-1941266038'#39','#39'Coding in Delphi'#39',' +
            #39'Nick Hodges'#39','#39'on-shelf'#39','#39'2014-04-01'#39',236,24.99,'#39'USD'#39','#39'2017-10-0' +
            '5'#39','#39'All about writing Delphi code. It'#39#39's just about how to use t' +
            'he language in the most effective way to write clean, testable, ' +
            'maintainable Delphi code'#39');'
          
            'INSERT INTO "Books" VALUES ('#39'978-1786466150'#39','#39'.NET Design Patter' +
            'ns'#39','#39'Praseed Pai, Shine Xavier'#39','#39'on-shelf'#39','#39'2017-01-01'#39',314,26.6' +
            '9,'#39'EUR'#39','#39'2017-10-27'#39','#39'Explore the world of .NET design patterns ' +
            'and bring the benefits that the right patterns can offer to your' +
            ' toolkit today'#39');'
          
            'INSERT INTO "Books" VALUES ('#39'978-1786460165'#39','#39'Expert Delphi'#39','#39'Pa' +
            'we'#322' G'#322'owacki'#39','#39'on-shelf'#39','#39'2017-06-01'#39',506,32.71,'#39'EUR'#39','#39'2017-12-1' +
            '2'#39','#39'Become a developer superhero and build stunning cross-platfo' +
            'rm apps with Delphi'#39');'
          
            'INSERT INTO "Books" VALUES ('#39'978-1546391272'#39','#39'Delphi in Depth: F' +
            'ireDAC'#39','#39'Cary Jensen Ph.D'#39','#39'avaliable'#39','#39'2017-05-01'#39',556,52.43,'#39'E' +
            'UR'#39','#39'2017-12-21'#39','#39'Learn how to connect to a wide variety of data' +
            'bases, optimize your connection configurations, the power of per' +
            'sisted datasets, create flexible queries using macros and FireDA' +
            'C scalar functions, achieve blazing performance with Array DML, ' +
            'Master the art of cached updates'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'3C363836CF4E16'#39','#39'Routledge'#39','#39'Ned'#39 +
            ','#39'nroutledge2j@europa.eu'#39','#39'2019-04-10'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'666669A25DA280'#39','#39'Sobieraj'#39','#39'Stani' +
            's'#322'aw'#39',NULL,'#39'2019-05-10'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'A1865C2D28743A'#39','#39'Gervasio'#39','#39'Branc' +
            'ato'#39',NULL,'#39'2019-06-15'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'9C78E8A4077FFF'#39','#39'Rolando'#39','#39'D'#39#39'Ott' +
            'avio'#39',NULL,'#39'2019-06-23'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'E8990871132C1E'#39','#39'Adolfo'#39','#39'Alba'#39',N' +
            'ULL,'#39'2019-07-02'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'B8C69F7CA0384A'#39','#39'Pancrazio'#39','#39'Muto' +
            #39',NULL,'#39'2019-07-16'#39');'
          
            'INSERT INTO "Readers" VALUES ('#39'8739E6070F096C'#39','#39'Owbridge'#39','#39'Ian'#39',' +
            'NULL,'#39'2019-07-28'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'3C363836CF4E16'#39','#39'978-1941266229'#39',' +
            '9,'#39'Nick'#39#39's perspective on developing modern Delphi code and his ' +
            'methodologies have really made a difference in our team.'#39','#39'2019-' +
            '05-10 17:39:49.000'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'666669A25DA280'#39','#39'978-1788621304'#39',' +
            '10,'#39'Great! There are lots of an easy to implement recepies. Very' +
            ' useful for the future. I recommend it to an every Delphi develo' +
            'per.'#39','#39'2019-05-10 20:30:49.000'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'A1865C2D28743A'#39','#39'978-1941266038'#39',' +
            '9,'#39'This must-read book highlights the importance writung of clea' +
            'n and resposible code in Delphi.'#39','#39'2019-06-15 22:12:31.000'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'9C78E8A4077FFF'#39','#39'978-1786466150'#39',' +
            '8,'#39'This is the key to making things done and getting the results' +
            '.'#39','#39'2019-06-23 12:02:17.000'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'E8990871132C1E'#39','#39'978-1786460165'#39',' +
            '7,'#39'The tools and insights author shares in his book have been in' +
            'strumental in elevating my development knowledge.'#39','#39'2019-07-02 2' +
            '1:55:43.000'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'B8C69F7CA0384A'#39','#39'978-1546391272'#39',' +
            '8,'#39'It'#8217's required reading for any developer looking to play with ' +
            'FireDAC'#39','#39'2019-07-16 00:32:31.000'#39');'
          
            'INSERT INTO "Reports" VALUES ('#39'8739E6070F096C'#39','#39'978-1788621304'#39',' +
            '10,'#39'Daniele'#8217's smart and thoughtful approach showing small and ex' +
            'tremely useful recipes was the best reading for me.'#39','#39'2019-07-28' +
            ' 19:02:21.000'#39');'
          'INSERT INTO "DBInfo" VALUES (2001);'
          'COMMIT;')
      end>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    OnConsolePut = FDScriptBuildDatabaseConsolePut
    Left = 312
    Top = 8
  end
end
