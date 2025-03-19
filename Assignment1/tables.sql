CREATE TABLE Member (
    member_ID INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    contact_number VARCHAR(255) NOT NULL,
    PRIMARY KEY (member_ID)
);

CREATE TABLE ServiceArea (
    service_area_ID INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    parent_area_ID INT,
    PRIMARY KEY (service_area_ID),
    FOREIGN KEY (parent_area_ID) REFERENCES ServiceArea(service_area_ID)
);

CREATE TABLE ChargingStation (
    station_ID INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    location_ID INT NOT NULL,
    available_pbs INT NOT NULL,
    PRIMARY KEY (station_ID),
    FOREIGN KEY (location_ID) REFERENCES ServiceArea(service_area_ID)
);

CREATE TABLE PowerBank (
    pb_ID INT NOT NULL,
    station_ID INT,
    status INT NOT NULL,
    PRIMARY KEY (pb_ID),
    FOREIGN KEY (station_ID) REFERENCES ChargingStation(station_ID)
);

CREATE TABLE Coupon (
    coupon_ID INT NOT NULL,
    redemption INT NOT NULL,
    expiration_date DATETIME NOT NULL,
    discount_value DECIMAL NOT NULL,
    member_ID INT NOT NULL,
    PRIMARY KEY (coupon_ID),
    FOREIGN KEY (member_ID) REFERENCES Member(member_ID)
);

CREATE TABLE RentalTransaction (
    transaction_ID INT NOT NULL,
    member_ID INT NOT NULL,
    pb_ID INT NOT NULL,
    station_ID INT NOT NULL,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME,
    payment_amount DECIMAL,
    status INT NOT NULL,
    coupon_ID INT,
    PRIMARY KEY (transaction_ID),
    FOREIGN KEY (member_ID) REFERENCES Member(member_ID),
    FOREIGN KEY (pb_ID) REFERENCES PowerBank(pb_ID),
    FOREIGN KEY (station_ID) REFERENCES ChargingStation(station_ID),
    FOREIGN KEY (coupon_ID) REFERENCES Coupon(coupon_ID)
);

CREATE TABLE Reservation (
    reservation_ID INT NOT NULL,
    member_ID INT NOT NULL,
    station_ID INT NOT NULL,
    reservation_datetime DATETIME NOT NULL,
    collect_datetime DATETIME,
    status INT NOT NULL,
    PRIMARY KEY (reservation_ID),
    FOREIGN KEY (member_ID) REFERENCES Member(member_ID),
    FOREIGN KEY (station_ID) REFERENCES ChargingStation(station_ID)
);
