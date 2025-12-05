#include <stdio.h>

int position = 50;

void move(char direction, int move_position, int *solution) {
    for (int i = 0; i < move_position; i++) {
        if (direction == 'R') {
            position = (position + 1) % 100;
        } 
        else{
            position = (position - 1 + 100) % 100;
        }
        if (position == 0){ 
            (*solution)++;
        }
    }
}
int main(){
    char line[20];
   
    char direction;
    int move_position;

    int solution = 0;

    while (fgets(line, sizeof(line), stdin) != NULL){

        if (sscanf(line, " %c%d", &direction, &move_position) == 2){
            move(direction, move_position, &solution);
        }
    }

    printf("solution = %d\n", solution);

    return 0;
}

