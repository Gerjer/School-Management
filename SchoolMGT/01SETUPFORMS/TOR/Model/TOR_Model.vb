Imports DevExpress.XtraGrid.Views.Grid
Imports SchoolMGT

Public Class TOR_Model

    Public graduate_status As Integer
    Public subject_code As String
    Public subject_list As DataTable
    Public subject_id As Integer

    Public BacktrackID As Integer

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

    Friend Function getReport_TotalColumn(pERSON_ID As Integer) As Integer
        Dim sql As String = ""
        sql = "SELECT
credit_distribution.SysPk 'credit_inorder'
	
FROM
	form9_collegiate_record
	INNER JOIN credit_distribution ON form9_collegiate_record.credit_distribution_id = credit_distribution.id
	WHERE person_id = '" & pERSON_ID & "'
	GROUP BY credit_inorder
ORDER BY 	credit_inorder											
			 "
        Return DataObject(sql)
    End Function

    Friend Function getTORDetails(pERSON_ID As Integer) As DataTable

#Region "old"
        ' Select Case
        '     BackTrackID,
        '     pERSON_ID,
        '     StdID,
        '     SchoolName,
        '     SchoolAddress,
        '     SemAY,
        '     Semester,
        '     academice_year,
        '     CourseCode,
        '     SubjectName,
        '     finalgrade,
        '     re_exam,
        '     credit_hours            
        '     FROM(
        '                 SELECT
        '0 AS 'BackTrackID',
        'pERSON_ID,
        '                     StdID,
        '                   SchoolName,
        '                     SchoolAddress,
        '                     CONCAT(Sem, academice_year) 'SemAY',
        '     Semester,
        '                     academice_year,
        '                     CourseCode,
        '                     SubjectName,
        '                     finalgrade,
        '                     re_exam,
        '                     credit_hours,
        '                     year_level

        '                     FROM(
        '                     SELECT
        '	pERSON_ID,
        '                         students.id 'StdID',	
        '     students.year_level,
        '                         (SELECT file.company_name FROM file) 'SchoolName',
        '	(SELECT file.address FROM file) 'SchoolAddress',
        '	courses.description 'Program',
        '     CASE WHEN students.semester = '1ST SEMESTER' THEN '1st Sem'
        '			 WHEN students.semester = '2ND SEMESTER' THEN '2nd Sem'
        '			 ELSE 'Summer' END AS 'Sem',
        '                             students.semester 'Semester', 	
        '		students.academice_year,
        '		subjects.`code`'CourseCode', 
        '		subjects.`name`'SubjectName', 
        '		students_subjects.finalgrade, 
        '		students_subjects.re_exam, 
        '		subjects.credit_hours

        'FROM
        '	students
        '	INNER JOIN batches ON students.batch_id = batches.id
        '	INNER JOIN students_subjects ON students.id = students_subjects.student_id
        '	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
        '	INNER JOIN courses ON students.course_id = courses.id
        ')A 


        'UNION ALL


        'SELECT
        '	backtrack_entry.id 'BackTrackID', 
        '	backtrack_entry.person_id,
        '	0 AS 'StdID', 
        '	backtrack_entry.school_name 'SchoolName', 
        '	backtrack_entry.school_address 'SchoolAddress', 
        '	CONCAT(CASE WHEN semester = '1ST SEMESTER' THEN '1st Sem'
        '			 WHEN semester = '2ND SEMESTER' THEN '2nd Sem'
        '			 ELSE 'Summer' END,academic_year) 'SemAY',
        '	backtrack_entry.semester AS 'Semester', 
        '	backtrack_entry.academic_year AS 'academice_year', 
        '	backtrack_entry.subject_code AS 'CourseCode', 
        '	backtrack_entry.subject_name AS 'SubjectName', 
        '	backtrack_entry.finalgrade , 
        '	backtrack_entry.re_exam, 
        '	backtrack_entry.credit_hours,
        '	backtrack_entry.year_level
        'FROM
        '	backtrack_entry

        ')A	
        'WHERE person_id = '" & pERSON_ID & "'
        'ORDER BY  person_id,academice_year,year_level,Semester
        '                     -- academice_year DESC,Semester,year_level	
#End Region

        Dim sql As String = ""
        sql = "		SELECT
	BackTrackID,
	person_id,
	StdID,
	Semester,
	Sem,
	academice_year,
	SchoolName,
	SchoolAddress,
	SemAY,
	year_level,
	CourseCode,
	SubjectName,
	finalgrade,
	re_exam,
	credit_hours
	FROM( 
						SELECT
								backtrack_entry.id 'BackTrackID', 
								backtrack_entry.person_id,
								backtrack_entry.student_id AS 'StdID', 
                                backtrack_entry.semester AS 'Semester',
                CASE WHEN backtrack_entry.semester = '1ST SEMESTER' THEN '1st Sem'
								WHEN backtrack_entry.semester = '2ND SEMESTER' THEN '2nd Sem'
								ELSE 'Summer' END AS 'Sem', 
								backtrack_entry.academic_year AS 'academice_year', 
								backtrack_entry.school_name 'SchoolName', 
								backtrack_entry.school_address 'SchoolAddress', 
								CONCAT(	CASE WHEN backtrack_entry.semester = '1ST SEMESTER' THEN '1st Sem'
								WHEN backtrack_entry.semester = '2ND SEMESTER' THEN '2nd Sem'
								ELSE 'Summer' END,' ',academic_year) 'SemAY',
								backtrack_entry.year_level,
								backtrack_entry.subject_code AS 'CourseCode', 
								backtrack_entry.subject_name AS 'SubjectName', 
								backtrack_entry.finalgrade , 
								backtrack_entry.re_exam, 
								backtrack_entry.credit_hours
								
							FROM
								backtrack_entry
							
							UNION ALL
                  									
							SELECT
	            0 AS 'BackTrackID',
							person.person_id,
							students.id 'StdID',
							students.semester 'Semester',
							CASE WHEN students.semester = '1ST SEMESTER' THEN '1st Sem'
							WHEN students.semester = '2ND SEMESTER' THEN '2nd Sem'
							ELSE 'Summer' END AS 'Sem', 
							students.academice_year 'academice_year',
							'DON JOSE ECLEO MEMORIAL COLLEGE'AS 'SchoolName',
							'Justiniana Edera, San Jose, Dinagat Island' AS 'SchoolAddress',
							CONCAT(	CASE WHEN students.semester = '1ST SEMESTER' THEN '1st Sem'
								WHEN students.semester = '2ND SEMESTER' THEN '2nd Sem'
								ELSE 'Summer' END,' ',students.academice_year) 'SemAY',
							students.year_level,
							subjects.`code` AS 'CourseCode', 
							subjects.`name` AS 'SubjectName', 			
							IFNULL(students_subjects.equivalent, '' ) 'finalgrade',
							IFNULL(students_subjects.re_exam, '' ) 're_exam',
              subjects.credit_hours
							
					
						FROM
							students
							INNER JOIN person ON students.person_id = person.person_id AND person.status_type_id = 1 AND person.end_time IS NULL
							INNER JOIN students_subjects ON students.id = students_subjects.student_id
							INNER JOIN subjects	ON students_subjects.subject_id = subjects.id
							INNER JOIN credit_distribution ON subjects.credit_distribution_id = credit_distribution.id
						WHERE
							students.status_type_id = 1		 		
							
							)A WHERE person_id = '" & pERSON_ID & "'
							ORDER BY year_level,semester
                  "
        Return DataSource(sql)
    End Function

    Friend Function CheckStudent(pERSON_ID As Integer, year_level As String, semester As String, academic_year As String) As Object
        Dim sql As String = ""
        sql = "SELECT 	student_id FROM	backtrack_entry WHERE	person_id = '" & pERSON_ID & "' AND 	year_level = '" & year_level & "' AND 	semester = '" & semester & "' AND 	academic_year = '" & academic_year & "'"
        Return DataObject(sql)
    End Function

    Friend Function getFinalGrade(studentID As Integer) As DataTable
        Dim sql As String = ""
        sql = "
						SELECT
							'False' AS 'INCLUDE',
							person_id,
							StdID,
						  SchoolName,
							SchoolAddress,
							Program,
							Semester,
							academice_year,
							CourseCode,
							SubjectName,
							finalgrade,
							re_exam,
							credit_hours,
							year_level
							
							FROM(
							SELECT
								person_id,
								students.id 'StdID',	
								students.year_level, 
								(SELECT file.company_name FROM file) 'SchoolName',
								(SELECT file.address FROM file) 'SchoolAddress',
								courses.description 'Program',
								CASE WHEN students.semester = '1ST SEMESTER' THEN '1st Sem'
										 WHEN students.semester = '2ND SEMESTER' THEN '2nd Sem'
										 ELSE 'Summer' END AS 'Sem',
                                    students.semester 'Semester', 	
									students.academice_year,
									subjects.`code`'CourseCode', 
									subjects.`name`'SubjectName', 
									students_subjects.finalgrade, 
									students_subjects.re_exam, 
									subjects.credit_hours
											 
							FROM
								students
								INNER JOIN batches ON students.batch_id = batches.id
								INNER JOIN students_subjects ON students.id = students_subjects.student_id
								INNER JOIN subjects ON students_subjects.subject_id = subjects.id
								INNER JOIN courses ON students.course_id = courses.id
						     )A
						     WHERE StdID = '" & studentID & "'
							  "
        Return DataSource(sql)
    End Function

    Friend Function creatHeaderSubject() As DataTable
        Dim sql As String = ""
        sql = "SELECT '' AS 'Semester',''AS 'academice_year',''AS 'CourseCode',''AS SubjectName,'' AS 'finalgrade','' AS 're_exam',''AS 'credit_hours'"
        Return DataSource(sql)

    End Function

    Friend Sub Insert(view As frmTOR, gvFinalGrade As GridView, SelectedTab As String, gvSubjectList As GridView)


        'DELETE INSERT  transcript_detail_file

        DataSource(String.Format("DELETE FROM transcript_detail_file WHERE person_id = '" & PERSON_ID & "'"))

        DataSource(String.Format("INSERT INTO `transcript_detail_file` (
                      `person_id`,
                      `remarks_purpose`,
                      `remarks_graduate`,
                      `remarks_nstp`,
                      `subject_code`,
                      `graduated`,
                      `date_graduation`,
                      `photo_path`,
                      `subject_id` 
                    ) 
                    VALUES
                       ( 
                         '" & PERSON_ID & "',
                         '" & view.txtPurpose.Text & "',
                         '" & view.txtGraduated.Text & "',
                         '" & view.txtNSTP.Text & "',
                         '" & subject_code & "',
                         '" & graduate_status & "',
                         '" & Format(view.dtpDateGraduation.Value, "yyyy-MM-dd") & "',
                         '" & view.txtFilePath.Text & "',
                         '" & subject_id & "'
                       ) ;

                    "))


        'DELETE INSERT  backtrack_entry


        If OPERATION = "ADD" Then
            If SelectedTab = "Backtrack Entry" Then

                Try
                    For Each row As DataRow In subject_list.Rows

                        DataSource(String.Format("INSERT INTO `backtrack_entry` (
                          `person_id`,
                           student_id,
                          `school_name`,
                          `school_address`,
                          `program_name`,
                          `semester`,
                          `academic_year`,
                          `subject_code`,
                          `subject_name`,
                          `finalgrade`,
                          `re_exam`,
                          `credit_hours`,
                          `year_level`
                        ) 
                        VALUES
                          (  
                            '" & PERSON_ID & "',                      
                            '" & view.txtStudentID.Text & "',
                            '" & view.txtschool_name.Text & "',
                            '" & view.txtschool_address.Text & "',
                            '" & view.txtprogram_name.Text & "',
                            '" & row("Semester").ToString & "',
                            '" & row("academice_year").ToString & "',
                            '" & row("CourseCode").ToString & "',
                            '" & row("SubjectName").ToString & "',
                            '" & row("finalgrade").ToString & "',
                            '" & row("re_exam").ToString & "',
                            '" & row("credit_hours").ToString & "',
                            '" & row("year_level").ToString & "'
                           ) ;

                        "))

                    Next
                Catch ex As Exception

                End Try


            Else

                Try

                    For i As Integer = 0 To gvFinalGrade.DataRowCount - 1
                        If gvFinalGrade.GetRowCellValue(i, "INCLUDE") = "True" Then

                            DataSource(String.Format("INSERT INTO `backtrack_entry` (
                          `person_id`,
                           student_id,
                          `school_name`,
                          `school_address`,
                          `program_name`,
                          `semester`,
                          `academic_year`,
                          `subject_code`,
                          `subject_name`,
                          `finalgrade`,
                          `re_exam`,
                          `credit_hours`,
                          `year_level`
                        ) 
                        VALUES
                          (  
                            '" & gvFinalGrade.GetRowCellValue(i, "person_id") & "',
                             '" & gvFinalGrade.GetRowCellValue(i, "StdID") & "',
                             '" & gvFinalGrade.GetRowCellValue(i, "SchoolName") & "',
                              '" & gvFinalGrade.GetRowCellValue(i, "SchoolAddress") & "',
                               '" & gvFinalGrade.GetRowCellValue(i, "Program") & "',
                              '" & gvFinalGrade.GetRowCellValue(i, "Semester") & "',
                             '" & gvFinalGrade.GetRowCellValue(i, "academice_year") & "',
                               '" & gvFinalGrade.GetRowCellValue(i, "CourseCode") & "',
                             '" & gvFinalGrade.GetRowCellValue(i, "SubjectName") & "',
                               '" & gvFinalGrade.GetRowCellValue(i, "finalgrade") & "',
                              '" & gvFinalGrade.GetRowCellValue(i, "re_exam") & "',
                             '" & gvFinalGrade.GetRowCellValue(i, "credit_hours") & "',
                            '" & gvFinalGrade.GetRowCellValue(i, "year_level") & "'
                           ) ;

                        "))


                        End If
                    Next

                Catch ex As Exception

                End Try


            End If

            MsgBox("Record Save...", MsgBoxStyle.Information, "Successfully!")

        Else

            'Update TOR
            DataSource(String.Format("UPDATE 
                          `backtrack_entry` 
                        SET
                          `school_name` = '" & view.txtschool_name.Text & "',
                          `school_address` = '" & view.txtschool_address.Text & "',
                          `semester` = '" & view.cmbsemester.Text & "',
                          `academic_year` = '" & view.txtacademic_year.Text & "',
                          `subject_code` = '" & view.txtsubject_code.Text & "',
                          `subject_name` = '" & view.txtsubject_name.Text & "',
                          `finalgrade` = '" & view.txtfinalgrade.Text & "',
                          `re_exam` = '" & view.txtre_exam.Text & "',
                          `credit_hours` = '" & view.txtcredit_hours.Text & "',
                          `year_level` = '" & view.cmbYearLevel.Text & "'
                        WHERE `id` = '" & BacktrackID & "' ;

                                      "))


            MsgBox("Record Update...", MsgBoxStyle.Information, "Successfully!")

        End If



    End Sub


    Friend Function getTOR(personID As Object) As DataTable

#Region "OLD"
        '      Select Case
        '      0 AS 'BackTrackID',
        'PERSON_ID,
        '      StdID,
        '      SchoolName,
        '      Program,
        '      CONCAT(Semester,' ',academice_year) 'SemAY',
        '      CourseCode,
        '      SubjectName,
        '      finalgrade,
        '      re_exam,
        '      credit_hours

        '      FROM(
        '      SELECT
        '	PERSON_ID,
        '          students.id 'StdID',	
        '          students.year_level,
        '          (SELECT CONCAT(file.company_name,' ',file.address)'SchoolName' FROM file)'SchoolName',
        '          courses.description 'Program',
        '          CASE WHEN students.semester = '1ST SEMESTER' THEN '1st Sem'
        '			 WHEN students.semester = '2ND SEMESTER' THEN '2nd Sem'
        '			 ELSE 'Summer' END AS 'Semester',
        '		students.academice_year,
        '		subjects.`code`'CourseCode', 
        '		subjects.`name`'SubjectName', 
        '		students_subjects.finalgrade, 
        '		students_subjects.re_exam, 
        '		subjects.credit_hours					 
        'FROM
        '	students
        '	INNER JOIN batches ON students.batch_id = batches.id
        '	INNER JOIN students_subjects ON students.id = students_subjects.student_id
        '	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
        '          INNER JOIN courses ON students.course_id = courses.id

        'ORDER BY person_id,year_level		
        ')A WHERE person_id = '" & personID & "'
#End Region
#Region "old1"
        ' Select Case
        '     BackTrackID,
        '     PERSON_ID,
        '     SchoolName,
        '     SchoolAddress,
        '     SemAY,
        '     Semester,
        '     academice_year,
        '     CourseCode,
        '     SubjectName,
        '     finalgrade,
        '     re_exam,
        '     credit_hours            
        '     FROM(
        '                 SELECT
        '0 AS 'BackTrackID',
        'PERSON_ID,
        '                     StdID,
        '                   SchoolName,
        '                     SchoolAddress,
        '                     CONCAT(Sem, academice_year) 'SemAY',
        '     Semester,
        '                     academice_year,
        '                     CourseCode,
        '                     SubjectName,
        '                     finalgrade,
        '                     re_exam,
        '                     credit_hours,
        '                     year_level

        '                     FROM(
        '                     SELECT
        '	PERSON_ID,
        '                         students.id 'StdID',	
        '     students.year_level,
        '                         (SELECT file.company_name FROM file) 'SchoolName',
        '	(SELECT file.address FROM file) 'SchoolAddress',
        '	courses.description 'Program',
        '     CASE WHEN students.semester = '1ST SEMESTER' THEN '1st Sem'
        '			 WHEN students.semester = '2ND SEMESTER' THEN '2nd Sem'
        '			 ELSE 'Summer' END AS 'Sem',
        '                             students.semester 'Semester', 	
        '		students.academice_year,
        '		subjects.`code`'CourseCode', 
        '		subjects.`name`'SubjectName', 
        '		students_subjects.finalgrade, 
        '		students_subjects.re_exam, 
        '		subjects.credit_hours

        'FROM
        '	students
        '	INNER JOIN batches ON students.batch_id = batches.id
        '	INNER JOIN students_subjects ON students.id = students_subjects.student_id
        '	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
        '	INNER JOIN courses ON students.course_id = courses.id
        ')A 


        'UNION ALL


        'SELECT
        '	backtrack_entry.id 'BackTrackID', 
        '	backtrack_entry.person_id,
        '	0 AS 'StdID', 
        '	backtrack_entry.school_name 'SchoolName', 
        '	backtrack_entry.school_address 'SchoolAddress', 
        '	CONCAT(semester,academic_year) 'SemAY',
        '	backtrack_entry.semester AS 'Semester', 
        '	backtrack_entry.academic_year AS 'academice_year', 
        '	backtrack_entry.subject_code AS 'CourseCode', 
        '	backtrack_entry.subject_name AS 'SubjectName', 
        '	backtrack_entry.finalgrade , 
        '	backtrack_entry.re_exam, 
        '	backtrack_entry.credit_hours,
        '	backtrack_entry.year_level
        'FROM
        '	backtrack_entry

        ')A	
        'WHERE person_id = '" & personID & "'
        'ORDER BY person_id,year_level	
#End Region

        Dim sql As String = ""
        sql = "		SELECT
								backtrack_entry.id 'BackTrackID', 
								backtrack_entry.person_id,
								backtrack_entry.student_id AS 'StdID', 
                                backtrack_entry.semester AS 'Semester', 
								backtrack_entry.academic_year AS 'academice_year', 
								backtrack_entry.school_name 'SchoolName', 
								backtrack_entry.school_address 'SchoolAddress', 
							    CONCAT(	CASE WHEN backtrack_entry.semester = '1ST SEMESTER' THEN '1st Sem'
								WHEN backtrack_entry.semester = '2ND SEMESTER' THEN '2nd Sem'
								ELSE 'Summer' END,' ',academic_year) 'SemAY',
								backtrack_entry.year_level,
								backtrack_entry.subject_code AS 'CourseCode', 
								backtrack_entry.subject_name AS 'SubjectName', 
								backtrack_entry.finalgrade , 
								backtrack_entry.re_exam, 
								backtrack_entry.credit_hours
								
							FROM
								backtrack_entry
								WHERE person_id = '" & personID & "'
																		
                     "
        Return DataSource(sql)
    End Function

    Friend Function getAcademicDetails(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	courses.course_name, 
	batches.`name`, 
	students.year_level, 
	students.semester, 
	students.academice_year, 
	students.id, 
	students.person_id
FROM
	students
	INNER JOIN
	courses
	ON 
		students.course_id = courses.id
	INNER JOIN
	batches
	ON 
		students.batch_id = batches.id
WHERE
	students.person_id = '" & pERSON_ID & "'
    ORDER BY id
"
        Return DataSource(sql)
    End Function

    Friend Function TORRemarks(personID As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	transcript_detail_file.remarks_purpose, 
	transcript_detail_file.remarks_graduate, 
	transcript_detail_file.remarks_nstp, 
	transcript_detail_file.subject_code, 
	transcript_detail_file.graduated, 
	transcript_detail_file.date_graduation, 
	transcript_detail_file.photo_path,
    transcript_detail_file.subject_id

FROM
	transcript_detail_file
WHERE
	transcript_detail_file.person_id = '" & personID & "'"

        Return DataSource(sql)
    End Function

    Friend Function getStudentMain(PersonID As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT DISTINCT
	person.person_id, 
	person.display_name, 
	person.gender, 
	person.date_of_birth, 
	person.birth_place, 
	person_address.address, 
	person_educational_attainment.school_address, 
	CONCAT(DATE_FORMAT(person_educational_attainment.date_from,'%Y'),'-',DATE_FORMAT(person_educational_attainment.date_to,'%Y')) AS AY, 
	students.std_number, 
	courses.description,
	courses.section_name 'major.subject',
  students.enrollmentAS 'basis.admition',
	person_contact_person.contact_person 'parents',
	transcript_detail_file.date_graduation
	
	
FROM
	person
	LEFT JOIN
	person_address
	ON 
		person.person_id = person_address.person_id AND
		person_address.address_type_id = 1
	LEFT JOIN
	person_educational_attainment
	ON 
		person.person_id = person_educational_attainment.person_id
	INNER JOIN
	students
	ON 
		person.person_id = students.person_id
	INNER JOIN
	courses
	ON 
		students.course_id = courses.id
	LEFT JOIN person_contact_person ON person.person_id = person_contact_person.person_id
	LEFT JOIN transcript_detail_file ON person.person_id = transcript_detail_file.person_id
WHERE
	person.status_type_id = 1 AND
	person.end_time IS NULL AND
	person.person_id = '" & PersonID & "'"
        Return DataSource(sql)

    End Function

    Friend Function CreatHeader() As DataTable
        Dim sql As String = ""
        sql = "SELECT '' AS 'BackTrackID',''as'person_id',''AS 'StdID','' AS 'SchoolName','' AS 'SchoolAddress','' as 'SemAY','' AS 'Semester',''AS 'academice_year','' AS 'CourseCode','' AS 'SubjectName','' AS 'finalgrade','' AS 're_exam', '' AS 'credit_hours' LIMIT 0"
        Return DataSource(sql)
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

    Friend Function getYearLevel(CatID) As Object
        Dim sql As String = ""
        If CatID = 13 Then
            sql = "SELECT
	                year_level.id, 
	                year_level.year_level 'name'
                FROM
	                year_level
                  WHERE id  < 5"
        ElseIf CatID = 14 Then
            sql = "SELECT
	                year_level.id, 
	                year_level.year_level 'name'
                FROM
	                year_level
                  WHERE id  < 7"
        ElseIf CatID = 15 Then
            sql = "SELECT
	                year_level.id, 
	                year_level.year_level 'name'
                FROM
	                year_level
                  WHERE id BETWEEN 7 AND 10"
        Else
            sql = "SELECT
	                year_level.id, 
	                year_level.year_level 'name'
                FROM
	                year_level
                  WHERE id > 10"
        End If


        Return DataSource(sql)
    End Function
End Class
