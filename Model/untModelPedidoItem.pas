unit untModelPedidoItem;

interface

uses untModelPedido,
untModelProduto;

type
  TPedidoItem = class
  private
    FCodigo : integer;
    FPedido : TPedido;
    FProduto : TProduto;
    FQuantidade: integer;
    FValorUnit: Double;
    FValorTotalItem: Double;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property Pedido: TPedido read FPedido write FPedido;
    property Produto: TProduto read FProduto write FProduto;
    property Quantidade: integer read FQuantidade write FQuantidade;
    property ValorUnit: Double read FValorUnit write FValorUnit;
    property ValorTotalItem: Double read FValorTotalItem write FValorTotalItem;
  end;

implementation

end.
