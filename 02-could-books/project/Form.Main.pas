unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    tshReading: TTabSheet;
    tshCatalog: TTabSheet;
    tshBookDetails: TTabSheet;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    tmrFormReady: TTimer;
    procedure tmrFormReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.tmrFormReadyTimer(Sender: TObject);
begin
  tmrFormReady.Enabled := False;
  // ...
end;

end.
