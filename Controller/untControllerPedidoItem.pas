unit untControllerPedidoItem;

interface

uses untDAOPedidoItem,
untModelPedidoItem,
Generics.Collections,
Data.DB,
untPedido,
untPedidoItem,
untModelPedido,
untModelProduto,
System.SysUtils;

type

  TControllerPedidoItem = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    procedure ConsultarPedidoItens(APedido : integer);
    procedure LimparCampos;
    procedure IncluirPedidoItem;
    procedure Salvar(ACodigo : Integer);
    procedure CalcularValorTotalItem;
    procedure ApagarPedidoItem;
    procedure ApagarPedidoItemPedido(APedido : Integer);
    procedure CarregarCampos;
    procedure AlterarPedidoItem;
  end;

implementation

{ TControllerPedidoItem }

procedure TControllerPedidoItem.AlterarPedidoItem;
begin
  frmPedido.cdsPedidoItem.Edit;
  frmPedido.cdsPedidoItempedido.AsInteger := frmPedido.cdsPedidoscodigo.AsInteger;
  frmPedido.cdsPedidoItemproduto.AsString := frmPedidoItem.edCodigo.Text;
  frmPedido.cdsPedidoItemdescricaoproduto.asString := frmPedidoItem.edDescricao.Text;
  frmPedido.cdsPedidoItemquantidade.asString := frmPedidoItem.edQuantidade.Text;
  frmPedido.cdsPedidoItemvalorunit.asString := frmPedidoItem.edValorUnit.Text;
  frmPedido.cdsPedidoItemvalortotalitem.asString := frmPedidoItem.edValorTotal.Text;

  frmPedido.cdsPedidoItem.post;

  frmPedido.edValorTotal.Text := frmPedido.cdsPedidoItemvalortotalpedido.AsString;
end;

procedure TControllerPedidoItem.ApagarPedidoItem;
var
  objDAOPedidoItem: TDAOPedidoItem;
begin
  objDAOPedidoItem := TDAOPedidoItem.Create;
  try
    objDAOPedidoItem.Apagar(frmPedido.cdsPedidoItemcodigo.AsInteger);
  finally
    FreeAndNil(objDAOPedidoItem);
  end;
end;

procedure TControllerPedidoItem.ApagarPedidoItemPedido(APedido: Integer);
var
  objDAOPedidoItem: TDAOPedidoItem;
begin
  objDAOPedidoItem := TDAOPedidoItem.Create;
  try
    objDAOPedidoItem.ApagarPedido(APedido);
  finally
    FreeAndNil(objDAOPedidoItem);
  end;
end;

procedure TControllerPedidoItem.CalcularValorTotalItem;
begin

  if frmPedidoItem.edQuantidade.Text = '' then
    frmPedidoItem.edQuantidade.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

  if frmPedidoItem.edValorUnit.Text = '' then
    frmPedidoItem.edValorUnit.Text := FormatFloat('#,##0.00;(#,##0.00)',0);

    frmPedidoItem.edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)',(StrToFloat(frmPedidoItem.edQuantidade.Text) * StrToFloat(frmPedidoItem.edValorUnit.Text)));
end;

procedure TControllerPedidoItem.CarregarCampos;
begin
  frmPedidoItem.edCodigo.Text := frmPedido.cdsPedidoItemproduto.AsString;
  frmPedidoItem.edDescricao.Text := frmPedido.cdsPedidoItemdescricaoproduto.asString;
  frmPedidoItem.edQuantidade.Text := frmPedido.cdsPedidoItemquantidade.asString;
  frmPedidoItem.edValorUnit.Text := frmPedido.cdsPedidoItemvalorunit.AsString;
  frmPedidoItem.edValorTotal.Text := frmPedido.cdsPedidoItemvalortotalitem.AsString;
end;

procedure TControllerPedidoItem.ConsultarPedidoItens(APedido : integer);
var
  ObjPedidoItem: Tlist<TPedidoItem>;
  objDAOPedidoItem: TDAOPedidoItem;
  I : integer;
begin

  objDAOPedidoItem := TDAOPedidoItem.Create;
  try
    ObjPedidoItem := objDAOPedidoItem.ConsultarPedidoItens(APedido);

    if not frmPedido.cdsPedidoItem.IsEmpty then
      begin

        frmPedido.cdsPedidoItem.IndexName := '';
        frmPedido.cdsPedidoItem.EmptyDataSet;
        frmPedido.cdsPedidoItem.close;
        frmPedido.cdsPedidoItem.CreateDataSet;
      end;

    if ObjPedidoItem <> nil then
      begin
        for I := 0 to ObjPedidoItem.Count - 1 do
          begin
            frmPedido.cdsPedidoItem.Insert;
            frmPedido.cdsPedidoItemcodigo.AsInteger := TPedidoItem(ObjPedidoItem.Items[I]).Codigo;
            frmPedido.cdsPedidoItempedido.AsInteger := TPedidoItem(ObjPedidoItem.Items[I]).Pedido.Codigo;
            frmPedido.cdsPedidoItemproduto.AsInteger := TPedidoItem(ObjPedidoItem.Items[I]).Produto.Codigo;
            frmPedido.cdsPedidoItemdescricaoproduto.asString := TPedidoItem(ObjPedidoItem.Items[I]).Produto.Descricao;
            frmPedido.cdsPedidoItemquantidade.AsInteger := TPedidoItem(ObjPedidoItem.Items[I]).Quantidade;
            frmPedido.cdsPedidoItemvalorunit.asFloat := TPedidoItem(ObjPedidoItem.Items[I]).ValorUnit;
            frmPedido.cdsPedidoItemvalortotalitem.asFloat := TPedidoItem(ObjPedidoItem.Items[I]).ValorTotalItem;

            frmPedido.cdsPedidoItem.post;
          end;

      end;
  finally
    FreeAndNil(ObjPedidoItem);
    FreeAndNil(objDAOPedidoItem);
  end;

end;

constructor TControllerPedidoItem.Create;
begin

end;

destructor TControllerPedidoItem.Destroy;
begin

  inherited;
end;

procedure TControllerPedidoItem.IncluirPedidoItem;
begin
  frmPedido.cdsPedidoItem.Insert;
  frmPedido.cdsPedidoItempedido.AsInteger := frmPedido.cdsPedidoscodigo.AsInteger;
  frmPedido.cdsPedidoItemproduto.AsString := frmPedidoItem.edCodigo.Text;
  frmPedido.cdsPedidoItemdescricaoproduto.asString := frmPedidoItem.edDescricao.Text;
  frmPedido.cdsPedidoItemquantidade.asString := frmPedidoItem.edQuantidade.Text;
  frmPedido.cdsPedidoItemvalorunit.asString := frmPedidoItem.edValorUnit.Text;
  frmPedido.cdsPedidoItemvalortotalitem.asString := frmPedidoItem.edValorTotal.Text;

  frmPedido.cdsPedidoItem.post;

  frmPedido.edValorTotal.Text := frmPedido.cdsPedidoItemvalortotalpedido.AsString;
end;

procedure TControllerPedidoItem.LimparCampos;
begin
  frmPedidoItem.edCodigo.Clear;
  frmPedidoItem.edDescricao.Clear;
  frmPedidoItem.edQuantidade.Clear;
  frmPedidoItem.edValorUnit.Clear;
  frmPedidoItem.edValorTotal.Clear;
end;

procedure TControllerPedidoItem.Salvar(ACodigo : Integer);
var
  ObjListaPedidoItem: Tlist<TPedidoItem>;
  ObjPedidoItem: TPedidoItem;
  objDAOPedidoItem: TDAOPedidoItem;
begin

  objDAOPedidoItem := TDAOPedidoItem.Create;
  ObjListaPedidoItem := Tlist<TPedidoItem>.Create;
  try
    frmPedido.cdsPedidoItem.First;
    while (not frmPedido.cdsPedidoItem.Eof) do
    begin

      objPedidoItem := TPedidoItem.Create;
      objPedidoItem.Pedido := TPedido.Create;
      objPedidoItem.Produto := TProduto.Create;
      objPedidoItem.Codigo := frmPedido.cdsPedidoItemcodigo.AsInteger;
      objPedidoItem.Pedido.Codigo := ACodigo;
      objPedidoItem.Produto.Codigo := frmPedido.cdsPedidoItemproduto.AsInteger;
      objPedidoItem.Quantidade := frmPedido.cdsPedidoItemquantidade.AsInteger;
      objPedidoItem.ValorUnit := frmPedido.cdsPedidoItemvalorunit.asFloat;
      objPedidoItem.ValorTotalItem := frmPedido.cdsPedidoItemvalortotalitem.asFloat;
      ObjListaPedidoItem.Add(objPedidoItem);

      frmPedido.cdsPedidoItem.Next;
    end;

    objDAOPedidoItem.Salvar(ObjListaPedidoItem);

  finally
    FreeAndNil(objPedidoItem);
    FreeAndNil(ObjListaPedidoItem);
  end;
end;

end.
