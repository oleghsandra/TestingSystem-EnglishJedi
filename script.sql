USE [EnglishJedi]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 16.10.2016 21:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Answer] [nvarchar](80) NOT NULL,
	[IsRight] [bit] NOT NULL,
 CONSTRAINT [pk_Answer_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserLogin] [nvarchar](30) NOT NULL,
	[UserPassword] [nvarchar](32) NOT NULL,
 CONSTRAINT [pk_AppUser_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [User_Login] UNIQUE NONCLUSTERED 
(
	[UserLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mark]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[Value] [int] NULL,
 CONSTRAINT [pk_Mark_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MarkAnswer]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarkAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MarkId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [pk_MarkAnswer_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestId] [int] NOT NULL,
	[Question] [nvarchar](120) NOT NULL,
	[ThemeId] [int] NOT NULL,
 CONSTRAINT [pk_Question_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionTheme]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionTheme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Theme] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_QuestionTheme_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Test]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[TestDescription] [nvarchar](100) NOT NULL,
	[Duration] [time](7) NOT NULL,
	[LevelId] [int] NOT NULL,
	[PassValue] [int] NULL,
 CONSTRAINT [pk_Test_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestLevel]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TestLevel] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_TestLevel_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [fk_Answer_QuestionId_Question_Id] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([Id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [fk_Answer_QuestionId_Question_Id]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [fk_Mark_TestId_Test_Id] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [fk_Mark_TestId_Test_Id]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [fk_Mark_UserId_AppUser_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[AppUser] ([Id])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [fk_Mark_UserId_AppUser_Id]
GO
ALTER TABLE [dbo].[MarkAnswer]  WITH CHECK ADD  CONSTRAINT [fk_MarkAnswer_AnswerId_Answer_Id] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([Id])
GO
ALTER TABLE [dbo].[MarkAnswer] CHECK CONSTRAINT [fk_MarkAnswer_AnswerId_Answer_Id]
GO
ALTER TABLE [dbo].[MarkAnswer]  WITH CHECK ADD  CONSTRAINT [fk_MarkAnswer_MarkId_Mark_Id] FOREIGN KEY([MarkId])
REFERENCES [dbo].[Mark] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MarkAnswer] CHECK CONSTRAINT [fk_MarkAnswer_MarkId_Mark_Id]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [fk_Question_TestId_Test_Id] FOREIGN KEY([TestId])
REFERENCES [dbo].[Test] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [fk_Question_TestId_Test_Id]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [fk_Question_ThemeId_QuestionTheme_Id] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[QuestionTheme] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [fk_Question_ThemeId_QuestionTheme_Id]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [fk_Test_ThemeId_TestLevel_Id] FOREIGN KEY([LevelId])
REFERENCES [dbo].[TestLevel] ([Id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [fk_Test_ThemeId_TestLevel_Id]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllMarkAnswers]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersScores]    Script Date: 14.10.2016 20:53:44 ******/
CREATE PROC [dbo].[spGetAllMarkAnswers]  
AS
BEGIN  
   select MarkId, AnswerId from MarkAnswer	
END;

GO
/****** Object:  StoredProcedure [dbo].[spGetAllMarksForUser]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAllMarksForUser]  
  @Login VARCHAR(30)
AS
BEGIN  
SELECT  Mark.Id as 'MarkId', UserId, TestId, Value
	FROM Mark INNER JOIN AppUser 
	     ON Mark.UserId = AppUser.Id
		 WHERE AppUser.UserLogin = @Login	
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTests]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersScores]    Script Date: 14.10.2016 20:53:44 ******/
CREATE PROC [dbo].[spGetAllTests]  
AS
BEGIN  
   select  Test.Id , Test.Name, Test.TestDescription, Test.Duration, Test.LevelId,PassValue, TestLevel  
		from Test INNER JOIN TestLevel 
		ON Test.LevelId = TestLevel.Id 			
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersAnswers]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAllUsersAnswers]  
AS
BEGIN  
   SELECT Id,QuestionId,Answer, IsRight FROM Answer
END;

GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersLogins]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAllUsersLogins]  
AS
BEGIN  
   SELECT UserLogin FROM AppUser
END;

GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersMarks]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersScores]    Script Date: 14.10.2016 20:53:44 ******/
CREATE PROC [dbo].[spGetAllUsersMarks]  
AS
BEGIN  
   SELECT UserLogin, Mark.Value ,Mark.Id,TestId
		FROM AppUser RIGHT JOIN Mark
		ON AppUser.Id = Mark.UserId		
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersQuestions]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetAllUsersScores]    Script Date: 14.10.2016 20:53:44 ******/
CREATE PROC [dbo].[spGetAllUsersQuestions]  
AS
BEGIN  
   select Question.Id, Question,TestId,ThemeId, Theme 
   from Question INNER JOIN QuestionTheme
	     ON ThemeId = QuestionTheme.Id
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetAnswersToQuestion]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetAllFullTests]    Script Date: 14.10.2016 21:42:57 ******/
CREATE PROCEDURE [dbo].[spGetAnswersToQuestion]

AS
BEGIN
SET NOCOUNT ON;	
		 SELECT Answer.Id as 'AnswerId',  QuestionId as 'AnswerQuestionId', Question.Question as 'AnswerQuestion',Answer, IsRight
	     FROM Answer INNER JOIN Question 
	     ON Answer.QuestionId  = Question.Id
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetMarksForCurrentUser]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[spGetAllFullTests]    Script Date: 14.10.2016 21:42:57 ******/
CREATE PROCEDURE [dbo].[spGetMarksForCurrentUser]
	@Login VARCHAR(30)
AS
BEGIN
SET NOCOUNT ON;	
		  select MarkId, AnswerId from Mark
		 INNER JOIN MarkAnswer ON
		 MarkId = Mark.Id
		INNER JOIN AppUser ON
          UserId = AppUser.Id
		  where AppUser.UserLogin = @Login
END;
GO
/****** Object:  StoredProcedure [dbo].[spGetUserByLogin]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetUserByLogin]
	@Login VARCHAR(30),
	@Password VARCHAR(32)

AS
BEGIN
   SELECT 
		Id, 
		FirstName, 
		LastName, 
		[UserLogin]
		--[Password], 
	FROM dbo.AppUser
	WHERE [UserLogin] = @Login and [UserPassword] =@Password;
END;
-----
GO
/****** Object:  StoredProcedure [dbo].[spSetMarkAnswer]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spSetMarkAnswer]
  @MarkId INT,
  @AnswerId INT
AS
BEGIN  
		INSERT INTO MarkAnswer(MarkId,AnswerId)
		VALUES (@MarkId,@AnswerId)
END;

GO
/****** Object:  StoredProcedure [dbo].[spSetMarks]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spSetMarks] 
@UserId INT, 
@TestId INT, 
@Value INT 

AS 
BEGIN 
declare @MyTableVar table(Id int); 

INSERT INTO Mark(UserId,TestId,Value) 
OUTPUT INSERTED.Id 
INTO @MyTableVar 
VALUES (@UserId,@TestId,@Value) 

SELECT Id FROM @MyTableVar 
END;

GO
/****** Object:  StoredProcedure [dbo].[spSetNewUser]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spSetNewUser]
  @Login nvarchar(30),
  @Password nvarchar(32),
  @FirstName nvarchar(50),
  @LastName nvarchar(50)
AS
BEGIN  
		INSERT INTO AppUser(FirstName,LastName,UserLogin,UserPassword)
		VALUES (@FirstName,@LastName,@Login,@Password)				
END;

GO
/****** Object:  StoredProcedure [dbo].[uspAdd4AnswerVariants]    Script Date: 16.10.2016 21:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspAdd4AnswerVariants]    
    @pQuestionId INT,

    @pAnswer  NVARCHAR(80), 
	@pIsRight BIT,

    @pAnswer2  NVARCHAR(80), 
	@pIsRight2 BIT,
	
    @pAnswer3  NVARCHAR(80), 
	@pIsRight3 BIT,

    @pAnswer4  NVARCHAR(80), 
	@pIsRight4 BIT,

    @responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        INSERT INTO dbo.[Answer] (  QuestionId , Answer , IsRight )
        VALUES
		( @pQuestionId,  @pAnswer, @pIsRight ),
		( @pQuestionId,  @pAnswer2, @pIsRight2 ),
		( @pQuestionId,  @pAnswer3, @pIsRight3 ),
		( @pQuestionId,  @pAnswer4, @pIsRight4 )

        SET @responseMessage='Success'
    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH
END
GO
