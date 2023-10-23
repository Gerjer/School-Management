Public Class TESApplicationListModel
    Friend Function getList(ScholarID As String, AcademicYear As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
scholarship.id,
scholarship.person_id,
LPAD(students.class_roll_no, 5, 0) AS 'SEQ.NO.#',
students.std_number 'STUDENT ID',
person.last_name 'LAST NAME',
person.first_name 'GIVEN NAME',
scholarship.student_extension_name 'EXT.NAME',
person.middle_name 'MIDDLE NAME',
person.gender 'SEX',
DATE_FORMAT(person.date_of_birth,'%d-%m-%Y') 'BIRTH DATE',
courses.course_name 'COMPLETE PROGRAM',
students.year_level 'YEAR LEVEL',
CASE WHEN scholarship.father_last_name IS NOT NULL AND scholarship.father_first_name IS NOT NULL AND scholarship.father_middle_name IS NOT NULL THEN CONCAT(scholarship.father_last_name,', ',scholarship.father_first_name,' ',scholarship.father_middle_name) ELSE CONCAT(scholarship.father_last_name,', ',scholarship.father_first_name) END AS 'FATHERS NAME',
CASE WHEN scholarship.mother_last_name IS NOT NULL AND scholarship.mother_first_name IS NOT NULL AND scholarship.mother_middle_name IS NOT NULL THEN CONCAT(scholarship.mother_last_name,', ',scholarship.mother_first_name,' ',scholarship.mother_middle_name) ELSE CONCAT(scholarship.mother_last_name,', ',scholarship.mother_first_name) END AS 'MOTHERS NAME',
scholarship.learner_ref_no 'LEARNER REF.NO.#',

CASE WHEN person_address.address IS NOT NULL AND person_address.barangay IS NOT NULL AND person_address.citymunicipality IS NOT NULL THEN concat(person_address.address,', ',person_address.barangay,', ',person_address.citymunicipality)
                    WHEN person_address.address IS NOT NULL AND person_address.barangay IS NOT NULL AND person_address.citymunicipality IS NULL THEN concat(person_address.address,', ',person_address.barangay)
                    WHEN person_address.address IS NOT NULL AND person_address.barangay IS NULL AND person_address.citymunicipality IS NULL THEN person_address.address
                    WHEN person_address.address IS NULL AND person_address.barangay IS NOT NULL AND person_address.citymunicipality IS NULL THEN person_address.barangay
                    ELSE person_address.citymunicipality END AS 'PERMANENT ADDRESS',
scholarship.total_assessment 'TOTAL ASSESSMENT',
scholarship.disability 'DISABILITY',
person.telephone1 'CONTACT NUMBER',
person.email 'EMAIL ADDRESS',
scholarship.from_year 'INDIGENOUS PG',
scholarship.father_last_name,
scholarship.father_first_name,
scholarship.father_middle_name,
scholarship.mother_last_name,
scholarship.mother_first_name,
scholarship.mother_middle_name,
scholarship.dswd_household_no,
person_address.zipcode,
scholarship.income

FROM
scholarship
INNER JOIN person ON scholarship.person_id = person.person_id
INNER JOIN students ON person.person_id = students.person_id
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN person_address ON person.person_id = person_address.person_id
WHERE
person.status_type_id = 1 AND
person.end_time IS NULL AND
scholarship.status_type_id = 1 AND
scholarship.end_time IS NULL AND
students.status_type_id = 1 AND
students.end_time IS NULL AND
person_address.address_type_id = 1 AND
scholarship.scholarship_grant_id = '" & ScholarID & "'
AND academice_year = '" & AcademicYear & "'

ORDER BY `SEQ.NO.#`,`LAST NAME`    "
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
			students.student_category_id = 13
			GROUP BY academice_year"
        Return DataSource(sql)
    End Function

    Friend Function getScholarName() As Object
        Dim sql As String = ""
        sql = "SELECT
	scholarship_grant.SysPK_Item AS id, 
	scholarship_grant.`name`
FROM
	scholarship_grant"
        Return DataSource(sql)
    End Function

    Friend Function getUII() As Object
        Dim sql As String = ""
        sql = "SELECT
id AS ID,
uii_number AS `Name`
FROM
scholarship_uii
WHERE
status_type_id = 1 AND
end_time IS NULL
ORDER BY id DESC
"
        Return DataSource(sql)
    End Function

    Friend Function CheckUII(selectedValue As Object, fromYear As String, toYear As String) As Boolean
        Dim id As Integer = DataObject(String.Format("SELECT
                                    id
                                    FROM
                                    scholarship_uii
                                    WHERE
                                    status_type_id = 1 AND
                                    end_time IS NULL AND
                                    id = '" & selectedValue & "' AND
                                    year_from = '" & fromYear & "' AND
                                    year_to = '" & toYear & "'
                                    "))

        If id > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Friend Function getScholarshipList(UII As String, yearFrom As String, yearTo As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
scholarship.id,
scholarship.person_id,
LPAD(students.class_roll_no,4,0) 'class_roll_no',
scholarship.learner_ref_no,
students.std_number,
person.last_name,
person.first_name,
scholarship.student_extension_name,
person.middle_name,
person.gender,
person.date_of_birth,
courses.course_name,
SUBSTRING(students.year_level,1,1)'year_level',
scholarship.father_last_name,
scholarship.father_first_name,
scholarship.father_middle_name,
scholarship.mother_last_name,
scholarship.mother_first_name,
scholarship.mother_middle_name,
scholarship.dswd_household_no,
scholarship.income,
person_address.address,
person_address.barangay,
person_address.citymunicipality,
person_address.province,
person_address.zipcode,
scholarship.total_assessment,
scholarship.disability,
person.telephone1,
person.email,
scholarship.scholarship_any,
scholarship.UII,
scholarship.from_year,
scholarship.to_year


FROM
scholarship
INNER JOIN person ON scholarship.person_id = person.person_id
INNER JOIN students ON person.person_id = students.person_id
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN person_address ON person.person_id = person_address.person_id
WHERE
person.status_type_id = 1 AND
person.end_time IS NULL AND
scholarship.status_type_id = 1 AND
scholarship.end_time IS NULL AND
students.status_type_id = 1 AND
students.end_time IS NULL AND
-- scholarship.UII =  '" & UII & "' AND
scholarship.from_year = '" & yearFrom & "' AND
scholarship.to_year = '" & yearTo & "'
"
        Return DataSource(sql)
    End Function

    Friend Sub SaveUII(UII As String, yearFrom As String, yearTo As String)

        DataSource(String.Format("insert INTO `scholarship_uii`
            (
             `uii_number`,
             `year_from`,
             `year_to`
            )
			VALUES (
							'" & UII & "',
							'" & yearFrom & "',
							'" & yearTo & "'
				);"))

        MsgBox("UII number has been added")

    End Sub

    Friend Sub ModifyUII(id As Object, uII As String)

        DataSource(String.Format("UPDATE scholarship SET UII = '" & uII & "' WHERE id = '" & id & "'"))

    End Sub
End Class
