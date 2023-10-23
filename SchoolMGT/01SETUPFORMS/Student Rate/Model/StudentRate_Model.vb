Public Class StudentRate_Model
    Friend Function getCategory() As Object

        Dim sql As String = ""
        sql = "SELECT
	student_categories.id, 
	student_categories.`name`
FROM
	student_categories
WHERE
	student_categories.is_deleted = 0"
        Return DataSource(sql)

    End Function

    Friend Function getCourseGrade(CatId As Object) As Object

        Dim sql As String = ""
        sql = "SELECT
	courses.id, 
	courses.course_name 'name'
FROM
	courses
WHERE
	courses.category_id = '" & CatId & "'"
        Return DataSource(sql)

    End Function

    Friend Function getAcademicYear() As Object
        Dim sql As String = ""
        sql = "SELECT
			students.id,
			students.academice_year 'name'
		
		FROM
			students
		WHERE
			students.student_category_id = '" & _student_category_id & "' 
			GROUP BY academice_year
			ORDER BY DATE_FORMAT(students.admission_date,'%Y') desc,id desc
		 "
        Return DataSource(sql)
    End Function

    Friend Function getPersonList(AcademicYear As String, CourseID As Object, BatchID As Object) As Object

        Dim sql As String = ""
        sql = "SELECT student_rate.id,students.id'std_id',students.person_id,students.batch_id"
        sql += " ,CASE WHEN IFNULL(rate,0) > 0 THEN 'True' ELSE 'False' END AS 'INCLUDE'"
        sql += " ,Date_format(students.admission_date,'%m-%d-%Y')'ADMISSION DATE'"
        If CourseID Is Nothing Then
            sql += " ,(SELECT course_name FROM	courses WHERE	id = course_id) 'COURSE'"
        End If
        If BatchID Is Nothing Then
            sql += " ,(SELECT `name` FROM batches WHERE id = students.batch_id) 'BATCH GROUP' "
        End If
        sql += " ,person.display_name 'STUDENT NAME'"
        sql += " ,total 'TUITION'"
        sql += " ,IFNULL(rate,0)'RATE PER UNIT'"
        sql += " ,(SELECT
                         IFNULL( FORMAT( SUM( CASE WHEN IFNULL(student_rate.rate,0) = 0 THEN subjects.amount ELSE student_rate.rate END  * subjects.credit_hours ) + SUM( IFNULL(    subjects.amount_lab, 0 )), 2 ), 0 )	
	                        FROM
		                        students_subjects
		                        INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	                          LEFT JOIN student_rate ON students_subjects.student_id = student_rate.student_id AND student_rate.end_time is NULL
	                         WHERE
	                            students_subjects.student_id = students.id) 'NEW TUITION'"
        sql += " FROM students "
        sql += " INNER JOIN person ON students.person_id = person.person_id "
        sql += " LEFT JOIN student_rate ON students.id = student_rate.student_id AND student_rate.end_time IS NULL"
        sql += " INNER JOIN students_assessment ON students.id = students_assessment.student_id and masterfee LIKE '%TUITION%' "
        sql += " WHERE  academice_year = '" & AcademicYear & "'"
        If CourseID IsNot Nothing Then
            sql += " AND course_id = '" & CourseID & "'"
        End If
        If BatchID IsNot Nothing Then
            sql += " AND students.batch_id = '" & BatchID & "'"
        End If
        If CourseID Is Nothing And BatchID Is Nothing Then
            sql += " ORDER BY   `COURSE` ASC,`BATCH GROUP` ASC,`STUDENT NAME` ASC"
        ElseIf CourseID IsNot Nothing And BatchID Is Nothing Then
            sql += " ORDER BY `BATCH GROUP` ASC,`STUDENT NAME` ASC"
        Else
            sql += " ORDER BY `STUDENT NAME` ASC"
        End If
        Dim dt As New DataTable
        dt = DataSource(sql)
        Return dt

    End Function

    Friend Function getBatch(AcademicYear As String, CourseID As Object) As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT batches.id,batches.`name` "
        sql += " FROM 	students 	INNER JOIN 	batches"
        sql += " ON students.batch_id = batches.id"
        sql += " WHERE 	students.academice_year = '" & AcademicYear & "' AND is_enrolled = 1 "
        If CourseID IsNot Nothing Then
            sql += " AND students.course_id  = '" & CourseID & "'"
        End If
        sql += " ORDER BY `name`"
        Dim dt As New DataTable
        dt = DataSource(sql)
        Return dt
    End Function
End Class
