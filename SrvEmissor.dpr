program SrvEmissor;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Compression,
  Horse.Jhonson,
  Horse.JWT,
  JOSE.Core.Builder,
  JOSE.Core.JWT,
  System.Classes,
  System.SysUtils,
  Service.Principal in 'servicos\Service.Principal.pas' {DM: TDataModule},
  Servidor.SQL.Constants in 'infra\Servidor.SQL.Constants.pas',
  controllers.nfe in 'controllers\controllers.nfe.pas',
  controllers.auth in 'controllers\controllers.auth.pas',
  Providers.Authorization in 'providers\Providers.Authorization.pas';

begin
  THorse
    .Use(Compression())
    .Use(Jhonson);

  controllers.auth.Registry;
  controllers.nfe.Registry;

  THorse
    .Listen(9080,
    procedure (Horse: THorse)
    begin
      WriteLn(Format('Emissor rodando na porta %d', [Horse.Port]));
    end
    )
end.
