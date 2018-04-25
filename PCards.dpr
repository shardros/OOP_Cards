program PCards;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UPack in 'UPack.pas',
  UHand in 'UHand.pas',
  UExceptions in 'UExceptions.pas',
  UFish in 'UFish.pas',
  UAbstractCardGroup in 'UAbstractCardGroup.pas',
  UGameHandeler in 'UGameHandeler.pas',
  UFileHandeling in 'UFileHandeling.pas';

var
  GameHandeler: TGameHandeler;

begin
  randomize();
  GameHandeler := TGameHandeler.create();

  GameHandeler.play;

  writeln('Press enter to quit');
  readln;

  GameHandeler.destroy;
  exit;
end.
