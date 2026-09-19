# Student Retention Insights Dashboard

Status: *work in progress*

This project explores the Open University Learning Analytics Dataset (OULAD) to surface patterns and insights relevant to student retention.
The question it aims to answer: is early student engagement (or other factors) a useful sign for predicting students at risk of failing or withdrawing from a course?

## Data
The Open University Learning Analytics Dataset (OULAD) is based on UK Open University data (2013-2014) covering student engagement, assessment results, demographics, socioeconomic indicators. 
download OULAD from kaggle: https://www.kaggle.com/datasets/anlgrbz/student-demographics-online-education-dataoulad?resource=download
Once downloaded, extract the files so the CSVs sit in a desired location

## Setup
1. Create and activate a Python virtual environment.
2. Install dependencies: `pip install duckdb pandas`
3. Open `scripts/load_data.py` and set the CSV file paths to match where your data(OULAD csv files) lives.
4. Run the script to load all OULAD tables into a local DuckDB database.

## Project structure

`scripts/` - scripts to load the OULAD data into DuckDB
`sql/` - SQL queries against the loaded data
`notes/` - project notes and decisions (might not include to the finished project)

progress(09/18/26): The data loads and the analysis table for tableau has been built. 




