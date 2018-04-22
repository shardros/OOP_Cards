{ NOTES: UHand should be an inherited version of UPack? }

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
    RankNames: TDictionary<string, integer>;
    SuitNames: TDictionary<string, integer>;
  public
    Debug: Boolean;
    constructor create(Debug: Boolean);
    function draw: Tcard;
    procedure shuffle;
    function interpretCard(input: string): Tcard;
    destructor destroy;
  end;

implementation

{ Tpack }

constructor TPack.create(Debug: Boolean);
var
  I: integer;
begin
  setlength(cards, 52);

  // DEAL WITH THIS DICTIONARY

  RankNames := TDictionary<string, integer>.create();

  RankNames.add('Ace', 0);
  RankNames.add('Two', 1);
  RankNames.add('Three', 2);
  RankNames.add('Four', 3);
  RankNames.add('Five', 4);
  RankNames.add('Six', 5);
  RankNames.add('Seven', 6);
  RankNames.add('Eight', 7);
  RankNames.add('Nine', 8);
  RankNames.add('Ten', 9);
  RankNames.add('Jack', 10);
  RankNames.add('Queen', 11);
  RankNames.add('King', 12);

  SuitNames := TDictionary<string, integer>.create();

  SuitNames.add('Spades', 0);
  SuitNames.add('Hearts', 1);
  SuitNames.add('Clubs', 2);
  SuitNames.add('Diamonds', 3);

  for I := 0 to 51 do
  begin
    cards[I] := Tcard.create(I mod 13, I mod 4);
    if Debug then
      writeln(inttostr(I), '  NEW CARD CREATED: ', cards[I].getexplicitrank,
        ' of ', cards[I].GetExplicitSuit);
  end;
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

function TPack.interpretCard(input: string): Tcard;
var
  SplitInput: Tarray<string>;
  rank, suit: integer;

begin
  SplitInput := input.Split([' ']);
  rank := RankNames.Items[SplitInput[0]];
  suit := SuitNames.Items[SplitInput[2]];
  result := findCard(rank, suit);
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
