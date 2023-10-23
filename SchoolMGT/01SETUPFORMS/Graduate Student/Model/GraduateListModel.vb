Public Class GraduateListModel
    Friend Function LoadList() As Object
        Dim sql As String = ""
        sql = "SELECT
	graduate_student.class_roll_number, 
	graduate_student.student_name, 
	graduate_student.date_birth, 
	graduate_student.gender, 
	graduate_student.date_admitted, 
	graduate_student.degree_program, 
	graduate_student.program_major, 
	graduate_student.date_graduated, 
	graduate_student.complete_details,
    graduate_student.person_id,
    graduate_student.graduate_student_id 'id'
FROM
	graduate_student
	WHERE status_type_id = 1"
        Return DataSource(sql)
    End Function

    Friend Function LoadPRC() As DataTable
        Dim sql As String = ""
        sql = "SELECT
	graduate_student.class_roll_number, 
	graduate_student.date_birth, 
	person.last_name, 
	person.first_name, 
	person.middle_name, 
	graduate_student.gender, 
	graduate_student.date_graduated, 
	graduate_student.degree_program, 
	graduate_student.program_major, 
	graduate_student.authority_number, 
	graduate_student.authority_year_granted
FROM
	graduate_student
	INNER JOIN
	person
	ON 
		graduate_student.person_id = person.person_id AND person.status_type_id = 1 AND 
		graduate_student.authority_number <> ''
		"
        Return DataSource(sql)
    End Function

    Friend Function getList(AcademicYear As String, Semester As String, CourseID As Object) As Object
        Dim WHERE As String = ""
        If CourseID = 0 Then
            WHERE = "WHERE academic_year = '" & AcademicYear & "' AND semester = '" & Semester & "'"
        Else
            WHERE = "WHERE academic_year = '" & AcademicYear & "' AND semester = '" & Semester & "' AND courses.id = '" & CourseID & "'"
        End If

        Dim sql As String = ""
        sql = "SELECT
graduates_list.id,
person.person_id,
(SELECT DISTINCT
students.std_number
FROM
students
WHERE
students.person_id = person.person_id
)'stdNumber',
person.last_name,
person.first_name,
person.middle_name,
person.gender,
CONCAT(person_address.address,', ',person_address.barangay,', ',person_address.citymunicipality)'Address',
courses.course_name 'Program',
graduates_list.recognition_no,
graduates_list.year_graduate,
graduates_list.graduation_date,
graduates_list.academic_year,
graduates_list.semester,
courses.id 'CourseID'

FROM
graduates_list
INNER JOIN person ON graduates_list.person_id = person.person_id
INNER JOIN courses ON graduates_list.course_id = courses.id
LEFT JOIN person_address ON person.person_id = person_address.person_id

" & WHERE & "
GROUP BY last_name
ORDER BY course_name,last_name"
        Return DataSource(sql)
    End Function

    Friend Function LoadStudent() As DataTable
        Dim sql As String = ""
        sql = "SELECT
person_id,
display_name,
`gRAD`
FROM(
SELECT
	person.person_id, 
	person.display_name,
	(SELECT
	graduate_student.student_name
FROM
	graduate_student
WHERE
	graduate_student.person_id = person.person_id) 'gRAD'
FROM
	person
WHERE
	person.status_type_id = 1 AND person.person_type_id = 2 

	GROUP BY display_name
	ORDER BY display_name
	)A WHERE A.`gRAD` IS  NULL"
        Return DataSource(sql)
    End Function

    Friend Function getCourse() As Object
        Dim sql As String = ""
        sql = "SELECT
courses.id,
courses.course_name 'name',
courses.category_name
FROM
courses
WHERE
courses.is_deleted = 0 AND courses.course_name LIKE '%GRADE 12%' OR  courses.category_name = 'COLLEGE' OR courses.course_name = 'GRADE-6'

GROUP BY courses.course_name
ORDER BY courses.category_name DESC
"
        Return DataSource(sql)
    End Function

    Friend Function getAcademicYear() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT students.academice_year 'name'"
        sql += " FROM students"
        sql += " WHERE academice_year is NOT NULL"
        Return DataSource(sql)
    End Function
End Class
