salesTable = LOAD 'hdfs:///user/Saranee/sales.csv' USING PigStorage(',') AS
(Product:chararray,Price:chararray,Payment_Type:chararray,Name:chararray,City:chararray,State:chararray,Country:chararray);
GroupByCountry = GROUP salesTable BY Country;
CountByCountry = FOREACH GroupByCountry GENERATE CONCAT((chararray)$0, CONCAT(':', (chararray)COUNT($1)));
STORE CountByCountry INTO 'hdfs:///user/Saranee/salesOutput' USING PigStorage('\t');
