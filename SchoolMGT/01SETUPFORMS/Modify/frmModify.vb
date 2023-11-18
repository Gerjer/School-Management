Public Class frmModify

    Public tagID As Integer
    Public scholarID As Integer
    Public bactchID As Integer
    Public scholarship_grant As String = ""
    Public batch_name As String = ""
    Public course_grade_name As String = ""
    Public year_level As String = ""
    Public semester As String = ""
    Public admission_number As String = ""

    Dim FirstLoad As Boolean = True

    Dim LaboratoryOperation As String = ""

    Private Sub frnModify_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        FirstLoad = True

        Select Case tagID
            Case 1
                TabControl1.TabPages.Remove(TabPage1)
                'TabControl1.TabPages.Add(TabPage2)
                TabControl1.TabPages.Remove(TabPage3)
                TabControl1.TabPages.Remove(TabPage4)
                TabControl1.TabPages.Remove(TabPage5)
                TabControl1.TabPages.Remove(TabPage6)
            Case 2
                'TabControl1.TabPages.Add(TabPage1)
                TabControl1.TabPages.Remove(TabPage2)
                TabControl1.TabPages.Remove(TabPage3)
                TabControl1.TabPages.Remove(TabPage4)
                TabControl1.TabPages.Remove(TabPage5)
                TabControl1.TabPages.Remove(TabPage6)
            Case 3
                TabControl1.TabPages.Remove(TabPage1)
                TabControl1.TabPages.Remove(TabPage2)
                TabControl1.TabPages.Remove(TabPage4)
                TabControl1.TabPages.Remove(TabPage5)
                TabControl1.TabPages.Remove(TabPage6)
                TabControl1.TabPages.Remove(TabPage7)
            Case 4
                TabControl1.TabPages.Remove(TabPage1)
                TabControl1.TabPages.Remove(TabPage2)
                TabControl1.TabPages.Remove(TabPage3)
                TabControl1.TabPages.Remove(TabPage5)
                TabControl1.TabPages.Remove(TabPage6)
                TabControl1.TabPages.Remove(TabPage7)
            Case 5
                TabControl1.TabPages.Remove(TabPage1)
                TabControl1.TabPages.Remove(TabPage2)
                TabControl1.TabPages.Remove(TabPage3)
                TabControl1.TabPages.Remove(TabPage4)
                TabControl1.TabPages.Remove(TabPage6)
                TabControl1.TabPages.Remove(TabPage7)
            Case 6
                TabControl1.TabPages.Remove(TabPage1)
                TabControl1.TabPages.Remove(TabPage2)
                TabControl1.TabPages.Remove(TabPage3)
                TabControl1.TabPages.Remove(TabPage4)
                TabControl1.TabPages.Remove(TabPage5)
                TabControl1.TabPages.Remove(TabPage7)
            Case Else

                TabControl1.TabPages.Remove(TabPage1)
                TabControl1.TabPages.Remove(TabPage2)
                TabControl1.TabPages.Remove(TabPage3)
                TabControl1.TabPages.Remove(TabPage4)
                TabControl1.TabPages.Remove(TabPage5)
                TabControl1.TabPages.Remove(TabPage6)

        End Select


        loadComboBox()

        FirstLoad = False
        If scholarship_grant = "" Then
            cmbScholarship.SelectedValue = -1
        Else
            cmbScholarship.Text = scholarship_grant
        End If
        If batch_name = "" Then
            cmbBatch.SelectedValue = -1
        Else
            cmbBatch.Text = batch_name
        End If
        If course_grade_name = "" Then
            cmbCourse.SelectedValue = -1
        Else
            cmbCourse.Text = course_grade_name
        End If
        If batch_name = "" Then
            cmbBatch1.SelectedValue = -1
        Else
            cmbBatch1.Text = batch_name
        End If
        If year_level = "" Then
            cmbYearLevel.SelectedValue = -1
        Else
            cmbYearLevel.Text = year_level
        End If
        If semester = "" Then
            cmbSemester.SelectedValue = -1
        Else
            cmbSemester.Text = semester
        End If
    End Sub

    Private Sub loadComboBox()

        cmbScholarship.DataSource = DataSource(String.Format("SELECT
	                                    scholarship_grant.SysPK_Item 'id', 
	                                    scholarship_grant.`name`, 
	                                    scholarship_grant.fullDeduct, 
	                                    scholarship_grant.grant_amount, 
	                                    scholarship_grant.Refundable,
                                        scholarship_grant.code   
                                    FROM
	                                    scholarship_grant"))
        cmbScholarship.ValueMember = "id"
        cmbScholarship.DisplayMember = "name"
        cmbScholarship.SelectedIndex = -1

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	                                        batches.id, 
	                                        batches.`name`
                                        FROM
	                                        batches
	                                        INNER JOIN
	                                        courses
	                                        ON 
		                                        batches.course_id = courses.id
                                        WHERE
	                                        courses.id = '" & _courseID & "'
	                                        ORDER BY `name`"))

        cmbBatch.DataSource = dt
        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"
        cmbBatch.SelectedIndex = -1

        cmbCourse.DataSource = DataSource(String.Format("SELECT
                                courses.id,
	                                courses.course_name 'name'
	
                                FROM
	                                courses
                                WHERE
	                                courses.is_deleted = 0"))
        cmbCourse.ValueMember = "id"
        cmbCourse.DisplayMember = "name"
        cmbCourse.SelectedIndex = -1

        cmbYearLevel.DataSource = getYearLevel()
        cmbYearLevel.ValueMember = "id"
        cmbYearLevel.DisplayMember = "name"
        cmbYearLevel.SelectedIndex = -1

    End Sub

    Private Function getYearLevel() As Object
        Dim sql As String = ""
        If _student_category_id = 13 Then
            sql = "SELECT
	                year_level.id, 
	                year_level.year_level 'name'
                FROM
	                year_level
                  WHERE id  < 5"
        ElseIf _student_category_id = 14 Then
            sql = "SELECT
	                year_level.id, 
	                year_level.year_level 'name'
                FROM
	                year_level
                  WHERE id  < 7"
        ElseIf _student_category_id = 15 Then
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

    Dim scholarship_code As String = ""
    Private Sub cmbScholarship_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbScholarship.SelectedIndexChanged
        If FirstLoad = False Then
            Try
                Dim drv As DataRowView = DirectCast(cmbScholarship.SelectedItem, DataRowView)
                txtFullDedecution.Text = drv.Item("fullDeduct").ToString
                txtGrandAmt.Text = drv.Item("grant_amount").ToString
                txtRefundable.Text = drv.Item("Refundable").ToString
                scholarship_code = drv.Item("code").ToString
            Catch ex As Exception

            End Try
        End If
    End Sub

    Dim scholarship_id As Integer
    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click


        Select Case tagID
            Case 2
                Try
                    DataSource(String.Format("UPDATE  students SET scholarshipgrant= '" & cmbScholarship.Text & "' WHERE id = '" & _studentID & "' ;"))

                    'Check ScholarShip
                    If ExistInScholarShip(_studentID) = True Then
                        DataSource(String.Format("UPDATE  scholarship SET scholarship_any= '" & cmbScholarship.Text & "',scholarship_grant_id= '" & cmbScholarship.SelectedValue & "' WHERE id = '" & scholarship_id & "' ;"))

                    End If

                    If ExistingSchorshipGrantDetails(_studentID) = True Then
                        DataSource(String.Format(" UPDATE scholarship_grant_details SET scholarship_code = '" & scholarship_code & "',grant_amount = '" & txtGrandAmt.Text & "' WHERE id = '" & scholarship_id & "'"))
                        '           MessageBox.Show("Record Updated...", "Successfully!")
                    Else
                        DataSource(String.Format("INSERT INTO scholarship_grant_details (student_id,scholarship_code,grant_amount,status)VALUES('" & _studentID & "','" & scholarship_code & "','" & txtGrandAmt.Text & "','Active')"))
                        MessageBox.Show("Record Added...", "Successfully!")
                    End If

                    ''Update Statement Assessment
                    'If scholarship_code = 6 Then
                    '    'Check Assessment
                    '    Try
                    '        If ExistingAssessment(_studentID) = True Then
                    '            Dim Total As Double = DataObject(String.Format("SELECT total'Total'  FROM students_assessment WHERE stat LIKE '++' AND student_id = '" & _studentID & "'"))
                    '            Dim DiscountedPayable As Double = Total - FormatNumber(txtGrandAmt.Text, 2, TriState.UseDefault, TriState.True)
                    '            Dim DiscountID As Integer = DataObject(String.Format("SELECT id FROM students_assessment WHERE stat LIKE '--' AND student_id = '" & _studentID & "'"))
                    '            Dim TotalPaybleID As Integer = DataObject(String.Format("SELECT id FROM students_assessment WHERE stat LIKE 'T+' AND student_id = '" & _studentID & "'"))

                    '            'Update Discount Field
                    '            DataSource(String.Format("UPDATE students_assessment SET total = '" & FormatNumber(txtGrandAmt.Text, 2, TriState.UseDefault, TriState.True) & "' WHERE id = '" & DiscountID & "'"))

                    '            'Update TotalPayable
                    '            DataSource(String.Format("UPDATE students_assessment SET total = '" & DiscountedPayable & "' WHERE id = '" & TotalPaybleID & "'"))

                    '        End If


                    '    Catch ex As Exception

                    '    End Try



                    'End If


                    'DataSource(String.Format("DELETE FROM `scholarship` WHERE `id` = '" & _studentID & "' ;"))

                    'DataSource(String.Format("INSERT INTO `scholarship` (
                    '                          `person_id`,
                    '                          `student_id`,
                    '                          `scholarship_grant_id`,
                    '                          `scholarship_any`

                    '                        ) 
                    '                        VALUES
                    '                          (
                    '                            '" & PERSON_ID & "',
                    '                            '" & _studentID & "',
                    '                            '" & cmbScholarship.SelectedValue & "',
                    '                            '" & cmbScholarship.Text & "'
                    '                            ) ;

                    '                        "))

                    '          MessageBox.Show("Record Updated...", "Successfully!")
                Catch ex As Exception
                    MsgBox(ex.Message)
                    Exit Sub
                End Try
            Case 1
                Try
                    DataSource(String.Format("UPDATE  students SET batch_id = '" & _batchID & "' WHERE id = '" & _studentID & "' ;"))
                    MessageBox.Show("Record Updated...", "Successfully!")
                Catch ex As Exception
                    MsgBox(ex.Message)
                    Exit Sub
                End Try
            Case 3

                If cmbCourse.SelectedIndex = -1 Then
                    MsgBox("Required fields....Select Course / Grade", MsgBoxStyle.Critical, "INVALID TRANSACTION")
                    '         Exit Sub
                End If
                If cmbBatch1.SelectedIndex = -1 Then
                    MsgBox("Required fields....Select Batch", MsgBoxStyle.Critical, "INVALID TRANSACTION")
                    '       Exit Sub
                End If


                Try
                    DataSource(String.Format("UPDATE  students SET batch_id = '" & _batchID & "' WHERE id = '" & _studentID & "' ;"))
                    DataSource(String.Format("UPDATE  students SET course_id = '" & _courseID & "' WHERE id = '" & _studentID & "' ;"))
                    MessageBox.Show("Record Updated...", "Successfully!")
                Catch ex As Exception
                    MsgBox(ex.Message)
                    Exit Sub
                End Try

            Case 4

                Try
                    DataSource(String.Format("UPDATE  students SET year_level = '" & cmbYearLevel.Text & "' WHERE id = '" & _studentID & "' ;"))
                    MessageBox.Show("Record Updated...", "Successfully!")
                Catch ex As Exception

                End Try
            Case 5
                Try
                    DataSource(String.Format("UPDATE  students SET semester = '" & cmbSemester.Text & "' WHERE id = '" & _studentID & "' ;"))
                    MessageBox.Show("Record Updated...", "Successfully!")
                Catch ex As Exception

                End Try


            Case 6

                Try
                    DataSource(String.Format("UPDATE  students SET admission_no = '" & txtAdmissionNo.Text & "' WHERE id = '" & _studentID & "' ;"))
                    MessageBox.Show("Record Updated...", "Successfully!")
                Catch ex As Exception

                End Try

            Case Else

                Try

                    If LaboratoryOperation = "Add" Then

                        DataSource(String.Format("INSERT INTO `djemfcst_v2`.`subject_laboratory` (`lab_name`, `amount`) VALUES ('" & cmbLab.Text & "', '" & nudAmount.Value & "');"))
                        MessageBox.Show("Record Added...", "Successfully!")

                    Else

                        DataSource(String.Format("UPDATE `djemfcst_v2`.`subject_laboratory` SET `lab_name` = '" & cmbLab.Text & "', `amount` = '" & nudAmount.Value & "' WHERE `id` = '" & cmbLab.SelectedValue & "';"))
                        MessageBox.Show("Record Updated...", "Successfully!")
                    End If

                    cmbLab.Enabled = False
                    nudAmount.Enabled = False

                Catch ex As Exception

                End Try

        End Select
    End Sub

    Private Function ExistingAssessment(studentID As Integer) As Boolean
        Dim dt As New DataTable
        Dim sql As String = ""
        sql = "SELECT * FROM students_assessment WHERE student_id = '" & studentID & "'"
        dt = DataSource(String.Format(sql))
        If dt.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Private Function ExistingSchorshipGrantDetails(studentID As Integer) As Boolean
        Dim id As Integer = 0
        id = DataObject(String.Format("SELECT id FROM scholarship_grant_details WHERE `status`= 'Active' AND student_id = '" & studentID & "'"))
        If id > 0 Then
            scholarship_id = id
            Return True
        Else
            Return False
        End If
    End Function

    Private Function ExistInScholarShip(studentID As Integer) As Boolean

        Dim id As Integer = DataObject(String.Format("SELECT id FROM `scholarship` WHERE student_id = '" & studentID & "'"))
        If id > 0 Then
            scholarship_id = id
            Return True
        Else
            Return False
        End If
    End Function

    Public Sub DeleteScholarShip(personID, StudentID)

        DataSource(String.Format("DELETE FROM `scholarship` WHERE `person_id` = '" & personID & "' AND `student_id` = '" & StudentID & "'"))
        DataSource(String.Format("UPDATE  students SET scholarshipgrant= '' WHERE id = '" & _studentID & "' ;"))

        MsgBox("Scholarhip has been Remove...", MsgBoxStyle.Information, "REMOVE RECORD")
    End Sub

    Private Sub TabPage2_Click(sender As Object, e As EventArgs) Handles TabPage2.Click

    End Sub


    Private Sub cmbBatch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbBatch.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
            _batchID = drv.Item("id").ToString
        Catch ex As Exception

        End Try
    End Sub

    Private Sub cmbBatch1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbBatch1.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbBatch1.SelectedItem, DataRowView)
            _batchID = drv.Item("id").ToString
        Catch ex As Exception

        End Try
    End Sub

    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            _courseID = drv.Item("id").ToString
            loadBatch(_courseID)
        Catch ex As Exception

        End Try
    End Sub

    Private Sub loadBatch(courseID As Integer)

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	                                        batches.id, 
	                                        batches.`name`
                                        FROM
	                                        batches
	                                        INNER JOIN
	                                        courses
	                                        ON 
		                                        batches.course_id = courses.id
                                        WHERE
	                                        courses.id = '" & courseID & "'
	                                        ORDER BY `name`"))

        cmbBatch1.DataSource = dt
        cmbBatch1.ValueMember = "id"
        cmbBatch1.DisplayMember = "name"
        cmbBatch1.SelectedIndex = -1

    End Sub

    Private Sub SimpleButton2_Click(sender As Object, e As EventArgs) Handles btnEdit.Click

        cmbLab.DataSource = DataSource(String.Format("SELECT
	                    subject_laboratory.id, 
	                    subject_laboratory.lab_name 'name', 
	                    subject_laboratory.amount
                    FROM
	                    subject_laboratory
                    WHERE
	                    subject_laboratory.`status` = 'ACTIVE'"))
        cmbLab.ValueMember = "id"
        cmbLab.DisplayMember = "name"
        cmbLab.SelectedIndex = -1

        cmbLab.DropDownStyle = ComboBoxStyle.DropDown
        cmbLab.AutoCompleteMode = AutoCompleteMode.SuggestAppend
        cmbLab.AutoCompleteSource = AutoCompleteSource.ListItems

        cmbLab.Enabled = True
        nudAmount.Enabled = True

        LaboratoryOperation = "Edit"
    End Sub

    Private Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click


        cmbLab.Enabled = True
        nudAmount.Enabled = True
        cmbLab.DropDownStyle = ComboBoxStyle.Simple
            cmbLab.AutoCompleteMode = AutoCompleteMode.None
            cmbLab.AutoCompleteSource = AutoCompleteSource.None
            cmbLab.Focus()
        LaboratoryOperation = "Add"

    End Sub

    Private Sub cmbLab_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbLab.SelectedIndexChanged

        Try
            Dim drv As DataRowView = DirectCast(cmbLab.SelectedItem, DataRowView)
            nudAmount.Value = drv.Item("amount").ToString
        Catch ex As Exception

        End Try

    End Sub
End Class