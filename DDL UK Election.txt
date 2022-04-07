Creating a table called ge in SQL Server -

CREATE TABLE ge(
  ons_id VARCHAR(10),
  ons_region_id VARCHAR(10),
  constituency_name VARCHAR(50),
  county_name VARCHAR(50),
  region_name VARCHAR(50),
  country_name VARCHAR(50),
  constituency_type VARCHAR(10),
  party_name VARCHAR(50),
  party_abbreviation VARCHAR(50),
  firstname VARCHAR(50),
  surname VARCHAR(50),
  gender VARCHAR(6),
  sitting_mp VARCHAR(3),
  former_mp VARCHAR(3),
  votes INT,
  share FLOAT,
  change VARCHAR(20),
  PRIMARY KEY(ons_id,firstname,surname)
)

Impoting a csv file into a mysql table -  
BULK INSERT ge FROM 'C:\db\ge2017.csv' WITH (FIELDTERMINATOR=',', ROWTERMINATOR='\n', FIRSTROW=2)
GO

But you get an error like below - 
Msg 4863, Level 16, State 1, Server ME1C039-130368\SQLEXPRESS, Line 3
Bulk load data conversion error (truncation) for row 105, column 13 (sitting_mp).
Msg 4863, Level 16, State 1, Server ME1C039-130368\SQLEXPRESS, Line 3
Bulk load data conversion error (truncation) for row 106, column 12 (gender).
Msg 4863, Level 16, State 1, Server ME1C039-130368\SQLEXPRESS, Line 3
Bulk load data conversion error (truncation) for row 107, column 13 (sitting_mp).
...

Unfortunately BULK INSERT cannot deal with the CSV format so we need to pre-process the file. Some solutions:

Use Excel - you can load CSV and save as TXT
Use regular expressions in powershell: convert CSV to TXT
Use python
Find a converter online

With the conversion complete you can import the data - you will have too use the full path name and you may have permissions problems

BULK INSERT ge FROM 'c:\path\ge2017.txt' WITH (FIRSTROW=2)

SELECT COUNT(*) FROM ge

select count(1) from ge where gender='female';

Who won the election?
The important question is which party got the most seats. Which party leader should the queen invite to form a government? We can use the RANK function for this but we prefer to use a slower, simpler solution:

SELECT party_name,COUNT(1) TotSeat
  FROM (
    SELECT ge.ons_id, ge.party_name
      FROM ge JOIN
          (SELECT ons_id,MAX(votes) AS mv
             FROM ge
           GROUP BY ons_id) AS ms ON ge.ons_id=ms.ons_id AND ge.votes=ms.mv
       ) AS mp
GROUP BY party_name


Using Mysql

LOAD DATA INFILE '/tmp/hocl-ge2015-results-full.csv' INTO TABLE ge COLUMNS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


