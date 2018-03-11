-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stefan Keller
-- Create date: 11.03.18
-- Description:	
-- =============================================
CREATE PROCEDURE SunScore 
	-- Add the parameters for the stored procedure here
	@sum1 smallint = 0, 
	@sum2 smallint = 0,
	@sum3 smallint = 0
AS
BEGIN

  declare @summe smallint;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	set @summe = @sum1 + @sum2 + @sum3;


    -- Insert statements for procedure here
	SELECT @summe;
END
GO
