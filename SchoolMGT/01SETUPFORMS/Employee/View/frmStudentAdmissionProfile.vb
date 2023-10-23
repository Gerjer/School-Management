Public Class frmStudentAdmissionProfile


    Private Sub frmStudentAdmissionProfile_Load(sender As Object, e As EventArgs) Handles Me.Load
        '     txtLastName.Focus()
        txtLastName.Focus()
        If OPERATION = "EDIT" Then
            btnSave.Text = "Update"
            loadPersonDetails(PERSON_ID)
        Else
            btnSave.Text = "Save"
        End If

    End Sub

    Private Sub loadPersonDetails(pERSON_ID As Integer)

        Dim dt As New DataTable
        dt = getPersonDetails(pERSON_ID)
        If dt.Rows.Count > 0 Then
            txtLastName.Text = If(IsDBNull(dt(0)("last_name").ToString), "", dt(0)("last_name").ToString)
            txtFirstName.Text = If(IsDBNull(dt(0)("first_name").ToString), "", dt(0)("first_name").ToString)
            txtMiddleName.Text = If(IsDBNull(dt(0)("middle_name").ToString), "", dt(0)("middle_name").ToString)
            txtDisplayName.Text = If(IsDBNull(dt(0)("display_name").ToString), "", dt(0)("display_name").ToString)
            gender = If(IsDBNull(dt(0)("gender").ToString), "", dt(0)("gender").ToString)
            If gender = "MALE" Then
                RadioButton1.Checked = True
            Else
                RadioButton2.Checked = True
            End If
            dtpBDay.Value = If(IsDBNull(dt(0)("date_of_birth").ToString), "", dt(0)("date_of_birth").ToString)
            txtPlaceBirth.Text = If(IsDBNull(dt(0)("birth_place").ToString), "", dt(0)("birth_place").ToString)
            Dim CivilStatus = If(IsDBNull(dt(0)("marital_status").ToString), "", dt(0)("marital_status").ToString)
            Select Case CivilStatus
                Case "SINGLE"
                    cmbCivilStatus.SelectedIndex = 0
                Case "MARRIED"
                    cmbCivilStatus.SelectedIndex = 1
                Case "SEPARARED"
                    cmbCivilStatus.SelectedIndex = 2
                Case "WIDOWED"
                    cmbCivilStatus.SelectedIndex = 3
                Case "SOLO PARENT"
                    cmbCivilStatus.SelectedIndex = 4
                Case Else
                    cmbCivilStatus.SelectedIndex = -1
            End Select

            txtContact.Text = If(IsDBNull(dt(0)("telephone1").ToString), "", dt(0)("telephone1").ToString)
                txtAddress.Text = If(IsDBNull(dt(0)("address").ToString), "", dt(0)("address").ToString)
                txtParents.Text = If(IsDBNull(dt(0)("contact_person").ToString), "", dt(0)("contact_person").ToString)
                txtEmail.Text = If(IsDBNull(dt(0)("email").ToString), "", dt(0)("email").ToString)

                dt = Nothing

                dt = getEducationalHistory(pERSON_ID)

                If dt.Rows.Count > 0 Then

                    For Each row As DataRow In dt.Rows

                        If "Elementary Graduate" = row("education_attainment").ToString Then
                            txtElementary.Text = If(IsDBNull(row("school_address").ToString), "", row("school_address").ToString)
                            dtpElemFrom.Value = row("date_from")
                            dtpElemTo.Value = row("date_to")
                        Else
                            txtHighSchool.Text = If(IsDBNull(row("school_address").ToString), "", row("school_address").ToString)
                            dtpHighFrom.Value = row("date_from")
                            dtpHighTo.Value = row("date_to")
                        End If

                    Next

                End If

            End If
    End Sub

    Private Function getEducationalHistory(pERSON_ID As Integer) As DataTable

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	                person_educational_attainment.education_attainment, 
	                person_educational_attainment.school_address, 
	                person_educational_attainment.date_from, 
	                person_educational_attainment.date_to
                FROM
	                person_educational_attainment
                WHERE
	                person_educational_attainment.person_id = '" & pERSON_ID & "'"))
        Return dt
    End Function

    Private Function getPersonDetails(pERSON_ID As Integer) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	            person.last_name, 
	            person.first_name,
	            person.middle_name, 
	            person.display_name, 
	            person.gender, 
	            person.date_of_birth, 
	            person.birth_place, 
	            person.marital_status, 
	            person.telephone1, 
	            person_address.address, 
	            person_contact_person.contact_person,
                person.email
            FROM
	            person
	            LEFT JOIN
	            person_address
	            ON 
		            person.person_id = person_address.person_id and person_address.address_type_id = 1
	            LEFT JOIN
	            person_contact_person
	            ON 
		            person.person_id = person_contact_person.person_id
            WHERE
	            person.status_type_id = 1 AND
	            person.end_time IS NULL AND
	            person.person_id = '" & pERSON_ID & "'"))
        Return dt
    End Function

    Private Sub txtLastName_TextChanged(sender As Object, e As EventArgs) Handles txtLastName.TextChanged
        txtDisplayName.Text = txtLastName.Text & ", " & txtFirstName.Text & " " & txtMiddleName.Text
    End Sub

    Private Sub txtFirstName_TextChanged(sender As Object, e As EventArgs) Handles txtFirstName.TextChanged
        txtDisplayName.Text = txtLastName.Text & ", " & txtFirstName.Text & " " & txtMiddleName.Text
    End Sub

    Private Sub txtMiddleName_TextChanged(sender As Object, e As EventArgs) Handles txtMiddleName.TextChanged
        txtDisplayName.Text = txtLastName.Text & ", " & txtFirstName.Text & " " & txtMiddleName.Text
    End Sub

    Private Sub txtLastName_KeyDown(sender As Object, e As KeyEventArgs) Handles txtLastName.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtFirstName.Focus()
        End If

    End Sub

    Private Sub txtFirstName_KeyDown(sender As Object, e As KeyEventArgs) Handles txtFirstName.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtMiddleName.Focus()
        End If

    End Sub

    Private Sub txtMiddleName_KeyDown(sender As Object, e As KeyEventArgs) Handles txtMiddleName.KeyDown
        If e.KeyCode = Keys.Enter Then
            GroupBox1.Focus()
        End If

    End Sub

    Private Sub cmbCivilStatus_KeyDown(sender As Object, e As KeyEventArgs) Handles cmbCivilStatus.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtEmail.Focus()
        End If
    End Sub

    Private Sub txtEmail_KeyDown(sender As Object, e As KeyEventArgs) Handles txtEmail.KeyDown
        If e.KeyCode = Keys.Enter Then
            dtpBDay.Focus()
        End If

    End Sub
    Private Sub dtpBDay_KeyDown_1(sender As Object, e As KeyEventArgs) Handles dtpBDay.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtContact.Focus()
        End If
    End Sub


    Private Sub txtContact_KeyDown(sender As Object, e As KeyEventArgs) Handles txtContact.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtPlaceBirth.Focus()
        End If

    End Sub

    Private Sub txtPlaceBirth_KeyDown(sender As Object, e As KeyEventArgs) Handles txtPlaceBirth.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtAddress.Focus()
        End If

    End Sub

    Private Sub txtAddress_KeyDown(sender As Object, e As KeyEventArgs) Handles txtAddress.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtParents.Focus()
        End If

    End Sub

    Private Sub txtParents_KeyDown(sender As Object, e As KeyEventArgs) Handles txtParents.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtElementary.Focus()
        End If

    End Sub

    Private Sub txtElementary_KeyDown(sender As Object, e As KeyEventArgs) Handles txtElementary.KeyDown
        If e.KeyCode = Keys.Enter Then
            dtpElemFrom.Focus()
        End If

    End Sub

    Private Sub dtpElemFrom_KeyDown(sender As Object, e As KeyEventArgs) Handles dtpElemFrom.KeyDown
        If e.KeyCode = Keys.Enter Then
            dtpElemTo.Focus()
        End If

    End Sub

    Private Sub dtpElemTo_KeyDown(sender As Object, e As KeyEventArgs) Handles dtpElemTo.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtHighSchool.Focus()
        End If

    End Sub

    Private Sub txtHighSchool_KeyDown(sender As Object, e As KeyEventArgs) Handles txtHighSchool.KeyDown
        If e.KeyCode = Keys.Enter Then
            dtpHighFrom.Focus()
        End If

    End Sub

    Private Sub dtpHighFrom_KeyDown(sender As Object, e As KeyEventArgs) Handles dtpHighFrom.KeyDown
        If e.KeyCode = Keys.Enter Then
            dtpHighTo.Focus()
        End If

    End Sub

    Private Sub dtpHighTo_KeyDown(sender As Object, e As KeyEventArgs) Handles dtpHighTo.KeyDown
        If e.KeyCode = Keys.Enter Then
            btnSave.Focus()
        End If

    End Sub

    Dim gender As String = ""
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If RadioButton1.Checked = False And RadioButton2.Checked = False Then
            MessageBox.Show("Required Fields...Gender", "REQUIRED FIELDS")
            Exit Sub
        End If

        If RadioButton1.Checked Then
            gender = RadioButton1.Text
        Else
            gender = RadioButton2.Text
        End If

        If MessageBox.Show("Are you sure you want to SAVE this record?", "Please verify....", MessageBoxButtons.YesNo,
                          MessageBoxIcon.Information) = DialogResult.Yes Then

            If OPERATION = "ADD" Then
                Dim LastPK = InsertPerson()
                PERSON_ID = LastPK
                InsertAddress(LastPK)
                InsertEducationHistory(LastPK)
                InsertGuardian(LastPK)

                MessageBox.Show("" & txtDisplayName.Text & " is Save Successfully...!!", "RECORD SAVE")

            Else

                UpdatePerson(PERSON_ID)
                UpdateAddress(PERSON_ID)
                UpdateEducationHistory(PERSON_ID)
                UpdateGuardian(PERSON_ID)


                MessageBox.Show("Record of " & txtDisplayName.Text & " has been Updated Successfully...!!", "RECORD UPDATE")


            End If


        Else
                Exit Sub
        End If

    End Sub

    Private Sub UpdateGuardian(pERSON_ID As Integer)

        Dim id As Integer = DataObject(String.Format("SELECT person_id FROM person_contact_person WHERE person_id = '" & pERSON_ID & "'"))

        If id > 0 Then
            DataSource(String.Format("UPDATE 
                  `person_contact_person` 
                SET
                  `contact_person` = '" & txtParents.Text & "'
                WHERE `person_id` = '" & pERSON_ID & "';

                "))

        Else
            DataSource(String.Format("INSERT INTO `person_contact_person` (
                                  `person_id`,
                                  `contact_person`
                                ) 
                                VALUES
                                  (
                                    '" & pERSON_ID & "',
                                    '" & txtParents.Text & "'
                                   ) ;

                                "))
        End If

    End Sub

    Private Sub UpdateEducationHistory(pERSON_ID As Integer)

        Dim id As Integer = DataObject(String.Format("SELECt person_id FROM `person_educational_attainment` WHERE person_id = '" & pERSON_ID & "' limit 1"))

        If id > 0 Then


            Try
                If txtElementary.Text <> "" Then
                    DataSource(String.Format("UPDATE 
          `person_educational_attainment` 
        SET
          `school_address` = '" & txtElementary.Text & "',
          `date_from` = '" & Format(dtpElemFrom.Value, "yyyy-MM-dd") & "',
          `date_to` = '" & Format(dtpElemTo.Value, "yyyy-MM-dd") & "'
          WHERE `education_attainment` = 'Elementary Graduate' AND
               `person_id` = '" & pERSON_ID & "'  ;
        "))
                End If
            Catch ex As Exception

            End Try

            Try
                If txtHighSchool.Text <> "" Then
                    DataSource(String.Format("UPDATE 
          `person_educational_attainment` 
        SET
          `school_address` = '" & txtHighSchool.Text & "',
          `date_from` = '" & Format(dtpHighFrom.Value, "yyyy-MM-dd") & "',
          `date_to` = '" & Format(dtpHighTo.Value, "yyyy-MM-dd") & "'
          WHERE `education_attainment` = 'High School Graduate' AND
               `person_id` = '" & pERSON_ID & "'  ;
        "))
                End If
            Catch ex As Exception

            End Try

        Else

            If txtElementary.Text <> "" Then
                DataSource(String.Format("INSERT INTO `person_educational_attainment` (
                                  `person_id`,
                                  `education_attainment`,
                                  `school_address`,
                                  `date_from`,
                                  `date_to`

                                ) 
                                VALUES
                                  (
                                    '" & pERSON_ID & "',
                                    '" & txtElementary.Tag & "',
                                    '" & txtElementary.Text & "',
                                    '" & Format(dtpElemFrom.Value, "yyyy-MM-dd") & "',
                                      '" & Format(dtpElemTo.Value, "yyyy-MM-dd") & "'
                                    ) ;

                                "))
            End If
            If txtHighSchool.Text <> "" Then
                DataSource(String.Format("INSERT INTO `person_educational_attainment` (
                                  `person_id`,
                                  `education_attainment`,
                                  `school_address`,
                                  `date_from`,
                                  `date_to`

                                ) 
                                VALUES
                                  (
                                    '" & pERSON_ID & "',
                                    '" & txtHighSchool.Tag & "',
                                    '" & txtHighSchool.Text & "',
                                    '" & Format(dtpHighFrom.Value, "yyyy-MM-dd") & "',
                                      '" & Format(dtpHighTo.Value, "yyyy-MM-dd") & "'
                                    ) ;

                                "))
            End If





        End If


    End Sub

    Private Sub UpdateAddress(pERSON_ID As Integer)
        Try
            Dim id As Integer = DataObject(String.Format("SELECt person_id FROM `person_address` WHERE person_id = '" & pERSON_ID & "'"))

            If id > 0 Then
                DataSource(String.Format("UPDATE 
                      `person_address` 
                    SET
                      `address` = '" & txtAddress.Text & "'
                    WHERE `address_type_id` = 1 AND person_id = '" & pERSON_ID & "';
                    "))
            Else
                DataSource(String.Format("INSERT INTO `person_address` (
                                  `person_id`,
                                  `address_type_id`,
                                  `address`
                                ) 
                                VALUES
                                  (
                                    '" & pERSON_ID & "',
                                    1,
                                    '" & txtAddress.Text & "'
                                  ) ;
                                "))
            End If

        Catch ex As Exception
        End Try

    End Sub

    Private Sub UpdatePerson(pERSON_ID As Integer)
        DataSource(String.Format("UPDATE 
                          `person` 
                    SET
                      `first_name` = '" & txtFirstName.Text & "',
                      `middle_name` = '" & txtMiddleName.Text & "',
                      `last_name` = '" & txtLastName.Text & "',
                      `display_name` = '" & txtDisplayName.Text & "',
                      `gender` = '" & gender & "',
                      `date_of_birth` = '" & Format(dtpBDay.Value,"yyyy-MM-dd") & "',
                      `birth_place` = '" & txtPlaceBirth.Text & "',
                      `marital_status` = '" & cmbCivilStatus.Text & "',
                      `telephone1` = '" & txtContact.Text & "',
                      `email` = '" & txtEmail.Text & "'
                    WHERE `person_id` = '" & pERSON_ID & "' ;

                    "))
    End Sub

    Private Sub InsertGuardian(lastPK As Object)
        DataSource(String.Format("INSERT INTO `person_contact_person` (
                                  `person_id`,
                                  `contact_person`
                                ) 
                                VALUES
                                  (
                                    '" & lastPK & "',
                                    '" & txtParents.Text & "'
                                   ) ;

                                "))
    End Sub

    Private Sub InsertEducationHistory(lastPK As Object)

        If txtElementary.Text <> "" Then
            DataSource(String.Format("INSERT INTO `person_educational_attainment` (
                                  `person_id`,
                                  `education_attainment`,
                                  `school_address`,
                                  `date_from`,
                                  `date_to`

                                ) 
                                VALUES
                                  (
                                    '" & lastPK & "',
                                    '" & txtElementary.Tag & "',
                                    '" & txtElementary.Text & "',
                                    '" & Format(dtpElemFrom.Value, "yyyy-MM-dd") & "',
                                      '" & Format(dtpElemTo.Value, "yyyy-MM-dd") & "'
                                    ) ;

                                "))
        End If
        If txtHighSchool.Text <> "" Then
            DataSource(String.Format("INSERT INTO `person_educational_attainment` (
                                  `person_id`,
                                  `education_attainment`,
                                  `school_address`,
                                  `date_from`,
                                  `date_to`

                                ) 
                                VALUES
                                  (
                                    '" & lastPK & "',
                                    '" & txtHighSchool.Tag & "',
                                    '" & txtHighSchool.Text & "',
                                    '" & Format(dtpHighFrom.Value, "yyyy-MM-dd") & "',
                                      '" & Format(dtpHighTo.Value, "yyyy-MM-dd") & "'
                                    ) ;

                                "))
        End If


    End Sub

    Private Sub InsertAddress(lastPK As Object)
        DataSource(String.Format("INSERT INTO `person_address` (
                                  `person_id`,
                                  `address_type_id`,
                                  `address`
                                ) 
                                VALUES
                                  (
                                    '" & lastPK & "',
                                    1,
                                    '" & txtAddress.Text & "'
                                  ) ;
                                "))
    End Sub

    Private Function InsertPerson() As Object

        DataSource(String.Format("INSERT INTO `person` (
                                  `person_type_id`,
                                  `first_name`,
                                  `middle_name`,
                                  `last_name`,
                                  `display_name`,
                                  `gender`,
                                  `date_of_birth`,
                                  `birth_place`,
                                  `marital_status`,
                                  `telephone1`
                                 ) 
                                VALUES
                                  (
                                    2,
                                    '" & txtFirstName.Text & "',
                                    '" & txtMiddleName.Text & "',
                                   '" & txtLastName.Text & "',
                                  '" & txtDisplayName.Text & "',
                                     '" & gender & "',
                                   '" & Format(dtpBDay.Value, "yyyy-MM-dd") & "',
                                  '" & txtPlaceBirth.Text & "',
                                  '" & cmbCivilStatus.Text & "',
                                   '" & txtContact.Text & "'
                                    ) ;

                                "))

        Dim lastPK = DataObject(String.Format("SELECT 	MAX(person.person_id)FROM	person WHERE status_type_id = 1 and end_time is NULL AND person_type_id = 2"))
        Return lastPK
    End Function
End Class