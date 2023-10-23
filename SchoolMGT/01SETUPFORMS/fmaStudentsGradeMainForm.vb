Imports System.Threading
Imports System.ComponentModel

Public Class fmaStudentsGradeMainForm

    Dim WithEvents masterFeeSetup As fmaFeesMasterSetupForm
    Dim WithEvents detailFeeSetup As fmaFeesDetailListForm

    Dim ROWINDEX As Integer = 0


    Private Sub fmaFeesMasterListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'displayCategory()
        'displayCourse()
        ' displayBatches()

        If AuthUserType <> "USER" Then
            displayInstructor()
        Else
            cmbInstructor.Text = AuthUserName
            instructor_id = AppSetup_Domain
            getSubjectList()
        End If


        '    dgvFEES.Rows.Clear()
    End Sub

    Private Sub displayInstructor()

        cmbInstructor.DataSource = DataSource(String.Format("SELECT
                                    employee_id 'id',
                                    employee_name 'name'
                                    FROM
                                    subject_class_schedule
                                    WHERE employee_id > 0
                                    GROUP BY employee_id
                                    ORDER BY employee_name"))
        cmbInstructor.ValueMember = "id"
        cmbInstructor.DisplayMember = "name"
        cmbInstructor.SelectedIndex = -1

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
        Dim SQLEX As String = "SELECT id, course_name  FROM courses"
        SQLEX += " WHERE is_deleted <> 1 and category_id = '" & CatID & "'"
        SQLEX += " GROUP BY course_name"
        SQLEX += " ORDER BY course_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbCourse.DataSource = MeData

        cmbCourse.ValueMember = "id"
        cmbCourse.DisplayMember = "course_name"

        cmbCourse.SelectedIndex = -1
        txtCourseID.Text = ""


    End Sub


    Private Sub displayBatches()

        Dim SQLEX As String = ""
        If AuthUserType = "SUPERUSER" Then

            SQLEX = "SELECT batches.id, name FROM batches"
            SQLEX += " INNER JOIN courses"
            SQLEX += " ON (batches.course_id = courses.id)"
            SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
            SQLEX += " AND course_id='" & Me.txtCourseID.Text & "'"

        Else

            SQLEX = "SELECT
                    batches.id,
                    batches.`name`

                    FROM
                    batches
                    INNER JOIN courses ON (batches.course_id = courses.id)
                    INNER JOIN students_subjects ON batches.id = students_subjects.batch_id
                    INNER JOIN subject_class_schedule ON students_subjects.subject_id = subject_class_schedule.subject_id
                    INNER JOIN employees ON subject_class_schedule.employee_id = employees.id
                    WHERE
                    batches.is_deleted = 0 AND
                    batches.is_active = 1 AND
                    batches.course_id = '" & Me.txtCourseID.Text & "' AND
                    employees.user_id = '" & LoginUserID & "'
"
        End If

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBatch.DataSource = MeData

        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"
        cmbBatch.Text = ""
        cmbBatch.SelectedIndex = -1
        txtBatchID.Text = ""


    End Sub

    Private Sub cmbCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            Me.txtCourseID.Text = drv.Item("id").ToString
            displayBatches()
        Catch ex As Exception
            Me.txtCourseID.Text = ""
        End Try
    End Sub

    Private Sub cmbBatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbBatch.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
            Me.txtBatchID.Text = drv.Item("id").ToString
        Catch ex As Exception
            Me.txtBatchID.Text = ""
        End Try
    End Sub

    Private Sub getMasterFees()

        Dim TOTAL_FEES As Double = 0
        dgvFEES.Rows.Clear()

        Dim SQLEX As String = "SELECT subject_class_schedule.SysPK_Item, subjects.code 'subjcode', subjects.name 'subjname'"
        SQLEX += " , subject_class_schedule.code 'schedcode',subject_class_schedule.name 'schedname',class_time "
        SQLEX += " , employee_name, subject_id"
        SQLEX += " FROM subject_class_schedule"
        SQLEX += " INNER JOIN subjects"
        SQLEX += " ON subject_class_schedule.subject_id = subjects.id"
        SQLEX += " WHERE batch_id = '" & txtBatchID.Text & "'"
        If EMPLOYEE_ID <> "" Then
            SQLEX += " AND employee_id = '" & EMPLOYEE_ID & "'"

        End If


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            For cnt As Integer = 0 To MeData.Rows.Count - 1
                Dim SysPK_Item As String = MeData.Rows(cnt).Item("SysPK_Item").ToString
                Dim subjcode As String = MeData.Rows(cnt).Item("subjcode").ToString
                Dim subjname As String = MeData.Rows(cnt).Item("subjname").ToString
                Dim schedcode As String = MeData.Rows(cnt).Item("schedcode").ToString
                Dim schedname As String = MeData.Rows(cnt).Item("schedname").ToString
                Dim class_time As String = MeData.Rows(cnt).Item("class_time").ToString
                Dim employee_name As String = MeData.Rows(cnt).Item("employee_name").ToString


                dgvFEES.Rows.Add(New String() {SysPK_Item, subjcode, subjname, schedcode, schedname, class_time, employee_name})


            Next
        Else
        End If

        If EMPLOYEE_ID <> "" Then
            dgvFEES.Columns(6).Visible = False
        Else
            dgvFEES.Columns(6).Visible = True
        End If

    End Sub

    Private Sub txtBatchID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBatchID.TextChanged
        If txtBatchID.Text.Length > 0 Then
            pbxSearch.Visible = True
            'getMasterFees()
            Timer1.Enabled = True
            rollingSpinner.Visible = True
            stillSpinner.Visible = False
            lblStatus.Text = "Searching.."
        Else
            Timer1.Enabled = False
            lblTimer.Text = "0"
            pbxSearch.Visible = False
            rollingSpinner.Visible = False
            stillSpinner.Visible = True
            pbxSearch.Visible = False
            lblStatus.Text = ""
        End If
    End Sub

    'Private Sub pbxSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles pbxSearch.Click
    '    getMasterFees()
    'End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim tick As Integer = CInt(lblTimer.Text)

        lblTimer.Text = tick + 1

        If tick = 1 Then
            Timer1.Enabled = False
            lblTimer.Text = "0"
            getMasterFees()
            lblStatus.Text = "Done."
            rollingSpinner.Visible = False
            stillSpinner.Visible = True
            pbxSearch.Visible = False

        End If
    End Sub

    Private Sub txtCourseID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCourseID.TextChanged
        dgvFEES.Rows.Clear()
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub



    Private Sub masterFeeSetup_FeeAdded() Handles masterFeeSetup.FeeAdded
        getMasterFees()
    End Sub

    'Private Sub dgvFEES_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvFEES.CellContentClick
    '    ROWINDEX = e.ColumnIndex

    '    If e.ColumnIndex = 0 Then

    '        Dim colIndex As Integer = e.ColumnIndex
    '        Dim rowIndex As Integer = e.RowIndex

    '        Dim catID As String = dgvFEES.Item(4, rowIndex).Value
    '        Dim name As String = dgvFEES.Item(0, rowIndex).Value
    '        Dim description As String = dgvFEES.Item(5, rowIndex).Value


    '        If masterFeeSetup Is Nothing Then
    '            masterFeeSetup = New fmaFeesMasterSetupForm
    '            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
    '            masterFeeSetup.txtCatID.Text = catID
    '            masterFeeSetup.txt_name.Text = name
    '            masterFeeSetup.txtDescr.Text = description
    '            masterFeeSetup.btnSave.Text = "Modify"
    '            masterFeeSetup.btnDelete.Visible = True
    '            masterFeeSetup.ShowDialog(Me)
    '        Else
    '            masterFeeSetup = Nothing
    '            masterFeeSetup = New fmaFeesMasterSetupForm
    '            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
    '            masterFeeSetup.txtCatID.Text = catID
    '            masterFeeSetup.txt_name.Text = name
    '            masterFeeSetup.txtDescr.Text = description
    '            masterFeeSetup.btnSave.Text = "Modify"
    '            masterFeeSetup.btnDelete.Visible = True
    '            masterFeeSetup.ShowDialog(Me)
    '        End If

    '    End If

    'End Sub

    Private Sub dgvFEES_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles dgvFEES.CellMouseClick
        If e.Button = Windows.Forms.MouseButtons.Right Then
            ROWINDEX = e.RowIndex
            If e.ColumnIndex = 0 Then
                If dgvFEES.Item(0, ROWINDEX).Value.ToString = "" Then
                    Exit Sub

                End If

                Dim point1 As Point

                If e.Button = Windows.Forms.MouseButtons.Right Then

                    point1 = Windows.Forms.Cursor.Position

                    Dim pt As Point = dgvFEES.PointToClient(point1)
                    CMenuStripOperations.Show(dgvFEES, pt)
                End If
            End If
        End If
    End Sub

    'Private Sub dgvFEES_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles dgvFEES.MouseUp



    '    Dim point1 As Point

    '    If e.Button = Windows.Forms.MouseButtons.Right Then

    '        point1 = Windows.Forms.Cursor.Position

    '        Dim pt As Point = dgvFEES.PointToClient(point1)
    '        CMenuStripOperations.Show(dgvFEES, pt)
    '    End If
    'End Sub

    Private Sub ViewAssessmentToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ViewAssessmentToolStripMenuItem.Click
        Dim catID As String = dgvFEES.Item(4, ROWINDEX).Value
        Dim name As String = dgvFEES.Item(0, ROWINDEX).Value
        Dim description As String = dgvFEES.Item(5, ROWINDEX).Value


        If masterFeeSetup Is Nothing Then
            masterFeeSetup = New fmaFeesMasterSetupForm
            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
            masterFeeSetup.txtCatID.Text = catID
            masterFeeSetup.txt_name.Text = name
            masterFeeSetup.txtDescr.Text = description
            masterFeeSetup.btnSave.Text = "Modify"
            masterFeeSetup.btnDelete.Visible = True
            masterFeeSetup.ShowDialog(Me)
        Else
            masterFeeSetup = Nothing
            masterFeeSetup = New fmaFeesMasterSetupForm
            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
            masterFeeSetup.txtCatID.Text = catID
            masterFeeSetup.txt_name.Text = name
            masterFeeSetup.txtDescr.Text = description
            masterFeeSetup.btnSave.Text = "Modify"
            masterFeeSetup.btnDelete.Visible = True
            masterFeeSetup.ShowDialog(Me)
        End If
    End Sub

    Private Sub StatementOfAccountToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StatementOfAccountToolStripMenuItem.Click
        Dim catID As String = dgvFEES.Item(4, ROWINDEX).Value
        Dim name As String = dgvFEES.Item(0, ROWINDEX).Value
        Dim description As String = dgvFEES.Item(5, ROWINDEX).Value

        If detailFeeSetup Is Nothing Then
            detailFeeSetup = New fmaFeesDetailListForm
            detailFeeSetup.txtCatID.Text = catID
            detailFeeSetup.txt_name.Text = name
            detailFeeSetup.txtDescr.Text = description

            detailFeeSetup.ShowDialog(Me)
        Else
            detailFeeSetup = Nothing
            detailFeeSetup = New fmaFeesDetailListForm
            detailFeeSetup.txtCatID.Text = catID
            detailFeeSetup.txt_name.Text = name
            detailFeeSetup.txtDescr.Text = description

            detailFeeSetup.ShowDialog(Me)
        End If
    End Sub

    Private Sub detailFeeSetup_WINCLOSING() Handles detailFeeSetup.WINCLOSING
        getMasterFees()
    End Sub


    Private Sub btnDuplicate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MsgBox("Function Under Modification.")
    End Sub


    Private Sub dgvFEES_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvFEES.CellContentClick
        If e.ColumnIndex = 4 Then
            Dim ROWINDEX As Integer = e.RowIndex
            Dim COLINDEX As Integer = e.ColumnIndex
            If ROWINDEX < 0 Then
                Exit Sub
            End If

            Dim instructor As String = dgvFEES.Item(9, ROWINDEX).Value
            Dim subj_name = dgvFEES.Item(2, ROWINDEX).Value & " | " & dgvFEES.Item(4, ROWINDEX).Value
            Dim subject_class_schedule_id = dgvFEES.Item(0, ROWINDEX).Value
            Dim subject_id As String = dgvFEES.Item(0, ROWINDEX).Value
            Dim course_name As String = dgvFEES.Item(7, ROWINDEX).Value
            Dim batche_name As String = dgvFEES.Item(8, ROWINDEX).Value

            cmbCourse.Text = course_name
            cmbBatch.Text = batche_name

            With fmaStudentsGradeStList
                .Text = "STUDENTS LIST UNDER : " & instructor
                .txtCoursename.Text = course_name
                .txtBatchName.Text = batche_name
                .txtSubject.Text = subj_name
                .txtSubjectID.Text = subject_id
            End With

            '   fmaStudentsGradeStList.ShowDialog(Me)
            fmaStudentsGradeStList.ShowDialog()
        End If
    End Sub

    Dim CatID As Integer
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
            CatID = drv.Item("id")
            displayCourse()
        Catch ex As Exception

        End Try
    End Sub

    Dim instructor_id As Integer
    Private Sub cmbInstructor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbInstructor.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbInstructor.SelectedItem, DataRowView)
            instructor_id = drv.Item("id").ToString
            getSubjectList()
        Catch ex As Exception
            cmbInstructor.Text = ""
        End Try
    End Sub

    Private Sub getSubjectList()

        Dim TOTAL_FEES As Double = 0
        dgvFEES.Rows.Clear()

        Dim SQLEX As String = ""
        SQLEX += "SELECT
	                subject_class_schedule.SysPK_Item,
	                subjects.CODE 'subjcode',
	                subjects.NAME 'subjname',
	                subject_class_schedule.CODE 'schedcode',
	                subject_class_schedule.NAME 'schedname',
	                class_time,
                    room,
                    employee_name 'instructor',
	                coursename,
	               batches.`name`'batchname'

                FROM
	                subject_class_schedule
	                INNER JOIN subjects ON subject_class_schedule.subject_id = subjects.id 
	                INNER JOIN students_subjects ON subjects.id = students_subjects.subject_id
                    INNER JOIN batches ON students_subjects.batch_id = batches.id
	                INNER JOIN courses ON batches.course_id = courses.id

                WHERE
	                subject_class_schedule.employee_id = '" & instructor_id & "'
	
                  GROUP BY `schedname`,`subjname` "


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            For cnt As Integer = 0 To MeData.Rows.Count - 1
                Dim SysPK_Item As String = MeData.Rows(cnt).Item("SysPK_Item").ToString
                Dim subjcode As String = MeData.Rows(cnt).Item("subjcode").ToString
                Dim subjname As String = MeData.Rows(cnt).Item("subjname").ToString
                Dim schedcode As String = MeData.Rows(cnt).Item("schedcode").ToString
                Dim schedname As String = MeData.Rows(cnt).Item("schedname").ToString
                Dim class_time As String = MeData.Rows(cnt).Item("class_time").ToString
                Dim room_name As String = MeData.Rows(cnt).Item("room").ToString
                Dim course_name As String = MeData.Rows(cnt).Item("coursename").ToString
                Dim batch_name As String = MeData.Rows(cnt).Item("batchname").ToString
                Dim instructor As String = MeData.Rows(cnt).Item("instructor").ToString

                dgvFEES.Rows.Add(New String() {SysPK_Item, subjcode, subjname, schedcode, schedname, class_time, room_name, course_name, batch_name, instructor})


            Next
        Else
        End If

        If EMPLOYEE_ID <> "" Then
            dgvFEES.Columns(6).Visible = False
        Else
            dgvFEES.Columns(6).Visible = True
        End If

    End Sub
End Class