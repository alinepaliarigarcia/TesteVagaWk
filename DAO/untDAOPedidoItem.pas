unit untDAOPedidoItem;

interface

uses untModelPedidoItem, untModelPedido, untModelProduto,
  Generics.Collections, SysUtils,
  FireDAC.Comp.Client, untConexao, FireDAC.VCLUI.Wait, FireDAC.Stan.Param;

type
  TDAOPedidoItem = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    function ConsultarPedidoItens(APedido : integer) : Tlist<TPedidoItem>;
    procedure Salvar(APedidoItem : Tlist<TPedidoItem>);
    procedure Apagar(ACodigoPedidoItem : Integer);
    procedure ApagarPedido(APedido : Integer);
  end;

implementation

{ TDAOPedidoItem }

procedure TDAOPedidoItem.Apagar(ACodigoPedidoItem: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection:= dtmConexao.Conexao;
    Qry.Connection.TxOptions.AutoCommit := False;
    Qry.Transaction := dtmConexao.Transaction;
    Qry.SQL.Clear;
    if ACodigoPedidoItem > 0 then
    begin
      try
        if dtmConexao.Transaction.Active = False then
          dtmConexao.Transaction.StartTransaction;

        Qry.SQL.Add('DELETE FROM pedidoitens where codigo = ' + IntToStr(ACodigoPedidoItem));
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

procedure TDAOPedidoItem.ApagarPedido(APedido: Integer);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection:= dtmConexao.Conexao;
    Qry.Connection.TxOptions.AutoCommit := False;
    Qry.Transaction := dtmConexao.Transaction;

    Qry.SQL.Clear;
    if APedido > 0 then
    begin
      try
        if dtmConexao.Transaction.Active = False then
          dtmConexao.Transaction.StartTransaction;
        Qry.SQL.Add('DELETE FROM pedidoitens where pedido = ' + IntToStr(APedido));
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

function TDAOPedidoItem.ConsultarPedidoItens(APedido : integer): Tlist<TPedidoItem>;
var
  Qry: TFDQuery;
  objListaPedidoItens: TList<TPedidoItem>;
  objPedidoItem: TPedidoItem;
begin
  Qry := TFDQuery.Create(nil);
  Qry.Connection:= dtmConexao.Conexao;
  Qry.SQL.Clear;
  Qry.SQL.Add('select i.codigo,');
  Qry.SQL.Add('i.pedido,');
  Qry.SQL.Add('i.produto,');
  Qry.SQL.Add('p.descricao descricaoproduto,');
  Qry.SQL.Add('i.quantidade,');
  Qry.SQL.Add('i.valorunit,');
  Qry.SQL.Add('i.valortotalitem');
  Qry.SQL.Add('from pedidoitens i');
  Qry.SQL.Add('inner join produtos p on i.produto = p.codigo');
  Qry.SQL.Add('where i.pedido = :vCodigoPedido');
  Qry.SQL.Add('order by i.codigo');
  Qry.ParamByName('vCodigoPedido').AsInteger := APedido;
  Try
    Qry.open;
    objListaPedidoItens := TList<TPedidoItem>.Create();
    while not(Qry.Eof) do
      begin
        objPedidoItem := TPedidoItem.Create;
        objPedidoItem.Pedido := TPedido.Create;
        objPedidoItem.Produto := TProduto.Create;
        objPedidoItem.Codigo := Qry.FieldByName('codigo').AsInteger;
        objPedidoItem.Pedido.Codigo := Qry.FieldByName('pedido').AsInteger;
        objPedidoItem.Produto.Codigo := Qry.FieldByName('produto').AsInteger;
        objPedidoItem.Produto.Descricao := Qry.FieldByName('descricaoproduto').asString;
        objPedidoItem.Quantidade := Qry.FieldByName('quantidade').AsInteger;
        objPedidoItem.ValorUnit := Qry.FieldByName('valorunit').asFloat;
        objPedidoItem.ValorTotalItem := Qry.FieldByName('valortotalitem').asFloat;
        objListaPedidoItens.Add(objPedidoItem);
        Qry.Next;
      end;
    result := objListaPedidoItens;
  finally
    Qry.Close;
    Qry.free;
  end;

end;

constructor TDAOPedidoItem.Create;
begin

end;

destructor TDAOPedidoItem.Destroy;
begin

  inherited;
end;

procedure TDAOPedidoItem.Salvar(APedidoItem: Tlist<TPedidoItem>);
var
  Qry: TFDQuery;
  I : Integer;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection:= dtmConexao.Conexao;
    Qry.Connection.TxOptions.AutoCommit := False;
    Qry.Transaction := dtmConexao.Transaction;

    for I := 0 to APedidoItem.Count - 1 do
    begin
      try
      if dtmConexao.Transaction.Active = False then
        dtmConexao.Transaction.StartTransaction;

      Qry.SQL.Clear;
      if APedidoItem[I].Codigo = 0 then
        begin
          Qry.SQL.Add('INSERT INTO pedidoitens(pedido, produto, quantidade, valorunit, valortotalitem)');
          Qry.SQL.Add('VALUES(:pedido, :produto, :quantidade, :valorunit, :valortotalitem)');
        end
      else
        begin
          Qry.SQL.Add('UPDATE pedidoitens SET pedido = :pedido, produto = :produto, quantidade = :quantidade, valorunit = :valorunit, valortotalitem = :valortotalitem');
          Qry.SQL.Add('WHERE codigo = ' +IntToStr(APedidoItem[I].Codigo));
        end;
      Qry.ParamByName('pedido').AsInteger := APedidoItem[I].Pedido.Codigo;
      Qry.ParamByName('produto').AsInteger := APedidoItem[I].Produto.Codigo;
      Qry.ParamByName('quantidade').AsInteger := APedidoItem[I].Quantidade;
      Qry.ParamByName('valorunit').AsFloat := APedidoItem[I].ValorUnit;
      Qry.ParamByName('valortotalitem').AsFloat := APedidoItem[I].ValorTotalItem;
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

end.
