Create database [Tour_company (Minakov D., Pakhomova N., Ostashevska N., Kvasnii S.)]
collate Ukrainian_CI_AI

Use [Tour_company (Minakov D., Pakhomova N., Ostashevska N., Kvasnii S.)]

Create table Country
(id_country NVARCHAR(4) not null,
 name NVARCHAR(20) not null,
 constraint prim_country primary key(id_country)) 

 Create table Hotels
(id_hotel NVARCHAR(3) not null,
 name_hotel NVARCHAR(20) not null,
 stars INT not null,
 id_country NVARCHAR(4) not null, 
 constraint prim_hotel primary key (id_hotel),
 constraint foreign_country foreign key (id_country)
 references Country on delete no action)

  Create table Nutrition
(id_nutrition NVARCHAR(20) not null,
 type_nutrition NVARCHAR(40) not null,
 constraint prim_nutrition primary key (id_nutrition))

 Create table Tours
 (id_tour NVARCHAR(5) not null,
 tour_status NVARCHAR(20) not null,
 id_hotel NVARCHAR(3) not null,
 id_nutrition NVARCHAR(20) not null,
 constraint prim_tour primary key (id_tour),
 constraint foreign_hotel foreign key (id_hotel)
 references Hotels on delete no action,
 constraint foreign_nutrition foreign key (id_nutrition)
 references Nutrition on delete no action)

 Create table Clients
 (id_client NVARCHAR(20) not null primary key,
 client_surname NVARCHAR(30) not null,
 client_name NVARCHAR(30) not null,
 client_patronymic Nvarchar(40) null,
 client_passport NVARCHAR(10) not null,
 client_tel_numb NVARCHAR(16) not null,
 preferences NVARCHAR(60) null,
 client_date_birth DATE null)

 Create table Operators
 (id_operator NVARCHAR(10) not null primary key,
 operator_name NVARCHAR(30) not null,
 operator_tel_numb NVARCHAR(16) not null,
 operator_address NVARCHAR(50) null)

 Create table Employees
 (id_employee NVARCHAR(15) not null primary key,
 employee_surname NVARCHAR(30) not null,
 employee_name NVARCHAR(30) not null,
 employee_patronymic Nvarchar(40) null,
 employee_tel_numb NVARCHAR(16) not null,
 position NVARCHAR(60) not null,
 salary DECIMAL (9,2) not null)

 Create table Airline_companies
 (id_airline NVARCHAR(5) not null primary key,
  airline_name NVARCHAR(30) not null,
  airline_tel_numb NVARCHAR(16) not null,
  airline_address NVARCHAR(100) null)

  Create table Flight_to
  (flight_number_to NVARCHAR(15) not null,
  id_airline NVARCHAR(5) not null foreign key
  references Airline_companies on delete no action,
  direction NVARCHAR(30) not null,
  date_to DATETIME not null,
  flight_duration_to TIME not null,
  constraint flight_number primary key (flight_number_to,date_to))

  Create table Flight_back
  (flight_number_back NVARCHAR(15) not null,
  id_airline NVARCHAR(5) not null foreign key
  references Airline_companies on delete no action,
  direction NVARCHAR(30) not null,
  date_back DATETIME not null,
  flight_duration_back TIME not null,
  constraint flight_number_back primary key (flight_number_back,date_back))

  Create table Insurance
  (id_insurance NVARCHAR(20) not null primary key,
  risk NVARCHAR(40) null,
  insurance_company NVARCHAR(25) not null,
  insurance_duration INT not null)

  Create table Travellers
 (id_traveller NVARCHAR(10) not null primary key,
 traveller_surname NVARCHAR(30) not null,
 traveller_name NVARCHAR(30) not null,
 traveller_patronymic Nvarchar(40) null,
 traveller_passport NVARCHAR(15) not null,
 traveller_tel_numb NVARCHAR(16) null,
 traveller_date_birth DATE null)

 Create table Orders
 (id_order NVARCHAR(6) not null primary key,
 id_client NVARCHAR(20) not null foreign key
 references Clients on delete no action,
 id_tour NVARCHAR(5) not null foreign key
 references Tours on delete no action,
 id_operator NVARCHAR(10) not null foreign key
 references Operators on delete no action,
 id_employee NVARCHAR(15) not null foreign key
 references Employees on delete no action,
 order_date DATE not null,
 order_status NVARCHAR(15) not null,
 flight_number_to NVARCHAR(15) not null,
 data_to DATETIME not null,
 flight_number_back NVARCHAR(15) not null,
 data_back DATETIME not null,
 CONSTRAINT FK_Flight_to_id_ai_48CFD27E FOREIGN KEY (flight_number_to,data_to)
 references Flight_to on delete no action,
 CONSTRAINT FK_Flight_ba_id_ai_5CD6CB2B FOREIGN KEY (flight_number_back,data_back)
 references Flight_back on delete no action)

   
 Create table InterTable
 (id_order NVARCHAR(6) not null foreign key
 references Orders on delete no action,
 id_traveller NVARCHAR(10) not null foreign key
 references Travellers on delete no action,
 id_insurance NVARCHAR(20) not null foreign key
 references Insurance on delete no action)

 INSERT INTO Country
 VALUES ('TUR','Туреччина'),
                ('EGY','Эгипет'),
	('BGR','Болгарія'),
	('GEO','Грузія'),
	('LKA','Шрі-Ланка'),
	('HRV','Хорватія')
 SELECT * FROM Country

 INSERT INTO Hotels
 VALUES ('H1','Palmet Resort','5','TUR'),
               ('H2','Grand Sunlife','3','TUR'),
	('H3','Amar Sina Hotel','3','EGY'),
	('H4','Roma Host Way','4','EGY'),
	('H5','Evelina Palace','4','BGR'),
	('H6','All Seasons Club','5','BGR'),
	('H7','Amra Park-hotel','5','GEO'),
	('H8','Radisson Blu Iveria','5','GEO'),
	('H9','Marino Beach Colombo','5','LKA'),
	('H10','JKAB Beach Resort','4','LKA'),
	('H11','Hotel Lone','5','HRV'),
	('H12','Art Hotel Like','3','HRV')
SELECT * FROM Hotels

INSERT INTO Nutrition
 VALUES ('N1','без харчування'),
                ('N2','тільки сніданок'),
	('N3','напівпансіон'),
	('N4','повний пансіон'),
	('N5','все включено'),
	('N6','VIP-варіант системи все включено')
SELECT * FROM Nutrition

INSERT INTO Tours
 VALUES ('T1258','заброньовано','H5','N1'),
                ('T1596','анульовано','H12','N2'),
	('T1478','заброньовано','H8','N3'),
	('T6395','підтверджено','H1','N6'),
	('T4585','оплачено','H3','N1'),
	('T4595','підтверджено','H2','N1'),
	('T4692','оплачено','H7','N4'),
	('T3647','підтверджено','H11','N5'),
	('T7815','анульовано','H4','N6'),
	('T7513','оплачено','H6','N5'),
	('T1379','анульовано','H9','N6'),
	('T7913','оплачено','H10','N3'),
	('T1739','оплачено','H8','N3'),
	('T2585','заброньовано','H4','N5'),
	('T4556','оплачено','H11','N6'),
	('T1575','заброньовано','H5','N4')
SELECT * FROM Tours

INSERT INTO Clients
 VALUES ('12565.1','Солдатова','Олександра','Ігорівна','FN156243','+380664585412',NULL,'1995-10-03'),
        ('15483.2','Оберемок','Юрій','Вікторович','FF256234','+380951562345','тільки 5-ти зірковий готель на першій лінії','2000-04-20'),
	('17853.3','Токар','Євген','Олександрович','FF169634','+380674145685',NULL,'1986-11-15'),
	('16964.4','Степанчук','Антон','Ігорович','FN569545','+380681245625','люблю все екзотичне',NULL),
	('18564.5','Mitrovich','Luka','NULL','FF164859','+48793468727',NULL,'1995-10-28'),
	('95644.6','Heileg','Chad',NULL,'P45G365','+12026794501','all the best','1895-07-16'),
	('15486.7','Matthew','Vasquez',NULL,'G15P653','+12163465885',NULL,'1985-04-21'),
	('12458.8','Харченко','Анастасія','Вікторівна','FF135685','+380974565211','сімейний готель, додаткові екскурсії від готелю','1956-01-01')
SELECT * FROM Clients

INSERT INTO Insurance 
 VALUES ('I12569','медичне страхування','ТАС','6'),
        ('I13695','від нещасного випадку','ТАС','6'),
	('I12489','медичне страхування та нещасного випадку','ТАС','6'),
	('I25469','медичне страхуванн','PZU','12'),
	('I17935','медичне страхуванн та Covid-19','PZU','6'),
	('I59731','від нещасного випадку','PLU','12'),
	('I85462','медичне страхуванн та нещасний випадок','PZU','12')
SELECT * FROM Insurance

INSERT INTO Travellers
 VALUES ('125.1','Самойлов','Дмитро','Сергійович','АА152648','+380661548513','1976-05-15'),
               ('125.2','Самойлова','Ірина','Іванівна','КО154896','+380981542365','1978-06-06'),
               ('125.3','Самойлова','Наталія','Дмитрівна','485926',NULL,'2010-01-25'),
               ('125.4','Бензар','Галина','Іванівна','FG422746','+380674512323','1974-09-18'),
               ('125.5','Бензар','Василь','Ігорович','FG456555','+380664562581','1974-04-16'),
               ('125.6','Стефанишин','Роман','Олександрович','ВЕ961245',NULL,'1985-11-13'),
               ('125.7','Стефанишин','Оксана','Борисівна','КА124578','+380951599963','1989-08-01'),
               ('125.8','Gustafson','Karl',NULL,'F15964235','0033142967000','1992-05-08'),
               ('125.9','Larsson','Lara',NULL,'F1852546','0033152767120','1995-12-01'),      
               ('125.10','Токар','Євген','Олександрович','FF169634','+380674145685','1986-11-15'),
               ('125.11','Токар','Вікторія','Анатолівна','FF162356','+380630306161','1989-07-26'),
               ('125.12','Харченко','Анастасія','Вікторівна','FF135685','+380974565211','1956-01-01'),
               ('125.13','Харченко','Марія','Олексіївна','FF235689',NULL,'2015-04-21'),
               ('125.14','Кожушко','Ксенія','Вікторівна','КО125975','+380939543203','1996-04-12'),
               ('125.15','Палагнюк','Віталій','Вікторович','КО64235','+380664585599','1992-08-08'),
               ('125.16','Stanchak','Katina',NULL,'F85451956','0032456329543','1986-09-11'),
               ('125.17','Stanchak','Tomas',NULL,'F455964235',NULL,'1986-09-11'),
               ('125.18','Богомолов','Віталій','Дмитрович','КЕ456585','+380961545569','1990-03-24'),
               ('125.19','Богомолова','Анастасія','Валентинівна','КЕ789512',NULL,'1990-09-03'),
               ('125.20','Богомолова','Вероніка','Віталівна','КЕ856314',NULL,'2011-06-29')
SELECT * FROM Travellers

INSERT INTO Airline_companies
 VALUES ('AC145','Pegasus','00908502506777',NULL),
                ('AC895','Turkish Airlenes',' +902124636363','Turkish Airlines General Management Building, Ataturk Airport, Yesilkoy 34149 Istanbul Turkey'),
	('AC466','Ukraine International Airlines','+380503980011','KYIV,UIA Head Office 201-203,Kharkivske Road'),
	('AC951','Aegean','00302106261000',NULL),
	('AC753','Ryanair','+448712460002','Dublin office, Airside Business Park, Swords, Co Dublin, Ireland'),
	('AC127','Yan Air','+380673345562','Украина, г. Житомир, ул. авиаторов, 9'),
	('AC158','Qatar Airways','0097440226000',NULL),
	('AС496','Fly Dubai','+971600544445','Башня ЭНИ Сэпфайр офис №6 Аль-Иттихад Роуд Порт-Саид, Дейра Дубай, ОАЭ'),
                ('AC159','LOT','0048225777755','Komitetu Obrony Robotników St., 4302-146 Warsaw,Poland'),
	('АС842','KLM Royal Dutch','380444902490','PO Box 7700, 1117 ZL Schiphol Airport, Netherlands')
SELECT * FROM Airline_companies

INSERT INTO Flight_to    
 VALUES ('PGT421','AC145','Львів-Стамбул','2020-09-03T19:55:00','02:05:00'),
        ('PGT421','AC145','Львів-Стамбул','2019-09-03T15:55:00','02:05:00'),
        ('PGT421','AC145','Львів-Стамбул','2020-09-16T19:55:00','02:05:00'),
        ('PGT421','AC145','Львів-Стамбул','2020-09-16T16:00:00','02:05:00'),
        ('PGT421','AC145','Львів-Стамбул','2020-07-12T15:55:00','02:05:00'),
        ('PGT421','AC145','Львів-Стамбул','2019-07-05T16:00:00','02:05:00'),

        ('THY0441','AC895','Львів-Стамбул','2020-05-06T10:00:00','02:00:00'),
        ('THY0441','AC895','Львів-Стамбул','2020-06-16T21:45:00','02:00:00'),
        ('THY0441','AC895','Львів-Стамбул','2019-08-09T10:00:00','02:00:00'),
        ('THY0441','AC895','Львів-Стамбул','2019-10-01T21:45:00','02:00:00'),

        ('AUI5362','AC466','Львів-Анталія','2020-05-15T12:30:00','02:20:00'),
        ('AUI5362','AC466','Львів-Анталія','2020-06-01T11:00:00','02:20:00'),
        ('AUI5362','AC466','Львів-Анталія','2019-06-01T11:00:00','02:20:00'),
        ('AUI5362','AC466','Львів-Анталія','2019-10-21T13:00:00','02:20:00'),
        ('AUI5362','AC466','Львів-Анталія','2020-07-05T12:35:00','02:20:00'),
        ('AUI5362','AC466','Львів-Анталія','2020-06-16T10:40:00','02:20:00'),

        ('AUI5262','AC466','Львів-Шарм Ель Шейх','2020-09-18T15:10:00','04:00:00'),
        ('AUI5262','AC466','Львів-Шарм Ель Шейх','2019-09-26T15:10:00','04:00:00'),
        ('AUI5162','AC466','Львів-Хургада','2020-11-18T17:30:00','04:00:00'),
        ('AUI5162','AC466','Львів-Хургада','2020-12-08T17:30:00','04:00:00'),
        
        ('PGT523','AC145','Львів-Шарм Ель Шейх','2020-09-18T15:10:00','04:00:00'),
        ('PGT523','AC145','Львів-Шарм Ель Шейх','2019-09-26T15:10:00','04:00:00'),
        ('PGT513','AC145','Львів-Хургада','2020-11-18T15:10:00','04:00:00'),
        ('PGT513','AC145','Львів-Хургада','2020-12-08T17:30:00','04:00:00'),

        ('AE4565','AC951','Львів-Шарм Ель Шейх','2020-09-10T16:50:00','04:00:00'),
        ('AE4565','AC951','Львів-Шарм Ель Шейх','2019-09-25T16:50:00','04:00:00'),
        ('AE4465','AC951','Львів-Хургада','2020-11-12T12:30:00','04:00:00'),
        ('AE4465','AC951','Львів-Хургада','2020-11-08T12:30:00','04:00:00'),
        
        ('AE4852','AC951','Львів-Варна','2020-05-28T14:20:00','03:00:00'),
        ('AE4852','AC951','Львів-Варна','2019-05-26T19:45:00','03:00:00'),
        ('AE4752','AC951','Львів-Бургас','2020-08-05T11:10:00','03:00:00'),
        ('AE4752','AC951','Львів-Бургас','2020-06-30T09:30:00','03:00:00'),

        ('FR7859','AC753','Львів-Варна','2020-06-20T16:10:00','03:20:00'),
        ('FR7859','AC753','Львів-Варна','2019-09-26T15:10:00','03:20:00'),
        ('FR7759','AC753','Львів-Бургас','2020-11-18T11:30:00','03:20:00'),
        ('FR7759','AC753','Львів-Бургас','2020-12-08T11:30:00','03:20:00'),
       
        ('AUI5130','AC466','Львів-Тбілісі','2020-08-14T12:25:00','01:30:00'),
        ('AUI5130','AC466','Львів-Тбілісі','2019-09-26T16:10:00','01:30:00'),
        ('AUI5030','AC466','Львів-Батумі','2020-03-18T12:25:00','01:30:00'),
        ('AUI5030','AC466','Львів-Батумі','2020-02-08T17:30:00','01:30:00'),
        
        ('PGT1760','AC145','Львів-Тбілісі','2020-01-18T15:10:00','02:00:00'),
        ('PGT1760','AC145','Львів-Тбілісі','2019-06-26T11:10:00','02:00:00'),
        ('PGT1660','AC145','Львів-Батумі','2020-11-18T15:10:00','02:00:00'),
        ('PGT1660','AC145','Львів-Батумі','2020-12-08T12:30:00','02:00:00'),

        ('QAA126','AC158','Львів-Коломбо','2020-11-10T10:10:00','12:00:00'),
        ('QAA126','AC158','Львів-Коломбо','2019-12-26T15:30:00','12:00:00'),
        
        ('FLD412','AС496','Львів-Коломбо','2020-02-19T17:10:00','11:30:00'),
        ('FLD412','AС496','Львів-Коломбо','2019-01-10T19:25:00','11:30:00'),
   
        ('LT0366','AC159','Львів-Спліт','2020-09-18T15:10:00','04:00:00'),
        ('LT0366','AC159','Львів-Спліт','2019-09-26T19:10:00','04:00:00'),
        ('LT0266','AC159','Львів-Дубровнік','2020-06-28T13:30:00','04:00:00'),
        ('LT0266','AC159','Львів-Дубровнік','2020-07-08T11:30:00','04:00:00'),
        
        ('KLM485','АС842','Львів-Спліт','2020-08-10T12:10:00','04:00:00'),
        ('KLM485','АС842','Львів-Спліт','2019-06-15T15:10:00','04:00:00'),
        ('KLM475','АС842','Львів-Дубровнік','2020-05-29T18:10:00','04:00:00'),
        ('KLM475','АС842','Львів-Дубровнік','2020-09-11T17:30:00','04:00:00')

SELECT * FROM Flight_to


INSERT INTO Flight_back
 VALUES ('PGT422','AC145','Стамбул-Львів','2020-09-10T19:55:00','02:05:00'),
        ('PGT422','AC145','Стамбул-Львів','2019-09-10T15:55:00','02:05:00'),
        ('PGT422','AC145','Стамбул-Львів','2020-09-26T19:55:00','02:05:00'),
        ('PGT422','AC145','Стамбул-Львів ','2020-09-21T16:00:00','02:05:00'),
        ('PGT422','AC145','Стамбул-Львів','2020-07-20T15:55:00','02:05:00'),
        ('PGT422','AC145','Стамбул-Львів','2019-07-12T16:00:00','02:05:00'),

        ('THY0442','AC895','Стамбул-Львів','2020-05-10T10:00:00','02:00:00'),
        ('THY0442','AC895','Стамбул-Львів','2020-06-23T21:45:00','02:00:00'),
        ('THY0442','AC895','Стамбул-Львів','2019-08-19T10:00:00','02:00:00'),
        ('THY0442','AC895','Стамбул-Львів','2019-10-20T21:45:00','02:00:00'),

        ('AUI5363','AC466','Анталія-Львів','2020-05-20T12:30:00','02:20:00'),
        ('AUI5363','AC466','Анталія-Львів','2020-06-15T11:00:00','02:20:00'),
        ('AUI5363','AC466','Анталія-Львів','2019-06-15T11:00:00','02:20:00'),
        ('AUI5363','AC466','Анталія-Львів','2019-10-28T13:00:00','02:20:00'),
        ('AUI5363','AC466','Анталія-Львів','2020-07-15T12:35:00','02:20:00'),
        ('AUI5363','AC466','Анталія-Львів','2020-06-24T10:40:00','02:20:00'),

        ('AUI5263','AC466','Шарм Ель Шейх-Львів','2020-09-25T15:10:00','04:00:00'),
        ('AUI5263','AC466','Шарм Ель Шейх-Львів','2019-09-28T15:10:00','04:00:00'),
        ('AUI5163','AC466','Хургада-Львів','2020-11-26T17:30:00','04:00:00'),
        ('AUI5163','AC466','Хургада-Львів','2020-12-15T17:30:00','04:00:00'),
        
        ('PGT524','AC145','Шарм Ель Шейх-Львів','2020-09-24T15:10:00','04:00:00'),
        ('PGT524','AC145','Шарм Ель Шейх-Львів','2019-10-05T15:10:00','04:00:00'),
        ('PGT514','AC145','Хургада-Львів','2020-11-24T15:10:00','04:00:00'),
        ('PGT514','AC145','Хургада-Львів','2020-12-19T17:30:00','04:00:00'),

        ('AE4566','AC951','Шарм Ель Шейх-Львів','2020-09-15T16:50:00','04:00:00'),
        ('AE4566','AC951','Шарм Ель Шейх-Львів','2019-10-05T16:50:00','04:00:00'),
        ('AE4466','AC951','Хургада-Львів','2020-11-19T12:30:00','04:00:00'),
        ('AE4466','AC951','Хургада-Львів','2020-11-16T12:30:00','04:00:00'),
        
        ('AE4853','AC951','Варна-Львів','2020-06-10T14:20:00','03:00:00'),
        ('AE4853','AC951','Варна-Львів','2019-06-03T19:45:00','03:00:00'),
        ('AE4753','AC951','Бургас-Львів','2020-08-15T11:10:00','03:00:00'),
        ('AE4753','AC951','Бургас-Львів','2020-07-14T09:30:00','03:00:00'),

        ('FR7860','AC753','Варна-Львів','2020-06-28T16:10:00','03:20:00'),
        ('FR7860','AC753','Варна-Львів','2019-10-03T15:10:00','03:20:00'),
        ('FR7760','AC753','Бургас-Львів','2020-11-28T11:30:00','03:20:00'),
        ('FR7760','AC753','Бургас-Львів','2020-12-16T11:30:00','03:20:00'),
       
        ('AUI5131','AC466','Тбілісі-Львів','2020-08-24T12:25:00','01:30:00'),
        ('AUI5131','AC466','Тбілісі-Львів','2019-09-30T16:10:00','01:30:00'),
        ('AUI5031','AC466','Батумі-Львів','2020-03-25T12:25:00','01:30:00'),
        ('AUI5031','AC466','Батумі-Львів','2020-02-16T17:30:00','01:30:00'),
        
        ('PGT1761','AC145','Тбілісі-Львів','2020-01-24T15:10:00','02:00:00'),
        ('PGT1761','AC145','Тбілісі-Львів','2019-07-04T11:10:00','02:00:00'),
        ('PGT1661','AC145','Батумі-Львів','2020-11-21T15:10:00','02:00:00'),
        ('PGT1661','AC145','Батумі-Львів','2020-12-12T12:30:00','02:00:00'),

        ('QAA127','AC158','Коломбо-Львів','2020-11-15T10:10:00','12:00:00'),
        ('QAA127','AC158','Коломбо-Львів','2020-01-02T15:30:00','12:00:00'),
        
        ('FLD413','AС496','Коломбо-Львів','2020-02-28T17:10:00','11:30:00'),
        ('FLD413','AС496','Коломбо-Львів','2019-01-19T19:25:00','11:30:00'),
   
        ('LT0367','AC159','Спліт-Львів','2020-09-27T15:10:00','04:00:00'),
        ('LT0367','AC159','Спліт-Львів','2019-09-30T19:10:00','04:00:00'),
        ('LT0267','AC159','Дубровнік-Львів','2020-07-07T13:30:00','04:00:00'),
        ('LT0267','AC159','Дубровнік-Львів','2020-07-28T11:30:00','04:00:00'),
        
        ('KLM486','АС842','Спліт-Львів','2020-08-15T12:10:00','04:00:00'),
        ('KLM486','АС842','Спліт-Львів','2019-06-25T15:10:00','04:00:00'),
        ('KLM476','АС842','Дубровнік-Львів','2020-06-04T18:10:00','04:00:00'),
        ('KLM476','АС842','Дубровнік-Львів','2020-09-21T17:30:00','04:00:00')

SELECT * FROM Flight_back

INSERT INTO Operators 
 VALUES ('OP1','Join UP','0800210579','Львів, вул. Павла Ковжуна,7'),
                ('OP2','TEZ tour','+380444955505','г.Киев, ул.Большая Васильковская, 63 оф. 2'),
	('OP3','Coral travel','0800302929','г.Киев, ул.Бульварно-Кудрявская (Воровского),24'),
	('OP4','TUI','0800509796','04053, г.Киев, ул. Сечевых Стрельцов, 23-А, 2 этаж'),
	('OP5','anextour','0445911591','г. Киев, Харьковское шоссе, 201-203, 12-й этаж')
SELECT * FROM Operators

INSERT INTO Employees
 VALUES ('EM1','Барна','Аліна','Федорівна','+380664951326','працівник відділу бронювань',13500),
                ('EM2','Степанцов','Ігор','Сергійович','+380981248563','головний менеджер з продажів',11600),
	('EM3','Nealis','Marta',NULL,'+380671245685','менеджер по роботі з іноземними клієнтами',15000),
	('EM4','Богданов','Сергій','Олександрович','+380954785951','оператор гарячої лінії',8000),
	('EM5','Орлов','Максим','Юрійович','+380664512546','працівник відділу бронювань',13500),
	('EM6','Bass','Bella',NULL,'+380671563245','менеджер по роботі з іноземними клієнтами',15000)
SELECT * FROM Employees

INSERT INTO Orders
 VALUES ('OR1','12565.1','T1258','OP1','EM1','2019-05-15','не оплачено','PGT421','2020-09-03T19:55:00','PGT422','2020-09-10T19:55:00'),
                ('OR2','17853.3','T1596','OP2','EM3','2019-05-17','скасовано','THY0441','2019-10-01T21:45:00','THY0442','2019-10-20T21:45:00'),
	('OR3','15483.2','T1478','OP3','EM5','2019-05-25','не оплачено','AUI5362','2019-10-21T13:00:00','AUI5363','2019-10-28T13:00:00'),
	('OR4','12458.8','T6395','OP4','EM2','2019-05-26','оплачено','AUI5362','2019-10-21T13:00:00','AUI5363','2019-10-28T13:00:00'),
	('OR5','16964.4','T4585','OP5','EM4','2019-05-26','оплачено','PGT523','2020-09-18T15:10:00','PGT524','2020-09-24T15:10:00'),
	('OR6','15486.7','T4595','OP1','EM6','2019-05-26','оплачено','AE4565','2020-09-10T16:50:00','AE4566','2020-09-15T16:50:00'),
        ('OR7','95644.6','T4692','OP3','EM1','2019-05-27','оплачено','AE4752','2020-08-05T11:10:00','AE4753','2020-08-15T11:10:00'),
	('OR8','18564.5','T3647','OP5','EM2','2019-05-27','оплачено','FR7859','2019-09-26T15:10:00','FR7860','2019-10-03T15:10:00'),
	('OR9','12458.8','T7815','OP2','EM3','2019-06-01','скасовано','AUI5130','2019-09-26T16:10:00','AUI5131','2019-09-30T16:10:00'),
	('OR10','18564.5','T7513','OP4','EM3','2019-06-12','оплачено','PGT1760','2020-01-18T15:10:00','PGT1761','2020-01-24T15:10:00'),
        ('OR11','95644.6','T1379','OP5','EM5','2019-06-22','скасовано','QAA126','2019-12-26T15:30:00','QAA127','2020-01-02T15:30:00'),
	('OR12','16964.4','T7913','OP1','EM6','2019-06-22','оплачено','FLD412','2020-02-19T17:10:00','FLD413','2020-02-28T17:10:00'),
	('OR13','12565.1','T1739','OP3','EM1','2019-06-23','оплачено','LT0366','2019-09-26T19:10:00','LT0367','2019-09-30T19:10:00'),
	('OR14','17853.3','T2585','OP2','EM2','2019-09-24','не оплачено','KLM475','2020-09-11T17:30:00','KLM476','2020-09-21T17:30:00'),
        ('OR15','95644.6','T4556','OP5','EM3','2019-10-25','оплачено','PGT421','2020-09-03T19:55:00','PGT422','2020-09-10T19:55:00'),
	('OR16','15486.7','T1575','OP1','EM6','2019-11-25','не оплачено','AUI5362','2020-07-05T12:35:00','AUI5363','2020-07-15T12:35:00'),
	('OR17','12458.8','T1258','OP2','EM5','2019-12-10','не оплачено','PGT523','2020-09-18T15:10:00','PGT524','2020-09-24T15:10:00'),
	('OR18','12565.1','T1478','OP4','EM4','2019-12-14','не оплачено','AE4565','2020-09-10T16:50:00','AE4566','2020-09-15T16:50:00'),
        ('OR19','12458.8','T4585','OP5','EM3','2019-12-18','оплачено','FLD412','2020-02-19T17:10:00','FLD413','2020-02-28T17:10:00'),
	('OR20','17853.3','T4692','OP3','EM3','2019-12-25','оплачено','PGT1660','2020-11-18T15:10:00','PGT1661','2020-11-21T15:10:00'),
	('OR21','18564.5','T7513','OP2','EM2','2020-01-09','оплачено','FLD412','2020-02-19T17:10:00','FLD413','2020-02-28T17:10:00'),
	('OR22','15486.7','T7913','OP3','EM1','2020-06-01','оплачено','KLM485','2020-08-10T12:10:00','KLM486','2020-08-15T12:10:00'),
        ('OR23','95644.6','T2585','OP5','EM1','2020-06-10','не оплачено','THY0441','2020-06-16T21:45:00','THY0442','2020-06-23T21:45:00'),
	('OR24','12458.8','T1575','OP4','EM6','2020-06-24','не оплачено','AUI5162','2020-12-08T17:30:00','AUI5163','2020-12-15T17:30:00'),
	('OR25','15483.2','T1596','OP2','EM6','2020-07-01','скасовано','AUI5362','2020-07-05T12:35:00','AUI5363','2020-07-15T12:35:00'),
	('OR26','12565.1','T6395','OP1','EM5','2020-07-13','оплачено','AE4752','2020-08-05T11:10:00','AE4753','2020-08-15T11:10:00'),
        ('OR27','12458.8','T4595','OP2','EM4','2020-07-16','оплачено','AUI5130','2020-08-14T12:25:00','AUI5131','2020-08-24T12:25:00'),
	('OR28','18564.5','T3647','OP3','EM4','2020-07-21','оплачено','QAA126','2020-11-10T10:10:00','QAA127','2020-11-15T10:10:00'),
	('OR29','16964.4','T7513','OP4','EM3','2020-07-30','оплачено','LT0366','2020-09-18T15:10:00','LT0367','2020-09-27T15:10:00'),
	('OR30','15486.7','T1379','OP5','EM2','2020-08-02','скасовано','KLM475','2020-09-11T17:30:00','KLM476','2020-09-21T17:30:00'),
        ('OR31','12565.1','T7815','OP4','EM2','2020-08-06','скасовано','FR7759','2020-11-18T11:30:00','FR7760','2020-11-28T11:30:00'),
	('OR32','95644.6','T1258','OP3','EM1','2020-08-07','не оплачено','FR7759','2020-12-08T11:30:00','FR7760','2020-12-16T11:30:00'),
	('OR33','17853.3','T1596','OP2','EM5','2020-08-09','скасовано','AE4465','2020-11-08T12:30:00','AE4466','2020-11-19T12:30:00'),
	('OR34','16964.4','T1478','OP1','EM6','2020-08-15','не оплачено','PGT1660','2020-12-08T12:30:00','PGT1661','2020-12-12T12:30:00')
SELECT * FROM Orders

INSERT INTO InterTable
 VALUES ('OR1','125.1','I12489'),
        ('OR1','125.2','I12489'),
		('OR1','125.3','I12489'),
        ('OR2','125.4','I12569'),
		('OR2','125.5','I12569'),
	    ('OR3','125.6','I13695'),
	    ('OR3','125.7','I13695'),
	    ('OR4','125.8','I25469'),
	    ('OR5','125.9','I17935'),
	    ('OR6','125.10','I59731'),
		('OR6','125.11','I59731'),
        ('OR7','125.12','I59731'),
		('OR7','125.13','I59731'),
	    ('OR8','125.14','I12569'),
	    ('OR9','125.15','I25469'),
	    ('OR10','125.16','I17935'),
		('OR10','125.17','I17935'),
		('OR11','125.18','I85462'),
        ('OR11','125.19','I85462'),
		('OR11','125.20','I85462'),
		('OR12','125.4','I85462'),
	    ('OR12','125.5','I85462'),
	    ('OR13','125.15','I17935'),
	    ('OR14','125.8','I17935'),
        ('OR15','125.18','I12489'),
		('OR15','125.19','I12489'),
		('OR15','125.20','I12489'),
		('OR16','125.1','I59731'),
	    ('OR16','125.2','I59731'),
	    ('OR17','125.10','I12489'),
		('OR17','125.11','I12489'),
		('OR18','125.16','I12569'),
	    ('OR18','125.17','I12569'),
        ('OR19','125.9','I25469'),
	    ('OR20','125.14','I59731'),
	    ('OR21','125.6','I12569'),
		('OR21','125.7','I12569'),
		('OR22','125.4','I85462'),
	    ('OR22','125.5','I85462'),
        ('OR23','125.18','I85462'),
		('OR23','125.19','I85462'),
	    ('OR24','125.1','I17935'),
	    ('OR24','125.2','I17935'),
	    ('OR25','125.10','I59731'),
	    ('OR25','125.11','I59731'),
	    ('OR26','125.15','I12489'),
        ('OR27','125.14','I25469'),
	    ('OR28','125.16','I85462'),
		('OR28','125.17','I85462'),
	    ('OR29','125.10','I17935'),
	    ('OR29','125.11','I17935'),
	    ('OR30','125.8','I59731'),
        ('OR31','125.12','I12489'),
		('OR31','125.13','I12489'),
	    ('OR32','125.8','I12569'),
	    ('OR33','125.2','I17935'),
		('OR33','125.3','I17935'),
	    ('OR34','125.12','I17935'),
		('OR34','125.13','I17935')
SELECT * FROM InterTable
