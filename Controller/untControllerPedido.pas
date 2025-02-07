unit untControllerPedido;

interface

uses untDAOPedido,
untModelPedido,
Generics.Collections,
Data.DB,
untPedido,
System.SysUtils,
untModelCliente,
StrUtils,
System.Math;

type
  TOperacao = (toIncluir, toAlterar, toSalvar, toCancelar);
  TControllerPedido = class

  private

  public

    constructor Create;
    destructor Destroy; override;

    procedure ConsultarPedidos;
    procedure ConsultarPedido(APedido : Integer);
    procedure LimparCampos;
    procedure CarregarCampos;
    procedure Salvar(var ACodigo : Integer);
    procedure AtualizarTotalPedido;
    procedure Apagar(ACodigo : Integer);
    procedure ControlarBotoes;
    procedure ControlarQuery;
  end;

implementation

{ TControllerPedido }

uses untConexao;

procedure TControllerPedido.Apagar(ACodigo: Integer);
var
  objDAOPedido: TDAOPedido;
begin
  objDAOPedido := TDAOPedido.Create;
  try
    objDAOPedido.Apagar(ACodigo);
  finally
    FreeAndNil(objDAOPedido)
  end;
end;

procedure TControllerPedido.AtualizarTotalPedido;
begin
  frmPedido.edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)', StrToFloat(frmPedido.cdsPedidoItemvalortotalpedido.asString));
end;

procedure TControllerPedido.CarregarCampos;
begin
  frmPedido.edCodigo.Text := frmPedido.cdsPedidoscodigo.AsString;
  frmPedido.edDataEmissao.DateTime := frmPedido.cdsPedidosdataemissao.AsDateTime;
  frmPedido.edCliente.KeyValue := frmPedido.cdsPedidoscliente.AsString;
  frmPedido.edValorTotal.Text := FormatFloat('#,##0.00;(#,##0.00)', StrToFloat(frmPedido.cdsPedidoItemvalortotalpedido.asString));
end;

procedure TControllerPedido.ConsultarPedido(APedido: Integer);
var
  ObjPedido: TPedido;
  objDAOPedido: TDAOPedido;
  I : integer;
begin

  objDAOPedido := TDAOPedido.Create;
  try
    ObjPedido := objDAOPedido.ConsultarPedido(APedido);

    if not frmPedido.cdsPedidos.IsEmpty then
      begin

        frmPedido.cdsPedidos.IndexName := '';
        frmPedido.cdsPedidos.EmptyDataSet;
        frmPedido.cdsPedidos.close;
        frmPedido.cdsPedidos.CreateDataSet;
      end;

    if ObjPedido <> nil then
      begin
        frmPedido.cdsPedidos.Insert;
        frmPedido.cdsPedidoscodigo.AsInteger := TPedido(ObjPedido).Codigo;
        frmPedido.cdsPedidosdataemissao.AsDateTime := TPedido(ObjPedido).DataEmissao;
        frmPedido.cdsPedidoscliente.AsInteger := TPedido(ObjPedido).Cliente.Codigo;
        frmPedido.cdsPedidosnomecliente.asString := TPedido(ObjPedido).Cliente.Nome;
        frmPedido.cdsPedidosvalortotal.AsFloat := TPedido(ObjPedido).ValorTotal;

        frmPedido.cdsPedidos.post;
      end;
  finally
    FreeAndNil(objDAOPedido);
    FreeAndNil(ObjPedido);
  end;

end;

procedure TControllerPedido.ConsultarPedidos;
var
  ObjPedido: Tlist<TPedido>;
  objDAOPedido: TDAOPedido;
  I : integer;
begin

  objDAOPedido := TDAOPedido.Create;
  try
  ObjPedido := objDAOPedido.ConsultarPedidos;

  if not frmPedido.cdsPedidos.IsEmpty then
    begin

      frmPedido.cdsPedidos.IndexName := '';
      frmPedido.cdsPedidos.EmptyDataSet;
      frmPedido.cdsPedidos.close;
      frmPedido.cdsPedidos.CreateDataSet;
    end;

  if ObjPedido <> nil then
    begin
      for I := 0 to ObjPedido.Count - 1 do
        begin
          frmPedido.cdsPedidos.Insert;
          frmPedido.cdsPedidoscodigo.AsInteger := TPedido(ObjPedido.Items[I]).Codigo;
          frmPedido.cdsPedidosdataemissao.AsDateTime := TPedido(ObjPedido.Items[I]).DataEmissao;
          frmPedido.cdsPedidoscliente.AsInteger := TPedido(ObjPedido.Items[I]).Cliente.Codigo;
          frmPedido.cdsPedidosnomecliente.asString := TPedido(ObjPedido.Items[I]).Cliente.Nome;
          frmPedido.cdsPedidosvalortotal.AsFloat := TPedido(ObjPedido.Items[I]).ValorTotal;

          frmPedido.cdsPedidos.post;
        end;

    end;

    ControlarBotoes;
  finally
    FreeAndNil(ObjPedido);
    FreeAndNil(objDAOPedido);
  end;

end;

procedure TControllerPedido.ControlarBotoes;
begin
  if frmPedido.cdsPedidoscliente.AsInteger <> 0 then
    begin
      frmPedido.btCancelarPedido.Visible := False;
      frmpedido.btCarregarPedido.Visible := False;
    end
  else
    begin
      frmPedido.btCancelarPedido.Visible := True;
      frmpedido.btCarregarPedido.Visible := True;
    end;
end;

procedure TControllerPedido.ControlarQuery;
begin
  dtmConexao.qryCliente.Close;
  dtmConexao.qryCliente.Open;
end;

constructor TControllerPedido.Create;
begin

end;

destructor TControllerPedido.Destroy;
begin

  inherited;
end;

procedure TControllerPedido.LimparCampos;
begin
  frmPedido.edCodigo.Clear;
  frmPedido.edDataEmissao.Date := Date;
  frmPedido.edCliente.KeyValue := 0;
  frmPedido.edValorTotal.Clear;

  frmPedido.cdsPedidoItem.EmptyDataSet;
end;

procedure TControllerPedido.Salvar(var ACodigo : Integer);
var
  ObjPedido: TPedido;
  objDAOPedido: TDAOPedido;
begin
  objDAOPedido := TDAOPedido.Create;
  ObjPedido := TPedido.Create;
  ObjPedido.Cliente := TCliente.Create;
  try
  if frmPedido.edCodigo.Text='' then
    ObjPedido.Codigo := 0
  else
    ObjPedido.Codigo := StrtoInt(frmPedido.edCodigo.Text);

  ObjPedido.DataEmissao := frmPedido.edDataEmissao.Date;
  ObjPedido.Cliente.Codigo := frmPedido.edCliente.KeyValue;
  ObjPedido.ValorTotal := StrToFloat(frmPedido.edValorTotal.Text);

  objDAOPedido.Salvar(ObjPedido, ACodigo);

  frmPedido.edCodigo.Text := IntToStr(ACodigo);
  finally
    FreeAndNil(ObjPedido);
    FreeAndNil(objDAOPedido);
  end;
end;

end.
