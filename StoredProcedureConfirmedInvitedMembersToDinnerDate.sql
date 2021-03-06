USE [DS_MINI_PROJECT]
GO
/****** Object:  StoredProcedure [dbo].[ConfirmedInvitedMembers]    Script Date: 9/16/2021 2:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kclyn Cabelin
-- Create date: September 16,2021
-- Description:	Confirms invited members status
-- =============================================

CREATE PROCEDURE [dbo].[ConfirmedInvitedMembers] 

    @Member_Num int ,
	@Member_Name varchar(50),
	@Dinner_Code varchar(50),
	@Dinner_Description varchar(50),
	@Dinner_Date varchar(20),
	@Invite_Num int = 230,
	@Invite_Date varchar(20),
	@Accept_Date varchar(20),
	@Dessert_Code varchar(50),
	@Dessert_Description varchar(50)

	
AS
BEGIN
	
	Declare @Dinner_Attended varchar(50)
	SET @Dinner_Attended = 'Yes';
		IF @Dinner_Attended = 'Yes'
		BEGIN
			Select 
			Members.Member_Num,
			Members.Member_Name,
			Invite.Invite_Num,
			Invite.Invite_Date,
			Invite.Accept_Date,
			Dinner.Dinner_Code,
			Dinner.Dinner_Description,
			Dinner.Dinner_Attended,
			Dinner.Dinner_Date,
			Dessert.Dessert_Code,
			Dessert.Dessert_Description
			FROM Members
			INNER JOIN Invite ON Members.Member_Num = Invite.Member_Num
			INNER JOIN Dinner ON Members.Member_Num = Dinner.Member_Num
			INNER JOIN Dessert ON Members.Member_Num = Dessert.Member_Num
			WHERE Dinner.Dinner_Attended = 'Yes'
			--ORDER BY Invite.Invite_Num ASC
			Print 'Invited Members who are Dinner attended status is Yes'
	   END
	   Else 
	     BEGIN
			Select 
			Members.Member_Num,
			Members.Member_Name,
			Invite.Invite_Num,
			Invite.Invite_Date,
			Invite.Accept_Date,
			Dinner.Dinner_Code,
			Dinner.Dinner_Description,
			Dinner.Dinner_Attended,
			Dinner.Dinner_Date,
			Dessert.Dessert_Code,
			Dessert.Dessert_Description
			FROM Members
			INNER JOIN Invite ON Members.Member_Num = Invite.Member_Num
			INNER JOIN Dinner ON Members.Member_Num = Dinner.Member_Num
			INNER JOIN Dessert ON Members.Member_Num = Dessert.Member_Num
			WHERE Dinner.Dinner_Attended = 'No'
			Print 'Invited Members who are Dinner attended status is No'
	     END

	EXEC sp_helptext 'ConfirmedInvitedMembers'
	
END
