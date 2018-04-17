unit UUsers;

interface

uses
  UHand;

type
TUser = class(THand)
  private
    Name: string;
    Cards: THand;
  public
    constructor Create(Name: string);
    property NickName: string read Name;
    property Hand: THand read Cards write Cards;
end;

implementation

{ player }

constructor TUser.Create(Name: string);
begin
  self.Name = Name;
end;

end.
