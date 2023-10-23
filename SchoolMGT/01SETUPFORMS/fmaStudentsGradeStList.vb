Imports System.Threading
Imports System.ComponentModel

Public Class fmaStudentsGradeStList

    

    Private Sub fmaStudentsGradeStList_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        displayStudents()

    End Sub

    Private Sub displayStudents()
        tdbViewer.DataSource = Nothing
        Dim MeData As DataTable

        'Dim SQL As String = "SELECT student_id, students_subjects.id 'stid', CONCAT(person.last_name, ', ' , ' ', person.first_name, "
        'SQL += " '   ', person.middle_name) 'studentname', batches.name 'batchname'"
        'SQL += " FROM students_subjects"
        'Sql += " INNER JOIN students"
        'SQL += " ON students.id = students_subjects.student_id"
        'SQL += " INNER JOIN batches"
        'SQL += " ON batches.id = students.batch_id"
        'SQL += " INNER JOIN person"
        'SQL += " ON students.person_id = person.person_id"
        'SQL += " WHERE subject_class_schedule_id='" & txtSubjectID.Text & "'"
        'SQL += " AND students.is_enrolled='1'"
        'Sql += " ORDER BY studentname "

        Dim SQL As String = "SELECT
                            students_subjects.student_id,
                            students_subjects.subject_id 'stid',
                            person.display_name 'studentname',
                            batches.`name` 'batchname'

                            FROM
                            subject_class_schedule
                            INNER JOIN subjects ON subject_class_schedule.subject_id = subjects.id 
                            INNER JOIN students_subjects ON subjects.id = students_subjects.subject_id
                            INNER JOIN batches ON students_subjects.batch_id = batches.id
                            INNER JOIN courses ON batches.course_id = courses.id
                            INNER JOIN students ON students_subjects.student_id = students.id
                            INNER JOIN person ON students.person_id = person.person_id 

                            WHERE
                            subject_class_schedule.SysPK_Item = '" & txtSubjectID.Text & "'   AND students.is_enrolled = '1' 

                            ORDER BY `studentname`"



        MeData = clsDBConn.ExecQuery(SQL)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("student_id").Visible = False
                .DisplayColumns("stid").Visible = False
                '.DisplayColumns("id").Visible = False


                .DisplayColumns("studentname").DataColumn.Caption = "STUDENT"
                .DisplayColumns("studentname").Width = 400
                .DisplayColumns("studentname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("studentname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                'batchname
                .DisplayColumns("batchname").DataColumn.Caption = "BATCH"
                '.DisplayColumns("batchname").Style.Font
                .DisplayColumns("batchname").Width = 200
                .DisplayColumns("batchname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("batchname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near
            End With
        Catch ex As Exception
        End Try
    End Sub

    Private Sub tdbViewer_MouseDoubleClick(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseDoubleClick
        Dim studetnName As String = tdbViewer.Columns.Item("studentname").Value
        Dim studentID As String = tdbViewer.Columns.Item("student_id").Value
        Dim student_subject_id As String = tdbViewer.Columns.Item("stid").Value

        'MsgBox(student_subject_id & ": " & studetnName)
        With fmaStudentsGradeEntryForm
            .Text = txtSubject.Text
            .txtStudentname.Text = studetnName
            .txtStudentID.Text = studentID
            .txtStudentSubjectID.Text = student_subject_id
        End With
        fmaStudentsGradeEntryForm.ShowDialog(Me)
    End Sub


    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub


End Class