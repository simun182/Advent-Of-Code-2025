puzzle = []

puts = "Enter lines: "

for line in STDIN
  line = line.chomp
  break if line.empty?
  puzzle << line.chars
end

solution = 0

for rows in 0..puzzle.length - 1 do 
  
  for cols in 0..puzzle[0].length - 1 do
    rolls_found = 0
    if puzzle[rows][cols] == '@' 
    
      if rows != puzzle.length - 1 and puzzle[rows + 1][cols] == '@'
        rolls_found += 1
      end

      if rows != 0 and puzzle[rows - 1][cols] == '@'
        rolls_found += 1
      end

      if cols != puzzle[0].length - 1 and puzzle[rows][cols + 1] == '@' 
        rolls_found += 1
      end

      if cols != 0 and puzzle[rows][cols - 1] == '@'
        rolls_found += 1
      end

      if rows != puzzle.length - 1 and cols != puzzle[0].length - 1 and puzzle[rows + 1][cols + 1] == '@'
        rolls_found += 1
      end

      if rows != puzzle.length - 1 and cols != 0 and puzzle[rows + 1][cols - 1] == '@'
        rolls_found += 1
      end

      if rows != 0 and cols != puzzle[0].length - 1 and puzzle[rows - 1][cols + 1] == '@'
        rolls_found += 1
      end

      if rows != 0 and cols != 0 and puzzle[rows - 1][cols - 1] == "@"
        rolls_found += 1
      end

      if rolls_found < 4
        solution += 1
      end
    end
  end
end

puts solution
