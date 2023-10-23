Imports DevExpress.XtraGrid.Columns

Public Class Section_Model
    Friend Function getCategory() As Object
        Dim sql As String = ""
        sql = "SELECT
                    id, 
                    `name`
                    FROM
                    student_categories
                    WHERE
                    is_deleted = 0"
        Return DataSource(sql)
    End Function

    Friend Function getSchoolYear() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
                1 as 'id',
                batches.school_year 'name'
                FROM
                batches
                WHERE school_year is NOT NULL
                ORDER BY school_year DESC"
        Return DataSource(sql)
    End Function

    Friend Function list(str As String) As DataTable
        Dim sql As String = ""
        Try
            sql = "SELECT
	    sectioning.id, 
	    sectioning.school_year, 
	    sectioning.subject_id,subjects.`name`, 
	    sectioning.instructor_id, 
	    subject_class_schedule.employee_name, 
	    sectioning.inorder, 
	    sectioning.section_name, 
	    sectioning.number_students,
	    sectioning.batch_id,
        (SELECT
	            COUNT(sectioning_details.student_subject_id)
            FROM
	            sectioning_details
            WHERE
	            sectioning_details.sectioning_id = sectioning.id) AS 'TOTAL'   
	
    FROM
	    sectioning
	    INNER JOIN subjects ON sectioning.subject_id = subjects.id
	    INNER JOIN subject_class_schedule ON sectioning.instructor_id = subject_class_schedule.employee_id
        INNER JOIN batches ON sectioning.batch_id = batches.id
        " & str & "   
    GROUP BY
	    id
    ORDER BY
	    instructor_id ASC, 
	    inorder ASC"
        Catch ex As Exception

        End Try
        Return DataSource(sql)
    End Function

    Friend Function getCourse() As Object
        Dim sql As String = ""
        Try
            sql = "    
                    SELECT
                    `id`,
                    `name`
                    FROM(
		                    SELECT
		                    courses.id, 
		                    courses.course_name 'name'
		                    FROM
		                    courses
		                    WHERE
		                    courses.category_id = '" & _student_category_id & "' AND is_deleted = 0
		
		                    UNION
		
		                    SELECT 0 as 'id','--- ALL ---' AS 'name'
		                    )A ORDER BY id"

        Catch ex As Exception
        End Try
        Return DataSource(sql)

    End Function

    Friend Function getBatch() As Object
        Dim sql As String = ""
        Try

            sql = "SELECT
		            `id`,
		            `name`
		            FROM(			
					            SELECT
					            batches.id, 
					            batches.`name`
					            FROM
					            batches
					            WHERE
					            batches.is_deleted = 0 AND
					            batches.school_year = '" & _batchyear & "' AND
					            batches.course_id = '" & _courseID & "' AND batches.semester = '" & _semester & "'

					            UNION

					            SELECT 0 AS 'id','--- ALL ---' AS 'name'
					            )A ORDER BY `id`"

        Catch ex As Exception
        End Try
        Return DataSource(sql)
    End Function

    Friend Function checkIfExisting(SubjectID As Object, InstructorID As Object, SectionName As String) As Boolean
        Dim id As Integer
        id = DataObject(String.Format("SELECT id FROM sectioning WHERE status_id = 1 AND subject_id = '" & SubjectID & "' AND instructor_id = '" & InstructorID & "' AND section_name = '" & SectionName & "'"))
        If id > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Friend Sub Insert(SchoolYear As String, subjectID As String, instructorID As String, Order As String, SectionName As String, NoOfStudent As String, BatchId As String, catID As String)
        Try
            DataSource(String.Format("INSERT INTO `sectioning` 
                                    (
                                        `school_year`,
                                        `subject_id`,
                                        `instructor_id`,
                                        `inorder`,
                                        `section_name`,
                                        `number_students`,
                                         batch_id,
                                         category_id
                                    )
                                    VALUES 	(
                                        '" & SchoolYear & "',
                                        '" & subjectID & "',
                                        '" & instructorID & "',
                                        '" & Order & "',
                                        '" & SectionName & "',
                                        '" & NoOfStudent & "',
                                        '" & BatchId & "',
                                        '" & catID & "'
                                    );"))
        Catch ex As Exception

        End Try
    End Sub

    Friend Function getSectioningDetails(sectioningID As Object) As DataTable
        Dim sql As String = ""
        Try
            sql = "SELECT
	djemfcst_v2.sectioning.id, 
	djemfcst_v2.subjects.`name` AS 'SubjectName', 
	djemfcst_hris.employees.Name_Empl AS 'Instructor', 
	djemfcst_v2.sectioning.inorder, 
	djemfcst_v2.sectioning.section_name, 
	djemfcst_v2.sectioning.number_students
FROM
	djemfcst_v2.sectioning
	INNER JOIN
	djemfcst_v2.subjects
	ON 
		djemfcst_v2.sectioning.subject_id = djemfcst_v2.subjects.id
	INNER JOIN
	djemfcst_hris.employees
	ON 
		djemfcst_v2.sectioning.instructor_id = djemfcst_hris.employees.SysPK_Empl
WHERE
	 djemfcst_v2.sectioning.status_id = 1 AND djemfcst_v2.sectioning.id = '" & sectioningID & "' "
        Catch ex As Exception

        End Try
        Return DataSource(sql)
    End Function

    Friend Function getListCategory(batchID As String) As String
        Dim sql As String = ""
        Try
            sql = "SELECT
	                    courses.category_id
                    FROM
	                    batches
	                    INNER JOIN
	                    courses
	                    ON 
		                    batches.course_id = courses.id
                    WHERE
	                    batches.id = '" & batchID & "'"
            Return DataObject(sql)
        Catch ex As Exception

        End Try
    End Function

    Friend Function getBatchDetails(BatchID As String) As DataTable
        Dim sql As String = ""
        Try
            sql = "SELECT
	                batches.id, 
	                batches.course_id, 
	                batches.semester, 
	                batches.school_year,
                    batches.name
                FROM
	                batches
                WHERE
	                 batches.id = '" & BatchID & "'"
        Catch ex As Exception

        End Try
        Return DataSource(sql)
    End Function

    Friend Function getSection(id As String) As DataTable
        Dim str As String = ""
        If id = "" Then
            str = ""
        Else
            str = " WHERE djemfcst_v2.sectioning.id = '" & id & "'"
        End If


        Dim sql As String = ""
        Try
            sql = "SELECT
                      djemfcst_v2.sectioning_details.id,
	                    djemfcst_v2.sectioning.school_year, 
	                    djemfcst_v2.sectioning.batch_id, 
	                    djemfcst_v2.sectioning.subject_id, 
	                    djemfcst_v2.subjects.`name`, 
	                    djemfcst_v2.sectioning.instructor_id, 
	                    djemfcst_hris.employees.Name_Empl, 
	                    djemfcst_v2.sectioning.section_name, 
	                    djemfcst_v2.sectioning.inorder, 
	                    djemfcst_v2.students_subjects.id, 
	                    djemfcst_v2.person.display_name, 
	                    djemfcst_v2.students.std_number, 
	                    djemfcst_v2.person.last_name, 
	                    djemfcst_v2.person.first_name, 
	                    djemfcst_v2.person.middle_name,
	                    djemfcst_v2.students.year_level,
                        sectioning.id
                    FROM
	                    djemfcst_v2.sectioning_details
	                    INNER JOIN
	                    djemfcst_v2.sectioning
	                    ON 
		                    djemfcst_v2.sectioning_details.sectioning_id = djemfcst_v2.sectioning.id
	                    INNER JOIN
	                    djemfcst_v2.subjects
	                    ON 
		                    djemfcst_v2.sectioning.subject_id = djemfcst_v2.subjects.id
	                    INNER JOIN
	                    djemfcst_hris.employees
	                    ON 
		                    djemfcst_v2.sectioning.instructor_id = djemfcst_hris.employees.SysPK_Empl
	                    INNER JOIN
	                    djemfcst_v2.students_subjects
	                    ON 
		                    djemfcst_v2.sectioning_details.student_subject_id = djemfcst_v2.students_subjects.id
	                    INNER JOIN
	                    djemfcst_v2.students
	                    ON 
		                    djemfcst_v2.students_subjects.student_id = djemfcst_v2.students.id
	                    INNER JOIN
	                    djemfcst_v2.person
	                    ON 
		                    djemfcst_v2.students.person_id = djemfcst_v2.person.person_id
                    " & str & "
                    ORDER BY
	                    display_name ASC"
        Catch ex As Exception

        End Try
        Return DataSource(sql)
    End Function

    Friend Function getSectionAvailability(SubjectName As String, InstructorName As String, SchoolYear As String) As DataTable

        Dim sql As String = ""
        sql = "
    SELECT
     id,
     CONCAT('SECTION  - ' ,section_name) 'section_name',
		 SubjectName,
     Instrutor
		FROM(
		      SELECT
			  	sectioning.id,
					sectioning.section_name,
		  		(SELECT `name` FROM 	subjects WHERE 	subjects.id = sectioning.subject_id) 'SubjectName',
			  	(SELECT Name_Empl FROM djemfcst_hris.employees WHERE SysPK_Empl = sectioning.instructor_id) 'Instrutor',
					sectioning.school_year,
					sectioning.availability
					FROM
					sectioning
					WHERE 	sectioning.availability = 1 AND sectioning.school_year = '" & SchoolYear & "'	
					)A
		WHERE 
		SubjectName like '" & SubjectName & "'  AND Instrutor like '" & InstructorName & "'		"
        Return DataSource(sql)

    End Function

    Friend Function getSubject() As Object
        Dim sql As String = ""
        Try
            sql = "	SELECT
		            `id`,
		            `name`,
		            `code`
		            FROM(					
					            SELECT
					            subjects.id, 
					            subjects.`name`, 
					            subjects.`code`
					            FROM
					            subjects
					            WHERE
					            subjects.is_deleted = 0 AND
					            subjects.batch_id = '" & _batchID & "'

					            UNION

					            SELECT 0 AS 'id','--- ALL ---' AS 'name','000' AS 'code'
					            )A ORDER BY `id`"
        Catch ex As Exception

        End Try
        Return DataSource(sql)
    End Function

    Friend Function getCurrentNoOfStudents(id As String) As Integer
        Dim NoOfStudents As Integer = DataObject(String.Format("SELECT number_students FROM sectioning WHERE id = '" & id & "'"))
        Return NoOfStudents
    End Function

    Friend Sub Update(schoolYear As String, subjectID As String, instructorID As String, Inorder As String, Section As String, NoOfStudents As String, batchId As String, catID As String, Availability_Status As Boolean, id As Integer)
        Dim availability As Integer = 0
        Try
            If Availability_Status = True Then
                availability = 1
            Else
                availability = 0
            End If

            DataSource(String.Format("UPDATE `sectioning` 
                                    SET `school_year` = '" & schoolYear & "',
                                    `subject_id` = '" & subjectID & "',
                                    `instructor_id` = '" & instructorID & "',
                                    `inorder` = '" & Inorder & "',
                                    `section_name` = '" & Section & "',
                                    `number_students` = '" & NoOfStudents & "',
                                    `batch_id` = '" & batchId & "',
                                    `category_id` = '" & catID & "',
                                    `availability` = '" & availability & "'
                                    WHERE
	                                    `id` = '" & id & "';"))

        Catch ex As Exception

        End Try


    End Sub

    Friend Function getInstructor(SubjectID As String) As Object
        Dim sql As String = ""
        Try
            sql = "SELECT
                    `id`,
                    `name`,
                    `subject_id`			
                    FROM(
			                    SELECT
			                    subject_class_schedule.employee_id 'id',  
			                    subject_class_schedule.employee_name 'name', 
			                    subject_class_schedule.subject_id
			                    FROM
			                    subject_class_schedule
			                    WHERE
			                    subject_class_schedule.subject_id = '" & SubjectID & "'
			
			
			                    UNION
			
			                    SELECT 0 AS 'id','--- ALL ---' AS 'name',000 AS 'subject_id'
			)A ORDER BY `id`"
        Catch ex As Exception
        End Try
        Return DataSource(sql)
    End Function

    Friend Function getSemester() As Object
        Dim sql As String = ""
        Try
            sql = "
	            SELECT
	            `id`,
	            `name`				
	            FROM(				
			            SELECT 0 AS 'id','--- ALL ---' AS 'name'
			            UNION
			            SELECT 1 AS 'id','1ST SEMESTER' AS 'name'
			            UNION
			            SELECT 2 AS 'id','2ND SEMESTER' AS 'name'
			            UNION
			            SELECT 3 AS 'id','SUMMER' AS 'name'
			            UNION
			            SELECT 4 AS 'id','YEARLY' AS 'name'
                  )A"
        Catch ex As Exception
        End Try
        Return DataSource(sql)
    End Function
End Class
