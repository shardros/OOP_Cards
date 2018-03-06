unit UExceptions;


interface
uses
  System.SysUtils;

procedure OutOfCards;


implementation

procedure OutOfCards;
begin
  writeln('Insufficent cards, can not draw requested card');
  raise Exception.Create('Out of cards');
end;

end.
