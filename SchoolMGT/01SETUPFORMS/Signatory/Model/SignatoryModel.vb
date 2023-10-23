Public Class SignatoryModel
    Friend Function LoadList() As Object
        Dim sql As String = ""
        sql = "SELECT
	signatory_form.`name` AS formName,
	signatory_position.`name` 'designation',
	signatory_person.`name`,
	signatory_form.id AS formID,
	signatory_person.id 'personID',
	signatory_position.id 'positionID',
		signatory_designation.id  
FROM
	signatory_designation
	INNER JOIN signatory_form ON signatory_designation.sig_form_id = signatory_form.id
	INNER JOIN signatory_person ON signatory_designation.sig_person_id = signatory_person.id 
  INNER JOIN signatory_position ON signatory_designation.sig_position_id = signatory_position.id
WHERE
	signatory_person.`status` = 'ACTIVE' 
ORDER BY
	formID,
	personID
"
        Return DataSource(sql)
    End Function

    Friend Function LoadComboFormName() As Object
        Dim sql As String = ""
        sql = "SELECT signatory_form.id,"
        sql += " signatory_form.`name`"
        sql += " FROM 	signatory_form"
        Return DataSource(sql)
    End Function

    Friend Function LoadComboPerson() As Object
        Dim sql As String = ""
        sql = "SELECT signatory_person.id, "
        sql += " signatory_person.`name`"
        sql += " FROM 	signatory_person"
        sql += " WHERE signatory_person.`status` = 'ACTIVE'"
        Return DataSource(sql)
    End Function

    Friend Sub InsertSignatory(personID As String, formID As String, desigID As String)

        Dim sql As String = ""
        sql = "INSERT INTO `signatory_designation`"
        sql += " (`sig_person_id`, `sig_form_id`, `sig_position_id` )"
        sql += " VALUES"
        sql += " ('" & personID & "', '" & formID & "', '" & desigID & "' );"

        DataSource(sql)

    End Sub

    Friend Sub AddDesignationName(Designation As String)

        Dim sql As String = ""
        sql = "INSERT INTO `signatory_position` (`name`) VALUES ('" & Designation & "');"
        DataSource(sql)

    End Sub

    Friend Sub RemoveFormName(formID As String)

    End Sub

    Friend Sub AddPersonName(personName As String)

        Dim sql As String = ""
        sql = "INSERT INTO `signatory_person` (`name`) VALUES ('" & personName & "');"
        DataSource(sql)

    End Sub

    Friend Sub UpdatePerson(personID As String, personName As String, OPERATION As String)
        Dim sql As String = ""
        If OPERATION = "EDIT" Then
            sql = "UPDATE `signatory_person` "
            sql += "SET `name` = '" & personName & "'"
        Else
            sql = "UPDATE `signatory_person` "
            sql += "SET `status` = 'INACTIVE' "
        End If

        sql += "WHERE `id` = '" & personID & "';"
        DataSource(sql)
    End Sub

    Friend Sub UpdatePosition(desigID As String, designation As String, OPERATION As String)

        Dim sql As String = ""
        If OPERATION = "EDIT" Then
            sql = "UPDATE `signatory_position` "
            sql += "SET `name` = '" & designation & "' "
        Else
            sql = "UPDATE `signatory_position` "
            sql += "SET `status` = 'INACTIVE' "
        End If

        sql += " WHERE `id` = '" & desigID & "';"
        DataSource(sql)
    End Sub

    Friend Sub AddFormName(formName As String)

        Dim sql As String = ""
        sql = "INSERT INTO `signatory_form` (`name`) VALUES ('" & formName & "');"
        DataSource(sql)

    End Sub

    Friend Sub DeleteRecord(id As Integer)

        DataSource(String.Format("DELETE FROM signatory_designation WHERE id = '" & id & "'"))

    End Sub

    Friend Sub UpdateSignatory(personID As String, formID As String, desigID As String, id As Integer)

        Dim sql As String = ""
        sql = "UPDATE `signatory_designation` "
        sql += " SET `sig_person_id` = '" & personID & "',"
        sql += " `sig_form_id` = '" & formID & "',"
        sql += " `sig_position_id` = '" & desigID & "' "
        sql += " WHERE `id` = '" & id & "';"

        DataSource(sql)

    End Sub

    Friend Function LoadComboDesignation() As Object
        Dim sql As String = ""
        sql = "SELECT  signatory_position.id,"
        sql += " signatory_position.`name`"
        sql += " FROM 	signatory_position"
        sql += " WHERE signatory_position.`status` = 'ACTIVE'"
        Return DataSource(sql)
    End Function
End Class
