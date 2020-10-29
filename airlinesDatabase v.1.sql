Create database [Tour_company (Minakov D., Pakhomova N., Ostashevska N., Kvasnii S.)]
 collate Ukrainian_CI_AI

Use [Tour_company (Minakov D., Pakhomova N., Ostashevska N., Kvasnii S.)]

Create table Country
(id_country NVARCHAR not null,
 name NVARCHAR(20) not null,
 constraint prim_country primary key(id_country)) 

 Create table Hotels
(id_hotel NVARCHAR not null,
 name_hotel NVARCHAR(20) not null,
 stars INT not null,
 id_country NVARCHAR not null, 
 constraint prim_hotel primary key (id_hotel),
 constraint foreign_country foreign key (id_country)
 references Country on delete no action)

  Create table Nutrition
(id_nutrition NVARCHAR not null,
 type_nutrition NVARCHAR(40) not null,
 constraint prim_nutrition primary key (id_nutrition))

 Create table Tours
 (id_tour NVARCHAR not null,
 tour_status NVARCHAR not null,
 id_hotel NVARCHAR not null,
 id_nutrition NVARCHAR not null,
 constraint prim_tour primary key (id_tour),
 constraint foreign_hotel foreign key (id_hotel)
 references Hotels on delete no action,
 constraint foreign_nutrition foreign key (id_nutrition)
 references Nutrition on delete no action)

 Create table Clients
 (id_client NVARCHAR not null primary key,
 client_surname NVARCHAR not null,
 client_name NVARCHAR not null,
 client_patronymic Nvarchar null,
 client_passport NVARCHAR not null,
 client_tel_numb NVARCHAR not null,
 preferences NVARCHAR null,
 client_date_birth DATE null)

 Create table Operators
 (id_operator NVARCHAR not null primary key,
 operator_name NVARCHAR not null,
 operator_tel_numb NVARCHAR not null,
 operator_address NVARCHAR null)

 Create table Employees
 (id_employee NVARCHAR not null primary key,
 employee_surname NVARCHAR not null,
 employee_name NVARCHAR not null,
 employee_patronymic Nvarchar null,
 employee_tel_numb NVARCHAR not null,
 position NVARCHAR not null,
 salary DECIMAL not null)

 Create table Airline_companies
 (id_airline NVARCHAR not null primary key,
  airline_name NVARCHAR not null,
  airline_tel_numb NVARCHAR not null,
  airline_address NVARCHAR null)

  Create table Flight_to
  (flight_number_to NVARCHAR not null primary key,
  id_airline NVARCHAR not null foreign key
  references Airline_companies on delete no action,
  date_to DATETIME not null,
  flight_duration_to TIME not null)

  Create table Flight_back
  (flight_number_back NVARCHAR not null primary key,
  id_airline NVARCHAR not null foreign key
  references Airline_companies on delete no action,
  date_back DATETIME not null,
  flight_duration_back TIME not null)

  Create table Insurance
  (id_insurance NVARCHAR not null primary key,
  risk NVARCHAR null,
  insurance_company NVARCHAR not null,
  insurance_duration INT not null)

  Create table Travellers
 (id_traveller NVARCHAR not null primary key,
 traveller_surname NVARCHAR not null,
 traveller_name NVARCHAR not null,
 traveller_patronymic Nvarchar null,
 traveller_passport NVARCHAR not null,
 traveller_tel_numb NVARCHAR not null,
 traveller_date_birth DATE null)

 Create table Orders
 (id_order NVARCHAR not null primary key,
 id_client NVARCHAR not null foreign key
 references Clients on delete no action,
 id_traveller NVARCHAR not null foreign key
 references Travellers on delete no action,
 id_tour NVARCHAR not null foreign key
 references Tours on delete no action,
 id_operator NVARCHAR not null foreign key
 references Operators on delete no action,
 id_employee NVARCHAR not null foreign key
 references Employees on delete no action,
 order_date DATE not null,
 order_status NVARCHAR not null,
 number_flight_to NVARCHAR not null foreign key
 references Flight_to on delete no action,
 number_flight_back NVARCHAR not null foreign key
 references Flight_back on delete no action)
  
  Create table InterTable
 (id_order NVARCHAR not null foreign key
 references Orders on delete no action,
 id_traveller NVARCHAR not null foreign key
 references Travellers on delete no action,
 id_insurance NVARCHAR not null foreign key
 references Insurance on delete no action)

 
