const readline = require ("readline");

const r1 = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let puzzle_numbers = [];
var puzzle_operators = "";

let solution = 0;

r1.on("line", (input) => {
  if (input[0] === "*" || input[0] === "+"){
    puzzle_operators += input.replace(/\s+/g, "");
    part_one (puzzle_numbers, puzzle_operators);
    r1.close();
    return;
  }
  puzzle_numbers.push(input.split(" ").filter(Boolean));
});

function part_one (puzzle_numbers, puzzle_operators){
  let cols = puzzle_numbers[0].length;
  let rows = puzzle_numbers.length;

  for (let col = 0; col < cols; col++){
    var mult = 1;
    for (let row = 0; row < rows; row++){
      const num = Number(puzzle_numbers[row][col]);
      if (puzzle_operators[col] === "+"){
        solution += num;
        mult = 0;
      }
      else {
        mult *= num;
      }
    }
    solution += mult;
  }
  console.log(solution);
}


