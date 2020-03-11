unit Form.Main;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,

  Winapi.Windows, Winapi.Messages,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls,

  Component.TListBooks;

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
    tmrFormReady: TTimer;
    procedure tmrFormReadyTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    fBooksListView: TListBooks;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Vcl.Themes,
  Vcl.Styles,
  Module.Main;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // TStyleManager.TrySetStyle('Windows10');
  // TStyleManager.TrySetStyle('Windows10 Dark');
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  fBooksListView := TListBooks.Create(Self);
  fBooksListView.Align := alClient;
  fBooksListView.AlignWithMargins := True;
  fBooksListView.Parent := tshCatalog;
end;

procedure TForm1.tmrFormReadyTimer(Sender: TObject);
var
  ds: TDataSet;
  i: Integer;
begin
  tmrFormReady.Enabled := False;
  fBooksListView.SetDataSet(DataModule1.FDQuery1);
end;

end.
