CREATE TABLE listMaster(
	Id INT IDENTITY(1000, 1) PRIMARY KEY,
	Title NVARCHAR(50),
	TDescription NVARCHAR(250),
	TStatus NVARCHAR(12),
	CreatedDate DATETIME,
	DueDate DATETIME,
	TPriority INT
)
