rem this is what it looks like to IMPORT a CSV file to a VM or keyboard local instance 
bcp OilTankers.dbo.Calls_spiked out c:\Divergence\Oil\Calls_initial.csv -c -T -S. -t, -q
bcp OilTankers.dbo.Ships_spiked out c:\Divergence\Oil\Ships_initial.csv -c -T -S. -t, -q
bcp OilTankers.dbo.Details_spiked out c:\Divergence\Oil\Details_initial.csv -c -T -S. -t, -q
bcp OilTankers.dbo.Calls_Incremental out c:\Divergence\Oil\Calls_Incremental.csv -c -T -S. -t, -q
bcp OilTankers.dbo.Ships_Incremental out c:\Divergence\Oil\Ships_Incremental.csv -c -T -S. -t, -q
bcp OilTankers.dbo.Details_Incremental out c:\Divergence\Oil\Details_Incremental.csv -c -T -S. -t, -q