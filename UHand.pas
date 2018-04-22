unit UHand;

interface

uses
  UPack, UAbstractCardGroup, UCard, Generics.Collections;

type
  Thand = class (TAbstractCardGroup)
  private
    procedure removeCard(card: tcard);
    function GetHandSize: integer;
  public
    constructor Create;
    function getcontents: TCards;
    function placecard(index: integer): tcard; Overload;
    function placecard(card: tcard): tcard; Overload;
    function findCardByRank(rank: integer): tcard;
    function howManyOfRank(rank: integer): integer;
    destructor destroy;

  end;

implementation

{ Thand }

function Thand.howManyOfRank(rank: integer): integer;
var
  i: integer;
begin
  result := 0;
  for I := 0 to length(cards)-1 do begin
    if cards[i].GetRank = rank then
      inc(result);
  end;
end;

constructor Thand.Create;
var
  i: integer;
begin
  setlength(cards, 0);
end;

destructor Thand.destroy;
begin

end;


function Thand.findCardByRank(rank: integer): tcard;
var
  i: integer;
begin
  for I := 0 to length(cards)-1 do begin
    if cards[i].GetRank = rank then begin
      result := cards[i];
      break;
    end;
  end;
end;


function Thand.getcontents: TCards;
begin
  result := cards;
end;

function Thand.GetHandSize: integer;
begin
  result := length(cards);
end;


function Thand.placecard(card: tcard): tcard;
begin
  result := card;
  self.removeCard(card);
end;

procedure Thand.removeCard(card: tcard);
var
  i: integer;
begin
  delete(cards, findPos(card), 1);
  setlength(cards, length(cards) - 1);
end;

function Thand.placecard(index: integer): tcard;
begin
  result := cards[index];
  self.removeCard(cards[index]);
  setlength(cards, length(cards) - 1);
end;

end.
