Public Class AdmissionRecordModel

    'Dim sql As String = ""
    '    sql = ""
    '    Return DataSource(sql)
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

    Friend Function getCourseGrade(catID As Integer) As Object
        Dim sql As String = ""
        sql = "SELECT
courses.id, 
courses.course_name 'name'
FROM
courses
WHERE
courses.is_deleted = 0 AND
	category_id = '" & catID & "'"
        Return DataSource(sql)
    End Function

    Friend Function getBatchYear() As Object
        Dim sql As String = ""
        sql = "
SELECT DISTINCT
    1 as 'id',
    batches.school_year 'name'
    FROM
    batches
    WHERE school_year is NOT NULL
    ORDER BY school_year DESC"
        Return DataSource(sql)
    End Function

    Friend Function getBatch(courseID As Integer, year_batch As String, semester As String, year_level As String) As Object
        Dim sql As String = ""
        sql = "
SELECT batches.id, name FROM batches
            INNER JOIN courses
            ON (batches.course_id = courses.id)
            WHERE batches.is_deleted =0 AND batches.is_active=1
            AND course_id='" & courseID & "' AND batches.school_year = '" & year_batch & "'
            AND semester = '" & semester & "' AND year_level = '" & year_level & "'

"
        Return DataSource(sql)
    End Function

    Friend Function getYearLevel(CatID As Integer) As Object
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

    Friend Function getScholarGrant() As Object
        Dim sql As String = ""
        sql = "SELECT code 'id', name, fullDeduct from scholarship_grant  order by code"
        Return DataSource(sql)
    End Function

    Friend Function getExistingIDnumber(iDNumber As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
                    students.id,
                    person.last_name,
                    person.first_name,
                    person.middle_name,
                    person_photo.photo_file_name,
                    students.scholarshipgrant,
                    person.gender,
                    students.batch_id

                    FROM
                    students
                    INNER JOIN person ON students.person_id = person.person_id AND students.status_type_id = 1 AND person.end_time IS NULL
                    INNER JOIN person_photo ON person.person_id = person_photo.person_id
                    WHERE
                    students.class_roll_no = '" & iDNumber & "'
                    ORDER BY
                    students.id DESC
                    LIMIT 1"
        Return DataSource(sql)
    End Function
End Class
