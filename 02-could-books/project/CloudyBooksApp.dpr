program CloudyBooksApp;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Module.Main in 'Module.Main.pas' {DataModule1: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
