IF OBJECT_ID(N'md_Organization',N'U') IS NOT NULL
    DROP TABLE md_Organization;
GO
CREATE TABLE md_Organization (
    [OrgID] INT IDENTITY(1,1) NOT NULL,
    [OrgCode] VARCHAR(40)  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [OrgGrade] VARCHAR(40)  NULL,
    [OrgType] VARCHAR(40)  NULL,
    [ParentID] INT  NULL,
    [Leader1] INT  NULL,
    [Leader2] INT  NULL,
    [Leader3] INT  NULL,
    [BeginDate] DATE  NULL,
    [Disabled] BIT  NULL,
    [DisabledDate] DATE  NULL,
    [OrderNo] INT  NULL,
    [OrgPath] VARCHAR(800)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [Emp1] INT NULL,
    [OrderBy] INT NULL,
    [OrgAbbr] NVARCHAR(50) NULL,
    CONSTRAINT [PK_md_Organization] PRIMARY KEY CLUSTERED (OrgID ASC),
    CONSTRAINT [UQ_md_Organization_OrgCode] UNIQUE (OrgCode)
);
GO

CREATE NONCLUSTERED INDEX [IX_md_Organization_Disabled_OrgID] ON md_Organization ([Disabled], [OrgID]);
GO

IF OBJECT_ID(N'ou_Org_Operation',N'U') IS NOT NULL
    DROP TABLE ou_Org_Operation;
GO
CREATE TABLE ou_Org_Operation (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [OrgID] INT  NULL,
    [OperType] VARCHAR(40)  NULL,
    [OrgCode] VARCHAR(40)  NULL,
    [Old_Title] NVARCHAR(100) NULL,
    [Title] NVARCHAR(100)  NULL,
    [Old_Title1] NVARCHAR(100) NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Old_Title2] NVARCHAR(100) NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Old_Title3] NVARCHAR(100) NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Old_Title4] NVARCHAR(100) NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Old_Title5] NVARCHAR(100) NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Old_OrgGrade] VARCHAR(40) NULL,
    [OrgGrade] VARCHAR(40)  NULL,
    [Old_OrgType] VARCHAR(40) NULL,
    [OrgType] VARCHAR(40)  NULL,
    [Old_ParentID] INT NULL,
    [ParentID] INT  NULL,
    [Old_Leader1] INT NULL,
    [Leader1] INT  NULL,
    [Old_Leader2] INT NULL,
    [Leader2] INT  NULL,
    [Old_Leader3] INT NULL,
    [Leader3] INT  NULL,
    [BeginDate] DATE  NULL,
    [OrderNo] INT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    CONSTRAINT [PK_ou_Org_Operation] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_ou_Org_Operation_OperType_Closed] ON ou_Org_Operation ([OperType], [Closed]);
GO

CREATE NONCLUSTERED INDEX [IX_ou_Org_Operation_OrgID] ON ou_Org_Operation ([OrgID]);
GO

CREATE NONCLUSTERED INDEX [IX_ou_Org_Operation_OrgCode] ON ou_Org_Operation ([OrgCode]);
GO

IF OBJECT_ID(N'md_Organization_Event',N'U') IS NOT NULL
    DROP TABLE md_Organization_Event;
GO
CREATE TABLE md_Organization_Event (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [OperID] VARCHAR(2000)  NULL,
    [OrgID] INT  NULL,
    [OrgCode] VARCHAR(40)  NULL,
    [BeginDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [OrgGrade] VARCHAR(40)  NULL,
    [OrgGradeName] NVARCHAR(100)  NULL,
    [OrgType] VARCHAR(40)  NULL,
    [OrgTypeName] NVARCHAR(100)  NULL,
    [ParentID] INT  NULL,
    [ParentCode] VARCHAR  NULL,
    [ParentTitle] VARCHAR  NULL,
    [Leader1] INT  NULL,
    [Leader2] INT  NULL,
    [Leader3] INT  NULL,
    [OrgPath] VARCHAR(800)  NULL,
    CONSTRAINT [PK_md_Organization_Event] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_md_Organization_Event_OrgID] ON md_Organization_Event ([OrgID]);
GO

CREATE NONCLUSTERED INDEX [IX_md_Organization_Event_OrgID_BeginDate] ON md_Organization_Event ([OrgID], [BeginDate]);
GO

CREATE NONCLUSTERED INDEX [IX_md_Organization_Event_OrgID_EndDate] ON md_Organization_Event ([OrgID], [EndDate]);
GO

IF OBJECT_ID(N'md_Organization_Month',N'U') IS NOT NULL
    DROP TABLE md_Organization_Month;
GO
CREATE TABLE md_Organization_Month (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [Term] DATE  NULL,
    [OrgID] INT  NULL,
    [OrgCode] VARCHAR(40)  NULL,
    [BeginDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [OrgGrade] VARCHAR(40)  NULL,
    [OrgGradeName] NVARCHAR(100)  NULL,
    [OrgType] VARCHAR(40)  NULL,
    [OrgTypeName] NVARCHAR(100)  NULL,
    [ParentID] INT  NULL,
    [ParentCode] VARCHAR  NULL,
    [ParentTitle] VARCHAR  NULL,
    [Leader1] INT  NULL,
    [Leader2] INT  NULL,
    [Leader3] INT  NULL,
    [Disabled] BIT  NULL,
    [DisabledDate] DATE  NULL,
    [OrgPath] VARCHAR(800)  NULL,
    [OrderNo] INT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_md_Organization_Month] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_md_Organization_Month_OrgID_Term] ON md_Organization_Month ([OrgID], [Term]);
GO

IF OBJECT_ID(N'md_Position',N'U') IS NOT NULL
    DROP TABLE md_Position;
GO
CREATE TABLE md_Position (
    [PosID] INT IDENTITY(1,1) NOT NULL,
    [PosCode] VARCHAR(40)  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [PosType] VARCHAR(40)  NULL,
    [PosLevel] VARCHAR(40)  NULL,
    [PosGrade] VARCHAR(40)  NULL,
    [BeginDate] DATE  NULL,
    [Disabled] BIT  NULL,
    [DisabledDate] DATE  NULL,
    [OrderNo] INT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_md_Position] PRIMARY KEY CLUSTERED (PosID ASC),
    CONSTRAINT [UQ_md_Position_PosCode] UNIQUE (PosCode)
);
GO

CREATE NONCLUSTERED INDEX [IX_md_Position_Disabled_PosID] ON md_Position ([Disabled], [PosID]);
GO

IF OBJECT_ID(N'ou_Pos_Operation',N'U') IS NOT NULL
    DROP TABLE ou_Pos_Operation;
GO
CREATE TABLE ou_Pos_Operation (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [OperType] VARCHAR(40)  NULL,
    [PosID] INT  NULL,
    [PosCode] VARCHAR(40)  NULL,
    [Old_Title] NVARCHAR(100) NULL,
    [Title] NVARCHAR(100)  NULL,
    [Old_Title1] NVARCHAR(100) NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Old_Title2] NVARCHAR(100) NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Old_Title3] NVARCHAR(100) NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Old_Title4] NVARCHAR(100) NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Old_Title5] NVARCHAR(100) NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Old_PosType] VARCHAR(40) NULL,
    [PosType] VARCHAR(40)  NULL,
    [Old_PosLevel] VARCHAR(40) NULL,
    [PosLevel] VARCHAR(40)  NULL,
    [Old_PosGrade] VARCHAR(40) NULL,
    [PosGrade] VARCHAR(40)  NULL,
    [BeginDate] DATE  NULL,
    [OrderNo] INT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    CONSTRAINT [PK_ou_Pos_Operation] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_ou_Pos_Operation_OperType_Closed] ON ou_Pos_Operation ([OperType], [Closed]);
GO

CREATE NONCLUSTERED INDEX [IX_ou_Pos_Operation_PosID] ON ou_Pos_Operation ([PosID]);
GO

CREATE NONCLUSTERED INDEX [IX_ou_Pos_Operation_PosCode] ON ou_Pos_Operation ([PosCode]);
GO

IF OBJECT_ID(N'md_Position_Event',N'U') IS NOT NULL
    DROP TABLE md_Position_Event;
GO
CREATE TABLE md_Position_Event (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [OperID] VARCHAR(2000)  NULL,
    [PosID] INT  NULL,
    [PosCode] VARCHAR(40)  NULL,
    [BeginDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [PosType] VARCHAR(40)  NULL,
    [PosTypeName] NVARCHAR(100)  NULL,
    [PosLevel] VARCHAR(40)  NULL,
    [PosLevelName] NVARCHAR(100)  NULL,
    [PosGrade] VARCHAR(40)  NULL,
    [PosGradeName] NVARCHAR(100)  NULL,
    CONSTRAINT [PK_md_Position_Event] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_md_Position_Event_PosID] ON md_Position_Event ([PosID]);
GO

CREATE NONCLUSTERED INDEX [IX_md_Position_Event_PosID_BeginDate] ON md_Position_Event ([PosID], [BeginDate]);
GO

CREATE NONCLUSTERED INDEX [IX_md_Position_Event_PosID_EndDate] ON md_Position_Event ([PosID], [EndDate]);
GO

IF OBJECT_ID(N'md_Position_Month',N'U') IS NOT NULL
    DROP TABLE md_Position_Month;
GO
CREATE TABLE md_Position_Month (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [Term] DATE  NULL,
    [PosID] INT  NULL,
    [PosCode] VARCHAR(40)  NULL,
    [BeginDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [PosType] VARCHAR(40)  NULL,
    [PosTypeName] NVARCHAR(100)  NULL,
    [PosLevel] VARCHAR(40)  NULL,
    [PosLevelName] NVARCHAR(100)  NULL,
    [PosGrade] VARCHAR(40)  NULL,
    [PosGradeName] NVARCHAR(100)  NULL,
    [Disabled] BIT  NULL,
    [DisabledDate] DATE  NULL,
    [OrderNo] INT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_md_Position_Month] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_md_Position_Month_PosID_Term] ON md_Position_Month ([PosID], [Term]);
GO

CREATE NONCLUSTERED INDEX [IX_md_Position_Month_PosID_Term_PosType] ON md_Position_Month ([PosID], [Term], [PosType]) INCLUDE([PosCode]);
GO

IF OBJECT_ID(N'md_Employee',N'U') IS NOT NULL
    DROP TABLE md_Employee;
GO
CREATE TABLE md_Employee (
    [EmpID] INT IDENTITY(1,1) NOT NULL,
    [EmpNo] VARCHAR(20)  NULL,
    [LastName] NVARCHAR(20)  NULL,
    [FirstName] NVARCHAR(80)  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Gender] VARCHAR(40)  NULL,
    [OrgID] INT  NULL,
    [PosID] INT  NULL,
    [JobID] INT  NULL,
    [ParentID] INT  NULL,
    [Parent2ID] INT  NULL,
    [EmploymentStatus] VARCHAR(40)  NULL,
    [EmployeeType] VARCHAR(40)  NULL,
    [EmploymentType] VARCHAR(40)  NULL,
    [EmployeeCategory] VARCHAR(40)  NULL,
    [EmployeeLevel] VARCHAR(40)  NULL,
    [JoinDate] DATE  NULL,
    [ProbationMonths] INT  NULL,
    [ProbationEndDate] DATE  NULL,
    [RegularDate] DATE  NULL,
    [InternEndDate] DATE  NULL,
    [InternToRegDate] DATE  NULL,
    [FirstContractDate] DATE  NULL,
    [ContractCompID] INT  NULL,
    [ContractType] VARCHAR(40)  NULL,
    [ContractProperty] VARCHAR(40)  NULL,
    [ContractNo] VARCHAR(40)  NULL,
    [ContractBeginDate] DATE  NULL,
    [ContractTerm] INT  NULL,
    [ContractEndDate] DATE  NULL,
    [ContractCount] INT  NULL,
    [RecruitChannel] VARCHAR(40)  NULL,
    [WorkCity] VARCHAR(40)  NULL,
    [SSCity] VARCHAR(40)  NULL,
    [Nationality] VARCHAR(40)  NULL,
    [Ethnicity] VARCHAR(40)  NULL,
    [IDType] VARCHAR(40)  NULL,
    [IDNo] VARCHAR(40)  NULL,
    [IDStartDate] DATE  NULL,
    [IsPermanent] BIT  NULL,
    [IDEndDate] DATE  NULL,
    [BirthDate] DATE  NULL,
    [MobileNo] VARCHAR(40)  NULL,
    [EmailPersonal] VARCHAR(40)  NULL,
    [FirstWorkDate] DATE  NULL,
    [MaritalStatus] VARCHAR(40)  NULL,
    [FertilityStatus] VARCHAR(40)  NULL,
    [PoliticalStatus] VARCHAR(40)  NULL,
    [PartyJoinDate] DATETIME  NULL,
    [NativePlace] VARCHAR(40)  NULL,
    [NativePlaceAddr] NVARCHAR(100)  NULL,
    [CurrentResidence] VARCHAR(40)  NULL,
    [CurrResAddr] NVARCHAR(100)  NULL,
    [ResidenceType] VARCHAR(40)  NULL,
    [BankCode] VARCHAR(40)  NULL,
    [BankBranchName] NVARCHAR(100)  NULL,
    [BankAccountNo] VARCHAR(40)  NULL,
    [ADAccount] VARCHAR(40)  NULL,
    [EmailWork] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_md_Employee] PRIMARY KEY CLUSTERED (EmpID ASC)
);
GO

IF OBJECT_ID(N'md_Employee_Event',N'U') IS NOT NULL
    DROP TABLE md_Employee_Event;
GO
CREATE TABLE md_Employee_Event (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [OperID] VARCHAR(2000)  NULL,
    [EmpID] INT  NULL,
    [BeginDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [OrgID] INT  NULL,
    [OrgCode] VARCHAR(40)  NULL,
    [OrgName] NVARCHAR(100)  NULL,
    [PosID] INT  NULL,
    [PosCode] VARCHAR(40)  NULL,
    [PosName] NVARCHAR(100)  NULL,
    [JobID] INT  NULL,
    [JobCode] VARCHAR(40)  NULL,
    [JobName] NVARCHAR(100)  NULL,
    [ParentID] INT  NULL,
    [Parent2ID] INT  NULL,
    [EmploymentStatus] VARCHAR(40)  NULL,
    [EmploymentStatusName] NVARCHAR(100)  NULL,
    [EmployeeType] VARCHAR(40)  NULL,
    [EmployeeTypeName] NVARCHAR(100)  NULL,
    [EmploymentType] VARCHAR(40)  NULL,
    [EmploymentTypeName] NVARCHAR(100)  NULL,
    [EmployeeCategory] VARCHAR(40)  NULL,
    [EmployeeCategoryName] NVARCHAR(100)  NULL,
    [EmployeeLevel] VARCHAR(40)  NULL,
    [EmployeeLevelName] NVARCHAR(100)  NULL,
    [ProbationMonths] INT  NULL,
    [ProbationEndDate] DATE  NULL,
    [InternEndDate] DATE  NULL,
    [ContractCompID] INT  NULL,
    [ContractType] VARCHAR(40)  NULL,
    [ContractProperty] VARCHAR(40)  NULL,
    [ContractBeginDate] DATE  NULL,
    [ContractEndDate] DATE  NULL,
    [ContractCount] INT  NULL,
    [RecruitChannel] VARCHAR(40)  NULL,
    [WorkCity] VARCHAR(40)  NULL,
    [SSCity] VARCHAR(40)  NULL,
    CONSTRAINT [PK_md_Employee_Event] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'md_Employee_Month',N'U') IS NOT NULL
    DROP TABLE md_Employee_Month;
GO
CREATE TABLE md_Employee_Month (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [Term] DATE  NULL,
    [EmpID] INT  NULL,
    [EmpNo] VARCHAR(20)  NULL,
    [LastName] NVARCHAR(20)  NULL,
    [FirstName] NVARCHAR(80)  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Gender] VARCHAR(40)  NULL,
    [OrgID] INT  NULL,
    [OrgCode] VARCHAR(40)  NULL,
    [OrgName] NVARCHAR(100)  NULL,
    [PosID] INT  NULL,
    [PosCode] VARCHAR(40)  NULL,
    [PosName] NVARCHAR(100)  NULL,
    [JobID] INT  NULL,
    [JobCode] VARCHAR(40)  NULL,
    [JobName] NVARCHAR(100)  NULL,
    [ParentID] INT  NULL,
    [Parent2ID] INT  NULL,
    [EmploymentStatus] VARCHAR(40)  NULL,
    [EmploymentStatusName] NVARCHAR(100)  NULL,
    [EmployeeType] VARCHAR(40)  NULL,
    [EmployeeTypeName] NVARCHAR(100)  NULL,
    [EmploymentType] VARCHAR(40)  NULL,
    [EmploymentTypeName] NVARCHAR(100)  NULL,
    [EmployeeCategory] VARCHAR(40)  NULL,
    [EmployeeCategoryName] NVARCHAR(100)  NULL,
    [EmployeeLevel] VARCHAR(40)  NULL,
    [EmployeeLevelName] NVARCHAR(100)  NULL,
    [JoinDate] DATE  NULL,
    [ProbationMonths] INT  NULL,
    [ProbationEndDate] DATE  NULL,
    [RegularDate] DATE  NULL,
    [InternEndDate] DATE  NULL,
    [InternToRegDate] DATE  NULL,
    [FirstContractDate] DATE  NULL,
    [ContractCompID] INT  NULL,
    [ContractType] VARCHAR(40)  NULL,
    [ContractProperty] VARCHAR(40)  NULL,
    [ContractNo] VARCHAR(40)  NULL,
    [ContractBeginDate] DATE  NULL,
    [ContractTerm] INT  NULL,
    [ContractEndDate] DATE  NULL,
    [ContractCount] INT  NULL,
    [RecruitChannel] VARCHAR(40)  NULL,
    [WorkCity] VARCHAR(40)  NULL,
    [SSCity] VARCHAR(40)  NULL,
    [Nationality] VARCHAR(40)  NULL,
    [Ethnicity] VARCHAR(40)  NULL,
    [IDType] VARCHAR(40)  NULL,
    [IDNo] VARCHAR(40)  NULL,
    [IDStartDate] DATE  NULL,
    [IsPermanent] BIT  NULL,
    [IDEndDate] DATE  NULL,
    [BirthDate] DATE  NULL,
    [MobileNo] VARCHAR(40)  NULL,
    [EmailPersonal] VARCHAR(40)  NULL,
    [FirstWorkDate] DATE  NULL,
    [MaritalStatus] VARCHAR(40)  NULL,
    [FertilityStatus] VARCHAR(40)  NULL,
    [PoliticalStatus] VARCHAR(40)  NULL,
    [PartyJoinDate] DATETIME  NULL,
    [NativePlace] VARCHAR(40)  NULL,
    [NativePlaceAddr] NVARCHAR(100)  NULL,
    [CurrentResidence] VARCHAR(40)  NULL,
    [CurrResAddr] NVARCHAR(100)  NULL,
    [ResidenceType] VARCHAR(40)  NULL,
    [BankCode] VARCHAR(40)  NULL,
    [BankBranchName] NVARCHAR(100)  NULL,
    [BankAccountNo] VARCHAR(40)  NULL,
    [ADAccount] VARCHAR(40)  NULL,
    [EmailWork] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_md_Employee_Month] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Pre_EmpInfo',N'U') IS NOT NULL
    DROP TABLE eu_Pre_EmpInfo;
GO
CREATE TABLE eu_Pre_EmpInfo (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [OnboardingStatus] VARCHAR(40)  NULL,
    [OnboardingCnt] INT  NULL,
    [LinkUrl] VARCHAR(200)  NULL,
    [ApplyID] VARCHAR(100)  NULL,
    [WfInstanceID] INT  NULL,
    [EmpNo] VARCHAR(20)  NULL,
    [LastName] NVARCHAR(20)  NULL,
    [FirstName] NVARCHAR(80)  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Gender] VARCHAR(40)  NULL,
    [Nationality] VARCHAR(40)  NULL,
    [Ethnicity] VARCHAR(40)  NULL,
    [IDType] VARCHAR(40)  NULL,
    [IDNo] VARCHAR(40)  NULL,
    [IDStartDate] DATE  NULL,
    [IsPermanent] BIT  NULL,
    [IDEndDate] DATE  NULL,
    [BirthDate] DATE  NULL,
    [MobileNo] VARCHAR(40)  NULL,
    [EmailPersonal] VARCHAR(40)  NULL,
    [FirstWorkDate] DATE  NULL,
    [MaritalStatus] VARCHAR(40)  NULL,
    [FertilityStatus] VARCHAR(40)  NULL,
    [PoliticalStatus] VARCHAR(40)  NULL,
    [EduLevel] VARCHAR(40)  NULL,
    [EduDegree] VARCHAR(40)  NULL,
    [Major] NVARCHAR(100)  NULL,
    [GradSchool] NVARCHAR(100)  NULL,
    [GraduationDate] DATE  NULL,
    [StudyMode] VARCHAR(40)  NULL,
    [EmgContactName] NVARCHAR(100)  NULL,
    [EmgContactPhone] VARCHAR(40)  NULL,
    [EmgContactRelation] VARCHAR(40)  NULL,
    [NativePlace] VARCHAR(40)  NULL,
    [NativePlaceAddr] NVARCHAR(100)  NULL,
    [CurrentResidence] VARCHAR(40)  NULL,
    [CurrResAddr] NVARCHAR(100)  NULL,
    [ResidenceType] VARCHAR(40)  NULL,
    [JoinDate] DATE  NULL,
    [ContractCompID] INT  NULL,
    [OrgID] INT  NULL,
    [PosID] INT  NULL,
    [JobID] INT  NULL,
    [ParentID] INT  NULL,
    [Parent2ID] INT  NULL,
    [RecruitChannel] VARCHAR(40)  NULL,
    [WorkCity] VARCHAR(40)  NULL,
    [SSCity] VARCHAR(40)  NULL,
    [BankCode] VARCHAR(40)  NULL,
    [BankBranchName] NVARCHAR(100)  NULL,
    [BankAccountNo] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    [Canceled] BIT  NULL,
    [CanceledBy] INT  NULL,
    [CanceledTime] DATETIME  NULL,
    [CancelReason] NVARCHAR(400)  NULL,
    [Offered] BIT  NULL,
    [OfferedBy] INT  NULL,
    [OfferedTime] DATETIME  NULL,
    [Submit] BIT  NULL,
    [SubmitTime] DATETIME  NULL,
    [Rejected] BIT  NULL,
    [RejectedBy] INT  NULL,
    [RejectedTime] DATETIME  NULL,
    CONSTRAINT [PK_eu_Pre_EmpInfo] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

CREATE NONCLUSTERED INDEX [IX_eu_Pre_EmpInfo_Closed] ON eu_Pre_EmpInfo ([Closed]);
GO

CREATE NONCLUSTERED INDEX [IX_eu_Pre_EmpInfo_EmpNo] ON eu_Pre_EmpInfo ([EmpNo]);
GO

IF OBJECT_ID(N'eu_Onboard_Education',N'U') IS NOT NULL
    DROP TABLE eu_Onboard_Education;
GO
CREATE TABLE eu_Onboard_Education (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [PreOnboardingID] INT  NULL,
    [OnboardID] INT  NULL,
    [StartDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [School] NVARCHAR(100)  NULL,
    [Major] NVARCHAR(100)  NULL,
    [EduLevel] VARCHAR(40)  NULL,
    [EduDegree] VARCHAR(40)  NULL,
    [IsHighest] BIT  NULL,
    [StudyMode] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_eu_Onboard_Education] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Onboard_WorkExp',N'U') IS NOT NULL
    DROP TABLE eu_Onboard_WorkExp;
GO
CREATE TABLE eu_Onboard_WorkExp (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [PreOnboardingID] INT  NULL,
    [OnboardID] INT  NULL,
    [StartDate] DATE  NULL,
    [EndDate] DATE  NULL,
    [Company] NVARCHAR(100)  NULL,
    [Position] NVARCHAR(100)  NULL,
    [ResignationReason] VARCHAR(40)  NULL,
    [GrossSalary] NVARCHAR(100)  NULL,
    [RefereeName] NVARCHAR(100)  NULL,
    [RefereePhone] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_eu_Onboard_WorkExp] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Onboard_Family',N'U') IS NOT NULL
    DROP TABLE eu_Onboard_Family;
GO
CREATE TABLE eu_Onboard_Family (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [PreOnboardingID] INT  NULL,
    [OnboardID] INT  NULL,
    [Name] NVARCHAR(100)  NULL,
    [IDNo] VARCHAR(40)  NULL,
    [Relations] VARCHAR(40)  NULL,
    [Company] NVARCHAR(100)  NULL,
    [MobileNo] VARCHAR(40)  NULL,
    [IsEmgContact] BIT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_eu_Onboard_Family] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Onboard_Attachments',N'U') IS NOT NULL
    DROP TABLE eu_Onboard_Attachments;
GO
CREATE TABLE eu_Onboard_Attachments (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [PreOnboardingID] INT  NULL,
    [OnboardID] INT  NULL,
    [AttachmentType] VARCHAR(40)  NULL,
    [Attachment] VARCHAR(2000)  NULL,
    CONSTRAINT [PK_eu_Onboard_Attachments] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Onboard_Certificate',N'U') IS NOT NULL
    DROP TABLE eu_Onboard_Certificate;
GO
CREATE TABLE eu_Onboard_Certificate (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [PreOnboardingID] INT  NULL,
    [OnboardID] INT  NULL,
    [CertType] VARCHAR(40)  NULL,
    [CertGrade] VARCHAR(40)  NULL,
    [CertName] NVARCHAR(100)  NULL,
    [CertNo] NVARCHAR(100)  NULL,
    [CertOrg] NVARCHAR(100)  NULL,
    [CertDate] DATE  NULL,
    [IsPermanent] BIT  NULL,
    [CertExpireDate] DATE  NULL,
    [IsRemind] BIT  NULL,
    CONSTRAINT [PK_eu_Onboard_Certificate] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Emp_Onboard',N'U') IS NOT NULL
    DROP TABLE eu_Emp_Onboard;
GO
CREATE TABLE eu_Emp_Onboard (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [PreOnboardingID] INT  NULL,
    [OnboardingCnt] INT  NULL,
    [LinkUrl] VARCHAR(200)  NULL,
    [WfInstanceID] INT  NULL,
    [EmpID] INT  NULL,
    [EmpNo] VARCHAR(20)  NULL,
    [LastName] NVARCHAR(20)  NULL,
    [FirstName] NVARCHAR(80)  NULL,
    [Title] NVARCHAR(100)  NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Gender] VARCHAR(40)  NULL,
    [Nationality] VARCHAR(40)  NULL,
    [Ethnicity] VARCHAR(40)  NULL,
    [IDType] VARCHAR(40)  NULL,
    [IDNo] VARCHAR(40)  NULL,
    [IDStartDate] DATE  NULL,
    [IsPermanent] BIT  NULL,
    [IDEndDate] DATE  NULL,
    [BirthDate] DATE  NULL,
    [MobileNo] VARCHAR(40)  NULL,
    [EmailPersonal] VARCHAR(40)  NULL,
    [FirstWorkDate] DATE  NULL,
    [MaritalStatus] VARCHAR(40)  NULL,
    [FertilityStatus] VARCHAR(40)  NULL,
    [PoliticalStatus] VARCHAR(40)  NULL,
    [PartyJoinDate] DATETIME  NULL,
    [EduLevel] VARCHAR(40)  NULL,
    [EduDegree] VARCHAR(40)  NULL,
    [Major] NVARCHAR(100)  NULL,
    [GradSchool] NVARCHAR(100)  NULL,
    [GraduationDate] DATE  NULL,
    [StudyMode] VARCHAR(40)  NULL,
    [EmgContactName] NVARCHAR(100)  NULL,
    [EmgContactPhone] VARCHAR(40)  NULL,
    [EmgContactRelation] VARCHAR(40)  NULL,
    [NativePlace] VARCHAR(40)  NULL,
    [NativePlaceAddr] NVARCHAR(100)  NULL,
    [CurrentResidence] VARCHAR(40)  NULL,
    [CurrResAddr] NVARCHAR(100)  NULL,
    [ResidenceType] VARCHAR(40)  NULL,
    [JoinDate] DATE  NULL,
    [ContractCompID] INT  NULL,
    [OrgID] INT  NULL,
    [PosID] INT  NULL,
    [JobID] INT  NULL,
    [ParentID] INT  NULL,
    [Parent2ID] INT  NULL,
    [RecruitChannel] VARCHAR(40)  NULL,
    [WorkCity] VARCHAR(40)  NULL,
    [SSCity] VARCHAR(40)  NULL,
    [BankCode] VARCHAR(40)  NULL,
    [BankBranchName] NVARCHAR(100)  NULL,
    [BankAccountNo] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    [Canceled] BIT  NULL,
    [CanceledBy] INT  NULL,
    [CanceledTime] DATETIME  NULL,
    [CancelReason] NVARCHAR(400)  NULL,
    CONSTRAINT [PK_eu_Emp_Onboard] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Emp_InfoChange',N'U') IS NOT NULL
    DROP TABLE eu_Emp_InfoChange;
GO
CREATE TABLE eu_Emp_InfoChange (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [LinkUrl] VARCHAR(200)  NULL,
    [WfInstanceID] INT  NULL,
    [EmpID] INT  NULL,
    [EmpNo] VARCHAR(20)  NULL,
    [Old_LastName] NVARCHAR(20) NULL,
    [LastName] NVARCHAR(20)  NULL,
    [Old_FirstName] NVARCHAR(80) NULL,
    [FirstName] NVARCHAR(80)  NULL,
    [Old_Title] NVARCHAR(100) NULL,
    [Title] NVARCHAR(100)  NULL,
    [Old_Title1] NVARCHAR(100) NULL,
    [Title1] NVARCHAR(100)  NULL,
    [Old_Title2] NVARCHAR(100) NULL,
    [Title2] NVARCHAR(100)  NULL,
    [Old_Title3] NVARCHAR(100) NULL,
    [Title3] NVARCHAR(100)  NULL,
    [Old_Title4] NVARCHAR(100) NULL,
    [Title4] NVARCHAR(100)  NULL,
    [Old_Title5] NVARCHAR(100) NULL,
    [Title5] NVARCHAR(100)  NULL,
    [Old_Gender] VARCHAR(40) NULL,
    [Gender] VARCHAR(40)  NULL,
    [Old_Nationality] VARCHAR(40) NULL,
    [Nationality] VARCHAR(40)  NULL,
    [Old_Ethnicity] VARCHAR(40) NULL,
    [Ethnicity] VARCHAR(40)  NULL,
    [Old_IDType] VARCHAR(40) NULL,
    [IDType] VARCHAR(40)  NULL,
    [Old_IDNo] VARCHAR(40) NULL,
    [IDNo] VARCHAR(40)  NULL,
    [Old_IDStartDate] DATE NULL,
    [IDStartDate] DATE  NULL,
    [Old_IsPermanent] BIT NULL,
    [IsPermanent] BIT  NULL,
    [Old_IDEndDate] DATE NULL,
    [IDEndDate] DATE  NULL,
    [Old_BirthDate] DATE NULL,
    [BirthDate] DATE  NULL,
    [Old_MobileNo] VARCHAR(40) NULL,
    [MobileNo] VARCHAR(40)  NULL,
    [Old_EmailPersonal] VARCHAR(40) NULL,
    [EmailPersonal] VARCHAR(40)  NULL,
    [Old_FirstWorkDate] DATE NULL,
    [FirstWorkDate] DATE  NULL,
    [Old_MaritalStatus] VARCHAR(40) NULL,
    [MaritalStatus] VARCHAR(40)  NULL,
    [Old_FertilityStatus] VARCHAR(40) NULL,
    [FertilityStatus] VARCHAR(40)  NULL,
    [Old_PoliticalStatus] VARCHAR(40) NULL,
    [PoliticalStatus] VARCHAR(40)  NULL,
    [Old_PartyJoinDate] DATETIME NULL,
    [PartyJoinDate] DATETIME  NULL,
    [Old_NativePlace] VARCHAR(40) NULL,
    [NativePlace] VARCHAR(40)  NULL,
    [Old_NativePlaceAddr] NVARCHAR(100) NULL,
    [NativePlaceAddr] NVARCHAR(100)  NULL,
    [Old_CurrentResidence] VARCHAR(40) NULL,
    [CurrentResidence] VARCHAR(40)  NULL,
    [Old_CurrResAddr] NVARCHAR(100) NULL,
    [CurrResAddr] NVARCHAR(100)  NULL,
    [Old_ResidenceType] VARCHAR(40) NULL,
    [ResidenceType] VARCHAR(40)  NULL,
    [Old_BankCode] VARCHAR(40) NULL,
    [BankCode] VARCHAR(40)  NULL,
    [Old_BankBranchName] NVARCHAR(100) NULL,
    [BankBranchName] NVARCHAR(100)  NULL,
    [Old_BankAccountNo] VARCHAR(40) NULL,
    [BankAccountNo] VARCHAR(40)  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    CONSTRAINT [PK_eu_Emp_InfoChange] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Emp_Transfer',N'U') IS NOT NULL
    DROP TABLE eu_Emp_Transfer;
GO
CREATE TABLE eu_Emp_Transfer (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [LinkUrl] VARCHAR(200)  NULL,
    [WfInstanceID] INT  NULL,
    [TransferType] VARCHAR(40)  NULL,
    [EmpID] INT  NULL,
    [Old_OrgID] INT NULL,
    [OrgID] INT  NULL,
    [Old_PosID] INT NULL,
    [PosID] INT  NULL,
    [Old_JobID] INT NULL,
    [JobID] INT  NULL,
    [Old_ParentID] INT NULL,
    [ParentID] INT  NULL,
    [Old_Parent2ID] INT NULL,
    [Parent2ID] INT  NULL,
    [Old_RecruitChannel] VARCHAR(40) NULL,
    [RecruitChannel] VARCHAR(40)  NULL,
    [Old_WorkCity] VARCHAR(40) NULL,
    [WorkCity] VARCHAR(40)  NULL,
    [Old_SSCity] VARCHAR(40) NULL,
    [SSCity] VARCHAR(40)  NULL,
    [Old_ContractCompID] INT NULL,
    [ContractCompID] INT  NULL,
    [Old_ContractType] VARCHAR(40) NULL,
    [ContractType] VARCHAR(40)  NULL,
    [Old_ContractProperty] VARCHAR(40) NULL,
    [ContractProperty] VARCHAR(40)  NULL,
    [Old_ContractBeginDate] DATE NULL,
    [ContractBeginDate] DATE  NULL,
    [Old_ContractEndDate] DATE NULL,
    [ContractEndDate] DATE  NULL,
    [Old_ProbationMonths] INT NULL,
    [ProbationMonths] INT  NULL,
    [Old_ProbationEndDate] DATE NULL,
    [ProbationEndDate] DATE  NULL,
    [Old_InternEndDate] DATE NULL,
    [InternEndDate] DATE  NULL,
    [BeginDate] DATE  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    CONSTRAINT [PK_eu_Emp_Transfer] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Emp_Regular',N'U') IS NOT NULL
    DROP TABLE eu_Emp_Regular;
GO
CREATE TABLE eu_Emp_Regular (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [LinkUrl] VARCHAR(200)  NULL,
    [WfInstanceID] INT  NULL,
    [EmpID] INT  NULL,
    [RegularType] VARCHAR(40)  NULL,
    [RegularDate] DATE  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    CONSTRAINT [PK_eu_Emp_Regular] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

IF OBJECT_ID(N'eu_Emp_Resign',N'U') IS NOT NULL
    DROP TABLE eu_Emp_Resign;
GO
CREATE TABLE eu_Emp_Resign (
    [ID] INT IDENTITY(1,1) NOT NULL,
    [LinkUrl] VARCHAR(200)  NULL,
    [WfInstanceID] INT  NULL,
    [EmpID] INT  NULL,
    [ResignationDate] DATE  NULL,
    [ResignationType] VARCHAR(40)  NULL,
    [ResignationReason] VARCHAR(40)  NULL,
    [IsBlackList] BIT  NULL,
    [Remark] NVARCHAR(400)  NULL,
    [RegBy] INT  NULL,
    [RegTime] DATETIME  NULL,
    [Closed] BIT  NULL,
    [ClosedBy] INT  NULL,
    [ClosedTime] DATETIME  NULL,
    CONSTRAINT [PK_eu_Emp_Resign] PRIMARY KEY CLUSTERED (ID ASC)
);
GO

DELETE FROM mc_Functions WHERE ID = '1110001';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110001', 'O1110001', N'组织信息', 'SELECT a.*
FROM md_Organization a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110001';

DELETE FROM mc_FunctionTools WHERE FCID='1110001';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110001, 'T01', N'失效', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110001';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110001', N'新组织ID', 'OrgID', 'a', 'OrgID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 11, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'创建日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 15, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新是否停用', 'Disabled', 'a', 'Disabled', 0, 0, 1, NULL, 16, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新停用日期', 'DisabledDate', 'a', 'DisabledDate', 0, 0, 8, NULL, 17, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 18, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新组织路径', 'OrgPath', 'a', 'OrgPath', 0, 0, 800, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110001', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110002';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110002', 'O1110002', N'失效组织', 'SELECT a.*
FROM md_Organization a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110002';

DELETE FROM mc_FunctionTools WHERE FCID='1110002';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110002';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110002', N'新组织ID', 'OrgID', 'a', 'OrgID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 11, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'创建日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 15, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新是否停用', 'Disabled', 'a', 'Disabled', 0, 0, 1, NULL, 16, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新停用日期', 'DisabledDate', 'a', 'DisabledDate', 0, 0, 8, NULL, 17, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 18, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新组织路径', 'OrgPath', 'a', 'OrgPath', 0, 0, 800, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110002', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110003';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110003', 'O1110003', N'历史组织信息', 'SELECT a.*
FROM md_Organization_Event a
WHERE a.BeginDate <= ${QueryDate} AND (a.EndDate IS NULL OR a.EndDate >=${QueryDate})
', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110003';

INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)
VALUES('1110003','QueryDate',N'查询日期',1,'<param>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>1</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <defval><![CDATA[SELECT DATETRUNC(DAY, GETDATE())]]></defval>
</param>');
GO

DELETE FROM mc_FunctionTools WHERE FCID='1110003';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110003';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110003', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新操作记录ID，以逗号分隔', 'OperID', 'a', 'OperID', 0, 0, 2000, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'开始日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 6, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织级别名称', 'OrgGradeName', 'a', 'OrgGradeName', 0, 0, 100, NULL, 14, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 15, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织类型名称', 'OrgTypeName', 'a', 'OrgTypeName', 0, 0, 100, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 17, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新上级组织编码', 'ParentCode', 'a', 'ParentCode', 0, 0, NULL, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新上级组织名称', 'ParentTitle', 'a', 'ParentTitle', 0, 0, NULL, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 20, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 21, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110003', N'新组织路径', 'OrgPath', 'a', 'OrgPath', 0, 0, 800, NULL, 23, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110004';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110004', 'O1110004', N'月度组织信息', 'SELECT a.*
FROM md_Organization_Month a
WHERE a.Term = ${Term}
', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110004';

INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)
VALUES('1110004','Term',N'月份',1,'<param>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>1</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <defval><![CDATA[SELECT DATETRUNC(MONTH, GETDATE())]]></defval>
</param>');
GO

DELETE FROM mc_FunctionTools WHERE FCID='1110004';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110004';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110004', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新月份', 'Term', 'a', 'Term', 0, 0, 8, NULL, 2, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'开始日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 6, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织级别名称', 'OrgGradeName', 'a', 'OrgGradeName', 0, 0, 100, NULL, 14, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 15, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织类型名称', 'OrgTypeName', 'a', 'OrgTypeName', 0, 0, 100, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 17, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新上级组织编码', 'ParentCode', 'a', 'ParentCode', 0, 0, NULL, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新上级组织名称', 'ParentTitle', 'a', 'ParentTitle', 0, 0, NULL, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 20, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 21, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新Disabled', 'Disabled', 'a', 'Disabled', 0, 0, 1, NULL, 23, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新DisabledDate', 'DisabledDate', 'a', 'DisabledDate', 0, 0, 8, NULL, 24, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新组织路径', 'OrgPath', 'a', 'OrgPath', 0, 0, 800, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110004', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 27, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110005';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110005', 'O1110005', N'组织创建', 'SELECT a.*
FROM ou_Org_Operation a
WHERE a.OperType = 1
  AND a.Closed = 0
', 'SELECT 1 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110005';

DELETE FROM mc_FunctionTools WHERE FCID='1110005';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110005, 'T01', N'确认创建', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110005, 'APP01', N'组织创建历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110005';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110005', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 28, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110005', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110006';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110006', 'O1110006', N'组织变更', 'SELECT a.*
FROM ou_Org_Operation a
WHERE a.OperType = 2
  AND a.Closed = 0
', 'SELECT 2 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110006';

DELETE FROM mc_FunctionTools WHERE FCID='1110006';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110006, 'T01', N'确认变更', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110006, 'APP01', N'组织变更历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110006';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110006', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原组织名称', 'Old_Title', 'a', 'Old_Title', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原组织级别', 'Old_OrgGrade', 'a', 'Old_OrgGrade', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原组织类型', 'Old_OrgType', 'a', 'Old_OrgType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原上级组织', 'Old_ParentID', 'a', 'Old_ParentID', 0, 0, 8, NULL, 21, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原组织负责人', 'Old_Leader1', 'a', 'Old_Leader1', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原职能负责人', 'Old_Leader2', 'a', 'Old_Leader2', 0, 0, 8, NULL, 25, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'原分管领导', 'Old_Leader3', 'a', 'Old_Leader3', 0, 0, 8, NULL, 27, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 28, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110006', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110007';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110007', 'O1110007', N'组织失效', 'SELECT a.*
FROM ou_Org_Operation a
WHERE a.OperType = 3
  AND a.Closed = 0
', 'SELECT 3 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110007';

DELETE FROM mc_FunctionTools WHERE FCID='1110007';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110007, 'T01', N'确认失效', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110007, 'APP01', N'组织失效历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110007';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110007', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 28, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110007', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110008';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110008', 'O1110008', N'组织合并', 'SELECT a.*
FROM ou_Org_Operation a
WHERE a.OperType = 4
  AND a.Closed = 0
', 'SELECT 4 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110008';

DELETE FROM mc_FunctionTools WHERE FCID='1110008';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110008, 'T01', N'确认合并', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110008, 'APP01', N'组织合并历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110008';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110008', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 28, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110008', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110009';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110009', 'O1110009', N'组织操作历史', 'SELECT a.*
FROM ou_Org_Operation a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110009';

DELETE FROM mc_FunctionTools WHERE FCID='1110009';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110009';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110009', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新组织ID', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原组织名称', 'Old_Title', 'a', 'Old_Title', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新组织名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原组织级别', 'Old_OrgGrade', 'a', 'Old_OrgGrade', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新组织级别', 'OrgGrade', 'a', 'OrgGrade', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原组织类型', 'Old_OrgType', 'a', 'Old_OrgType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新组织类型', 'OrgType', 'a', 'OrgType', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OrgType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原上级组织', 'Old_ParentID', 'a', 'Old_ParentID', 0, 0, 8, NULL, 21, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新上级组织', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原组织负责人', 'Old_Leader1', 'a', 'Old_Leader1', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新组织负责人', 'Leader1', 'a', 'Leader1', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader1</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原职能负责人', 'Old_Leader2', 'a', 'Old_Leader2', 0, 0, 8, NULL, 25, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新职能负责人', 'Leader2', 'a', 'Leader2', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader2</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'原分管领导', 'Old_Leader3', 'a', 'Old_Leader3', 0, 0, 8, NULL, 27, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新分管领导', 'Leader3', 'a', 'Leader3', 0, 0, 8, NULL, 28, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Leader3</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110009', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110010';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110010', 'O1110010', N'岗位信息', 'SELECT a.*
FROM md_Position a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110010';

DELETE FROM mc_FunctionTools WHERE FCID='1110010';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110010, 'T01', N'失效', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110010';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110010', N'新岗位ID', 'PosID', 'a', 'PosID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'创建日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 12, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新是否停用', 'Disabled', 'a', 'Disabled', 0, 0, 1, NULL, 13, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新停用日期', 'DisabledDate', 'a', 'DisabledDate', 0, 0, 8, NULL, 14, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110010', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110011';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110011', 'O1110011', N'失效岗位', 'SELECT a.*
FROM md_Position a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110011';

DELETE FROM mc_FunctionTools WHERE FCID='1110011';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110011';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110011', N'新岗位ID', 'PosID', 'a', 'PosID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'创建日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 12, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新是否停用', 'Disabled', 'a', 'Disabled', 0, 0, 1, NULL, 13, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新停用日期', 'DisabledDate', 'a', 'DisabledDate', 0, 0, 8, NULL, 14, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110011', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110012';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110012', 'O1110012', N'历史岗位信息', 'SELECT a.*
FROM md_Position_Event a
WHERE a.BeginDate <= ${QueryDate} AND (a.EndDate IS NULL OR a.EndDate >=${QueryDate})
', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110012';

INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)
VALUES('1110012','QueryDate',N'查询日期',1,'<param>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>1</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <defval><![CDATA[SELECT DATETRUNC(DAY, GETDATE())]]></defval>
</param>');
GO

DELETE FROM mc_FunctionTools WHERE FCID='1110012';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110012';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110012', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新操作记录ID，以逗号分隔', 'OperID', 'a', 'OperID', 0, 0, 2000, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位ID', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'开始日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 6, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位类型名称', 'PosTypeName', 'a', 'PosTypeName', 0, 0, 100, NULL, 14, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 15, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位级别名称', 'PosLevelName', 'a', 'PosLevelName', 0, 0, 100, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110012', N'新岗位等级名称', 'PosGradeName', 'a', 'PosGradeName', 0, 0, 100, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110013';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110013', 'O1110013', N'月度岗位信息', 'SELECT a.*
FROM md_Position_Month a
WHERE a.Term = ${Term}
', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110013';

INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)
VALUES('1110013','Term',N'月份',1,'<param>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>1</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <defval><![CDATA[SELECT DATETRUNC(MONTH, GETDATE())]]></defval>
</param>');
GO

DELETE FROM mc_FunctionTools WHERE FCID='1110013';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110013';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110013', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新月份', 'Term', 'a', 'Term', 0, 0, 8, NULL, 2, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位ID', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'开始日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 6, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位类型名称', 'PosTypeName', 'a', 'PosTypeName', 0, 0, 100, NULL, 14, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 15, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位级别名称', 'PosLevelName', 'a', 'PosLevelName', 0, 0, 100, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新岗位等级名称', 'PosGradeName', 'a', 'PosGradeName', 0, 0, 100, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新Disabled', 'Disabled', 'a', 'Disabled', 0, 0, 1, NULL, 19, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新DisabledDate', 'DisabledDate', 'a', 'DisabledDate', 0, 0, 8, NULL, 20, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 21, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110013', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110014';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110014', 'O1110014', N'岗位创建', 'SELECT a.*
FROM ou_Pos_Operation a
WHERE a.OperType = 1
  AND a.Closed = 0
', 'SELECT 1 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110014';

DELETE FROM mc_FunctionTools WHERE FCID='1110014';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110014, 'T01', N'确认创建', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110014, 'APP01', N'岗位创建历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110014';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110014', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新岗位ID', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 23, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 28, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 29, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110014', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 30, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110015';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110015', 'O1110015', N'岗位变更', 'SELECT a.*
FROM ou_Pos_Operation a
WHERE a.OperType = 2
  AND a.Closed = 0
', 'SELECT 2 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110015';

DELETE FROM mc_FunctionTools WHERE FCID='1110015';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110015, 'T01', N'确认变更', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110015, 'APP01', N'岗位变更历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110015';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110015', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新岗位ID', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'原岗位名称', 'Old_Title', 'a', 'Old_Title', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'原岗位类型', 'Old_PosType', 'a', 'Old_PosType', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'原岗位层级', 'Old_PosLevel', 'a', 'Old_PosLevel', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'原岗位等级', 'Old_PosGrade', 'a', 'Old_PosGrade', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 23, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 28, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 29, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110015', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 30, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110016';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110016', 'O1110016', N'岗位失效', 'SELECT a.*
FROM ou_Pos_Operation a
WHERE a.OperType = 3
  AND a.Closed = 0
', 'SELECT 3 AS OperType, ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110016';

DELETE FROM mc_FunctionTools WHERE FCID='1110016';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110016, 'T01', N'确认失效', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1110016, 'APP01', N'岗位失效历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110016';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110016', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新岗位ID', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 23, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 28, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 29, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110016', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 30, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1110017';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1110017', 'O1110017', N'岗位操作历史', 'SELECT a.*
FROM ou_Pos_Operation a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1110017';

DELETE FROM mc_FunctionTools WHERE FCID='1110017';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1110017';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1110017', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'操作类型', 'OperType', 'a', 'OperType', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OperType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新岗位ID', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'原岗位名称', 'Old_Title', 'a', 'Old_Title', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新岗位名称', 'Title', 'a', 'Title', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'原岗位类型', 'Old_PosType', 'a', 'Old_PosType', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新岗位类型', 'PosType', 'a', 'PosType', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'原岗位层级', 'Old_PosLevel', 'a', 'Old_PosLevel', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新岗位层级', 'PosLevel', 'a', 'PosLevel', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'原岗位等级', 'Old_PosGrade', 'a', 'Old_PosGrade', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新岗位等级', 'PosGrade', 'a', 'PosGrade', 0, 0, 40, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PosGrade</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'生效日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 23, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新排序号', 'OrderNo', 'a', 'OrderNo', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 26, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 28, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 29, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1110017', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 30, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120001';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120001', 'E1120001', N'在职员工', 'SELECT a.*
FROM md_Employee a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120001';

DELETE FROM mc_FunctionTools WHERE FCID='1120001';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120001, 'APP01', N'员工生命周期', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120001, 'APP02', N'员工履历表', 'popapp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120001, 'APP03', N'在职证明', 'popapp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120001';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120001', N'员工ID', 'EmpID', 'a', 'EmpID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新Title', 'Title', 'a', 'Title', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 16, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新员工状态', 'EmploymentStatus', 'a', 'EmploymentStatus', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新员工类型', 'EmployeeType', 'a', 'EmployeeType', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新员工性质', 'EmploymentType', 'a', 'EmploymentType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新员工类别', 'EmployeeCategory', 'a', 'EmployeeCategory', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeCategory</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新职级', 'EmployeeLevel', 'a', 'EmployeeLevel', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新入职日期', 'JoinDate', 'a', 'JoinDate', 0, 0, 8, NULL, 22, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 24, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新转正日期', 'RegularDate', 'a', 'RegularDate', 0, 0, 8, NULL, 25, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 26, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新实习转正日期', 'InternToRegDate', 'a', 'InternToRegDate', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新首次合同签订日期', 'FirstContractDate', 'a', 'FirstContractDate', 0, 0, 8, NULL, 28, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 29, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新合同编号', 'ContractNo', 'a', 'ContractNo', 0, 0, 40, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新合同期', 'ContractTerm', 'a', 'ContractTerm', 0, 0, 8, NULL, 34, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新合同签订次数', 'ContractCount', 'a', 'ContractCount', 0, 0, 8, NULL, 36, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 37, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 38, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 39, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 40, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 41, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 42, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 44, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 45, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 46, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 47, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 48, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 49, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 50, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 51, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 52, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 53, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新入党时间', 'PartyJoinDate', 'a', 'PartyJoinDate', 0, 0, 8, NULL, 54, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 57, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 58, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 59, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 60, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 61, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 62, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新AD账号', 'ADAccount', 'a', 'ADAccount', 0, 0, 40, NULL, 63, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新公司邮箱', 'EmailWork', 'a', 'EmailWork', 0, 0, 40, NULL, 64, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120001', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 65, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120002';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120002', 'E1120002', N'离职员工', 'SELECT a.*
FROM md_Employee_Event a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120002';

DELETE FROM mc_FunctionTools WHERE FCID='1120002';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120002, 'APP01', N'员工生命周期', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120002, 'APP02', N'员工履历表', 'popapp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120002, 'APP03', N'离职证明', 'popapp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120002';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120002', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新操作记录ID，以逗号分隔', 'OperID', 'a', 'OperID', 0, 0, 2000, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'开始日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 4, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 6, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新组织名称', 'OrgName', 'a', 'OrgName', 0, 0, 100, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 9, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新岗位名称', 'PosName', 'a', 'PosName', 0, 0, 100, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新职位代码', 'JobCode', 'a', 'JobCode', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新职位名称', 'JobName', 'a', 'JobName', 0, 0, 100, NULL, 14, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 16, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工状态', 'EmploymentStatus', 'a', 'EmploymentStatus', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工状态名称', 'EmploymentStatusName', 'a', 'EmploymentStatusName', 0, 0, 100, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工类型', 'EmployeeType', 'a', 'EmployeeType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工类型名称', 'EmployeeTypeName', 'a', 'EmployeeTypeName', 0, 0, 100, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工性质', 'EmploymentType', 'a', 'EmploymentType', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工性质名称', 'EmploymentTypeName', 'a', 'EmploymentTypeName', 0, 0, 100, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工类别', 'EmployeeCategory', 'a', 'EmployeeCategory', 0, 0, 40, NULL, 23, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeCategory</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新员工类别名称', 'EmployeeCategoryName', 'a', 'EmployeeCategoryName', 0, 0, 100, NULL, 24, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新职级', 'EmployeeLevel', 'a', 'EmployeeLevel', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新职级名称', 'EmployeeLevelName', 'a', 'EmployeeLevelName', 0, 0, 100, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 27, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 28, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 34, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新合同签订次数', 'ContractCount', 'a', 'ContractCount', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 36, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 37, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120002', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 38, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120003';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120003', 'E1120003', N'所有员工', 'SELECT a.*
FROM md_Employee a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120003';

DELETE FROM mc_FunctionTools WHERE FCID='1120003';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120003, 'APP01', N'员工生命周期', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120003, 'APP02', N'员工履历表', 'popapp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120003, 'APP03', N'员工信息修改', 'popapp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120003';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120003', N'员工ID', 'EmpID', 'a', 'EmpID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 3, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新Title', 'Title', 'a', 'Title', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 16, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新员工状态', 'EmploymentStatus', 'a', 'EmploymentStatus', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新员工类型', 'EmployeeType', 'a', 'EmployeeType', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新员工性质', 'EmploymentType', 'a', 'EmploymentType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新员工类别', 'EmployeeCategory', 'a', 'EmployeeCategory', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeCategory</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新职级', 'EmployeeLevel', 'a', 'EmployeeLevel', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新入职日期', 'JoinDate', 'a', 'JoinDate', 0, 0, 8, NULL, 22, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 24, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新转正日期', 'RegularDate', 'a', 'RegularDate', 0, 0, 8, NULL, 25, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 26, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新实习转正日期', 'InternToRegDate', 'a', 'InternToRegDate', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新首次合同签订日期', 'FirstContractDate', 'a', 'FirstContractDate', 0, 0, 8, NULL, 28, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 29, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新合同编号', 'ContractNo', 'a', 'ContractNo', 0, 0, 40, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新合同期', 'ContractTerm', 'a', 'ContractTerm', 0, 0, 8, NULL, 34, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新合同签订次数', 'ContractCount', 'a', 'ContractCount', 0, 0, 8, NULL, 36, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 37, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 38, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 39, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 40, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 41, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 42, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 44, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 45, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 46, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 47, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 48, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 49, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 50, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 51, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 52, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 53, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新入党时间', 'PartyJoinDate', 'a', 'PartyJoinDate', 0, 0, 8, NULL, 54, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 57, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 58, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 59, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 60, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 61, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 62, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新AD账号', 'ADAccount', 'a', 'ADAccount', 0, 0, 40, NULL, 63, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新公司邮箱', 'EmailWork', 'a', 'EmailWork', 0, 0, 40, NULL, 64, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120003', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 65, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120004';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120004', 'E1120004', N'历史员工信息', 'SELECT a.*
FROM md_Employee_Event a
WHERE a.BeginDate <= ${QueryDate} AND (a.EndDate IS NULL OR a.EndDate >=${QueryDate})
', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120004';

INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)
VALUES('1120004','QueryDate',N'查询日期',1,'<param>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>1</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <defval><![CDATA[SELECT DATETRUNC(DAY, GETDATE())]]></defval>
</param>');
GO

DELETE FROM mc_FunctionTools WHERE FCID='1120004';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120004';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120004', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新操作记录ID，以逗号分隔', 'OperID', 'a', 'OperID', 0, 0, 2000, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'开始日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 4, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 6, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新组织名称', 'OrgName', 'a', 'OrgName', 0, 0, 100, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 9, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新岗位名称', 'PosName', 'a', 'PosName', 0, 0, 100, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新职位代码', 'JobCode', 'a', 'JobCode', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新职位名称', 'JobName', 'a', 'JobName', 0, 0, 100, NULL, 14, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 16, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工状态', 'EmploymentStatus', 'a', 'EmploymentStatus', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工状态名称', 'EmploymentStatusName', 'a', 'EmploymentStatusName', 0, 0, 100, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工类型', 'EmployeeType', 'a', 'EmployeeType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工类型名称', 'EmployeeTypeName', 'a', 'EmployeeTypeName', 0, 0, 100, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工性质', 'EmploymentType', 'a', 'EmploymentType', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工性质名称', 'EmploymentTypeName', 'a', 'EmploymentTypeName', 0, 0, 100, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工类别', 'EmployeeCategory', 'a', 'EmployeeCategory', 0, 0, 40, NULL, 23, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeCategory</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新员工类别名称', 'EmployeeCategoryName', 'a', 'EmployeeCategoryName', 0, 0, 100, NULL, 24, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新职级', 'EmployeeLevel', 'a', 'EmployeeLevel', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新职级名称', 'EmployeeLevelName', 'a', 'EmployeeLevelName', 0, 0, 100, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 27, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 28, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 30, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 34, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新合同签订次数', 'ContractCount', 'a', 'ContractCount', 0, 0, 8, NULL, 35, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 36, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 37, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120004', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 38, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120005';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120005', 'E1120005', N'月度员工信息', 'SELECT a.*
FROM md_Employee_Month a
WHERE a.Term = ${Term}
', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120005';

INSERT INTO mc_FunctionParams(FCID, Code, Title, xOrder, Attribute)
VALUES('1120005','Term',N'月份',1,'<param>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>1</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <defval><![CDATA[SELECT DATETRUNC(MONTH, GETDATE())]]></defval>
</param>');
GO

DELETE FROM mc_FunctionTools WHERE FCID='1120005';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120005';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120005', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新月份', 'Term', 'a', 'Term', 0, 0, 8, NULL, 2, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新Title', 'Title', 'a', 'Title', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 13, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'组织编码', 'OrgCode', 'a', 'OrgCode', 0, 0, 40, NULL, 15, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新组织名称', 'OrgName', 'a', 'OrgName', 0, 0, 100, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 17, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新岗位编码', 'PosCode', 'a', 'PosCode', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新岗位名称', 'PosName', 'a', 'PosName', 0, 0, 100, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 20, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新职位代码', 'JobCode', 'a', 'JobCode', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新职位名称', 'JobName', 'a', 'JobName', 0, 0, 100, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 24, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工状态', 'EmploymentStatus', 'a', 'EmploymentStatus', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工状态名称', 'EmploymentStatusName', 'a', 'EmploymentStatusName', 0, 0, 100, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工类型', 'EmployeeType', 'a', 'EmployeeType', 0, 0, 40, NULL, 27, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工类型名称', 'EmployeeTypeName', 'a', 'EmployeeTypeName', 0, 0, 100, NULL, 28, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工性质', 'EmploymentType', 'a', 'EmploymentType', 0, 0, 40, NULL, 29, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmploymentType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工性质名称', 'EmploymentTypeName', 'a', 'EmploymentTypeName', 0, 0, 100, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工类别', 'EmployeeCategory', 'a', 'EmployeeCategory', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeCategory</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新员工类别名称', 'EmployeeCategoryName', 'a', 'EmployeeCategoryName', 0, 0, 100, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新职级', 'EmployeeLevel', 'a', 'EmployeeLevel', 0, 0, 40, NULL, 33, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmployeeLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新职级名称', 'EmployeeLevelName', 'a', 'EmployeeLevelName', 0, 0, 100, NULL, 34, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新入职日期', 'JoinDate', 'a', 'JoinDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 36, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 37, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新转正日期', 'RegularDate', 'a', 'RegularDate', 0, 0, 8, NULL, 38, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 39, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新实习转正日期', 'InternToRegDate', 'a', 'InternToRegDate', 0, 0, 8, NULL, 40, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新首次合同签订日期', 'FirstContractDate', 'a', 'FirstContractDate', 0, 0, 8, NULL, 41, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 42, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 44, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新合同编号', 'ContractNo', 'a', 'ContractNo', 0, 0, 40, NULL, 45, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 46, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新合同期', 'ContractTerm', 'a', 'ContractTerm', 0, 0, 8, NULL, 47, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 48, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新合同签订次数', 'ContractCount', 'a', 'ContractCount', 0, 0, 8, NULL, 49, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 50, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 51, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 52, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 53, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 54, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 57, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 58, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 59, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 60, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 61, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 62, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 63, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 64, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 65, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 66, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新入党时间', 'PartyJoinDate', 'a', 'PartyJoinDate', 0, 0, 8, NULL, 67, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 68, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 69, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 70, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 71, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 72, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 73, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 74, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 75, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新AD账号', 'ADAccount', 'a', 'ADAccount', 0, 0, 40, NULL, 76, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新公司邮箱', 'EmailWork', 'a', 'EmailWork', 0, 0, 40, NULL, 77, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120005', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 78, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120006';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120006', 'E1120006', N'预入职登记', 'SELECT a.*
FROM eu_Pre_EmpInfo a
WHERE a.Closed = 0
', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed, 0 AS Canceled, 0 AS Offered, 0 AS Submit, 0 AS Rejected', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120006';

DELETE FROM mc_FunctionTools WHERE FCID='1120006';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'T01', N'发送录用流程', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'T02', N'发送Offer', 'execsp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'T03', N'退回候选人补充资料', 'execsp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'T04', N'转入职管理', 'execsp', 4, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'APP01', N'查看流程', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'APP02', N'采集信息查看', 'popapp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'APP03', N'入职登记表', 'popapp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120006, 'APP04', N'预入职历史', 'popapp', 4, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120006';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120006', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新入职状态', 'OnboardingStatus', 'a', 'OnboardingStatus', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OnboardingStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新入职次数', 'OnboardingCnt', 'a', 'OnboardingCnt', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新预入职登录ID', 'ApplyID', 'a', 'ApplyID', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 6, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新姓名', 'Title', 'a', 'Title', 0, 0, 100, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 21, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 22, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 23, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 24, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 28, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 29, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新最高学历', 'EduLevel', 'a', 'EduLevel', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EduLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新最高学位', 'EduDegree', 'a', 'EduDegree', 0, 0, 40, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EduDegree</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新专业', 'Major', 'a', 'Major', 0, 0, 100, NULL, 33, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新毕业学校', 'GradSchool', 'a', 'GradSchool', 0, 0, 100, NULL, 34, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新毕业日期', 'GraduationDate', 'a', 'GraduationDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新学习形式', 'StudyMode', 'a', 'StudyMode', 0, 0, 40, NULL, 36, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>StudyMode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新紧急联系人姓名', 'EmgContactName', 'a', 'EmgContactName', 0, 0, 100, NULL, 37, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新紧急联系人电话', 'EmgContactPhone', 'a', 'EmgContactPhone', 0, 0, 40, NULL, 38, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新紧急联系人与本人关系', 'EmgContactRelation', 'a', 'EmgContactRelation', 0, 0, 40, NULL, 39, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmgContactRelation</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 40, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 41, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 42, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 44, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新拟入职日期', 'JoinDate', 'a', 'JoinDate', 0, 0, 8, NULL, 45, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 46, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 47, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 48, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 49, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 50, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 51, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 52, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 53, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 54, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 57, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 58, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 59, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 60, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 61, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 62, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 63, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新Canceled', 'Canceled', 'a', 'Canceled', 0, 0, 1, NULL, 64, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新CanceledBy', 'CanceledBy', 'a', 'CanceledBy', 0, 0, 8, NULL, 65, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>CanceledBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新取消操作时间', 'CanceledTime', 'a', 'CanceledTime', 0, 0, 8, NULL, 66, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新CancelReason', 'CancelReason', 'a', 'CancelReason', 0, 0, 400, NULL, 67, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新Offered', 'Offered', 'a', 'Offered', 0, 0, 1, NULL, 68, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新OfferedBy', 'OfferedBy', 'a', 'OfferedBy', 0, 0, 8, NULL, 69, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OfferedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新Offer发送时间', 'OfferedTime', 'a', 'OfferedTime', 0, 0, 8, NULL, 70, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新是否提交', 'Submit', 'a', 'Submit', 0, 0, 1, NULL, 71, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新提交时间', 'SubmitTime', 'a', 'SubmitTime', 0, 0, 8, NULL, 72, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新是否退回', 'Rejected', 'a', 'Rejected', 0, 0, 1, NULL, 73, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新退回人', 'RejectedBy', 'a', 'RejectedBy', 0, 0, 8, NULL, 74, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RejectedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120006', N'新退回时间', 'RejectedTime', 'a', 'RejectedTime', 0, 0, 8, NULL, 75, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120007';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120007', 'E1120007', N'预入职历史', 'SELECT a.*
FROM eu_Pre_EmpInfo a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120007';

DELETE FROM mc_FunctionTools WHERE FCID='1120007';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120007';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120007', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新入职状态', 'OnboardingStatus', 'a', 'OnboardingStatus', 0, 0, 40, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>OnboardingStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新入职次数', 'OnboardingCnt', 'a', 'OnboardingCnt', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新预入职登录ID', 'ApplyID', 'a', 'ApplyID', 0, 0, 100, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 6, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新姓名', 'Title', 'a', 'Title', 0, 0, 100, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 21, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 22, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 23, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 24, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 27, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 28, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 29, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新最高学历', 'EduLevel', 'a', 'EduLevel', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EduLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新最高学位', 'EduDegree', 'a', 'EduDegree', 0, 0, 40, NULL, 32, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EduDegree</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新专业', 'Major', 'a', 'Major', 0, 0, 100, NULL, 33, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新毕业学校', 'GradSchool', 'a', 'GradSchool', 0, 0, 100, NULL, 34, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新毕业日期', 'GraduationDate', 'a', 'GraduationDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新学习形式', 'StudyMode', 'a', 'StudyMode', 0, 0, 40, NULL, 36, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>StudyMode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新紧急联系人姓名', 'EmgContactName', 'a', 'EmgContactName', 0, 0, 100, NULL, 37, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新紧急联系人电话', 'EmgContactPhone', 'a', 'EmgContactPhone', 0, 0, 40, NULL, 38, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新紧急联系人与本人关系', 'EmgContactRelation', 'a', 'EmgContactRelation', 0, 0, 40, NULL, 39, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EmgContactRelation</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 40, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 41, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 42, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 44, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新拟入职日期', 'JoinDate', 'a', 'JoinDate', 0, 0, 8, NULL, 45, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 46, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 47, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 48, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 49, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 50, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 51, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 52, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 53, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 54, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 57, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 58, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 59, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 60, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 61, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 62, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 63, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新Canceled', 'Canceled', 'a', 'Canceled', 0, 0, 1, NULL, 64, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新CanceledBy', 'CanceledBy', 'a', 'CanceledBy', 0, 0, 8, NULL, 65, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>CanceledBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新取消操作时间', 'CanceledTime', 'a', 'CanceledTime', 0, 0, 8, NULL, 66, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新CancelReason', 'CancelReason', 'a', 'CancelReason', 0, 0, 400, NULL, 67, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新Offered', 'Offered', 'a', 'Offered', 0, 0, 1, NULL, 68, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新OfferedBy', 'OfferedBy', 'a', 'OfferedBy', 0, 0, 8, NULL, 69, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OfferedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新Offer发送时间', 'OfferedTime', 'a', 'OfferedTime', 0, 0, 8, NULL, 70, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新是否提交', 'Submit', 'a', 'Submit', 0, 0, 1, NULL, 71, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新提交时间', 'SubmitTime', 'a', 'SubmitTime', 0, 0, 8, NULL, 72, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新是否退回', 'Rejected', 'a', 'Rejected', 0, 0, 1, NULL, 73, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新退回人', 'RejectedBy', 'a', 'RejectedBy', 0, 0, 8, NULL, 74, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RejectedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120007', N'新退回时间', 'RejectedTime', 'a', 'RejectedTime', 0, 0, 8, NULL, 75, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120008';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120008', 'E1120008', N'员工入职', 'SELECT a.*
FROM eu_Onboarding a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120008';

DELETE FROM mc_FunctionTools WHERE FCID='1120008';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120008, 'T01', N'生成工号', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120008, 'T02', N'发送入职流程', 'execsp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120008, 'T03', N'入职处理', 'execsp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120008, 'APP01', N'查看流程', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120008, 'APP02', N'入职背景信息', 'popapp', 2, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120008, 'APP03', N'入职历史', 'popapp', 3, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120008';
GO

DELETE FROM mc_Functions WHERE ID = '1120009';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120009', 'E1120009', N'入职历史', 'SELECT a.*
FROM eu_Onboarding a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120009';

DELETE FROM mc_FunctionTools WHERE FCID='1120009';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120009';
GO

DELETE FROM mc_Functions WHERE ID = '1120010';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120010', 'E1120010', N'入职填写-教育经历', 'SELECT a.*
FROM eu_Onboard_Education a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120010';

DELETE FROM mc_FunctionTools WHERE FCID='1120010';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120010';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120010', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新预入职登记表ID', 'PreOnboardingID', 'a', 'PreOnboardingID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新入职登记表ID', 'OnboardID', 'a', 'OnboardID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新开始时间', 'StartDate', 'a', 'StartDate', 0, 0, 8, NULL, 4, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新结束时间', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新学校', 'School', 'a', 'School', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新专业', 'Major', 'a', 'Major', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新最高学历', 'EduLevel', 'a', 'EduLevel', 0, 0, 40, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EduLevel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新最高学位', 'EduDegree', 'a', 'EduDegree', 0, 0, 40, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>EduDegree</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新是否最高学历', 'IsHighest', 'a', 'IsHighest', 0, 0, 1, NULL, 10, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新学习形式', 'StudyMode', 'a', 'StudyMode', 0, 0, 40, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>StudyMode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120010', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 12, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120011';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120011', 'E1120011', N'入职填写-工作经历', 'SELECT a.*
FROM eu_Onboard_WorkExp a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120011';

DELETE FROM mc_FunctionTools WHERE FCID='1120011';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120011';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120011', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新预入职登记表ID', 'PreOnboardingID', 'a', 'PreOnboardingID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新入职登记表ID', 'OnboardID', 'a', 'OnboardID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新开始日期', 'StartDate', 'a', 'StartDate', 0, 0, 8, NULL, 4, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新结束日期', 'EndDate', 'a', 'EndDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新公司名称', 'Company', 'a', 'Company', 0, 0, 100, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新岗位名称', 'Position', 'a', 'Position', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新离职原因', 'ResignationReason', 'a', 'ResignationReason', 0, 0, 40, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResignationReason</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新税前薪资', 'GrossSalary', 'a', 'GrossSalary', 0, 0, 100, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新证明人姓名', 'RefereeName', 'a', 'RefereeName', 0, 0, 100, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新证明人电话', 'RefereePhone', 'a', 'RefereePhone', 0, 0, 40, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120011', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 12, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120012';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120012', 'E1120012', N'入职填写-家庭成员', 'SELECT a.*
FROM eu_Onboard_Family a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120012';

DELETE FROM mc_FunctionTools WHERE FCID='1120012';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120012';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120012', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新预入职登记表ID', 'PreOnboardingID', 'a', 'PreOnboardingID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新入职登记表ID', 'OnboardID', 'a', 'OnboardID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新姓名', 'Name', 'a', 'Name', 0, 0, 100, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新与本人关系', 'Relations', 'a', 'Relations', 0, 0, 40, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Relations</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新公司名称', 'Company', 'a', 'Company', 0, 0, 100, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新是否为紧急联系人', 'IsEmgContact', 'a', 'IsEmgContact', 0, 0, 1, NULL, 9, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120012', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120013';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120013', 'E1120013', N'入职填写-资格证书', 'SELECT a.*
FROM None a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120013';

DELETE FROM mc_FunctionTools WHERE FCID='1120013';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120013';
GO

DELETE FROM mc_Functions WHERE ID = '1120014';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120014', 'E1120014', N'入职填写-附件信息', 'SELECT a.*
FROM eu_Onboard_Attachments a', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120014';

DELETE FROM mc_FunctionTools WHERE FCID='1120014';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120014';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120014', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120014', N'新预入职登记表ID', 'PreOnboardingID', 'a', 'PreOnboardingID', 0, 0, 8, NULL, 2, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120014', N'新入职登记表ID', 'OnboardID', 'a', 'OnboardID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120014', N'新附件类型', 'AttachmentType', 'a', 'AttachmentType', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>AttachmentType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120014', N'新附件', 'Attachment', 'a', 'Attachment', 0, 0, 2000, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>Attachment</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120015';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120015', 'E1120015', N'基础信息变更', 'SELECT a.*
FROM eu_Emp_InfoChange a
WHERE a.Closed = 0
', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120015';

DELETE FROM mc_FunctionTools WHERE FCID='1120015';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120015, 'T01', N'确认变更', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120015, 'APP01', N'基础信息变更历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120015';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120015', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 4, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原姓', 'Old_LastName', 'a', 'Old_LastName', 0, 0, 20, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原名', 'Old_FirstName', 'a', 'Old_FirstName', 0, 0, 80, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原姓名', 'Old_Title', 'a', 'Old_Title', 0, 0, 100, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新姓名', 'Title', 'a', 'Title', 0, 0, 100, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原性别', 'Old_Gender', 'a', 'Old_Gender', 0, 0, 40, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 23, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原国籍', 'Old_Nationality', 'a', 'Old_Nationality', 0, 0, 40, NULL, 24, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原民族', 'Old_Ethnicity', 'a', 'Old_Ethnicity', 0, 0, 40, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 27, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原证件类型', 'Old_IDType', 'a', 'Old_IDType', 0, 0, 40, NULL, 28, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 29, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原证件号码', 'Old_IDNo', 'a', 'Old_IDNo', 0, 0, 40, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原证件有效开始日期', 'Old_IDStartDate', 'a', 'Old_IDStartDate', 0, 0, 8, NULL, 32, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原证件是否长期有效', 'Old_IsPermanent', 'a', 'Old_IsPermanent', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 35, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原证件有效截止日期', 'Old_IDEndDate', 'a', 'Old_IDEndDate', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 37, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原出生日期', 'Old_BirthDate', 'a', 'Old_BirthDate', 0, 0, 8, NULL, 38, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 39, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原手机号码', 'Old_MobileNo', 'a', 'Old_MobileNo', 0, 0, 40, NULL, 40, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 41, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原个人邮箱', 'Old_EmailPersonal', 'a', 'Old_EmailPersonal', 0, 0, 40, NULL, 42, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原参加工作日期', 'Old_FirstWorkDate', 'a', 'Old_FirstWorkDate', 0, 0, 8, NULL, 44, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 45, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原婚姻状况', 'Old_MaritalStatus', 'a', 'Old_MaritalStatus', 0, 0, 40, NULL, 46, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 47, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原生育状况', 'Old_FertilityStatus', 'a', 'Old_FertilityStatus', 0, 0, 40, NULL, 48, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 49, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原政治面貌', 'Old_PoliticalStatus', 'a', 'Old_PoliticalStatus', 0, 0, 40, NULL, 50, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 51, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原入党时间', 'Old_PartyJoinDate', 'a', 'Old_PartyJoinDate', 0, 0, 8, NULL, 52, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新入党时间', 'PartyJoinDate', 'a', 'PartyJoinDate', 0, 0, 8, NULL, 53, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原籍贯', 'Old_NativePlace', 'a', 'Old_NativePlace', 0, 0, 40, NULL, 54, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原籍贯详细地址', 'Old_NativePlaceAddr', 'a', 'Old_NativePlaceAddr', 0, 0, 100, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 57, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原现居住地', 'Old_CurrentResidence', 'a', 'Old_CurrentResidence', 0, 0, 40, NULL, 58, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 59, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原现居住地详细地址', 'Old_CurrResAddr', 'a', 'Old_CurrResAddr', 0, 0, 100, NULL, 60, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 61, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原户籍性质', 'Old_ResidenceType', 'a', 'Old_ResidenceType', 0, 0, 40, NULL, 62, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 63, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原开户银行', 'Old_BankCode', 'a', 'Old_BankCode', 0, 0, 40, NULL, 64, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 65, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原支行名称', 'Old_BankBranchName', 'a', 'Old_BankBranchName', 0, 0, 100, NULL, 66, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 67, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'原银行卡号', 'Old_BankAccountNo', 'a', 'Old_BankAccountNo', 0, 0, 40, NULL, 68, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 69, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 70, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 71, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 72, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 73, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 74, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120015', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 75, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120016';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120016', 'E1120016', N'基础信息变更历史', 'SELECT a.*
FROM eu_Emp_InfoChange a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120016';

DELETE FROM mc_FunctionTools WHERE FCID='1120016';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120016';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120016', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 4, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新工号', 'EmpNo', 'a', 'EmpNo', 0, 0, 20, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原姓', 'Old_LastName', 'a', 'Old_LastName', 0, 0, 20, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新姓', 'LastName', 'a', 'LastName', 0, 0, 20, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原名', 'Old_FirstName', 'a', 'Old_FirstName', 0, 0, 80, NULL, 8, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新名', 'FirstName', 'a', 'FirstName', 0, 0, 80, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原姓名', 'Old_Title', 'a', 'Old_Title', 0, 0, 100, NULL, 10, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新姓名', 'Title', 'a', 'Title', 0, 0, 100, NULL, 11, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>MultiLang</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原性别', 'Old_Gender', 'a', 'Old_Gender', 0, 0, 40, NULL, 22, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新性别', 'Gender', 'a', 'Gender', 0, 0, 40, NULL, 23, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Gender</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原国籍', 'Old_Nationality', 'a', 'Old_Nationality', 0, 0, 40, NULL, 24, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新国籍', 'Nationality', 'a', 'Nationality', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Nationality</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原民族', 'Old_Ethnicity', 'a', 'Old_Ethnicity', 0, 0, 40, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新民族', 'Ethnicity', 'a', 'Ethnicity', 0, 0, 40, NULL, 27, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Ethnicity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原证件类型', 'Old_IDType', 'a', 'Old_IDType', 0, 0, 40, NULL, 28, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新证件类型', 'IDType', 'a', 'IDType', 0, 0, 40, NULL, 29, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>IDType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原证件号码', 'Old_IDNo', 'a', 'Old_IDNo', 0, 0, 40, NULL, 30, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新证件号码', 'IDNo', 'a', 'IDNo', 0, 0, 40, NULL, 31, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原证件有效开始日期', 'Old_IDStartDate', 'a', 'Old_IDStartDate', 0, 0, 8, NULL, 32, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新证件有效开始日期', 'IDStartDate', 'a', 'IDStartDate', 0, 0, 8, NULL, 33, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原证件是否长期有效', 'Old_IsPermanent', 'a', 'Old_IsPermanent', 0, 0, 1, NULL, 34, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新证件是否长期有效', 'IsPermanent', 'a', 'IsPermanent', 0, 0, 1, NULL, 35, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原证件有效截止日期', 'Old_IDEndDate', 'a', 'Old_IDEndDate', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新证件有效截止日期', 'IDEndDate', 'a', 'IDEndDate', 0, 0, 8, NULL, 37, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原出生日期', 'Old_BirthDate', 'a', 'Old_BirthDate', 0, 0, 8, NULL, 38, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新出生日期', 'BirthDate', 'a', 'BirthDate', 0, 0, 8, NULL, 39, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原手机号码', 'Old_MobileNo', 'a', 'Old_MobileNo', 0, 0, 40, NULL, 40, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新手机号码', 'MobileNo', 'a', 'MobileNo', 0, 0, 40, NULL, 41, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原个人邮箱', 'Old_EmailPersonal', 'a', 'Old_EmailPersonal', 0, 0, 40, NULL, 42, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新个人邮箱', 'EmailPersonal', 'a', 'EmailPersonal', 0, 0, 40, NULL, 43, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原参加工作日期', 'Old_FirstWorkDate', 'a', 'Old_FirstWorkDate', 0, 0, 8, NULL, 44, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新参加工作日期', 'FirstWorkDate', 'a', 'FirstWorkDate', 0, 0, 8, NULL, 45, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原婚姻状况', 'Old_MaritalStatus', 'a', 'Old_MaritalStatus', 0, 0, 40, NULL, 46, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新婚姻状况', 'MaritalStatus', 'a', 'MaritalStatus', 0, 0, 40, NULL, 47, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>MaritalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原生育状况', 'Old_FertilityStatus', 'a', 'Old_FertilityStatus', 0, 0, 40, NULL, 48, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新生育状况', 'FertilityStatus', 'a', 'FertilityStatus', 0, 0, 40, NULL, 49, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>FertilityStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原政治面貌', 'Old_PoliticalStatus', 'a', 'Old_PoliticalStatus', 0, 0, 40, NULL, 50, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新政治面貌', 'PoliticalStatus', 'a', 'PoliticalStatus', 0, 0, 40, NULL, 51, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>PoliticalStatus</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原入党时间', 'Old_PartyJoinDate', 'a', 'Old_PartyJoinDate', 0, 0, 8, NULL, 52, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新入党时间', 'PartyJoinDate', 'a', 'PartyJoinDate', 0, 0, 8, NULL, 53, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原籍贯', 'Old_NativePlace', 'a', 'Old_NativePlace', 0, 0, 40, NULL, 54, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新籍贯', 'NativePlace', 'a', 'NativePlace', 0, 0, 40, NULL, 55, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>NativePlace</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原籍贯详细地址', 'Old_NativePlaceAddr', 'a', 'Old_NativePlaceAddr', 0, 0, 100, NULL, 56, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新籍贯详细地址', 'NativePlaceAddr', 'a', 'NativePlaceAddr', 0, 0, 100, NULL, 57, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原现居住地', 'Old_CurrentResidence', 'a', 'Old_CurrentResidence', 0, 0, 40, NULL, 58, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新现居住地', 'CurrentResidence', 'a', 'CurrentResidence', 0, 0, 40, NULL, 59, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>CurrentResidence</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原现居住地详细地址', 'Old_CurrResAddr', 'a', 'Old_CurrResAddr', 0, 0, 100, NULL, 60, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新现居住地详细地址', 'CurrResAddr', 'a', 'CurrResAddr', 0, 0, 100, NULL, 61, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原户籍性质', 'Old_ResidenceType', 'a', 'Old_ResidenceType', 0, 0, 40, NULL, 62, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新户籍性质', 'ResidenceType', 'a', 'ResidenceType', 0, 0, 40, NULL, 63, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResidenceType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原开户银行', 'Old_BankCode', 'a', 'Old_BankCode', 0, 0, 40, NULL, 64, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新开户银行', 'BankCode', 'a', 'BankCode', 0, 0, 40, NULL, 65, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>BankCode</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原支行名称', 'Old_BankBranchName', 'a', 'Old_BankBranchName', 0, 0, 100, NULL, 66, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新支行名称', 'BankBranchName', 'a', 'BankBranchName', 0, 0, 100, NULL, 67, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'原银行卡号', 'Old_BankAccountNo', 'a', 'Old_BankAccountNo', 0, 0, 40, NULL, 68, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新银行卡号', 'BankAccountNo', 'a', 'BankAccountNo', 0, 0, 40, NULL, 69, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 70, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 71, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 72, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 73, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 74, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120016', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 75, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120017';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120017', 'E1120017', N'员工调动', 'SELECT a.*
FROM eu_Emp_Transfer a
WHERE a.Closed = 0
', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120017';

DELETE FROM mc_FunctionTools WHERE FCID='1120017';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120017, 'T01', N'确认调动', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120017, 'APP01', N'员工调动历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120017';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120017', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新调动类型', 'TransferType', 'a', 'TransferType', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>TransferType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 5, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原组织', 'Old_OrgID', 'a', 'Old_OrgID', 0, 0, 8, NULL, 6, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 7, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原岗位', 'Old_PosID', 'a', 'Old_PosID', 0, 0, 8, NULL, 8, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>Old_PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 9, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原职位', 'Old_JobID', 'a', 'Old_JobID', 0, 0, 8, NULL, 10, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>Old_JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 11, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原直接上级', 'Old_ParentID', 'a', 'Old_ParentID', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原自定义上级', 'Old_Parent2ID', 'a', 'Old_Parent2ID', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原招聘渠道', 'Old_RecruitChannel', 'a', 'Old_RecruitChannel', 0, 0, 40, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原工作城市', 'Old_WorkCity', 'a', 'Old_WorkCity', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原社保缴纳地', 'Old_SSCity', 'a', 'Old_SSCity', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原合同签约主体', 'Old_ContractCompID', 'a', 'Old_ContractCompID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>Old_ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原合同类型', 'Old_ContractType', 'a', 'Old_ContractType', 0, 0, 40, NULL, 24, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原合同属性', 'Old_ContractProperty', 'a', 'Old_ContractProperty', 0, 0, 40, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 27, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原当前合同开始日期', 'Old_ContractBeginDate', 'a', 'Old_ContractBeginDate', 0, 0, 8, NULL, 28, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原当前合同结束日期', 'Old_ContractEndDate', 'a', 'Old_ContractEndDate', 0, 0, 8, NULL, 30, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 31, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原试用期月数', 'Old_ProbationMonths', 'a', 'Old_ProbationMonths', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 33, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原试用期结束日期', 'Old_ProbationEndDate', 'a', 'Old_ProbationEndDate', 0, 0, 8, NULL, 34, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'原实习结束日期', 'Old_InternEndDate', 'a', 'Old_InternEndDate', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 37, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'调动日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 38, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 39, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 40, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 41, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 42, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 43, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120017', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 44, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120018';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120018', 'E1120018', N'员工调动历史', 'SELECT a.*
FROM eu_Emp_Transfer a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120018';

DELETE FROM mc_FunctionTools WHERE FCID='1120018';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120018';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120018', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新调动类型', 'TransferType', 'a', 'TransferType', 0, 0, 40, NULL, 4, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>TransferType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 5, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原组织', 'Old_OrgID', 'a', 'Old_OrgID', 0, 0, 8, NULL, 6, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新组织', 'OrgID', 'a', 'OrgID', 0, 0, 8, NULL, 7, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>OrgID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原岗位', 'Old_PosID', 'a', 'Old_PosID', 0, 0, 8, NULL, 8, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>Old_PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新岗位', 'PosID', 'a', 'PosID', 0, 0, 8, NULL, 9, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>PosID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原职位', 'Old_JobID', 'a', 'Old_JobID', 0, 0, 8, NULL, 10, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>Old_JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新职位', 'JobID', 'a', 'JobID', 0, 0, 8, NULL, 11, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>JobID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原直接上级', 'Old_ParentID', 'a', 'Old_ParentID', 0, 0, 8, NULL, 12, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新直接上级', 'ParentID', 'a', 'ParentID', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ParentID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原自定义上级', 'Old_Parent2ID', 'a', 'Old_Parent2ID', 0, 0, 8, NULL, 14, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Old_Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新自定义上级', 'Parent2ID', 'a', 'Parent2ID', 0, 0, 8, NULL, 15, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>Parent2ID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原招聘渠道', 'Old_RecruitChannel', 'a', 'Old_RecruitChannel', 0, 0, 40, NULL, 16, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新招聘渠道', 'RecruitChannel', 'a', 'RecruitChannel', 0, 0, 40, NULL, 17, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RecruitChannel</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原工作城市', 'Old_WorkCity', 'a', 'Old_WorkCity', 0, 0, 40, NULL, 18, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新工作城市', 'WorkCity', 'a', 'WorkCity', 0, 0, 40, NULL, 19, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>WorkCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原社保缴纳地', 'Old_SSCity', 'a', 'Old_SSCity', 0, 0, 40, NULL, 20, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新社保缴纳地', 'SSCity', 'a', 'SSCity', 0, 0, 40, NULL, 21, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>SSCity</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原合同签约主体', 'Old_ContractCompID', 'a', 'Old_ContractCompID', 0, 0, 8, NULL, 22, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>Old_ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新合同签约主体', 'ContractCompID', 'a', 'ContractCompID', 0, 0, 8, NULL, 23, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpList</control>
  <source>ContractCompID</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原合同类型', 'Old_ContractType', 'a', 'Old_ContractType', 0, 0, 40, NULL, 24, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新合同类型', 'ContractType', 'a', 'ContractType', 0, 0, 40, NULL, 25, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原合同属性', 'Old_ContractProperty', 'a', 'Old_ContractProperty', 0, 0, 40, NULL, 26, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>Old_ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新合同属性', 'ContractProperty', 'a', 'ContractProperty', 0, 0, 40, NULL, 27, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ContractProperty</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原当前合同开始日期', 'Old_ContractBeginDate', 'a', 'Old_ContractBeginDate', 0, 0, 8, NULL, 28, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新当前合同开始日期', 'ContractBeginDate', 'a', 'ContractBeginDate', 0, 0, 8, NULL, 29, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原当前合同结束日期', 'Old_ContractEndDate', 'a', 'Old_ContractEndDate', 0, 0, 8, NULL, 30, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新当前合同结束日期', 'ContractEndDate', 'a', 'ContractEndDate', 0, 0, 8, NULL, 31, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原试用期月数', 'Old_ProbationMonths', 'a', 'Old_ProbationMonths', 0, 0, 8, NULL, 32, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新试用期月数', 'ProbationMonths', 'a', 'ProbationMonths', 0, 0, 8, NULL, 33, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原试用期结束日期', 'Old_ProbationEndDate', 'a', 'Old_ProbationEndDate', 0, 0, 8, NULL, 34, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新试用期结束日期', 'ProbationEndDate', 'a', 'ProbationEndDate', 0, 0, 8, NULL, 35, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'原实习结束日期', 'Old_InternEndDate', 'a', 'Old_InternEndDate', 0, 0, 8, NULL, 36, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新实习结束日期', 'InternEndDate', 'a', 'InternEndDate', 0, 0, 8, NULL, 37, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'调动日期', 'BeginDate', 'a', 'BeginDate', 0, 0, 8, NULL, 38, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 39, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 40, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 41, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 42, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 43, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120018', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 44, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120019';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120019', 'E1120019', N'员工转正', 'SELECT a.*
FROM eu_Emp_Regular a
WHERE a.Closed = 0
', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120019';

DELETE FROM mc_FunctionTools WHERE FCID='1120019';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120019, 'T01', N'确认转正', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120019, 'APP01', N'员工转正历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120019';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120019', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 4, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'新转正类型', 'RegularType', 'a', 'RegularType', 0, 0, 40, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RegularType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'新转正日期', 'RegularDate', 'a', 'RegularDate', 0, 0, 8, NULL, 6, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 8, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 9, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 10, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 11, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120019', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 12, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120020';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120020', 'E1120020', N'员工转正历史', 'SELECT a.*
FROM eu_Emp_Regular a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120020';

DELETE FROM mc_FunctionTools WHERE FCID='1120020';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120020';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120020', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 4, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'新转正类型', 'RegularType', 'a', 'RegularType', 0, 0, 40, NULL, 5, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>RegularType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'新转正日期', 'RegularDate', 'a', 'RegularDate', 0, 0, 8, NULL, 6, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 8, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 9, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 10, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 11, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120020', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 12, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120021';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120021', 'E1120021', N'员工离职', 'SELECT a.*
FROM eu_Emp_Resign a
WHERE a.Closed = 0
', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime, 0 AS Closed', 'SELECT ${P_USERID} AS RegBy, GETDATE() AS RegTime');
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120021';

DELETE FROM mc_FunctionTools WHERE FCID='1120021';
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120021, 'T01', N'确认离职', 'execsp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <sqlbeforeclick></sqlbeforeclick>
      <sqlwhenclick></sqlwhenclick>
      <sqlafterclick></sqlafterclick>
      <linkcol></linkcol>
      <hidecol></hidecol>
      <confirm>0</confirm>
      <refresh>1</refresh>
      <cssclass>mc-btn-primary</cssclass>
      <icon>antd-right</icon>
      <color>#3293FF</color>
      <size></size>
      <toolprop class="linked-hash-map"/>
      <toolstyle></toolstyle>
      <showmode>0</showmode>
    </tool>')
GO

INSERT INTO mc_FunctionTools(FCID, TBKey, Title, xType, xOrder, LayoutType, Attribute)
VALUES(1120021, 'APP01', N'员工离职历史', 'popapp', 1, 'table', '<tool>
      <hidden>0</hidden>
      <popapp></popapp>
      <popappcondi><![CDATA[]]></popappcondi>
      <confirm>0</confirm>
      <refresh>0</refresh>
      <cssclass>mc-btn-dashed</cssclass>
      <icon>public-custom_query</icon>
      <color>#3293FF</color>
      <size></size>
      <showmode>2</showmode>
    </tool>')
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120021';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120021', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 4, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'新离职日期', 'ResignationDate', 'a', 'ResignationDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'新离职类型', 'ResignationType', 'a', 'ResignationType', 0, 0, 40, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResignationType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'新离职原因', 'ResignationReason', 'a', 'ResignationReason', 0, 0, 40, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResignationReason</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'新是否加入黑名单', 'IsBlackList', 'a', 'IsBlackList', 0, 0, 1, NULL, 8, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 10, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 11, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 12, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120021', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 14, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Functions WHERE ID = '1120022';
INSERT INTO mc_Functions(ID, Code, Title, DataSource, AddNewScript, UpdateScript)
VALUES('1120022', 'E1120022', N'员工离职历史', 'SELECT a.*
FROM eu_Emp_Resign a
WHERE a.Closed = 1
ORDER BY a.ClosedTime DESC', NULL, NULL);
GO

DELETE FROM mc_FunctionParams WHERE FCID = '1120022';

DELETE FROM mc_FunctionTools WHERE FCID='1120022';
GO

DELETE FROM mc_FunctionCols WHERE FCID ='1120022';
GO

INSERT INTO mc_FunctionCols(FCID, Title, ColName, ObjAlias, ColKey, IsPKey, IsIdentity, MaxLength, Scale, xOrder, Attribute)
VALUES
('1120022', N'序号', 'ID', 'a', 'ID', 1, 1, 8, NULL, 1, '<col>
  <datatype>Integer</datatype>
  <hidden>1</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'审批链接', 'LinkUrl', 'a', 'LinkUrl', 0, 0, 200, NULL, 2, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'流程编号', 'WfInstanceID', 'a', 'WfInstanceID', 0, 0, 8, NULL, 3, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'员工ID', 'EmpID', 'a', 'EmpID', 0, 0, 8, NULL, 4, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>1</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'新离职日期', 'ResignationDate', 'a', 'ResignationDate', 0, 0, 8, NULL, 5, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'新离职类型', 'ResignationType', 'a', 'ResignationType', 0, 0, 40, NULL, 6, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResignationType</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'新离职原因', 'ResignationReason', 'a', 'ResignationReason', 0, 0, 40, NULL, 7, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>SingleSelect</control>
  <source>ResignationReason</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'新是否加入黑名单', 'IsBlackList', 'a', 'IsBlackList', 0, 0, 1, NULL, 8, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'新其他说明', 'Remark', 'a', 'Remark', 0, 0, 400, NULL, 9, '<col>
  <datatype>String</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>0</formhidden>
  <notnull>0</notnull>
  <control>TextArea</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'登记人', 'RegBy', 'a', 'RegBy', 0, 0, 8, NULL, 10, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>RegBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'登记时间', 'RegTime', 'a', 'RegTime', 0, 0, 8, NULL, 11, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'是否生效', 'Closed', 'a', 'Closed', 0, 0, 1, NULL, 12, '<col>
  <datatype>Boolean</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>CheckBox</control>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'生效操作人', 'ClosedBy', 'a', 'ClosedBy', 0, 0, 8, NULL, 13, '<col>
  <datatype>Integer</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>SinglePopUpTree</control>
  <source>ClosedBy</source>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>'),
('1120022', N'生效操作时间', 'ClosedTime', 'a', 'ClosedTime', 0, 0, 8, NULL, 14, '<col>
  <datatype>DateTime</datatype>
  <hidden>0</hidden>
  <gridhidden>0</gridhidden>
  <formhidden>1</formhidden>
  <notnull>0</notnull>
  <control>DateTime</control>
  <format>yyyy-MM-dd HH:mm</format>
  <uploadtype>1</uploadtype>
  <locked>1</locked>
  <crypt>0</crypt>
  <importkey>0</importkey>
  <importval>0</importval>
  <logupdatecondition>0</logupdatecondition>
  <logupdatecolumn>0</logupdatecolumn>
  <searchable>0</searchable>
  <empbadge>0</empbadge>
</col>');
Go

DELETE FROM mc_Applications WHERE ID = '1110001';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1110001', N'组织信息', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="O1110000" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110001" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110002" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110003" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110004" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1110002';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1110002', N'组织操作', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="O1110005" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110006" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110007" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110008" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1110003';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1110003', N'组织操作历史', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="O1110009" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1110004';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1110004', N'岗位信息', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="O1110010" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110011" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110012" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110013" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1110005';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1110005', N'岗位操作', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="O1110014" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110015" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="O1110016" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1110006';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1110006', N'岗位操作历史', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="O1110017" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1120001';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1120001', N'员工信息', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="E1120001" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120002" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120003" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120004" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120005" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO

DELETE FROM mc_Applications WHERE ID = '1120002';
INSERT INTO mc_Applications(ID, Title, Applayout, PwdAuth, WaterMarkAuth, ShowParam)
VALUES('1120002', N'事务管理', N'<app type="LayoutCol1x">
      <region name="r-0" position="center" type="" width="30%" height="100%" posX="0" posY="0" full="0">
        <item code="E1120006" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120008" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120015" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120017" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120019" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
    <item code="E1120021" type="grid" mode="default">
          <linkcondi><![CDATA[]]></linkcondi>
          <showcondi><![CDATA[]]></showcondi>
          <funcscript><![CDATA[]]></funcscript>
          <showtitle>0</showtitle>
          <prop class="linked-hash-map"/>
        </item>
      </region>
      <prop class="linked-hash-map"/>
    </app>', 0, 0, 1);
GO
