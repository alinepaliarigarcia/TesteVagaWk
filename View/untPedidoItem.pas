unit untPedidoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;


type
  TOperacao = (toIncluir, toAlterar);

  TfrmPedidoItem = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    pnlCadastro: TPanel;
    lblCodigoProduto: TLabel;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    lblValorUnit: TLabel;
    lblValorTotal: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edQuantidade: TEdit;
    edValorUnit: TEdit;
    edValorTotal: TEdit;
    pnlRodape: TPanel;
    btSalvarProduto: TButton;
    procedure edCodigoExit(Sender: TObject);
    procedure btSalvarProdutoClick(Sender: TObject);
    procedure edQuantidadeExit(Sender: TObject);
    procedure edValorUnitExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Operacao : TOperacao;
  end;

var
  frmPedidoItem: TfrmPedidoItem;

implementation

{$R *.dfm}

uses untControllerProduto, untModelProduto, untControllerPedidoItem;

procedure TfrmPedidoItem.btSalvarProdutoClick(Sender: TObject);
var
  objControlerPedidoItem: TControllerPedidoItem;
begin
  objControlerPedidoItem := TControllerPedidoItem.Create;
  try
    if Operacao = toIncluir then
      objControlerPedidoItem.IncluirPedidoItem;

    if Operacao = toAlterar then
      objControlerPedidoItem.AlterarPedidoItem;

    Close;
  finally
    FreeAndNil(objControlerPedidoItem);
  end;
end;

procedure TfrmPedidoItem.edCodigoExit(Sender: TObject);
var
  objControlerProduto: TControllerProduto;
  objControlerPedidoItem: TControllerPedidoItem;
  objProduto: TProduto;
begin
  try
    objControlerProduto := TControllerProduto.Create;
    objControlerPedidoItem := TControllerPedidoItem.Create;
    objProduto := objControlerProduto.ConsultarProduto(StrToInt(edCodigo.Text));
    if objProduto.Codigo <> 0 then
      objControlerProduto.CarregarDescricaoProduto(objProduto)
    else
      begin
        ShowMessage('Produto Inválido');
        objControlerPedidoItem.LimparCampos;
      end;
  finally
    FreeAndNil(objControlerProduto);
    FreeAndNil(objControlerPedidoItem);
  end;
end;

procedure TfrmPedidoItem.edQuantidadeExit(Sender: TObject);
var
  objControlerPedidoItem: TControllerPedidoItem;
begin
  objControlerPedidoItem := TControllerPedidoItem.Create;
  try
    objControlerPedidoItem.CalcularValorTotalItem;
  finally
    FreeAndNil(objControlerPedidoItem);
  end;
end;

procedure TfrmPedidoItem.edValorUnitExit(Sender: TObject);
var
  objControlerPedidoItem: TControllerPedidoItem;
begin
  objControlerPedidoItem := TControllerPedidoItem.Create;
  try
    objControlerPedidoItem.CalcularValorTotalItem;
  finally
    FreeAndNil(objControlerPedidoItem);
  end;

end;

end.
