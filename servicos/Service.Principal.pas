unit Service.Principal;

interface

uses
  ACBrBase,
  ACBrDFe,
  ACBrNFe,

  Servidor.SQL.Constants,
  ACBrDFeSSL,

  pcnConversaoNFe,
  pcnConversao,

  ACBrUtil,
  ACBrNFeDANFeESCPOS,
  ACBrMail,
  ACBrDANFCeFortesFr,

  Data.DB,

  idCoderMime,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.ConsoleUI.Wait,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,

  System.Classes,
  System.JSON,
  System.SysUtils;

const
  C_ARQUIVO   = 'SEU ARQUIVO.PFX';
  C_SENHA     = 'SUA SENHA';
  C_NUM_SERIE = 'SEU NUM SERIE';


type
  TDM = class(TDataModule)
    fdConn: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    QryAuxiliar: TFDQuery;
    QryConfiguracoes: TFDQuery;
    QryConfiguracoesID_CONTROLE: TIntegerField;
    QryConfiguracoesNUMERO_NFCE: TIntegerField;
    QryConfiguracoesPASTA_SALVAR_XML_NFCE: TStringField;
    QryConfiguracoesPASTA_SALVAR_PDF_NFCE: TStringField;
    QryConfiguracoesASSUNTO_EMAIL_NFCE: TStringField;
    QryConfiguracoesLAYOUT_NFCE: TIntegerField;
    QryConfiguracoesVERSAO_APLICATIVO_EMISSOR: TStringField;
    QryConfiguracoesAMBIENTE_NFCE: TIntegerField;
    QryConfiguracoesOBSERVACAO_IMPRIMIR: TStringField;
    QryConfiguracoesSERIE_NFCE: TIntegerField;
    QryConfiguracoesPASTA_SALVAR_XML_NFCE_CONT: TStringField;
    QryConfiguracoesPASTA_SCHEMAS: TStringField;
    QryUsuarios: TFDQuery;
    QryUsuariosid: TFDAutoIncField;
    QryUsuariosid_endereco: TIntegerField;
    QryUsuariosnome_completo: TStringField;
    QryUsuariosnome_usuario: TStringField;
    QryUsuariosemail: TStringField;
    QryUsuarioscpfcnpj: TStringField;
    QryUsuariossenha: TStringField;
    QryUsuariosfoto: TBlobField;
    QryUsuariosid_estabelecimento: TIntegerField;
    QryUsuariostipo: TStringField;
    QryTABNFCE: TFDQuery;
    QryItens_NFCE: TFDQuery;
    ACBrNFe1: TACBrNFe;
    QryEmitente: TFDQuery;
    QryEmitenteID_CONTROLE: TIntegerField;
    QryEmitenteRAZAO_SOCIAL: TStringField;
    QryEmitenteNOME_FANTASIA: TStringField;
    QryEmitenteALIQUOTA_PIS: TBCDField;
    QryEmitenteALIQUOTA_COFINS: TBCDField;
    QryEmitenteREGIME_TRIBUTARIO: TSmallintField;
    QryEmitenteCNPJ: TStringField;
    QryEmitenteENDERECO: TStringField;
    QryEmitenteENDERECO_NUMERO: TStringField;
    QryEmitenteENDERECO_COMPLEMENTO: TStringField;
    QryEmitenteBAIRRO: TStringField;
    QryEmitenteCIDADE: TStringField;
    QryEmitenteESTADO: TStringField;
    QryEmitenteCEP: TStringField;
    QryEmitenteCODIGO_MUNICIPIO: TStringField;
    QryEmitenteCNAE_FISCAL: TStringField;
    QryEmitenteTELEFONE: TStringField;
    QryEmitenteEMAIL: TStringField;
    QryEmitenteRESPONSAVEL_TECNICO: TStringField;
    QryEmitenteNOME_IMPRESSO_NFCE: TStringField;
    QryEmitenteLOGOTIPO: TBlobField;
    QryEmitenteCOD_ESTADO: TIntegerField;
    QryEmitenteIE: TStringField;
    QryItensPedido: TFDQuery;
    QryItensPedidoNUMERO_PEDIDO: TIntegerField;
    QryItensPedidoDATA_PEDIDO: TDateField;
    QryItensPedidoHORA_PEDIDO: TTimeField;
    QryItensPedidoTOTAL_PEDIDO: TFMTBCDField;
    QryItensPedidoNUMERO_MESA: TIntegerField;
    QryItensPedidoCODIGO_CLIENTE: TIntegerField;
    QryItensPedidoID_FORMA_PAGAMENTO: TIntegerField;
    QryItensPedidoID_FORMA_PAGAMENTO_1: TIntegerField;
    QryItensPedidoDESCRICAO: TStringField;
    QryItensPedidoCODIGO_FORMA_PAGAMENTO: TStringField;
    QryItensPedidoNUMERO_ITEM: TIntegerField;
    QryItensPedidoCODIGO_PRODUTO: TIntegerField;
    QryItensPedidoQUANTIDADE: TBCDField;
    QryItensPedidoPRECO: TFMTBCDField;
    QryItensPedidoTOTAL_ITEM: TFMTBCDField;
    QryItensPedidoDESCRICAO_1: TStringField;
    QryItensPedidoUNIDADE: TStringField;
    QryItensPedidoID_NCM: TIntegerField;
    QryItensPedidoALIQUOTA_ICMS: TFMTBCDField;
    QryItensPedidoCST_ICMS: TStringField;
    QryItensPedidoCSOSN_ICMS: TStringField;
    QryItensPedidoORIGEM: TSmallintField;
    QryItensPedidoCST_PIS: TStringField;
    QryItensPedidoCST_COFINS: TStringField;
    QryItensPedidoCODIGO_EAN: TStringField;
    QryItensPedidoIND_REGRA: TSmallintField;
    QryItensPedidoCFOP: TStringField;
    QryItensPedidoIF_AD_PROD: TStringField;
    QryItensPedidoNCM: TStringField;
    QryItensPedidoALIQUOTA_IBPT_FEDERAL: TBCDField;
    QryItensPedidoALIQUOTA_IBPT_ESTADUAL: TBCDField;
    QryItensPedidoALIQUOTA_IBPT_MUNICIPAL: TBCDField;
    QryItensPedidoALIQUOTA_IBPT_IMPORTADO: TBCDField;
  private
    { Private declarations }
    procedure PrepareConfigurations;
    function  GetNumeroNFCE: Integer;
    procedure SetNumeroNFCE(const Value: Integer);
  public
    { Public declarations }
    function Emitir(ANumPedido, AFormaPagamento: Integer): TJSONObject;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}
{$R *.dfm}

{ TDM }

function TDM.Emitir(ANumPedido, AFormaPagamento: Integer): TJSONObject;
(*
var
  LNumPedido    : Integer;
  LFormaPagto   : Integer;
  LTotalPedido  : Double;
  LNumLote      : String;
  LSincrono     : Boolean;
  LEnviaEmail   : Boolean;
  LEmail        : string;
  LStrMessage   : TStringList;
  LInternet     : Boolean;

begin

  try
    try
      fdConn.TxOptions.AutoCommit := False;
      if not fdConn.InTransaction then
        fdConn.StartTransaction;

      LNumLote    := '1';
      LSincrono   := True;

      //Dados vindos do aplicativo cliente
      LNumPedido  := ANumPedido;
      LFormaPagto := AFormaPagamento;
      LEnviaEmail := False;
      LEmail      := '';

      PrepareConfigurations;

      //Emitente
      QryEmitente.Active := False;
      QryEmitente.SQL.Clear;
      QryEmitente.SQL.Text := C_SQL_EMITENTE;
      QryEmitente.Active := True;

      //Preparação do componente AcBr
      ACBrNFe1.NotasFiscais.Clear;
      ACBrNFe1.Configuracoes.Geral.ModeloDF       := moNFCe;
      ACBrNFe1.Configuracoes.Geral.VersaoDF       := ve400;
      ACBrNFe1.Configuracoes.Geral.VersaoQRCode   := veqr200;
      //ACBrNFe1.Configuracoes.Arquivos.PathSchemas := ;

      {$Region 'Capa da Nota'}
      //Capa da emissão
      with ACBrNFe1.NotasFiscais.Add.NFe do
      begin
        Ide.cUF                := QryEmitenteCOD_ESTADO.AsInteger;                   // Codigo da UF do emitente, aqui SP
        //Controle da software house
        Ide.cNF                := QryConfiguracoesNUMERO_NFCE.AsInteger * 2;         // Numero de controle interno da empresa, Caso não seja preenchido será gerado um número aleatório pelo componente

        Ide.natOp              := 'VENDA';                                           // Natureza da operacaçãoo
        Ide.modelo             := 65;                                                // Modelo NFC-e
        Ide.serie              := 1;                                                 // Série da Nota

        //número real
        Ide.nNF                := QryConfiguracoesNUMERO_NFCE.AsInteger;             // '000000001' - Numero do cupom

        Ide.dEmi               := Now;                                               // Nesse formato '2019-11-25T10:00:00-03:00'
        Ide.dSaiEnt            := Now;                                               // Nesse formato '2019-11-25T10:00:00-03:00'
        Ide.tpNF               := tnSaida;                                           // Saida
        Ide.idDest             := doInterna;                                         // Operação interna
        Ide.cMunFG             := QryEmitenteCODIGO_MUNICIPIO.AsInteger;             // Código IBGE da Cidade
        Ide.tpImp              := tiNFCe;                                            // DANFENFCE ou 5 quando por email

        //Tipo de Emissão Contingência
        if LInternet
        then Ide.tpEmis        := teNormal                                           // Emissão normal
        else Ide.tpEmis        := teContingencia;

        Ide.tpAmb              := taHomologacao;                                     // Homologacao/Teste, Lembre-se de trocar para 1 quando for para ambiente de producão
        Ide.finNFe             := fnNormal;                                          // Finalidade normal
        Ide.indFinal           := cfConsumidorFinal;                                 // Consumidor Final
        Ide.indPres            := pcPresencial;                                      // Operacao Presencial
        Ide.procEmi            := peAplicativoContribuinte;                          // Emissão com applicatico do contribuinte
        Ide.verProc            := '1.0';                                             // Versao

        //Contingência
        if not LInternet then
        begin
          Ide.dhCont  := Now;                                                        //  Somente contigencia '2019-11-25T10:00:00-03:00'
          Ide.xJust   := 'Internet caiu';                                            //  Somente contigencia 'Justificativa Contingencia'
        end;

        Emit.CNPJCPF           := QryEmitenteCNPJ.AsString;;                         // CNPJ
        Emit.xNome             := QryEmitenteRAZAO_SOCIAL.AsString;                  // Razao Social
        Emit.xFant             := QryEmitenteNOME_FANTASIA.AsString;;                // Nome Fantasia

        Emit.EnderEmit.xLgr    := QryEmitenteENDERECO.AsString;                      // Logradouro
        Emit.EnderEmit.nro     := QryEmitenteENDERECO_NUMERO.AsString;               // Numero
        Emit.EnderEmit.xCpl    := QryEmitenteENDERECO_COMPLEMENTO.AsString;          // Complemento
        Emit.EnderEmit.xBairro := QryEmitenteBAIRRO.AsString;                        // Bairro
        Emit.EnderEmit.cMun    := StrToInt(QryEmitenteCODIGO_MUNICIPIO.AsString);    // Código municipio, aqui Sao Paulo
        Emit.EnderEmit.xMun    := QryEmitenteCIDADE.AsString;                        // Cidade
        Emit.EnderEmit.UF      := QryEmitenteESTADO.AsString;                        // UF
        Emit.EnderEmit.CEP     := StrToInt(OnlyNumber(QryEmitenteCEP.AsString));     // CEP
        Emit.EnderEmit.cPais   := 1058;
        Emit.EnderEmit.xPais   := 'BRASIL';
        Emit.EnderEmit.fone    := QryEmitenteTELEFONE.AsString;                      // Telefone
        Emit.IE                := QryEmitenteIE.AsString;                            // Inscricao Estadual

        //Emit.IM              := '2648800';                                         // Preencher no caso de existir serviços na nota a inclusão de serviços
        Emit.CRT               := crtSimplesNacional;                                // Tabela Configurações - Regime Tributario aqui 1 Simples Nacional

        //Inclusão da Capa do da nota na tabela TABNFCE
        if QryTABNFCE.Active then
          QryTABNFCE.Active := False;
        QryTABNFCE.SQL.Clear;
        QryTABNFCE.SQL.Text         := C_TABNFCE;
        QryTABNFCE.Params.ArraySize := 1;

        QryTABNFCE.ParamByName('pNUMERO_NFCE').AsIntegers[0]                     := Ide.nNF;
        QryTABNFCE.ParamByName('pCHAVE_NFCE').AsStrings[0]                       := '';
        QryTABNFCE.ParamByName('pNUMERO_CNF').AsStrings[0]                       := Ide.cNF.ToString;
        QryTABNFCE.ParamByName('pDATA_EMISSAO').AsDateTimes[0]                   := Now;
        QryTABNFCE.ParamByName('pHORA_EMISSAO').AsDateTimes[0]                   := Now;
        QryTABNFCE.ParamByName('pCPF_CNPJ_NFCE').AsStrings[0]                    := EmptyStr;
        QryTABNFCE.ParamByName('pNUMERO_PEDIDO').AsIntegers[0]                   := LNumPedido;
        QryTABNFCE.ParamByName('pTOTAL_NFCE').AsFloats[0]                        := QryItensPedidoTOTAL_PEDIDO.AsFloat;
        QryTABNFCE.ParamByName('pTOTAL_IMPOSTOS').AsFloats[0]                    := 0.0;
        QryTABNFCE.ParamByName('pVALOR_ICMS').AsFloats[0]                        := 0.0;
        QryTABNFCE.ParamByName('pVALOR_PIS').AsFloats[0]                         := 0.0;
        QryTABNFCE.ParamByName('pVALOR_COFINS').AsFloats[0]                      := 0.0;
        QryTABNFCE.ParamByName('pVALOR_ICMS_RETIDO').AsFloats[0]                 := 0.0;
        QryTABNFCE.ParamByName('pSTATUS_NFCE').AsIntegers[0]                     := 0; //Particular Emitida
        QryTABNFCE.ParamByName('pVALOR_DESCONTO_NFCE').AsFloats[0]               := 0.0;
        QryTABNFCE.ParamByName('pCODIGO_CLIENTE').AsIntegers[0]                  := 0;
        QryTABNFCE.ParamByName('pNUMERO_PROTOCOLO').AsStrings[0]                 := EmptyStr;
        QryTABNFCE.ParamByName('pNUMERO_RECIBO').AsStrings[0]                    := EmptyStr;
        QryTABNFCE.ParamByName('pDATA_AUTORIZACAO').AsDateTimes[0]               := Now;
        QryTABNFCE.ParamByName('pHORA_AUTORIZACAO').AsDateTimes[0]               := Now;
        QryTABNFCE.ParamByName('pDATA_CANCELAMENTO').AsDateTimes[0]              := Now;
        QryTABNFCE.ParamByName('pHORA_CANCELAMENTO').AsDateTimes[0]              := Now;
        QryTABNFCE.ParamByName('pFLAG_EMITIDA_EM_CONTINGENCIA').AsIntegers[0]    := 0;
        QryTABNFCE.ParamByName('pEMAIL_CLIENTE').AsStrings[0]                    := LEmail;

        //Necessário somente se estiver em contingência. Alterar a INSTRUÇÃO SQL DINAMICAMENTE

        //Contingência
        if LInternet then
        begin
          QryTABNFCE.ParamByName('pDATA_ENTRADA_CONTINGENCIA').AsDateTimes[0]      := 0;
          QryTABNFCE.ParamByName('pHORA_ENTRADA_CONTINGENCIA').AsDateTimes[0]      := 0;
          QryTABNFCE.ParamByName('pMOTIVO_CONTINGENCIA').AsStrings[0]              := EmptyStr;
        end
        else
        begin
          QryTABNFCE.ParamByName('pDATA_ENTRADA_CONTINGENCIA').AsDateTimes[0]      := Date; //TimeStamp = Now
          QryTABNFCE.ParamByName('pHORA_ENTRADA_CONTINGENCIA').AsDateTimes[0]      := Time;
          QryTABNFCE.ParamByName('pMOTIVO_CONTINGENCIA').AsStrings[0]              := 'Internet caiu';
        end;

        QryTABNFCE.ParamByName('pLAYOUT_NFCE').AsIntegers[0]                     := 0;
        QryTABNFCE.ParamByName('pVERSAO_APLICATIVO').AsStrings[0]                := '1.0';
        QryTABNFCE.ParamByName('pID_FORMA_PAGAMENTO').AsIntegers[0]              := LFormaPagto;
        QryTABNFCE.ParamByName('pFLAG_ENVIAR_EMAIL_PARA_CLIENTE').AsIntegers[0]  := 0;
        QryTABNFCE.ParamByName('pNUMERO_WHATSAPP').AsStrings[0]                  := EmptyStr;
        QryTABNFCE.ParamByName('pQR_CODE').AsStrings[0]                          := EmptyStr;
        QryTABNFCE.ParamByName('pDESCRICAO_STATUS_NFCE').AsStrings[0]            := EmptyStr;
        QryTABNFCE.ParamByName('pSERIE_NFCE').AsIntegers[0]                      := 1;
        QryTABNFCE.ParamByName('pNUMERO_TERMINAL_NFCE').AsIntegers[0]            := 1;
        QryTABNFCE.ParamByName('pVALOR_TROCO').AsFloats[0]                       := 0.0;

        QryTABNFCE.Execute(1, 0);

        //Abre a tabela de itens da nota fiscal
        //Monta a parte de intes da nota fiscal consumidor eletrônica
        QryItensPedido.Active := False;
        QryItensPedido.SQL.Clear;
        QryItensPedido.SQL.Text := C_SQL_ITENS_PEDIDO;
        QryItensPedido.Params.CreateParam(ftInteger, 'pNUMERO_PEDIDO', ptInput);
        QryItensPedido.ParamByName('pNUMERO_PEDIDO').AsInteger := LNumPedido;
        QryItensPedido.Active := True;

        var LArraySize : Integer := QryItensPedido.RecordCount;

        if QryItens_NFCE.Active then
          QryItens_NFCE.Active := False;
        QryItens_NFCE.SQL.Clear;
        QryItens_NFCE.SQL.Text         := C_ITENS_NFCE;
        QryItens_NFCE.Params.ArraySize := LArraySize;

        var LIndex : Integer := -1;
        {$Region 'Itens da Nota'}
        if not QryItensPedido.IsEmpty then
        begin
          QryItensPedido.First;
          LTotalPedido := QryItensPedidoTOTAL_PEDIDO.AsFloat;

          while not QryItensPedido.Eof do
          begin
            Inc(LIndex);

            with Det.New do
            begin
              Prod.nItem            := QryItensPedidoNUMERO_ITEM.AsInteger;          // Número sequencial, para cada item deve ser incrementado
              Prod.cProd            := QryItensPedidoCODIGO_PRODUTO.AsString;        // Código do Produto
              Prod.cEAN             := QryItensPedidoCODIGO_EAN.AsString;            // GTIN antigo EAN, Código de Barras
              Prod.xProd            := QryItensPedidoDESCRICAO.AsString;
              Prod.NCM              := QryItensPedidoNCM.AsString;;                  // NCM

              Prod.CFOP             := QryItensPedidoCFOP.AsString;                  // CFOP - TABELA DE CFOP
              Prod.uCom             := QryItensPedidoUNIDADE.AsString;               // Unidade Comercial
              Prod.qCom             := QryItensPedidoQUANTIDADE.AsFloat;             // Quantidade do produto
              Prod.vUnCom           := QryItensPedidoPRECO.AsFloat;                  // Valor unitario
              Prod.vProd            := QryItensPedidoTOTAL_ITEM.AsFloat;             // Valor Total do Produto

              Prod.cEANTrib         := QryItensPedidoCODIGO_EAN.AsString;
              Prod.uTrib            := QryItensPedidoUNIDADE.AsString;
              Prod.qTrib            := QryItensPedidoQUANTIDADE.AsFloat;             // Quantidade do produto
              Prod.vUnTrib          := QryItensPedidoPRECO.AsFloat;

              Prod.vFrete           := 0;
              Prod.vSeg             := 0;
              Prod.vDesc            := 0;
              Prod.vOutro           := 0;
              Prod.indTot           := itSomaTotalNFe;                              // Valor compoe o total da nota

              with Imposto do
              begin
                //ICMS
                ICMS.orig           := oeNacional;                                   // Origem, aqui Nacional
                ICMS.CSOSN          := csosn102;                                     // Simples Nacional sem permissão de crédito

                //PIS
                PIS.CST             := pis99;                                        // Outras Operaçoes
                PIS.vBC             := 0.00;                                         // Base de Calculo
                PIS.pPIS            := 0.00;                                         // Aliquota de PIS
                PIS.vPIS            := 0.00;                                         // Valor de PIS

                //COFINS
                COFINS.CST          := cof99;                                        // Outras opracoes
                COFINS.vBC          := 0.00;                                         // Base de Calculo
                COFINS.pCOFINS      := 0.00;                                         // aliquota de COFINS
                COFINS.vCOFINS      := 0.00;                                         // Valor de COFINS
              end;


              //GRAVAR NO ITENS DA TABNFCE_ITENS
              QryItens_NFCE.ParamByName('pNUMERO_NFCE').AsIntegers[LIndex]             := Ide.nNF;
              QryItens_NFCE.ParamByName('pNUMERO_ITEM').AsIntegers[LIndex]             := Prod.nItem;
              QryItens_NFCE.ParamByName('pCODIGO_PRODUTO').AsIntegers[LIndex]          := Prod.cProd.ToInteger;
              QryItens_NFCE.ParamByName('pVALOR_UNITARO').AsFloats[LIndex]             := Prod.vUnCom;
              QryItens_NFCE.ParamByName('pVALOR_DESCONTO_ITEM').AsFloats[LIndex]       := Prod.vDesc;
              QryItens_NFCE.ParamByName('pVALOR_ICMS_ITEM').AsFloats[LIndex]           := 0.0;
              QryItens_NFCE.ParamByName('pVALOR_PIS_ITEM').AsFloats[LIndex]            := Imposto.PIS.pPIS;
              QryItens_NFCE.ParamByName('pVALOR_COFINS_ITEM').AsFloats[LIndex]         := Imposto.COFINS.pCOFINS;
              QryItens_NFCE.ParamByName('pVALOR_ICMS_ST_RETIDO_ITEM').AsFloats[LIndex] := 0.0;
              QryItens_NFCE.ParamByName('pTOTAL_ITEM').AsFloats[LIndex]                := Prod.vProd;
              QryItens_NFCE.ParamByName('pCFOP_ITEM').AsIntegers[LIndex]               := 0; //O aluno deve ter uma tabela de CPOP e indicar aqui o ID_DO_CFOP
              QryItens_NFCE.ParamByName('pIND_REGRA').AsIntegers[LIndex]               := 0;
              QryItens_NFCE.ParamByName('pINF_AD_PROD').AsStrings[LIndex]              := EmptyStr;
              QryItens_NFCE.ParamByName('pDESCRICAO').AsStrings[LIndex]                := Prod.xProd;

            end;

            QryItensPedido.Next;
          end;
          //Depois que terminar de preencher os parâmetros de TODOS os itens, executa.
          QryItens_NFCE.Execute(LArraySize, 0);
        end;
        {$EndRegion}
        //Totais
        Total.ICMSTot.vBC           := 0;                                            // Sempre para simples nacional
        Total.ICMSTot.vICMS         := 0;
        Total.ICMSTot.vBCST         := 0;
        Total.ICMSTot.vST           := 0;
        Total.ICMSTot.vProd         := LTotalPedido;                                 // Total do pedido
        Total.ICMSTot.vFrete        := 0;
        Total.ICMSTot.vSeg          := 0;
        Total.ICMSTot.vDesc         := 0;
        Total.ICMSTot.vII           := 0;
        Total.ICMSTot.vIPI          := 0;
        Total.ICMSTot.vPIS          := 0.00;
        Total.ICMSTot.vCOFINS       := 0.00;
        Total.ICMSTot.vOutro        := 0;
        Total.ICMSTot.vNF           := LTotalPedido;                                 // Total do pedido

        Total.ICMSTot.vTotTrib      := 0;                                            //'21.65' //Valor aproximados dos tributos

        // Partilha do ICMS e fundo de probreza
        Total.ICMSTot.vFCPUFDest    := 0.00;
        Total.ICMSTot.vICMSUFDest   := 0.00;
        Total.ICMSTot.vICMSUFRemet  := 0.00;

        Transp.modFrete             :=  mfSemFrete;                                  // Sem Frete NFC-e não pode ter FRETE

        with pag.New do
        begin
          //TpcnFormaPagamento
          case LFormaPagto of
            0: tPag := fpDinheiro;
            1: tPag := fpCheque;
            2: tPag := fpCartaoCredito;
            3: tPag := fpCartaoDebito;
            5: tPag := fpValeAlimentacao;
            6: tPag := fpValeRefeicao;
          end;
          vPag                      := LTotalPedido;
        end;

        InfAdic.infCpl     :=  '';
        InfAdic.infAdFisco :=  '';
      end;
      {$EndRegion}

      ACBrNFe1.NotasFiscais.GerarNFe;

      ACBrNFe1.Configuracoes.Certificados.ArquivoPFX  := C_ARQUIVO;
      ACBrNFe1.Configuracoes.Certificados.Senha       := C_SENHA;
      ACBrNFe1.Configuracoes.Certificados.NumeroSerie := C_NUM_SERIE;

      ACBrNFe1.SSL.DescarregarCertificado;

      ACBrNFe1.Configuracoes.Geral.SSLLib             := TSSLLib(3);
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib        := TSSLCryptLib(3);
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib         := TSSLHttpLib(2);
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib      := TSSLXmlSignLib(4);

      ACBrNFe1.NotasFiscais.Assinar;

      ACBrNFe1.Configuracoes.Arquivos.PathNFe := 'C:\Emissor\NF\XML\';
      ACBrNFe1.NotasFiscais.Items[0].GravarXML();

      var LResult   : TJSONObject := TJSONObject.Create;
      LResult.AddPair('notaFiscal', TJSONNumber.Create(QryConfiguracoesNUMERO_NFCE.AsInteger + 1));

      SetNumeroNFCE(QryConfiguracoesNUMERO_NFCE.AsInteger + 1);

      Result := LResult;

      if fdConn.InTransaction then
        fdConn.Commit;
      fdConn.TxOptions.AutoCommit := True;

    except on E:Exception do
      begin
        if fdConn.InTransaction then
          fdConn.Rollback;
        raise Exception.Create(E.Message);
        fdConn.TxOptions.AutoCommit := True;
      end;
    end;
  finally

  end;
*)

var
  J : TJSONObject;
begin
  //Emite a nota
  J := TJSONObject.Create;
  J.AddPair('numero_nota', TJSONNumber(1000));
  Result := J;
end;

function TDM.GetNumeroNFCE: Integer;
begin
  try
    QryConfiguracoes.Active := True;
    Result := QryConfiguracoesNUMERO_NFCE.AsInteger;
  except on E:Exception do
    begin
      //Sua rotina de tratamento de erro
    end;
  end;
end;

procedure TDM.PrepareConfigurations;
begin
  try
    QryConfiguracoes.Active := False;
    QryConfiguracoes.SQL.Clear;
    QryConfiguracoes.SQL.Text := 'SELECT * FROM TABCONFIGURACAO';
    QryConfiguracoes.Active := True;
  except on E:Exception do
    begin
      //Sua rotina de tratamento de erro
    end;
  end;
end;

procedure TDM.SetNumeroNFCE(const Value: Integer);
begin
  try
    QryConfiguracoes.Active := False;
    QryConfiguracoes.Active := True;
    QryConfiguracoes.Edit;
    QryConfiguracoesNUMERO_NFCE.AsInteger := Value;
    QryConfiguracoes.Post;
    QryConfiguracoes.Active := False;
  except on E:Exception do
    begin
      //Sua rotina de tratamento de erro
    end;
  end;

end;

end.
