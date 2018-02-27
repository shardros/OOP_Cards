unit UCard;

interface

uses
  System.SysUtils;

type
  Tcard = class
  private
    Rank, Suit: integer;
  public
    constructor create(r: integer; s: integer);
    constructor createfromstr(r: string; s: string);
    function GetRank: integer;
    function GetExplicitRank: string;
    function GetExplicitSuit: string;
    function GetSuit: integer;
    function GetScore: integer;
  end;



implementation

{ Tcard }
constructor Tcard.create(r, s: integer);
begin
  Suit := s;
  Rank := r;
end;

constructor Tcard.createfromstr(r: string; s: string);
begin
  case s[1] of
    'S':
      Suit := 0;
    'H':
      Suit := 1;
    'C':
      Suit := 2;
    'D':
      Suit := 3;
  else
    Suit := strtoint(s);
  end;

  case r[1] of
    'A':
      Rank := 0;
    'J':
      Rank := 10;
    'Q':
      Rank := 11;
    'K':
      Rank := 12;
  else
    Rank := strtoint(r);
  end;
end;

function Tcard.GetExplicitRank: string;
begin
  case self.Rank of
    0:
      result := 'Ace';
    10:
      result := 'Jack';
    11:
      result := 'Queen';
    12:
      result := 'King';
  else
    result := inttostr(self.Rank + 1);
  end;
end;

function Tcard.GetExplicitSuit: string;
begin
  case self.Suit of
    0:
      result := 'Spades';
    1:
      result := 'Hearts';
    2:
      result := 'Clubs';
    3:
      result := 'Diamonds';
  end;
end;

function Tcard.GetRank: integer;
begin
  result := self.Rank;
end;

function Tcard.GetScore: integer;
begin
  result := (self.GetRank * 4) + self.GetSuit;
end;

function Tcard.GetSuit: integer;
begin
  result := self.Suit;
end;

end.
