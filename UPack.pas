unit UPack;

interface

uses
  System.SysUtils,
  UCard;

type
  TPack = class
  private
    pack: array [0 .. 51] of Tcard;
    pack_top: integer;
  public
    constructor create;
    function draw: Tcard;
    procedure shuffle;
  end;

implementation

{ Tpack }

constructor TPack.create;
var
  I, card_no: integer;
begin
  for I := 0 to 51 do
  begin
    self.pack[I] := Tcard.create(I mod 13, I mod 4);
    writeln(inttostr(I), '  NEW CARD CREATED: ', self.pack[I].getexplicitrank,
      ' of ', self.pack[I].GetExplicitSuit);
  end;
end;

function TPack.draw: Tcard;
begin
  result := pack[pack_top];
  inc(pack_top);
end;

procedure TPack.shuffle;
var
  temp: Tcard;
  random_pos: integer;
  I: integer;
begin
  randomize();
  for I := 0 to 51 do
  begin
    random_pos := random(51);
    temp := self.pack[random_pos];
    self.pack[random_pos] := self.pack[I];
    self.pack[I] := temp;
  end;
end;

end.