unit UHand;

interface

uses
  UPack, UCard;

type
  THandContents = array [0 .. 51] of tcard;
  Thand = class
  private
    Hand: THandContents;
    size: integer;
  public
    constructor Create;
    function getcontents: THandContents;
    function placecard(index: integer): tcard;
    procedure AddToHand(card: Tcard);
    function GetHandSize: integer;
  end;

implementation



{ Thand }

constructor Thand.Create;
begin
  size := 0;
end;

function THand.getcontents: THandContents;
begin
  result := self.hand;
end;

function Thand.GetHandSize: integer;
begin
  result := size;
end;

procedure Thand.AddToHand(card: Tcard);
begin
  Hand[size] := card;
  inc(size);
end;

function Thand.placecard(index: integer): tcard;
begin
  result := Hand[index];
  dec(size);
end;

end.
