program PCards;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UDeck in 'UDeck.pas';

var
  Global_pack: tdeck;

begin
  Global_pack := tDeck.create;
  readln;
end.
