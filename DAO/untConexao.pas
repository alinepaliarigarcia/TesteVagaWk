unit untConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.IniFiles, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, Vcl.Dialogs;

type
  TdtmConexao = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Conexao: TFDConnection;
    Transaction: TFDTransaction;
    qryCliente: TFDQuery;
    qryClientecodigo: TIntegerField;
    qryClientenome: TStringField;
    qryClientecidade: TStringField;
    qryClienteuf: TStringField;
    dtsCliente: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LerIni;
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  try
    LerIni;
    Conexao.Connected := True;
  Except
    on E : Exception do ShowMessage(E.ClassName + 'erro gerado, com mensagem: ' + E.Message);
  end;
end;

procedure TdtmConexao.LerIni;
var
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  try
    Conexao.Params.Values['DriverID'] := ArquivoINI.ReadString('CONEXAO','DriverID', 'MySQL');
    Conexao.Params.Values['Server'] := ArquivoINI.ReadString('CONEXAO','Server', '');
    Conexao.Params.Values['Database'] := ArquivoINI.ReadString('CONEXAO','Database', '');
    Conexao.Params.Values['User_Name'] := ArquivoINI.ReadString('CONEXAO','UserName', 'root');
    Conexao.Params.Values['Password'] := ArquivoINI.ReadString('CONEXAO', 'Password', 'root');
    Conexao.Params.Values['Port'] := ArquivoINI.ReadString('CONEXAO', 'Port', '3306');
    FDPhysMySQLDriverLink1.VendorLib := ArquivoINI.ReadString('CONEXAO', 'dll', '');
  finally
    ArquivoINI.Free;
  end;

end;

end.
