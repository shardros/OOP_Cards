unit UFish;

interface

uses
  UHand, UPack, UCard, UExceptions;

type
  TFish = class
  private

    players: array of THand;
    deck: TPack;
  public
    constructor create(numberOfPlayers: integer);
    //function AskForCard(rank: integer; Handfrom: THand; Handto: THand): TCard;
  end;

implementation

{ Fish }

{
function Fish.AskForCard(rank: integer; Handfrom: THand; Handto: THand): TCard;
var
  Hand :THandContents;
  I: integer;
begin
  hand := handFrom.getcontents;
  for I := 0 to 52 do begin
    if HandFrom. then

    for I := 0 to handFrom.howManyOfRank(rank) do begin

    end;
  end;

end;}

constructor TFish.create(numberOfPlayers: integer);
var
  i, x: integer;
begin
  if numberOfPlayers > 4 then
  begin
    ETooManyPlayers;
  end
  else
  begin

    deck := TPack.create(false);
    deck.shuffle;

    SetLength(players, numberOfPlayers);

    for i := 0 to numberOfPlayers do
    begin
      players[i] := THand.create;
      for x := 0 to 5 do players[i].AddToHand(deck.draw);
    end;
  end;

  players[1].placecard(1);


end;

end.
