# MSIB Dibimbing Day 9
## Assigment Cases
1. Normalize this table from 1NF to 3NF<br>
   `Student_Grade_Report (StudentNo, StudentName, Major, CourseNo, CourseName, InstructorNo, InstructorName, InstructorLocation, Grade)` <br>
   (_HINT: in 3NF, there will be 4 tables_)
2. Create `ERD` based on the table you normalized
3. Create table `students` for `school` database, consist these columns:<br>
   `id (integer, PK, auto increment)`<br>
   `first_name (varchar, not null)`<br>
   `last_name (varchar, default null)`<br>
   `email (varchar, unique, not null)`<br>
   `age (integer, default value 18)`<br>
   `gender (varchar, check constraint to allow only 'male' or 'female')`<br>
   `date_of_birth (date, not null)`<br>
   `created_at (timestamp with time zone, default value now)`
4. Use `movie` dataset and create stored procedure or funciton for counting movie based on genre. Use genre as parameter, and return the count of movie
5. Use `movie` dataset, write one optimized query (using the tips for revamp query). <br> You are free to create any query.
6. Use the `ninja `dataset, write a query that return `nama` and `desa`, use `email` as a filter.
   Create a proper index to satisfy the query, provide the explain result before and after index creation. (do `set enable_seqscan = off` first)
7. Find the most favorite (highest rating) for each genre (use `rank ()` window function)
   	
