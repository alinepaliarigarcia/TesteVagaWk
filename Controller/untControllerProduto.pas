unit untControllerProduto;

interface

uses untDAOProduto,
untModelProduto,
Generics.Collections,
Data.DB,
untPedido,
System.SysUtils;

type
  TControllerProduto = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    function ConsultarProduto(AProduto : integer) : TProduto;
    procedure CarregarDescricaoProduto(AProduto : TProduto);
  end;

implementation

{ TControllerProduto }

uses untPedidoItem;

procedure TControllerProduto.CarregarDescricaoProduto(AProduto: TProduto);
begin
  frmPedidoItem.edDescricao.Text := AProduto.Descricao;
end;

function TControllerProduto.ConsultarProduto(AProduto: integer): TProduto;
var
  objDAOProduto: TDAOProduto;
begin
  objDAOProduto := TDAOProduto.Create;
  try
    Result := objDAOProduto.ConsultarProduto(AProduto);
  finally
    FreeAndNil(objDAOProduto);
  end;
end;

constructor TControllerProduto.Create;
begin

end;

destructor TControllerProduto.Destroy;
begin

  inherited;
end;

end.
