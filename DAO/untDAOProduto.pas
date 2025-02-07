unit untDAOProduto;

interface

uses untModelProduto,
  Generics.Collections, SysUtils,
  FireDAC.Comp.Client, untConexao, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  Data.DB;

type
  TDAOProduto = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    function ConsultarProduto(AProduto : integer) : TProduto;

  end;

implementation

{ TDAOPedidoItem }

function TDAOProduto.ConsultarProduto(AProduto: integer): TProduto;
var
  Qry: TFDQuery;
  objProduto: TProduto;
begin
  Qry := TFDQuery.Create(nil);
  Qry.Connection:= dtmConexao.Conexao;
  Qry.SQL.Clear;
  Qry.SQL.Add('select p.codigo,');
  Qry.SQL.Add('p.descricao,');
  Qry.SQL.Add('p.precovenda');
  Qry.SQL.Add('from produtos p');
  Qry.SQL.Add('where p.codigo = :vProduto');
  Qry.SQL.Add('order by p.descricao');
  Qry.ParamByName('vProduto').AsInteger := AProduto;
  objProduto := TProduto.Create;
  Try
    Qry.open;
    if not Qry.IsEmpty then
      begin
        objProduto.Codigo := Qry.FieldByName('codigo').AsInteger;
        objProduto.Descricao := Qry.FieldByName('descricao').asString;
        objProduto.PrecoVenda := Qry.FieldByName('precovenda').asFloat;
      end;
    result := objProduto;
  finally
    Qry.Close;
    Qry.free;
  end;
end;

constructor TDAOProduto.Create;
begin

end;

destructor TDAOProduto.Destroy;
begin

  inherited;
end;

end.
