program TesteWK;

uses
  Vcl.Forms,
  untPrincipal in 'View\untPrincipal.pas' {frmPrincipal},
  untConexao in 'DAO\untConexao.pas' {dtmConexao: TDataModule},
  untPedido in 'View\untPedido.pas' {frmPedido},
  untModelCliente in 'Model\untModelCliente.pas',
  untModelProduto in 'Model\untModelProduto.pas',
  untModelPedido in 'Model\untModelPedido.pas',
  untModelPedidoItem in 'Model\untModelPedidoItem.pas',
  untControllerPedido in 'Controller\untControllerPedido.pas',
  untDAOPedido in 'DAO\untDAOPedido.pas',
  untControllerPedidoItem in 'Controller\untControllerPedidoItem.pas',
  untDAOPedidoItem in 'DAO\untDAOPedidoItem.pas',
  untPedidoItem in 'View\untPedidoItem.pas' {frmPedidoItem},
  untControllerProduto in 'Controller\untControllerProduto.pas',
  untDAOProduto in 'DAO\untDAOProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
