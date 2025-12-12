program solutionPartOne;

type
  TStringArray = array of string;

procedure AppendPuzzle(var StringArray: TStringArray; ANewString: string);
begin
  SetLength(StringArray, Length(StringArray) + 1);
  StringArray[Length(StringArray) - 1] := ANewString;
end;

procedure ReflectBeam(var puzzle: TStringArray; pos_x, pos_y: Integer; var solution: Integer);
var
  y: Integer;
begin
  for y := pos_y to Length(puzzle) - 1 do
  begin
    if (pos_x < 1) or (pos_x > Length(puzzle[y])) then Exit;

    if puzzle[y][pos_x] = '.' then
      puzzle[y][pos_x] := '|'
    else if puzzle[y][pos_x] = '^' then
    begin
      puzzle[y][pos_x] := '@';  
      solution += 1;         

      if pos_x > 1 then
        ReflectBeam(puzzle, pos_x - 1, y + 1, solution);

      if pos_x < Length(puzzle[y]) then
        ReflectBeam(puzzle, pos_x + 1, y + 1, solution);

      Exit;  
    end
    else if puzzle[y][pos_x] = '@' then
      Exit;  
  end;
end;


procedure printPuzzle (var puzzle: TStringArray);
var
  y: Integer;
  x: Integer;
begin
  for y := 0 to Length(puzzle) - 1 do
  begin
    for x := 1 to Length(puzzle[y]) do
      write(puzzle[y][x]);
    writeln();
  end;
end;

var
  line: string;
  puzzle: TStringArray;
  search_for_S: Integer;
  solution: Integer;

begin
  repeat
    readln(line);
    AppendPuzzle(puzzle, line);
  until line = '';

  search_for_S := 0;
  
  repeat
    search_for_S += 1;
  until puzzle[0][search_for_S] = 'S';

  solution := 0;

  ReflectBeam(puzzle, search_for_S, 1, solution);

  writeln(solution);

end.

