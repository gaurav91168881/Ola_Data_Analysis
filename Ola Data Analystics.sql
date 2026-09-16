Create Database Ola;

Use Ola;

-- 1. Retrieve all successful bookings:
Create VIEW successful_bookings AS
Select * from bookings
where booking_status = 'Success';

Select * from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
Create VIEW ride_distance_for_each_vehicle as
Select Vehicle_type, Round(AVG(Ride_distance), 2) as Avg_distance
from bookings
Group by Vehicle_type;

Select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
Create VIEW cancled_rides_by_customers AS
Select COUNT(*) from bookings
where booking_status = 'Canceled by customer';

Select * from cancled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
Create VIEW Top_5_Customers as
Select Customer_ID, Count(Booking_ID) as Total_Rides
from bookings
Group by Customer_ID
Order by Total_rides DESC
Limit 5;

Select * from Top_5_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_canceled_by_Drivers_P_C_Issues as
Select Count(*) from bookings 
where Canceled_rides_by_driver = 'Personal & Car related issue';

Select * from Rides_canceled_by_Drivers_P_C_Issues;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create VIEW Max_Min_Driver_Rating as
Select MAX(Driver_ratings) as Max_Rating,
MIN(Driver_Ratings) as Min_Rating
from bookings where Vehicle_Type = 'Prime Sedan';

Select * from Max_Min_Driver_Rating;

-- 7. Retrieve all rides where payment was made using UPI:
Create VIEW UPI_Payment as
Select * from bookings
where payment_method = 'UPI';

Select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
Select Vehicle_type, AVG(Customer_Rating) as Avg_Customer_Rating
from bookings 
group by Vehicle_type;

Select * from AVG_Cust_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
Create View Total_Successful_Ride_Value as
Select SUM(booking_value) as Total_Successful_Ride_Value
from bookings
where Booking_Status = 'success';

Select * from Total_Successful_ride_value;

-- 10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason as
Select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

Select * from Incomplete_Rides_Reason;
