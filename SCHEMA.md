create database smart_travel_guide_webApp;

create table users (
	username varchar(10) not null,
	password varchar(100) not null,
	fullname varchar(20) not null,
	email varchar(50) not null,
	unique(username,email),
	unique(username),
	unique(email)
);
insert into users values("akbhobhiya","kuchbhibolo","Ashok Bhobhiya","akbhobhiya2000@gmail.com"),
("asisrout","kuchbhibolomat","Asis Rout","asisrout@gmail.com"),
("jeeuk","kuchbhiboloabhi","Jeeu Kayshap","geetkayshap@gmail.com");


create table tourist_place (

    id INT NOT NULL AUTO_INCREMENT,
    city VARCHAR(30) NOT NULL,
    region VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL DEFAULT 'IN',
    dailyCost DECIMAL(6,2) NOT NULL,
    aviTour int not null,
    bookedTour int not null,
    PRIMARY KEY (id),
    UNIQUE (city, region, country),
    CHECK (dailyCost > 0)
);
insert into tourist_place values(3112,"Churu","ClockHouse","India",003433.23,100,25),
(3113,"jaipur","hawamahal","India",003422.23,125,50),
(3114,"udaipur","sambharlack","India",003411.23,75,50);

create table review (

    id INT NOT NULL auto_increment,
    numStars INT NOT NULL,
    locationid int not null,
    detailedReview VARCHAR(1000),
    submissionDate DATETIME NOT NULL,
    author VARCHAR(35) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (author) REFERENCES users(username),
    FOREIGN KEY(locationid) REFERENCES tourist_place(id),
    CHECK (numStars >= 1 AND numStars <= 10)
);
insert into review values(1516,8,3112,"its a good place to visit",'2020-05-30 18:41:35',"akbhobhiya"),
(1517,10,3113,"its a very good place to visit",'2020-05-30 18:45:35',"asisrout"),
(1518,4,3114,"its a not a good place to visit",'2020-05-30 18:47:35',"jeeuk");


create table place_pics (
       id int not null auto_increment,
       locationid int not null,
       caption varchar(50) default 'pic',
       description varchar(1000),
       -- img longblob not null,
       img varchar(200) not null,
       primary key(id),
       FOREIGN KEY (locationid) REFERENCES tourist_place(id)
);
insert into place_pics VALUES(4322,3112,"its a clockHouse","mana ki yahi clockhouse hai apn jayada kuch nahi kar sakte hai","/home/ashok/Desktop/image/clock.jpg"),
(4323,3113,"its a Hawamahal","mana ki yahi hawamahal hai apn jayada kuch nahi kar sakte hai","/home/ashok/Desktop/image/hawamahal.jpg"),
(4324,3114,"its a lack","mana ki yahi lack hai apn jayada kuch nahi kar sakte hai","/home/ashok/Desktop/image/lack.jpg");

create table payment (
       id INT NOT NULL AUTO_INCREMENT,
       username VARCHAR(20) not null,
       amount DECIMAL(10,2) NOT NULL,
       paymentType ENUM('debit', 'credit'),
       cardNo VARCHAR(16) NOT NULL,
       PRIMARY KEY (id),
       FOREIGN KEY(username) REFERENCES users(username),
       CHECK (amount > 0)
);

insert into payment VALUES(0001,"akbhobhiya",37765.53,'debit',1234567890123456),
(0002,"asisrout",34222.30,'debit',1234567890123456),
(0003,"jeeuk",30701.07,'debit',1234567890123456),
(0004,"akbhobhiya",1200,'debit',1234567890123456),
(0005,"asisrout",2200,'debit',1234567890123456),
(0006,"jeeuk",2000,'debit',1234567890123456);

create table tourbook(
       id int not null,
       username varchar(20) null,
       locationid int not null,
       checkin date not null,
       checkout date not null,
       noOfticket int not null,
       paymentid int not null,
       primary key(id),
       FOREIGN key(username) REFERENCES users(username),
       FOREIGN key(locationid) REFERENCES tourist_place(id),
       FOREIGN KEY(paymentid) REFERENCES payment(id)

);
insert into tourbook VALUES(1111,"akbhobhiya",3112,'2020-05-30','2020-05-31',11,0001),
(1112,"asisrout",3113,'2020-05-30','2020-06-01',10,0002),
(1113,"jeeuk",3114,'2020-05-30','2020-06-05',9,0003);
-- create table atm (
--        id int not null auto_increment,
--        name VARCHAR(30) not null,
--        type VARCHAR(20) not null default 'saving',
--        address varchar(100) DEFAULT 'IN',
--        unique(id),
--        FOREIGN KEY (id) REFERENCES tourist_place(id)
-- );
-- insert into atm values(3112,"sbiatm","saving1","churu"),(3113,"sbiatm","saving2","jaipur"),(3114,"sbiatm","saving3","udaipur");

  

-- create table record_of_tour_booking (
--        id INT NOT NULL,
--        departureTime TIME NOT NULL,
--        sourceLocationid INT NOT NULL,
--        destinationLocationid INT NOT NULL,
--        fareEconomy DECIMAL(6,2) NOT NULL,
--        fareBusiness DECIMAL(6,2) NOT NULL,
--        fareFirst DECIMAL(6,2) NOT NULL,
--        fare DECIMAL(6,2) NOT NULL,
--        numSeatsRemainingEconomy INT NOT NULL,
--        numSeatsRemainingBusiness INT NOT NULL,
--        numSeatsRemainingFirst INT NOT NULL,
--        FOREIGN KEY (id) REFERENCES booking(id),
--        FOREIGN KEY (sourceLocationid) REFERENCES tourist_place(id),
--        FOREIGN KEY (destinationLocationid) REFERENCES tourist_place(id),
--        CHECK (fare > 0)
-- );

-- create table flight (
--        id INT NOT NULL,
--        airline VARCHAR(30) NOT NULL,
--        FOREIGN KEY (id) REFERENCES record_of_tour_booking(id)
-- );

-- create table train (
--        id INT NOT NULL,
--        railroad VARCHAR(30),
--        FOREIGN KEY (id) REFERENCES record_of_tour_booking(id)
-- );

-- create table hotel (
--        id INT NOT NULL,
--        endDate DATE NOT NULL,
--        dailyCost DECIMAL(6,2) NOT NULL,
--        address VARCHAR(30),
--        locationid INT NOT NULL,
--        FOREIGN KEY (id) REFERENCES booking(id),
--        FOREIGN KEY (locationid) REFERENCES tourist_place(id),
--        CHECK (dailyCost > 0)
-- );
create table hotel (
       id INT NOT NULL auto_increment,
       name varchar(100) NOT NULL,
       dailyCost DECIMAL(6,2) NOT NULL,
       address VARCHAR(30),
       locationid INT NOT NULL,
       roomAvi int not null,
       roomBook int not null,
       noOfStar int not null,
       PRIMARY KEY(id),
       FOREIGN KEY (locationid) REFERENCES tourist_place(id),
       CHECK (dailyCost > 0),
       CHECK (noOfStar >= 1 AND noOfStar <= 10)
);
insert into hotel VALUES(2222,"SHRI SAI HOTEL",1200,"Surathkal",3112,100,23,10),
(2223,"SHRI SAI HOTEL1",1100,"Surathkal1",3113,100,23,8),
(2224,"SHRI SAI HOTEL2",1000,"Surathkal2",3114,100,23,7);

create table hotelbook(
       id int not null,
       username varchar(20) null,
       hotelid int not null,
       checkin date not null,
       checkout date not null,
       noOfrooms int not null,
       paymentid int not null,
       primary key(id),
       FOREIGN key(username) REFERENCES users(username),
       FOREIGN key(hotelid) REFERENCES hotel(id),
       FOREIGN KEY(paymentid) REFERENCES payment(id)
);
insert into hotelbook VALUES(7777,"akbhobhiya",2222,'2020-05-30','2020-05-31',1,0004),
(7778,"asisrout",2223,'2020-05-30','2020-06-05',2,0005),
(7779,"jeeuk",2224,'2020-05-30','2020-06-05',2,0006);

create table booking (
       id INT NOT NULL auto_increment,
       username varchar(20) not null,
       hotelbookid int not null,
       tourbookid int not null,
       PRIMARY KEY (id),
       FOREIGN KEY(hotelbookid) REFERENCES hotelbook(id),
       FOREIGN KEY(tourbookid) REFERENCES tourbook(id),
       FOREIGN KEY(username) REFERENCES users(username)
);     
insert into booking VALUES(8888,"akbhobhiya",7777,1111),
(8889,"asisrout",7778,1112),
(8890,"jeeuk",7779,1113);


-- ALTER TABLE tourist_place
-- DROP FOREIGN KEY tourist_place_ibfk_1;

-- alter table tourist_place drop column bookingID;

-- ALTER TABLE place_pics
-- MODIFY COLUMN img varchar(200) not null;

-- ALTER TABLE tourist_place
-- MODIFY COLUMN region varchar(20) not null;

-- alter table users drop column role;
-- alter table users drop column address;
-- alter table users drop column id;

-- drop table hotel;
-- drop table atm;
-- drop table flight;
-- drop table train;
-- drop table record_of_tour_booking;
-- drop table booking;
