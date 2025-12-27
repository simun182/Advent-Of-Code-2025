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

procedure CalculateTimelines (var puzzle: TSTringArray; x: Integer; var solution_two: Int64);
var
  y: Integer;
  i: Integer;
  timelines: array of Int64;
begin
  SetLength(timelines, Length(puzzle[0]));
  for i := 0 to Length(puzzle[0]) do
    timelines[i] := 0;
  timelines[x] := 1;
  for y := 1 to Length(puzzle) - 1 do
  begin
    for x := 0 to Length(puzzle[y]) do
    begin
      if puzzle[y][x] = '^' then
      begin
        timelines[x + 1] += timelines[x];
        timelines[x - 1] += timelines[x];
        timelines[x] := 0;
      end;
    end;
  end;
  for i := 0 to Length(timelines) do
    solution_two += timelines[i];
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
  solution_two: Int64;

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
  CalculateTimelines(puzzle, search_for_S, solution_two);
  ReflectBeam(puzzle, search_for_S, 1, solution);
  writeln(solution_two);
  writeln(solution);

end.

