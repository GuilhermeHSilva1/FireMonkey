unit UfrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Ani;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    lytGenero: TLayout;
    lytMenu: TLayout;
    imgCartaz: TImage;
    Image1: TImage;
    imgLogo: TImage;
    Image7: TImage;
    lblFiltro: TLabel;
    imgaLogoSerie: TImage;
    imgDegradeDown: TImage;
    Label1: TLabel;
    imgAssistir: TImage;
    Layout2: TLayout;
    Image2: TImage;
    Label2: TLabel;
    Layout3: TLayout;
    Image3: TImage;
    Label3: TLabel;
    Rectangle1: TRectangle;
    lytFechar: TLayout;
    imgFechar: TImage;
    ListBox1: TListBox;
    FloatAnimation1: TFloatAnimation;
    {$IFDEF MSWINDOWS}
    procedure MenuClick(Sender: TObject);
    {$ELSE}
    procedure MenuTap(Sender: TObject; const Point: TPointF);
    {$ENDIF}
    procedure FormCreate(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure imgFecharClick(Sender: TObject);
    procedure lytGeneroClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadMenu;
    procedure OpenMenu(ind: Boolean);
    procedure SetupMenu(Item: TListBoxItem; texto: String);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

{ TfrmPrincipal }

procedure TfrmPrincipal.FloatAnimation1Finish(Sender: TObject);
begin
  if lytMenu.Tag = 0 then
    lytMenu.Visible := False;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  imgCartaz.Position.X := 0;
  imgCartaz.Position.Y := 0;
  imgCartaz.Width      := 676;
  imgCartaz.Height     := 450;

  self.LoadMenu;
  Self.OpenMenu(False);
end;

procedure TfrmPrincipal.imgFecharClick(Sender: TObject);
begin
  Self.OpenMenu(False);
end;

procedure TfrmPrincipal.LoadMenu;
begin
  ListBox1.Items.Clear;

  with Self do
    begin
      SetupMenu(TListBoxItem.Create(ListBox1), 'Todos os g�neros');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Dispon�vel para download');
      SetupMenu(TListBoxItem.Create(ListBox1), 'A��o');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Adolescente');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Anime');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Asi�ticos');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Brasileiros');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Com�dia');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Drama');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Esportes');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Mist�rio');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Novelas');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Suspense');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Terror');
      SetupMenu(TListBoxItem.Create(ListBox1), 'Romance');
    end;
end;
procedure TfrmPrincipal.lytGeneroClick(Sender: TObject);
begin
  Self.OpenMenu(True);
end;

{$IFDEF MSWINDOWS}
procedure TfrmPrincipal.MenuClick(Sender: TObject);
begin
  lblFiltro.text := TListBoxItem(Sender).text;
  Self.OpenMenu(False);
end;
{$ELSE}
procedure TfrmPrincipal.MenuTap(Sender: TObject; const Point: TPointF);
begin
  lblFiltro.Text := TListBoxItem(Sender).Text;
  Self.OpenMenu(False);
end;
{$ENDIF}

procedure TfrmPrincipal.OpenMenu(ind: Boolean);
begin
  //Esconde o item selecionado...
  ListBox1.ItemIndex := -1;

  //Volta a listagem para o inicio
  ListBox1.ScrollToItem(ListBox1.ItemByIndex(0));

  if ind then
    begin
      lytMenu.Visible := True;
      lytMenu.Tag     := 1;
      lytGenero.AnimateFloat('Opacity',0 ,0.2);
      FloatAnimation1.Inverse := false;
    end
  else
    begin
      lytMenu.Tag := 0;
      lytGenero.AnimateFloat('Opacity', 1,0.4);
      FloatAnimation1.Inverse := True;
    end;

    floatAnimation1.Start;
end;

procedure TfrmPrincipal.SetupMenu(Item: TListBoxItem; texto: String);
begin
  Item.Text := Texto;
  Item.StyledSettings := Item.StyledSettings - [TStyledSetting.Size, TStyledSetting.FontColor, TStyledSetting.Other];
  Item.TextSettings.HorzAlign := TTextAlign.Center;
  Item.HitTest := True;

  {$IFDEF MSWINDOWS}
    Item.OnClick := Self.MenuClick;
  {$ELSE}
    Item.OnTap := Self.MenuTap;
  {$ENDIF}

  if ListBox1.Items.Count > 0 then
    begin
      Item.FontColor := $FFC3C3C3;
      Item.Font.Size := 20;
      Item.Height    := 80;
    end
  else
    begin
      Item.FontColor := $FFFFFFFF;
      Item.Font.Size := 25;
      Item.Height    := 110;
    end;

    ListBox1.AddObject(item);
end;

end.
