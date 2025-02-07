object frmPedidoItem: TfrmPedidoItem
  Left = 0
  Top = 0
  Caption = 'frmPedidoItem'
  ClientHeight = 201
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 653
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 683
    object lblTitulo: TLabel
      Left = 11
      Top = 11
      Width = 126
      Height = 23
      Caption = 'ITENS PEDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 41
    Width = 653
    Height = 119
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 683
    object lblCodigoProduto: TLabel
      Left = 8
      Top = 16
      Width = 64
      Height = 13
      Caption = 'C'#243'd. Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblProduto: TLabel
      Left = 95
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblQuantidade: TLabel
      Left = 8
      Top = 62
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorUnit: TLabel
      Left = 128
      Top = 62
      Width = 50
      Height = 13
      Caption = 'Valor Unit.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 248
      Top = 62
      Width = 51
      Height = 13
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edCodigo: TEdit
      Left = 8
      Top = 31
      Width = 81
      Height = 21
      TabOrder = 0
      OnExit = edCodigoExit
    end
    object edDescricao: TEdit
      Left = 95
      Top = 31
      Width = 546
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edQuantidade: TEdit
      Left = 8
      Top = 79
      Width = 114
      Height = 21
      TabOrder = 2
      OnExit = edQuantidadeExit
    end
    object edValorUnit: TEdit
      Left = 128
      Top = 79
      Width = 114
      Height = 21
      TabOrder = 3
      OnExit = edValorUnitExit
    end
    object edValorTotal: TEdit
      Left = 248
      Top = 79
      Width = 114
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 160
    Width = 653
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 683
    object btSalvarProduto: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btSalvarProdutoClick
    end
  end
end
