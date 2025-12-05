import java.util.*;

public class solution {
  public static void main (String[] args) {
    Scanner scanner = new Scanner (System.in);
    
    List<String> puzzle = new ArrayList<>();
    
    long solution = 0;

    while (scanner.hasNextLine()){
      String line = scanner.nextLine().trim();
      
      if (line.isEmpty()) break;
      
      puzzle.add(line);
    }
    for (String line : puzzle){
      int biggest_index = 0;
      long full_number = 0;

      for (int digits = 11; digits >= 0; digits--){  //change the digits value to 5 for the first part
      
        long biggest = 0;

        for (int pos = biggest_index; pos < line.length(); pos++){
          int current_number = line.charAt(pos) - 48;
          if (current_number > biggest && pos < line.length() - digits) {
            biggest = current_number;
            biggest_index = pos;
          }
        }
        String replacement = line.substring (0, biggest_index) + '0' + line.substring(biggest_index + 1);
        line = replacement;

        long ten_got_the_power = 1;
  
        for (int root = 0; root < digits; root ++){
          ten_got_the_power *= 10;
        }
        full_number += biggest * ten_got_the_power;
      }
      solution += full_number;
    }
    System.out.print (solution);
  }
}
