unit untModelPedido;

interface

uses untModelCliente;

type
  TPedido = class
  private
    FCodigo : integer;
    FDataEmissao : TDate;
    FCliente: TCliente;
    FValorTotal: Double;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property DataEmissao: TDate read FDataEmissao write FDataEmissao;
    property Cliente: TCliente read FCliente write FCliente;
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;


implementation



end.
