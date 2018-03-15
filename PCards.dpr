program PCards;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UPack in 'UPack.pas',
  UHand in 'UHand.pas',
  UExceptions in 'UExceptions.pas',
  UScoredGame in 'UScoredGame.pas',
  UHermaea in 'UHermaea.pas';

var
  card: Tcard;
  input: string;

begin
  randomize();
  init;
  test;
  readln;
end.
