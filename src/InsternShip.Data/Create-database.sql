/*
########### XÓA DATABASE CŨ TẠO DATABASE MỚI (LƯỜI XÓA TỪNG CONSTRAINT) ##########
*/
USE master
GO

IF EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'RecruitmentWeb'
)
DROP DATABASE RecruitmentWeb
GO

-- Create a new database called 'RecruitmentWeb'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'RecruitmentWeb'
)
CREATE DATABASE RecruitmentWeb
GO

use RecruitmentWeb
go

/*
############# TẠO CÁC BẢNG ENTITY #############
*/

-- Create a new table called '[role]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[WebRole]', 'U') IS NOT NULL
DROP TABLE [dbo].[Role]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[WebRole]
(
    [WebRoleId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [WebRoleName] NVARCHAR(255),
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[User]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[WebUser]', 'U') IS NOT NULL
DROP TABLE [dbo].[User]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[WebUser]
(
    [WebUserId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [WebRoleId] UNIQUEIDENTIFIER NOT NULL,
    [WebUserName] NVARCHAR(255),
    [Password] NVARCHAR(255) NOT NULL,
    [WebUserAddress] NVARCHAR(max) NOT NULL,
    [WebUserEmail] NVARCHAR(max) NOT NULL,
    [WebUserPhone] VARCHAR(40) NOT NULL,
    [WebUserImage] VARBINARY(MAX) NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    --- thêm thuộc tính
);
GO

-- Create a new table called '[Candidate]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Candidate]', 'U') IS NOT NULL
DROP TABLE [dbo].[Candidate]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Candidate]
(
    [CandidateId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [Experience] NVARCHAR(max),
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Interviewer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Interviewer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Interviewer]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Interviewer]
(
    [InterviewerId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [DepartmentId] UNIQUEIDENTIFIER NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Recruiter]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Recruiter]', 'U') IS NOT NULL
DROP TABLE [dbo].[Recruiter]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Recruiter]
(
    [RecruiterId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [DepartmentId] UNIQUEIDENTIFIER NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Department]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Department]', 'U') IS NOT NULL
DROP TABLE [dbo].[Department]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Department]
(
    [DepartmentId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [DepartmentName] NVARCHAR(255) NOT NULL
    ,[Address] NVARCHAR(255),
    [Email] NVARCHAR(255),
    [Phone] VARCHAR(40),
    [Website] NVARCHAR(255),
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Position]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Position]', 'U') IS NOT NULL
DROP TABLE [dbo].[Position]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Position]
(
    [PositionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column,
    [PositionName] NVARCHAR(255),
    [Description] NVARCHAR(MAX) NULL,
    [Salary] DECIMAL NULL,
    [MaxHiringQty] INT NOT NULL,
    [StartDate] DATE,
    [EndDate] DATE,
    [DepartmentId] UNIQUEIDENTIFIER NOT NULL,
    [LanguageId] UNIQUEIDENTIFIER NOT NULL,
    [RecruiterId] UNIQUEIDENTIFIER NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Language]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Language]', 'U') IS NOT NULL
DROP TABLE [dbo].[Language]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Language]
(
    [LanguageId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [LanguageName] NVARCHAR(255) NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[CV]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[CV]', 'U') IS NOT NULL
DROP TABLE [dbo].[CV]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CV]
(
    [CVId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CandidateId] UNIQUEIDENTIFIER NOT NULL,
    [Experience] NVARCHAR(MAX),
    [CVpdf] VARBINARY(MAX),
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[CV_Skills]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[CV_Skills]', 'U') IS NOT NULL
DROP TABLE [dbo].[CV_has_Skills]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CV_has_Skills]
(
    [CV_SkillsId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CVId] UNIQUEIDENTIFIER NOT NULL,
    [SkillId] UNIQUEIDENTIFIER NOT NULL,
    [ExperienceYear] INT DEFAULT 0,
    -- Specify more columns here
);
GO

-- Create a new table called '[Certificate]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Certificate]', 'U') IS NOT NULL
DROP TABLE [dbo].[Certificate]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Certificate]
(
    [CertificateId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CertificateName] NVARCHAR(255) NOT NULL,
    [Description] NVARCHAR(255),
    [OrganizationName] NVARCHAR(255),
    [DateEarned] DATE NOT NULL,
    [ExpirationDate] DATE NULL,
    [Link] NVARCHAR(max) NULL,
    [CVId] UNIQUEIDENTIFIER NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[BlackList]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[BlackList]', 'U') IS NOT NULL
DROP TABLE [dbo].[BlackList]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[BlackList]
(
    [BlackListId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CandidateId] UNIQUEIDENTIFIER NOT NULL,
    [Reason] NVARCHAR(255),
    [DateTime] DATETIME NOT NULL DEFAULT GETDATE(),
    [Status] INT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Skill]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Skill]', 'U') IS NOT NULL
DROP TABLE [dbo].[Skill]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Skill]
(
    [SkillId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [SkillName] NVARCHAR(255) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Result]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Result]', 'U') IS NOT NULL
DROP TABLE [dbo].[Result]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Result]
(
    [ResultId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [ResultString] NVARCHAR(255),
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Report]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Report]', 'U') IS NOT NULL
DROP TABLE [dbo].[Report]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Report]
(
    [ReportId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [ReportName] NVARCHAR(max),
    [RecruiterId] UNIQUEIDENTIFIER NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Event]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Event]', 'U') IS NOT NULL
DROP TABLE [dbo].[Event]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Event]
(
    [EventId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [EventName] NVARCHAR(255) NOT NULL,
    [RecruiterId] UNIQUEIDENTIFIER NOT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Interview]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Interview]', 'U') IS NOT NULL
DROP TABLE [dbo].[Interview]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Interview]
(
    [InterviewId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    -- [PositionId] UNIQUEIDENTIFIER NOT NULL,
    [InterviewerId] UNIQUEIDENTIFIER NOT NULL,
    -- [CandidateId] UNIQUEIDENTIFIER NOT NULL,
    [RecruiterId] UNIQUEIDENTIFIER NOT NULL,
    [ApplicationId] UNIQUEIDENTIFIER NOT NULL,
    -- [CVId] UNIQUEIDENTIFIER NOT NULL,
    [ITRSInterviewId] UNIQUEIDENTIFIER,
    [Status] NVARCHAR(255) null,
    [Notes] NVARCHAR(max) null,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Requirements]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Requirements]', 'U') IS NOT NULL
DROP TABLE [dbo].[Requirements]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Requirements]
(
    [RequirementId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [PositionId] UNIQUEIDENTIFIER NOT NULL,
    [SkillId] UNIQUEIDENTIFIER NOT NULL,
    [Experience] UNIQUEIDENTIFIER NOT NULL,
    [Notes] NVARCHAR(max) NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Application]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Application]', 'U') IS NOT NULL
DROP TABLE [dbo].[Application]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Application]
(
    [ApplicationId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CandidateId] UNIQUEIDENTIFIER NOT NULL,
    [CVId] UNIQUEIDENTIFIER NOT NULL,
    [PositionId] UNIQUEIDENTIFIER NOT NULL,
    [DateTime] DATETIME NOT NULL DEFAULT GETDATE(),
    [Status] NVARCHAR(255), -- enum
    [Priority] BIT NULL,
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[Shift]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Shift]', 'U') IS NOT NULL
DROP TABLE [dbo].[Shift]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Shift]
(
    [ShiftId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [ShiftTimeStart] INT NOT NULL,
    [ShiftTimeEnd] INT NOT NULL,

    CHECK (ShiftTimeEnd > ShiftTimeStart)
    -- Specify more columns here
);
GO

-- Create a new table called '[ITRS-Interview]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[ITRSInterview]', 'U') IS NOT NULL
DROP TABLE [dbo].[ITRSInterview]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[ITRSInterview]
(
    [ITRSInterviewId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [DateInterview] DATE NOT NULL,
    [ShiftId] UNIQUEIDENTIFIER NOT NULL,
    [RoomId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT UNIQUE_InterviewTime UNIQUE (DateInterview, ShiftId, RoomId)
    -- Specify more columns here
);
GO

-- Create a new table called '[Room]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Room]', 'U') IS NOT NULL
DROP TABLE [dbo].[Room]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Room]
(
    [RoomId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [RoomName] NVARCHAR(255) UNIQUE NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[CategoryQuestion]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[CategoryQuestion]', 'U') IS NOT NULL
DROP TABLE [dbo].[CategoryQuestion]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CategoryQuestion]
(
    [CategoryQuestionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CategoryQuestionName] NVARCHAR(MAX),
    [Weight] FLOAT NOT NULL,

    Check ([Weight] > 0)
    -- Specify more columns here
);
GO

-- Create a new table called '[Question]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Question]', 'U') IS NOT NULL
DROP TABLE [dbo].[Question]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Question]
(
    [QuestionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [QuestionString] NVARCHAR(max) not null,
    [CategoryQuestionId] UNIQUEIDENTIFIER NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[QuestionSkills]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[QuestionSkills]', 'U') IS NOT NULL
DROP TABLE [dbo].[QuestionSkills]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[QuestionSkills]
(
    [QuestionSkillsId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [QuestionId] UNIQUEIDENTIFIER NOT NULL,
    [SkillId] UNIQUEIDENTIFIER NOT NULL,

    UNIQUE(QuestionId, SkillId)
    -- Specify more columns here
);
GO

-- Create a new table called '[Round]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Round]', 'U') IS NOT NULL
DROP TABLE [dbo].[Round]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Round]
(
    [RoundId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [InterviewId] UNIQUEIDENTIFIER NOT NULL,
    [QuestionId] UNIQUEIDENTIFIER NOT NULL,
    [Score] FLOAT NULL,

    Check (Score >= 0),
    Check (Score <= 10)
    -- Specify more columns here
);
GO

-- Create a new table called '[SuccessfulCadidate]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[SuccessfulCadidate]', 'U') IS NOT NULL
DROP TABLE [dbo].[SuccessfulCadidate]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[SuccessfulCadidate]
(
    [SuccessfulCadidateId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [PositionId] UNIQUEIDENTIFIER NOT NULL,
    [CandidateId] UNIQUEIDENTIFIER NOT NULL,
    [DateSuccess] DATETIME NOT NULL DEFAULT GETDATE(),
    [isDeleted] BIT NOT NULL DEFAULT 0
    -- Specify more columns here
);
GO

-- Create a new table called '[CandidateJoinEvent]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[CandidateJoinEvent]', 'U') IS NOT NULL
DROP TABLE [dbo].[CandidateJoinEvent]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CandidateJoinEvent]
(
    [CandidateJoinEventId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, -- Primary Key column
    [CandidateId] UNIQUEIDENTIFIER NOT NULL,
    [EventId] UNIQUEIDENTIFIER NOT NULL,
    [DateJoin] DATETIME NOT NULL DEFAULT GETDATE(),

    UNIQUE (CandidateId, EventId, DateJoin)
    -- Specify more columns here
);
GO

-- ################################################################################

-- Constraint FK
-- User role
ALTER TABLE dbo.WebUser ADD CONSTRAINT FK_UserRole FOREIGN KEY (WebRoleId) REFERENCES dbo.WebRole(WebRoleId);

-- Web user role
ALTER TABLE dbo.Candidate ADD CONSTRAINT FK_CandidateUser FOREIGN KEY (UserId) REFERENCES dbo.WebUser(WebUserId)
ALTER TABLE dbo.Interviewer ADD CONSTRAINT Fk_InterviewerUser FOREIGN KEY (UserId) REFERENCES dbo.WebUser(WebUserId)
ALTER TABLE dbo.Recruiter ADD CONSTRAINT FK_ReccerUser FOREIGN KEY (UserId) REFERENCES dbo.WebUser(WebUserId)

-- Candidate create CV
ALTER TABLE dbo.CV ADD CONSTRAINT FK_CreateCV FOREIGN KEY (CandidateId) REFERENCES dbo.Candidate(CandidateId);
-- Certificate in CV
ALTER TABLE dbo.Certificate ADD CONSTRAINT FK_CertificateInCV FOREIGN KEY (CVId) REFERENCES dbo.CV(CVId);

-- Requirements skill
ALTER TABLE dbo.Requirements ADD CONSTRAINT FK_requePos FOREIGN KEY (PositionId) REFERENCES dbo.Position(PositionId);
ALTER TABLE dbo.Requirements ADD CONSTRAINT FK_requeSkil FOREIGN KEY (SkillId) REFERENCES dbo.Skill(SkillId);
-- Cv skill
ALTER TABLE dbo.CV_has_Skills ADD CONSTRAINT FK_ofCV FOREIGN KEY (CVId) REFERENCES dbo.CV(CVId);
ALTER TABLE dbo.CV_has_Skills ADD CONSTRAINT FK_hasSkill FOREIGN KEY (SkillId) REFERENCES dbo.Skill(SkillId);

-- BlackList
ALTER TABLE dbo.BlackList ADD CONSTRAINT FK_CandiInBlackList FOREIGN KEY (CandidateId) REFERENCES dbo.Candidate(CandidateId);

-- Department hires Position
ALTER TABLE dbo.Position ADD CONSTRAINT FK_Hires FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(DepartmentId);
ALTER TABLE dbo.Position ADD CONSTRAINT FK_ManagedBy FOREIGN KEY (RecruiterId) REFERENCES dbo.Recruiter(RecruiterId);

-- Interview
-- Interview is Conducted by
ALTER TABLE dbo.Interview ADD CONSTRAINT FK_IsConductes FOREIGN KEY (InterviewerId) REFERENCES dbo.Interviewer(InterviewerId);
-- Reccer create Interview
ALTER TABLE dbo.Interview ADD CONSTRAINT FK_ReccerCreateInterview FOREIGN KEY (RecruiterId) REFERENCES dbo.Recruiter(RecruiterId);
-- ITRS - interview
ALTER TABLE dbo.Interview ADD CONSTRAINT FK_ITRS FOREIGN KEY (ITRSInterviewId) REFERENCES dbo.ITRSInterview(ITRSInterviewId);
-- Application of interview
ALTER TABLE dbo.Interview ADD CONSTRAINT FK_applicationInterview FOREIGN KEY (ApplicationId) REFERENCES dbo.Application(ApplicationId);
-- Candidate attend Interview
-- ALTER TABLE dbo.Interview ADD CONSTRAINT FK_CandidateAttendInterview FOREIGN KEY (CandidateId) REFERENCES dbo.Candidate(CandidateId);
-- CV in interview
-- ALTER TABLE dbo.Interview ADD CONSTRAINT FK_CVinInterview FOREIGN KEY (CVId) REFERENCES dbo.CV(CVId);
-- Positon is interviewed
-- ALTER TABLE dbo.Interview ADD CONSTRAINT FK_isInterviewed FOREIGN KEY (PositionId) REFERENCES dbo.Position(PositionId);

-- Event
ALTER TABLE dbo.Event ADD CONSTRAINT FK_EventManagedBy FOREIGN KEY (RecruiterId) REFERENCES dbo.Recruiter(RecruiterId);

-- Check enddate > startdate
ALTER TABLE dbo.Position ADD CONSTRAINT CheckDate CHECK (EndDate >= StartDate)

-- Language
ALTER TABLE dbo.Position ADD CONSTRAINT Fk_language FOREIGN KEY (LanguageId) REFERENCES dbo.Language(LanguageId)

-- Interviewer, reccer of department
ALTER TABLE dbo.Interviewer ADD CONSTRAINT Fk_interDepart FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(DepartmentId)
ALTER TABLE dbo.Recruiter ADD CONSTRAINT Fk_reccerDepart FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(DepartmentId)

-- Application
ALTER TABLE dbo.Application ADD CONSTRAINT Fk_appliCandidate FOREIGN KEY (CandidateId) REFERENCES dbo.Candidate(CandidateId)
ALTER TABLE dbo.Application ADD CONSTRAINT Fk_appliCv FOREIGN KEY (CVId) REFERENCES dbo.CV(CVId)
ALTER TABLE dbo.Application ADD CONSTRAINT Fk_appliPosition FOREIGN KEY (PositionId) REFERENCES dbo.Position(PositionId)

-- ITRSInterview
ALTER TABLE dbo.ITRSInterview ADD CONSTRAINT Fk_ITRS_Shift FOREIGN KEY (ShiftId) REFERENCES dbo.Shift(ShiftId)
ALTER TABLE dbo.ITRSInterview ADD CONSTRAINT Fk_ITRS_Room FOREIGN KEY (RoomId) REFERENCES dbo.Room(RoomId)

-- Question category
ALTER TABLE dbo.Question ADD CONSTRAINT Fk_catQues FOREIGN KEY (CategoryQuestionId) REFERENCES dbo.CategoryQuestion(CategoryQuestionId)
-- Question skill
ALTER TABLE dbo.QuestionSkills ADD CONSTRAINT Fk_SkillQues FOREIGN KEY (QuestionId) REFERENCES dbo.Question(QuestionId)
ALTER TABLE dbo.QuestionSkills ADD CONSTRAINT Fk_QuesSkill FOREIGN KEY (SkillId) REFERENCES dbo.Skill(SkillId)
-- Question round
ALTER TABLE dbo.Round ADD CONSTRAINT Fk_RoundInterview FOREIGN KEY (InterviewId) REFERENCES dbo.Interview(InterviewId)
ALTER TABLE dbo.Round ADD CONSTRAINT Fk_RoundQuestion FOREIGN KEY (QuestionId) REFERENCES dbo.Question(QuestionId)

-- SuccessfulCadidate
ALTER TABLE dbo.SuccessfulCadidate ADD CONSTRAINT FK_SuccessfulPosition FOREIGN KEY (PositionId) REFERENCES dbo.Position(PositionId)
ALTER TABLE dbo.SuccessfulCadidate ADD CONSTRAINT FK_SuccessfulCandi FOREIGN KEY (CandidateId) REFERENCES dbo.Candidate(CandidateId)


-- Candidate join event
ALTER TABLE dbo.CandidateJoinEvent ADD CONSTRAINT FK_CandiJoin FOREIGN KEY (CandidateId) REFERENCES dbo.Candidate(CandidateId)
ALTER TABLE dbo.CandidateJoinEvent ADD CONSTRAINT FK_joinEvent FOREIGN KEY (EventId) REFERENCES dbo.Event(EventId)

-- Reccer create Report
ALTER TABLE dbo.Report ADD CONSTRAINT FK_ReccerCreateReport FOREIGN KEY (RecruiterId) REFERENCES dbo.Recruiter(RecruiterId)