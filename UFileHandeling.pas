unit UFileHandeling;

interface

uses
  sysutils, UTypes;

type
  TFile = class
  public
    constructor Create(filename: string);
    function getfilelength(filename: string): integer;
    function readfile(filename: string): TArrayOfString;
    procedure writefile(filename: string; data: string);
    procedure appendfile(filename: string; data: string);
    procedure printfile(filename: string);
    Destructor Destroy;
  private
    filename: string;
  end;

implementation

{ TFile }

procedure TFile.appendfile(data: string);
var
  myfile: textfile;
begin
  assignfile(myfile, filename);
  append(myfile);
  writeln(myfile, data);
  closefile(myfile);
end;

constructor TFile.Create(filename: string);
begin
  self.filename := filename;
end;

destructor TFile.Destroy;
begin

end;

function TFile.getfilelength(): integer;
var
  myfile: textfile;
  count: integer;

begin
  assignfile(myfile, self.filename);
  reset(myfile);
  while not eof(myfile) do
  begin
    readln(myfile, count);
    count := count + 1;
  end;
  result := count;
end;


procedure TFile.printfile();
var
  filecontents: TArrayOfString;
  i: integer;
begin
  filecontents := readfile(self.filename);
  for i := 0 to length(filecontents) - 1 do
  begin
    writeln(filecontents[i])
  end;
end;

function TFile.readfile(): TArrayOfString;
var
  myfile: textfile;
  line, contents: string;
  count: integer;
  i: integer;

begin
  count := 0;
  assignfile(myfile, self.filename);
  reset(myfile);
  while not eof(myfile) do
  begin
    readln(myfile, line);
    count := count + 1;
  end;

  setlength(result, count);

  reset(myfile);
  for i := 0 to count - 1 do
  begin
    readln(myfile, line);
    result[i] := line;
  end;

  closefile(myfile);
end;

procedure TFile.writefile(data: string);
var
  myfile: textfile;
begin
  assignfile(myfile, self.filename);
  rewrite(myfile);
  write(myfile, data);
  closefile(myfile);
end;

end.
