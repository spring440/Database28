
GO
CREATE PROCEDURE CheckIfRegistered (@person VARCHAR(105))
AS
BEGIN
	DECLARE @fname VARCHAR(50)
	DECLARE @lname VARCHAR(50)
	SELECT @fname = LTRIM(RTRIM(SUBSTRING(@person, 0, CHARINDEX(' ', @person+' '))))
	SELECT @lname = LTRIM(RTRIM(SUBSTRING(@person, CHARINDEX(' ', @person+' ')+1, 8000)))
	DECLARE @Truth INT

	IF EXISTS (SELECT person_id FROM person WHERE @fname = fname AND @lname = lname)
	BEGIN
		SET @Truth = 1
	END
	ELSE
	BEGIN
		SET @Truth = 0
	END

	RETURN @Truth
END

GO
CREATE PROCEDURE AddRegistration (@person VARCHAR(105))
AS
BEGIN
	BEGIN
	DECLARE @fname VARCHAR(50)
	DECLARE @lname VARCHAR(50)
	SELECT @fname = LTRIM(RTRIM(SUBSTRING(@person, 0, CHARINDEX(' ', @person+' '))))
	SELECT @lname = LTRIM(RTRIM(SUBSTRING(@person, CHARINDEX(' ', @person+' ')+1, 8000)))
		BEGIN TRY
			INSERT INTO person (fname, lname)
				VALUES (
					@fname,
					@lname
				)
		END TRY
		BEGIN CATCH
			DECLARE @ErrorMessage NVARCHAR(4000);
			DECLARE @ErrorSeverity INT;
			DECLARE @ErrorState INT;

			SELECT @ErrorMessage = ERROR_MESSAGE(),
					@ErrorSeverity = ERROR_SEVERITY(),
					@ErrorState = ERROR_STATE();

			-- Use RAISERROR inside the CATCH block to return 
			-- error information about the original error that 
			-- caused execution to jump to the CATCH block.
			RAISERROR (@ErrorMessage, -- Message text.
						@ErrorSeverity, -- Severity.
						@ErrorState -- State.
						);
		END CATCH
	END
END

GO
CREATE PROCEDURE CheckIfPresenter (@presenter VARCHAR(105))
AS
BEGIN
	DECLARE @fname VARCHAR(50)
	DECLARE @lname VARCHAR(50)
	SELECT @fname = LTRIM(RTRIM(SUBSTRING(@presenter, 0, CHARINDEX(' ', @presenter+' '))))
	SELECT @lname = LTRIM(RTRIM(SUBSTRING(@presenter, CHARINDEX(' ', @presenter+' ')+1, 8000)))
	DECLARE @Truth INT

	IF EXISTS (SELECT pr.person_id FROM presenter pr INNER JOIN person p ON pr.person_id = p.person_id WHERE @fname = p.fname AND @lname = p.lname)
	BEGIN
		SET @Truth = 1
	END
	ELSE
	BEGIN
		SET @Truth = 0
	END

	RETURN @Truth
END

GO
CREATE PROCEDURE AddPresenter (@presenter VARCHAR(105))
AS
BEGIN
	DECLARE @fname VARCHAR(50)
	DECLARE @lname VARCHAR(50)
	SELECT @fname = LTRIM(RTRIM(SUBSTRING(@presenter, 0, CHARINDEX(' ', @presenter+' '))))
	SELECT @lname = LTRIM(RTRIM(SUBSTRING(@presenter, CHARINDEX(' ', @presenter+' ')+1, 8000)))
		BEGIN TRY
			INSERT INTO presenter (person_id)
				VALUES (
					(SELECT person_id FROM person WHERE @fname = fname AND @lname = lname)
				)
		END TRY
		BEGIN CATCH
			DECLARE @ErrorMessage NVARCHAR(4000);
			DECLARE @ErrorSeverity INT;
			DECLARE @ErrorState INT;

			SELECT @ErrorMessage = ERROR_MESSAGE(),
					@ErrorSeverity = ERROR_SEVERITY(),
					@ErrorState = ERROR_STATE();

			-- Use RAISERROR inside the CATCH block to return 
			-- error information about the original error that 
			-- caused execution to jump to the CATCH block.
			RAISERROR (@ErrorMessage, -- Message text.
						@ErrorSeverity, -- Severity.
						@ErrorState -- State.
						);
		END CATCH
END

GO
CREATE PROCEDURE AddClass (@presentation VARCHAR(100), @description VARCHAR(255) = NULL, @difficulty VARCHAR(15) = NULL, @topic VARCHAR(50) = NULL)
AS
BEGIN
		BEGIN TRY
			IF EXISTS (SELECT track_id FROM track WHERE topic = @topic)
				BEGIN
					INSERT INTO class (classname, difficulty, class_desc, track_id)
						VALUES (
							@presentation,
							@difficulty, 
							@description,
							(SELECT track_id FROM track WHERE topic = @topic)
						)
				END
			ELSE 
				BEGIN
					INSERT INTO track (topic)
						VALUES ( @topic)

					INSERT INTO class (classname, difficulty, class_desc, track_id)
						VALUES (
							@presentation,
							@difficulty, 
							@description,
							(SELECT track_id FROM track WHERE topic = @topic)
						)
				END			
		END TRY
		BEGIN CATCH
			DECLARE @ErrorMessage NVARCHAR(4000);
			DECLARE @ErrorSeverity INT;
			DECLARE @ErrorState INT;

			SELECT @ErrorMessage = ERROR_MESSAGE(),
					@ErrorSeverity = ERROR_SEVERITY(),
					@ErrorState = ERROR_STATE();

			-- Use RAISERROR inside the CATCH block to return 
			-- error information about the original error that 
			-- caused execution to jump to the CATCH block.
			RAISERROR (@ErrorMessage, -- Message text.
						@ErrorSeverity, -- Severity.
						@ErrorState -- State.
						);
		END CATCH
END

GO
CREATE PROCEDURE InsertPresentation (@presenter VARCHAR(105), @presentation VARCHAR(100), @description VARCHAR(255) = NULL, @difficulty VARCHAR(15) = NULL, @topic VARCHAR(50) = NULL, @event VARCHAR)
AS
BEGIN
	DECLARE @fname VARCHAR(50)
	DECLARE @lname VARCHAR(50)
	SELECT @fname = LTRIM(RTRIM(SUBSTRING(@presenter, 0, CHARINDEX(' ', @presenter+' '))))
	SELECT @lname = LTRIM(RTRIM(SUBSTRING(@presenter, CHARINDEX(' ', @presenter+' ')+1, 8000)))
	DECLARE @ErrorMessage NVARCHAR(4000);
	DECLARE @ErrorSeverity INT;
	DECLARE @ErrorState INT;

	DECLARE @IsPresenter INT
	EXEC @IsPresenter = CheckIfPresenter @presenter

	IF (SELECT @IsPresenter) != 1
		BEGIN
			DECLARE @IsRegistered INT		
			EXEC @IsRegistered = CheckIfRegistered @presenter
			IF (SELECT @IsRegistered) != 1
				BEGIN
					EXEC AddRegistration @presenter
					EXEC AddPresenter @presenter
				END
			ELSE 
				BEGIN
					EXEC AddPresenter @presenter
				END
		END

	IF EXISTS (SELECT c.class_id FROM class c WHERE c.classname = @presentation)
		BEGIN
			BEGIN TRY
				INSERT INTO class_presenter (class_id, presenter_id)
					VALUES (
						(SELECT c.class_id FROM class c WHERE c.classname = @presentation),
						(SELECT pr.person_id FROM presenter pr INNER JOIN person p ON pr.person_id = p.person_id WHERE @fname = p.fname AND @lname = p.lname)
					)
			END TRY
			BEGIN CATCH
				SELECT @ErrorMessage = ERROR_MESSAGE(),
						@ErrorSeverity = ERROR_SEVERITY(),
						@ErrorState = ERROR_STATE();

				-- Use RAISERROR inside the CATCH block to return 
				-- error information about the original error that 
				-- caused execution to jump to the CATCH block.
				RAISERROR (@ErrorMessage, -- Message text.
							@ErrorSeverity, -- Severity.
							@ErrorState -- State.
							);
			END CATCH
		END
	ELSE
		BEGIN
			BEGIN TRAN AddClass
			BEGIN TRY
				EXEC AddClass @presentation, @description, @difficulty, @topic
				INSERT INTO class_presenter (class_id, presenter_id)
					VALUES (
						(SELECT c.class_id FROM class c WHERE c.classname = @presentation),
						(SELECT pr.person_id FROM presenter pr INNER JOIN person p ON pr.person_id = p.person_id WHERE @fname = p.fname AND @lname = p.lname)
					)
				COMMIT TRAN AddClass
			END TRY
			BEGIN CATCH
				ROLLBACK TRAN AddClass
				SELECT @ErrorMessage = ERROR_MESSAGE(),
						@ErrorSeverity = ERROR_SEVERITY(),
						@ErrorState = ERROR_STATE();

				-- Use RAISERROR inside the CATCH block to return 
				-- error information about the original error that 
				-- caused execution to jump to the CATCH block.
				RAISERROR (@ErrorMessage, -- Message text.
							@ErrorSeverity, -- Severity.
							@ErrorState -- State.
							);
			END CATCH
		END
END

GO
CREATE PROCEDURE GetClasses(@event_title VARCHAR(50) = NULL, @track_topic VARCHAR(50) = NULL, @date DATE = NULL)
AS
BEGIN
	SELECT c.classname as Class, p.fname + ' ' + p.lname as Presenter, c.difficulty as Difficulty, t.topic as Topic, e.event_title as 'Event Title', r.room_name as Room, s.start_time as 'Start Time'
		FROM schedule s
		LEFT JOIN sql_event e ON s.event_id = e.event_id
		LEFT JOIN class c ON s.class_id = c.class_id
		LEFT JOIN room r ON s.room_id = r.room_id
		LEFT JOIN track t ON c.track_id = t.track_id
		LEFT JOIN class_presenter cp ON c.class_id = cp.class_id
		LEFT JOIN person p ON cp.presenter_id = p.person_id
		WHERE 
		(@event_title IS NULL OR e.event_title LIKE '%' + @event_title + '%') AND 
		(@track_topic IS NULL OR t.topic = @track_topic) AND 
		(@date IS NULL OR e.event_date = @date)
END
