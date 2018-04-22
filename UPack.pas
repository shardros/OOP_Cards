unit UPack;

interface

uses
  System.SysUtils,
  UCard, UAbstractCardGroup, UExceptions, System.Generics.Collections,
  System.StrUtils;

type
  TPack = class(TAbstractCardGroup)
  private
    pack_top: integer;
  public
    Debug: Boolean;
    constructor create;
    function draw: Tcard;
    procedure shuffle;

    destructor destroy;
  end;

implementation

{ Tpack }

constructor TPack.create();
var
  I: integer;
begin
  setlength(cards, 52);

  for I := 0 to 51 do
    cards[I] := Tcard.create(I mod 13, I mod 4);

  pack_top := 0;
end;

destructor TPack.destroy;
var
  I: integer;
begin
  for I := 0 to 51 do
  begin
    cards[I].Free;
  end;
end;

function TPack.draw: Tcard; // This should be done using a stack
begin
  result := cards[pack_top];
  if pack_top < 52 then
  begin
    inc(pack_top);
  end
  else
  begin
    EOutofCards;
  end;
end;

procedure TPack.shuffle;
var
  temp: Tcard;
  random_pos: integer;
  I: integer;
begin
  for I := 0 to 52 do
  begin
    random_pos := I + random(52 - I); // like random range
    temp := cards[random_pos];
    cards[random_pos] := cards[I];
    cards[I] := temp;
  end;
  pack_top := 0;
end;

end.
