unit UGameHandeler;

interface

uses
  System.SysUtils, classes, UCard, UFileHandeling, UFish,
  System.Generics.Collections;

type
  TArrayOfString = Tarray<string>;
  TCards = array of TCard;

  TGameHandeler = class
  private
    Delimiter: string;

    commands: TDictionary<string, integer>;
    RankNames: TDictionary<string, integer>;
    SuitNames: TDictionary<string, integer>;

    game: TFish;
    currentUser: integer;

  public
    constructor create;
    function GetUserIn: TArrayOfString;
    procedure man;
    procedure ExecuteUserInstruction(cmd: TArrayOfString);
    procedure Welcome;
    procedure play;
    function interpretCard(input: string): TCard;
    function interpretRank(input: string): integer;
    Destructor destroy;
  end;

const
  manFilePath = 'man.txt';

implementation

{ TGameHandeler }

function TGameHandeler.GetUserIn: TArrayOfString;
var
  userin: string;
begin
  while length(userin) < 3 do
  begin
    write('~: ');
    readln(userin);
  end;

  result := userin.Split([Delimiter]);

end;

function TGameHandeler.interpretCard(input: string): TCard;
var
  SplitInput: Tarray<string>;
  rank, suit: integer;

begin
  SplitInput := input.Split([' ']);
  rank := RankNames.Items[SplitInput[0]];
  suit := SuitNames.Items[SplitInput[2]];
  result := game.pack.findCard(rank, suit);
end;

function TGameHandeler.interpretRank(input: string): integer;
begin

end;

constructor TGameHandeler.create;
var
  playerNumber: integer;
begin
  Delimiter := '; ';

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

  commands := TDictionary<string, integer>.create();

  commands.add('m', 0);
  commands.add('man', 0);
  commands.add('s', 1);
  commands.add('save', 1);
  commands.add('a', 2);
  commands.add('ask', 2);
  commands.add('q', 3);
  commands.add('quit', 3);

  Welcome;

  repeat
    write('How many players: ');
    readln(playerNumber);
  until (playerNumber > 0) and (playerNumber < 5);

  game := TFish.create(playerNumber);

end;

destructor TGameHandeler.destroy; // Do I also need to call destory.
begin
  RankNames.Free;
  SuitNames.Free;
  commands.Free;
  game.Free;
end;

procedure TGameHandeler.ExecuteUserInstruction(cmd: TArrayOfString);
begin
  case commands.Items[cmd[0]] of
    0:
      man;
    // 1:
    // Add code to save game

    2:
      game.AskForCard(interpretRank(cmd[1]), game.players[currentUser],
        game.players[strToint(cmd[2])]);
    3:
      game.destroy;
  end;

end;

procedure TGameHandeler.man;
var
  manFile: TFile;
  mancontents: TArrayOfString;
begin
  manFile := TFile.create(manFilePath);
  manFile.printfile;
  manFile.destroy;
end;

procedure TGameHandeler.play;
begin

end;

procedure TGameHandeler.Welcome;
const
  welcomeFilePath = 'ASCIIFISH.txt';
var
  welcomeFile: TFile;
begin
  welcomeFile := TFile.create(welcomeFilePath);
  welcomeFile.printfile;
  welcomeFile.destroy;
end;

end.
