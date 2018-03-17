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
  begin
    player2.AddToHand(deck.draw);
    player1.AddToHand(deck.draw);
  end;
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
    if card1.getscore > card2.getscore then
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
  player1.destroy;
  player2.destroy;
end;

procedure test;
var
  i, x: integer;
  scores: array [0 .. 51] of real;
  sum, squareSum, mean, squaremean, meansquares: real;
  card: Tcard;
begin
  for I := 0 to 51 do
    scores[i] := 0;
  for i := 0 to 1000 do
  begin
    deck.shuffle;
    for x := 0 to 51 do
    begin
      card := deck.draw;
      if x = 22 then begin
        writeln(card.GetExplicitRank, ' of ', card.GetExplicitSuit);
        writeln(card.getscore);
        writeln(scores[x]);
      end;
      scores[x] := scores[x] + card.getscore;
    end;

    {
    for x := 0 to 51 do
    begin
      sum := scores[x] + sum;
      squareSum := scores[x] * scores[x];
    end;
    mean := sum / 52;
    meansquares := (squareSum / 52);
    squaremean := mean * mean;
    writeln('SD: ', sqrt(squaremean - meansquares):9:0);
    sum := 0;
    squareSum := 0; }
  end;
  for x := 0 to 51 do
    writeln(x, ' : ' ,(scores[x]):9:0);
end;

end.
