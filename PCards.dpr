program PCards;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UPack in 'UPack.pas';

var
  pack: tpack;
  card: tcard;

begin
  pack := tpack.create;
  pack.shuffle;
  readln;
end.
