/*table 1*/
CREATE TABLE client_master
(
	client_no VARCHAR2(6) CHECK (client_no LIKE 'CN%'),
	name VARCHAR2(20) NOT NULL,
	address VARCHAR2(30),
	city VARCHAR2(15) CHECK (city IN ('Rajshahi', 'Nagaon','Natore','Chapai')),
	state VARCHAR2(15),
	pincode NUMBER(6),
	bal_due NUMBER(10,2),
	PRIMARY KEY (client_no)
);


insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0001', 'Ivan Bayross','Rajshahi', 'Bangladesh', 400054, 15000);

insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0002', 'Vandana Saitwal', 'Nagaon', 'Bangladesh', 780001, 0);

insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0003', 'Pramada Jaguste', 'Rajshahi', 'Bangladesh', 400057, 5000);

insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0004', 'Basu Navindgi', 'Chapai', 'Bangladesh',400056, 0);

insert into Client_master(client_no,name,city,pincode, bal_due)
values('CN0005', 'Ravi Sreedharan', 'Natore', 100001, 2000);

insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0006', 'Rukmini', 'Rajshahi', 'Bangladesh' ,400050,0);

insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0007', 'MD. Omar Faruque', 'Rajshahi', 'Bangladesh' ,400090,0);

insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0008', 'Md. Saiful Islam', 'Chapai', 'Bangladesh',400096, 0);

/*table 1 done 9:50 AM */




/*table 2*/
CREATE TABLE product_master
(
   product_no varchar2(6) CHECK ( product_no LIKE 'P%'),
   description varchar2(30) NOT NULL,
   profit_percent number(5,2) NOT NULL,
   qty_on_hand number(8) NOT NULL,
   sell_price number(8,2) NOT NULL CHECK(sell_price>0 ), 
   cost_price number(8,2) NOT NULL CHECK(cost_price>0 ),
   PRIMARY KEY(product_no)
);

SELECT product_no, description,
    sell_price * .15 Increase_In_Price,
    sell_price * 1.15 New_Selling_Price
FROM product_master;
    


insert into product_master values('P00001', '1.44 Floppies', 5, 100, 525, 500);

insert into product_master values('P03453', 'Monitors', 6, 10, 12000, 11280);

insert into product_master values('P06734', 'Mouse', 5, 20, 1050, 1000);

insert into product_master values('P07865', '1.22 Floppies', 5, 100,  525, 500);

insert into product_master values('P07868', 'Keyboads', 2, 100,  3150, 3050);

insert into product_master values('P07885', 'CD Drives', 2.5, 10,  5250, 5100);

insert into product_master values('P07965',  '540 HDD', 4, 10,  8400, 8000);

insert into product_master values('P07975', '1.44 Drive', 5, 10, 1050, 1000);

insert into product_master values('P08865', '1.22 Drive', 5, 2,  1050, 1000);

insert into product_master values('P08868', 'DVD Drive', 5, 2,  1050, 1000);



insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0007', 'MD. Omar Faruque', 'Rajshahi', 'Bangladesh' ,400090,0);


/*done 10:01 AM*/




/*table 3*/
CREATE TABLE salesman_master
(
	salesman_no VARCHAR2(7) CHECK (salesman_no LIKE 'SN%'),
	salesman_name VARCHAR2(20) NOT NULL,
	address VARCHAR2(30) NOT NULL,
	city VARCHAR2(20),
	pincode VARCHAR2(6),
	sal_arnt number(8,2) NOT NULL CHECK (sal_arnt > 0),
	tgt_to_get NUMBER(6,2)	NOT NULL CHECK (tgt_to_get > 0),
	ytd_sales NUMBER(6,2) NOT NULL,
	remarks VARCHAR(60),
	PRIMARY KEY (salesman_no)
);



INSERT INTO salesman_master VALUES('SN00001','Kiran','Worli','Rajshahi','400002',3000,100,50,'Good');
INSERT INTO salesman_master VALUES('SN00002','Manish','Nariman','Rajshahi','400001',3000,200,100,'Good');
INSERT INTO salesman_master VALUES('SN00003','Ravi','Bandra','Rajshahi','400032',3000,200,100,'Good');
INSERT INTO salesman_master VALUES('SN00004','Ashis','Juhu','Rajshahi','400044',3500,200,150,'Good');

/*done 10:11 AM*/




/*table 4*/
CREATE TABLE sales_order
(
	s_order_no varchar2(7)  CHECK(s_order_no LIKE 'SO%'),
	s_order_date date,
	client_no varchar2(6),
	dely_Addr varchar2(25),
	salesman_no varchar2(7),
	dely_type char(1) DEFAULT ('F'), 
	
	dely_date date,
	order_status varchar2(10) CHECK (order_status IN ('In Process','Fulfilled','BackOrder','Canceled')),
	PRIMARY KEY(s_order_no),
	FOREIGN KEY (client_no) REFERENCES client_master(client_no),
	FOREIGN KEY (salesman_no) REFERENCES salesman_master(salesman_no),
	CHECK(dely_date > s_order_date),
	CHECK(dely_type IN('F','P')) 

);




insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO19001','CN0001','F','SN00001','In Process');

insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO19002','CN0002','P','SN00002','Canceled');

insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO46865','CN0003','F','SN00003','Fulfilled');

insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO19003','CN0001','F','SN00001','Fulfilled');

insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO46866','CN0004','P','SN00002','Canceled');

insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO10008','CN0005','F','SN00004','In Process');

insert into sales_order (s_order_no, client_no, dely_type, salesman_no, order_status)
values('SO10018','CN0005','F','SN00004','In Process');

/*done 10:20 AM*/

insert into product_master values('P08868', 'DVD Drive', 5, 2,  1050, 1000);



insert into Client_master(client_no,name,city,state,pincode, bal_due)
values('CN0007', 'MD. Omar Faruque', 'Rajshahi', 'Bangladesh' ,400090,0);




/*table 5*/
create table sales_order_details(
    s_order_no varchar2(7), 
    product_no varchar2(6), 
    qty_ordered numeric(8),
    qty_disp numeric(8),
    product_rate numeric(10,2),
    primary key (s_order_no , product_no),
    foreign key(s_order_no) references sales_order(s_order_no),
    foreign key (product_no) references product_master(product_no)
    );

insert into sales_order_details values('SO19001', 'P00001', 4, 4, 525);

insert into sales_order_details values('SO19001', 'P07965', 2, 1, 8400);

insert into sales_order_details values('SO19001', 'P07885', 2, 1, 5250);

insert into sales_order_details values('SO19002', 'P00001', 10, 0, 525);

insert into sales_order_details values('SO19005', 'P07868', 3, 3, 3150);

insert into sales_order_details values('SO19005', 'P07885', 3, 1, 5250); 
insert into sales_order_details values('SO19005', 'P00001', 10,10, 525);
insert into sales_order_details values('SO19005', 'P03453', 4, 4, 1050);
insert into sales_order_details values('SO19003', 'P03453', 2, 2, 1050);
insert into sales_order_details values('SO19003', 'P06734', 1, 1, 12000);
insert into sales_order_details values('SO46866', 'P07965', 1, 0, 8400);
insert into sales_order_details values('SO46866', 'P07975', 1, 0, 1050);
insert into sales_order_details values('SO10008', 'P00001', 10, 5, 525);
insert into sales_order_details values('SO10008', 'P07975', 5, 3, 1050);


/*done 10:29 AM*/



/*table 6*/
create table challan_Header(
challan_no varchar2(6) primary key check(challan_no like 'CH%'),
s_order_no varchar2(7),
billed_yn char(1) default('N'),
foreign key (s_order_no) references sales_order(s_order_no),
check(billed_yn in('Y','N'))
);

insert into Challan_Header values('CH9001', 'SO19001', 'Y');
insert into Challan_Header values('CH6865', 'SO46865', 'Y');
insert into Challan_Header values('CH3965', 'SO10008', 'Y');


/*done 10:35 AM*/



/*table 7*/
create table Challan_Details(
challan_no varchar2(6),
product_no varchar2(6),
qty_disc numeric(4,2) not null,
primary key(challan_no, product_no),
foreign key(challan_no) references challan_header(challan_no), 
foreign key(product_no) references product_master(product_no)
);


insert into Challan_Details values('CH9001', 'P00001', 4);

insert into Challan_Details values('Ch9001', 'P07965', 1);

insert into Challan_Details values('CH9001', 'P07885', 1);

insert into Challan_Details values('CH6865', 'P07868', 3);

insert into Challan_Details values('CH6865', 'P03453', 4);

insert into Challan_Details values('CH6865', 'p00001', 10);

insert into Challan_Details values('CH3965', 'P00001', 5);

insert into Challan_Details values('CH3965', 'P07975',2);



/*done 10:39 AM*/



/*Query No. 1 */
SELECT *
FROM client_master
WHERE name LIKE 'Md.%' 
UNION
SELECT *
FROM client_master
WHERE name LIKE 'MD.%' 


/*Query No. 2 */
SELECT *
FROM product_master
WHERE sell_price > 1500

UNION

SELECT product_no, description,
    sell_price * .15 Increase_In_Price,
    sell_price * 1.15 New_Selling_Price
FROM product_master;


/*Query No. 3 */
SELECT client_no, name
FROM Sales_Order
WHERE details = 'DVD Drive'


/*Query No. 4 */
UPDATE client_master
SET city = 'Natore'
WHERE client_no = 'CN0003'; 

SELECT *
FROM client_master
WHERE client_no =  'CN0003'; 

