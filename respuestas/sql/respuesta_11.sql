/*
CREATE TABLE abi_consents ( client_id VARCHAR(4), brand_name VARCHAR(15), consent VARCHAR(20) );
INSERT INTO abi_consents VALUES ('AF32', 'BRAHMA', 'TC-PP'); INSERT INTO abi_consents VALUES ('AF32', 'BRAHMA', 'MARKETINGACTIVATION'); INSERT INTO abi_consents VALUES ('YD71', 'BRAHMA', 'TC-PP'); INSERT INTO abi_consents VALUES ('ODA2', 'BRAHMA', null); INSERT INTO abi_consents VALUES ('LA94', 'BRAHMA', 'MARKETINGACTIVATION'); INSERT INTO abi_consents VALUES ('JA13', 'BRAHMA', 'MARKETING-ANALYTICS'); INSERT INTO abi_consents VALUES ('JA13', 'BRAHMA', 'TC-PP'); INSERT INTO abi_consents VALUES ('YD71', 'SKOL', 'TC-PP'); INSERT INTO abi_consents VALUES ('YD71', 'SKOL', 'MARKETING-ACTIVATION'); INSERT INTO abi_consents VALUES ('KD81', 'SKOL', 'TC-PP'); INSERT INTO abi_consents VALUES ('KD81', 'SKOL', 'MARKETING-ACTIVATION'); INSERT INTO abi_consents VALUES ('OSW1', 'BRAHMA', 'TC-PP'); INSERT INTO abi_consents VALUES ('KD81', 'SKOL', null);
*/

SELECT * FROM abi_consents;

SELECT 
    client_id,
    brand_name,
    CASE
        WHEN SUM(CASE WHEN consent = 'TC-PP' THEN 1 ELSE 0 END) > 0 
             AND SUM(CASE WHEN consent = 'MARKETING-ACTIVATION' THEN 1 ELSE 0 END) > 0 THEN 'Opted-In'
        WHEN SUM(CASE WHEN consent = 'TC-PP' THEN 1 ELSE 0 END) > 0 
             AND SUM(CASE WHEN consent = 'MARKETING-ACTIVATION' THEN 1 ELSE 0 END) = 0 THEN 'Not Given'
        ELSE 'Unknown'
    END AS consent_classification
FROM 
    abi_consents
GROUP BY 
    client_id, brand_name
ORDER BY 
    client_id, brand_name;