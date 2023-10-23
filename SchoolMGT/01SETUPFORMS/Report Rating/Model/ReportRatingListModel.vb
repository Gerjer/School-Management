Public Class ReportRatingListModel
    Friend Function getListStudent(AcademicYear As String, Semester As String, YearLevel As String, CourseID As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT
'False' AS 'INCLUDE',
students.id,
-- person.display_name,
-- concat(person.first_name,'  ',substring(person.middle_name,1,1),'. ',person.last_name) 'display_name',
concat(person.last_name,', ',person.first_name,'  ',substring(person.middle_name,1,1),'.') 'display_name',

students.year_level,
students.semester,
students.academice_year,
courses.section_name,
concat(courses.description,'  (',courses.`code`,')') AS Course,
subjects.`name` 'SubjName',
subjects.credit_hours 'Units',
students_subjects.finalgrade 'Rating',
count(students_subjects.finalgrade)'No.Subject',
sum(students_subjects.finalgrade)'TotalRating',
-- ifnull(round(sum(students_subjects.equivalent) / count(students_subjects.equivalent),1),0) 'Average'
FORMAT(ifnull(round(sum(students_subjects.equivalent) / count(students_subjects.equivalent),1),0),1) 'Average'

FROM
students
INNER JOIN person ON person.person_id = students.person_id
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN students_subjects ON students.id = students_subjects.student_id
INNER JOIN subjects ON students_subjects.subject_id = subjects.id

WHERE
students.academice_year = '" & AcademicYear & "' AND
students.year_level = '" & YearLevel & "' AND
students.semester = '" & Semester & "' AND 
courses.id = '" & CourseID & "'

GROUP BY
students.id
ORDER BY
person.display_name ASC
"
        Return DataSource(sql)
    End Function

    Friend Function getYear(catID As String) As Object
        Dim sql As String = ""
        If catID = "13" Then
            sql = "SELECT id,year_level 'name' FROM `year_level` WHERE id < 5;"
        ElseIf catID = "14" Then
            sql = "SELECT id,year_level 'name' FROM `year_level` WHERE id < 7;"
        ElseIf catID = "15" Then
            sql = "SELECT id,year_level 'name' FROM `year_level` WHERE id BETWEEN 7 AND 10;"
        ElseIf catID = "16" Then
            sql = "SELECT id,year_level 'name' FROM `year_level` WHERE id > 10;"
        Else
            sql = "SELECT id,year_level 'name' FROM `year_level`;"
        End If
        Return DataSource(sql)
    End Function

    Friend Function getReportRating(stdID As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT
students.id,
-- person.display_name,
concat(person.first_name,'  ',substring(person.middle_name,1,1),'. ',person.last_name) 'display_name',
students.year_level,
students.semester,
students.academice_year,
-courses.section_name,
concat(courses.description,' (',courses.`code`,')') AS Course,
subjects.`code`'SubjCode',
subjects.`name` 'SubjName',
subjects.credit_hours 'Units',
format(students_subjects.equivalent,1) 'Rating'
FROM
students
INNER JOIN person ON person.person_id = students.person_id
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN students_subjects ON students.id = students_subjects.student_id
INNER JOIN subjects ON students_subjects.subject_id = subjects.id
WHERE
students.id = '" & stdID & "'


ORDER BY
person.display_name ASC
"
        Return DataSource(sql)
    End Function

    Friend Function gerAverage(stdID As Object) As Double
        Dim sql As String = ""
        sql = "SELECT
IFNULL(Average,0)'Average'
from(
SELECT
students.id,
students_subjects.finalgrade 'Rating',
count(students_subjects.finalgrade)'No.Subject',
sum(students_subjects.finalgrade)'TotalRating',
-- round(sum(students_subjects.finalgrade) / count(students_subjects.finalgrade),1) 'Average'
round(sum(students_subjects.equivalent) / count(students_subjects.equivalent),1) 'Average'

FROM
students
INNER JOIN person ON person.person_id = students.person_id
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN students_subjects ON students.id = students_subjects.student_id
INNER JOIN subjects ON students_subjects.subject_id = subjects.id
WHERE
students.id = '" & stdID & "'

GROUP BY
students.id
ORDER BY
person.display_name ASC
)A "
        Return DataObject(sql)
    End Function

    Friend Function gerNewAverage(average As Decimal) As Object
        Dim result As String = ""
        Dim sql As String = ""
        sql = "SELECT grading_system.equivalent FROM	grading_system WHERE grading_system.ratings = '" & average & "'"
        result = DataObject(sql)
        Return result
    End Function

    Friend Function getCourse(CatID As String) As Object

        Dim sql As String = ""

        If CatID = "" Then
            sql = "SELECT
                    courses.id,
                    -- concat(courses.description,'  (',courses.`code`,')')'name',
                    courses.`code`'name',
                    courses.`code`,
                    courses.section_name,
                    courses.description
                    FROM
                    courses
                    WHERE
                    courses.is_deleted = 0
                    "
        Else
            sql = "SELECT
	                    courses.id, 
	                    courses.course_name 'name',
                        courses.description
                    FROM
	                    courses
                    WHERE
	                    courses.is_deleted = 0 AND
	                    courses.category_id = '" & CatID & "'"
        End If


        Return DataSource(sql)
    End Function

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
End Class
