def is_invalid (id_str):
    id_len = len (id_str)
    
    if id_len % 2 != 0:
        return False
    
    half = id_len // 2
    
    return id_str[:half] == id_str[half:]

def what_are_invalids (start, end):
    invalid_ids = []
    
    for i in range (start, end + 1):
        if (is_invalid (str(i))):
            invalid_ids.append(i)
    
    return invalid_ids

puzzle = input ()

first_number = []
second_number = []

solution = 0

for number in puzzle.split(","):
    a, b = map(int, number.strip().split("-"))
    
    first_number.append(a)
    second_number.append(b)

for i in range (len(first_number)):
    list = what_are_invalids (first_number[i], second_number[i])
    
    for num in list:
        solution += num
    
print (solution)        
        

