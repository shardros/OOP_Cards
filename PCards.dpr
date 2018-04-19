program PCards;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UPack in 'UPack.pas',
  UHand in 'UHand.pas',
  UExceptions in 'UExceptions.pas',
  UFish in 'UFish.pas';

var
  Fish: TFish;

begin
  randomize();
  Fish := TFish.create(4);
  readln;
end.
