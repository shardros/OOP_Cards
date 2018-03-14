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
  randomize();
  init;

  test;
  destroy;
  readln;

end.
