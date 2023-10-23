Imports System.Threading
Imports System.ComponentModel
Imports System.IO
Imports DevExpress.XtraPrinting.Drawing
Imports DevExpress.XtraReports.UI
Imports DevExpress.XtraGrid.Views.Grid

Public Class fmaStudentsSubjectListForm
    Private CLASS_SCHED As DataTable

    Dim WithEvents addSubj As fmaAddSubjectForm = Nothing

    Dim dgvcc As New DataGridViewComboBoxCell

    Private ROWSELECT As Integer = -1
    Dim ListModel As New StudentLearnersListModel
    Dim FirstLoad As Boolean = True

    Public CourseID As Integer
    Public BatchID As String = ""

    Private Sub fmaStudentListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'getSubjSchedule()
        FirstLoad = True

        displayFilterCategory()
        curriculumStatus()
        loadHandler()

        If lblEnrollStatus.Text = "ENROLLED" Then
            lblEnrollStatus.ForeColor = Color.Blue
        ElseIf lblEnrollStatus.Text = "NOT ENROLLED" Then
            lblEnrollStatus.ForeColor = Color.Red
        Else
            lblEnrollStatus.ForeColor = Color.DarkGreen
        End If


        FirstLoad = False
    End Sub

    Private Sub loadHandler()
        AddHandler RadioButton1.Click, AddressOf RegularStatus
        AddHandler RadioButton2.Click, AddressOf IrregularStatus
    End Sub

    Private Sub IrregularStatus(sender As Object, e As EventArgs)
        DataSource(String.Format("UPDATE `students` SET   `is_regular` = 1 WHERE `id` = '" & txtStudentID.Text & "';"))
        MsgBox("Curriculumn Status has been change to IRREGULAR ")

    End Sub

    Private Sub RegularStatus(sender As Object, e As EventArgs)

        DataSource(String.Format("UPDATE `students` SET   `is_regular` = 0 WHERE `id` = '" & txtStudentID.Text & "';"))
        MsgBox("Curriculumn Status has been change to REGULAR ")

    End Sub


    Private Sub curriculumStatus()

        Dim isRegular As Integer = DataObject(String.Format("SELECT is_regular  FROM students WHERE status_type_id = 1 AND end_time IS NULL AND id = '" & txtStudentID.Text & "'"))
        '
        If isRegular = 0 Then
            RadioButton1.Checked = True
        Else
            RadioButton2.Checked = True
        End If

    End Sub

    Dim StudentSubjectSysPK As String = ""

    Private Sub displayFilterCategory()
        dgvSubjects.Rows.Clear()

        Try

            Dim SQLEX As String = ""

            If Me.txtCategory.Text = "COLLEGE" Then
                SQLEX = "SELECT  students.admission_no"
                SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
                SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid'"
                SQLEX += ", subject_class_schedule.name"
                SQLEX += ", subject_class_schedule.room"
                SQLEX += ", subject_class_schedule.employee_name"
                SQLEX += ", courses.course_name,subject_class_schedule.`code` 'classcode'"
                SQLEX += ", CASE WHEN IFNULL(students_subjects.lec_amt,0) = 0 THEN subjects.amount ELSE students_subjects.lec_amt END AS 'lec_amt' "
                SQLEX += ", IFNULL(students_subjects.lab_amt,0)'lab_amt',students_subjects.id"
                SQLEX += " FROM students_subjects"
                SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
                SQLEX += " INNER JOIN batches ON (students_subjects.batch_id = batches.id)"
                SQLEX += " INNER JOIN courses ON (batches.course_id = courses.id)"
                SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
                SQLEX += " LEFT JOIN subject_class_schedule"
                SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
                SQLEX += " WHERE student_id='" & txtStudentID.Text & "'"


            Else
                SQLEX = "SELECT  students.admission_no"
                SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
                SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid'"
                SQLEX += ", subject_class_schedule.name"
                SQLEX += ", subject_class_schedule.room"
                SQLEX += ", subject_class_schedule.employee_name"
                SQLEX += ", courses.course_name,subject_class_schedule.`code` 'classcode',CASE WHEN IFNULL(students_subjects.lec_amt,0) = 0 THEN subjects.amount ELSE students_subjects.lec_amt END AS 'lec_amt',IFNULL(students_subjects.lab_amt,0)'lab_amt',students_subjects.id"
                SQLEX += " FROM students_subjects"
                SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
                SQLEX += " INNER JOIN batches ON (students_subjects.batch_id = batches.id)"
                SQLEX += " INNER JOIN courses ON (batches.course_id = courses.id)"
                SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
                SQLEX += " LEFT JOIN subject_class_schedule"
                SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
                SQLEX += " WHERE student_id='" & txtStudentID.Text & "'"


            End If


            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then
                For cnt As Integer = 0 To MeData.Rows.Count - 1
                    Dim subjID As String = MeData.Rows(cnt).Item("subjid").ToString()

                    Dim subjlist As New List(Of Object)
                    subjlist.Add(MeData.Rows(cnt).Item("subjid").ToString())
                    'subjlist.Add(MeData.Rows(cnt).Item("batchname").ToString())
                    subjlist.Add(MeData.Rows(cnt).Item("subjCode").ToString())
                    '    subjlist.Add(MeData.Rows(cnt).Item("classcode").ToString())
                    subjlist.Add(MeData.Rows(cnt).Item("subjname").ToString())
                    subjlist.Add(MeData.Rows(cnt).Item("credit_hours").ToString())
                    dgvSubjects.Rows.Add(subjlist.ToArray)


                    dgvcc.DisplayMember = "name"
                    dgvcc.ValueMember = "SysPK_Item"
                    dgvcc.FlatStyle = FlatStyle.Popup
                    dgvcc = dgvSubjects.Rows(cnt).Cells(4)

                    Dim SQLEXSUBJ As String = "SELECT SysPK_Item,name,room,employee_name FROM subject_class_schedule"
                    SQLEXSUBJ += " WHERE subject_id='" & subjID & "'"
                    CLASS_SCHED = clsDBConn.ExecQuery(SQLEXSUBJ)

                    If CLASS_SCHED.Rows.Count > 0 Then
                        For comboRowCount As Short = 0 To CLASS_SCHED.Rows.Count - 1

                            Dim cmbItem As String = CLASS_SCHED.Rows(comboRowCount).Item("name").ToString
                            dgvcc.Items.Add(cmbItem)

                            If StudentSubjectSysPK = "" Then
                                StudentSubjectSysPK = CLASS_SCHED.Rows(comboRowCount).Item("SysPK_Item").ToString
                            Else
                                StudentSubjectSysPK = StudentSubjectSysPK + "," + CLASS_SCHED.Rows(comboRowCount).Item("SysPK_Item").ToString
                            End If

                        Next
                    Else
                        dgvcc.Items.Add("NO SCHED SET")

                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("name").ToString()) Then
                        dgvSubjects.Item(4, cnt).Value = MeData.Rows(cnt).Item("name").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("classcode").ToString()) Then
                        dgvSubjects.Item(5, cnt).Value = MeData.Rows(cnt).Item("classcode").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("room").ToString()) Then
                        dgvSubjects.Item(6, cnt).Value = MeData.Rows(cnt).Item("room").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("employee_name").ToString()) Then
                        dgvSubjects.Item(7, cnt).Value = MeData.Rows(cnt).Item("employee_name").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("course_name").ToString()) Then
                        dgvSubjects.Item(8, cnt).Value = MeData.Rows(cnt).Item("course_name").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("lec_amt").ToString()) Then
                        dgvSubjects.Item(9, cnt).Value = MeData.Rows(cnt).Item("lec_amt").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("lab_amt").ToString()) Then
                        dgvSubjects.Item(10, cnt).Value = MeData.Rows(cnt).Item("lab_amt").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("id").ToString()) Then
                        dgvSubjects.Item(11, cnt).Value = MeData.Rows(cnt).Item("id").ToString()
                    End If


                Next

            End If


            'Dim subjectList As New DataTable

            'subjectList.Columns.Add("Subject Code")
            'subjectList.Columns.Add("Subject Name")
            'subjectList.Columns.Add("Unit/S")


            getTotalUnits()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try



    End Sub




    Private Sub btnSearchCondition_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearchCondition.Click

        displayFilterCategory()
    End Sub


    'Private Sub dgvSubjects_EditingControlShowing(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewEditingControlShowingEventArgs)
    '    If TypeOf e.Control Is ComboBox Then
    '        Dim combo As ComboBox = CType(e.Control, ComboBox)

    '        If (combo IsNot Nothing) Then

    '            ' Remove an existing event-handler, if present, to avoid
    '            ' adding multiple handlers when the editing control is reused.
    '            RemoveHandler combo.SelectedIndexChanged, _
    '                New EventHandler(AddressOf ComboBox_SelectedIndexChanged)


    '            ' Add the event handler.
    '            AddHandler combo.SelectedIndexChanged, _
    '                New EventHandler(AddressOf ComboBox_SelectedIndexChanged)

    '        End If
    '        If dgvSubjects.CurrentCell.ColumnIndex = 4 AndAlso TypeOf e.Control Is ComboBox Then
    '            With DirectCast(e.Control, ComboBox)
    '                .DropDownStyle = ComboBoxStyle.DropDown
    '                .AutoCompleteMode = AutoCompleteMode.SuggestAppend
    '                '.AutoCompleteSource = AutoCompleteSource.CustomSource
    '                'RemoveHandler .KeyDown, AddressOf ComboBox_KeyDown
    '                'AddHandler .KeyDown, AddressOf ComboBox_KeyDown
    '            End With
    '        End If
    '    End If
    'End Sub

    Dim section_details_id As Integer
    Dim counter As Integer = 0

    Public Sub ComboBox_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim sendertext As String = sender.SelectedItem

        Dim comboBox As ComboBox = CType(sender, ComboBox)
        comboBox.ValueMember = "SysPK_Item"
        'Display selected value

        Dim name As String = comboBox.SelectedItem

        Dim mcolIndex As Short = dgvSubjects.CurrentCell.ColumnIndex.ToString
        Dim mrowIndex As Short = dgvSubjects.CurrentCell.RowIndex


        Dim subj_id As String = dgvSubjects.Item(0, mrowIndex).Value
        Dim SQLEX As String = "SELECT SysPK_Item,upper(employee_name) 'employee_name',room,employee_id"
        SQLEX += " FROM subject_class_schedule"
        SQLEX += " WHERE subject_id='" & subj_id & "'"
        SQLEX += " AND name='" & name & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            dgvSubjects.Item(6, mrowIndex).Value = MeData.Rows(0).Item("room").ToString
            dgvSubjects.Item(7, mrowIndex).Value = MeData.Rows(0).Item("employee_name").ToString
            dgvSubjects.Item(8, mrowIndex).Value = MeData.Rows(0).Item("SysPK_Item").ToString

            Dim SQLUP As String = "UPDATE students_subjects"
            SQLUP += " SET subject_class_schedule_id='" & MeData.Rows(0).Item("SysPK_Item").ToString & "'"
            SQLUP += " WHERE student_id='" & txtStudentID.Text & "'"
            SQLUP += " AND subject_id='" & subj_id & "'"
                       
            If clsDBConn.Execute(SQLUP) Then
                    MsgBox("Subject Schedule Changed.", MsgBoxStyle.Information)

                    'Check availability sectioning
                    Dim InstructorID = MeData(0)("employee_id").ToString
                    Dim dt As DataTable = getAvailabiltySection(InstructorID, subj_id, _batchID)

                If counter = 0 Then

                    If dt.Rows.Count > 0 Then

                        'Check if Exist,then update status availability
                        Dim dt_availabilty As DataTable
                        dt_availabilty = DataSource(String.Format("SELECT sectioning.id,sectioning.availability,sectioning.section_name FROM sectioning_details	INNER JOIN	sectioning ON sectioning_details.sectioning_id = sectioning.id WHERE sectioning_details.student_subject_id = '" & Student_Subject_id & "'"))

                        Dim PreviousSection As String = ""
                        If dt_availabilty.Rows.Count > 0 Then
                            If dt(0)("section_name") = dt_availabilty(0)("section_name") Then
                                PreviousSection = ""
                            Else
                                PreviousSection = dt_availabilty(0)("section_name")
                            End If


                            If dt_availabilty(0)("availability") = 0 Then
                                    'Update status availability
                                    DataSource(String.Format("UPDATE `sectioning` SET `availability` = 1 WHERE `id` = '" & dt_availabilty(0)("id") & "'"))
                                End If
                            End If


                            '----------------------> Delete Insert
                            DataSource(String.Format("DELETE FROM sectioning_details WHERE student_subject_id = '" & Student_Subject_id & "'"))


                        Dim SQL As String = "INSERT INTO sectioning_details(sectioning_id,student_subject_id)"
                        SQL += String.Format("VALUES('{0}', '{1}')", dt(0)("id").ToString, getStudent_SubjectID(subj_id, txtStudentID.Text))
                        DataSource(SQL)

                        If PreviousSection = "" Then
                            MessageBox.Show("Added into Section " & dt(0)("section_name").ToString & " ", "ADDED ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                        Else
                            MessageBox.Show("From Section " & PreviousSection & "" & vbCrLf & "Transfered into Section " & dt(0)("section_name").ToString & " ", "ADDED ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                        End If

                        counter = 1

                        'Count Students
                        Dim cnt As Integer = DataObject(String.Format("SELECT COUNT(id) FROM sectioning_details WHERE sectioning_id = '" & dt(0)("id").ToString & "' "))
                            If dt(0)("number_students").ToString = cnt Then
                                DataSource(String.Format("UPDATE sectioning SET availability = 0 WHERE id = '" & dt(0)("id").ToString & "' "))
                            End If




                        Else
                            MessageBox.Show("There is no available seats in this Section...", "BEYOND THE LIMITS", MessageBoxButtons.OK, MessageBoxIcon.Information)
                        Exit Sub

                    End If
                Else
                    counter = 0
                End If



            End If

        End If


    End Sub

    Private Function Exist(subj_id As String, stdID As String) As Boolean
        Dim dt As DataTable = DataSource(String.Format("SELECT
	                                    students_subjects.id 'stdSubjID',
                                        sectioning_details.id 'SecDetailsID'
                                    FROM
	                                    students_subjects
	                                    INNER JOIN
	                                    sectioning_details
	                                    ON 
		                                    students_subjects.id = sectioning_details.student_subject_id
                                    WHERE
	                                    students_subjects.subject_id = '" & subj_id & "' AND
	                                    students_subjects.student_id = '" & stdID & "' "))

        If dt.Rows.Count > 0 Then
            section_details_id = dt(0)("SecDetailsID")
            Return True
        Else
            Return False
        End If
    End Function

    Private Function getStudent_SubjectID(subj_id As String, stdID As String) As Object
        Dim id As Integer = DataObject(String.Format("SELECT id FROM students_subjects WHERE subject_id = '" & subj_id & "'  AND	student_id = '" & stdID & "'"))
        Return id
    End Function

    Private Function getAvailabiltySection(instructorID As Object, subjectID As Object, batchID As Object) As DataTable
        Dim dt As New DataTable
        Dim sql As String = "SELECT id,subject_id,instructor_id,batch_id,section_name,number_students,availability,inorder FROM sectioning	
                            WHERE subject_id = '" & subjectID & "' AND instructor_id = '" & instructorID & "' AND batch_id = '" & batchID & "' AND availability = 1 LIMIT 1"
        dt = DataSource(sql)
        Return dt
    End Function

    Private Sub txtAdmissionNo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAdmissionNo.TextChanged
        If txtAdmissionNo.Text.Length > 0 Then
            Try
                displayFilterCategory()
            Catch ex As Exception

            End Try
        End If
    End Sub


    Private Sub btnxAddSubj_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnxAddSubj.Click

        Dim AssessmentExist As New DataTable
        AssessmentExist = DataSource(String.Format("SELECT * FROM students_assessment WHERE student_id = '" & Me.txtStudentID.Text & "'"))

        If AssessmentExist.Rows.Count > 0 Then
            If MessageBox.Show("It cannot be ADD because a STUDENT ASSESSMENT has already been GENERATED...", "WARNING!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning) = DialogResult.OK Then

                If MessageBox.Show("Please proceed to ADD/DROP Subject Function", "Please Verify !", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
                    Me.DialogResult = DialogResult.OK
                    Me.Close()
                End If
            End If
        Else
            If addSubj Is Nothing Then
                addSubj = New fmaAddSubjectForm
                With addSubj
                    .txtStudentID.Text = Me.txtStudentID.Text
                    .StudentSubjectSysPK = StudentSubjectSysPK
                    .batchID = txtBatchName.Tag 'BatchID\
                End With

                addSubj.Show(Me)

            End If
        End If


    End Sub

    Private Sub addSubj_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles addSubj.FormClosing
        addSubj = Nothing
    End Sub

    Private Sub addSubj_SUBJECTADDED() Handles addSubj.SUBJECTADDED
        displayFilterCategory()
    End Sub

    Private Sub btnRemove_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRemove.Click
        If MessageBox.Show("Are sure you want to Remove Subject from this student?", "Please Verify !", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

            Dim AssessmentExist As New DataTable
            AssessmentExist = DataSource(String.Format("SELECT * FROM students_assessment WHERE student_id = '" & Me.txtStudentID.Text & "'"))

            If AssessmentExist.Rows.Count > 0 Then
                If MessageBox.Show("It cannot be REMOVE because a STUDENT ASSESSMENT has already been GENERATED...", "WARNING!!!", MessageBoxButtons.OK, MessageBoxIcon.Warning) = DialogResult.OK Then

                    If MessageBox.Show("Please proceed to ADD/DROP Subject Function", "Please Verify !", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
                        Me.DialogResult = DialogResult.OK
                        Me.Close()
                    End If
                End If

            Else
                Dim SQLDEL As String = "DELETE FROM students_subjects"
                SQLDEL += " WHERE student_id='" & Me.txtStudentID.Text & "'"
                SQLDEL += " AND subject_id='" & Me.txtSubjectID.Text & "'"

                If clsDBConn.Execute(SQLDEL) Then
                    MsgBox("Subject has been deleted.")
                    displayFilterCategory()
                End If

            End If
        End If


    End Sub


    Dim Student_Subject_id As String = ""
    Private Sub dgvSubjects_CellClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvSubjects.CellClick
        btnRemove.Enabled = True

        Try
            ROWSELECT = e.RowIndex

            Dim currentRow As DataGridViewRow = dgvSubjects.Rows(ROWSELECT)

            txtSubjectID.Text = currentRow.Cells(0).Value
            Student_Subject_id = currentRow.Cells(11).Value

            counter = 0
        Catch ex As Exception

        End Try


    End Sub

    Private Sub dgvSubjects_EditingControlShowing(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewEditingControlShowingEventArgs) Handles dgvSubjects.EditingControlShowing
        If TypeOf e.Control Is ComboBox Then
            Dim combo As ComboBox = CType(e.Control, ComboBox)

            If (combo IsNot Nothing) Then

                ' Remove an existing event-handler, if present, to avoid
                ' adding multiple handlers when the editing control is reused.
                RemoveHandler combo.SelectedIndexChanged,
                    New EventHandler(AddressOf ComboBox_SelectedIndexChanged)


                ' Add the event handler.
                AddHandler combo.SelectedIndexChanged,
                    New EventHandler(AddressOf ComboBox_SelectedIndexChanged)

            End If
            If dgvSubjects.CurrentCell.ColumnIndex = 4 AndAlso TypeOf e.Control Is ComboBox Then
                With DirectCast(e.Control, ComboBox)
                    .DropDownStyle = ComboBoxStyle.DropDown
                    .AutoCompleteMode = AutoCompleteMode.SuggestAppend
                    '.AutoCompleteSource = AutoCompleteSource.CustomSource
                    'RemoveHandler .KeyDown, AddressOf ComboBox_KeyDown
                    'AddHandler .KeyDown, AddressOf ComboBox_KeyDown
                End With
            End If
        End If
    End Sub

    Private Sub getTotalUnits()
        Dim totalUnits As Double = 0


        For nCtr As Integer = 0 To dgvSubjects.Rows.Count - 1
            Dim value As Double = CDbl(dgvSubjects.Item(3, nCtr).Value)

            totalUnits += value
        Next

        Me.txtNoOfUnits.Text = Format(totalUnits, "#.00")
    End Sub

    Private Sub ButtonX1_Click(sender As Object, e As EventArgs) Handles ButtonX1.Click

        Me.Close()
        fmaStudentListForm.btnSearchCondition.PerformClick()

    End Sub

    Dim COR_info As New Student_COR
    Dim Subject_info As New List(Of COR_Subject_Details)
    Dim Assessment_info As New List(Of COR_Assessment_Details)
    Dim Default_LogoPath As String = IO.Directory.GetCurrentDirectory & "\TPC_logo.jpg"

    Private Sub PrintCORNew()
        Dim StudentID As Integer = ListModel.getStudentID(txtAdmissionNo.Text)

        Dim COR_Copies As New DataTable
        COR_Copies = ListModel.getCOR_Copies()
        Dim row As Integer = 0

        Dim page As Integer = 1
        Dim total_page As Double = COR_Copies.Rows.Count
        total_page = total_page / 2
        total_page = Round_Up(total_page)

        Dim Master_Report As New XtraReport_CORMain

        While page <= total_page

            Dim Main_report(page) As XtraReport_CORMain
            Main_report(page) = New XtraReport_CORMain

            Dim report As New XtraReport_CORNew
            report.XrLabel1.Text = COMPANY_NAME
            report.XrLabel4.Text = "Contact #: " & COMPANY_MOBILE_NUMBER
            report.XrLabel5.Text = "Email Address: " & COMPANY_EMAIL_ADDRESS
            report.XrLabel11.Text = ListModel.getCurriculunmStatus(StudentID)

            If Not File.Exists(COMPANY_LOGO_PATH) Then
                report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(Default_LogoPath))
            Else
                report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(COMPANY_LOGO_PATH))
            End If

            Dim dt As New DataTable
            dt = ListModel.getStudents_COR_info(txtAdmissionNo.Text)

            If dt.Rows.Count > 0 Then

                For x As Integer = 0 To dt.Rows.Count - 1

                    Dim obj As New Student_COR
                    With obj
                        .Id_number = If(IsDBNull(dt(x)("IdNumber")), "", dt(x)("IdNumber"))
                        .Name = If(IsDBNull(dt(x)("NameCourse")), "", dt(x)("NameCourse")) 'dt(x)("NameCourse")
                        .Sim_year_date = If(IsDBNull(dt(x)("sem_year_date")), "", dt(x)("sem_year_date")) 'dt(x)("sem_year_date")
                        .Total_units = If(IsDBNull(dt(x)("TotalUnits")), 0, dt(x)("TotalUnits")) 'dt(x)("TotalUnits")
                        .Tution_fees = If(IsDBNull(dt(x)("TutionFees")), 0, dt(x)("TutionFees")) 'dt(x)("TutionFees")
                    End With
                    COR_info = obj
                Next
            End If

            report.XrLabel25.Text = ListModel.getTotalAmount(StudentID)

            dt = Nothing

            Try
                dt = ListModel.getStudent_Subject_info(txtAdmissionNo.Text)
                If dt.Rows.Count > 0 Then

                    For x As Integer = 0 To dt.Rows.Count - 1

                        Dim obj As New COR_Subject_Details
                        With obj
                            .Subject_code = dt(x)("subject_code")
                            .Descriptive_title = dt(x)("descriptive_title")
                            .Units = dt(x)("units")
                            .Time = If(IsDBNull(dt(x)("time")), "", dt(x)("time"))
                            .Day = If(IsDBNull(dt(x)("day")), "", dt(x)("day"))
                            .Room = If(IsDBNull(dt(x)("room")), "", dt(x)("room"))
                            .Instructor = If(IsDBNull(dt(x)("instructor")), "", dt(x)("instructor"))
                        End With
                        Subject_info.Add(obj)
                    Next
                End If
                Dim Subreport As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
                Subreport.ReportSource.DataSource = Subject_info

            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            dt = Nothing

            Try
                dt = ListModel.getStudent_Assessment_info(StudentID)
                If dt.Rows.Count > 0 Then

                    For x As Integer = 0 To dt.Rows.Count - 1

                        Dim obj As New COR_Assessment_Details
                        With obj
                            .Charges = dt(x)("Charges")
                            .Amount = dt(x)("Amount")
                        End With
                        Assessment_info.Add(obj)
                    Next
                End If

                Dim Subreport1 As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Subreport1.ReportSource.DataSource = Assessment_info

            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            report.BindingSource1.DataSource = COR_info
            report.PrintingSystem.Document.AutoFitToPagesWidth = 1

            Dim Main_Subreport1 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
            Main_Subreport1.ReportSource = report

            Main_report(page).XrCopy1.Text = COR_Copies(row)("name")
            Main_report(page).XrCopy1.BackColor = Color.FromName(COR_Copies(row)("description"))

            If COR_Copies.Rows.Count - 1 <> row Then

                Dim Main_Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Main_Subreport2.ReportSource = report

                Main_report(page).XrCopy2.Text = COR_Copies(row + 1)("name")
                Main_report(page).XrCopy2.BackColor = Color.FromName(COR_Copies(row + 1)("description"))

            Else

                Dim Main_Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Main_Subreport2.ReportSource = Nothing
                Main_Subreport2.Visible = False
                Main_report(page).XrCopy2.Visible = False

            End If

            Main_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
            Main_report(page).CreateDocument()

            row += 2

            Master_Report.Pages.AddRange(Main_report(page).Pages)
            Master_Report.PrintingSystem.ContinuousPageNumbering = True

            page += 1

            Subject_info.Clear()
            Assessment_info.Clear()
        End While

        Master_Report.ShowPreview

    End Sub

    Function Round_Up(ByVal num As Double) As Integer
        Dim result As Integer
        result = Math.Round(num)
        If result >= num Then
            Round_Up = result
        Else
            Round_Up = result + 1
        End If
    End Function

    Private Sub ButtonX2_Click(sender As Object, e As EventArgs) Handles ButtonX2.Click

        Cursor = Cursors.WaitCursor

        'If txtNoOfUnits.Text = ".00" Then
        '    MsgBox("Required Fields....No SUBJECT ADDED!!!", MsgBoxStyle.Critical, "INVALID TRANSACTION")
        '    Exit Sub
        'End If

        getDetails_Students(txtStudentID.Text)

        With fmaStudentAssessmentForm
            .txtCategoryID.Text = dt_StdDetails(0)("categoryid").ToString
            .txtAdmissionNo.Text = dt_StdDetails(0)("admission_no").ToString
            .txtIDNumber.Text = dt_StdDetails(0)("std_number").ToString
            .txtGrant.Text = If(IsDBNull(dt_StdDetails(0)("scholarshipgrant").ToString), "", dt_StdDetails(0)("scholarshipgrant").ToString)
            .txtStudentID.Text = dt_StdDetails(0)("id").ToString
            .txtStudentName.Text = dt_StdDetails(0)("last_name").ToString _
                                   & ", " & dt_StdDetails(0)("first_name").ToString() _
                                   & " " & dt_StdDetails(0)("middle_name").ToString()
            .txtCourse.Text = dt_StdDetails(0)("course_name").ToString
            'year_level,school_year,semester
            .txtSY.Text = dt_StdDetails(0)("school_year").ToString
            .txtYearLvl.Text = dt_StdDetails(0)("year_level").ToString
            .txtSemester.Text = dt_StdDetails(0)("semester").ToString
            .txtCategoryName.Text = dt_StdDetails(0)("categoryname").ToString
            '.txtEnrollStat.Text = tdbViewer.Columns.Item("status").Value.ToString

        End With

        '   fmaStudentAssessmentForm.MdiParent = ftmdiMainForm
        ' fmaStudentAssessmentForm.Show()
        fmaStudentAssessmentForm.BringToFront()
        fmaStudentAssessmentForm.ShowDialog()

        If fmaStudentAssessmentForm.DialogResult = DialogResult.Cancel Then
            lblEnrollStatus.Text = fmaStudentAssessmentForm.lblStatus.Text
        End If

        Cursor = Cursors.Default

    End Sub


    Dim dt_StdDetails As New DataTable
    Private Sub getDetails_Students(studentID As String)

        dt_StdDetails.Columns.Clear()

        Dim SQLEX As String = ""
        SQLEX += " SELECT students.id,students.admission_no,students.std_number"
        SQLEX += " , students.scholarshipgrant,REPLACE ( person.last_name, 'Ã±', 'ñ' ) AS 'last_name'"
        SQLEX += " , person.first_name,person.middle_name"
        SQLEX += " , courses.course_name"
        SQLEX += " , batches.`name` 'batchname',students.year_level,batches.school_year,students.semester"
        SQLEX += " , student_categories.name 'categoryname'"
        SQLEX += " , student_categories.id 'categoryid'"
        'SQLEX += " , students.id 'categoryid'"
        SQLEX += " , IF(is_enrolled = 1, 'enrolled', 'not enrolled') 'status'"
        SQLEX += " FROM students"
        SQLEX += " INNER JOIN person"
        SQLEX += " ON (students.person_id = person.person_id AND students.status_type_id = 1 AND person.end_time IS NULL)"
        SQLEX += " INNER JOIN student_categories "
        SQLEX += " ON (students.student_category_id = student_categories.id)"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (students.batch_id = batches.id)"
        SQLEX += " INNER JOIN courses "
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE students.id='" & studentID & "'"

        dt_StdDetails = clsDBConn.ExecQuery(SQLEX)

    End Sub

    Private Sub ButtonX3_Click(sender As Object, e As EventArgs) Handles ButtonX3.Click

        Cursor = Cursors.WaitCursor

        Dim frm As New fmaStudentFeePaymentsForm
        frm.shortcut = True
        frm.cmbyearbatch.Text = _batchyear
        frm.cmbBatch.SelectedValue = _batchID
        frm.class_roll_no = _class_roll_no
        frm.BringToFront()
        frm.Show()

        Cursor = Cursors.Default

    End Sub


    Dim COE As New PrintCertificateOfEnrollment

    Dim Enroll_Slip As New PrintEnrollmentSlip

    Dim SubjectEnrollmentSlip As New List(Of Subject_EnrollmentSlip)

    Private Sub ButtonX4_Click(sender As Object, e As EventArgs) Handles ButtonX4.Click

        If lblEnrollStatus.Text = "NOT ENROLLED" Then
            MessageBox.Show("Can not Print....Student Not Enrolled", "NOT ENROLLED")
            Exit Sub
        End If


        Cursor = Cursors.WaitCursor

        Dim last_name As String = ""
        Dim first_name As String = ""
        Dim middle_name As String = ""
        Dim display_name As String = ""
        Dim gender As String = ""
        Dim birth_place As String = ""
        Dim date_of_birth As String = ""
        Dim age As String = ""
        Dim marital_status As String = ""
        Dim telephone1 As String = ""
        Dim email As String = ""
        Dim address As String = ""

        Dim contact_person As String = ""
        Dim contact_number As String = ""
        Dim contact_address As String = ""

        Dim ID_Number As String = ""
        Dim LRN_number As String = ""
        Dim Academic_year As String = ""
        Dim course_grade As String = ""
        Dim year_level As String = ""
        Dim semester As String = ""
        Dim scholarship_any As String = ""
        Dim basis_admission As String = ""

        Dim lastSchoolAttended1 As String = ""
        Dim lastSchoolAttended1_yearGraduated As String = ""
        Dim lastSchoolAttended2 As String = ""
        Dim lastSchoolAttended2_yearGraduted As String = ""

        Dim track As String = ""
        Dim strand As String = ""

        Dim Elementary_school As String = ""
        Dim Elementary_year_from As Date
        Dim Elementary_year_to As Date
        Dim High_school As String = ""
        Dim High_year_from As Date
        Dim High_year_to As Date

        Dim lecUnits As Double
        Dim labUnits As Double

        Try

            Dim dt_subject As New DataTable
            dt_subject = Enroll_Slip.LoadEnrollSlip(txtAdmissionNo.Text)

            dt_subject_global = dt_subject

            If dt_subject.Rows.Count > 0 Then

                For Each row As DataRow In dt_subject.Rows
                    Dim obj As New Subject_EnrollmentSlip
                    With obj

                        Select Case _student_category_id
                            Case 13
                                .subject_code = If(IsDBNull(row("SUBJ.CODE").ToString), "", row("SUBJ.CODE").ToString)
                                .subject = If(IsDBNull(row("SUBJECT TITLE").ToString), "", row("SUBJECT TITLE").ToString)
                                .lec = If(IsDBNull(row("LEC").ToString), "", row("LEC").ToString)
                                .lab = If(IsDBNull(row("LAB").ToString), "", row("LAB").ToString)
                                .day = If(IsDBNull(row("DAYS").ToString), "", row("DAYS").ToString)
                                .time = If(IsDBNull(row("TIME").ToString), "", row("TIME").ToString)
                                .room = If(IsDBNull(row("ROOMS").ToString), "", row("ROOMS").ToString)
                                .instructor = If(IsDBNull(row("INSTRUCTOR").ToString), "", row("INSTRUCTOR").ToString)
                                basis_admission = If(IsDBNull(row("STATURE").ToString), "", row("STATURE").ToString)
                            Case 16
                                .subject_code = If(IsDBNull(row("SUBJ.AREAS").ToString), "", row("SUBJ.AREAS").ToString)
                                .subject = If(IsDBNull(row("SUBJECT TITLE").ToString), "", row("SUBJECT TITLE").ToString)
                                .room = If(IsDBNull(row("ROOMS").ToString), "", row("ROOMS").ToString)
                                .day = If(IsDBNull(row("DAYS").ToString), "", row("DAYS").ToString)
                                .time = If(IsDBNull(row("TIME").ToString), "", row("TIME").ToString)
                                .instructor = If(IsDBNull(row("INSTRUCTOR").ToString), "", row("INSTRUCTOR").ToString)
                                track = If(IsDBNull(row("TRACK").ToString), "", row("TRACK").ToString)
                                strand = If(IsDBNull(row("STRAND").ToString), "", row("STRAND").ToString)
                            Case Else
                                .subject = If(IsDBNull(row("SUBJECT TITLE").ToString), "", row("SUBJECT TITLE").ToString)
                                .time = If(IsDBNull(row("TIME").ToString), "", row("TIME").ToString)
                                .day = If(IsDBNull(row("DAYS").ToString), "", row("DAYS").ToString)
                                .instructor = If(IsDBNull(row("INSTRUCTOR").ToString), "", row("INSTRUCTOR").ToString)
                        End Select


                    End With

                    SubjectEnrollmentSlip.Add(obj)

                Next

                Try
                    Dim LastSchool_Attended As New DataTable
                    LastSchool_Attended = getLastAttended_School(PERSON_ID)
                    Elementary_school = If(IsDBNull(LastSchool_Attended(0)("SCHOOLNAME").ToString), "", LastSchool_Attended(0)("SCHOOLNAME").ToString)
                    Elementary_year_from = If(IsDBNull(LastSchool_Attended(0)("FROM").ToString), "", LastSchool_Attended(0)("FROM").ToString)
                    Elementary_year_to = If(IsDBNull(LastSchool_Attended(0)("TO").ToString), "", LastSchool_Attended(0)("TO").ToString)
                    High_school = If(IsDBNull(LastSchool_Attended(1)("SCHOOLNAME").ToString), "", LastSchool_Attended(1)("SCHOOLNAME").ToString)
                    High_year_from = If(IsDBNull(LastSchool_Attended(1)("FROM").ToString), "", LastSchool_Attended(1)("FROM").ToString)
                    High_year_to = If(IsDBNull(LastSchool_Attended(1)("TO").ToString), "", LastSchool_Attended(1)("TO").ToString)
                Catch ex As Exception

                End Try


                Dim dt As New DataTable
                dt = ListModel.getRecord(PERSON_ID)
                If dt.Rows.Count > 0 Then

                    Try
                        last_name = If(IsDBNull(dt(0)("last_name")), "", dt(0)("last_name"))
                        first_name = If(IsDBNull(dt(0)("first_name")), "", dt(0)("first_name"))
                        middle_name = If(IsDBNull(dt(0)("middle_name")), "", dt(0)("middle_name"))
                        display_name = If(IsDBNull(dt(0)("display_name")), "", dt(0)("display_name"))
                        gender = If(IsDBNull(dt(0)("gender")), "", dt(0)("gender"))
                        birth_place = If(IsDBNull(dt(0)("birth_place")), "", dt(0)("birth_place"))
                        marital_status = If(IsDBNull(dt(0)("marital_status")), "", dt(0)("marital_status"))
                        telephone1 = If(IsDBNull(dt(0)("telephone1")), "", dt(0)("telephone1"))
                        email = If(IsDBNull(dt(0)("email")), "", dt(0)("email"))
                        address = If(IsDBNull(dt(0)("address")), "", dt(0)("address"))
                        contact_person = If(IsDBNull(dt(0)("contact_person")), "", dt(0)("contact_person"))
                        contact_number = If(IsDBNull(dt(0)("contact_number")), "", dt(0)("contact_number"))
                        contact_address = If(IsDBNull(dt(0)("contact_address")), "", dt(0)("contact_address"))

                        LRN_number = If(IsDBNull(dt(0)("LRN_number")), "", dt(0)("LRN_number"))
                        scholarship_any = If(IsDBNull(dt(0)("scholarshipgrant")), "", dt(0)("scholarshipgrant"))

                        Academic_year = If(IsDBNull(dt_subject(0)("A.Y.").ToString), "", dt_subject(0)("A.Y.").ToString)
                        course_grade = If(IsDBNull(dt_subject(0)("COURSE").ToString), "", dt_subject(0)("COURSE").ToString)
                        year_level = If(IsDBNull(dt_subject(0)("YEAR LEVEL").ToString), "", dt_subject(0)("YEAR LEVEL").ToString)
                        semester = If(IsDBNull(dt_subject(0)("SEMESTER").ToString), "", dt_subject(0)("SEMESTER").ToString)
                        ID_Number = If(IsDBNull(dt_subject(0)("STD.ID").ToString), "", dt_subject(0)("STD.ID").ToString)

                        lastSchoolAttended1 = Elementary_school
                        lastSchoolAttended1_yearGraduated = Format(Elementary_year_from.Date, "yyyy") + "-" + Format(Elementary_year_to.Date, "yyyy")
                        lastSchoolAttended2 = High_school
                        lastSchoolAttended2_yearGraduted = Format(High_year_from.Date, "yyyy") + "-" + Format(High_year_to.Date, "yyyy")



                        age = GetCurrentAge(If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth")))
                        Dim DOB As Date = If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth"))
                        date_of_birth = Format(DOB.Date, "MM-dd-yyyy")


                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try


                    Dim page As Integer = 1
                    Dim total_page As Integer = 2

                    Dim Master_Report As New xtrEnrollmentSlip_Main

                    While page <= total_page

                        Dim Main_report(page) As xtrEnrollmentSlip_Main
                        Main_report(page) = New xtrEnrollmentSlip_Main

                        Select Case _student_category_id
                            Case 13
                                Dim deans_head As String = getDeansHead(_courseID)
                                Try
                                    lecUnits = 0
                                    labUnits = 0
                                    For Each row As DataRow In dt_subject.Rows
                                        '        If row.Item("LEC") <> "" Or row.Item("LEC") <>  Then
                                        lecUnits += row.Item("LEC")
                                        '       Else
                                        labUnits += row.Item("LAB")
                                        '       End If
                                    Next

                                    Dim report As New xtrEnrollmentSlip_College

#Region "Signatory"
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel1.Text = dt_sigantory(0)("name")
                                        report.XrLabel2.Text = dt_sigantory(0)("designation")
                                        report.XrLabel74.Text = dt_sigantory(0)("name")
                                        report.XrLabel71.Text = dt_sigantory(0)("designation")

                                        report.XrLabel3.Text = dt_sigantory(1)("name")
                                        report.XrLabel4.Text = dt_sigantory(1)("designation")
                                        report.XrLabel80.Text = dt_sigantory(1)("name")
                                        report.XrLabel79.Text = dt_sigantory(1)("designation")

                                        report.XrLabel10.Text = dt_sigantory(2)("name")
                                        report.XrLabel5.Text = dt_sigantory(2)("designation")
                                        report.XrLabel75.Text = dt_sigantory(2)("name")
                                        report.XrLabel78.Text = dt_sigantory(2)("designation")

                                        report.XrLabel6.Text = dt_sigantory(3)("name")
                                        report.XrLabel7.Text = dt_sigantory(3)("designation")
                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.title_header.Text = _batch_name
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")

                                    report.LecUnits.Text = lecUnits
                                    report.LabUnits.Text = labUnits


                                    If dt_subject(0)("enrollmentAS").ToString = "NEW" Or dt_subject(0)("enrollmentAS").ToString = "TRANSFEREE" Then
                                        report.GroupFooter2.Visible = True
                                        report.deans_name_new.Text = deans_head
                                    Else
                                        report.GroupFooter3.Visible = True
                                        report.deans_name_old.Text = deans_head
                                    End If

                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    '   report.txtCourse.Text = date_of_birth
                                    report.txtCivilStatus.Text = marital_status
                                    report.txtGender.Text = gender
                                    report.txtBirthDate.Text = date_of_birth
                                    report.txtContactNo.Text = telephone1
                                    report.txtYearLevel.Text = LRN_number
                                    report.txtAddress.Text = address

                                    report.txtParentGuardian.Text = contact_person
                                    '    report.txtContactNo.Text = contact_number
                                    report.txtBirthPlace.Text = birth_place

                                    report.txtSchAttended1.Text = lastSchoolAttended1
                                    report.txtYearCompleted1.Text = lastSchoolAttended1_yearGraduated
                                    report.txtSchAttended2.Text = lastSchoolAttended2
                                    report.txtYearCompleted2.Text = lastSchoolAttended2_yearGraduted

                                    If _courseID = 29 Then
                                        report.txtCourse.Text = dt_subject(0)("MAJOR").ToString
                                    Else
                                        report.txtCourse.Text = course_grade
                                    End If

                                    report.txtSemester.Text = semester
                                    report.txtYearLevel.Text = year_level
                                    report.txtAdmisBasis.Text = basis_admission
                                    report.txtScholarship.Text = scholarship_any
                                    report.txtIDNumber.Text = ID_Number.ToUpper
                                    report.txtAY.Text = Academic_year
                                    report.txtEmail.Text = email


                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '   report.PrintableComponentContainer1.PrintableComponent = GridControl

                                    Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                    If page = 1 Then
                                        report.copy.ForeColor = Color.Orange
                                        report.copy.Text = "STUDENTS COPY"
                                    Else
                                        report.copy.ForeColor = Color.Black
                                        report.copy.Text = "REGISTRAR’S COPY"
                                    End If

                                    Subreport.ReportSource = report

                                Catch ex As Exception

                                End Try

                                Try
                                    Dim report As New xtrEnrollmentSlip_College

#Region "Signatory"
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel1.Text = dt_sigantory(0)("name")
                                        report.XrLabel2.Text = dt_sigantory(0)("designation")
                                        report.XrLabel74.Text = dt_sigantory(0)("name")
                                        report.XrLabel71.Text = dt_sigantory(0)("designation")

                                        report.XrLabel3.Text = dt_sigantory(1)("name")
                                        report.XrLabel4.Text = dt_sigantory(1)("designation")
                                        report.XrLabel80.Text = dt_sigantory(1)("name")
                                        report.XrLabel79.Text = dt_sigantory(1)("designation")

                                        report.XrLabel10.Text = dt_sigantory(2)("name")
                                        report.XrLabel5.Text = dt_sigantory(2)("designation")
                                        report.XrLabel75.Text = dt_sigantory(2)("name")
                                        report.XrLabel78.Text = dt_sigantory(2)("designation")

                                        report.XrLabel6.Text = dt_sigantory(3)("name")
                                        report.XrLabel7.Text = dt_sigantory(3)("designation")
                                    Catch ex As Exception
                                    End Try

#End Region

                                    report.title_header.Text = _batch_name
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")

                                    report.LecUnits.Text = lecUnits
                                    report.LabUnits.Text = labUnits

                                    If dt_subject(0)("enrollmentAS").ToString = "NEW" Or dt_subject(0)("enrollmentAS").ToString = "TRANSFEREE" Then
                                        report.GroupFooter2.Visible = True
                                        report.deans_name_new.Text = deans_head
                                    Else
                                        report.GroupFooter3.Visible = True
                                        report.deans_name_old.Text = deans_head
                                    End If

                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    '      report.txtCourse.Text = date_of_birth
                                    report.txtCivilStatus.Text = marital_status
                                    report.txtGender.Text = gender
                                    report.txtBirthDate.Text = date_of_birth
                                    report.txtContactNo.Text = telephone1
                                    report.txtYearLevel.Text = LRN_number
                                    report.txtAddress.Text = address

                                    report.txtParentGuardian.Text = contact_person
                                    '  report.txtContactNo.Text = contact_number
                                    report.txtBirthPlace.Text = birth_place

                                    report.txtSchAttended1.Text = lastSchoolAttended1
                                    report.txtYearCompleted1.Text = lastSchoolAttended1_yearGraduated
                                    report.txtSchAttended2.Text = lastSchoolAttended2
                                    report.txtYearCompleted2.Text = lastSchoolAttended2_yearGraduted

                                    If _courseID = 29 Then
                                        report.txtCourse.Text = dt_subject(0)("MAJOR").ToString
                                    Else
                                        report.txtCourse.Text = course_grade
                                    End If

                                    report.txtSemester.Text = semester
                                    report.txtYearLevel.Text = year_level
                                    report.txtAdmisBasis.Text = basis_admission
                                    report.txtScholarship.Text = scholarship_any
                                    report.txtIDNumber.Text = ID_Number.ToUpper
                                    report.txtAY.Text = Academic_year
                                    report.txtEmail.Text = email

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '  report.PrintableComponentContainer1.PrintableComponent = GridControl

                                    Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                    If page = 1 Then
                                        report.copy.ForeColor = Color.Purple
                                        report.copy.Text = "DEANS’S COPY"

                                    Else
                                        report.copy.ForeColor = Color.DarkCyan
                                        report.copy.Text = "ACCOUNTING’S COPY"

                                    End If

                                    Subreport2.ReportSource = report
                                Catch ex As Exception

                                End Try

                            Case 16

                                Try
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_SeniorHigh

#Region "Signatory"
                                    report.XrLabel20.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR SENIOR HIGH"

                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated
                                    report.txtTrack.Text = track
                                    report.txtStrand.Text = strand

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '     report.PrintableComponentContainer1.PrintableComponent = GridControl

                                    Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Orange
                                        report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Blue
                                        report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                    End If

                                    Subreport.ReportSource = report

                                Catch ex As Exception

                                End Try

                                Try
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_SeniorHigh
#Region "Signatory"
                                    report.XrLabel20.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR SENIOR HIGH"

                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated
                                    report.txtTrack.Text = track
                                    report.txtStrand.Text = strand

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '    report.PrintableComponentContainer1.PrintableComponent = GridControl

                                    Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Green
                                        report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year

                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Red
                                        report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year

                                    End If

                                    Subreport2.ReportSource = report
                                Catch ex As Exception

                                End Try


                            Case 15
                                Try
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_JuniorG78910

#Region "Signatory"
                                    report.XrLabel112.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR JHS SECONDARY"
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                    report.title_header.Text = _batch_name
                                    '   report.DataSource = SubjectEnrollmentSlip

                                    Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Orange
                                        report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Blue
                                        report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                    End If

                                    Subreport.ReportSource = report

                                Catch ex As Exception

                                End Try

                                Try
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_JuniorG78910

#Region "Signatory"
                                    report.XrLabel112.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR JHS SECONDARY"
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip

                                    Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Green
                                        report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year 'GridView.GetRowCellValue(0, "A.Y.")

                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Red
                                        report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year  'GridView.GetRowCellValue(0, "A.Y.")

                                    End If

                                    Subreport2.ReportSource = report
                                Catch ex As Exception

                                End Try


                            Case Else

                                Dim grade As String = dt_subject(0)("COURSE")
                                Select Case grade
                                    Case "G-1", "G-2", "G-3"
                                        Try

                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG123  'xtrEnrollmentSlip_JuinorElementary

#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region


                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            '   report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Orange
                                                report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Blue
                                                report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                            End If

                                            Subreport.ReportSource = report

                                        Catch ex As Exception

                                        End Try

                                        Try
                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG123  'xtrEnrollmentSlip_JuinorElementary

#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region


                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Green
                                                report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year 'GridView.GetRowCellValue(0, "A.Y.")

                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Red
                                                report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year  'GridView.GetRowCellValue(0, "A.Y.")

                                            End If

                                            Subreport2.ReportSource = report
                                        Catch ex As Exception

                                        End Try

                                    Case Else

                                        Try
                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG456  'xtrEnrollmentSlip_JuinorElementary

#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region

                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            '   report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Orange
                                                report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Blue
                                                report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                            End If

                                            Subreport.ReportSource = report

                                        Catch ex As Exception

                                        End Try

                                        Try
                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG456  'xtrEnrollmentSlip_JuinorElementary

#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region

                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Green
                                                report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year 'GridView.GetRowCellValue(0, "A.Y.")

                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Red
                                                report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year  'GridView.GetRowCellValue(0, "A.Y.")

                                            End If

                                            Subreport2.ReportSource = report
                                        Catch ex As Exception

                                        End Try

                                End Select




                        End Select


                        Main_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
                        Main_report(page).CreateDocument()

                        Master_Report.Pages.AddRange(Main_report(page).Pages)
                        Master_Report.PrintingSystem.ContinuousPageNumbering = True

                        page += 1
                    End While

                    Master_Report.ShowPreview

                    SubjectEnrollmentSlip.Clear()


                End If
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


        Cursor = Cursors.Default


    End Sub

    Private Function getLastAttended_School(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
		school_address  AS 'SCHOOLNAME', 
	  date_from AS 'FROM',
      date_to as 'TO'
FROM
	person_educational_attainment
WHERE
	person_id = '" & pERSON_ID & "' AND 
	education_attainment IN('Elementary Graduate','High School Graduate')

ORDER BY education_attainment
	
	"
        Return DataSource(sql)
    End Function

    Private Sub DesignGridControl(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)
        view.BeginUpdate()

        Select Case _student_category_id
            Case 13
                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9, 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case 11, 12, 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 14, 15
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 16, 17
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()

                        Case Else
                            view.Columns(i).Visible = False
                    End Select

                Next

            Case 16

                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()

                        Case 11, 12, 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 14, 15
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case Else
                            view.Columns(i).Visible = False
                    End Select

                Next
            Case Else

                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 300
                        '    view.Columns(i).BestFit()
                        Case 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 130
                        Case 11
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 130
                   '         view.Columns(i).BestFit()
                        Case 12
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 200
                            '             view.Columns(i).BestFit()
                        Case 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 150
                        Case Else
                            view.Columns(i).Visible = False
                    End Select

                Next
        End Select

        view.RefreshData()
        view.EndUpdate()



    End Sub

    Private Sub SimpleButton1_Click(sender As Object, e As EventArgs) Handles SimpleButton1.Click
        GridControl1.DataSource = Nothing
        GridControl1.DataSource = Enroll_Slip.LoadEnrollSlip(txtAdmissionNo.Text)
        Enroll_Slip.DesignGridControl(GridView1)
    End Sub

    Private Sub fmaStudentsSubjectListForm_FormClosed(sender As Object, e As FormClosedEventArgs) Handles Me.FormClosed
        Me.Close()
    End Sub

    Private Sub btnAdjust_Click(sender As Object, e As EventArgs)


        addSubj = New fmaAddSubjectForm
        With addSubj
            .txtStudentID.Text = Me.txtStudentID.Text
            .StudentSubjectSysPK = StudentSubjectSysPK
            .batchID = txtBatchName.Tag 'BatchID\
        End With

        addSubj.Show(Me)



    End Sub

End Class