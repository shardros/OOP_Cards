program PNetworkDemostration;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  WinInet,
  types,
  IdHTTP;

function GetURLAsString(const aURL: string): string;
var
  lHTTP: TIdHTTP;
begin
  lHTTP := TIdHTTP.Create;
  try
    Result := lHTTP.Get(aURL);
  finally
    lHTTP.Free;
  end;
end;

begin
  try
    writeln(GetUrlAsString('http://dando.ga/'));
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
