unit UDeck;

interface

uses
  System.SysUtils,
  UCard;

type
  TDeck = class
  private
    deck: array [0 .. 51] of Tcard;
    deck_top: integer;
  public
    constructor create;
    function draw: Tcard;
    procedure shuffle;
  end;

implementation

{ Tpack }

constructor TDeck.create;
var
  I, card_no: integer;
begin
  for I := 0 to 51 do
  begin
    card_no := 13 * (i mod 4) + (i div 13);
    deck[card_no] := Tcard.create(I mod 13, I mod 4);
    writeln(inttostr(i) ,'  NEW CARD CREATED: ', deck[card_no].getexplicitrank,' of ', deck[card_no].GetExplicitSuit);
  end;
  for i := 0 to 51 do begin
    writeln(inttostr(i) ,'  NEW CARD CREATED: ', deck[i].getexplicitrank,' of ', deck[i].GetExplicitSuit);
  end;
end;

function TDeck.draw: Tcard;
begin
  result := deck[deck_top];
end;

procedure TDeck.shuffle;
begin

end;

end.
