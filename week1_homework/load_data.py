
#%%
import pandas as pd 
from sqlalchemy import create_engine
from time import time

engine = create_engine('postgresql://root:root@week1-pgdatabase-1:5432/ny_taxi')

#%%

df_location = pd.read_csv('taxi+_zone_lookup.csv')
df_green = pd.read_csv('green_tripdata_2019-01.csv', iterator=True, chunksize=200000)
df_location.to_sql('location_data', engine)
#%%

while True:
    t_start = time()
    try:
       df = next(df_green)
    except:
        print("ENDED OR ERROR") 
        break     
    df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
    df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
    df.to_sql(name='green_taxi_data', con=engine, if_exists='append')
    t_end = time()
    print('inserted another chunk, took %.3f second' % (t_end - t_start))
    
    
    
#%%


# %%
