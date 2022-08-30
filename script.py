# 'dataset' holds the input data for this script
import pandas as pd
import re

#use the date table
dataset.loc[:, 'date_yy_mmm'] = dataset.loc[:, 'date_yy_mmm'].apply(lambda x: re.sub("\r","", x)) #we can also remove this from sql database