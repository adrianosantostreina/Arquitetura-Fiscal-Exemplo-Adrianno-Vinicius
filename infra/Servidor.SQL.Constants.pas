unit Servidor.SQL.Constants;

interface

const
  C_SQL_ITENS_PEDIDO =
    'SELECT                                                                              ' +
    '  TABPEDIDO.NUMERO_PEDIDO,                                                          ' +
    '  TABPEDIDO.DATA_PEDIDO,                                                            ' +
    '  TABPEDIDO.HORA_PEDIDO,                                                            ' +
    '  TABPEDIDO.TOTAL_PEDIDO,                                                           ' +
    '  TABPEDIDO.NUMERO_MESA,                                                            ' +
    '  TABPEDIDO.CODIGO_CLIENTE,                                                         ' +
    '  TABPEDIDO.ID_FORMA_PAGAMENTO,                                                     ' +
    '                                                                                    ' +
    '  TABFORMA_PAGAMENTO.ID_FORMA_PAGAMENTO,                                            ' +
    '  TABFORMA_PAGAMENTO.DESCRICAO,                                                     ' +
    '  TABFORMA_PAGAMENTO.CODIGO_FORMA_PAGAMENTO,                                        ' +
    '                                                                                    ' +
    '  TABPEDIDO_ITENS.NUMERO_ITEM,                                                      ' +
    '  TABPEDIDO_ITENS.CODIGO_PRODUTO,                                                   ' +
    '  TABPEDIDO_ITENS.QUANTIDADE,                                                       ' +
    '  TABPEDIDO_ITENS.PRECO,                                                            ' +
    '  TABPEDIDO_ITENS.TOTAL_ITEM,                                                       ' +
    '                                                                                    ' +
    '  TABPRODUTO.DESCRICAO,                                                             ' +
    '  TABPRODUTO.UNIDADE,                                                               ' +
    '  TABPRODUTO.ID_NCM,                                                                ' +
    '  TABPRODUTO.ALIQUOTA_ICMS,                                                         ' +
    '  TABPRODUTO.CST_ICMS,                                                              ' +
    '  TABPRODUTO.CSOSN_ICMS,                                                            ' +
    '  TABPRODUTO.ORIGEM,                                                                ' +
    '  TABPRODUTO.CST_PIS,                                                               ' +
    '  TABPRODUTO.CST_COFINS,                                                            ' +
    '  TABPRODUTO.CODIGO_EAN,                                                            ' +
    '  TABPRODUTO.IND_REGRA,                                                             ' +
    '  TABPRODUTO.CFOP,                                                                  ' +
    '  TABPRODUTO.IF_AD_PROD,                                                            ' +
    '                                                                                    ' +
    '  TABNCM_IBPT.NCM,                                                                  ' +
    '  TABNCM_IBPT.ALIQUOTA_IBPT_FEDERAL,                                                ' +
    '  TABNCM_IBPT.ALIQUOTA_IBPT_ESTADUAL,                                               ' +
    '  TABNCM_IBPT.ALIQUOTA_IBPT_MUNICIPAL,                                              ' +
    '  TABNCM_IBPT.ALIQUOTA_IBPT_IMPORTADO                                               ' +
    'FROM                                                                                ' +
    '  TABPEDIDO,                                                                        ' +
    '  TABPEDIDO_ITENS,                                                                  ' +
    '  TABPRODUTO,                                                                       ' +
    '  TABNCM_IBPT,                                                                      ' +
    '  TABFORMA_PAGAMENTO                                                                ' +
    'WHERE                                                                               ' +
    '      (TABPEDIDO.NUMERO_PEDIDO        = :pNUMERO_PEDIDO)                            ' +
    '  AND (TABPEDIDO.NUMERO_PEDIDO        = TABPEDIDO_ITENS.NUMERO_PEDIDO)              ' +
    '  AND (TABPEDIDO_ITENS.CODIGO_PRODUTO = TABPRODUTO.CODIGO_PRODUTO)                  ' +
    '  AND (TABNCM_IBPT.ID_NCM             = TABPRODUTO.ID_NCM)                          ' +
    '  AND (TABPEDIDO.ID_FORMA_PAGAMENTO   = TABFORMA_PAGAMENTO.ID_FORMA_PAGAMENTO)      ';

  C_SQL_EMITENTE =
    'SELECT                  ' +
    '  ID_CONTROLE,          ' +
    '  RAZAO_SOCIAL,         ' +
    '  NOME_FANTASIA,        ' +
    '  ALIQUOTA_PIS,         ' +
    '  ALIQUOTA_COFINS,      ' +
    '  REGIME_TRIBUTARIO,    ' +
    '  CNPJ,                 ' +
    '  ENDERECO,             ' +
    '  ENDERECO_NUMERO,      ' +
    '  ENDERECO_COMPLEMENTO, ' +
    '  BAIRRO,               ' +
    '  CIDADE,               ' +
    '  ESTADO,               ' +
    '  CEP,                  ' +
    '  CODIGO_MUNICIPIO,     ' +
    '  CNAE_FISCAL,          ' +
    '  TELEFONE,             ' +
    '  EMAIL,                ' +
    '  RESPONSAVEL_TECNICO,  ' +
    '  NOME_IMPRESSO_NFCE,   ' +
    '  LOGOTIPO,             ' +
    '  COD_ESTADO,           ' +
    '  IE                    ' +
    'FROM                    ' +
    '  TABEMPRESA_EMITENTE   ';

  C_TABNFCE =
    'INSERT INTO TABNFCE                     '+
    '(                                       '+
    '    NUMERO_NFCE                       , '+
    '    CHAVE_NFCE                        , '+
    '    NUMERO_CNF                        , '+
    '    DATA_EMISSAO                      , '+
    '    HORA_EMISSAO                      , '+
    '    CPF_CNPJ_NFCE                     , '+
    '    NUMERO_PEDIDO                     , '+
    '    TOTAL_NFCE                        , '+
    '    TOTAL_IMPOSTOS                    , '+
    '    VALOR_ICMS                        , '+
    '    VALOR_PIS                         , '+
    '    VALOR_COFINS                      , '+
    '    VALOR_ICMS_RETIDO                 , '+
    '    STATUS_NFCE                       , '+
    '    VALOR_DESCONTO_NFCE               , '+
    '    CODIGO_CLIENTE                    , '+
    '    NUMERO_PROTOCOLO                  , '+
    '    NUMERO_RECIBO                     , '+
    '    DATA_AUTORIZACAO                  , '+
    '    HORA_AUTORIZACAO                  , '+
    '    DATA_CANCELAMENTO                 , '+
    '    HORA_CANCELAMENTO                 , '+
    '    FLAG_EMITIDA_EM_CONTINGENCIA      , '+
    '    EMAIL_CLIENTE                     , '+
    '    MOTIVO_CONTINGENCIA               , '+
    //Necessário somente se estiver em contingência. Alterar a INSTRUÇÃO SQL DINAMICAMENTE
    '    DATA_ENTRADA_CONTINGENCIA         , '+
    '    HORA_ENTRADA_CONTINGENCIA         , '+
    '    LAYOUT_NFCE                       , '+
    '    VERSAO_APLICATIVO                 , '+
    '    ID_FORMA_PAGAMENTO                , '+
    '    FLAG_ENVIAR_EMAIL_PARA_CLIENTE    , '+
    '    NUMERO_WHATSAPP                   , '+
    '    QR_CODE                           , '+
    '    DESCRICAO_STATUS_NFCE             , '+
    '    SERIE_NFCE                        , '+
    '    NUMERO_TERMINAL_NFCE              , '+
    '    VALOR_TROCO                         '+
    ')                                       '+
    'VALUES                                  '+
    '(                                       '+
    '    :pNUMERO_NFCE                     , '+
    '    :pCHAVE_NFCE                      , '+
    '    :pNUMERO_CNF                      , '+
    '    :pDATA_EMISSAO                    , '+
    '    :pHORA_EMISSAO                    , '+
    '    :pCPF_CNPJ_NFCE                   , '+
    '    :pNUMERO_PEDIDO                   , '+
    '    :pTOTAL_NFCE                      , '+
    '    :pTOTAL_IMPOSTOS                  , '+
    '    :pVALOR_ICMS                      , '+
    '    :pVALOR_PIS                       , '+
    '    :pVALOR_COFINS                    , '+
    '    :pVALOR_ICMS_RETIDO               , '+
    '    :pSTATUS_NFCE                     , '+
    '    :pVALOR_DESCONTO_NFCE             , '+
    '    :pCODIGO_CLIENTE                  , '+
    '    :pNUMERO_PROTOCOLO                , '+
    '    :pNUMERO_RECIBO                   , '+
    '    :pDATA_AUTORIZACAO                , '+
    '    :pHORA_AUTORIZACAO                , '+
    '    :pDATA_CANCELAMENTO               , '+
    '    :pHORA_CANCELAMENTO               , '+
    '    :pFLAG_EMITIDA_EM_CONTINGENCIA    , '+
    '    :pEMAIL_CLIENTE                   , '+
    '    :pMOTIVO_CONTINGENCIA             , '+
    //Necessário somente se estiver em contingência. Alterar a INSTRUÇÃO SQL DINAMICAMENTE
    '    :pDATA_ENTRADA_CONTINGENCIA       , '+
    '    :pHORA_ENTRADA_CONTINGENCIA       , '+
    '    :pLAYOUT_NFCE                     , '+
    '    :pVERSAO_APLICATIVO               , '+
    '    :pID_FORMA_PAGAMENTO              , '+
    '    :pFLAG_ENVIAR_EMAIL_PARA_CLIENTE  , '+
    '    :pNUMERO_WHATSAPP                 , '+
    '    :pQR_CODE                         , '+
    '    :pDESCRICAO_STATUS_NFCE           , '+
    '    :pSERIE_NFCE                      , '+
    '    :pNUMERO_TERMINAL_NFCE            , '+
    '    :pVALOR_TROCO                       '+
    ');                                      ';


  C_ITENS_NFCE =
    'INSERT INTO TABNFCE_ITENS         ' +
    '(                                 ' +
    '    NUMERO_NFCE                 , ' +
    '    NUMERO_ITEM                 , ' +
    '    CODIGO_PRODUTO              , ' +
    '    VALOR_UNITARO               , ' +
    '    VALOR_DESCONTO_ITEM         , ' +
    '    VALOR_ICMS_ITEM             , ' +
    '    VALOR_PIS_ITEM              , ' +
    '    VALOR_COFINS_ITEM           , ' +
    '    VALOR_ICMS_ST_RETIDO_ITEM   , ' +
    '    TOTAL_ITEM                  , ' +
    '    CFOP_ITEM                   , ' +
    '    IND_REGRA                   , ' +
    '    INF_AD_PROD                 , ' +
    '    DESCRICAO                     ' +
    ')                                 ' +
    'VALUES                            ' +
    '(                                 ' +
    '    :pNUMERO_NFCE               , ' +
    '    :pNUMERO_ITEM               , ' +
    '    :pCODIGO_PRODUTO            , ' +
    '    :pVALOR_UNITARO             , ' +
    '    :pVALOR_DESCONTO_ITEM       , ' +
    '    :pVALOR_ICMS_ITEM           , ' +
    '    :pVALOR_PIS_ITEM            , ' +
    '    :pVALOR_COFINS_ITEM         , ' +
    '    :pVALOR_ICMS_ST_RETIDO_ITEM , ' +
    '    :pTOTAL_ITEM                , ' +
    '    :pCFOP_ITEM                 , ' +
    '    :pIND_REGRA                 , ' +
    '    :pINF_AD_PROD               , ' +
    '    :pDESCRICAO                   ' +
    ')                                ';

implementation

end.
