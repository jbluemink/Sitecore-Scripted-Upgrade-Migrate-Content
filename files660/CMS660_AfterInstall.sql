IF NOT EXISTS(SELECT * FROM sys.objects O INNER JOIN sys.columns C on O.object_id = C.object_id WHERE O.name = 'ArchivedVersions')
BEGIN
	BEGIN TRANSACTION
	--Create Versions table
	
	CREATE TABLE ArchivedVersions(
	[VersionId] [uniqueidentifier] NOT NULL,
	[ArchivalId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Language] [nvarchar](50) NULL,
	[Version] [int] NULL,
	[ArchivedDate] [datetime] NOT NULL,
	[ArchivedBy] [nvarchar](50) NULL,
	CONSTRAINT [PK_ArchivedVersions] PRIMARY KEY CLUSTERED ([VersionId] ASC)) ON [PRIMARY]

	IF (@@Error != 0)
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END
	
	-- Insert versions to new table
	INSERT INTO ArchivedVersions
	SELECT  NEWID(),
		Archive.ArchivalId, 
		ArchivedFields.ItemId, 
		CASE WHEN Len(Language) = 0 THEN NULL ELSE Language END, 
		CASE WHEN Version = 0 THEN NULL ELSE Version END, 		
		Archive.ArchiveDate,
		Archive.ArchivedBy		
	FROM ArchivedFields INNER JOIN Archive ON ArchivedFields.ArchivalId = Archive.ArchivalId
	GROUP BY Archive.ArchivalId, ArchivedFields.ItemId, Version, Language, Archive.ArchivedBy, Archive.ArchiveDate 

	IF (@@Error != 0)
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END

	-- Add VersionId column to ArchivedFields. Later shoudl be altered for not null
	ALTER TABLE ArchivedFields ADD [VersionId] [uniqueidentifier] NULL

	IF (@@Error != 0)
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END
	
	-- Fill ArchivedFields with VersionId
	UPDATE ArchivedFields SET VersionId = ArchivedVersions.VersionId
	FROM ArchivedVersions INNER JOIN 
		(SELECT RowId,
				ArchivalId, 
				ItemId, 
				CASE WHEN Version = 0 THEN NULL ELSE Version END AS Version, 
				CASE WHEN Len(Language) = 0 THEN NULL ELSE Language END AS Language
		 FROM ArchivedFields) ArchivedFieldValues ON 
		ArchivedVersions.ArchivalId = ArchivedFieldValues.ArchivalId AND
		ArchivedVersions.ItemId = ArchivedFieldValues.ItemId AND
		(ArchivedVersions.Version = ArchivedFieldValues.Version OR (ArchivedVersions.Version IS NULL AND ArchivedFieldValues.Version IS NULL)) AND
		(ArchivedVersions.Language = ArchivedFieldValues.Language OR (ArchivedVersions.Language IS NULL AND ArchivedFieldValues.Language IS NULL)) INNER JOIN
		ArchivedFields AF ON AF.RowId = ArchivedFieldValues.RowId
		
	IF (@@Error != 0)
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END

	-- Drop obsolete fields
	ALTER TABLE ArchivedFields DROP COLUMN SharingType, Language, Version, ItemId
	IF (@@Error != 0)
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END
	
	-- Enable Not Null for VersionId conlumn
	ALTER TABLE ArchivedFields ALTER COLUMN [VersionId] [uniqueidentifier] NOT NULL
		IF (@@Error != 0)
	BEGIN
		ROLLBACK TRANSACTION
		RETURN
	END

	COMMIT TRANSACTION
END