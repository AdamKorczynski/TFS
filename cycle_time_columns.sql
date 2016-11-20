use Metrics

IF OBJECT_ID('GetCycleTime', 'P') IS NOT NULL  
    DROP PROCEDURE GetCycleTime;
GO  

CREATE PROCEDURE GetCycleTime
	@StartColumn varchar(50),
	@EndColumn varchar(50)

AS
	WITH CycleTimeColumns_CTE (System_Id, ColumnCurrent, [min], [max])
	AS
	(
		select 
			System_Id, 
			ColumnCurrent,
			MIN(ChangedDate) as [min], 
			MAX(ChangedDate) as [max] 
		from ColumnHistory
		where ColumnCurrent in (@StartColumn, @EndColumn)
		group by System_Id, ColumnCurrent
	), aggregated_CTE (System_Id, ColumnCurrent, [min], [max], PreviousMin, PreviousMax)
	AS
	(
		Select *, 
		LAG([Min], 1, null) OVER (PARTITION BY System_Id ORDER BY [min]) as PreviousMin,
		LAG([Max], 1, null) OVER (PARTITION BY System_Id ORDER BY [max]) as PreviousMax
		from CycleTimeColumns_CTE
	)

	select
		CASE WHEN PreviousMin > [min] THEN [min] ELSE PreviousMin END as CycleTimeStart,
		CASE WHEN PreviousMax < [max] THEN [max] ELSE PreviousMax END as CycleTimeEnd,
		CAST(DATEDIFF(HOUR, 
			CASE WHEN PreviousMin > [min] THEN [min] ELSE PreviousMin END, 
			CASE WHEN PreviousMax < [max] THEN [max] ELSE PreviousMax END
		) AS DECIMAL) / 24 as CycleTime
	from aggregated_CTE
	where PreviousMin is not null and PreviousMax is not null
	order by System_Id, ColumnCurrent

RETURN (0)
GO

EXECUTE GetCycleTime 'Sprint Backlog', 'Done'