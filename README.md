# Data-course
IV1351

Seminar 1, 2, 3, 4. 

instrument types: 
Piano
Violin
Saxaphone
Trombone
Guitar

console commands syntax for the seminar 4 console

help - prints all possible commands.
 
instrumentlist [instrumentType] - returns all non-leased instruments of a specific types. types are above. FYI, some instrumentItems are already rented before in fill script.

terminate [lease_ID] - terminates a lease using lease id. this id is found using psql right now, but since I was allowed to do it any way I wanted this is what I did. Should probably include a listLeases or similar command. 

rent [serial_number] [student_id] - rents instrumentItem with serial number for student with id. creates a lease. 
