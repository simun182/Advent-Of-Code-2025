use std::io::{self, BufRead};

fn main (){
    let stdin = io::stdin();
    
    let mut puzzle_first = Vec::new();
    let mut puzzle_second = Vec::new();

    let mut solution: i128 = 0;

    for input in stdin.lock().lines(){
        let input = input.expect("error input");
        if input.trim().is_empty(){
            break;
        }
        puzzle_first.push(input);
    }
    
    for input in stdin.lock().lines(){
        let input = input.expect("error input");
        if input.trim().is_empty(){
            break;
        }
        let num: i128 = input.parse().expect("error conversion");
        puzzle_second.push(num);
    }

    for ranges in &puzzle_first {
        let numbers: Vec<&str> = ranges.split('-').collect();
        
        let num1: i128 = numbers[0].trim().parse().expect("error conversion");
        let num2: i128 = numbers[1].trim().parse().expect("error conversion");
        
        for fresh in 0..puzzle_second.len(){
            if puzzle_second[fresh] >= num1 && puzzle_second[fresh] <= num2 {
                solution += 1;
                puzzle_second[fresh] = 0;
            }
        }
    }
    println!("{}", solution);
}
