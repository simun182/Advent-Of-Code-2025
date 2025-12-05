#include <stdio.h>

int position = 50;

void move(char direction, int move_position, int *solution){
    if (direction == 'L')
        position = (position - move_position + 100) % 100;
    else
        position = (position + move_position) % 100;

    if (position == 0)
        (*solution)++;
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

