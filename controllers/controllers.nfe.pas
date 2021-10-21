unit controllers.nfe;

interface

procedure Registry;

implementation

uses
  Horse,
  Horse.JWT,
  Providers.Authorization,

  Service.Principal,

  System.Classes,
  System.JSON,
  System.StrUtils,
  System.SysUtils;

procedure DoEmitir(Req: THorseRequest;  Res: THorseResponse; Next: TProc);
var
  DM          : TDM;
  LNumPedido  : Integer;
  LFormaPagto : Integer;
begin
  try
    //Por Query Params
    LNumPedido  := Req.Query.Items['numpedido'].ToInteger();
    LFormaPagto := Req.Query.Items['formapagto'].ToInteger();

    //Por URL Params
    //LNumPedido  := Req.Params.Items['numpedido'].ToInteger();
    //LFormaPagto := Req.Params.Items['formapagto'].ToInteger();

    DM := TDM.Create(nil);

    Res
      .Send(DM.Emitir(LNumPedido, LFormaPagto))
      .Status(THTTPStatus.Created);
  finally
    DM.Free;
  end;
end;

procedure Registry;
begin
  THorse
    .Post('/nfe/emitir', Authorization, DoEmitir);
end;

end.
