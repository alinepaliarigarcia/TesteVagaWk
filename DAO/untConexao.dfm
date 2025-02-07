object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 211
  Width = 351
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Sistema\TesteMonde\VCL\Win32\Debug\libmysql.dll'
    Left = 168
    Top = 48
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=testewk'
      'User_Name=admin'
      'Password=aBm21051982'
      'Server=localhost'
      'DriverID=MySQL')
    TxOptions.AutoStop = False
    TxOptions.DisconnectAction = xdRollback
    LoginPrompt = False
    Left = 64
    Top = 45
  end
  object Transaction: TFDTransaction
    Options.AutoStop = False
    Options.DisconnectAction = xdRollback
    Connection = Conexao
    Left = 64
    Top = 112
  end
  object qryCliente: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT c.codigo,'
      '    c.nome,'
      '    c.cidade,'
      '    c.uf'
      'FROM clientes c'
      'order by c.nome')
    Left = 167
    Top = 100
    object qryClientecodigo: TIntegerField
      FieldName = 'codigo'
      Origin = 'codigo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object qryClientecidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 45
    end
    object qryClienteuf: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
  end
  object dtsCliente: TDataSource
    DataSet = qryCliente
    Left = 167
    Top = 139
  end
end
