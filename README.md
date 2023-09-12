# Mongo-2-postgres: Mongo to Postgres Migration

![Supabase](https://raw.githubusercontent.com/supabase/supabase/master/packages/common/assets/images/supabase-logo-wordmark--light.svg)

## Introduction

This project provides a Python notebook for migrating data from MongoDB to PostgreSQL. It is a useful tool for transferring data between different database systems. 
However, please note that this tool has some limitations and is not considered production-ready. We encourage contributions from the community to improve and enhance its functionality.

## Getting Started

To get started with the migration, follow these steps:

1. Open the Python notebook: [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/mansueli/mongo-2-postgres/blob/main/mongodump2postgres.ipynb)

2. Set up the connection URIs for your source MongoDB and target PostgreSQL databases.

   ```python
   %env supabase_uri=postgresql://postgres:<password>@db.<your_ref>.supabase.co:5432/postgres
   %env mongo_uri=mongodb+srv://<your_user>:<your_ref>@cluster012.mongodb.net/?retryWrites=true&w=majority
   ```

3. Run the part that innstalls the necessary Python packages and PostgreSQL:

   ```python
   !pip install mongo &>log
   !pip install psycopg2 &>log
   # ... (other installation commands)
   ```

4. Create a backup of your MongoDB data using `mongodump`.

   ```python
   !mongodump --uri "$mongo_uri" -o ./mongo-backup &>log
   ```

5. Run the migration script provided in the notebook to transfer the data to PostgreSQL.

> **Warning** 
> - This migration script may over-cast most columns to `TEXT` in PostgreSQL, which may not be suitable for all use cases. You should review and adjust data types as needed.
> - This script is intended for experimental and educational purposes. It is not recommended for production use without thorough testing and customization.

## Contributions

We welcome contributions from the community to improve this migration tool. Feel free to open issues, submit pull requests, or provide feedback to help make it more robust and versatile.
