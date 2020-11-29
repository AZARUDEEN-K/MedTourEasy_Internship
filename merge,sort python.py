import pandas as pd 
import matplotlib
import seaborn as sns
import matplotlib.pyplot as plt
temp = pd.read_csv(r'tempYearly.csv')
rain = pd.read_csv(r'rainYearly.csv')
print(temp)
print(rain)

temp_f = temp.query('Temperature < 40 & Temperature > 0')
print(temp_f)
rain_f = rain.query('Rainfall < 6 & Rainfall > 0')
#temp_f.plot.scatter(x='Year',y='Temperature',label='Temperature and Year')
#plt.show()
#rain_f.plot.scttter(x='Year',y='Rainfall',label='Rainfall and Year')
#plt.show()
df_merge = pd.merge(temp_f,rain_f,on='Year',how = 'inner')
print(df_merge.sort_values(by = 'Rainfall',ascending = False))
print(df_merge.sort_values(by = 'Temperature',ascending = False))

sns.set(rc={'figure.figsize':(12,6)})
sns.jointplot('Rainfall', 'Temperature', data=df_merge,kind='reg')
plt.show()