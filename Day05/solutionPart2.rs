use std::io::{self, BufRead};

fn main (){
    let stdin = io::stdin();
    
    let mut puzzle_first = Vec::new();
    let mut puzzle_second = Vec::new();

    let mut range_low = Vec::new();
    let mut range_high = Vec::new();

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
        
        range_low.push(num1);
        range_high.push(num2);
    }
    
    for i in 0..range_low.len(){
        for j in i+1..range_low.len(){
            if range_low[i] > range_low[j]{
                let help = range_low[i];
                range_low[i] = range_low[j];
                range_low[j] = help;
                let help = range_high[i];
                range_high[i] = range_high[j];
                range_high[j] = help;
            }
        }
    }
    
    let mut merge_low = Vec::new();
    let mut merge_high = Vec::new();

    let mut current_low = range_low[0];
    let mut current_high = range_high[0];
    
    for i in 1..range_low.len(){
        if range_low[i] <= current_high + 1{
            if range_high[i] > current_high{
                current_high = range_high[i];
            }
        }
        else{
            merge_low.push(current_low);
            merge_high.push(current_high);
            current_high = range_high[i];
            current_low = range_low[i];
        }
    }
    merge_low.push(current_low);
    merge_high.push(current_high);

    for i in 0..merge_low.len(){
        solution += merge_high[i] - merge_low[i] + 1;
    }

    println!("{}", solution);

}
