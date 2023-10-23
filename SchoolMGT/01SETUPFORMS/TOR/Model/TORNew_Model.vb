Imports DevExpress.XtraGrid.Views.Grid

Public Class TORNew_Model

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

    Friend Function getAcademicYear() As Object
        Dim sql As String = ""
        sql = "SELECT students.id,students.academice_year 'name' FROM students "
        If personID_image <> 0 Then
            sql += " WHERE students.person_id = '" & PERSON_ID & "'"
        End If
        sql += " GROUP BY academice_year ORDER BY id"
        Return DataSource(sql)
    End Function

    Friend Function PopulateColumn() As DataTable
        Dim sql As String = ""
        sql = "SELECT 
   '' AS 'INCLUDE',
	 '' AS 'CourseCode',
 	 '' AS 'SubjectName',
	 '' AS 'finalgrade',
 	 '' AS 're_exam',
	 '' AS 'credit_hours',
	 '' AS 'BackTrackID',
	 '' AS 'person_id',
	 '' AS 'StdID',
	 '' AS 'Semester',
	 '' AS 'academice_year',
	 '' AS 'SchoolName',
	 '' AS 'SchoolAddress',
	 '' AS 'year_level',
     '' AS 'program_name'
     LIMIT 0"
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

    Friend Function getYearLevel() As Object
        Dim sql As String = ""
        sql = "SELECT batches.id,batches.year_level 'name'"
        sql += " FROM students INNER JOIN batches ON students.batch_id = batches.id "
        sql += " WHERE students.status_type_id = 1 "
        If personID_image <> 0 Then
            sql += " AND students.person_id = '" & PERSON_ID & "'"
        End If
        sql += " GROUP BY name"

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

    Friend Function loadTOR(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "	     
			
	SELECT
	BackTrackID,
	person_id,
	StdID,
	Semester,
	academice_year,
	SchoolName,
	SchoolAddress,
	SemAY,
	year_level,
	CourseCode,
	SubjectName,
	finalgrade,
	re_exam,
	credit_hours,
    CONCAT(SchoolName,' - ',SchoolAddress) 'SchoolNameAddress'
	FROM(
				      SELECT
								backtrack_entry.id 'BackTrackID', 
								backtrack_entry.person_id,
								backtrack_entry.student_id AS 'StdID', 
                                backtrack_entry.semester AS 'Semester', 
								backtrack_entry.academic_year AS 'academice_year', 
								backtrack_entry.school_name 'SchoolName', 
								backtrack_entry.school_address 'SchoolAddress', 
		   			        	CONCAT(backtrack_entry.year_level,' - ',CASE WHEN backtrack_entry.semester = 'SUMMER' THEN
				  	    		'SUMMER' ELSE SUBSTRING(backtrack_entry.semester, 1, 7 ) END) AS 'SemAY',
					 			backtrack_entry.year_level,
								backtrack_entry.subject_code AS 'CourseCode', 
								backtrack_entry.subject_name AS 'SubjectName', 
								backtrack_entry.finalgrade , 
								backtrack_entry.re_exam, 
								backtrack_entry.credit_hours
								
							FROM
								backtrack_entry
								WHERE `status` = 'ACTIVE'
																		
                     
							UNION ALL
							
							
							SELECT
	            0 AS 'BackTrackID',
							person.person_id,
							students.id 'StdID',
							students.semester 'Semester',
							students.academice_year 'academice_year',
							'DON JOSE ECLEO MEMORIAL COLLEGE'AS 'SchoolName',
							'Justiniana Edera, San Jose, Dinagat Island' AS 'SchoolAddress',
						  	CONCAT(students.year_level,' - ',CASE WHEN students.semester = 'SUMMER' THEN
							'SUMMER' ELSE SUBSTRING(students.semester, 1, 7 ) END) AS 'SemAY',
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
							
				)A  WHERE person_id = '" & pERSON_ID & "'
				ORDER BY year_level,Semester"
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

    Friend Sub InsertRecord(gvRecord As GridView)

        For i As Integer = 0 To gvRecord.DataRowCount - 1

            DataSource(String.Format("INSERT INTO backtrack_entry (
                                      `person_id`,
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
                                        '" & gvRecord.GetRowCellValue(i, "person_id") & "',
                                        '" & gvRecord.GetRowCellValue(i, "SchoolName") & "',
                                        '" & gvRecord.GetRowCellValue(i, "SchoolAddress") & "',
                                        '" & gvRecord.GetRowCellValue(i, "program_name") & "',
                                        '" & gvRecord.GetRowCellValue(i, "Semester") & "',
                                        '" & gvRecord.GetRowCellValue(i, "academice_year") & "',
                                        '" & gvRecord.GetRowCellValue(i, "CourseCode") & "',
                                        '" & gvRecord.GetRowCellValue(i, "SubjectName") & "',
                                        '" & gvRecord.GetRowCellValue(i, "finalgrade") & "',
                                        '" & gvRecord.GetRowCellValue(i, "re_exam") & "',
                                       '" & gvRecord.GetRowCellValue(i, "credit_hours") & "',
                                        '" & gvRecord.GetRowCellValue(i, "year_level") & "'
                                  
                                       
                                      ) ;
                                    "))


        Next


    End Sub
End Class
