/*
CREATE TABLE source_table (
  r_number integer,
  ts varchar,
  cookie_id varchar,
  abi_email varchar,
  abi_phone varchar, 
  abi_city varchar ); 
--INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (1, '1605994889', '6820', 'sbreffitt0@printfriendly.com', '94205507', 'Goz Beida'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (2, '1604213383', '9919', 'ptrouncer1@cpanel.net', '25598134', 'Umea'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (3, '1609605142', '3478', 'gspearett2@foxnews.com', '93216475', 'Le Teil'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (4, '1622330810', '5982', 'gspearett2@foxnews.com', '28674053', 'Yima'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (5, '1613878252', '6820', 'rsidwick4@webeden.co.uk', '70204814', 'Otyn'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (6, '1616830525', '5922', 'llinguard5@t.co', '25598134', 'Kota Kinabalu'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (7, '1610543967', '2653', 'aarchard6@topsy.com', '68320893', 'Pego Longo'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (8, '1615444814', '8785', 'dhatliff7@sakura.ne.jp', '25598134', 'Imam Sahib'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (9, '1615024464', '5688', 'gspearett2@foxnews.com', '72392351', 'Ramotswa'); INSERT INTO source_table (r_number, ts, cookie_id, abi_email, abi_phone, abi_city) VALUES (10, '1623898817', '6820', 'ipittf@cnn.com', '57919992', 'Limeiras');
*/

WITH unified AS (
    SELECT 
        r_number, 
        ts, 
        cookie_id, 
        abi_email, 
        abi_phone, 
        abi_city,
        MIN(r_number) OVER (PARTITION BY cookie_id) AS min_cookie_id,
        MIN(r_number) OVER (PARTITION BY abi_email) AS min_email_id,
        MIN(r_number) OVER (PARTITION BY abi_phone) AS min_phone_id
    FROM 
        source_table
),
final_unification AS (
    SELECT 
        r_number,
        ts,
        cookie_id,
        abi_email,
        abi_phone,
        abi_city,
        CASE
            WHEN min_cookie_id <= min_email_id AND min_cookie_id <= min_phone_id THEN min_cookie_id
            WHEN min_email_id <= min_cookie_id AND min_email_id <= min_phone_id THEN min_email_id
            ELSE min_phone_id
        END AS td_id
    FROM 
        unified
)
SELECT 
    r_number,
    ts,
    cookie_id,
    abi_email,
    abi_phone,
    abi_city,
    td_id
FROM 
    final_unification
ORDER BY 
    r_number;