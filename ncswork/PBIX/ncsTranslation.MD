[Here](https://app.powerbi.com/groups/b7a80268-ddf8-41c0-8ae4-344ccb981840/reports/40a7f44c-41c0-463e-b76e-7d8d616d11d8/ReportSection)

DAX is as follow:
DeliveryQuarter = RELATED('Date'[Calendar Year Quarter])

Product Sales Amount = SUMX(RELATEDTABLE(Sales), Sales[Quantity] * Sales[Net Price])

Number of Sales = CALCULATE(COUNT(Sales[ProductKey]))

Large Quantity Orders = COUNTROWS(CALCULATETABLE(Sales, Sales[Quantity] >= 3))

Large Quanitiy Order Table = CALCULATETABLE(Sales, Sales[Quantity] >= 3)
