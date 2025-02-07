unit untPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPedido = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    pgcPedido: TPageControl;
    tabConsulta: TTabSheet;
    lblTituloPedido: TLabel;
    frdPedido: TDBGrid;
    tabCadastro: TTabSheet;
    pnlCadastroPrincipal: TPanel;
    pnlCadastroPedido: TPanel;
    lblPedido: TLabel;
    lblDataEmissao: TLabel;
    lblCliente: TLabel;
    edCliente: TDBLookupComboBox;
    edCodigo: TEdit;
    edDataEmissao: TDateTimePicker;
    pnlCadastroRodape: TPanel;
    lblValorTotalPedido: TLabel;
    btIncluir: TButton;
    btSalvar: TButton;
    edValorTotal: TEdit;
    pnlCadastroPedidoItem: TPanel;
    lblTituloPedidoItem: TLabel;
    grdPedidoItem: TDBGrid;
    pnlBotaoPedidoItem: TPanel;
    btIncluirProduto: TButton;
    dtsPedidos: TDataSource;
    cdsPedidos: TClientDataSet;
    cdsPedidoscodigo: TIntegerField;
    cdsPedidoscliente: TIntegerField;
    cdsPedidosnomecliente: TStringField;
    cdsPedidosvalortotal: TFloatField;
    cdsPedidosdataemissao: TSQLTimeStampField;
    cdsPedidoItem: TClientDataSet;
    dtsPedidoItem: TDataSource;
    cdsPedidoItemcodigo: TIntegerField;
    cdsPedidoItempedido: TIntegerField;
    cdsPedidoItemproduto: TIntegerField;
    cdsPedidoItemdescricaoproduto: TStringField;
    cdsPedidoItemquantidade: TIntegerField;
    cdsPedidoItemvalorunit: TFloatField;
    cdsPedidoItemvalortotalitem: TFloatField;
    cdsPedidoItemvalortotalpedido: TAggregateField;
    pnlRodapePedido: TPanel;
    btCancelarPedido: TButton;
    btCarregarPedido: TButton;
    procedure FormShow(Sender: TObject);
    procedure pgcPedidoChange(Sender: TObject);
    procedure btIncluirProdutoClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure cdsPedidoItemBeforeDelete(DataSet: TDataSet);
    procedure cdsPedidoItemAfterDelete(DataSet: TDataSet);
    procedure btCarregarPedidoClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure cdsPedidosAfterScroll(DataSet: TDataSet);
    procedure grdPedidoItemDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses untControllerPedido, untControllerPedidoItem, untPedidoItem;

procedure TfrmPedido.btCancelarPedidoClick(Sender: TObject);
var
  objControlerPedido: TControllerPedido;
  objControlerPedidoItem: TControllerPedidoItem;
  CodigoPedido : String;
begin
  objControlerPedido := TControllerPedido.Create;
  objControlerPedidoItem := TControllerPedidoItem.Create;

  try
    CodigoPedido := InputBox('Pedido', 'Digite o número do pedido', '');

    if CodigoPedido <> '' then
    begin

      objControlerPedidoItem.ApagarPedidoItemPedido(StrToInt(CodigoPedido));

      objControlerPedido.Apagar(StrToInt(CodigoPedido));

      objControlerPedido.ConsultarPedidos;

      ShowMessage('Pedido ' + CodigoPedido + ' cancelado com sucesso!');
    end;
  finally
    FreeAndNil(objControlerPedido);
    FreeAndNil(objControlerPedidoItem);
  end;
end;

procedure TfrmPedido.btCarregarPedidoClick(Sender: TObject);
var
  objControlerPedido: TControllerPedido;
  objControlerPedidoItem: TControllerPedidoItem;
  CodigoPedido : String;
begin
  objControlerPedido := TControllerPedido.Create;
  objControlerPedidoItem := TControllerPedidoItem.Create;
  try
    CodigoPedido := InputBox('Pedido', 'Digite o número do pedido', '');

    if CodigoPedido <> '' then
    begin
      objControlerPedido.ConsultarPedido(StrToInt(CodigoPedido));

      objControlerPedidoItem.ConsultarPedidoItens(cdsPedidoscodigo.AsInteger);

      frmPedido.pgcPedido.TabIndex := 1;

      objControlerPedido.CarregarCampos;

    end;
  finally
    FreeAndNil(objControlerPedido);
    FreeAndNil(objControlerPedidoItem);
  end;
end;

procedure TfrmPedido.btIncluirClick(Sender: TObject);
var
  objControlerPedido: TControllerPedido;
begin
  objControlerPedido := TControllerPedido.Create;
  objControlerPedido.LimparCampos
end;

procedure TfrmPedido.btIncluirProdutoClick(Sender: TObject);
begin
  if frmPedidoItem = nil then
  begin
    Application.CreateForm(TfrmPedidoItem,frmPedidoItem);
    frmPedidoItem.ShowModal;
    FreeAndNil(frmPedidoItem);
  end;
end;

procedure TfrmPedido.btSalvarClick(Sender: TObject);
var
  objControlerPedido: TControllerPedido;
  objControlerPedidoItem: TControllerPedidoItem;
  Codigo : Integer;
begin
  objControlerPedido := TControllerPedido.Create;
  objControlerPedidoItem := TControllerPedidoItem.Create;
  try
    objControlerPedido.Salvar(Codigo);

    objControlerPedidoItem.Salvar(Codigo);
    objControlerPedidoItem.ConsultarPedidoItens(Codigo);
  finally
    FreeAndNil(objControlerPedido);
    FreeAndNil(objControlerPedidoItem);
  end;

end;

procedure TfrmPedido.cdsPedidoItemAfterDelete(DataSet: TDataSet);
var
  objControlerPedido: TControllerPedido;
  CodigoPedido : Integer;
begin
  objControlerPedido := TControllerPedido.Create;
  try
  objControlerPedido.AtualizarTotalPedido;
  objControlerPedido.Salvar(CodigoPedido);
  finally
    FreeAndNil(objControlerPedido);
  end;
end;

procedure TfrmPedido.cdsPedidoItemBeforeDelete(DataSet: TDataSet);
var
  objControlerPedidoItem: TControllerPedidoItem;

begin
  objControlerPedidoItem := TControllerPedidoItem.Create;
  try
    objControlerPedidoItem.ApagarPedidoItem;
  finally
    FreeAndNil(objControlerPedidoItem);
  end;
end;

procedure TfrmPedido.cdsPedidosAfterScroll(DataSet: TDataSet);
var
  objControlerPedido: TControllerPedido;
begin
  objControlerPedido := TControllerPedido.Create;
  try
    objControlerPedido.ControlarBotoes;
  finally
    FreeAndNil(objControlerPedido);
  end;

end;

procedure TfrmPedido.grdPedidoItemDblClick(Sender: TObject);
var
  objControlerPedidoItem: TControllerPedidoItem;
begin
objControlerPedidoItem := TControllerPedidoItem.Create;
if not cdsPedidoItem.IsEmpty then
  begin
    if frmPedidoItem = nil then
    begin
      Application.CreateForm(TfrmPedidoItem,frmPedidoItem);
      frmPedidoItem.Operacao := toAlterar;
      objControlerPedidoItem.CarregarCampos;
      frmPedidoItem.ShowModal;
      FreeAndNil(frmPedidoItem);
    end;
  end;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
var
  objControlerPedido: TControllerPedido;
begin
  objControlerPedido := TControllerPedido.Create;
  try
    objControlerPedido.ControlarQuery;
    objControlerPedido.ConsultarPedidos;
  finally
    FreeAndNil(objControlerPedido);
  end;

end;

procedure TfrmPedido.pgcPedidoChange(Sender: TObject);
var
  objControlerPedido: TControllerPedido;
  objControlerPedidoItem: TControllerPedidoItem;
begin
  objControlerPedido := TControllerPedido.Create;
  objControlerPedidoItem := TControllerPedidoItem.Create;

  try
    if pgcPedido.ActivePageIndex = 0 then
    begin
        objControlerPedido.ConsultarPedidos;
    end;

    if pgcPedido.ActivePageIndex = 1 then
    begin
      if cdsPedidos.IsEmpty then
        objControlerPedido.LimparCampos
      else
      begin
        objControlerPedidoItem.ConsultarPedidoItens(cdsPedidoscodigo.AsInteger);
        objControlerPedido.CarregarCampos;
      end;
    end;
  finally
    FreeAndNil(objControlerPedido);
    FreeAndNil(objControlerPedidoItem);
  end;
end;

end.
