unit untModelCliente;

interface

type
  TCliente = class
  private
    FCodigo : integer;
    FNome: string;
    FCidade: string;
    FUf: string;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: string read FUf write FUf;
  end;

implementation

end.
