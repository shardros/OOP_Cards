unit UGameHandeler;

interface

uses
  System.SysUtils, classes, UTypes, UFileHandeling, UFish, System.Generics.Collections;

type
  TGameHandeler = class
    private
      Delimiter: string;
      commands: TDictionary<string, integer>;
      game: TFish;
    public
      constructor create;
      function cmdln: TArrayOfString;
      procedure man;
      procedure ExecuteUserInstruction;
      procedure Welcome;
      procedure play;
  end;

const
  manFilePath = 'man.txt';

implementation

{ TGameHandeler }

function TGameHandeler.cmdln: TArrayOfString;
var
  userin: string;
  i: integer;
begin
  while length(userin) < 3 do
  begin
    write('~: ');
    readln(userin);
  end;

  result := userin.Split([delimiter]);

end;

constructor TGameHandeler.create;
begin
  Delimiter := '; ';

  commands := TDictionary<string, integer>.create();
  commands.Add('m', 0);
  commands.Add('man', 0);
  commands.Add('n', 1);
  commands.Add('new', 1);

  welcome;
end;

procedure TGameHandeler.ExecuteUserInstruction;
var
  cmd: TArrayOfString;
begin
  cmd := cmdln;
  case commands.Items[cmd[0]] of
    0:
      man;
    1:
      game := TFish.create(cmd[1]);
  end;


end;

procedure TGameHandeler.man;
var
  i: integer;
  manFile: TFile;
  mancontents: TArrayOfString;
begin
  manfile := TFile.create(manfilepath);
  manfile.printfile;
  manfile.Destroy;
end;


procedure TGameHandeler.Welcome;
const
  welcomeFilePath = 'ASCIIFISH.txt';
var
  welcomeFile: TFile;
begin
  welcomeFile := TFile.create(welcomeFilePath);
  welcomeFile.printFile;
  welcomeFile.Destroy;
end;

end.
