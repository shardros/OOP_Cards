unit UHand;

interface

uses
  UPack, UCard, Generics.Collections;

type
  THandContents = array [0 .. 51] of tcard;

  Thand = class
  private
    Hand: THandContents;
    Size: integer;
    EmptySpaces: TQueue<integer>;
  public
    constructor Create;
    function getcontents: THandContents;
    function placecard(index: integer): tcard; Overload;
    function placecard(card: tcard): tcard; Overload;
    procedure removeCardPointer(card: tcard);
    procedure AddToHand(card: tcard);
    function GetHandSize: integer;
    function findPos(rank, suit: integer): integer; Overload;
    function findPos(card: tcard): integer; Overload;
    function findCard(rank, suit: integer): tcard; Overload;
    function findCard(card: tcard): tcard; Overload;
    destructor destroy;

  end;

implementation

{ Thand }

constructor Thand.Create;
var
 i: integer;
begin
  Size := 0;
  EmptySpaces := TQueue<integer>.Create();
  for i := 0 to 51 do EmptySpaces.Enqueue(i);
end;

destructor Thand.destroy;
begin
  EmptySpaces.Clear;
  EmptySpaces.destroy;
end;

function Thand.findCard(rank, suit: integer): tcard;
var
  I: integer;
begin
  for I := 0 to 51 do
    if (Hand[I].GetRank = rank) and (Hand[I].GetSuit = suit) then
      result := Hand[I];
end;

function Thand.findPos(rank, suit: integer): integer;
var
  I: integer;
begin
  for I := 0 to 51 do
    if (Hand[I].GetRank = rank) and (Hand[I].GetSuit = suit) then
      result := I;
end;

function Thand.findCard(card: tcard): tcard;
var
  I: integer;
begin
  for I := 0 to 51 do
    if (Hand[I].GetRank = card.GetRank) and (Hand[I].GetSuit = card.GetSuit)
    then
      result := Hand[I];
end;

function Thand.findPos(card: tcard): integer;
var
  I: integer;
begin
  for I := 0 to 51 do
    if (Hand[I].GetRank = card.GetRank) and (Hand[I].GetSuit = card.GetSuit)
    then
      result := I;
end;

function Thand.getcontents: THandContents;
begin
  result := self.Hand;
end;

function Thand.GetHandSize: integer;
begin
  result := Size;
end;

procedure Thand.AddToHand(card: tcard);
begin
  Hand[EmptySpaces.Dequeue()] := card;
  inc(Size);
end;

function Thand.placecard(card: tcard): tcard;
begin
  result := card;
  dec(Size);
  self.removeCardPointer(card);
end;

procedure Thand.removeCardPointer(card: tcard);
var
  index: integer;
begin
  index := self.findPos(card);
  self.Hand[index] := nil;
  EmptySpaces.Enqueue(index);
end;

function Thand.placecard(index: integer): tcard;
begin
  result := Hand[index];
  dec(Size);
  self.removeCardPointer(Hand[index]);
end;

end.
