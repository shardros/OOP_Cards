program PCards;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UPack in 'UPack.pas',
  UHand in 'UHand.pas';

var
  pack: tpack;

begin
  pack := tpack.create;
  pack.shuffle;
  readln;
end.
