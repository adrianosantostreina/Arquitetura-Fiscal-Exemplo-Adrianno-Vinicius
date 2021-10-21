unit controllers.auth;

interface

procedure Registry;

implementation

uses
  DateUtils,
  Horse,

  JOSE.Core.Builder,
  JOSE.Core.JWT,

  Providers.Authorization,

  System.Classes,
  System.JSON,
  System.StrUtils,
  System.SysUtils;

procedure DoCreateToken(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LJWT: TJWT;
begin
  try
    LJWT := TJWT.Create;
    LJWT.Claims.IssuedAt   := Now;
    {$IFDEF DEBUG}
      LJWT.Claims.Expiration := IncMonth(Now, 1);
    {$ELSE}
      LJWT.Claims.Expiration := IncMinute(Now, 10);
    {$ENDIF}
    LJWT.Claims.Subject    := 'Token de uso geral';

    Res.Send(TJOSE.SHA256CompactToken(GetSecretKey, LJWT))
  finally
    LJWT.Free;
  end;
end;

procedure Registry;
begin
  THorse
    .Post('/auth/create-token', DoCreateToken);
end;

end.
