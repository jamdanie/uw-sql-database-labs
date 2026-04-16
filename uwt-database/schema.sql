-- UWT Database Schema
-- Course: T INFO 210
-- Exported from SQL Server (SSMS)
-- Organized for dependency order and readability

USE UWT;
GO

/* =========================
   Departments (no dependencies)
   ========================= */
CREATE TABLE [dbo].[Departments](
    [DepartmentID] [int] IDENTITY(1,1) NOT NULL,
    :contentReference[oaicite:0]{index=0} NULL,
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC),
    UNIQUE NONCLUSTERED ([DepartmentName] ASC)
);
GO


/* =========================
   Students (no dependencies)
   ========================= */
CREATE TABLE [dbo].[Students](
    [StudentID] [int] IDENTITY(1,1) NOT NULL,
     NOT NULL,
     NOT NULL,
     NOT NULL,
    [GraduationDate] [date] NULL,
    PRIMARY KEY CLUSTERED ([StudentID] ASC)
);
GO


/* =========================
   Tuition (standalone reference table)
   ========================= */
CREATE TABLE [dbo].[Tuition](
    [PartTimeCost] [smallmoney] NOT NULL,
    [FullTimeCost] [smallmoney] NOT NULL,
    [PerUnitCost] [smallmoney] NOT NULL
);
GO


/* =========================
   Instructors (depends on Departments)
   ========================= */
CREATE TABLE [dbo].[Instructors](
    [InstructorID] [int] IDENTITY(1,1) NOT NULL,
     NOT NULL,
     NULL,
     NOT NULL,
    [DepartmentChairman] [bit] NOT NULL,
    [HireDate] [date] NULL,
    [AnnualSalary] [money] NOT NULL,
    [DepartmentID] [int] NOT NULL,
    PRIMARY KEY CLUSTERED ([InstructorID] ASC)
);
GO

ALTER TABLE [dbo].[Instructors]
ADD FOREIGN KEY([DepartmentID]) REFERENCES [dbo].[Departments]([DepartmentID]);
GO


/* =========================
   Courses (depends on Departments, Instructors)
   ========================= */
CREATE TABLE [dbo].[Courses](
    [CourseID] [int] IDENTITY(1,1) NOT NULL,
    [CourseNumber] [int] NULL,
     NOT NULL,
    [CourseUnits] [int] NOT NULL,
    [DepartmentID] [int] NOT NULL,
    [InstructorID] [int] NOT NULL,
    PRIMARY KEY CLUSTERED ([CourseID] ASC),
    UNIQUE NONCLUSTERED ([CourseNumber] ASC)
);
GO

ALTER TABLE [dbo].[Courses]
ADD DEFAULT ((3)) FOR [CourseUnits];
GO

ALTER TABLE [dbo].[Courses]
ADD FOREIGN KEY([DepartmentID]) REFERENCES [dbo].[Departments]([DepartmentID]);
GO

ALTER TABLE [dbo].[Courses]
ADD FOREIGN KEY([InstructorID]) REFERENCES [dbo].[Instructors]([InstructorID]);
GO


/* =========================
   StudentCourses (junction table)
   Depends on Students, Courses
   ========================= */
CREATE TABLE [dbo].[StudentCourses](
    [StudentID] [int] NOT NULL,
    [CourseID] [int] NOT NULL
);
GO

ALTER TABLE [dbo].[StudentCourses]
ADD FOREIGN KEY([CourseID]) REFERENCES [dbo].[Courses]([CourseID]);
GO

ALTER TABLE [dbo].[StudentCourses]
ADD FOREIGN KEY([StudentID]) REFERENCES [dbo].[Students]([StudentID]);
GO