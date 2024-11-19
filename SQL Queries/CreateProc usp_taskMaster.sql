CREATE PROC usp_taskMaster

	@Opmode 		INT				= 0,
	@Id				INT				= 0,
	@Title			NVARCHAR(50)	= NULL,
	@TDescription	NVARCHAR(250)	= NULL,
	@TStatus		NVARCHAR(12)	= NULL,
	@CreatedDate	DATETIME		= NULL,
	@DueDate		DATETIME		= NULL,
	@TPriority		INT				= 0
AS
BEGIN
	BEGIN TRY -- Try Statement
		IF @Opmode = 0 -- Read
		BEGIN
			SELECT Id, Title, TDescription, TStatus, CreatedDate, DueDate, TPriority FROM listMaster;
		END

		ELSE IF @Opmode = 1 -- Insert
		BEGIN
			INSERT INTO listMaster (Title, TDescription, TStatus, CreatedDate, DueDate, TPriority)
			VALUES (@Title, @TDescription, @TStatus, @CreatedDate, @DueDate, @TPriority);
		END
	END TRY
	BEGIN CATCH -- Catch Statement
			IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRAN			
			END
			DECLARE @err_msg NVARCHAR(MAX)
			SET @err_msg = ERROR_MESSAGE()
			RAISERROR(@err_msg, 16, 1)
	END CATCH
END
GO