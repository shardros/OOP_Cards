program PCards;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UPack in 'UPack.pas',
  UHand in 'UHand.pas',
  UExceptions in 'UExceptions.pas',
  UGame in 'UGame.pas';

var
  plar1, plar2, result, i: integer;

begin
  init;
  plar1 := 0;
  plar2 := 1;
  for i := 0 to 10000 do
  begin
    result := UGame.play;
    if result = 1 then
    begin
      inc(plar1);
    end
    else
    begin
      if result = 2 then
        inc(plar2);
    end;
    UGame.destroy;
    UGame.init;
  end;

  writeln(plar1);
  writeln(plar2);
  ugame.init;
  ugame.test;
  UGame.destroy;
  readln;

end.
