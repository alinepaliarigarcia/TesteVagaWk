object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 588
  ClientWidth = 1060
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1060
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label7: TLabel
      Left = 11
      Top = 11
      Width = 78
      Height = 23
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pgcPedido: TPageControl
    Left = 0
    Top = 41
    Width = 1060
    Height = 547
    ActivePage = tabConsulta
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pgcPedidoChange
    object tabConsulta: TTabSheet
      Caption = 'Consulta'
      object lblTituloPedido: TLabel
        Left = 0
        Top = 0
        Width = 1052
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 64
      end
      object frdPedido: TDBGrid
        Left = 0
        Top = 19
        Width = 1052
        Height = 461
        Align = alClient
        DataSource = dtsPedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'C'#243'd. Pedido'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dataemissao'
            Title.Caption = 'Data Emiss'#227'o'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomecliente'
            Title.Caption = 'Cliente'
            Width = 435
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valortotal'
            Title.Caption = 'Valor Total'
            Width = 181
            Visible = True
          end>
      end
      object pnlRodapePedido: TPanel
        Left = 0
        Top = 480
        Width = 1052
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btCancelarPedido: TButton
          Left = 104
          Top = 8
          Width = 105
          Height = 25
          Caption = 'Cancelar Pedido'
          TabOrder = 0
          OnClick = btCancelarPedidoClick
        end
        object btCarregarPedido: TButton
          Left = 0
          Top = 8
          Width = 105
          Height = 25
          Caption = 'Carregar Pedido'
          TabOrder = 1
          OnClick = btCarregarPedidoClick
        end
      end
    end
    object tabCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnlCadastroPrincipal: TPanel
        Left = 0
        Top = 0
        Width = 1052
        Height = 516
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlCadastroPedido: TPanel
          Left = 0
          Top = 0
          Width = 1052
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lblPedido: TLabel
            Left = 8
            Top = 16
            Width = 58
            Height = 13
            Caption = 'C'#243'd. Pedido'
          end
          object lblDataEmissao: TLabel
            Left = 135
            Top = 16
            Width = 64
            Height = 13
            Caption = 'Data Emiss'#227'o'
          end
          object lblCliente: TLabel
            Left = 225
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Cliente'
          end
          object edCliente: TDBLookupComboBox
            Left = 224
            Top = 32
            Width = 481
            Height = 21
            KeyField = 'codigo'
            ListField = 'nome'
            ListSource = dtmConexao.dtsCliente
            TabOrder = 2
          end
          object edCodigo: TEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            TabStop = False
            ReadOnly = True
            TabOrder = 0
            Text = 'edCodigo'
          end
          object edDataEmissao: TDateTimePicker
            Left = 135
            Top = 32
            Width = 82
            Height = 21
            Date = 44139.000000000000000000
            Time = 0.331340717602870400
            TabOrder = 1
          end
        end
        object pnlCadastroRodape: TPanel
          Left = 0
          Top = 475
          Width = 1052
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object lblValorTotalPedido: TLabel
            Left = 849
            Top = 18
            Width = 73
            Height = 13
            Caption = 'Total Pedido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btIncluir: TButton
            Left = 8
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Incluir'
            TabOrder = 0
            OnClick = btIncluirClick
          end
          object btSalvar: TButton
            Left = 85
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Salvar'
            TabOrder = 1
            OnClick = btSalvarClick
          end
          object edValorTotal: TEdit
            Left = 928
            Top = 14
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
        object pnlCadastroPedidoItem: TPanel
          Left = 0
          Top = 81
          Width = 1052
          Height = 394
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object lblTituloPedidoItem: TLabel
            Left = 0
            Top = 0
            Width = 1052
            Height = 19
            Align = alTop
            Alignment = taCenter
            Caption = 'Itens do Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 128
          end
          object grdPedidoItem: TDBGrid
            Left = 0
            Top = 19
            Width = 1003
            Height = 375
            Align = alClient
            DataSource = dtsPedidoItem
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = grdPedidoItemDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'produto'
                Title.Caption = 'C'#243'd. Produto'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descricaoproduto'
                Title.Caption = 'Produto'
                Width = 521
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'quantidade'
                Title.Caption = 'Quantidade'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valorunit'
                Title.Caption = 'Valor Unit.'
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'valortotalitem'
                Title.Caption = 'Valor Total'
                Width = 93
                Visible = True
              end>
          end
          object pnlBotaoPedidoItem: TPanel
            Left = 1003
            Top = 19
            Width = 49
            Height = 375
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object btIncluirProduto: TButton
              Left = 6
              Top = 6
              Width = 33
              Height = 25
              Caption = '+'
              TabOrder = 0
              OnClick = btIncluirProdutoClick
            end
          end
        end
      end
    end
  end
  object dtsPedidos: TDataSource
    DataSet = cdsPedidos
    Left = 236
    Top = 131
  end
  object cdsPedidos: TClientDataSet
    PersistDataPacket.Data = {
      980000009619E0BD020000001800000005000000000003000000980006636F64
      69676F04000100000000000B64617461656D697373616F100011000000010007
      53554254595045020049000A00466F726D61747465640007636C69656E746504
      000100000000000B6E6F6D65636C69656E746501004900000001000557494454
      480200020064000A76616C6F72746F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'dataemissao'
        DataType = ftTimeStamp
      end
      item
        Name = 'cliente'
        DataType = ftInteger
      end
      item
        Name = 'nomecliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'valortotal'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsPedidosAfterScroll
    Left = 172
    Top = 132
    object cdsPedidoscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object cdsPedidosdataemissao: TSQLTimeStampField
      FieldName = 'dataemissao'
    end
    object cdsPedidoscliente: TIntegerField
      FieldName = 'cliente'
    end
    object cdsPedidosnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 100
    end
    object cdsPedidosvalortotal: TFloatField
      FieldName = 'valortotal'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object cdsPedidoItem: TClientDataSet
    PersistDataPacket.Data = {
      A90000009619E0BD010000001800000007000000000003000000A90006636F64
      69676F04000100000000000670656469646F04000100000000000770726F6475
      746F04000100000000001064657363726963616F70726F6475746F0100490000
      0001000557494454480200020064000A7175616E746964616465040001000000
      00000976616C6F72756E697408000400000000000E76616C6F72746F74616C69
      74656D08000400000000000000}
    Active = True
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'pedido'
        DataType = ftInteger
      end
      item
        Name = 'produto'
        DataType = ftInteger
      end
      item
        Name = 'descricaoproduto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'quantidade'
        DataType = ftInteger
      end
      item
        Name = 'valorunit'
        DataType = ftFloat
      end
      item
        Name = 'valortotalitem'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforeDelete = cdsPedidoItemBeforeDelete
    AfterDelete = cdsPedidoItemAfterDelete
    Left = 172
    Top = 228
    object cdsPedidoItemcodigo: TIntegerField
      FieldName = 'codigo'
    end
    object cdsPedidoItempedido: TIntegerField
      FieldName = 'pedido'
    end
    object cdsPedidoItemproduto: TIntegerField
      FieldName = 'produto'
    end
    object cdsPedidoItemdescricaoproduto: TStringField
      FieldName = 'descricaoproduto'
      Size = 100
    end
    object cdsPedidoItemquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object cdsPedidoItemvalorunit: TFloatField
      FieldName = 'valorunit'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsPedidoItemvalortotalitem: TFloatField
      FieldName = 'valortotalitem'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsPedidoItemvalortotalpedido: TAggregateField
      FieldName = 'valortotalpedido'
      Active = True
      DisplayName = ''
      Expression = 'SUM(valortotalitem)'
    end
  end
  object dtsPedidoItem: TDataSource
    DataSet = cdsPedidoItem
    Left = 244
    Top = 227
  end
end
