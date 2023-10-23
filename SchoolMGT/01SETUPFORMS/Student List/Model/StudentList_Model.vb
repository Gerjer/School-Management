Public Class StudentList_Model

    Public LabelName_List As New List(Of Tuple(Of String, String))

    Friend Function getCategory() As DataTable
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

    Friend Function getAcademicYear(catID As Object) As Object
        Dim sql As String = ""
        sql = "SELECT
			students.id,
			students.academice_year 'name',
			'False'
		FROM
			students
		WHERE
			students.student_category_id = '" & catID & "' AND students.year_level <> '' AND students.semester <> ''
			GROUP BY academice_year
			ORDER BY DATE_FORMAT(students.admission_date,'%Y') desc,id desc
		 "
        Return DataSource(sql)

#Region "old"
        '      Select 
        'id,
        '`name`,
        ''False' AS 'Include'
        '            FROM(
        '        SELECT
        '			students.id,
        '            students.academice_year 'name'
        '            FROM
        '            students
        '            WHERE
        '            students.student_category_id = '" & catID & "' AND students.year_level <> '' AND students.semester <> ''
        '            GROUP BY academice_year


        '	  UNION

        '            Select Case 0 As 'id',
        '		       '-- ALL --' AS 'name'
        '	)A		ORDER BY id
#End Region
    End Function

    Friend Function getYearLevel(catID As Object) As Object
        Dim sql As String = ""
        sql = "SELECT
students.id,
students.year_level 'name',
'False'
FROM
students
WHERE
students.student_category_id = 13 AND students.year_level <> '' AND students.semester <> ''
GROUP BY year_level
ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,year_level

 "
        Return DataSource(sql)
    End Function

    Friend Function getSemester(catID As Object) As Object
        Dim sql As String = ""
        sql = "SELECT
students.id,
students.semester 'name',
'False'
FROM
students
WHERE
students.student_category_id = 13 AND students.year_level <> '' AND students.semester <> ''
GROUP BY semester
ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,semester
"
        Return DataSource(sql)
    End Function

    Friend Function getDropDownList(catID As Integer, nodeId As Integer) As Object

        Dim dt As New DataTable
        Dim sql As String = ""

        Select Case nodeId
            Case 1
                sql = "SELECT
			            students.id,
			            students.academice_year 'name',
			            'False'
		            FROM
			            students
		            WHERE
			            students.student_category_id = '" & catID & "' -- AND students.year_level <> '' AND students.semester <> ''
			            GROUP BY academice_year
			            ORDER BY DATE_FORMAT(students.admission_date,'%Y') desc,id desc"
            Case 2
                sql = "SELECT
                        students.id,
                        students.year_level 'name',
                        'False'
                        FROM
                        students
                        WHERE
                        students.student_category_id = '" & catID & "' -- AND students.year_level <> '' AND students.semester <> ''
                        GROUP BY year_level
                        ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,year_level"
            Case 3
                sql = "SELECT
                        students.id,
                        students.semester 'name',
                        'False'
                        FROM
                        students
                        WHERE
                        students.student_category_id = '" & catID & "'  -- AND students.year_level <> '' AND students.semester <> ''
                        GROUP BY semester
                        ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,semester"
            Case 4
                sql = "SELECT
                        students.id,
                        students.enrollmentAS 'name',
                        'False'
                        FROM
                        students
                        WHERE
                        students.student_category_id = '" & catID & "'  -- AND students.year_level <> '' AND students.semester <> ''
                        GROUP BY semester
                        ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,enrollmentAS"
            Case 5
                sql = "SELECT
                        students.id,
                        students.scholarshipgrant 'name',
                        'False'
                        FROM
                        students
                        WHERE
                        students.student_category_id = '" & catID & "' 
                        GROUP BY scholarshipgrant
                        ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,scholarshipgrant
                        "
            Case 6
                sql = "
                        SELECT
                        courses.id,
                        courses.course_name 'name',
                        'False'
                        FROM
                        students
                        INNER JOIN courses ON students.course_id = courses.id
                        WHERE
                        students.student_category_id = 13 
                        GROUP BY course_name
                        ORDER BY	DATE_FORMAT(students.admission_date,'%Y') Desc,course_name
                        "
            Case 7
        End Select


        Return DataSource(sql)

    End Function

    Friend Function getStudentList(str As String) As DataTable

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                          '' As 'No.',
                                students.std_number 'STUDENT NO', 
	                        REPLACE(person.last_name, 'Ã±', 'ñ' )'LAST NAME',
	                        person.first_name 'FIRST NAME', 
	                        person.middle_name 'MIDDLE NAME', 
	                        person.gender 'GENDER',
                           -- TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) 'AGE',
                            DATE_FORMAT(date_of_birth,'%m-%d-%Y') 'BIRTH DATE',
                            person_address.address 'ADDRESS',
	                        students.enrollmentAS 'ADMI.STATUS',
	                        students.`scholarshipgrant` 'SCHOLARSHIP',
	                        students.year_level 'YEAR LEVEL',
	                        students.semester 'SEMESTER',
	                        students.academice_year 'ACADEMIC YEAR',
	                        courses.course_name 'COURSE/GRADE',
	                        students.person_id
                            FROM
	                        students
	                        INNER JOIN person ON students.person_id = person.person_id
	                        INNER JOIN courses ON students.course_id = courses.id
                           LEFT JOIN person_address ON person.person_id = person_address.person_id AND person_address.address_type_id = 1
                           WHERE
	                        students.status_type_id = 1 AND
	                        person.status_type_id = 1  AND students.is_enrolled = 1 " & str & " 

                            ORDER BY  gender desc,last_name"))
        Return dt
    End Function

    Friend Function getJoinString(list As List(Of String), labelName As String) As String

        Dim Item As String = Nothing
        Dim cnt As Integer = 1
        For Each row In list.ToList
            If cnt = 1 Then
                Item += "'" & row.ToString & "'"
            Else
                Item += ",'" & row.ToString & "'"
            End If
            '        Item = String.Join(",", row.ToString)
            cnt += 1
        Next

        LabelName_List.Add(Tuple.Create(labelName, Item))

        Return Item
    End Function
End Class
