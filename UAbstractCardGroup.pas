unit UAbstractCardGroup;

interface
uses
  UCard;

type
  TArrayOfString = Tarray<string>;
  TCards = array of TCard;

  TAbstractCardGroup = class abstract
  protected
    cards: TCards;
  public
    function GetSize: integer;
    function findPos(rank, suit: integer): integer; Overload;
    function findPos(card: tcard): integer; Overload;
    function findCard(rank, suit: integer): tcard; Overload;
    function findCard(card: tcard): tcard; Overload;
    procedure addTo(card: tcard);
  end;


implementation

{ TAbstractCardGroup }

procedure TAbstractCardGroup.addTo(card: tcard);
begin
  setlength(cards, length(cards) + 1);
  cards[High(cards)] := card;
end;

function TAbstractCardGroup.findCard(card: tcard): tcard;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (cards[i].GetRank = card.GetRank) and (cards[i].GetSuit = card.GetSuit)
    then
      result := cards[i];
end;

function TAbstractCardGroup.findCard(rank, suit: integer): tcard;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (cards[i].GetRank = rank) and (cards[i].GetSuit = suit) then
      result := cards[i];
end;

function TAbstractCardGroup.findPos(rank, suit: integer): integer;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (cards[i].GetRank = rank) and (cards[i].GetSuit = suit) then
      result := i;
end;

function TAbstractCardGroup.findPos(card: tcard): integer;
var
  i: integer;
begin
  for i := 0 to length(cards) do
    if (cards[i] = card) then
      result := i;
end;

function TAbstractCardGroup.GetSize: integer;
begin
  result := length(cards);
end;

end.
