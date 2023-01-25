
SELECT COUNT(*) FROM (SELECT  * FROM green_taxi_data
WHERE  lpep_pickup_datetime::DATE = '2019-01-15' AND lpep_pickup_datetime::DATE  = lpep_dropoff_datetime::DATE)
AS countDATA


SELECT  COUNT(*) FROM green_taxi_data
WHERE passenger_count = 3 AND lpep_pickup_datetime::DATE = '2019-01-01'

SELECT  COUNT(*) FROM green_taxi_data
WHERE passenger_count = 2 AND lpep_pickup_datetime::DATE = '2019-01-01'
        
        

SELECT "LocationID", "DOLocationID" ,"PULocationID", "Zone", "tip_amount" FROM green_taxi_data
INNER JOIN location_data ON green_taxi_data."PULocationID" = location_data."LocationID"
WHERE "Zone" = 'Astoria' ORDER BY tip_amount DESC

SELECT * FROM location_data
WHERE "LocationID" = 146




SELECT lpep_pickup_datetime::DATE  , "trip_distance" FROM green_taxi_data
ORDER BY "trip_distance"  DESC LIMIT 1