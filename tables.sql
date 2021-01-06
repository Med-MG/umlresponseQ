-- Warning: You can generate script only for one table/view at a time in your Free plan 
-- 
-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Evaluation]

CREATE TABLE [Evaluation]
(
 [Eval_Id]                int IDENTITY (1, 1) NOT NULL ,
 [Evaluation_Description] text NOT NULL ,
 [Evaluation_Title]       varchar(255) NOT NULL ,
 [Score]                  integer NOT NULL ,
 [Response_Id]            int NOT NULL ,


 CONSTRAINT [PK_evaluation] PRIMARY KEY CLUSTERED ([Eval_Id] ASC),
 CONSTRAINT [FK_70] FOREIGN KEY ([Response_Id])  REFERENCES [Response]([Response_Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_71] ON [Evaluation] 
 (
  [Response_Id] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [payments]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='payments')
CREATE TABLE [payments]
(
 [payment_id]    int NOT NULL ,
 [PaymentAmount] float NOT NULL ,
 [paymentMethod] varchar(50) NOT NULL ,
 [timestamps]    datetime NOT NULL ,
 [Res_Id]        int NOT NULL ,


 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED ([payment_id] ASC),
 CONSTRAINT [FK_84] FOREIGN KEY ([Res_Id])  REFERENCES [Responders]([Res_Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_85] ON [payments] 
 (
  [Res_Id] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Questions]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Questions')
CREATE TABLE [Questions]
(
 [Q_Id]         int IDENTITY (1, 1) NOT NULL ,
 [Introduction] varchar(255) NOT NULL ,
 [Description]  varchar(255) NOT NULL ,
 [User_Id]      int NOT NULL ,


 CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED ([Q_Id] ASC),
 CONSTRAINT [FK_32] FOREIGN KEY ([User_Id])  REFERENCES [Users]([User_Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_33] ON [Questions] 
 (
  [User_Id] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Responders]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Responders')
CREATE TABLE [Responders]
(
 [Res_Id]     int IDENTITY (1, 1) NOT NULL ,
 [First_Name] varchar(255) NOT NULL ,
 [Last_Name]  varchar(255) NOT NULL ,


 CONSTRAINT [PK_responders] PRIMARY KEY CLUSTERED ([Res_Id] ASC)
);
GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [RespondersTopics]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='RespondersTopics')
CREATE TABLE [RespondersTopics]
(
 [Score]    varchar(255) NOT NULL ,
 [Res_Id]   int NOT NULL ,
 [Topic_Id] int NOT NULL ,


 CONSTRAINT [FK_41] FOREIGN KEY ([Res_Id])  REFERENCES [Responders]([Res_Id]),
 CONSTRAINT [FK_44] FOREIGN KEY ([Topic_Id])  REFERENCES [Topics]([Topic_Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_42] ON [RespondersTopics] 
 (
  [Res_Id] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_45] ON [RespondersTopics] 
 (
  [Topic_Id] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Response]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Response')
CREATE TABLE [Response]
(
 [Response_Id]          int IDENTITY (1, 1) NOT NULL ,
 [Response_title]       varchar(50) NOT NULL ,
 [Response_Description] varchar(225) NOT NULL ,
 [Res_Id]               int NOT NULL ,
 [Q_Id]                 int NOT NULL ,


 CONSTRAINT [PK_response] PRIMARY KEY CLUSTERED ([Response_Id] ASC),
 CONSTRAINT [FK_64] FOREIGN KEY ([Res_Id])  REFERENCES [Responders]([Res_Id]),
 CONSTRAINT [FK_67] FOREIGN KEY ([Q_Id])  REFERENCES [Questions]([Q_Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_65] ON [Response] 
 (
  [Res_Id] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_68] ON [Response] 
 (
  [Q_Id] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Satisfaction]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Satisfaction')
CREATE TABLE [Satisfaction]
(
 [Sat_Id]             int IDENTITY (1, 1) NOT NULL ,
 [Satisfaction_Level] integer NOT NULL ,
 [Response_Id]        int NOT NULL ,


 CONSTRAINT [PK_satisfaction] PRIMARY KEY CLUSTERED ([Sat_Id] ASC),
 CONSTRAINT [FK_77] FOREIGN KEY ([Response_Id])  REFERENCES [Response]([Response_Id])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_78] ON [Satisfaction] 
 (
  [Response_Id] ASC
 )

GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Topics]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Topics')
CREATE TABLE [Topics]
(
 [Topic_Id]   int IDENTITY (1, 1) NOT NULL ,
 [Topic_Name] varchar(235) NOT NULL ,


 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED ([Topic_Id] ASC)
);
GO

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

-- ************************************** [Users]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Users')
CREATE TABLE [Users]
(
 [User_Id]    int IDENTITY (1, 1) NOT NULL ,
 [First_Name] varchar(235) NOT NULL ,
 [Last_Name]  varchar(255) NOT NULL ,


 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([User_Id] ASC)
);
GO





