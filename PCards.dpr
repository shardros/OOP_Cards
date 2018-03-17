program PCards;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UCard in 'Units/UCard.pas',
  UPack in 'Units/UPack.pas',
  UHand in 'Units/UHand.pas',
  UExceptions in 'Units/UExceptions.pas',
  UScoredGame in 'Units/UScoredGame.pas',
  UHermaea in 'Units/UHermaea.pas';

var
  card: Tcard;
  input: string;

begin
  randomize();
  init;
  test;
  readln;
end.
