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
    part_two (puzzle_numbers, puzzle_operators);
    r1.close();
    return;
  }
  puzzle_numbers.push(input);
});

function part_two (puzzle_numbers, puzzle_operators){
  let cols = puzzle_numbers[0].length;
  let rows = puzzle_numbers.length;

  let operators_ind = puzzle_operators.length - 1;

  let nums = [];

  for (let col = cols - 1; col >= 0; col--){
    var num = "";
  
    for (let row = 0; row < rows; row++){
      if (puzzle_numbers[row][col] != " " ) num += puzzle_numbers[row][col];  
    }
    
    if (num === ""){
      sum_mult(nums, operators_ind);
      operators_ind --;
      nums = [];
    }
    else{
      nums.push(Number(num));
    }
  }

  sum_mult(nums, 0);

  console.log(solution);
}

function sum_mult (nums, operators_ind){
  if (puzzle_operators[operators_ind] === "+"){
    solution += nums.reduce ((acc, curr) => acc + curr, 0);
  }
  else{
    solution += nums.reduce((acc, curr) => acc * curr, 1);
  }
}
