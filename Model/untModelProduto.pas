unit untModelProduto;

interface

type
  TProduto = class
  private
    FCodigo : integer;
    FDescricao: string;
    FPrecoVenda: Double;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
  end;


implementation

end.
