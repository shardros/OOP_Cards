unit UFish;

interface

uses
  UHand, UPack, UCard, UExceptions;

type
  Fish = class
  private

    players: array of THand;
    deck: TPack;
  public
    constructor create(numberOfPlayers: integer);
    function AskForCard(rank: integer; player: THand): TCard;
  end;

implementation

{ Fish }

function Fish.AskForCard(rank: integer; player: THand): TCard;
var
  Hand :THandContents;
begin
  Hand := player.getcontents;
  Hand
end;

constructor Fish.create(numberOfPlayers: integer);
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


end;

end.
