object DM: TDM
  OldCreateOrder = False
  Height = 299
  Width = 674
  object fdConn: TFDConnection
    Params.Strings = (
      'Database=C:\Databases\Firebird\NFCE.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 72
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\fbclient.dll'
    Left = 248
    Top = 32
  end
  object QryAuxiliar: TFDQuery
    Connection = fdConn
    Left = 400
    Top = 32
  end
  object QryConfiguracoes: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * FROM TABCONFIGURACAO')
    Left = 576
    Top = 32
    object QryConfiguracoesID_CONTROLE: TIntegerField
      FieldName = 'ID_CONTROLE'
      Origin = 'ID_CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryConfiguracoesNUMERO_NFCE: TIntegerField
      FieldName = 'NUMERO_NFCE'
      Origin = 'NUMERO_NFCE'
    end
    object QryConfiguracoesPASTA_SALVAR_XML_NFCE: TStringField
      FieldName = 'PASTA_SALVAR_XML_NFCE'
      Origin = 'PASTA_SALVAR_XML_NFCE'
      Size = 200
    end
    object QryConfiguracoesPASTA_SALVAR_PDF_NFCE: TStringField
      FieldName = 'PASTA_SALVAR_PDF_NFCE'
      Origin = 'PASTA_SALVAR_PDF_NFCE'
      Size = 200
    end
    object QryConfiguracoesASSUNTO_EMAIL_NFCE: TStringField
      FieldName = 'ASSUNTO_EMAIL_NFCE'
      Origin = 'ASSUNTO_EMAIL_NFCE'
      Size = 100
    end
    object QryConfiguracoesLAYOUT_NFCE: TIntegerField
      FieldName = 'LAYOUT_NFCE'
      Origin = 'LAYOUT_NFCE'
    end
    object QryConfiguracoesVERSAO_APLICATIVO_EMISSOR: TStringField
      FieldName = 'VERSAO_APLICATIVO_EMISSOR'
      Origin = 'VERSAO_APLICATIVO_EMISSOR'
      Size = 30
    end
    object QryConfiguracoesAMBIENTE_NFCE: TIntegerField
      FieldName = 'AMBIENTE_NFCE'
      Origin = 'AMBIENTE_NFCE'
    end
    object QryConfiguracoesOBSERVACAO_IMPRIMIR: TStringField
      FieldName = 'OBSERVACAO_IMPRIMIR'
      Origin = 'OBSERVACAO_IMPRIMIR'
      Size = 200
    end
    object QryConfiguracoesSERIE_NFCE: TIntegerField
      FieldName = 'SERIE_NFCE'
      Origin = 'SERIE_NFCE'
    end
    object QryConfiguracoesPASTA_SALVAR_XML_NFCE_CONT: TStringField
      FieldName = 'PASTA_SALVAR_XML_NFCE_CONT'
      Origin = 'PASTA_SALVAR_XML_NFCE_CONT'
      Size = 200
    end
    object QryConfiguracoesPASTA_SCHEMAS: TStringField
      FieldName = 'PASTA_SCHEMAS'
      Origin = 'PASTA_SCHEMAS'
      Size = 200
    end
  end
  object QryUsuarios: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 248
    Top = 96
    object QryUsuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryUsuariosid_endereco: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_endereco'
      Origin = 'id_endereco'
    end
    object QryUsuariosnome_completo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_completo'
      Origin = 'nome_completo'
      Size = 100
    end
    object QryUsuariosnome_usuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_usuario'
      Origin = 'nome_usuario'
      Size = 45
    end
    object QryUsuariosemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object QryUsuarioscpfcnpj: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cpfcnpj'
      Origin = 'cpfcnpj'
      Size = 30
    end
    object QryUsuariossenha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      Size = 50
    end
    object QryUsuariosfoto: TBlobField
      AutoGenerateValue = arDefault
      FieldName = 'foto'
      Origin = 'foto'
    end
    object QryUsuariosid_estabelecimento: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'id_estabelecimento'
      Origin = 'id_estabelecimento'
    end
    object QryUsuariostipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 15
    end
  end
  object QryTABNFCE: TFDQuery
    Connection = fdConn
    Left = 400
    Top = 96
  end
  object QryItens_NFCE: TFDQuery
    Connection = fdConn
    Left = 400
    Top = 152
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.WebServices.SSLType = LT_TLSv1_2
    Configuracoes.RespTec.IdCSRT = 0
    Left = 72
    Top = 112
  end
  object QryEmitente: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT'
      '  ID_CONTROLE,'
      '  RAZAO_SOCIAL,'
      '  NOME_FANTASIA,'
      '  ALIQUOTA_PIS,'
      '  ALIQUOTA_COFINS,'
      '  REGIME_TRIBUTARIO,'
      '  CNPJ,'
      '  ENDERECO,'
      '  ENDERECO_NUMERO,'
      '  ENDERECO_COMPLEMENTO,'
      '  BAIRRO,'
      '  CIDADE,'
      '  ESTADO,'
      '  CEP,'
      '  CODIGO_MUNICIPIO,'
      '  CNAE_FISCAL,'
      '  TELEFONE,'
      '  EMAIL,'
      '  RESPONSAVEL_TECNICO,'
      '  NOME_IMPRESSO_NFCE,'
      '  LOGOTIPO,'
      '  COD_ESTADO,'
      '  IE'
      'FROM'
      '  TABEMPRESA_EMITENTE'
      '')
    Left = 24
    Top = 176
    object QryEmitenteID_CONTROLE: TIntegerField
      FieldName = 'ID_CONTROLE'
      Origin = 'ID_CONTROLE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryEmitenteRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 60
    end
    object QryEmitenteNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object QryEmitenteALIQUOTA_PIS: TBCDField
      FieldName = 'ALIQUOTA_PIS'
      Origin = 'ALIQUOTA_PIS'
      Precision = 18
    end
    object QryEmitenteALIQUOTA_COFINS: TBCDField
      FieldName = 'ALIQUOTA_COFINS'
      Origin = 'ALIQUOTA_COFINS'
      Precision = 18
    end
    object QryEmitenteREGIME_TRIBUTARIO: TSmallintField
      FieldName = 'REGIME_TRIBUTARIO'
      Origin = 'REGIME_TRIBUTARIO'
    end
    object QryEmitenteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object QryEmitenteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object QryEmitenteENDERECO_NUMERO: TStringField
      FieldName = 'ENDERECO_NUMERO'
      Origin = 'ENDERECO_NUMERO'
    end
    object QryEmitenteENDERECO_COMPLEMENTO: TStringField
      FieldName = 'ENDERECO_COMPLEMENTO'
      Origin = 'ENDERECO_COMPLEMENTO'
      Size = 30
    end
    object QryEmitenteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object QryEmitenteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object QryEmitenteESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object QryEmitenteCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object QryEmitenteCODIGO_MUNICIPIO: TStringField
      FieldName = 'CODIGO_MUNICIPIO'
      Origin = 'CODIGO_MUNICIPIO'
      Size = 8
    end
    object QryEmitenteCNAE_FISCAL: TStringField
      FieldName = 'CNAE_FISCAL'
      Origin = 'CNAE_FISCAL'
      Size = 5
    end
    object QryEmitenteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object QryEmitenteEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object QryEmitenteRESPONSAVEL_TECNICO: TStringField
      FieldName = 'RESPONSAVEL_TECNICO'
      Origin = 'RESPONSAVEL_TECNICO'
      Size = 100
    end
    object QryEmitenteNOME_IMPRESSO_NFCE: TStringField
      FieldName = 'NOME_IMPRESSO_NFCE'
      Origin = 'NOME_IMPRESSO_NFCE'
      Size = 100
    end
    object QryEmitenteLOGOTIPO: TBlobField
      FieldName = 'LOGOTIPO'
      Origin = 'LOGOTIPO'
    end
    object QryEmitenteCOD_ESTADO: TIntegerField
      FieldName = 'COD_ESTADO'
      Origin = 'COD_ESTADO'
    end
    object QryEmitenteIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
  end
  object QryItensPedido: TFDQuery
    Connection = fdConn
    SQL.Strings = (
      'SELECT'
      '  TABPEDIDO.NUMERO_PEDIDO,'
      '  TABPEDIDO.DATA_PEDIDO,'
      '  TABPEDIDO.HORA_PEDIDO,'
      '  TABPEDIDO.TOTAL_PEDIDO,'
      '  TABPEDIDO.NUMERO_MESA,'
      '  TABPEDIDO.CODIGO_CLIENTE,'
      '  TABPEDIDO.ID_FORMA_PAGAMENTO,'
      ''
      '  TABFORMA_PAGAMENTO.ID_FORMA_PAGAMENTO,'
      '  TABFORMA_PAGAMENTO.DESCRICAO,'
      '  TABFORMA_PAGAMENTO.CODIGO_FORMA_PAGAMENTO,'
      ''
      '  TABPEDIDO_ITENS.NUMERO_ITEM,'
      '  TABPEDIDO_ITENS.CODIGO_PRODUTO,'
      '  TABPEDIDO_ITENS.QUANTIDADE,'
      '  TABPEDIDO_ITENS.PRECO,'
      '  TABPEDIDO_ITENS.TOTAL_ITEM,'
      ''
      '  TABPRODUTO.DESCRICAO,'
      '  TABPRODUTO.UNIDADE,'
      '  TABPRODUTO.ID_NCM,'
      '  TABPRODUTO.ALIQUOTA_ICMS,'
      '  TABPRODUTO.CST_ICMS,'
      '  TABPRODUTO.CSOSN_ICMS,'
      '  TABPRODUTO.ORIGEM,'
      '  TABPRODUTO.CST_PIS,'
      '  TABPRODUTO.CST_COFINS,'
      '  TABPRODUTO.CODIGO_EAN,'
      '  TABPRODUTO.IND_REGRA,'
      '  TABPRODUTO.CFOP,'
      '  TABPRODUTO.IF_AD_PROD,'
      ''
      '  TABNCM_IBPT.NCM,'
      '  TABNCM_IBPT.ALIQUOTA_IBPT_FEDERAL,'
      '  TABNCM_IBPT.ALIQUOTA_IBPT_ESTADUAL,'
      '  TABNCM_IBPT.ALIQUOTA_IBPT_MUNICIPAL,'
      '  TABNCM_IBPT.ALIQUOTA_IBPT_IMPORTADO'
      'FROM'
      '  TABPEDIDO,'
      '  TABPEDIDO_ITENS,'
      '  TABPRODUTO,'
      '  TABNCM_IBPT,'
      '  TABFORMA_PAGAMENTO'
      'WHERE'
      '      (TABPEDIDO.NUMERO_PEDIDO        = :pNUMERO_PEDIDO)'
      
        '  AND (TABPEDIDO.NUMERO_PEDIDO        = TABPEDIDO_ITENS.NUMERO_P' +
        'EDIDO)'
      
        '  AND (TABPEDIDO_ITENS.CODIGO_PRODUTO = TABPRODUTO.CODIGO_PRODUT' +
        'O)'
      '  AND (TABNCM_IBPT.ID_NCM             = TABPRODUTO.ID_NCM)'
      
        '  AND (TABPEDIDO.ID_FORMA_PAGAMENTO   = TABFORMA_PAGAMENTO.ID_FO' +
        'RMA_PAGAMENTO)'
      '')
    Left = 120
    Top = 176
    ParamData = <
      item
        Name = 'PNUMERO_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryItensPedidoNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
      Origin = 'NUMERO_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryItensPedidoDATA_PEDIDO: TDateField
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object QryItensPedidoHORA_PEDIDO: TTimeField
      FieldName = 'HORA_PEDIDO'
      Origin = 'HORA_PEDIDO'
    end
    object QryItensPedidoTOTAL_PEDIDO: TFMTBCDField
      FieldName = 'TOTAL_PEDIDO'
      Origin = 'TOTAL_PEDIDO'
      Precision = 18
      Size = 2
    end
    object QryItensPedidoNUMERO_MESA: TIntegerField
      FieldName = 'NUMERO_MESA'
      Origin = 'NUMERO_MESA'
    end
    object QryItensPedidoCODIGO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'CODIGO_CLIENTE'
    end
    object QryItensPedidoID_FORMA_PAGAMENTO: TIntegerField
      FieldName = 'ID_FORMA_PAGAMENTO'
      Origin = 'ID_FORMA_PAGAMENTO'
    end
    object QryItensPedidoID_FORMA_PAGAMENTO_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_FORMA_PAGAMENTO_1'
      Origin = 'ID_FORMA_PAGAMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object QryItensPedidoCODIGO_FORMA_PAGAMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_FORMA_PAGAMENTO'
      Origin = 'CODIGO_FORMA_PAGAMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QryItensPedidoNUMERO_ITEM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO_ITEM'
      Origin = 'NUMERO_ITEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoCODIGO_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'CODIGO_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoQUANTIDADE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QryItensPedidoPRECO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO'
      Origin = 'PRECO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QryItensPedidoTOTAL_ITEM: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_ITEM'
      Origin = 'TOTAL_ITEM'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QryItensPedidoDESCRICAO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_1'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QryItensPedidoUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QryItensPedidoID_NCM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_NCM'
      Origin = 'ID_NCM'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoALIQUOTA_ICMS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_ICMS'
      Origin = 'ALIQUOTA_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object QryItensPedidoCST_ICMS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_ICMS'
      Origin = 'CST_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object QryItensPedidoCSOSN_ICMS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CSOSN_ICMS'
      Origin = 'CSOSN_ICMS'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object QryItensPedidoORIGEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoCST_PIS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_PIS'
      Origin = 'CST_PIS'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object QryItensPedidoCST_COFINS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CST_COFINS'
      Origin = 'CST_COFINS'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object QryItensPedidoCODIGO_EAN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_EAN'
      Origin = 'CODIGO_EAN'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoIND_REGRA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'IND_REGRA'
      Origin = 'IND_REGRA'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryItensPedidoCFOP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CFOP'
      Origin = 'CFOP'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object QryItensPedidoIF_AD_PROD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IF_AD_PROD'
      Origin = 'IF_AD_PROD'
      ProviderFlags = []
      ReadOnly = True
      Size = 103
    end
    object QryItensPedidoNCM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NCM'
      Origin = 'NCM'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object QryItensPedidoALIQUOTA_IBPT_FEDERAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_IBPT_FEDERAL'
      Origin = 'ALIQUOTA_IBPT_FEDERAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QryItensPedidoALIQUOTA_IBPT_ESTADUAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_IBPT_ESTADUAL'
      Origin = 'ALIQUOTA_IBPT_ESTADUAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QryItensPedidoALIQUOTA_IBPT_MUNICIPAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_IBPT_MUNICIPAL'
      Origin = 'ALIQUOTA_IBPT_MUNICIPAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object QryItensPedidoALIQUOTA_IBPT_IMPORTADO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ALIQUOTA_IBPT_IMPORTADO'
      Origin = 'ALIQUOTA_IBPT_IMPORTADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
  end
end
