program PCards;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UCard in 'UCard.pas',
  UDeck in 'UDeck.pas';

var
  pack: tpack;
  card: tcard;
  I : integer;
begin
  pack := tpack.create;
  pack.shuffle;
  for I := 0 to 51 do begin
    card := pack.draw;
    writeln(card.GetExplicitRank, ' of ', card.GetExplicitSuit);
  end;
  readln;
end.
