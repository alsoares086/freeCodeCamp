import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# Import data
df = pd.read_csv('medical_examination.csv')

# Add 'overweight' column

def calculate_bmi(height, weight):
  height_m = height / 100 

  bmi = weight / pow(height_m, 2)

  return 1 if bmi >= 25 else 0 
  
df['overweight'] = df.apply(lambda row: calculate_bmi(row['height'], row['weight']), axis=1)

# Normalize data by making 0 always good and 1 always bad. If the value of 'cholesterol' or 'gluc' is 1, make the value 0. If the value is more than 1, make the value 1.

def normalize(value):
  if value == 1:
      return 0
  elif value > 1:
      return 1

df['cholesterol'] = df['cholesterol'].apply(normalize)
df['gluc'] = df['gluc'].apply(normalize)


# Draw Categorical Plot
def draw_cat_plot():
    # Create DataFrame for cat plot using `pd.melt` using just the values from 'cholesterol', 'gluc', 'smoke', 'alco', 'active', and 'overweight'.
  
  columns = [
    'active',
    'alco',
    'cholesterol',
    'gluc',
    'overweight',
    'smoke'
  ]
  df_cat = pd.melt(df, id_vars=["cardio"], value_vars=columns)


    # Group and reformat the data to split it by 'cardio'. Show the counts of each feature. You will have to rename one of the columns for the catplot to work correctly.
  df_cat = df_cat.reset_index() \
    .groupby(['variable', 'cardio', 'value']) \
    .agg('count') \
    .rename(columns={'index': 'total'}) \
    .reset_index()
    

    # Draw the catplot with 'sns.catplot()'
  cat = sns.catplot(
    x="variable",
    y="total",
    col="cardio",
    hue="value",
    data=df_cat,
    kind="bar").fig

    # Get the figure for the output
  cat.savefig('catplot.png')
  return cat

# Draw Heat Map
def draw_heat_map():
    # Clean the data
  df_heat = df[
  (df['ap_lo'] <= df['ap_hi'])
  & (df['height'] >= df['height'].quantile(0.025))
  & (df['height'] <= df['height'].quantile(0.975))
  & (df['weight'] >= df['weight'].quantile(0.025))
  & (df['weight'] <= df['weight'].quantile(0.975))
  ]

    # Calculate the correlation matrix
  corr = df_heat.corr()

    # Generate a mask for the upper triangle
  mask = np.triu(corr)



    # Set up the matplotlib figure
  fig= plt.figure(figsize=(10,6))

    # Draw the heatmap with 'sns.heatmap()'
  sns.heatmap(corr, mask=mask,
                  annot=True, fmt='.1f',
                  center=0, vmin=-0.5, vmax=0.5)

    # Do not modify the next two lines
  fig.savefig('heatmap.png')
  return fig
