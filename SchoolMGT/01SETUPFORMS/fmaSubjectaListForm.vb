Imports System.Threading
Imports System.ComponentModel

Public Class fmaSubjectaListForm

    Dim WithEvents newSubject As fmaSubjectaSetupForm

    Private m_AsyncWorker As New BackgroundWorker()
    Dim FirstLoad As Boolean = True


    Private Sub fmaStudentListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblStatus.Text = "Waiting ..."

        FirstLoad = True
        displaySchoolYear()
        displayCategory()
        displayCourse()
        displayBatches()

        If Me.Tag = 2 Then
            CMenuStripOperations.Visible = False
            Panel2.Visible = True
            Panel1.Visible = False
        Else
            btnSearchCondition.Enabled = True
            CMenuStripOperations.Visible = True
            Panel2.Visible = False
            Panel1.Visible = True
        End If

        FirstLoad = False

        If _credit_distribution = True Then
            CatID = _student_category_id
            txtCourseID.Text = _courseID


            cmbCategory.SelectedValue = _student_category_id
            cmbCourse.SelectedValue = _courseID

            txtBatchID.Text = _batchID
            cmbBatch.Text = _batch_name


            btnSearchCondition.PerformClick()
        End If


    End Sub

    Private Sub displaySchoolYear()
        cmbyearbatch.DataSource = DataSource(String.Format("SELECT DISTINCT
                                    1 as 'id',
                                    batches.school_year 'name'
                                    FROM
                                    batches
                                    WHERE school_year is NOT NULL
                                    ORDER BY school_year DESC
                                    "))
        cmbyearbatch.ValueMember = "id"
        cmbyearbatch.DisplayMember = "name"
        cmbyearbatch.SelectedIndex = -1
    End Sub

    Private Sub displayCategory()

        cmbCategory.DataSource = DataSource(String.Format("SELECT
	                                                    student_categories.id, 
	                                                    student_categories.`name`
                                                    FROM
	                                                    student_categories
                                                    WHERE is_deleted = 0
                                                    "))

        cmbCategory.DisplayMember = "name"
        cmbCategory.ValueMember = "id"
        cmbCategory.SelectedIndex = -1


    End Sub

    Private Sub displayCourse()
        'Dim SQLEX As String = "SELECT id, course_name  FROM courses"
        'SQLEX += " WHERE is_deleted <> 1 and category_id = '" & CatID & "' "
        'SQLEX += " GROUP BY course_name"
        'SQLEX += " ORDER BY course_name"

        'Dim MeData As DataTable
        'MeData = DataSource(SQLEX)

        cmbCourse.DataSource = DataSource(String.Format("SELECT id,course_name FROM	courses 
                                WHERE is_deleted <> 1 AND category_id = '" & CatID & "' 
                                GROUP BY 	course_name 
                                ORDER BY 	course_name"))

        cmbCourse.ValueMember = "id"
        cmbCourse.DisplayMember = "course_name"

        cmbCourse.SelectedIndex = -1
        txtCourseID.Text = ""

            tdbViewer.DataSource = Nothing
    End Sub


    Private Sub displayBatches()
        Dim SQLEX As String = "SELECT batches.id, name,year_level,semester FROM batches"
        SQLEX += " INNER JOIN courses"
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
        If Me.txtCourseID.Text <> "" Then
            SQLEX += " AND course_id='" & Me.txtCourseID.Text & "' "
        End If
        If cmbyearbatch.Text <> "" Then
            SQLEX += "  AND batches.school_year = '" & cmbyearbatch.Text & "'   "
        End If

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBatch.DataSource = MeData

        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"

        cmbBatch.Text = ""
            cmbBatch.SelectedIndex = -1
            txtBatchID.Text = ""



        txtElectives.Text = ""
        tdbViewer.Caption = "SUBJECT LIST"
        txtElectiveID.Text = ""
    End Sub



    Private Sub displayFilterCategory()
        Me.tdbViewer.DataSource = Nothing


        Dim SQLEX As String = ""
        SQLEX = "SELECT DISTINCT(subjects.id) 'subjid', subjects.`code`, subjects.`name`"
        'SQLEX += " ,subjects.ccid 'ccid',subjects.creditdistribution 'ccd'"
        SQLEX += " ,subjects.credit_hours, subjects.amount"
        SQLEX += " ,subject_laboratory.lab_name,subject_laboratory.amount 'lab amount'"
        SQLEX += " ,batches.id as 'batchid',batches.name 'batchname'"
        SQLEX += " , CASE WHEN subjects.no_exams = '0' THEN 'LECTURE'"
        SQLEX += " ELSE 'LABORATORY'"
        SQLEX += " End 'no_exams'"
        SQLEX += " , CASE WHEN subjects.elective_group_id IS NOT NULL THEN 'OPTIONAL'"
        SQLEX += " ELSE 'ELECTIVE'"
        SQLEX += " End 'elective'"
        SQLEX += " ,IFNULL(limit_subject,0) 'limit_subject'"
        SQLEX += " ,(SELECT
	                COUNT(students_subjects.subject_id)
	                FROM students_subjects 
	                 WHERE students_subjects.subject_id = subjects.id AND students_subjects.batch_id = batches.id 
	                ORDER BY  students_subjects.subject_id ASC
	                ) 'SubjectEnrolled'"
        SQLEX += ",IFNULL(limit_subject - (SELECT
				    COUNT(students_subjects.subject_id)
				    FROM students_subjects 
				     WHERE students_subjects.subject_id = subjects.id AND students_subjects.batch_id = batches.id 
				    ORDER BY  students_subjects.subject_id ASC),0) 'availability',subjects.creditdistribution,subjects.ccid,subject_laboratory.id, "
        SQLEX += " 	CASE WHEN subject_class_schedule.subject_id IS NULL THEN '' ELSE 'YES' END AS 'sched'"
        SQLEX += " FROM batches"
        SQLEX += " INNER JOIN courses ON (batches.course_id = courses.id)"
        SQLEX += " RIGHT JOIN subjects ON (subjects.batch_id = batches.id)"
        SQLEX += " LEFT JOIN subject_class_schedule ON subject_class_schedule.subject_id = subjects.id"
        SQLEX += " LEFT JOIN subject_laboratory ON (subjects.sub_lab_id = subject_laboratory.id)"
        SQLEX += " WHERE courses.id='" & txtCourseID.Text & "'"
        SQLEX += " AND subjects.is_deleted <> '1'"

        If txtBatchID.Text <> "" Then
            SQLEX += " AND batches.id='" & txtBatchID.Text & "'"
        End If

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            Me.tdbViewer.DataSource = MeData
            Me.tdbViewer.Rebind(True)

            Try
                With tdbViewer.Splits(0)
                    .DisplayColumns("subjid").Visible = False

                    .DisplayColumns("code").DataColumn.Caption = "CODE"
                    .DisplayColumns("code").Width = 90
                    .DisplayColumns("code").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("code").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                    .DisplayColumns("name").DataColumn.Caption = "DESCRIPTION"
                    .DisplayColumns("name").Width = 300
                    .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    '.DisplayColumns("ccid").Visible = False
                    '.DisplayColumns("ccd").Visible = False

                    .DisplayColumns("credit_hours").DataColumn.Caption = "UNIT/S"
                    .DisplayColumns("credit_hours").Width = 130
                    .DisplayColumns("credit_hours").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("credit_hours").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                    .DisplayColumns("amount").DataColumn.Caption = "RATE/UNIT"
                    .DisplayColumns("amount").DataColumn.NumberFormat = "#,##0.00"
                    .DisplayColumns("amount").Width = 150
                    .DisplayColumns("amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                    .DisplayColumns("lab_name").DataColumn.Caption = "LAB NAME"
                    .DisplayColumns("lab_name").Width = 150
                    .DisplayColumns("lab_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("lab_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    .DisplayColumns("lab amount").DataColumn.Caption = "LAB AMOUNT"
                    .DisplayColumns("lab amount").DataColumn.NumberFormat = "#,##0.00"
                    .DisplayColumns("lab amount").Width = 100
                    .DisplayColumns("lab amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("lab amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                    .DisplayColumns("batchid").Visible = False
                    .DisplayColumns("batchname").Visible = False


                    .DisplayColumns("no_exams").DataColumn.Caption = "LEC/LAB"
                    .DisplayColumns("no_exams").Width = 160
                    .DisplayColumns("no_exams").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("no_exams").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    'elective_group_id
                    .DisplayColumns("elective").DataColumn.Caption = "TYPE"
                    .DisplayColumns("elective").Width = 180
                    .DisplayColumns("elective").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("elective").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    .DisplayColumns("limit_subject").DataColumn.Caption = "LIMIT"
                    .DisplayColumns("limit_subject").Width = 100
                    .DisplayColumns("limit_subject").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("limit_subject").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                    .DisplayColumns("SubjectEnrolled").DataColumn.Caption = "ENROLLESS"
                    .DisplayColumns("SubjectEnrolled").Width = 100
                    .DisplayColumns("SubjectEnrolled").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("SubjectEnrolled").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                    .DisplayColumns("availability").DataColumn.Caption = "AVAILABILITY"
                    .DisplayColumns("availability").Width = 100
                    .DisplayColumns("availability").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("availability").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                    .DisplayColumns("creditdistribution").DataColumn.Caption = "CREDIT DISTRIBUTION"
                    .DisplayColumns("creditdistribution").Width = 150
                    .DisplayColumns("creditdistribution").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("creditdistribution").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    .DisplayColumns("ccid").Visible = False
                    .DisplayColumns("id").Visible = False

                    .DisplayColumns("sched").DataColumn.Caption = "SCHEDULE?"
                    .DisplayColumns("sched").Width = 100
                    .DisplayColumns("sched").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("sched").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center


                    '.DisplayColumns("EMPNAME").DataColumn.Caption = "INSTRUCTOR"
                    '.DisplayColumns("EMPNAME").Width = 150
                    '.DisplayColumns("EMPNAME").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    '.DisplayColumns("EMPNAME").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    '.DisplayColumns("schedname").DataColumn.Caption = "SCHEDULE"
                    '.DisplayColumns("schedname").Width = 200
                    '.DisplayColumns("schedname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    '.DisplayColumns("schedname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                End With
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

        Else
            tdbViewer.DataSource = Nothing
        End If


    End Sub


    Private Sub cmbCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            Me.txtCourseID.Text = drv.Item("id").ToString
            _courseID = drv.Item("id").ToString
            '  displayBatches()
            displaySelectedBatch()
        Catch ex As Exception
            Me.txtCourseID.Text = ""
        End Try

    End Sub

    Private Sub displaySelectedBatch()

        Dim SQLEX As String = "SELECT batches.id, name FROM batches"
        SQLEX += " INNER JOIN courses"
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
        SQLEX += " AND course_id='" & _courseID & "'  "
        If _school_year <> "" Then
            SQLEX += " AND school_year= '" & _school_year & "'"
        End If
        SQLEX += " ORDER BY semester,year_level"


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBatch.DataSource = MeData

        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"

        cmbBatch.Text = ""
        cmbBatch.SelectedIndex = -1
        '      .txtBatchID.Text = ""



    End Sub


    Private Sub cmbBatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbBatch.SelectedIndexChanged

        If FirstLoad = False Then
            Try
                Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
                Me.txtBatchID.Text = drv.Item("id").ToString
                _semester = drv.Item("semester").ToString '
                _year_level = drv.Item("year_level").ToString

            Catch ex As Exception
                '           Me.txtBatchID.Text = ""
            End Try

            If Me.Tag = 2 Then
                displayFilterCategory()
            End If
        End If


    End Sub

    Private Sub btnSearchCondition_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearchCondition.Click

        'rollingSpinner.Visible = True
        'stillSpinner.Visible = False

        'm_AsyncWorker.WorkerReportsProgress = True
        'm_AsyncWorker.WorkerSupportsCancellation = True
        'AddHandler m_AsyncWorker.RunWorkerCompleted, New RunWorkerCompletedEventHandler(AddressOf bwAsync_RunWorkerCompleted)
        'AddHandler m_AsyncWorker.DoWork, New DoWorkEventHandler(AddressOf bwAsync_DoWork)

        'lblStatus.Text = "Searching..."

        '' Kickoff the worker thread to begin it's DoWork function.
        'Try
        '    m_AsyncWorker.RunWorkerAsync()
        'Catch ex As Exception
        '    MsgBox("Please wait until current process is finish.", MsgBoxStyle.Information)
        'End Try

        'If txtStudentName.Text.Length > 0 Then
        '    SearchStudentName()
        'Else
        '    displayFilterCategory()
        'End If

        displayFilterCategory()
    End Sub


    Private Sub txtStudentName_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs)
        If e.KeyCode = Keys.Enter Then
            btnSearchCondition.PerformClick()
        End If
    End Sub



    Private Sub btnClearFilter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        lblStatus.Text = "Waiting ..."

        displayCourse()
        displayBatches()

        tdbViewer.DataSource = Nothing
        btnDelete.Visible = False
        btnEdit.Visible = False
    End Sub


#Region "Asynchronous BackgroundWorker Thread"
    'Private Sub Cancel_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel_Button.Click
    '    ' Notify the worker thread that a cancel has been requested.
    '    ' The cancel will not actually happen until the thread in the 
    '    ' DoWork checks the bwAsync.CancellationPending flag, for this
    '    ' reason we set the label to "Canceling...", because we haven't 
    '    ' actually cancelled yet.
    '    m_AsyncWorker.CancelAsync()
    'End Sub


    Private Sub bwAsync_DoWork(ByVal sender As Object, ByVal e As DoWorkEventArgs)
        ' The Sender is the BackgroundWorker object we need it to
        ' report progress and check for cancellation.
        Dim bwAsync As BackgroundWorker = TryCast(sender, BackgroundWorker)
        ' Thread.Sleep(1200)


        displayFilterCategory()
        SetLabel1Text("TRUE")

    End Sub



    Private Sub bwAsync_RunWorkerCompleted(ByVal sender As Object, ByVal e As RunWorkerCompletedEventArgs)
        ' The background process is complete. We need to inspect 
        ' our response to see if an error occured, a cancel was 
        ' requested or if we completed succesfully.

        'bnAsync.Text = "Start Long Running Asychronous Process"
        'bnAsync.Enabled = True

        ' Check to see if an error occured in the 
        ' background process.
        If e.[Error] IsNot Nothing Then
            MessageBox.Show(e.[Error].Message)
            Return
        End If

        ' Check to see if the background process was cancelled.
        If e.Cancelled Then
            lblStatus.Text = "Cancelled..."
            stillSpinner.Visible = True
            rollingSpinner.Visible = False
        Else
            ' Everything completed normally.
            ' process the response using e.Result

            lblStatus.Text = "Completed..."
            stillSpinner.Visible = True
            rollingSpinner.Visible = False
        End If
    End Sub

    Private Sub bwAsync_ProgressChanged(ByVal sender As Object, ByVal e As ProgressChangedEventArgs)
        ' This function fires on the UI thread so it's safe to edit
        ' the UI control directly, no funny business with Control.Invoke.
        ' Update the progressBar with the integer supplide to us from the 
        ' ReportProgress() function.  Note, e.UserState is a "tag" property
        ' that can be used to send other information from the BackgroundThread
        ' to the UI thread.

    End Sub


    Delegate Sub SetLabel1TextInvoker(ByVal TextToDisplay As String)

    Public Sub SetLabel1Text(ByVal TextToDisplay As String)
        If rollingSpinner.InvokeRequired Then
            rollingSpinner.Invoke(New SetLabel1TextInvoker(AddressOf SetLabel1Text), New Object() {TextToDisplay})
        Else
            rollingSpinner.Visible = False
            stillSpinner.Visible = True
        End If
    End Sub



#End Region


    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp
        If tdbViewer.RowCount > 0 Then
            Dim point1 As Point

            If e.Button = Windows.Forms.MouseButtons.Right Then

                point1 = Windows.Forms.Cursor.Position

                Dim pt As Point = tdbViewer.PointToClient(point1)
                CMenuStripOperations.Show(tdbViewer, pt)
            ElseIf e.Button = Windows.Forms.MouseButtons.Left Then
                btnDelete.Visible = True
                btnEdit.Visible = True
            End If
        End If


    End Sub

    Private Sub ViewAssessmentToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ViewAssessmentToolStripMenuItem.Click


        With fmaSubjectScheduleListForm
            .txtCoursename.Text = Me.cmbCourse.Text
            .txtBatchName.Text = tdbViewer.Columns.Item("batchname").Value.ToString
            .txtSubject.Text = tdbViewer.Columns.Item(2).Value.ToString

            .txtCourseID.Text = Me.txtCourseID.Text
            .txtBatchID.Text = tdbViewer.Columns.Item("batchid").Value.ToString
            .txtSubjectID.Text = tdbViewer.Columns.Item(0).Value.ToString
            .subject_code = tdbViewer.Columns.Item("code").Value.ToString


        End With

        fmaSubjectScheduleListForm.Show(ftmdiMainForm)

    End Sub

    Private Sub txtCourseID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCourseID.TextChanged
        If txtCourseID.Text.Length > 0 Then
            If cmbBatch.Enabled = False Then
                cmbBatch.Enabled = True
            End If
            displayBatches()
        Else
            cmbBatch.Text = ""
            txtBatchID.Text = ""
            cmbBatch.Enabled = False
        End If
    End Sub


    Private Sub txtBatchID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBatchID.TextChanged
        If txtBatchID.Text.Length > 0 Then
            Dim SQLEX As String = "SELECT id, name from elective_groups where batch_id='" & txtBatchID.Text & "'"
            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then
                txtElectives.Text = MeData.Rows(0).Item("name").ToString
                tdbViewer.Caption = txtElectives.Text
                txtElectiveID.Text = MeData.Rows(0).Item("id").ToString
            Else
                txtElectives.Text = cmbBatch.Text
                tdbViewer.Caption = txtElectives.Text
            End If
            btnAdd.Enabled = True
        Else
            txtElectives.Text = cmbBatch.Text
            tdbViewer.Caption = txtElectives.Text
            txtElectiveID.Text = ""
            btnAdd.Enabled = False
        End If
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If newSubject Is Nothing Then
            newSubject = fmaSubjectaSetupForm
            newSubject.txtCourseID.Text = cmbCourse.SelectedValue
            newSubject.txtElectives.Text = Me.txtElectives.Text
            tdbViewer.Caption = txtElectives.Text
            newSubject.txtElectiveID.Text = Me.txtElectiveID.Text
            newSubject.txtBatchID.Text = Me.txtBatchID.Text
            newSubject.OPETYPE = "NEW"
            newSubject.Show(Me)
        Else
            newSubject = Nothing
            newSubject = fmaSubjectaSetupForm
            newSubject.txtCourseID.Text = cmbCourse.SelectedValue
            newSubject.txtElectives.Text = Me.txtElectives.Text
            tdbViewer.Caption = txtElectives.Text
            newSubject.txtElectiveID.Text = Me.txtElectiveID.Text
            newSubject.txtBatchID.Text = Me.txtBatchID.Text
            newSubject.OPETYPE = "NEW"
            newSubject.Show(Me)
        End If
    End Sub

    Private Sub newSubject_subjectAdded() Handles newSubject.subjectAdded
        btnSearchCondition.PerformClick()
    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        deleteSelectedItem()
    End Sub

    Private Sub deleteSelectedItem()

        Dim ITEMSYSPK As String = ""

        Try
            ITEMSYSPK = tdbViewer.Columns.Item(0).Value
        Catch ex As Exception

        End Try


        Dim SQLEX As String = "SELECT COUNT(student_id) 'count' FROM students_subjects"
        SQLEX += " WHERE subject_id='" & ITEMSYSPK & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            Dim count As Integer = CInt(MeData.Rows(0).Item("count").ToString)

            If count > 0 Then
                MsgBox("Cannot Delete Subject, there are Students under it.", MsgBoxStyle.Critical)
                Exit Sub
            End If
        End If

        If MessageBox.Show("Are you sure you want to DELETE ITEM?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            If ITEMSYSPK <> "" Then
                Dim DELETESTR As String = "DELETE FROM subjects"
                DELETESTR += " WHERE id='" & ITEMSYSPK & "'"

                If clsDBConn.Execute(DELETESTR) Then
                    MsgBox("ITEM HAS BEEN DELETED", MsgBoxStyle.Information)
                    btnSearchCondition.PerformClick()
                End If
            End If
        End If



    End Sub

    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        Dim subjID As String = ""
        Dim subjCode As String = ""
        Dim subjName As String = ""
        Dim subjCreditHrs As String = ""
        Dim subjAmount As String = ""
        Dim leclab As Integer = 0
        Dim elective As Integer = 0
        Dim classtype As String = tdbViewer.Columns.Item("no_exams").Value.ToString
        Dim electivetype As String = tdbViewer.Columns.Item("elective").Value.ToString
        Dim limit As Integer = 0
        'Dim ccid As Integer = 0

        Try
            subjID = tdbViewer.Columns.Item(0).Value
            subjCode = tdbViewer.Columns.Item(1).Value
            subjName = tdbViewer.Columns.Item(2).Value
            subjCreditHrs = tdbViewer.Columns.Item(3).Value
            subjAmount = tdbViewer.Columns.Item(4).Value
            limit = tdbViewer.Columns.Item(11).Value



            'If IsDBNull(tdbViewer.Columns.Item("ccid").Value) Then
            '    ccid = -1
            'Else
            '    ccid = tdbViewer.Columns.Item("ccid").Value

            'End If


            If tdbViewer.Columns.Item("no_exams").Value.ToString = "LECTURE" Then
                leclab = 0
            Else
                leclab = 1
            End If

            If tdbViewer.Columns.Item("elective").Value.ToString = "OPTIONAL" Then
                elective = 0
            Else
                elective = 1
            End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        If newSubject Is Nothing Then
            newSubject = fmaSubjectaSetupForm
            newSubject.txtElectives.Text = Me.txtElectives.Text
            tdbViewer.Caption = txtElectives.Text
            newSubject.txtElectiveID.Text = Me.txtElectiveID.Text
            newSubject.txtBatchID.Text = Me.txtBatchID.Text
            newSubject.txtSubjID.Text = subjID
            newSubject.txtSubjCode.Text = subjCode
            newSubject.txtName.Text = subjName
            newSubject.txtlimit_subject.Value = limit
            newSubject.txtCourseID.Text = cmbCourse.SelectedValue
            newSubject.cmbDistribution.Text = tdbViewer.Columns.Item("creditdistribution").Value.ToString
            newSubject.LabID = If(IsDBNull(tdbViewer.Columns.Item("id").Value), -1, tdbViewer.Columns.Item("id").Value)
            newSubject.dbiLabAmount.Value = If(IsDBNull(tdbViewer.Columns.Item("lab amount").Value), 0, tdbViewer.Columns.Item("lab amount").Value)
            'newSubject.CDValue = ccid
            If elective = 0 Then
                newSubject.rbtnOptional.Checked = True
            Else
                newSubject.rbtnElective.Checked = True
            End If

            newSubject.TYPE = leclab
            newSubject.txtNoUnit.Value = CInt(subjCreditHrs)
            newSubject.txtAmount.Value = CDbl(subjAmount)

            newSubject.OPETYPE = "EDIT"
            newSubject.Show(Me)
        Else
            newSubject = Nothing
            newSubject = fmaSubjectaSetupForm
            newSubject.txtElectives.Text = Me.txtElectives.Text
            tdbViewer.Caption = txtElectives.Text
            newSubject.txtElectiveID.Text = Me.txtElectiveID.Text
            newSubject.txtBatchID.Text = Me.txtBatchID.Text
            newSubject.txtSubjID.Text = subjID
            newSubject.txtSubjCode.Text = subjCode
            newSubject.txtName.Text = subjName
            newSubject.txtlimit_subject.Value = limit
            newSubject.txtCourseID.Text = cmbCourse.SelectedValue
            newSubject.cmbDistribution.Text = tdbViewer.Columns.Item("creditdistribution").Value.ToString
            newSubject.LabID = If(IsDBNull(tdbViewer.Columns.Item("id").Value), -1, tdbViewer.Columns.Item("id").Value)
            newSubject.dbiLabAmount.Value = If(IsDBNull(tdbViewer.Columns.Item("lab amount").Value), 0, tdbViewer.Columns.Item("lab amount").Value)
            'newSubject.CDValue = ccid
            If elective = 0 Then
                newSubject.rbtnOptional.Checked = True
            Else
                newSubject.rbtnElective.Checked = True
            End If

            newSubject.TYPE = leclab
            newSubject.txtNoUnit.Value = CInt(subjCreditHrs)
            newSubject.txtAmount.Value = CDbl(subjAmount)

            newSubject.OPETYPE = "EDIT"
            newSubject.Show(Me)
        End If

    End Sub

    Private Sub StatementOfAccountToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StatementOfAccountToolStripMenuItem.Click


        With fmaStudentsGradeStudentList
            .txtCoursename.Text = Me.cmbCourse.Text
            .txtBatchName.Text = If(cmbBatch.Text = "", "", tdbViewer.Columns.Item("batchname").Value.ToString)
            .txtBatchName.Tag = If(cmbBatch.Text = "", "", cmbBatch.SelectedValue)
            .txtSubject.Text = tdbViewer.Columns.Item(2).Value.ToString
            .txtSubjectID.Text = tdbViewer.Columns.Item(0).Value.ToString
        End With

        fmaStudentsGradeStudentList.ShowDialog(Me)
    End Sub

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        Me.DialogResult = 1
        Me.Close()

    End Sub

    'Private Sub cmbBatch_SelectionChangeCommitted(sender As Object, e As EventArgs) Handles cmbBatch.SelectionChangeCommitted
    '    If Me.Tag = 2 Then
    '        displayFilterCategory()
    '    End If
    '    btnSearchCondition.Enabled = True
    'End Sub

    Private Sub tdbViewer_DoubleClick(sender As Object, e As EventArgs) Handles tdbViewer.DoubleClick

        Try
            With fmaSubjectScheduleListForm
                .txtCoursename.Text = Me.cmbCourse.Text
                .txtBatchName.Text = tdbViewer.Columns.Item("batchname").Value.ToString
                .txtSubject.Text = tdbViewer.Columns.Item(2).Value.ToString

                .txtCourseID.Text = Me.txtCourseID.Text
                .txtBatchID.Text = tdbViewer.Columns.Item("batchid").Value.ToString
                .txtSubjectID.Text = tdbViewer.Columns.Item(0).Value.ToString
                .subject_code = tdbViewer.Columns.Item("code").Value.ToString
            End With

            fmaSubjectScheduleListForm.Show(ftmdiMainForm)
        Catch ex As Exception

        End Try

    End Sub

    Private Sub AssignSubjectLimitToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AssignSubjectLimitToolStripMenuItem.Click
        Dim subjID As Integer = tdbViewer.Columns.Item(0).Value


    End Sub

    Private Sub cmbyearbatch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbyearbatch.SelectedIndexChanged

        Try
            Dim drv As DataRowView = DirectCast(cmbyearbatch.SelectedItem, DataRowView)
            _school_year = drv.Item("name").ToString
            displaySelectedBatch()
        Catch ex As Exception

        End Try

    End Sub

    Dim CatID As Integer
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged

        Try
            Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
            CatID = drv.Item("id")
            _student_category_id = drv.Item("id")
            _student_category = drv.Item("name")
            displayCourse()
        Catch ex As Exception
            cmbCategory.Text = ""
        End Try

    End Sub

    Dim dt_MultipleSubject As New DataTable
    Dim noExam As Integer
    Dim NoUnit As Double
    Dim Amount As Double
    Dim Distribution As Integer
    Dim limit_subject As Integer
    Dim ifCollege As Boolean = False

    Private Sub btnAddMultiple_Click(sender As Object, e As EventArgs) Handles btnAddMultiple.Click

        If cmbCourse.SelectedIndex <> -1 And cmbBatch.SelectedIndex <> -1 Then
            Dim frm As New frmProgramStudy
            frm.Tag = 1
            frm.catId = Me.cmbCategory.SelectedValue
            frm.cmbYearLevel.Text = _year_level
            frm.cmbSemester.Text = _semester
            frm.cmbCourse.Text = Me.cmbCourse.Text
            frm.BringToFront()
            frm.ShowDialog()

            If frm.DialogResult = DialogResult.Yes Then

                dt_MultipleSubject = frm.GridControl1.DataSource

                If cmbCategory.SelectedValue <> 13 Then
                    noExam = 0
                    NoUnit = 0
                    Amount = 0

                Else
                    ifCollege = True
                End If

                Distribution = 0
                limit_subject = 1000
                Me.txtElectiveID.Text = 0

                For Each row As DataRow In dt_MultipleSubject.Rows
                    If row("INCLUDE").ToString = "True" Then

                        If ifCollege Then
                            NoUnit = row("UNITS")
                        End If

                        Dim SQLIN As String = "INSERT INTO subjects(name,code,batch_id,no_exams,elective_group_id,credit_hours,amount"
                        SQLIN += " ,ccid,creditdistribution,limit_subject,pos_id)"
                        SQLIN += " VALUES("
                            SQLIN += String.Format("'{0}','{1}',", row("DESCRIPTIVE TITLE").ToString, row("COURSE CODE").ToString)
                            SQLIN += String.Format("'{0}','{1}',", Me.txtBatchID.Text, noExam)
                            SQLIN += String.Format("'{0}','{1}',", Me.txtElectiveID.Text, NoUnit)
                            SQLIN += String.Format("'{0}',", Amount)
                        SQLIN += String.Format("'{0}','{1}','{2}','{3}')", cmbCategory.SelectedValue, Distribution, limit_subject, row("id"))

                        clsDBConn.Execute(SQLIN)

                        End If
                Next

                MessageBox.Show("All Subject has been added....", "Successfully !")

                displayFilterCategory()
            End If

        Else
            MessageBox.Show("Invalid Selected Item....")
        End If

        ifCollege = False

    End Sub

    Private Sub fmaSubjectaListForm_FormClosed(sender As Object, e As FormClosedEventArgs) Handles MyBase.FormClosed
        Me.DialogResult = 1
    End Sub


End Class