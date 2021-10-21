unit Providers.Authorization;

interface

uses
  Horse,
  Horse.JWT;

function Authorization: THorseCallBack;
function GetSecretKey: string;

implementation

function GetSecretKey: string;
begin
  Result := 'chave-secreta';
end;

function Authorization: THorseCallBack;
begin
  Result := HorseJWT(GetSecretKey);
end;

end.
