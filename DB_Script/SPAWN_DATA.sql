INSERT INTO USERROLE VALUES  (
    '1',
    'ADMIN'
)

INSERT INTO USERROLE VALUES (
    '2',
    'USER'
)

INSERT INTO USERS VALUES(
    'tiendvlp@gmail.com',
    0,
    'BUILTIN',
    'Dang Minh Tien',
    'TIEN123',
    '0969747887',
    '32, Ho Hai Nghia, Cai Lay, Tien Giang',
    '1'
)

INSERT INTO USERS VALUES(
    'tamnhu@gmail.com',
    0,
    'GOOGLE_SIGNIN',
    'Lam Tam Nhu',
    'TIEN123',
    '0974666838',
    '129/32, Quang Ngai',
    '2'
)

INSERT INTO CATEGORY VALUES (
    'A12', 
    'HISTORY'
)

INSERT INTO CATEGORY VALUES (
    'B232', 
    'Science Fiction & Fantasy'
)

INSERT INTO CATEGORY VALUES (
    'C1S2', 
    'COMICS'
)


INSERT INTO PRODUCT VALUES (
    '23A9182DA', 'SAPIENS', 'A little history of human beings', 'A12', 23.99, 120, '2020-12-12'
)


INSERT INTO PRODUCT VALUES (
    '24A9182DA', 'LITTLE HISTORY OF ECONOMY', 'A little history of the economy', 'A12', 13.89, 11, '2021-03-12'
)


INSERT INTO PRODUCT VALUES (
    '23A9282DA', 'The Hobbit And The Lord Of the Rings', 'telling the complete story of Bilbo Baggins and the Hobbits epic encounters with Gandalf, Gollum, dragons and monsters, in the quest to destroy the One Ring',
     'B232', 199.99, 120, '2021-01-09'
)


INSERT INTO PRODUCT VALUES (
    '23B9182DA', 'Fantastic Beasts and Where to Find Them',
    'Prepare to be dazzled by the wild wonders of the wizarding world in this sumptuously illustrated full-colour paperback edition of Fantastic Beasts ',
    'B232',
     223.95, 19, '2019-12-12'
)

INSERT INTO PRODUCT VALUES (
    '23A9182HG', 'Marvel Comics: Untell story',
    'the untell story of Marvel Comics', 
    'C1S2', 13.99, 10, '2018-12-12'
)


INSERT INTO PRODUCT VALUES (
    '25G6182DA', 'Angry Birds Comics', 
    'Angry Birds is a Finnish action-based media franchise created by the Finnish company Rovio Entertainment.', 
    'C1S2', 103.99, 209, '2016-02-12'
)

INSERT INTO ORDER_STATUS VALUES ('1', 'PENDING')
INSERT INTO ORDER_STATUS VALUES (2, 'FAILED')
INSERT INTO ORDER_STATUS VALUES (3, 'SUCCESS')


INSERT INTO ORDERS (
    ID, USEREMAIL, ADDRESS, PHONE, TOTAL_PRICE, ORDER_DATE, PAYMENT_STATUS
) VALUES (
    '12312', 'tiendvlp@gmail.com', 'Tien Giang', '0987222102', 2321.23, '2021-02-12', 1
)

INSERT INTO ORDERDETAIL (ID, ORDERID, PRODUCTID, QUANTITY, TOTAL_PRICE,STATUS) VALUES (    '1233A', '12312', '25G6182DA', 20, 2000, '1')
select * from PRODUCT
select  ORDERDETAIL.ID, ORDERID, PRODUCTID, PRODUCT.NAME, ORDERDETAIL.QUANTITY, TOTAL_PRICE,STATUS from ORDERDETAIL inner join PRODUCT on ORDERDETAIL.PRODUCTID = PRODUCT.ID