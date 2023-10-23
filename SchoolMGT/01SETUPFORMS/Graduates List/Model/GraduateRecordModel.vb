Public Class GraduateRecordModel
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
ORDER BY courses.category_name DESC"
        Return DataSource(sql)
    End Function

    Friend Function getAcademicYear() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
'1'AS 'id',
graduates_list.academic_year 'name'
FROM
graduates_list
ORDER BY
graduates_list.academic_year DESC"
        Return DataSource(sql)
    End Function

    Friend Function getStudentList(wHERE As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
'True' AS INCLUDE,
students.std_number,
person.last_name,
person.first_name,
person.middle_name,
person.gender,
CONCAT(person_address.address,person_address.barangay,person_address.citymunicipality)'address',
courses.course_name,
'' AS 'Recog',
'' As 'YearG',
'' As 'GradDate',
person.display_name,
students.semester,
students.academice_year

FROM
students
INNER JOIN person ON students.person_id = person.person_id
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN person_address ON person.person_id = person_address.person_id

" & wHERE & "

GROUP BY display_name
ORDER BY display_name
"
        Return DataSource(sql)
    End Function
End Class
