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
    procedure removeCard(card: tcard);
  public
    constructor Create;
    function getcontents: THandContents;
    function placecard(index: integer): tcard; Overload;
    function placecard(card: tcard): tcard; Overload;
    procedure AddToHand(card: tcard);
    function GetHandSize: integer;
    function findPos(rank, suit: integer): integer; Overload;
    function findPos(card: tcard): integer; Overload;
    function findCard(rank, suit: integer): tcard; Overload;
    function findCard(card: tcard): tcard; Overload;
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
  for i := 0 to 51 do
  begin
    if not(Hand[i] = nil) then
    begin
      if Hand[i].GetRank = rank then
        inc(rank);
    end;
  end;
end;

constructor Thand.Create;
var
  i: integer;
begin
  Size := 0;
  EmptySpaces := TQueue<integer>.Create();
  for i := 0 to 51 do
    EmptySpaces.Enqueue(i);
end;

destructor Thand.destroy;
begin
  EmptySpaces.Clear;
  EmptySpaces.destroy;
end;

function Thand.findCard(rank, suit: integer): tcard;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (Hand[i].GetRank = rank) and (Hand[i].GetSuit = suit) then
      result := Hand[i];
end;

function Thand.findPos(rank, suit: integer): integer;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (Hand[i].GetRank = rank) and (Hand[i].GetSuit = suit) then
      result := i;
end;

function Thand.findCard(card: tcard): tcard;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (Hand[i].GetRank = card.GetRank) and (Hand[i].GetSuit = card.GetSuit)
    then
      result := Hand[i];
end;

function Thand.findPos(card: tcard): integer;
var
  i: integer;
begin
  for i := 0 to 51 do
    if (Hand[i].GetRank = card.GetRank) and (Hand[i].GetSuit = card.GetSuit)
    then
      result := i;
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
  self.removeCard(card);
end;

procedure Thand.removeCard(card: tcard);
var
  index: integer;
begin
  index := self.findPos(card);
  self.Hand[index] := nil;
  EmptySpaces.Enqueue(index);
  dec(size);
end;

function Thand.placecard(index: integer): tcard;
begin
  result := Hand[index];
  dec(Size);
  self.removeCard(Hand[index]);
end;

end.
