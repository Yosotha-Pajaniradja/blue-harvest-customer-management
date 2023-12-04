CREATE SCHEMA IF NOT EXISTS CUSTOMER_KYC;
SET SCHEMA CUSTOMER_KYC;
DROP TABLE IF EXISTS CUSTOMER_KYC.CUSTOMER_ACCOUNT;
DROP TABLE IF EXISTS CUSTOMER_KYC.CUSTOMER_INFO;


CREATE TABLE CUSTOMER_KYC.CUSTOMER_INFO
(
    identifier         INT AUTO_INCREMENT,
    customer_identifier VARCHAR(50) PRIMARY KEY,
    first_name          VARCHAR(75) NOT NULL,
    last_name           VARCHAR(75) NOT NULL,
    no_of_valid_account INT         NOT NULL,
    country             VARCHAR(50),
    tax_profile         VARCHAR(12),
    operating_currency  VARCHAR(3),
    creation_date       TIMESTAMP,
    update_date         TIMESTAMP
);
COMMIT;

CREATE TABLE CUSTOMER_KYC.CUSTOMER_ACCOUNT
(
    customer_identifier VARCHAR(50),
    account_number      VARCHAR(50) PRIMARY KEY,
    validity_date       VARCHAR(75) NOT NULL,
    creation_date       VARCHAR(75) NOT NULL

);
COMMIT;

ALTER TABLE CUSTOMER_ACCOUNT DROP CONSTRAINT IF EXISTS FK_ACCOUNT_INFO;
ALTER TABLE CUSTOMER_ACCOUNT
    ADD CONSTRAINT FK_ACCOUNT_INFO
        FOREIGN KEY (customer_identifier)
            REFERENCES CUSTOMER_INFO(customer_identifier)
            ON DELETE CASCADE;


INSERT INTO TESTDB.CUSTOMER_KYC.CUSTOMER_INFO (FIRST_NAME, LAST_NAME, CUSTOMER_IDENTIFIER,
                                               NO_OF_VALID_ACCOUNT,
                                               OPERATING_CURRENCY, TAX_PROFILE, COUNTRY, CREATION_DATE, UPDATE_DATE)
VALUES ('John', 'FRANK', 'C09345058FDFF', 1, 'EUR', 'RETAIL', 'FRANCE', now(), now());

INSERT INTO CUSTOMER_KYC.CUSTOMER_INFO (FIRST_NAME, LAST_NAME, CUSTOMER_IDENTIFIER,
                                        NO_OF_VALID_ACCOUNT,
                                        OPERATING_CURRENCY, TAX_PROFILE, COUNTRY, CREATION_DATE, UPDATE_DATE)
VALUES ('Frank', 'POUPLIN', 'C09345058666F', 1, 'EUR', 'RETAIL', 'FRANCE', now(), now());

COMMIT;


INSERT INTO TESTDB.CUSTOMER_KYC.CUSTOMER_ACCOUNT ( CUSTOMER_IDENTIFIER,
                                               ACCOUNT_NUMBER,
                                               VALIDITY_DATE, CREATION_DATE)
VALUES ('C09345058FDFF','3444 5555 3333 2222', now(), now());

INSERT INTO TESTDB.CUSTOMER_KYC.CUSTOMER_ACCOUNT ( CUSTOMER_IDENTIFIER,
                                                   ACCOUNT_NUMBER,
                                                   VALIDITY_DATE, CREATION_DATE)
VALUES ('C09345058666F','3444 9900 4332 2222', now(), now());
COMMIT;
