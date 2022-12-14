unit UfrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmPrincipal = class(TForm)
    VertScrollBox1: TVertScrollBox;
    rect_valores: TRectangle;
    lblTitulo: TLabel;
    lytProduto: TLayout;
    lblTituloProduto: TLabel;
    lblReaisProduto: TLabel;
    lblCentavosProduto: TLabel;
    lytEnvio: TLayout;
    lblEnvio: TLabel;
    lblReaisEnvio: TLabel;
    lblCentavosEnvio: TLabel;
    Line1: TLine;
    lytParcelas: TLayout;
    lblTituloParcelas: TLabel;
    lblReiasParcelas: TLabel;
    lblCentavosParcelas: TLabel;
    lyt_botao_compra: TLayout;
    Rectangle1: TRectangle;
    btn_comprar: TSpeedButton;
    lyt_compra_ok: TLayout;
    imgOk: TImage;
    lyt_loading_compra: TLayout;
    rect_fundo: TRectangle;
    Label1: TLabel;
    rect_barra: TRectangle;
    rect_fundo_branco_top: TRectangle;
    lyt_detalhews: TLayout;
    rect_fundo_branco_bottom: TRectangle;
    circuloProduto: TCircle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

end.
