SELECT
    min(ActualElapsedTime), avg(ActualElapsedTime), max(ActualElapsedTime),
    min(DepDelay), avg(DepDelay), max(DepDelay),
    min(ArrDelay), avg(ArrDelay), max(ArrDelay)
FROM ontime WHERE Cancelled=0
GROUP BY Year, Origin, Dest;


