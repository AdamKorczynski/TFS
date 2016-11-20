USE [Metrics]
GO

DROP TABLE [dbo].[ColumnHistory]
GO 

CREATE TABLE [dbo].[ColumnHistory](
	[PK] [int] IDENTITY(1,1) NOT NULL,
	[System_ID] [int] NOT NULL,
	[ColumnCurrent] [nvarchar](50) NOT NULL,
	[PreviousColumn] [nvarchar](50) NOT NULL,
	[ChangedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ColumnHistory] PRIMARY KEY CLUSTERED 
(
	[PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into ColumnHistory (System_Id, ColumnCurrent, PreviousColumn, ChangedDate) 
values 
-- from done to dev
(112233, 'Sprint Backlog', 'New', DATETIMEFROMPARTS(2016, 3, 13, 10, 0, 0, 0)),
(112233, 'In Dev', 'Sprint Backlog', DATETIMEFROMPARTS(2016, 3, 14, 10, 0, 0, 0)),
(112233, 'Ready for QA', 'In Dev', DATETIMEFROMPARTS(2016, 3, 15, 10, 0, 0, 0)),
(112233, 'QA', 'Ready for QA', DATETIMEFROMPARTS(2016, 3, 16, 10, 0, 0, 0)),
(112233, 'Done', 'QA', DATETIMEFROMPARTS(2016, 3, 17, 10, 0, 0, 0)),
(112233, 'In Dev', 'Done', DATETIMEFROMPARTS(2016, 3, 18, 10, 0, 0, 0)),
(112233, 'Ready for QA', 'In Dev', DATETIMEFROMPARTS(2016, 3, 19, 10, 0, 0, 0)),
(112233, 'QA', 'Ready for QA', DATETIMEFROMPARTS(2016, 3, 20, 10, 0, 0, 0)),
(112233, 'Done', 'QA', DATETIMEFROMPARTS(2016, 3, 21, 10, 0, 0, 0)),
-- normal flow
(445566, 'Sprint Backlog', 'New', DATETIMEFROMPARTS(2016, 2, 13, 11, 0, 0, 0)),
(445566, 'In Dev', 'Sprint Backlog', DATETIMEFROMPARTS(2016, 2, 14, 11, 0, 0, 0)),
(445566, 'Ready for QA', 'In Dev', DATETIMEFROMPARTS(2016, 2, 15, 11, 0, 0, 0)),
(445566, 'QA', 'Ready for QA', DATETIMEFROMPARTS(2016, 2, 16, 11, 0, 0, 0)),
(445566, 'Done', 'QA', DATETIMEFROMPARTS(2016, 2, 17, 11, 0, 0, 0)),
-- done to backlog
(778899, 'Sprint Backlog', 'New', DATETIMEFROMPARTS(2016, 1, 13, 12, 0, 0, 0)),
(778899, 'In Dev', 'Sprint Backlog', DATETIMEFROMPARTS(2016, 1, 14, 12, 0, 0, 0)),
(778899, 'Ready for QA', 'In Dev', DATETIMEFROMPARTS(2016, 1, 15, 12, 0, 0, 0)),
(778899, 'QA', 'Ready for QA', DATETIMEFROMPARTS(2016, 1, 16, 12, 0, 0, 0)),
(778899, 'Done', 'QA', DATETIMEFROMPARTS(2016, 1, 17, 12, 0, 0, 0)),
(778899, 'Sprint Backlog', 'Done', DATETIMEFROMPARTS(2016, 1, 18, 12, 0, 0, 0)),
(778899, 'In Dev', 'Sprint Backlog', DATETIMEFROMPARTS(2016, 1, 19, 12, 0, 0, 0)),
(778899, 'QA', 'In Dev', DATETIMEFROMPARTS(2016, 1, 20, 12, 0, 0, 0)),
(778899, 'Done', 'QA', DATETIMEFROMPARTS(2016, 1, 21, 12, 0, 0, 0))
