unit Form.Main;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,

  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.FileCtrl,

  Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Comp.Script;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    GroupBox1: TGroupBox;
    FDScriptBuildDatabase: TFDScript;
    Label1: TLabel;
    lblDatabaseFolder: TLabel;
    btnChangeDatabaseFolder: TButton;
    btnCreateDatabase: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnChangeDatabaseFolderClick(Sender: TObject);
    procedure btnCreateDatabaseClick(Sender: TObject);
    procedure FDScriptBuildDatabaseConsolePut(AEngine: TFDScript;
      const AMessage: string; AKind: TFDScriptOutputKind);

  const
    ConnectionDefinitionName = 'SQLite_CloudyBooks';
    DatabaseFileName = 'cloudy-books.db3';
  private
    procedure SetupConnectionDefinition(const aBaseDirectory: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  lblDatabaseFolder.Caption := '';
  btnCreateDatabase.Enabled := False;
end;

procedure TForm1.SetupConnectionDefinition(const aBaseDirectory: string);
var
  ConnDef: IFDStanConnectionDef;
begin
  ConnDef := FDManager.ConnectionDefs.FindConnectionDef
    (ConnectionDefinitionName);
  if Assigned(ConnDef) then
  begin
    if ConnDef.Params.Database <> aBaseDirectory + DatabaseFileName then
    begin
      ConnDef.Params.Database := aBaseDirectory + DatabaseFileName;
      ConnDef.Apply;
    end;
  end
  else
  begin
    ConnDef := FDManager.ConnectionDefs.AddConnectionDef;
    ConnDef.Name := ConnectionDefinitionName;
    with TFDPhysSQLiteConnectionDefParams(ConnDef.Params) do
    begin
      DriverID := 'SQLite';
      Database := aBaseDirectory + DatabaseFileName;
      UserName := 'user01';
      OpenMode := omCreateUTF8;
    end;
    ConnDef.MarkPersistent;
    ConnDef.Apply;
  end;
  FDConnection1.ConnectionDefName := ConnectionDefinitionName;
end;

procedure TForm1.btnChangeDatabaseFolderClick(Sender: TObject);
var
  IsOK: Boolean;
  aDirs: TArray<string>;
begin
  IsOK := SelectDirectory(lblDatabaseFolder.Caption, aDirs);
  if IsOK then
    lblDatabaseFolder.Caption := aDirs[0];
  btnCreateDatabase.Enabled := IsOK;
end;

procedure TForm1.btnCreateDatabaseClick(Sender: TObject);
begin
  Memo1.Clear;
  SetupConnectionDefinition(lblDatabaseFolder.Caption+'/');
  FDConnection1.Open;
  FDScriptBuildDatabase.ValidateAll;
  FDScriptBuildDatabase.ExecuteAll;
end;

procedure TForm1.FDScriptBuildDatabaseConsolePut(AEngine: TFDScript;
  const AMessage: string; AKind: TFDScriptOutputKind);
begin
  case AKind of
    soEcho:  Memo1.Lines.Add(AMessage);
    soError:  Memo1.Lines.Add('    [Error] ' + AMessage);
  end;
end;

end.
