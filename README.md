# Dataset

The original dataset, under the _kaggle_ folder, was downloaded from https://www.kaggle.com/datasets/rikdifos/credit-card-approval-prediction/data

# Wrangling Process

The _wrangled/rating.csv_ file is generated/cleaned via SQL (SQLite v3.37.0).


You can inspect the SQL query in [the SQL file here](./credit_rating.sql).


The full processed can be executed as such:

```console
$ sqlite3 -csv -header -cmd ".import $(pwd)/kaggle/credit_record.csv credit_records" < $(pwd)/credit_rating.sql > wrangled/credit_rating.csv
```

