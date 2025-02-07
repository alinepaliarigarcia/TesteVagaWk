unit untDAOPedido;

interface

uses untModelPedido, untModelCliente, Generics.Collections, SysUtils,
  FireDAC.Comp.Client, untConexao, FireDAC.VCLUI.Wait, FireDAC.Stan.Param;

type
  TDAOPedido = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    function ConsultarPedidos : Tlist<TPedido>;
    function ConsultarPedido(APedido : Integer) : TPedido;
    procedure Salvar(APedido : TPedido; var ACodigo : Integer);
    procedure Apagar(ACodigo : Integer);
  end;

implementation

{ TDAOPedido }

procedure TDAOPedido.Apagar(ACodigo: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection:= dtmConexao.Conexao;
    Qry.Connection.TxOptions.AutoCommit := False;
    Qry.Transaction := dtmConexao.Transaction;

    Qry.SQL.Clear;
    if ACodigo > 0 then
    begin
      try
        if dtmConexao.Transaction.Active = False then
          dtmConexao.Transaction.StartTransaction;

        Qry.SQL.Add('DELETE FROM pedidos where codigo = ' + IntToStr(ACodigo));
        Qry.ExecSQL;

        dtmConexao.Transaction.commit;
      except
        dtmConexao.Transaction.rollback;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TDAOPedido.ConsultarPedido(APedido : Integer): TPedido;
var
  Qry: TFDQuery;
  objPedido: TPedido;
begin
  Qry := TFDQuery.Create(nil);
  Qry.Connection:= dtmConexao.Conexao;
  Qry.SQL.Clear;
  Qry.SQL.Add('select p.codigo,');
  Qry.SQL.Add('p.dataemissao,');
  Qry.SQL.Add('p.cliente,');
  Qry.SQL.Add('c.nome nomecliente,');
  Qry.SQL.Add('p.valortotal');
  Qry.SQL.Add('from pedidos p');
  Qry.SQL.Add('left join clientes c on p.cliente = c.codigo');
  Qry.SQL.Add('where p.codigo = ' + IntToStr(APedido));
  Qry.SQL.Add('order by p.codigo');
  Try
    Qry.open;
    objPedido := TPedido.Create;
    objPedido.Cliente := TCliente.Create;
    objPedido.Codigo := Qry.FieldByName('codigo').AsInteger;
    objPedido.DataEmissao := Qry.FieldByName('dataemissao').asDateTime;
    objPedido.Cliente.Codigo := Qry.FieldByName('cliente').AsInteger;
    objPedido.Cliente.Nome := Qry.FieldByName('nomecliente').asString;
    objPedido.ValorTotal := Qry.FieldByName('valortotal').asFloat;
    result := objPedido;
  finally
    Qry.Close;
    Qry.free;
  end;

end;

function TDAOPedido.ConsultarPedidos: Tlist<TPedido>;
var
  Qry: TFDQuery;
  objListaPedidos: TList<TPedido>;
  objPedido: TPedido;
begin
  Qry := TFDQuery.Create(nil);
  Qry.Connection:= dtmConexao.Conexao;
  Qry.SQL.Clear;
  Qry.SQL.Add('select p.codigo,');
  Qry.SQL.Add('p.dataemissao,');
  Qry.SQL.Add('p.cliente,');
  Qry.SQL.Add('c.nome nomecliente,');
  Qry.SQL.Add('p.valortotal');
  Qry.SQL.Add('from pedidos p');
  Qry.SQL.Add('left join clientes c on p.cliente = c.codigo');
  Qry.SQL.Add('order by p.codigo');
  Try
    Qry.open;
    objListaPedidos := TList<TPedido>.Create();
    while not(Qry.Eof) do
      begin
        objPedido := TPedido.Create;
        objPedido.Cliente := TCliente.Create;
        objPedido.Codigo := Qry.FieldByName('codigo').AsInteger;
        objPedido.DataEmissao := Qry.FieldByName('dataemissao').asDateTime;
        objPedido.Cliente.Codigo := Qry.FieldByName('cliente').AsInteger;
        objPedido.Cliente.Nome := Qry.FieldByName('nomecliente').asString;
        objPedido.ValorTotal := Qry.FieldByName('valortotal').asFloat;
        objListaPedidos.Add(objPedido);
        Qry.Next;
      end;
    result := objListaPedidos;
  finally
    Qry.Close;
    Qry.free;
  end;
end;

constructor TDAOPedido.Create;
begin

end;

destructor TDAOPedido.Destroy;
begin

  inherited;
end;

procedure TDAOPedido.Salvar(APedido: TPedido; var ACodigo : Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection:= dtmConexao.Conexao;
    Qry.Connection.TxOptions.AutoCommit := False;
    Qry.Transaction := dtmConexao.Transaction;
    Qry.SQL.Clear;
    try
      if dtmConexao.Transaction.Active = False then
        dtmConexao.Transaction.StartTransaction;

      if APedido.Codigo = 0 then
        begin
          Qry.SQL.Add('select IFNULL(max(codigo + 1),1) codigo from pedidos');
          Qry.Open;
          APedido.Codigo := Qry.FieldByName('codigo').AsInteger;
          Qry.Close;
          Qry.SQL.Clear;
          Qry.SQL.Add('INSERT INTO pedidos(codigo, dataemissao, cliente, valortotal)');
          Qry.SQL.Add('VALUES (:codigo, :dataemissao, :cliente, :valortotal)');
        end
      else
        begin
          Qry.SQL.Add('UPDATE pedidos SET dataemissao = :dataemissao, cliente = :cliente, valortotal = :valortotal');
          Qry.SQL.Add('WHERE codigo = :codigo');
        end;
      Qry.ParamByName('codigo').AsInteger := APedido.Codigo;
      Qry.ParamByName('dataemissao').AsDate := APedido.DataEmissao;
      Qry.ParamByName('cliente').AsInteger := APedido.Cliente.Codigo;
      Qry.ParamByName('valortotal').AsFloat :=APedido.ValorTotal;
      Qry.ExecSQL;
      dtmConexao.Transaction.commit;
      ACodigo := APedido.Codigo;
    except
      dtmConexao.Transaction.rollback;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

end.
