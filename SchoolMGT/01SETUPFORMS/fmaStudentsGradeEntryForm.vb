Imports System.Threading
Imports System.ComponentModel
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.BandedGrid

Public Class fmaStudentsGradeEntryForm

    Dim grade_comp As New GradeComputation
    Private GRADES As DataTable
    Dim MultiEntryGrade As New List(Of GradingPeriod)
    Dim TotalGrades As Double = 0

    Private Sub fmaStudentsGradeEntryForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        XtraTabPage2.PageVisible = False
        TabItem14.Visible = False

        TotalGrades = 0
        displayGrading()
        displayGrades()
        displayFinalGrade()
    End Sub

    Private Sub displayGrades()

        GRADES = New DataTable
        GRADES.Rows.Clear()
        Dim MeData As New DataTable

        Dim SQLEX As String = "SELECT students_grading_id,students_subject_id,"
        SQLEX += " student_grading_period.name 'gradingname', grades,remarks,student_grading_period.weight_percentage FROM student_grade"
        SQLEX += " INNER JOIN student_grading_period"
        SQLEX += " ON student_grading_period.id = student_grade.students_grading_id"
        'SQLEX += " LEFT JOIN students_subjects"
        'SQLEX += " ON students_subjects.subject_id = student_grade.students_subject_id"

        SQLEX += " WHERE student_grade.students_subject_id='" & txtStudentSubjectID.Text & "' AND student_grading_period.is_deleted = 0 "

        MeData = clsDBConn.ExecQuery(SQLEX)
        GRADES = MeData
        PopulateMutipleEntry(GRADES)


        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("students_grading_id").Visible = False
                .DisplayColumns("students_subject_id").Visible = False

                .DisplayColumns("gradingname").DataColumn.Caption = "GRADING PERIOD"
                .DisplayColumns("gradingname").Width = 150
                .DisplayColumns("gradingname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("gradingname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("grades").DataColumn.Caption = "GRADES"
                .DisplayColumns("grades").Width = 150
                .DisplayColumns("grades").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("grades").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("remarks").DataColumn.Caption = "REMARKS"
                .DisplayColumns("remarks").Width = 150
                .DisplayColumns("remarks").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("remarks").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("weight_percentage").DataColumn.Caption = "GRADE WEIGHT%"
                .DisplayColumns("weight_percentage").Width = 100
                .DisplayColumns("weight_percentage").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("weight_percentage").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

            End With

        Catch ex As Exception

        End Try

        'NEW DISPLAY

        GridControl1.DataSource = MeData

        computeAverage()
    End Sub



    Private Sub PopulateMutipleEntry(gRADES As DataTable)

        Dim average As Double = 0
        Dim equivalent As Double = 0

        For x As Integer = 0 To gRADES.Rows.Count - 1

            Dim rowValue = gvMultipleEntryGrade.GetRowCellDisplayText(x, "id")

            gvMultipleEntryGrade.SetRowCellValue(x, "GRADES", gRADES(x)("grades"))
            average += IIf(gRADES(x)("grades") = "", 0, gRADES(x)("grades"))

        Next

        For row As Integer = gRADES.Rows.Count To gvMultipleEntryGrade.RowCount - 1

            If gvMultipleEntryGrade.GetRowCellDisplayText(row, "id") = 98 Then

                average = average / grade_comp.gradeperiod_cnt
                gvMultipleEntryGrade.SetRowCellValue(row, "GRADES", average)

            ElseIf gvMultipleEntryGrade.GetRowCellDisplayText(row, "id") = 99 Then

                average = grade_comp.Round_Up(average)
                equivalent = grade_comp.getEquivalent(average)
                gvMultipleEntryGrade.SetRowCellValue(row, "GRADES", equivalent)

            Else

                Dim final_remarks = grade_comp.GetFinalRemarks(txtStudentID.Text, txtStudentSubjectID.Text)
                gvMultipleEntryGrade.SetRowCellValue(row, "GRADES", final_remarks)

            End If
        Next

    End Sub

    Private Sub displayGrading()
        Dim category As String = ""
        Dim categorySQL As String = "SELECT courses.category_id"
        categorySQL += " FROM students"
        categorySQL += " INNER JOIN batches "
        categorySQL += " ON (students.batch_id = batches.id)"
        categorySQL += " INNER JOIN courses "
        categorySQL += " ON (batches.course_id = courses.id)"
        categorySQL += " WHERE students.id='" & txtStudentID.Text & "'"


        Dim catData As DataTable
        catData = clsDBConn.ExecQuery(categorySQL)

        If catData.Rows.Count > 0 Then
            category = catData.Rows(0).Item("category_id").ToString
            creatMultipleEntryDT(category)
        End If


        Dim SQLEX As String = "SELECT id, name, weight_percentage  FROM student_grading_period"
        SQLEX += " WHERE is_deleted <> 1"
        SQLEX += " AND student_category_id='" & category & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)
        grade_comp.gradeperiod_cnt = MeData.Rows.Count

        cmbCategory.DataSource = MeData

        cmbCategory.ValueMember = "id"
        cmbCategory.DisplayMember = "name"

        cmbCategory.SelectedIndex = -1
        txtGradePerioID.Text = ""



    End Sub

    Private Sub creatMultipleEntryDT(category As String)

#Region "old"
        'dt = DataSource(String.Format("SELECT
        '        student_grading_period.id,
        '        student_grading_period.`name` AS CATEGORY,
        '        '' AS 'GRADE',
        '        '' AS 'REMARKS',
        '        '' AS 'FINAL GRADE'
        '        FROM
        '        student_grading_period
        '        WHERE
        '        student_grading_period.student_category_id = " & category & "
        '        "))
#End Region
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                        id,
                        `CATEGORY`,
                        '0' AS 'GRADES'
                        FROM(
                        SELECT
		                        student_grading_period.id,
		                        student_grading_period.`name` AS CATEGORY
		                        FROM
		                        student_grading_period
		                        WHERE
		                        student_grading_period.student_category_id = '" & category & "' AND is_deleted = 0
		
		                        UNION
		
		                        SELECT 98 AS 'id',
		                               'AVERAGE' AS 'CATERGORY'
					 
		                        UNION
		
		                        SELECT 99 AS 'id',
		                               'EQUEVALENT' AS 'CATERGORY' 
					 
		                        UNION
		
		                        SELECT 100 AS 'id',
		                               'REMARKS' AS 'CATERGORY' 		 
					 
		                         )A
                                        "))

        If dt.Rows.Count > 0 Then
            gcMultipleEntryGrade.DataSource = dt
            gvMultipleEntryGrade.BestFitColumns()
            gvMultipleEntryGrade.Columns("CATEGORY").OptionsColumn.AllowEdit = False
            gvMultipleEntryGrade.Columns("GRADES").OptionsColumn.AllowEdit = True
            '  gvMultipleEntryGrade.OptionsBehavior.Editable = True
            gvMultipleEntryGrade.Columns("id").Visible = False
        End If

    End Sub

    Private Sub cmbCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCategory.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
            Me.txtGradePerioID.Text = drv.Item("id").ToString
            txtGrade.Focus()
        Catch ex As Exception
            Me.txtGradePerioID.Text = ""
        End Try
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click

        If MultipleEntryGrading() = False Then

            If txtGradePerioID.Text.Length = 0 Then
                MsgBox("Please select grading period.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If txtGrade.Text.Length = 0 Then
                MsgBox("Please Enter Grade.", MsgBoxStyle.Critical)
                Exit Sub
            End If

        End If

        saveGrades()
    End Sub

    Dim dt_MultipleEntryGrade As New DataTable
    Private Function MultipleEntryGrading() As Boolean
        Dim grade As String = ""
        Dim row As Integer = 0

        Dim dt As DataTable = gcMultipleEntryGrade.DataSource
        For Each rows As DataRow In dt.Rows
            '      grade += rows.Item("GRADES").ToString
            If rows.Item("CATEGORY").ToString = "AVERAGE" Then
                grade = rows.Item("GRADES").ToString
            End If
        Next

        dt_MultipleEntryGrade = dt

        If grade = "" Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Sub saveGrades()

        Dim SQLIN As String = ""

        If MultipleEntryGrading() = True Then



            For Each rows As DataRow In dt_MultipleEntryGrade.Rows

                SQLIN = "INSERT INTO student_grade(students_grading_id,students_subject_id,grades)"
                SQLIN += " VALUES("
                SQLIN += String.Format("'{0}', '{1}',", rows.Item("id").ToString, txtStudentSubjectID.Text)
                SQLIN += String.Format("'{0}'", rows.Item("GRADES").ToString)
                SQLIN += " )"

                '       clsDBConn.Execute(SQLIN)
                If rows("id") < 98 Then
                    DataSource(String.Format(SQLIN))
                End If

            Next

            'For Each rows As DataRow In dt_MultipleEntryGrade.Rows

            '    SQLIN = "INSERT INTO student_grade(students_grading_id,students_subject_id,grades,remarks)"
            '    SQLIN += " VALUES("
            '    SQLIN += String.Format("'{0}', '{1}',", rows.Item("id").ToString, txtStudentSubjectID.Text)
            '    SQLIN += String.Format("'{0}', '{1}'", rows.Item("GRADE").ToString, rows.Item("REMARKS").ToString)
            '    SQLIN += " )"

            '    clsDBConn.Execute(SQLIN)

            'Next




            MsgBox("Grades has been added.")
            displayGrades()
            clearFields()

        Else

            SQLIN = "INSERT INTO student_grade(students_grading_id,students_subject_id,grades,remarks)"
            SQLIN += " VALUES("
            SQLIN += String.Format("'{0}', '{1}',", txtGradePerioID.Text, txtStudentSubjectID.Text)
            SQLIN += String.Format("'{0}', '{1}'", txtGrade.Text, txtRemarks.Text)
            SQLIN += " )"

            If clsDBConn.Execute(SQLIN) Then
                MsgBox("Grades has been added.")
                displayGrades()
                clearFields()
            End If
        End If



    End Sub

    Private Sub clearFields()
        txtRemarks.Text = ""
        cmbCategory.SelectedIndex = -1
        cmbCategory.Text = ""
        txtGradePerioID.Text = ""
        txtGrade.Text = ""
        btnEdit.Visible = False
        btnEditGrades.Visible = False
    End Sub



    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp

        If tdbViewer.RowCount > 0 Then


            Try
                If e.Button = Windows.Forms.MouseButtons.Left Then
                    Dim students_grading_id As String = tdbViewer.Columns.Item("students_grading_id").Value
                    Dim students_subject_id As String = tdbViewer.Columns.Item("students_subject_id").Value

                    Dim grades As String = tdbViewer.Columns.Item("grades").Value
                    Dim remarks As String = If(IsDBNull(tdbViewer.Columns.Item("remarks").Value), "", tdbViewer.Columns.Item("remarks").Value)


                    cmbCategory.SelectedValue = CInt(students_grading_id)
                    txtGrade.Text = grades
                    txtRemarks.Text = remarks
                    btnEdit.Visible = True
                    btnEditGrades.Visible = True

                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

        End If
    End Sub

    Private Sub txtGradePerioID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtGradePerioID.TextChanged
        If txtGradePerioID.Text.Length > 0 Then
            txtGrade.Text = ""
            txtRemarks.Text = ""
            btnEdit.Visible = False
        End If
    End Sub

    Dim Modify As Boolean = False
    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click


        If XtraTabControl1.SelectedTabPageIndex = 0 Then
            Dim SQLUP As String = "UPDATE student_grade SET"
            SQLUP += String.Format(" grades='{0}', remarks='{1}'", txtGrade.Text, txtRemarks.Text)

            SQLUP += String.Format(" WHERE students_grading_id='{0}' AND  students_subject_id='{1}'", txtGradePerioID.Text, txtStudentSubjectID.Text)

            '     If clsDBConn.Execute(SQLUP) Then
            DataSource(SQLUP)
            MsgBox("Grade has been modified.")

            Modify = True

            displayGrades()
            clearFields()
            '     End If

        Else

            For row As Integer = 0 To gvMultipleEntryGrade.RowCount - 1

                Dim id = gvMultipleEntryGrade.GetRowCellDisplayText(row, "id")
                Dim grade = gvMultipleEntryGrade.GetRowCellDisplayText(row, "GRADES")

                If id < 98 Then

                    Dim SQLUP As String = "UPDATE student_grade SET"
                    SQLUP += String.Format(" grades='{0}'", grade)
                    SQLUP += String.Format(" WHERE students_grading_id='{0}' AND  students_subject_id='{1}'", id, txtStudentSubjectID.Text)

                    DataSource(SQLUP)
                End If
            Next

            MsgBox("Grade has been modified.")
            displayGrades()
            clearFields()

        End If


    End Sub

    Private Sub computeAverage()
        Dim total As Double = 0
        Dim equivalent As Decimal = 0
        Dim reexam As Decimal = 0
        Dim submit As String = ""

        For nCtr As Integer = 0 To GRADES.Rows.Count - 1
            Dim gradeStr As String = GRADES.Rows(nCtr).Item(3).ToString
            Dim weight As String = GRADES.Rows(nCtr).Item(5).ToString

            Try
                total += CDbl(gradeStr) * (weight / 100)
            Catch ex As Exception

            End Try

        Next


        txtFinalGrades.Text = IIf(total = 0, "", Format(total, "###"))

        If total > 0 Then

            total = Round_Up(total)

            Dim result = getEquivalent(total)
                If result <> Nothing Then
                    equivalent = result
                Else
                    equivalent = 5.0
                End If
            End If

            txtEquivalent.Text = IIf(equivalent = 0, "", equivalent)
        If reexam > 0 Then
            txtGradeReExam.Text = reexam
            txtGradeReExam.Visible = True
        Else
            txtGradeReExam.Visible = False
        End If

        If Modify Then

            UpdateFinalGrade(txtStudentSubjectID.Text, txtFinalGrades.Text, txtEquivalent.Text)

        End If

        Dim FinalGrade As DataTable = getFinalGrade(txtStudentSubjectID.Text)
        If FinalGrade.Rows.Count > 0 Then
            If FinalGrade(0)("submit").ToString <> "" Then
                btnSubmit.Enabled = False
            Else
                btnSubmit.Enabled = True
            End If
        Else
            btnSubmit.Enabled = True
        End If


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


    Private Sub UpdateFinalGrade(stdSubjectID As String, FinalGrade As String, Equivalent As String)

        Dim FinalRemarks As String = ""
        If Equivalent = "5.0" Then
            FinalRemarks = "FILLED"
        Else
            FinalRemarks = "PASSED"
        End If

        Dim sql As String = ""
        sql = "UPDATE students_subjects SET finalgrade = " & FinalGrade & ",equivalent = " & Equivalent & ",finalremarks = '" & FinalRemarks & "' WHERE id = " & stdSubjectID & " "
        DataSource(sql)
        Modify = False
    End Sub

    Private Function getEquivalent(total As Double) As Decimal
        Dim sql As String = ""
        sql = "SELECT
	grading_system.ratings
FROM
	grading_system
WHERE
	grading_system.equivalent = " & total & ""
        Return DataObject(sql)
    End Function

    Private Function getFinalGrade(stdSubjectID As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	students_subjects.id, 
	students_subjects.student_id, 
	IFNULL(students_subjects.finalgrade,'')'finalgrade', 
	IFNULL(students_subjects.equivalent,'')'equivalent', 
	students_subjects.finalremarks, 
	iFNULL(students_subjects.submit,'')'submit', 
	IFNULL(students_subjects.re_exam,'')'re_exam'
FROM
	students_subjects
WHERE
	students_subjects.id = '" & stdSubjectID & "'"
        Return DataSource(sql)
    End Function

    Private Sub ButtonX1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSetfinal.Click
        If MessageBox.Show("Are you sure you want to SET FINAL GRADE?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

            GRADES = gcMultipleEntryGrade.DataSource
            Dim row As Integer = GRADES.Rows.Count - 1
            Dim finalRemarks = GRADES(row)("GRADES").ToString
            Dim finalGrade = GRADES(row - 2)("GRADES").ToString

            Dim SQLUP As String = "UPDATE students_subjects SET finalgrade='" & finalGrade & "', finalremarks = '" & finalRemarks & "'"
            SQLUP += "  WHERE id=" & txtStudentSubjectID.Text & ""

            DataSource(String.Format(SQLUP))
            MsgBox("Final Grade has been Set on this subject.", MsgBoxStyle.Information)

        End If
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.Close()
    End Sub

    Private Sub displayFinalGrade()
        Dim SQLEX As String = "SELECT finalgrade FROM students_subjects WHERE id='" & txtStudentSubjectID.Text & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            Try
                txtGivenFinalGrades.Text = MeData.Rows(0).Item("finalgrade").ToString
            Catch ex As Exception
                txtGivenFinalGrades.Text = "None"
            End Try
        End If
    End Sub

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub

    Private Sub ButtonX2_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub ButtonX2_Click_1(sender As Object, e As EventArgs) Handles ButtonX2.Click

        If txtStudentSubjectID.Text.Length > 0 Then
            'Update Student Subject
            DataSource(String.Format("UPDATE `students_subjects` SET  `re_exam` = '" & txtGradeReExam.Text & "' WHERE `id` = '" & txtStudentSubjectID.Text & "';"))
            MsgBox("Re-Exam has been Added")
        End If

    End Sub

    Dim rowSelelected As Integer


    Private Sub gcMultipleEntryGrade_EditorKeyPress(sender As Object, e As KeyPressEventArgs) Handles gcMultipleEntryGrade.EditorKeyPress

        Try
            Dim view As GridView = gcMultipleEntryGrade.MainView
            Dim row As Integer = view.FocusedRowHandle
            Dim id = view.GetFocusedRowCellValue("id").ToString

            If id < 100 Or id < 99 Or id < 98 Then

                If Asc(e.KeyChar) = 8 Then
                    If Asc(e.KeyChar) < 48 Or Asc(e.KeyChar) > 57 Or (e.KeyChar = "." And InStr(e.KeyChar, ".")) Then
                        e.Handled = True
                    End If
                End If

            End If

        Catch ex As Exception

        End Try

    End Sub

    Private Sub gvMultipleEntryGrade_KeyUp(sender As Object, e As KeyEventArgs) Handles gvMultipleEntryGrade.KeyUp
        Dim view As GridView = gcMultipleEntryGrade.MainView
        Dim row As Integer = view.FocusedRowHandle
        Dim id = view.GetFocusedRowCellValue("id").ToString

        If e.KeyCode = Keys.Enter Then

            Dim dt_grade As DataTable = gcMultipleEntryGrade.DataSource
            gcMultipleEntryGrade.DataSource = grade_comp.SingleCompute(id, row, dt_grade)
            view.MoveNext()

        End If
    End Sub

    Private Sub gvMultipleEntryGrade_CalcRowHeight(sender As Object, e As RowHeightEventArgs) Handles gvMultipleEntryGrade.CalcRowHeight
        Dim view As GridView = sender
        If view Is Nothing Then
            Return
        End If
        If e.RowHandle >= 0 Then
            e.RowHeight = 25
        End If
    End Sub

    Private Sub ButtonX3_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        If txtStudentSubjectID.Text <> "" Then
            DataSource(String.Format("UPDATE students_subjects SET submit = 1 WHERE id = " & txtStudentSubjectID.Text & ""))
            MsgBox("FINAL GRADE HAS BEEN SUBMITTED...")
        End If

    End Sub

    Private Sub btnApplyGrades_Click(sender As Object, e As EventArgs) Handles btnApplyGrades.Click

        If txtGradePerioID.Text.Length = 0 Then
                MsgBox("Please select grading period.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If txtGrade.Text.Length = 0 Then
                MsgBox("Please Enter Grade.", MsgBoxStyle.Critical)
                Exit Sub
            End If
        saveGrades()
    End Sub

    Private Sub btnEditGrades_Click(sender As Object, e As EventArgs) Handles btnEditGrades.Click
        Dim SQLUP As String = "UPDATE student_grade SET"
        SQLUP += String.Format(" grades='{0}', remarks='{1}'", txtGrade.Text, txtRemarks.Text)

        SQLUP += String.Format(" WHERE students_grading_id='{0}' AND  students_subject_id='{1}'", txtGradePerioID.Text, txtStudentSubjectID.Text)

        '     If clsDBConn.Execute(SQLUP) Then
        DataSource(SQLUP)
        MsgBox("Grade has been modified.")

        Modify = True

        displayGrades()
        clearFields()
    End Sub
End Class