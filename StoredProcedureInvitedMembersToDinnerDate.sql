USE [DS_MINI_PROJECT]
GO
/****** Object:  StoredProcedure [dbo].[InvitedMembersToDinnerWithDessert]    Script Date: 9/16/2021 2:01:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kclyn Cabelin
-- Create date: September 16, 2021
-- Description:	Stored Procedure for Invited Members to Dinner
-- =============================================

Create PROCEDURE [dbo].[InvitedMembersToDinnerWithDessert] 

    @Member_Num int ,
	@Member_Name varchar(50),
	@Dinner_Code varchar(50),
	@Dinner_Description varchar(50),
	@Dinner_Attended varchar(50),
	@Dinner_Date varchar(20),
	@Invite_Num int = 230,
	@Invite_Date varchar(20),
	@Accept_Date varchar(20),
	@Dessert_Code varchar(50),
	@Dessert_Description varchar(50)

AS

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
				Dessert.Dessert_Description,
				Dessert.Member_Num
				FROM Members
				INNER JOIN Invite ON Members.Member_Num = Invite.Member_Num
				INNER JOIN Dinner ON Members.Member_Num = Dinner.Member_Num
				INNER JOIN Dessert ON Members.Member_Num = Dessert.Member_Num
				WHERE Dinner.Dinner_Date = '17-Mar-2016'
				ORDER BY Invite.Invite_Num ASC

				EXEC sp_helptext 'InvitedMembersToDinnerWithDessert'
END
