Imports DevExpress.XtraGrid.Views.Grid

Public Class Form9new_Model
    Friend Function getSchoolName() As Object
        Dim sql As String = ""
        sql = "SELECT 
	form9_collegiate_record.id, 
	form9_collegiate_record.school_name 'name'
FROM
	form9_collegiate_record
	
	GROUP BY `name`;"
        Return DataSource(sql)
    End Function

    Friend Function getFORM9_Main(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	person.display_name,
	person.last_name,
	person.first_name,
	person.middle_name,
		DATE_FORMAT(person.date_of_birth,'%M %d, %Y') 'date_of_birth',
	person.birth_place,
	(SELECT address FROM	person_address WHERE address_type_id = 1 AND	person_id = person.person_id LIMIT 1) 'HomeAddress',
	(SELECT contact_person FROM person_contact_person WHERE person_id = person.person_id LIMIT 1) 'guardian',
	person.gender,
	students.std_number,
	students.stature 'BasisAdmission',
	(SELECT course_name FROM courses WHERE id = students.course_id) 'Program',
	(SELECT section_name FROM courses WHERE id = students.course_id) 'Major',
	ifnull((SELECT DATE_FORMAT(date_graduated,'%M %d, %Y')  FROM graduate_student WHERE person_id = person.person_id AND status_type_id = 1 AND end_time IS NULL),'')'YearGraduate'
	
FROM
	person
	INNER JOIN students ON person.person_id = students.person_id AND students.status_type_id = 1 AND students.end_time IS NULL
WHERE
	person.status_type_id = 1 
	AND person.end_time IS NULL
	AND person.person_id = '" & pERSON_ID & "'"
        Return DataSource(sql)
    End Function

    Friend Function getEducationBackgroun(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	person_educational_attainment.school_address 'SchoolName', 
	CONCAT(Date_format(person_educational_attainment.date_from,'%Y'),'-',Date_format(person_educational_attainment.date_to,'%Y'))'SchoolYear'
FROM
	person_educational_attainment
WHERE
	person_educational_attainment.person_id = '" & pERSON_ID & "'"
        Return DataSource(sql)
    End Function

    Friend Function getSchoolAddress() As Object
        Dim sql As String = ""
        sql = "	
	SELECT 
	form9_collegiate_record.id, 
	form9_collegiate_record.school_address 'name'
FROM
	form9_collegiate_record
	
	GROUP BY `name`;
	"
        Return DataSource(sql)
    End Function

    Friend Function getCourse() As Object
        Dim sql As String = ""
        sql = "SELECT courses.id,courses.course_name 'name',courses.description "
        sql += " FROM students INNER JOIN courses ON students.course_id = courses.id AND courses.is_deleted = 0"
        sql += " WHERE students.status_type_id = 1  AND students.student_category_id  = 13"
        If personID_image <> 0 Then
            sql += " AND students.person_id = '" & PERSON_ID & "'"
        End If
        sql += " GROUP BY id"

        Return DataSource(sql)
    End Function

    Friend Function getBatch(academic_year As String) As Object
        Dim SQLEX As String = "SELECT DISTINCT batches.id "
        SQLEX += " ,batches.`name`,batches.year_level,batches.semester"
        SQLEX += " FROM batches INNER JOIN 	students ON batches.id = students.batch_id"
        SQLEX += " WHERE students.person_id  = '" & PERSON_ID & "'"
        If _academic_year <> "" Then
            SQLEX += " AND students.academice_year = '" & _academic_year & "'"
        End If
        If _courseID <> 0 Then
            SQLEX += " AND students.course_id = '" & _courseID & "'"
        End If

        SQLEX += " ORDER BY batches.year_level ASC,batches.semester ASC"

        Dim dt As DataTable
        dt = DataSource(SQLEX)
        Return dt
    End Function

    Friend Function getSubject() As Object
        Dim sql As String = ""
        sql = "SELECT
	subjects.id, 
	subjects.`name`, 
	subjects.`code`
FROM
	subjects
	INNER JOIN
	batches
	ON 
		subjects.batch_id = batches.id
	INNER JOIN
	courses
	ON 
		batches.course_id = courses.id
WHERE
	courses.category_id = 13
	
	GROUP BY `name`
	ORDER BY `name`"
        Return DataSource(sql)
    End Function

    Friend Sub InsertRecord1(dt As DataTable)


        Dim PersonID = dt(0)("PersonID") 'gvRecord.GetFocusedRowCellValue("PersonID")
        Dim StdID = dt(0)("StudentID")  'gvRecord.GetFocusedRowCellValue("StudentID")

        'Delete Insert
        DataSource(String.Format("DELETE FROM `form9_collegiate_record` WHERE person_id= '" & PersonID & "' AND student_id = '" & StdID & "';"))

        For Each row As DataRow In dt.Rows

            If row("INCLUDE").ToString = "True" Then

                DataSource(String.Format("INSERT INTO `form9_collegiate_record` (
                                      `person_id`,
                                      `student_id`,
                                      `school_name`,
                                      `school_address`,
                                      `program_name`,
                                      `semester`,
                                      `academic_year`,
                                      `subject_code`,
                                      `subject_name`,
                                      `finalgrade`,
                                      `credit_hours`,
                                      `year_level`,
                                      `credit_distribution_id`,
                                      `inorder`
                                    ) 
                                    VALUES
                                      (
                                        '" & row("PersonID") & "',
                                        '" & row("StudentID") & "',
                                        '" & row("SchoolName") & "',
                                        '" & row("SchoolAddress") & "',
                                        '" & row("ProgramName") & "',
                                        '" & row("Semester") & "',
                                        '" & row("AcademicYear") & "',
                                        '" & row("Code") & "',
                                        '" & row("SubjectTitle") & "',
                                        '" & row("FinalGrade") & "',
                                        '" & row("CreditsHours") & "',
                                        '" & row("YearLevel") & "',
                                        '" & row("CreditID") & "',
                                        '" & row("inorder") & "'

                                      ) ;
                                    "))


            End If



        Next




    End Sub

    Friend Sub DeleteRecord(form9ID As String)

        Dim sql As String = ""
        sql = "DELETE FROM form9_collegiate_record WHERE id = '" & form9ID & "'"
        DataSource(sql)

    End Sub

    Friend Function getCreditInOrder(CreditID As String) As Object
        Dim inorder As Object = DataObject(String.Format("SELECT SysPk FROM `credit_distribution` WHERE credit_distribution.id = '" & CreditID & "'"))
        Return inorder
    End Function

    Friend Function getForm9_Details(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "	SELECT
	 id,
	person_id,	
	school_name,
	school_address,
	SchoolNameAddress,
	YrSchoolAcademic,
	subject_code,
	subject_name,
	finalgrade,
	credit_hours,
	inorder,
	credit_distribution_id,
	semester,
	year_level,
	`name` 
	
				FROM(
						SELECT
								form9_collegiate_record.id,
							form9_collegiate_record.person_id,
							IFNULL( form9_collegiate_record.school_name, '' ) 'school_name',
							IFNULL( form9_collegiate_record.school_address, '' ) 'school_address',
							CONCAT(
								IFNULL( form9_collegiate_record.school_name, '' ),
								' - ',
							IFNULL( form9_collegiate_record.school_address, '' )) 'SchoolNameAddress',
							CONCAT(	form9_collegiate_record.year_level,'-',	
							CASE		
									WHEN form9_collegiate_record.semester = 'SUMMER' THEN
									'SUMMER' ELSE SUBSTRING( form9_collegiate_record.semester, 1, 7 ) 
								END,
								', ',
								form9_collegiate_record.academic_year 
							) 'YrSchoolAcademic',
							IFNULL( form9_collegiate_record.subject_code, '' ) 'subject_code',
							form9_collegiate_record.subject_name,
							IFNULL( form9_collegiate_record.finalgrade, '' ) 'finalgrade',
							form9_collegiate_record.credit_hours,
							form9_collegiate_record.inorder,
							form9_collegiate_record.credit_distribution_id,
							form9_collegiate_record.semester,
							form9_collegiate_record.year_level,
							credit_distribution.`name` 
						FROM
							form9_collegiate_record 
							INNER JOIN credit_distribution ON credit_distribution.id = form9_collegiate_record.credit_distribution_id

						WHERE
							form9_collegiate_record.`status` = 'ACTIVE'
							AND form9_collegiate_record.end_time IS NULL
							
							
							UNION ALL
							
							
							SELECT
							0 AS 'id',
							person.person_id,
							'DON JOSE ECLEO MEMORIAL COLLEGE'AS 'school_name',
							'Justiniana Edera, San Jose, Dinagat Island' AS 'school_address',
							CONCAT('DON JOSE ECLEO MEMORIAL COLLEGE',' - ','Justiniana Edera, San Jose, Dinagat Island') AS 'SchoolNameAddress',
							CONCAT(students.year_level,' - ',CASE WHEN students.semester = 'SUMMER' THEN
									'SUMMER' ELSE SUBSTRING(students.semester, 1, 7 ) END,', ',students.academice_year) AS 'YrSchoolAcademic',
							IFNULL(subjects.`code`, '' ) 'subject_code',
							subjects.`name` 'subject_name',
							IFNULL(students_subjects.equivalent, '' ) 'finalgrade',
							subjects.credit_hours,
							credit_distribution.SysPk 'inorder',
							credit_distribution.id 'credit_distribution_id',
							students.semester,
							students.year_level,
							credit_distribution.`name` 
								
						FROM
							students
							INNER JOIN person ON students.person_id = person.person_id AND person.status_type_id = 1 AND person.end_time IS NULL
							INNER JOIN students_subjects ON students.id = students_subjects.student_id
							INNER JOIN subjects	ON students_subjects.subject_id = subjects.id
							INNER JOIN credit_distribution ON subjects.credit_distribution_id = credit_distribution.id
						WHERE
							students.status_type_id = 1
							
							)A WHERE person_id = '" & pERSON_ID & "'
							ORDER BY year_level,semester,inorder"
#Region "OLD"
        '        sql = "SELECT
        '		form9_collegiate_record.id,
        '	form9_collegiate_record.person_id,
        '	IFNULL( form9_collegiate_record.school_name, '' ) 'school_name',
        '	IFNULL( form9_collegiate_record.school_address, '' ) 'school_address',
        '	CONCAT(
        '		IFNULL( form9_collegiate_record.school_name, '' ),
        '		' - ',
        '	IFNULL( form9_collegiate_record.school_address, '' )) 'SchoolNameAddress',
        '	CONCAT(
        '		form9_collegiate_record.year_level,
        '		'-',
        '	CASE

        '			WHEN form9_collegiate_record.semester = 'SUMMER' THEN
        '			'SUMMER' ELSE SUBSTRING( form9_collegiate_record.semester, 1, 7 ) 
        '		END,
        '		', ',
        '		form9_collegiate_record.academic_year 
        '	) 'YrSchoolAcademic',
        '	IFNULL( form9_collegiate_record.subject_code, '' ) 'subject_code',
        '	form9_collegiate_record.subject_name,
        '	IFNULL( form9_collegiate_record.finalgrade, '' ) 'finalgrade',
        '	form9_collegiate_record.credit_hours,
        '	form9_collegiate_record.inorder,
        '	form9_collegiate_record.credit_distribution_id,
        '	form9_collegiate_record.semester,
        '	form9_collegiate_record.year_level,
        '	credit_distribution.`name` 
        'FROM
        '	form9_collegiate_record 
        '	INNER JOIN credit_distribution ON credit_distribution.id = form9_collegiate_record.credit_distribution_id

        'WHERE
        '	form9_collegiate_record.`status` = 'ACTIVE'
        '	AND form9_collegiate_record.end_time IS NULL
        '	AND person_id = '" & pERSON_ID & "'

        '	ORDER BY semester,year_level,inorder"
#End Region

        Return DataSource(sql)
    End Function

    Friend Function loadForm9Record(pERSON_ID As Integer) As Object
        Dim sql As String = ""
        sql = "			SELECT  
								form9_collegiate_record.id 'BackTrackID', 
								form9_collegiate_record.person_id,
								form9_collegiate_record.student_id AS 'StdID', 
                form9_collegiate_record.semester AS 'Semester', 
								form9_collegiate_record.academic_year AS 'academice_year', 
								form9_collegiate_record.school_name 'SchoolName', 
								form9_collegiate_record.school_address 'SchoolAddress', 
								CONCAT(form9_collegiate_record.semester,' AY ',academic_year) 'SemAY',
								form9_collegiate_record.year_level,
								form9_collegiate_record.subject_code AS 'CourseCode', 
								form9_collegiate_record.subject_name AS 'SubjectName', 
								form9_collegiate_record.finalgrade , 
								IF(form9_collegiate_record.credit_hours = 0,'',form9_collegiate_record.credit_hours)'credit_hours',
								IFNULL(credit_distribution.SysPk,'') 'credit_inorder'
								
							FROM
								form9_collegiate_record
                                LEFT JOIN credit_distribution ON form9_collegiate_record.credit_distribution_id = credit_distribution.id
								WHERE person_id = '" & pERSON_ID & "'
                                ORDER BY academic_year
																		
                     "
        Return DataSource(sql)
    End Function

    Friend Sub InsertRecord(gvRecord As GridView)

        Dim PersonID = gvRecord.GetFocusedRowCellValue("PersonID")
        Dim StdID = gvRecord.GetFocusedRowCellValue("StudentID")

        'Delete Insert
        '     DataSource(String.Format("DELETE FROM `form9_collegiate_record` WHERE person_id= '" & PersonID & "' AND student_id = '" & StdID & "';"))

        For i As Integer = 0 To gvRecord.DataRowCount - 1

            '        If gvRecord.GetRowCellValue(i, "INCLUDE") = "True" Then


            DataSource(String.Format("INSERT INTO `form9_collegiate_record` (
                                      `person_id`,
                                      `student_id`,
                                      `school_name`,
                                      `school_address`,
                                      `program_name`,
                                      `semester`,
                                      `academic_year`,
                                      `subject_code`,
                                      `subject_name`,
                                      `finalgrade`,
                                      `credit_hours`,
                                      `year_level`,
                                      `credit_distribution_id`,
                                      `inorder`
                                    ) 
                                    VALUES
                                      (
                                        '" & gvRecord.GetRowCellValue(i, "PersonID") & "',
                                        '" & gvRecord.GetRowCellValue(i, "StudentID") & "',
                                        '" & gvRecord.GetRowCellValue(i, "SchoolName") & "',
                                        '" & gvRecord.GetRowCellValue(i, "SchoolAddress") & "',
                                        '" & gvRecord.GetRowCellValue(i, "ProgramName") & "',
                                        '" & gvRecord.GetRowCellValue(i, "Semester") & "',
                                        '" & gvRecord.GetRowCellValue(i, "AcademicYear") & "',
                                        '" & gvRecord.GetRowCellValue(i, "Code") & "',
                                        '" & gvRecord.GetRowCellValue(i, "SubjectTitle") & "',
                                        '" & gvRecord.GetRowCellValue(i, "FinalGrade") & "',
                                        '" & gvRecord.GetRowCellValue(i, "CreditsHours") & "',
                                        '" & gvRecord.GetRowCellValue(i, "YearLevel") & "',
                                        '" & gvRecord.GetRowCellValue(i, "CreditID") & "',
                                        '" & gvRecord.GetRowCellValue(i, "inorder") & "'

                                      ) ;
                                    "))

            '       End If

        Next



    End Sub

    Friend Function getColumnHeader() As DataTable
        Dim sql As String = ""
        sql = "SELECT ''AS 'INCLUDE',''AS'Code',''AS'SubjectTitle' ,''AS'FinalGrade' ,''AS'CreditsHours' ,''AS'CreditID' ,''AS'PersonID' ,''AS'StudentID' ,''AS'SchoolName' ,''AS'SchoolAddress' ,''AS'ProgramName',''AS'Semester',''AS'YearLevel',''AS'AcademicYear',''AS'inorder',''AS 'id' LIMIT 0"
        Return DataSource(sql)
    End Function

    Friend Function getCreditsDistribution() As Object

        Dim sql As String = ""
        sql = "SELECT
	id, 
	`name`,
     SysPk as 'inorder'
FROM
	credit_distribution
WHERE
	course_id = '" & _courseID & "'"
        Return DataSource(sql)

    End Function

    Friend Function getYearLevel() As Object
        Dim sql As String = ""
        sql = "SELECT batches.id,batches.year_level 'name'"
        sql += " FROM students INNER JOIN batches ON students.batch_id = batches.id "
        sql += " WHERE students.status_type_id = 1 "
        If personID_image <> 0 Then
            sql += " AND students.person_id = '" & PERSON_ID & "'"
        End If
        sql += " GROUP BY name"

#Region "OLD"
        'If _student_category_id = 13 Then
        '    sql = "SELECT
        '         year_level.id, 
        '         year_level.year_level 'name'
        '        FROM
        '         year_level
        '          WHERE id  < 5"
        'ElseIf _student_category_id = 14 Then
        '    sql = "SELECT
        '         year_level.id, 
        '         year_level.year_level 'name'
        '        FROM
        '         year_level
        '          WHERE id  < 7"
        'ElseIf _student_category_id = 15 Then
        '    sql = "SELECT
        '         year_level.id, 
        '         year_level.year_level 'name'
        '        FROM
        '         year_level
        '          WHERE id BETWEEN 7 AND 10"
        'Else
        '    sql = "SELECT
        '         year_level.id, 
        '         year_level.year_level 'name'
        '        FROM
        '         year_level
        '          WHERE id > 10"
        'End If
#End Region

        Return DataSource(sql)
    End Function

    Friend Sub UpdateRecord(gvRecord As GridView)

        For x As Integer = 0 To gvRecord.RowCount - 1

            Dim row As DataRow = gvRecord.GetDataRow(x)

            Dim sql As String = "UPDATE form9_collegiate_record"
            sql += " SET semester = '" & row.Item("Semester") & "',academic_year = '" & row.Item("AcademicYear") & "'"
            sql += " ,subject_code = '" & row.Item("Code") & "',subject_name = '" & row.Item("SubjectTitle") & "'"
            sql += " ,finalgrade = '" & row.Item("FinalGrade") & "',credit_hours = '" & row.Item("CreditsHours") & "'"
            sql += " ,year_level = '" & row.Item("YearLevel") & "',credit_distribution_id = '" & row.Item("CreditID") & "'"
            sql += " ,inorder = '" & row.Item("inorder") & "'"
            sql += " WHERE id = '" & row.Item("id") & "'"
            DataSource(sql)
        Next


    End Sub

    Friend Function getStudent() As Object
        Dim sql As String = ""
        sql = "SELECT
	person.person_id 'id', 
	person.display_name 'name'
FROM
	person
WHERE
	person.status_type_id = 1 AND
	person.end_time IS NULL
ORDER BY
	person.display_name ASC 
	"
        Return DataSource(sql)
    End Function

    Friend Function getCreditDistributionRecord(StudentID As Integer) As Object
        Dim sql As String = ""
        sql = "SELECT 'False' AS 'INCLUDE',
	subjects.`code` AS `Code`, 
	subjects.`name` AS SubjectTitle, 
	-- students_subjects.finalgrade AS FinalGrade, 
   (SELECT ratings FROM grading_system WHERE	equivalent = students_subjects.finalgrade) 'FinalGrade',
	subjects.credit_hours AS CreditsHours, 
	subjects.credit_distribution_id 'CreditID',
	students.person_id 'PersonID', 
	students.id 'StudentID',
	'' AS 'SchoolName',
	'' AS 'SchoolAddress',
	'' AS 'ProgramName', 
	students.semester 'Semester', 
	students.year_level 'YearLevel', 
	students.academice_year 'AcademicYear', 
	credit_distribution.SysPk 'inorder'
FROM
	students_subjects
	INNER JOIN
	students
	ON 
		students_subjects.student_id = students.id
	INNER JOIN
	subjects
	ON 
		students_subjects.subject_id = subjects.id
	LEFT JOIN
	credit_distribution
	ON 
		subjects.credit_distribution_id = credit_distribution.id
WHERE
	students_subjects.student_id = '" & StudentID & "'"
        Return DataSource(sql)


    End Function

    Friend Function getStudentID(pERSON_ID As Integer, batchID As Object) As Integer
        Dim id As Integer
        id = DataObject(String.Format("SELECT id  FROM students WHERE person_id = '" & pERSON_ID & "' and batch_id ='" & batchID & "' "))
        Return id
    End Function

    Friend Function getColumn(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "		SELECT		
				credit_inorder
		FROM(		
				SELECT
				inorder 'credit_inorder',
				person_id 'person_id'
				FROM form9_collegiate_record 
				
				UNION

				SELECT
				credit_distribution.SysPk 'credit_inorder',
				person.person_id 'person_id' 
				FROM students
				INNER JOIN person ON students.person_id = person.person_id AND person.status_type_id = 1 AND person.end_time IS NULL
				INNER JOIN students_subjects ON students.id = students_subjects.student_id
				INNER JOIN subjects	ON students_subjects.subject_id = subjects.id
				INNER JOIN credit_distribution ON subjects.credit_distribution_id = credit_distribution.id						
		
        )A WHERE person_id = '" & pERSON_ID & "'
				GROUP BY credit_inorder
				ORDER BY credit_inorder	

"
        Return DataSource(sql)
    End Function

    Friend Function getAcademicYear() As Object
        Dim sql As String = ""
        sql = "SELECT students.id,students.academice_year 'name' FROM students "
        If personID_image <> 0 Then
            sql += " WHERE students.person_id = '" & PERSON_ID & "'"
        End If
        sql += " GROUP BY academice_year ORDER BY id"
        Return DataSource(sql)
    End Function

    Friend Function getSemester() As Object
        Dim sql As String = ""
        sql = "SELECT	students.id,students.semester 'name'"
        sql += " FROM students"
        If personID_image <> 0 Then
            sql += " WHERE students.person_id = '" & PERSON_ID & "'"
        End If
        sql += " GROUP BY name"

        Return DataSource(sql)
    End Function

    Friend Function loadNewForm9Record(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "	SELECT
    id,
	person_id,	
	school_name,
	school_address,
   	credit_distribution_id,
	semester,
	year_level,
	`name`,
   	Program,
	academice_year,
	SchoolNameAddress,
	YrSchoolAcademic,
	subject_code,
	subject_name,
	finalgrade,
	credit_hours,
	inorder 'credit_inorder'

	
				FROM(
						SELECT
								form9_collegiate_record.id,
							form9_collegiate_record.person_id,
							IFNULL( form9_collegiate_record.school_name, '' ) 'school_name',
							IFNULL( form9_collegiate_record.school_address, '' ) 'school_address',
							CONCAT(
								IFNULL( form9_collegiate_record.school_name, '' ),
								' - ',
							IFNULL( form9_collegiate_record.school_address, '' )) 'SchoolNameAddress',
							CONCAT(	form9_collegiate_record.year_level,'-',	
							CASE		
									WHEN form9_collegiate_record.semester = 'SUMMER' THEN
									'SUMMER' ELSE SUBSTRING( form9_collegiate_record.semester, 1, 7 ) 
								END,
								', ',
								form9_collegiate_record.academic_year 
							) 'YrSchoolAcademic',
							IFNULL( form9_collegiate_record.subject_code, '' ) 'subject_code',
							form9_collegiate_record.subject_name,
							IFNULL( form9_collegiate_record.finalgrade, '' ) 'finalgrade',
							form9_collegiate_record.credit_hours,
							form9_collegiate_record.inorder,
							form9_collegiate_record.credit_distribution_id,
							form9_collegiate_record.semester,
							form9_collegiate_record.year_level,
							credit_distribution.`name`,
                           	form9_collegiate_record.program_name 'Program',
							form9_collegiate_record.academic_year 'academice_year'
						FROM
							form9_collegiate_record 
							INNER JOIN credit_distribution ON credit_distribution.id = form9_collegiate_record.credit_distribution_id

						WHERE
							form9_collegiate_record.`status` = 'ACTIVE'
							AND form9_collegiate_record.end_time IS NULL
							
							
							UNION ALL
							
							
							SELECT
							1 AS 'id',
							person.person_id,
							'DON JOSE ECLEO MEMORIAL COLLEGE'AS 'school_name',
							'Justiniana Edera, San Jose, Dinagat Island' AS 'school_address',
							CONCAT('DON JOSE ECLEO MEMORIAL COLLEGE',' - ','Justiniana Edera, San Jose, Dinagat Island') AS 'SchoolNameAddress',
							CONCAT(students.year_level,' - ',CASE WHEN students.semester = 'SUMMER' THEN
									'SUMMER' ELSE SUBSTRING(students.semester, 1, 7 ) END,', ',students.academice_year) AS 'YrSchoolAcademic',
							IFNULL(subjects.`code`, '' ) 'subject_code',
							subjects.`name` 'subject_name',
							IFNULL(students_subjects.equivalent, '' ) 'finalgrade',
							subjects.credit_hours,
							credit_distribution.SysPk 'inorder',
							credit_distribution.id 'credit_distribution_id',
							students.semester,
							students.year_level,
							credit_distribution.`name`,
                            (SELECT description FROM courses WHERE is_deleted = 0 AND id = 1) 'Program',
							students.academice_year
							 								
						FROM
							students
							INNER JOIN person ON students.person_id = person.person_id AND person.status_type_id = 1 AND person.end_time IS NULL
							INNER JOIN students_subjects ON students.id = students_subjects.student_id
							INNER JOIN subjects	ON students_subjects.subject_id = subjects.id
							INNER JOIN credit_distribution ON subjects.credit_distribution_id = credit_distribution.id
						WHERE
							students.status_type_id = 1
							
							)A WHERE person_id = '" & pERSON_ID & "'
							ORDER BY year_level,semester,inorder"
        Return DataSource(sql)
    End Function
End Class
