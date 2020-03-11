program CloudyBooksApp;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Module.Main in 'Module.Main.pas' {DataModule1: TDataModule},
  Component.TListBooks in 'Component.TListBooks.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
