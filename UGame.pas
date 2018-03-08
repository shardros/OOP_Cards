unit UGame;

interface

uses
  System.sysutils, UCard, UPack, UHand;

procedure init;
function play: integer;
procedure destroy;
procedure test;

implementation

var
  deck: tpack;
  player1, player2: thand;
  i: integer;

procedure init;
begin
  deck := tpack.create(False);
  for i := 0 to 52 do
    deck.shuffle;
  player1 := thand.create;
  player2 := thand.create;
  for i := 0 to 25 do
    player1.AddToHand(deck.draw);
  for i := 0 to 25 do
    player2.AddToHand(deck.draw);
end;

function play: integer;
var
  card1, card2: Tcard;
  score1, score2: integer;
begin
  score1 := 0;
  score2 := 0;
  for i := 0 to 25 do
  begin
    card1 := player1.placecard(i);
    card2 := player2.placecard(i);
    if card1.getscore > card2.getscore then //this breaks on the 26th round
    begin
      inc(score1);
    end
    else
    begin
      if card2.getscore > card1.getscore then
        inc(score2);
    end;

  end;
  result := 0;
  if score1 > score2 then
  begin
    result := 1;
  end
  else
  begin
    if score1 < score2 then
      result := 2;
  end;

end;

procedure destroy;
begin
  deck.destroy;
end;

procedure test;
var
  i,x: integer;
  average: array [0..51] of real;
begin
  for I := 0 to 10000 do
  begin
    deck.shuffle;
    for x := 0 to 51 do
      average[x] := (average[x] + deck.draw.GetScore)/2;
  end;
  for I := 0 to 51 do
    begin
      writeln(average[i]);
    end;
end;
end.
