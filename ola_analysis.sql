-- 1. Retrieve all successful bookings:
CREATE DATABASE ola;
USE OLA;

-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_bookings AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Booking_Status = 'Success';

-- 1. Retrieve all successful bookings:
SELECT 
    *
FROM
    successful_bookings;


-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle_type AS
    SELECT 
        vehicle_type, AVG(Ride_distance) AS avg_distance
    FROM
        bookings
    GROUP BY vehicle_type;
    
-- 2. Find the average ride distance for each vehicle type:
SELECT 
    *
FROM
    ride_distance_for_each_vehicle_type;
    

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW total_number_of_cancelled_rides_by_customers AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        booking_Status = 'Canceled by Customer';

-- 3. Get the total number of cancelled rides by customers:
SELECT 
    *
FROM
    total_number_of_cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers_who_booked_the_highest_number_of_rides as
SELECT 
    customer_id, COUNT(booking_id) AS total_rides
FROM
    bookings
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT 
    *
FROM
    top_5_customers_who_booked_the_highest_number_of_rides;
    

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers_due_to_p_c_issues
as
select 
count(*) from bookings
where Canceled_Rides_by_Driver="Personal & Car related issue";

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from
rides_cancelled_by_drivers_due_to_p_c_issues;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW MAX_MIN_DRIVER_RATING AS
select
max(Driver_Ratings) AS Max_rating,
min(Driver_Ratings) as Min_Rating
from bookings
where
Vehicle_Type="Prime sedan";

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * FROM 
MAX_MIN_DRIVER_RATING;


-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_PAYMENT AS
SELECT	* FROM
bookings
WHERE Payment_Method="UPI";

-- 7. Retrieve all rides where payment was made using UPI:
SELECT * FROM
UPI_PAYMENT;


-- 8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_CUS_RATING AS
SELECT 
VEHICLE_TYPE,AVG(CUSTOMER_RATING) AS AVG_CUSTOMER_RATING
FROM BOOKINGS
GROUP BY VEHICLE_TYPE;

-- 8. Find the average customer rating per vehicle type:
SELECT * FROM
AVG_CUS_RATING;


-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW SUCCESSFUL_BOOKING_RIDE AS
SELECT
SUM(BOOKING_VALUE) AS BOOKING_VALUE
FROM bookings
WHERE
Booking_Status="Success";

-- 9. Calculate the total booking value of rides completed successfully:
select * from
SUCCESSFUL_BOOKING_RIDE;


-- 10. List all incomplete rides along with the reason:
CREATE VIEW INCOMPLETE_RIDES_REASON AS
SELECT 
BOOKING_ID,INCOMPLETE_RIDES_REASON
FROM bookings
where
Incomplete_Rides="Yes";

-- 10. List all incomplete rides along with the reason:
SELECT * FROM
INCOMPLETE_RIDES_REASON;


