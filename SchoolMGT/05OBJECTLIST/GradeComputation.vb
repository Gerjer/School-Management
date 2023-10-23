Imports DevExpress.XtraGrid.Views.Base

Public Class GradeComputation

    Public Property gradeperiod_cnt As Integer
    Public Property ColHeader As DataTable
    Public Property dt_grade_period As DataTable

    Friend Function SingleCompute(id As String, row As Integer, dt_grade As DataTable) As Object
        Dim total_grades As Double = 0
        Dim average As Double = 0
        Dim equivalent As Double = 0
        For x As Integer = 0 To dt_grade.Rows.Count - 1

            If dt_grade(x)("id") < 98 Then

                Try
                    total_grades += If(IsDBNull(dt_grade(x)("GRADES")), 0, dt_grade(x)("GRADES").ToString)
                Catch ex As Exception
                    total_grades += 0
                End Try


            ElseIf dt_grade(x)("id") = 98 Then

                dt_grade(x)("GRADES") = total_grades / gradeperiod_cnt
                average = total_grades / gradeperiod_cnt

            ElseIf dt_grade(x)("id") = 99 Then

                average = Round_Up(average)
                dt_grade(x)("GRADES") = getEquivalent(average)

            End If
        Next

        Return dt_grade
    End Function

    Function Round_Up(ByVal num As Double) As Integer
        Dim result As Integer
        result = Math.Round(num)
        If result >= num Then
            Round_Up = result
        Else
            Round_Up = result + 1
        End If
    End Function

    Public Function getEquivalent(average As Double) As Object
        Dim value As Double = 0
        Try
            value = DataObject(String.Format("SELECT ratings FROM grading_system WHERE equivalent = '" & average & "'"))
        Catch ex As Exception
            value = 0
        End Try
        Return value
    End Function

    Private Function getTotalGrades(dt_grade As DataTable) As Double
        Dim value As Double = 0
        For Each row As DataRow In dt_grade.Rows
            If row("id") < 98 Or row("id") < 98 Or row("id") < 100 Then
                value += row("GRADES")
            End If
        Next
        Return value
    End Function

    Friend Function GetFinalRemarks(stdID As String, subjectID As String) As Object
        Dim value As String = DataObject(String.Format("SELECT IFNULL(finalremarks,'')  FROM	students_subjects WHERE  id = '" & subjectID & "'"))
        Return value
    End Function

    Friend Function getColumnHeader(dt_final_grade As DataTable) As DataTable

        Try
            Dim AlreadyInUse As Boolean = False
            Dim col_insert As Integer = 3 + gradeperiod_cnt
            Dim col As Integer = 0

            Dim dt As New DataTable

            For y As Integer = 0 To dt_final_grade.Columns.Count - 1

                If col = 4 And AlreadyInUse = False Then
                    For Each row As DataRow In ColHeader.Rows
                        dt.Columns.Add(row("id"))
                        '              col += 1
                    Next
                    AlreadyInUse = True
                Else
                    dt.Columns.Add(dt_final_grade.Columns(col).ToString)
                    col += 1
                    End If


            Next

            dt.Columns.Add("INCLUDE")
            Return dt
        Catch ex As Exception

        End Try



    End Function

    Friend Sub getGradingPeriod(student_category_id As Integer)
        Dim sql As String = ""
        sql = "SELECT id FROM `student_grading_period` WHERE student_category_id = '" & student_category_id & "'"
        dt_grade_period = DataSource(sql)
    End Sub

    Friend Sub getCountCategory(catID As String)

        gradeperiod_cnt = DataObject(String.Format("SELECT 	count(student_grading_period.id) FROM 	student_grading_period WHERE 	student_grading_period.student_category_id = '" & catID & "' AND is_deleted = 0 "))

        ColHeader = DataSource(String.Format("SELECT id,
                                       -- CONCAT(student_grading_period.`name` ,' (',student_grading_period.weight_percentage,'%)')  'ColumnName'
                                           student_grading_period.`name` 'ColumnName'
                                            FROM
                                            student_grading_period
                                            WHERE
                                            student_grading_period.student_category_id = '" & catID & "' AND is_deleted = 0
                                            ORDER BY student_grading_period.id"))

    End Sub

    Friend Function IfExist(stdSubjID As String, GradePeriodID As String) As Boolean
        Dim result As Integer = DataObject(String.Format("SELECT students_grading_id FROM `student_grade` WHERE students_subject_id = '" & stdSubjID & "' and students_grading_id = '" & GradePeriodID & "'"))
        If result > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Friend Function Percentage(columnName As String) As Double

        Dim sql As String = ""
        sql = "SELECT weight_percentage / 100 FROM student_grading_period WHERE `name` = '" & columnName & "'"
        Return DataObject(sql)

    End Function
End Class
