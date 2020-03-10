unit Form.Main;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,
  Data.DB,

  Winapi.Windows, Winapi.Messages,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

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
    fBooksListView: TListBox;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Module.Main;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fBooksListView := TListBox.Create(Self);
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
  DataModule1.FDQuery1.Open();
  ds := DataModule1.FDQuery1;
  for i := 0 to ds.RecordCount-1 do
  begin
    fBooksListView.Items.Add(
      ds.FieldByName('ISBN').AsString + ' - ' +
      ds.FieldByName('Title').AsString);
    ds.Next;
  end;

end;

end.
