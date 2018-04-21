unit UFish;

interface

uses
  UHand, UPack, UCard, UTypes, UAbstractCardGroup, UExceptions;

type
  TTable = class(TAbstractCardGroup)
    private
      constructor create;
  end;

  TFish = class
  private
    Hands: array of THand;
    Table: TTable;
    Scores: array of integer;
    deck: TPack;
  public
    constructor create(numberOfPlayers: integer);
    function checkForBook(playerNum: integer): boolean;
    function AskForCard(rank: integer; Handfrom: THand; Handto: THand)
      : TCards;
    function GoFish(hand: THand): TCard;
  end;

implementation

{ Fish }

function TFish.AskForCard(rank: integer; Handfrom: THand; Handto: THand)
  : TCards;
var
  HandFromContents: TCards;
  tempCard: TCard;
  I: integer;
begin
  setlength(result, 0);
  HandFromContents := Handfrom.getcontents;
  for I := 0 to length(HandFromContents) do
  begin
    if (HandFromContents[I].getRank = rank) then
    begin
      setlength(result, length(result) + 1);
      result[length(result) - 1] := HandFromContents[I];
      Handto.AddTo(Handfrom.placecard(I));
    end;
  end;
end;

function TFish.checkForBook(playerNum: integer): boolean;
var
i,j: integer;
Hand: THand;
begin
  for i := 0 to 12 do begin
    if (Hands[playerNum].howManyOfRank(i)=4) then begin
      Hand := Hands[playerNum];
      inc(scores[playerNum]);
      for j := 0 to 3 do
        table.addTo(Hand.placecard(Hand.findCardByRank(i)));
    end;
  end;
end;

constructor TFish.create(numberOfPlayers: integer);
var
  I, x: integer;
begin
  if numberOfPlayers > 4 then
  begin
    ETooManyPlayers;
  end
  else
  begin

    table := TTable.Create;

    deck := TPack.create(false);
    deck.shuffle;

    setlength(Hands, numberOfPlayers);
    setlength(Scores, numberOfPlayers);

    for I := 0 to numberOfPlayers do
    begin
      Hands[I] := THand.create;
      for x := 0 to 5 do
        Hands[I].AddTo(deck.draw);
    end;
  end;

end;

function TFish.GoFish(hand: THand): TCard;
var
  Card: TCard;
begin
  Card := deck.draw;
  hand.AddTo(Card);
  result := Card;
end;

{ TTable }

constructor TTable.create;
begin
  setlength(cards, 0);
end;

end.
