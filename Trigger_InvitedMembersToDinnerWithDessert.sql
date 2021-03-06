USE [DS_MINI_PROJECT]
GO
/****** Object:  Trigger [dbo].[tr_InvitedMembersToDinnerWithDessertInsertUpdate]    Script Date: 9/18/2021 8:43:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kclyn Cabelin
-- Create date: September 16,2021
-- Description:	Triggers Invited Members
-- =============================================

--Drop Trigger tr_InvitedMembersToDinnerWithDessertInsertUpdate
CREATE TRIGGER [dbo].[tr_InvitedMembersToDinnerWithDessertInsertUpdate] 
   ON  [dbo].[Members]
   AFTER INSERT,UPDATE
AS 
BEGIN
	
	Declare @Member_Num int;
	Declare @Member_Name varchar;
	Declare @Invite_Num int;
	Declare @Invite_Date varchar(20);
	Declare @Accept_Date varchar(20);
	Declare @Dinner_Code int;
	Declare @Dinner_Description varchar(50);
	Declare @Dinner_Attended varchar(5);
	Declare @Dinner_Date varchar(20);
	Declare @Dessert_Code varchar(50);
	Declare @Dessert_Description varchar(50);

	SET @Dinner_Attended = (Select @Dinner_Attended Dinner_Attended from inserted);

	Select @Member_Num Member_Num from inserted;
	Select @Member_Name Member_Name from inserted;
	Select @Invite_Num Invite_Num from inserted;
	Select @Invite_Date Invite_Date from inserted;
	Select @Accept_Date Accept_Date from inserted; 
	Select @Dinner_Code Dinner_Code from inserted;
	Select @Dinner_Description Dinner_Description from inserted;
	Select @Dinner_Attended Dinner_Attended from inserted;
	Select @Dinner_Date Dinner_Date from inserted;
	Select @Dessert_Code Dessert_Code from inserted;
	Select @Dessert_Description Dessert_Description from inserted;

	Select * from deleted

	Insert into Members(Member_Num,Member_Name)
	Values(@Member_Num,@Member_Name)

	Insert Into Invite 
	(Invite_Num,Invite_Date,Accept_Date,Member_Num)
	Values(@Invite_Num,@Invite_Date,@Accept_Date,@Member_Num)

	
	Insert Into Dinner(Dinner_Code,Dinner_Description,Dinner_Attended,Dinner_Date,Member_Num,Invite_Num)
	Values(@Dinner_Code,@Dinner_Description,@Dinner_Attended,@Dinner_Date,@Member_Num,@Invite_Num)

	Insert into Dessert(Dessert_Code,Dessert_Description,Member_Num,Invite_Num,Dinner_Code)
	Values(@Dessert_Code,@Dessert_Description,@Member_Num,@Invite_Num,@Dinner_Code)

	
	Select * from deleted
	SET @Dinner_Attended = (Select @Dinner_Attended Dinner_Attended from inserted);

    --Update Invited Member on their Dinner Attended Status
	UPDATE Dinner SET Dinner_Attended = 'No' where Member_Num = 211

	Select * from Members
END
