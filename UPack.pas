unit UPack;

interface

uses
  System.SysUtils,
  UCard;

type
  Tpack = class
  private
    pack: array of Tcard;
    top: integer;
  public
    constructor create;
    function draw: Tcard;
    procedure shuffle;
    end;

implementation

{ Tpack }

constructor Tpack.create;
var
  I: Integer;
begin
  for I := 0 to 51 do begin
    pack[i] := tcard.create(i mod 13,i mod 4);
  end;
end;

function Tpack.draw: Tcard;
begin

end;

procedure Tpack.shuffle;
begin

end;

end.
