
Imports DevComponents.DotNetBar
Imports DevExpress.Data
Imports DevExpress.XtraEditors.Repository
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraTab
Imports MySql.Data.MySqlClient
Imports DevExpress.XtraGrid.Views.Base
Public Class fmaAddSubjectForm

    Public Event SUBJECTADDED()

    Public StudentSubjectSysPK As String
    Public batchID As String
    Private Sub fmaAddSubjectForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '    cmbBatch.Enabled = False
        displayCourse()
        displayBatcheYear()
        displayBatches()

        If StudentSubjectSysPK <> "" Then
            '       getStudentSubject(StudentSubjectSysPK)
        End If

        displayFindList()

    End Sub

    Private Sub displayBatcheYear()

        cmbBatchYear.DataSource = DataSource(String.Format("SELECT DISTINCT
                                                            1 as 'id',
                                                            batches.school_year 'name'
                                                            FROM
                                                            batches
                                                            WHERE school_year is NOT NULL
                                                            ORDER BY school_year DESC"))
        cmbBatchYear.ValueMember = "id"
        cmbBatchYear.DisplayMember = "name"
        cmbBatchYear.SelectedIndex = -1
        cmbBatchYear.Text = ""

    End Sub

    Private Sub displayFindList()

        gcFind.DataSource = DataSource(String.Format("SELECT
	                    subjects.id,
	                    subjects.CODE 'Code',
	                    subjects.NAME 'Subject Name',
	                    IFNULL( program_of_study.lec_units, 0 ) AS 'Lec Units',
	                    IFNULL( program_of_study.lab_units, 0 ) 'Lab Units',
	                    subjects.credit_hours 'Total Units',
	                    courses.course_name 'Course',
	                    batches.NAME 'Batch Name',
	                    batches.id 'batchid',
	                    'False' AS 'Check' 
                    FROM
	                    batches
	                    INNER JOIN courses ON ( batches.course_id = courses.id )
	                    INNER JOIN subjects ON ( subjects.batch_id = batches.id )
	                    LEFT JOIN program_of_study ON program_of_study.id = subjects.pos_id 

                    WHERE
                        	courses.category_id = '" & _student_category_id & "'   
                        "))

        DesigngvFind(gvFind)


    End Sub

    Private Sub DesigngvFind(gvFind As GridView)

        Dim View As GridView = DirectCast(gvFind, GridView)

        For i As Integer = 0 To View.Columns.Count - 1
            Select Case i
                Case 1
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).Width = 60
                Case 2
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).Width = 200
                Case 3, 4, 5
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).Width = 50
                Case 6
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).Width = 100
                Case 7
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).Width = 150

                Case Else
                    View.Columns(i).Visible = False
            End Select
        Next


    End Sub

    Private Sub getStudentSubject(studentSubjectSysPK As String)
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	subjects.id,
	`subjects`.`code`,
	`subjects`.`name`,
	subjects.credit_hours,
	subjects.amount,
	batches.id 'batchid',
	batches.NAME 'batchname',
	'True' AS 'Check',
	courses.course_name
FROM
	batches
	INNER JOIN courses ON ( batches.course_id = courses.id )
	INNER JOIN subjects ON ( subjects.batch_id = batches.id ) 
	INNER JOIN students_subjects ON(students_subjects.batch_id =batches.id AND  students_subjects.subject_id = subjects.id)
WHERE
	students_subjects.subject_class_schedule_id IN(" & studentSubjectSysPK & ")
	AND subjects.is_deleted <> '1' 
	AND elective_group_id IS NOT NULL 
"))
        creatMultipleEntry(dt)
    End Sub

    Private Sub displayCourse()
        Dim SQLEX As String = "SELECT id, course_name  FROM courses"
        SQLEX += " WHERE is_deleted <> 1 AND category_id = '" & _student_category_id & "'"
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

        Dim SQLEX As String = "SELECT batches.id, name FROM batches"
        SQLEX += " INNER JOIN courses"
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
        SQLEX += " AND course_name='" & Me.cmbCourse.Text & "'"
        If txtBatchYear.Text <> "" Then
            SQLEX += " AND school_year = '" & Me.cmbBatchYear.Text & "'"
        End If

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBatch.DataSource = MeData

        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"

        cmbBatch.SelectedIndex = -1
        txtBatchID.Text = ""
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub



    Private Sub txtCourseID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCourseID.TextChanged
        If txtCourseID.Text.Length > 0 Then
            If cmbBatch.Enabled = False Then
                cmbBatch.Enabled = True
            End If
            '        displayBatches()
        Else
            cmbBatch.Enabled = False
        End If
    End Sub

    Private Sub cmbCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            Me.txtCourseID.Text = drv.Item("id").ToString
            displayBatcheYear()
            cmbBatchYear.Enabled = True
            '     displayBatches()
        Catch ex As Exception
            Me.txtCourseID.Text = ""
            cmbBatchYear.Enabled = False

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


    Private Sub displaySubject()
        Dim SQLEX As String = "SELECT subjects.id, subjects.code 'Code', subjects.name 'Subject Name'"
        SQLEX += " ,IFNULL(program_of_study.lec_units,0) AS 'Lec Units',IFNULL(program_of_study.lab_units,0) 'Lab Units'"
        SQLEX += " , subjects.credit_hours 'Total Units',courses.course_name 'Course',batches.name 'Batch Name',batches.id 'batchid','False' as 'Check'"
        SQLEX += " , CASE WHEN IFNULL((SELECT rate FROM student_rate WHERE person_id = '" & PERSON_ID & "' ORDER BY id DESC LIMIT 1),0) = 0 THEN subjects.amount"
        SQLEX += "   ELSE (SELECT rate FROM student_rate WHERE person_id = '" & PERSON_ID & "' ORDER BY id DESC LIMIT 1) END AS 'amount'"
        SQLEX += " , IFNULL(subjects.amount_lab,0)'amount_lab'"
        SQLEX += " FROM batches"
        SQLEX += " INNER JOIN courses ON (batches.course_id = courses.id)"
        SQLEX += " INNER JOIN subjects ON (subjects.batch_id = batches.id)"
        SQLEX += " LEFT JOIN program_of_study on program_of_study.id = subjects.pos_id"
        SQLEX += " WHERE courses.id='" & txtCourseID.Text & "'"
        SQLEX += " AND subjects.is_deleted <> '1' AND elective_group_id IS NOT NULL"
        SQLEX += " AND batches.id='" & txtBatchID.Text & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbSubject.DataSource = MeData

        cmbSubject.ValueMember = "id"
        cmbSubject.DisplayMember = "Subject Name"

        cmbSubject.SelectedIndex = -1
        cmbSubject.Text = ""

        creatMultipleEntry(MeData)

        DesignGridView(gvSubjectMutipleEntry)

        DisplaySummaryItem(gvSubjectMutipleEntry)

        XtraTabControl1.SelectedTabPageIndex = 1

    End Sub

    Private Sub DesignGridView(gvSubjectMutipleEntry As GridView)

        Dim View As GridView = DirectCast(gvSubjectMutipleEntry, GridView)

        For i As Integer = 0 To View.Columns.Count - 1
            Select Case i
                Case 1
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).Width = 60
                Case 2
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).Width = 200
                Case 3
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).Width = 50
                Case 4
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).Width = 50
                Case 5
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).Width = 50

                Case Else
                    View.Columns(i).Visible = False
            End Select
        Next

        Dim col As Integer = 0
        For Each column As Columns.GridColumn In View.Columns

            If col > 2 And col < 6 Then

                Dim item As GridGroupSummaryItem = New GridGroupSummaryItem()
                item.FieldName = column.FieldName
                item.ShowInGroupColumnFooter = View.Columns(column.FieldName)
                item.SummaryType = DevExpress.Data.SummaryItemType.Sum
                item.DisplayFormat = "{0:#}"

                View.GroupSummary.Add(item)

                column.Summary.Add(SummaryItemType.Sum, column.FieldName, "{0:#}")

            End If

            col += 1

        Next



    End Sub

    Private Sub DisplaySummaryItem(gvSubjectMutipleEntry As GridView)

        Dim View As GridView = DirectCast(gvSubjectMutipleEntry, GridView)

        Dim col As Integer = 0
        For Each column As Columns.GridColumn In View.Columns

            If col > 2 And col < 8 Then

                Dim item As GridGroupSummaryItem = New GridGroupSummaryItem()
                item.FieldName = column.FieldName
                item.ShowInGroupColumnFooter = View.Columns(column.FieldName)
                item.SummaryType = DevExpress.Data.SummaryItemType.Sum
                item.DisplayFormat = "{0:#}"

                View.GroupSummary.Add(item)

                column.Summary.Add(SummaryItemType.Sum, column.FieldName, "{0:#}")

            End If

            col += 1

        Next

    End Sub

    Private Sub creatMultipleEntry(dt_subjectlist As DataTable)

        gcSubjectMutipleEntry.DataSource = Nothing
        gvSubjectMutipleEntry.Columns.Clear()

        If dt_subjectlist.Rows.Count > 0 Then
            'Check if list is empty

            If gvSubjectMutipleEntry.RowCount > 0 Then

                Dim dt_New_subjectlist As DataTable = gcSubjectMutipleEntry.DataSource
                For Each rows As DataRow In dt_subjectlist.Rows

                    dt_New_subjectlist.Rows.Add(rows.Item("id"), rows.Item("Code"), rows.Item("Subject Name"), rows.Item("Lec Units"), rows.Item("Lab Units"), rows.Item("Total Units"),
                     rows.Item("Course"), rows.Item("Batch Name"), rows.Item("batchid"), rows.Item("Check"), rows.Item("amount"), rows.Item("amount_lab"))

                Next
                gcSubjectMutipleEntry.DataSource = dt_New_subjectlist
            Else
                gcSubjectMutipleEntry.DataSource = dt_subjectlist
            End If


        End If


    End Sub

    Private Sub txtBatchID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBatchID.TextChanged
        If txtBatchID.Text.Length > 0 Then
            If cmbSubject.Enabled = False Then
                cmbSubject.Enabled = True
                '            displaySubject()
            End If
        Else
            cmbSubject.Enabled = False
        End If
    End Sub

    Private Sub cmbSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbSubject.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbSubject.SelectedItem, DataRowView)
            Me.txtSubjID.Text = drv.Item("id").ToString
        Catch ex As Exception
            Me.txtSubjID.Text = ""
        End Try
    End Sub

    Private Sub txtSubjID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSubjID.TextChanged
        If txtSubjID.Text.Length <> 0 Then
            Dim SQLEX As String = "SELECT"
            SQLEX += " subjects.name"
            SQLEX += " , subjects.credit_hours"
            SQLEX += " , batches.school_year"
            SQLEX += " , batches.semester"
            SQLEX += " , subjects.no_exams"
            SQLEX += " FROM subjects"
            SQLEX += " INNER JOIN batches "
            SQLEX += " ON (subjects.batch_id = batches.id)"
            SQLEX += " WHERE subjects.id = '" & txtSubjID.Text & "'"

            Dim MeData As DataTable

            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then
                Try
                    txtDescr.Text = MeData.Rows(0).Item("name").ToString()
                    txtUnits.Text = MeData.Rows(0).Item("credit_hours").ToString()
                    txtSY.Text = MeData.Rows(0).Item("school_year").ToString()
                    txtSem.Text = MeData.Rows(0).Item("semester").ToString()

                    Dim type As Integer = 0


                    type = If(MeData.Rows(0).Item("no_exams").ToString() = "False", 0, 1)


                    If type = 0 Then
                        txtType.Text = "Lecture"
                    Else
                        txtType.Text = "Laboratory"
                    End If
                Catch ex As Exception
                    txtDescr.Text = ""
                    txtUnits.Text = ""
                    txtSY.Text = ""
                    txtSem.Text = ""
                    txtType.Text = ""
                End Try
            Else
                txtDescr.Text = ""
                txtUnits.Text = ""
                txtSY.Text = ""
                txtSem.Text = ""
                txtType.Text = ""
            End If

            SQLEX = "SELECT id FROM students_subjects"
            SQLEX += " WHERE student_id ='" & Me.txtStudentID.Text & "'"
            SQLEX += " AND subject_id ='" & Me.txtSubjID.Text & "'"

            MeData = Nothing
            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then
                '           btnAdd.Enabled = False
            Else
                btnAdd.Enabled = True
            End If




        Else
            txtDescr.Text = ""
            txtUnits.Text = ""
            txtSY.Text = ""
            txtSem.Text = ""
            txtType.Text = ""
            '      btnAdd.Enabled = False
        End If
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        If Availability = "0" Then
            MsgBox("Adding to this Subject is Invalid")
            Exit Sub
        End If

        If MessageBox.Show("Are sure you want to Add Subject to this student?", "Please Verify !", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

            If XtraTabControl1.SelectedTabPage.Text = "Multiple Entry" Then

                If gvSubjectMutipleEntry.RowCount > 0 Then

                    For Each row As DataRow In CType(gcSubjectMutipleEntry.DataSource, DataTable).Rows
                        If row("Check") = "True" Then

                            Dim SQLIN As String = "INSERT INTO students_subjects(student_id,subject_id,batch_id,lec_amt,lab_amt)"
                            SQLIN += String.Format("VALUES('{0}', '{1}',", Me.txtStudentID.Text, row("id"))
                            SQLIN += String.Format("'{0}','{1}','{2}')", row("batchid"), row("amount"), row("amount_lab")) 'batchID  'Me.txtBatchID.Text
                            clsDBConn.Execute(SQLIN)

                        End If

                    Next

                    MsgBox("Subject has been added to Student")
                    btnAdd.Enabled = False
                    RaiseEvent SUBJECTADDED()

                End If

            ElseIf XtraTabControl1.SelectedTabPage.Text = "Find Subject" Then


                If gvFind.RowCount > 0 Then

                    For Each row As DataRow In CType(gcFind.DataSource, DataTable).Rows
                        If row("Check") = "True" Then

                            Dim SQLIN As String = "INSERT INTO students_subjects(student_id,subject_id,batch_id)"
                            SQLIN += String.Format("VALUES('{0}', '{1}',", Me.txtStudentID.Text, row("id"))
                            SQLIN += String.Format("'{0}')", row("batchid")) 'batchID
                            clsDBConn.Execute(SQLIN)

                        End If
                    Next '

                    MsgBox("Subject has been added to Student")
                    btnAdd.Enabled = False
                    RaiseEvent SUBJECTADDED()

                End If




            Else

                Dim SQLIN As String = "INSERT INTO students_subjects(student_id,subject_id,batch_id)"
                SQLIN += String.Format("VALUES('{0}', '{1}',", Me.txtStudentID.Text, Me.txtSubjID.Text)
                SQLIN += String.Format("'{0}')", Me.txtBatchID.Text) ' batchID

                If clsDBConn.Execute(SQLIN) Then

                    MsgBox("Subject has been added to Student")
                    btnAdd.Enabled = False
                    RaiseEvent SUBJECTADDED()
                End If


            End If


        End If


    End Sub



    Private Function getInstructorID(lastPK As Object) As Object
        Dim id As String = DataObject(String.Format("SELECT
	                        subject_class_schedule.employee_id
                        FROM
	                        students_subjects
	                        INNER JOIN
	                        subject_class_schedule
	                        ON 
		                        students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
                        WHERE
	                        students_subjects.id = '" & lastPK & "';"))
        Return id
    End Function

    Private Function getLastPK() As Object
        Dim id As Integer = DataObject(String.Format("SELECT MAX(students_subjects.id) FROM students_subjects "))
        Return id
    End Function

    Private Sub cmbBatch_SelectionChangeCommitted(sender As Object, e As EventArgs) Handles cmbBatch.SelectionChangeCommitted
        Me.txtBatchID.Text = cmbBatch.SelectedValue
        displaySubject()
    End Sub

    'Private Sub XtraTabPage2_TabIndexChanged(sender As Object, e As EventArgs) Handles XtraTabPage2.TabIndexChanged

    '    If XtraTabControl1.SelectedTabPage.Text = "Multiple Entry" Then
    '        btnAdd.Enabled = True
    '    End If

    'End Sub

    Private Sub gvSubjectMutipleEntry_RowCellClick(sender As Object, e As RowCellClickEventArgs) Handles gvSubjectMutipleEntry.RowCellClick

        Dim view As GridView = DirectCast(sender, GridView)
        Dim SubjectID As Integer = gvSubjectMutipleEntry.GetFocusedRowCellValue("id")
        Dim BatchID As Integer = gvSubjectMutipleEntry.GetFocusedRowCellValue("batchid")

        If SubjectISClose(SubjectID, BatchID) = True Then
            MessageBoxEx.Show("This Subject is Already Close.....", "SUBJECT BEYOND THE LIMIT", MessageBoxButtons.OK, MessageBoxIcon.Information)
            displaySubject()
            Exit Sub
        Else
            If SubjectAlreadyExist(txtStudentID.Text, SubjectID, BatchID) = True Then
                MsgBox("Subject is already added in the list", MsgBoxStyle.Information, "RECORD FOUND")
                gvSubjectMutipleEntry.SetFocusedRowCellValue("Check", "False")

            Else
                btnAdd.Enabled = True
            End If
        End If

    End Sub

    Private Sub XtraTabControl1_SelectedPageChanged(sender As Object, e As TabPageChangedEventArgs) Handles XtraTabControl1.SelectedPageChanged
        If e.Page.Text = "Multiple Entry" Then
            btnAdd.Enabled = True
        ElseIf e.Page.Text = "Find Subject" Then
            btnAdd.Enabled = True
        End If
    End Sub

    Private Sub cmbSubject_SelectionChangeCommitted(sender As Object, e As EventArgs) Handles cmbSubject.SelectionChangeCommitted

        SubjectAlreadyExist(txtStudentID.Text, cmbSubject.SelectedValue, cmbBatch.SelectedValue)

        'Check Availability Subject

        If SubjectISClose(cmbSubject.SelectedValue, cmbBatch.SelectedValue) = True Then
            MessageBoxEx.Show("This Subject is Already Close.....", "SUBJECT BEYOND THE LIMIT", MessageBoxButtons.OK, MessageBoxIcon.Information)
            displaySubject()
            Exit Sub
        End If

    End Sub
    Dim Availability As String = ""
    Private Function SubjectISClose(subjectID As Object, batchID As Object) As Boolean
        Availability = DataObject(String.Format("SELECT DISTINCT
                             IFNULL(
		                        limit_subject - (
		                        SELECT
			                        COUNT( students_subjects.subject_id ) 
		                        FROM
			                        students_subjects 
		                        WHERE
			                        students_subjects.subject_id = subjects.id 
			                        AND students_subjects.batch_id = batches.id 
		                        ORDER BY
			                        students_subjects.subject_id ASC 
		                        ),
		                        0 
	                        ) 'availability' 
                        FROM
	                        batches
	                        INNER JOIN courses ON ( batches.course_id = courses.id )
	                        RIGHT JOIN subjects ON ( subjects.batch_id = batches.id )
	                        LEFT JOIN subject_class_schedule ON subject_class_schedule.subject_id = subjects.id 
                        WHERE
	                         subjects.is_deleted <> '1'  and subjects.id = '" & subjectID & "'
	                        AND batches.id = '" & batchID & "'"))

        If Availability = "0" Or Availability = " " Then
            Return True
        Else
            Return False
        End If


    End Function

    Private Function SubjectAlreadyExist(studentID As String, subjectID As Integer, batchID As Integer) As Boolean
        Dim exist As Integer = 0
        exist = DataObject(String.Format("SELECT
                students_subjects.id
                FROM
                students_subjects
                WHERE
                students_subjects.student_id = '" & studentID & "' AND
                students_subjects.subject_id = '" & subjectID & "'AND
                students_subjects.batch_id = '" & batchID & "'
                "))
        If exist > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Private Sub gvFind_ColumnFilterChanged(sender As Object, e As EventArgs)

        '      displayFindList()
        Dim view As DevExpress.XtraGrid.Views.Grid.GridView = CType(sender, DevExpress.XtraGrid.Views.Grid.GridView)
        If view.FindFilterText <> "" Then ' Code nicht ausführen, wenn ColumnFilter effektiv über den ColumnFilter geändert wurde  
            view.FindFilterText = ChangeFindBehavior(view)
        End If

        '       gvFind.Columns.View.ApplyFindFilter(gvFind.FindFilterText)
        '     gvFind.Columns.View.ApplyFindFilter(gvFind.FilterPanelText)
        '   gvFind.Columns.View.ApplyFindFilter(gvFind.OptionsFind.FindFilterColumns)
    End Sub

    Private Function ChangeFindBehavior(view As GridView) As String
        Dim FindText As String = view.FindFilterText
        FindText = Strings.Replace(FindText, "+", "")
        Dim filter As String() = Strings.Split(FindText, " ")

        If filter.Count > 1 Then
            For A = 0 To filter.Count - 1
                If Not Strings.Left(filter(A), 1) = "-" Then
                    filter(A) = "+" & filter(A)
                End If
            Next
        End If

        Return String.Join(" ", filter)
    End Function

    Private Sub gvFind_RowCellClick(sender As Object, e As RowCellClickEventArgs) Handles gvFind.RowCellClick
        Dim view As GridView = DirectCast(sender, GridView)
        Dim SubjectID As Integer = gvSubjectMutipleEntry.GetFocusedRowCellValue("id")
        Dim BatchID As Integer = gvSubjectMutipleEntry.GetFocusedRowCellValue("batchid")

        If SubjectISClose(SubjectID, BatchID) = True Then
            MessageBoxEx.Show("This Subject is Already Close.....", "SUBJECT BEYOND THE LIMIT", MessageBoxButtons.OK, MessageBoxIcon.Information)
            displaySubject()
            Exit Sub
        Else
            If SubjectAlreadyExist(txtStudentID.Text, SubjectID, BatchID) = True Then
                MsgBox("Subject is already added in the list", MsgBoxStyle.Information, "RECORD FOUND")
                gvSubjectMutipleEntry.SetFocusedRowCellValue("Check", "False")

            Else
                btnAdd.Enabled = True
            End If
        End If
    End Sub


    Private Sub cmbBatchYear_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbBatchYear.SelectedIndexChanged

        Try
            Dim drv As DataRowView = DirectCast(cmbBatchYear.SelectedItem, DataRowView)
            txtBatchYear.Text = drv.Item("name").ToString
            displayBatches()
            cmbBatch.Enabled = True
        Catch ex As Exception
            cmbBatchYear.Text = ""
            cmbBatch.Enabled = False
        End Try

    End Sub



    'Private Sub gvSubjectMutipleEntry_CustomDrawCell(sender As Object, e As DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs) Handles gvSubjectMutipleEntry.CustomDrawCell

    '    Dim CheckValue As String = ""
    '    If e.Column.FieldName = "Check" Then
    '        CheckValue = gvSubjectMutipleEntry.GetRowCellValue(e.RowHandle, "Check")
    '        If CheckValue = "True" Then
    '            gvSubjectMutipleEntry.SetRowCellValue(e.Handled, "ALL", True)
    '        Else
    '            gvSubjectMutipleEntry.SetRowCellValue(e.Handled, "ALL", False)
    '        End If
    '        ' gridView2.SetRowCellValue(e.RowHandle, "PILIH", true)

    '    End If
    'End Sub

    'Private Sub RepositoryItemCheckEdit1_CheckedChanged(sender As Object, e As EventArgs) Handles RepositoryItemCheckEdit1.CheckedChanged

    '    Dim s = e.ToString
    '    Dim CheckEdit As DevExpress.XtraEditors.CheckEdit = DirectCast(sender, DevExpress.XtraEditors.CheckEdit)
    '    If CheckEdit.Checked = True Then
    '        '       gvSubjectMutipleEntry.FocusedRowHandle = True
    '        CheckEdit.Checked = True
    '    Else
    '        CheckEdit.Checked = False
    '        '      gvSubjectMutipleEntry.FocusedRowHandle = False
    '    End If

    'End Sub
End Class