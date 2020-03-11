unit Component.TListBooks;

interface

uses
  System.Classes,
  System.Types,
  Winapi.Windows,
  Vcl.StdCtrls,
  Vcl.Controls,
  Vcl.Graphics,
  Data.DB;


type
  TBook = class
    ISBN: string;
    Title: string;
    Author: string;
    ReleseDate: TDateTime;
    Pages: integer;
    Price: currency;
    PriceCurrency: string;
    Imported: TDateTime;
    Description: string;
    constructor CreateFromDataSet(aBookDataSet: TDataSet);
  end;

type
  TListBooks = class(TCustomListBox)
  private
    fSelectedBook: TBook;
  protected
    procedure DrawItem(Index: Integer; Rect: TRect;
      State: TOwnerDrawState); override;
    procedure Click; override;
  public
    constructor Create(Owner: TComponent); override;
    procedure SetDataSet(aDataSet: TDataSet);
    function GetSelectedBook: TBook;
  published
    property Style;
    property AutoComplete;
    property AutoCompleteDelay;
    property Align;
    property Anchors;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property Color;
    property Columns;
    property Constraints;
    property Ctl3D;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property ExtendedSelect;
    property Font;
    property ImeMode;
    property ImeName;
    property IntegralHeight;
    property ItemHeight;
    property Items;
    property MultiSelect;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ScrollWidth;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property TabWidth;
    property Touch;
    property Visible;
    property StyleElements;
    property OnClick;
    property OnContextPopup;
    property OnData;
    property OnDataFind;
    property OnDataObject;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

implementation


procedure TListBooks.Click;
var
  aIndex: Integer;
begin
  aIndex:= ItemIndex;
  if aIndex>=0 then
    fSelectedBook := Items.Objects[aIndex] as TBook;
  inherited;
end;

constructor TListBooks.Create(Owner: TComponent);
begin
  inherited;
  Style := lbOwnerDrawFixed;
  Self.ItemHeight := 60;
end;

procedure TListBooks.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  ACanvas: TCanvas;
  b: TBook;
  r2: TRect;
  // lbx: TCustomListBox;
  colorTextTitle: integer;
  colorTextAuthor: integer;
  colorBackground: integer;
  colorGutter: integer;
  aHeightLine1: Integer;
  aHeightLine2: Integer;
begin
  // inherited;
  // TOwnerDrawState = set of (odSelected, odGrayed, odDisabled, odChecked,
  // odFocused, odDefault, odHotLight, odInactive, odNoAccel, odNoFocusRect,
  // odReserved1, odReserved2, odComboBoxEdit);
  if (odSelected in State) then
  begin
    {
    colorGutter := $F0FFD0;
    colorTextTitle := clHighlightText;
    colorTextAuthor := $FFFFC0;
    colorBackground := clHighlight;
    }
    {
    Windows10 SlateGray:
    }
    colorGutter := $A0FF20;
    colorTextTitle := $B0FFFF;
    colorTextAuthor := $FFFFC0;
    colorBackground := $909070;
  end
  else
  begin
    {
    colorGutter := $A0FF20;
    colorTextTitle := Self.Font.Color;
    colorBackground := Self.Color;
    colorTextAuthor := $909000;
    }
    {
    Windows10 SlateGray:
    }
    colorGutter := $A0FF20;
    colorTextTitle := $FFFFFF;
    colorTextAuthor := $F0F000;
    colorBackground := $625A4B;
  end;
  b := Self.Items.Objects[Index] as TBook;
  ACanvas := Self.Canvas;
  ACanvas.Brush.Color := colorBackground;
  r2 := Rect;
  r2.Left := 0;
  ACanvas.FillRect(r2);
  ACanvas.Brush.Color := colorGutter;
  r2 := Rect;
  r2.Left := 0;
  InflateRect(r2, -3, -5);
  r2.Right := r2.Left + 6;
  ACanvas.FillRect(r2);

  Rect.Top := Rect.Top + 5;
  Rect.Left := Rect.Left + 13;
  ACanvas.Brush.Style := bsClear;

  ACanvas.Font.Color := colorTextAuthor;
  ACanvas.Font.Size := Self.Font.Size;
  ACanvas.TextOut(13, Rect.Top, b.ISBN);
  aHeightLine1 := ACanvas.TextHeight('Ag')+3;

  ACanvas.Font.Color := colorTextTitle;
  ACanvas.Font.Size := Self.Font.Size + 3;
  ACanvas.TextOut(13, Rect.Top + aHeightLine1, b.title);
  aHeightLine2 := ACanvas.TextHeight('Ag')+3;

  ACanvas.Font.Color := colorTextAuthor;
  ACanvas.Font.Size := Self.Font.Size;
  ACanvas.TextOut(13, Rect.Top + aHeightLine1 + aHeightLine2, b.author);
end;

function TListBooks.GetSelectedBook: TBook;
begin
  Result := fSelectedBook;
end;

procedure TListBooks.SetDataSet(aDataSet: TDataSet);
var
  aBookmark: TBookmark;
  aBook:TBook;
begin
  if not aDataSet.Active then
    aDataSet.Open;
  aBookmark := aDataSet.GetBookmark;
  try
    while not aDataSet.Eof do
    begin
      aBook:=TBook.CreateFromDataSet(aDataSet);
      Items.AddObject(aDataSet.FieldByName('ISBN').AsString, aBook);
      aDataSet.Next;
    end;
    aDataSet.GotoBookmark(aBookmark);
  finally
    aDataSet.FreeBookmark(aBookmark);
  end;
end;

{ TBook }

constructor TBook.CreateFromDataSet(aBookDataSet: TDataSet);
begin
  self.ISBN := aBookDataSet.FieldByName('ISBN').Value;
  self.Title := aBookDataSet.FieldByName('Title').Value;
  self.Author := aBookDataSet.FieldByName('Authors').Value;
  self.ReleseDate := aBookDataSet.FieldByName('ReleseDate').Value;
  self.Pages := aBookDataSet.FieldByName('Pages').Value;
  self.Price := aBookDataSet.FieldByName('Price').Value;
  self.PriceCurrency := aBookDataSet.FieldByName('Currency').Value;
  self.Imported := aBookDataSet.FieldByName('Imported').Value;
  self.Description := aBookDataSet.FieldByName('Description').Value;
end;

end.
