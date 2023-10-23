Imports System.Threading
Imports System.ComponentModel
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI

Public Class fmaStudentsGradeStudentList


    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp
        If tdbViewer.RowCount > 0 Then
            If e.Button = Windows.Forms.MouseButtons.Left Then
                btnDelete.Visible = True
            End If
        End If
    End Sub

    Private Sub fmaSubjectStudentsListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        displayStudentsList()
    End Sub

    Private Sub displayStudentsList()
        Dim SQLEX As String = "SELECT students.id 'stid',person.last_name,person.first_name,person.middle_name,courses.course_name "
        SQLEX += " FROM students_subjects"
        SQLEX += " INNER JOIN students"
        SQLEX += " ON (students_subjects.student_id = students.id)"
        SQLEX += " INNER JOIN person "
        SQLEX += " ON (students.person_id = person.person_id)"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (students_subjects.batch_id = batches.id)"
        SQLEX += " INNER JOIN courses "
        SQLEX += " ON (students.course_id= courses.id)"
        SQLEX += " WHERE subject_id='" & txtSubjectID.Text & "'"
        If txtBatchName.Text <> "" Then
            SQLEX += "AND students_subjects.batch_id ='" & txtBatchName.Tag & "'"
        End If
        If cmbsemester.Text <> "" Then
            SQLEX += "AND students.semester = '" & cmbsemester.Text & "'"
        End If

        SQLEX += " AND students.is_enrolled='1'"
        SQLEX += " ORDER BY last_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            txtNoStudents.Text = MeData.Rows.Count

            Me.tdbViewer.DataSource = MeData
            Me.tdbViewer.Rebind(True)

            Try
                With tdbViewer.Splits(0)
                    .DisplayColumns("stid").Visible = False

                    .DisplayColumns("last_name").DataColumn.Caption = "LAST NAME"
                    .DisplayColumns("last_name").Width = 200
                    .DisplayColumns("last_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("last_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    .DisplayColumns("first_name").DataColumn.Caption = "FIRST NAME"
                    .DisplayColumns("first_name").Width = 200
                    .DisplayColumns("first_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("first_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    .DisplayColumns("middle_name").DataColumn.Caption = "MIDDLE NAME"
                    .DisplayColumns("middle_name").Width = 200
                    .DisplayColumns("middle_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("middle_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                    'course_name
                    .DisplayColumns("course_name").DataColumn.Caption = "COURSE"
                    .DisplayColumns("course_name").Width = 200
                    .DisplayColumns("course_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                    .DisplayColumns("course_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near
                End With
            Catch ex As Exception

            End Try
        Else
            Me.tdbViewer.DataSource = Nothing
            txtNoStudents.Text = "0"
        End If
    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim studentID As String = ""

        Try
            studentID = tdbViewer.Columns.Item(0).Value
        Catch ex As Exception

        End Try

        If MessageBox.Show("Are you sure you want to DELETE ITEM?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

            Dim DELETESTR As String = "DELETE FROM students_subjects"
            DELETESTR += " WHERE student_id='" & studentID & "'"
            DELETESTR += " and subject_id='" & txtSubjectID.Text & "'"

            If clsDBConn.Execute(DELETESTR) Then
                MsgBox("ITEM HAS BEEN DELETED", MsgBoxStyle.Information)
                btnDelete.Visible = False
                displayStudentsList()
            End If
        End If

    End Sub

    Private Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        Me.Close()
    End Sub

    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click

        Cursor = Cursors.WaitCursor

        Dim SQLEX As String = "SELECT  students.std_number 'STUDENT NUMBER',person.last_name 'LAST NAME',person.first_name 'FIRST NAME',person.middle_name 'MIDDLE NAME',students.year_level 'YEAR LEVEL'"
        SQLEX += " FROM students_subjects"
        SQLEX += " INNER JOIN students"
        SQLEX += " ON (students_subjects.student_id = students.id)"
        SQLEX += " INNER JOIN person "
        SQLEX += " ON (students.person_id = person.person_id)"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (students_subjects.batch_id = batches.id)"
        SQLEX += " INNER JOIN courses "
        SQLEX += " ON (students.course_id= courses.id)"
        SQLEX += " WHERE subject_id='" & txtSubjectID.Text & "'"
        If txtBatchName.Text <> "" Then
            SQLEX += "AND students_subjects.batch_id ='" & txtBatchName.Tag & "'"
        End If
        If cmbsemester.Text <> "" Then
            SQLEX += "AND students.semester = '" & cmbsemester.Text & "'"
        End If
        SQLEX += " AND students.is_enrolled='1'"
        SQLEX += " ORDER BY last_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim TotalNoStudents As Integer = MeData.Rows.Count

        GridControl1.DataSource = MeData

        DesginGridView(GridView1)


        Dim report As New xtrStudentListperSubject

        report.txtSubject.Text = "SUBJECT : " & txtSubject.Text
        report.txtTotal.Text = "TOTAL OF " & TotalNoStudents

        report.txtCourse.Text = txtCoursename.Text
        If txtBatchName.Text = "" Then
            report.txtBatch.Visible = False
        Else
            report.txtBatch.Text = txtBatchName.Text
        End If
        report.txtBatch.Text = txtBatchName.Text
        report.PrintableComponentContainer1.PrintableComponent = GridControl1
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()
        report.ShowPreview


        Cursor = Cursors.Default
    End Sub

    Private Sub DesginGridView(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)

        For i As Integer = 0 To view.Columns.Count - 1
            Select Case i
                Case 0
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
                Case 1, 2, 3
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).Width = 150
                Case Else
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
            End Select
        Next

    End Sub

    Private Sub cmbsemester_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbsemester.SelectedIndexChanged
        displayStudentsList()
    End Sub
End Class