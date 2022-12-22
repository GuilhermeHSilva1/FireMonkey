unit USplash;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Colors;

type
  TfrmSplash = class(TForm)
    Timer1: TTimer;
    Layout1: TLayout;
    Image1: TImage;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.fmx}

uses UfrmPrincipal;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.MainForm := frmPrincipal;
  frmPrincipal.show;

  Timer1.Enabled := False;

  Self.Close;
end;

end.
