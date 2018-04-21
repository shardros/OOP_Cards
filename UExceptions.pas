unit UExceptions;

interface

uses
  System.SysUtils;

procedure EOutOfCards;
procedure ETooManyPlayers;

implementation

procedure EOutOfCards;
begin
  writeln('Insufficent cards, can not draw requested card');
  raise Exception.Create('Out of cards');
end;

procedure ETooManyPlayers;
begin
  writeln('Too many players');
  raise Exception.Create('Too many players');
end;

end.
