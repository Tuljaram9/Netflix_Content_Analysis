# Netflix Content Analysis

## Project Overview
This project explores Netflix Movies and TV Shows using Python, Pandas, NumPy, Matplotlib, and Seaborn. The goal is to identify patterns in content types, genres, countries, ratings, release years, and movie durations.

## Objectives
- Clean and prepare the dataset for analysis.
- Analyze the distribution of Movies and TV Shows.
- Explore content release trends.
- Identify the most common genres and countries.
- Examine content ratings and movie duration distributions.
- Present findings through visualizations.

## Tools and Technologies
- Python
- Pandas and NumPy
- Matplotlib and Seaborn
- Jupyter Notebook

## Dataset
Netflix Movies and TV Shows dataset from Kaggle.

Dataset source: https://www.kaggle.com/datasets/shivamb/netflix-shows

## Key Findings
- The analyzed dataset contains 8,804 records and 12 columns.
- Movies account for approximately 69.6% of records, while TV Shows account for 30.4%.
- International Movies and Dramas are the most frequent listed categories.
- The United States has the highest number of country listings, followed by India.
- TV-MA is the most frequent content rating.
- Movie runtimes were explored using a histogram.

## Data Cleaning
- Handled missing values in director, cast, country, rating, and duration.
- Converted `date_added` to a datetime data type.
- Retained 10 missing `date_added` values rather than inventing dates.
- Checked for duplicate rows.

## Project Structure
- `data/` — dataset
- `notebooks/` — analysis notebook
- `visualizations/` — exported charts
- `requirements.txt` — Python dependencies

## How to Run
1. Clone or download the repository.
2. Install dependencies using `pip install -r requirements.txt`.
3. Open `notebooks/content_analysis.ipynb` in Jupyter Notebook.
4. Run the notebook cells in order.

## Conclusion
This project demonstrates practical skills in data cleaning, exploratory data analysis, and visualization using Python. It highlights patterns in the Netflix catalog across content types, genres, countries, ratings, and movie runtimes.
