# DAX Assignment


Steps

1. Pick one or more PBIX you have in hand
- ~~DIAD sample~~
- ~~Murach College~~
- ***Personal/Pop-up Capstone***
- ~~Your work from team capstone~~

2. Add at least one of each of the following DAX constructs:
- DAX Calculated Column using RELATED
```
Amount of Shares = SUMX(RELATEDTABLE('CEO Holdings'), [Shares Amount])
```
- DAX Calculated Column using RELATEDTABLE
```
Calculated Column Related = RELATED(CEO[CEO] )
```
- DAX Measure using CALCULATE
- DAX Measure using CALCULATETABLE
- DAX Table

3. Ensure you have used all of these types of DAX constructs
- Time Intelligence functions (PARALLELPERIOD, SAMEPERIODLASTYEAR, etc.)
- Iterator functions (SUMX, AVERAGEX, etc.
- DIVIDE
- ISERROR
- FILTER

4. Publish your PBIX and add your URL in your pbix/Reports.MD page

5. Use the instructor\sql\Power BI PBIT Code Extraction\PBITJSON_to_M_DAX.sql script to extract your DAX