unit UPack;

interface

uses
  System.SysUtils,
  UCard, UExceptions;

type
  TPack = class
  private
    pack: array [0 .. 51] of Tcard;
    pack_top: integer;
  public
    Debug: Boolean;
    constructor create(input: Boolean);
    function draw: Tcard;
    procedure shuffle;
    destructor destroy;
  end;

implementation

{ Tpack }

constructor TPack.create(input: Boolean);
var
  I: integer;
begin
  Debug := input;
  for I := 0 to 51 do
  begin
    self.pack[I] := Tcard.create(I mod 13, I mod 4);
    if Debug then
      writeln(inttostr(I), '  NEW CARD CREATED: ', self.pack[I].getexplicitrank,
        ' of ', self.pack[I].GetExplicitSuit);
  end;
  self.shuffle;
end;

destructor TPack.destroy;
var
  I: integer;
begin
  for I := 0 to 51 do
  begin
    pack[I].Free;
    pack[I] := nil;
  end;
end;

function TPack.draw: Tcard;
begin
  result := pack[pack_top];
  if pack_top < 52 then
  begin
    inc(pack_top);
  end
  else
  begin
    OutofCards;
  end;
end;

procedure TPack.shuffle;
var
  temp: Tcard;
  random_pos: integer;
  I: integer;
begin
  randomize();
  for I := 0 to 50 do
  begin
    random_pos := I + random(50 - I); // like random range
    temp := self.pack[random_pos];
    self.pack[random_pos] := self.pack[I];
    self.pack[I] := temp;
  end;
end;

end.
