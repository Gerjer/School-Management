Public Class EnrollmentListModel

    Public tag As Integer

    Friend Function getAcademicYear() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
'0' AS 'id',
students.academice_year 'name'
FROM
students
ORDER BY academice_year desc
    "
        Return DataSource(sql)
    End Function

    Friend Function getEnrollmentList(AcademicYear As String, Semester As String, CourseID As Integer) As DataTable

        Dim txt As String = ""

        If tag = 1 Then
            txt = " '' AS 'Grades' "
        Else
            '        txt = "students_subjects.finalgrade AS Grades"
            txt = "students_subjects.equivalent AS Grades"
        End If

        Dim sql As String = ""
        sql = "		 SELECT
		 IDnumber,
		 LastName,
		 FirstName,
		 MiddleName,
		 DateOfBirth,
		 Gender,
		 HomeAddress,
		 YearLevel,
		 CourseCode,
		 CourseDescription,
		 Grades,
		 Units
     FROM(
        	SELECT
					students.std_number AS IDnumber,
					person.last_name AS LastName,
					person.first_name AS FirstName,
					person.middle_name AS MiddleName,
					person.date_of_birth AS DateOfBirth,
					person.gender AS Gender,
					CASE WHEN person_address.address IS NOT NULL AND person_address.barangay IS NOT NULL AND person_address.citymunicipality IS NOT NULL THEN concat(person_address.address,', ',person_address.barangay,', ',person_address.citymunicipality)
                    WHEN person_address.address IS NOT NULL AND person_address.barangay IS NOT NULL AND person_address.citymunicipality IS NULL THEN concat(person_address.address,', ',person_address.barangay)
                    WHEN person_address.address IS NOT NULL AND person_address.barangay IS NULL AND person_address.citymunicipality IS NULL THEN person_address.address
                    WHEN person_address.address IS NULL AND person_address.barangay IS NOT NULL AND person_address.citymunicipality IS NULL THEN person_address.barangay
                    ELSE person_address.citymunicipality END AS 'HomeAddress',
					-- students.year_level AS YearLevel,
								CASE WHEN students.year_level = '1st year' THEN '1'
									 WHEN students.year_level = '2nd year' THEN '2'
									 WHEN students.year_level = '3rd year' then '3'
									 WHEN students.year_level = '4th year' then '4'
									 WHEN students.year_level = '5th year' then '5'
									 WHEN students.year_level = '6th year' then '6'
									 ELSE 7 END as 'YearLevel',
					subjects.`code` AS CourseCode,
					subjects.`name` AS CourseDescription,
					" & txt & ",
					(CAST(subjects.credit_hours AS CHAR)+0)  AS Units,
					students.academice_year,
					students.semester,
                    students.course_id
					FROM
					students
					INNER JOIN person ON students.person_id = person.person_id
					LEFT JOIN person_address ON person.person_id = person_address.person_id AND person_address.address_type_id = 1
					INNER JOIN students_subjects ON students.id = students_subjects.student_id
					INNER JOIN subjects ON students_subjects.subject_id = subjects.id
					WHERE
					students.academice_year = '" & AcademicYear & "' AND
					students.semester = '" & Semester & "' AND 
                    students.course_id = '" & CourseID & "' AND 
                    students.is_enrolled = 1

					-- ORDER BY Gender desc,LastName,YearLevel
					)A -- GROUP BY CourseCode
         ORDER BY YearLevel,Gender desc,LastName"
        Return DataSource(sql)
    End Function

    Friend Function getHeader() As DataTable
        Dim sql As String = ""
        sql = "		 SELECT
		 'No.',
		 'IDNumber',
		 'LastName',
		 'FirstName',
		 'MiddleName',
		 'DateOfBirth',
		 'Gender',
		 'HomeAddress',
		 'YearLevel',
		 'CourseCode',
		 'CourseDescription',
		 'Grades',
		 'Units'
		 
		 limit 0"
        Return DataSource(sql)
    End Function

    Friend Function getCourse(Optional CatID As Integer = Nothing) As Object
        Dim sql As String = ""
        sql = "SELECT
courses.id,
courses.course_name AS `name`,
courses.`code`,
courses.description
FROM
courses
WHERE
courses.is_deleted = 0 AND category_id = '" & CatID & "'
"
        Return DataSource(sql)
    End Function

    Friend Function getCateogry() As Object
        Dim sql As String = ""
        sql = "SELECT
	                student_categories.id, 
	                student_categories.`name`
                FROM
	                student_categories
                WHERE is_deleted = 0"

        Return DataSource(sql)
    End Function
End Class
