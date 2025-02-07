unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Pedido: TButton;
    procedure PedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untPedido;

procedure TfrmPrincipal.PedidoClick(Sender: TObject);
begin
if frmPedido = nil then
  begin
    Application.CreateForm(TfrmPedido,frmPedido);
    frmPedido.ShowModal;
    FreeAndNil(frmPedido);
  end;
end;

end.
