INSERT INTO person (first_name,full_name )VALUES('Joel','Joel Hanson');
INSERT INTO person (first_name,full_name )VALUES('Kevin','Kevin Castaneda');
INSERT INTO person (first_name,full_name )VALUES('Armando','Armando Bradford');
INSERT INTO person (first_name,full_name )VALUES('Liberty','Liberty Meyer');
INSERT INTO person (first_name,full_name )VALUES('Devin','Devin Roberson');
INSERT INTO person (first_name,full_name )VALUES('Devin','Devin Roberson');

INSERT INTO adress (zipcode,street,city,streetnumber) VALUES('52162','P.O. Box 353, 3020 Ac Avenue','Bhilai',6);
INSERT INTO adress (zipcode,street,city,streetnumber) VALUES('15858','Ap #334-7316 Ullamcorper. St.','Otukpo',10);
INSERT INTO adress (zipcode,street,city,streetnumber) VALUES('5132','P.O. Box 574, 5832 Facilisis, Ave','Kraków',5);
INSERT INTO adress (zipcode,street,city,streetnumber) VALUES('60715','648-2820 Mauris St.','Mora',5);
INSERT INTO adress (zipcode,street,city,streetnumber) VALUES('12273','P.O. Box 746, 4194 Natoque Avenue','Bydgoszcz',5);

INSERT INTO contact_details(telephone_nmr, email) VALUES('(779) 625-6418','in.condimentum@outlook.edu');
INSERT INTO contact_details(telephone_nmr, email) VALUES('(420) 423-5022','malesuada.fringilla@aol.org');
INSERT INTO contact_details(telephone_nmr, email) VALUES('(431) 755-6560','tellus.faucibus@aol.com');
INSERT INTO contact_details(telephone_nmr, email) VALUES('(717) 873-3782','vehicula@yahoo.com');
INSERT INTO contact_details(telephone_nmr, email) VALUES('1-426-178-3608','nec.tempus.scelerisque@yahoo.org');

INSERT INTO student (first_name,full_name,person_number) VALUES('Edvin', 'Nils Edvin Bernard Frosterud', 200309097584);
INSERT INTO student (first_name,full_name,person_number) VALUES('Påger','Påger Poggersson',202012126785);
INSERT INTO student (first_name,full_name,person_number) VALUES('Gamer','Gamer Grandpa',201011111576);
INSERT INTO student (first_name,full_name,person_number) VALUES('Yatzi','Yatzi Jansson',183702301234);
INSERT INTO student (first_name,full_name,person_number) VALUES('Reger','Reger Dumbass',196009111343); 
INSERT INTO student (first_name,full_name,person_number) VALUES('Greger','Greger Von Seger ',1951009343); 

INSERT INTO lease (startTime,endTime) VALUES('Feb 9, 2022','Jan 4, 2023');
INSERT INTO lease (startTime,endTime) VALUES('Aug 28, 2022','Jul 5, 2022');
INSERT INTO lease (startTime,endTime) VALUES('Oct 8, 2022','Aug 23, 2022');
INSERT INTO lease (startTime,endTime) VALUES('Dec 4, 2022','Oct 10, 2023');
INSERT INTO lease (startTime,endTime) VALUES('Jun 24, 2022','Jan 19, 2023');

INSERT INTO intstrumentitem (price,description, serial_number) VALUES(32113,'Piano from 1892, slightly discoloured','ABC');
INSERT INTO intstrumentitem (price,description, serial_number) VALUES(5737,'Violin 3/4 size age range 10-12','BCD');
INSERT INTO intstrumentitem (price,description, serial_number) VALUES(29433,'Guitarr teenage to adult size','DAH');
INSERT INTO intstrumentitem (price,description, serial_number) VALUES(31501,'Saxaphone golden vintage 1432','SAD');
INSERT INTO intstrumentitem (price,description, serial_number) VALUES(41942,'Electric guitarr, newly bought','DSA');

INSERT INTO staff_member (first_name,full_name,person_number ,identification_card) VALUES('Big','Big Ben',198412123454,3245);
INSERT INTO staff_member (first_name,full_name,person_number ,identification_card) VALUES('Hannah','Hannah Asadi',199003034,3456);
INSERT INTO staff_member (first_name,full_name,person_number ,identification_card) VALUES('Musik','Musik Musiklärare',1999090983,9385);
INSERT INTO staff_member (first_name,full_name,person_number ,identification_card) VALUES('Music','Music Musicteacher',2001080876,7543);
INSERT INTO staff_member (first_name,full_name,person_number ,identification_card) VALUES('Staff','Staff Member',2002141475,6546);

INSERT INTO application_st (wantedInstrument ,person_number, first_name, full_name, handler_id) VALUES('Guitar', 199903031234, 'Courtney','Courtney Cox', 1);
INSERT INTO application_st (wantedInstrument ,person_number, first_name, full_name, handler_id) VALUES('Piano', 201012148948, 'Linn','Linn Cox', 1);
INSERT INTO application_st (wantedInstrument ,person_number, first_name, full_name, handler_id) VALUES('Violin', 201003034545, 'Addison','Addison Leaf', 2);
INSERT INTO application_st (wantedInstrument ,person_number, first_name, full_name, handler_id) VALUES('Saxaphone', 200304045858, 'Lauren','Lauren May', 3);
INSERT INTO application_st (wantedInstrument ,person_number, first_name, full_name, handler_id) VALUES('Piano', 200312125869, 'Amy','Amy Vale', 4);

INSERT INTO instrument (instrumentName ,skill_level, ensemble) VALUES('Piano','Beginner',true);
INSERT INTO instrument (instrumentName ,skill_level, ensemble) VALUES('Violin','Intermediate',false);
INSERT INTO instrument (instrumentName ,skill_level, ensemble) VALUES('Saxaphone','Advanced',true);
INSERT INTO instrument (instrumentName ,skill_level, ensemble) VALUES('Violin','Beginner',false);
INSERT INTO instrument (instrumentName ,skill_level, ensemble) VALUES('Guitar','Beginner',true);

INSERT INTO schedule (single_price ,ensemble_price,group_price,difficulty_price) VALUES(567, 675,987,231);
INSERT INTO schedule (single_price ,ensemble_price,group_price,difficulty_price) VALUES(123, 343,545,654);
INSERT INTO schedule (single_price ,ensemble_price,group_price,difficulty_price) VALUES(234, 565,767,123);
INSERT INTO schedule (single_price ,ensemble_price,group_price,difficulty_price) VALUES(345, 565,999,65);
INSERT INTO schedule (single_price ,ensemble_price,group_price,difficulty_price) VALUES(678, 786,435,456);

INSERT INTO instructor (first_name,full_name,person_number ,identification_card, ensemble_genres) VALUES('Chandler','Lisandra Pierce',2321043,'EHV87BSB7AC', 'Clasical');
INSERT INTO instructor (first_name,full_name,person_number ,identification_card, ensemble_genres) VALUES('Xander','Porter Sharp',4515910,'VGY27WTR0IH','Jazz');
INSERT INTO instructor (first_name,full_name,person_number ,identification_card, ensemble_genres) VALUES('Kevin','Catherine Blanchard',96284,'BDG74NLA5VP','Electric');
INSERT INTO instructor (first_name,full_name,person_number ,identification_card, ensemble_genres) VALUES('Rajah','Clementine Faulkner',4987690,'ZHW63GYE5IU','Pop');
INSERT INTO instructor (first_name,full_name,person_number ,identification_card, ensemble_genres) VALUES('Lyle','Amity Vega',87960,'URW04DDC3JG','Hiphop');

INSERT INTO single_p_lesson (instructorID, date_and_time, location, difficulty, instrument, type) VALUES(2, 'June 5, 2022', 'Aula', 'Beginner', 'Piano', 'single_p_lesson');
INSERT INTO single_p_lesson (instructorID, date_and_time, location, difficulty, instrument, type) VALUES(4,'December 17, 2022', 'Musiksal #4', 'Beginner', 'Saxaphone', 'single_p_lesson');
INSERT INTO single_p_lesson (instructorID, date_and_time, location, difficulty, instrument, type) VALUES(2,'June 5, 2002', 'Sal B','Advanced', 'Violin', 'single_p_lesson');
INSERT INTO single_p_lesson (instructorID, date_and_time, location, difficulty, instrument, type) VALUES(4,'December 9, 2022', 'Sal A','Beginner', 'Piano', 'single_p_lesson');
INSERT INTO single_p_lesson (instructorID, date_and_time, location, difficulty, instrument, type) VALUES(1,'Feb 3, 2022', 'Aula','Intermediate', 'Guitarr', 'single_p_lesson');

INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(11,12, 'May 9, 2022', 'Sal A', 12, 24, 'Classical', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(4,11, 'April 1, 1923', 'Musiksal #3', 2, 4, 'Jazz', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(4,8, 'January 19, 2021', 'Musiksal #2', 4, 8, 'Hiphop', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(3,5, 'April 22, 2022', 'Aula', 4, 16, 'Pop', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(3,5, 'March 17, 2022', 'Aula', 2, 4,'Electrical', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(3,5, 'July 17, 2022', 'Aula', 2, 4,'Electrical', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(1,5, 'August 17, 2022', 'Aula', 2, 4,'Electrical', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(2,5, 'December 5, 2022', 'Aula', 2, 4,'Electrical', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(1,4, 'December 9, 2022', 'Aula', 2, 4,'Electrical', 'ensemble');
INSERT INTO ensemble (spots_left, instructorID, date_and_time, location, min_students,max_students,genre, type) VALUES(2,3, 'December 10, 2022', 'Aula', 2, 4,'Electrical', 'ensemble');


INSERT INTO group_lesson (date_and_time, location,instructorID,min_students,max_students,instrument,skill_level, type) VALUES('May 9, 2022','Aula',5, 4, 8, 'Piano', 'Beginner', 'group_lesson');
INSERT INTO group_lesson (date_and_time, location,instructorID,min_students,max_students,instrument,skill_level, type) VALUES('September 21, 2022','SalA',4, 4, 8,'Saxaphone', 'Intermediate', 'group_lesson');
INSERT INTO group_lesson (date_and_time, location,instructorID,min_students,max_students,instrument,skill_level, type) VALUES('October 30, 2022','SalB',3, 2, 6, 'Guitarr', 'Beginner', 'group_lesson');
INSERT INTO group_lesson (date_and_time, location,instructorID,min_students,max_students,instrument,skill_level, type) VALUES('November 10, 2022','GR301',6, 4, 12, 'Violin', 'Intermediate', 'group_lesson');
INSERT INTO group_lesson (date_and_time, location,instructorID,min_students,max_students,instrument,skill_level, type) VALUES('January 1, 2022','Aula',6, 4, 8, 'Piano', 'Beginner', 'group_lesson');

INSERT INTO sibling_info(sibling1, sibling2) VALUES(1, 2);
INSERT INTO sibling_info(sibling1, sibling2) VALUES(1, 3);
INSERT INTO sibling_info(sibling1, sibling2) VALUES(5, 4);
