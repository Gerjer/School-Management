Public Class fmaEmp_AttendanceInquiryForm

    Private Sub fmaEmp_AttendanceInquiryForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim redateFrom As New Date(Date.Now.Year, Date.Now.Month, 1)
        Dim lastDay As DateTime = New DateTime(redateFrom.Year, redateFrom.Month, 1).AddMonths(1).AddDays(-1)

        dateFrom.Value = redateFrom
        dateTo.Value = lastDay


    End Sub

    Private Sub RefreshWin()
        '   Dim exec As String

    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub btnRefresh_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        Call Me.RefreshWin()
    End Sub






    Private Sub btnPrintAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPrintAll.Click
        Me.Cursor = Cursors.WaitCursor

        Dim printDateFrom As String = Format(dateFrom.Value, "yyyy-MM-dd")
        Dim printDateTo As String = Format(dateTo.Value, "yyyy-MM-dd")


        Dim redateFrom As New Date(dateFrom.Value.Year, dateFrom.Value.Month, 1)
        Dim lastDay As DateTime = New DateTime(dateFrom.Value.Year, dateFrom.Value.Month, 1).AddMonths(1).AddDays(-1)

        DTR_DateRange = DataSource(String.Format("Select datefield from djemfcst_hris.hr_dtr_calendar WHERE datefield BETWEEN '" & Format(redateFrom, "yyyy-MM-dd") & "' and '" & Format(lastDay, "yyyy-MM-dd") & "'"))

        Dim SQL As String = "truncate table djemfcst_hris.hr_dtr_calendar"
        clsDBConn.Execute(SQL)

        SQL = "call djemfcst_hris.hr_fill_dtr_calendar('" & Format(redateFrom, "yyyy-MM-dd") & "','" & Format(lastDay, "yyyy-MM-dd") & "')"
        clsDBConn.Execute(SQL)

        SQL = "TRUNCATE TABLE djemfcst_hris.hr_emp_monthly_dtr"
        clsDBConn.Execute(SQL)


        Dim EmployeeLists As String = "SELECT  `hr_emp_attendance`.`employee_number`, `employees`.`Name_Empl`"
        EmployeeLists += " , `hr_emp_attendance`.`dtr_date`"
        EmployeeLists += " , `hr_emp_attendance`.`in_pm`"
        EmployeeLists += " , `hr_emp_attendance`.`out_pm`"
        EmployeeLists += " , `hr_emp_attendance`.`late`"
        EmployeeLists += " , `hr_emp_attendance`.`total_hours_worked`"
        EmployeeLists += " FROM `djemfcst_hris`.`hr_emp_attendance`"
        EmployeeLists += " INNER JOIN `djemfcst_hris`.`employees` "
        EmployeeLists += " ON (`hr_emp_attendance`.`employee_number` = `employees`.`UserID_Empl`)"
        EmployeeLists += " WHERE dtr_date BETWEEN '" & printDateFrom & "' AND  '" & printDateTo & "'"

        '" & Format(lastDay, "yyyy-MM-dd") & "'        --

        'Dim empListsDtable As DataTable

        'empListsDtable = clsDBConn.ExecQuery(EmployeeLists)
        Try
            Dim NewReport As New fzzReportViewerForm
            NewReport.AttachReport(EmployeeLists, "Print ALL EMPLOYEE DTR") = New hr_RPT_PrintDTR_ALL(printDateFrom, printDateTo) '

            NewReport.exportPDF()
            '   NewReport.Show()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try




        Me.Cursor = Cursors.Default
    End Sub


    Private Sub AccessPrevDTR()

        Me.Cursor = Cursors.WaitCursor

        Dim redateFrom As New Date(dateFrom.Value.Year, dateFrom.Value.Month, dateFrom.Value.Day)
        Dim lastDay As DateTime = dateTo.Value
        Dim SQL As String = "call hr_reset_dtr_calendar()"
        clsDBConn.Execute(SQL)

        SQL = "call hr_fill_dtr_calendar('" & Format(redateFrom, "yyyy-MM-dd") & "','" & Format(lastDay, "yyyy-MM-dd") & "')"
        clsDBConn.Execute(SQL)

        SQL = "TRUNCATE TABLE hr_emp_monthly_dtr"
        clsDBConn.Execute(SQL)








        Me.Cursor = Cursors.Default
    End Sub



End Class
