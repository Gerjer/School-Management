Imports DataDynamics.ActiveReports 
Imports DataDynamics.ActiveReports.Document 

Public Class hr_RPT_PrintDTR_ALL

    Private vDateFrom As String
    Private vDateTo As String

    Sub New()
        InitializeComponent()
    End Sub

    Sub New(ByVal lDateFrom As String, ByVal lDateTo As String)
        InitializeComponent()

        Me.vDateFrom = lDateFrom
        Me.vDateTo = lDateTo


    End Sub


    Private Sub GroupHeader1_Format(ByVal sender As Object, ByVal e As System.EventArgs) Handles GroupHeader1.Format

        Dim SQL As String = ""
        Dim SQLCAL As String = "Select datefield from djemfcst_hris.hr_dtr_calendar"
        SQLCAL += " WHERE datefield BETWEEN '" & vDateFrom & "' AND '" & vDateTo & "'" 'vDateTo

        Dim tblCalendar As DataTable
        tblCalendar = clsDBConn.ExecQuery(SQLCAL)


        Dim objHash As New Hashtable()

        For nCalDays As Short = 0 To tblCalendar.Rows.Count - 1
            Dim Days As String = Format(tblCalendar.Rows(nCalDays).Item("datefield"), "yyyy-MM-dd")
            Dim empDtr As New DTRDictionary(Me.txtEmpNum.Text, Days)
            objHash.Add(Days, empDtr)
        Next



        If Me.txtEmpNum.Text = "-" Then
            MsgBox("Hi")
        End If


        Dim row As Integer = 0
        For Each objEntry In objHash
            Dim phDtr As DTRDictionary = objEntry.Value
            Dim phKey As String = objEntry.Key

            '      Dim range_day As String = Format(DTR_DateRange.Rows(row).Item("datefield"), "yyyy-MM-dd")

            Dim dtr_day As String = phDtr.vDay

            Dim in_am As String = ""
            Dim out_am As String = ""
            Dim in_pm As String = ""
            Dim out_pm As String = ""
            Dim late As String = ""
            Dim undertime As String = ""
            Dim hours_work As String = ""
            Dim dtr_remarks As String = ""


            '      If range_day = dtr_day Then
            in_am = phDtr.vAM_IN
                out_am = phDtr.vAM_OUT
                in_pm = phDtr.vPM_IN
                out_pm = phDtr.vPM_OUT
                late = phDtr.vLATE
                undertime = phDtr.vUNDERTIME
                hours_work = phDtr.vHOURSWORK
                dtr_remarks = phDtr.vREMARKS
            '       End If


            SQL = "INSERT INTO djemfcst_hris.hr_emp_monthly_dtr(emp_number, dtr_month_date,dtr_day, in_am,out_am,"
            SQL += "in_pm,out_pm,late,undertime,hours_work,dtr_remarks)"
            SQL += String.Format("VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}')",
                                 Me.txtEmpNum.Text, txtdtrDate.Text, dtr_day, in_am, out_am, in_pm, out_pm, late, undertime, hours_work, dtr_remarks)


            clsDBConn.Execute(SQL)
            row += 1
        Next
        objHash.Clear()


        Dim MeData As New DataTable

        Dim EMPNum As Integer = CInt(Me.txtEmpNum.Text)

        Try
            SQL = "SELECT DAYOFMONTH(dtr_day) 'day',DAYNAME(dtr_day)'dname', in_am, out_am, in_pm, out_pm, late, undertime, "
            SQL += "hours_work, dtr_remarks FROM djemfcst_hris.hr_emp_monthly_dtr WHERE emp_number='" & Me.txtEmpNum.Text & "'"
            SQL += " AND dtr_month_date='" & Me.txtdtrDate.Text & "'"
            SQL += "ORDER by dtr_day ASC"
            MeData = clsDBConn.ExecQuery(SQL)
            SubReport1.Report = New hr_subRPT_EmpDTR
            SubReport1.Report.DataSource = MeData
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        SQL = "SELECT SUM(late) 'totallate' FROM djemfcst_hris.hr_emp_monthly_dtr WHERE emp_number="
        SQL += "'" & Me.txtEmpNum.Text & "'"
        SQL += " AND late > 0"

        MeData = clsDBConn.ExecQuery(SQL)
        If MeData.Rows.Count > 0 Then
            Try
                Dim lateA As Double = MeData.Rows(0).Item("totallate")
                Me.txtLateA.Text = Format(lateA, "0.00")
            Catch ex As Exception

            End Try
        End If

        SQL = "SELECT SUM(undertime) 'totalUT' FROM djemfcst_hris.hr_emp_monthly_dtr WHERE emp_number="
        SQL += "'" & Me.txtEmpNum.Text & "'"

        MeData = clsDBConn.ExecQuery(SQL)
        If MeData.Rows.Count > 0 Then
            Try
                Dim lateA As Double = MeData.Rows(0).Item("totalUT")
                Me.txtUTA.Text = Format(lateA, "0.00")
            Catch ex As Exception

            End Try
        End If






        fillBlankDTR(Me.txtEmpNum.Text, Me.txtdtrDate.Text)
    End Sub

    Private Sub fillBlankDTR(ByVal empCode_1 As String, ByVal dtrDate As String)
        Dim tblCalendar As DataTable
        Dim SQLCAL As String = "Select datefield from djemfcst_hris.hr_dtr_calendar"
        SQLCAL += " WHERE datefield NOT BETWEEN '" & vDateFrom & "' AND '" & vDateTo & "'"

        tblCalendar = clsDBConn.ExecQuery(SQLCAL)


        Dim objHash As New Hashtable()

        For nCalDays As Short = 0 To tblCalendar.Rows.Count - 1

            Try
                Dim Days As String = Format(tblCalendar.Rows(nCalDays).Item("datefield"), "yyyy-MM-dd")

                Dim Exist As Integer = DataObject(String.Format("SELECT
	                                                        djemfcst_hris.hr_emp_monthly_dtr.emp_number
                                                        FROM
	                                                        djemfcst_hris.hr_emp_monthly_dtr
                                                        WHERE
	                                                        djemfcst_hris.hr_emp_monthly_dtr.emp_number = '" & empCode_1 & "' AND
	                                                        djemfcst_hris.hr_emp_monthly_dtr.dtr_day = '" & Days & "'"))

                If Exist > 0 Then
                    Dim SQL As String = ""
                    SQL = "INSERT INTO hr_emp_monthly_dtr(emp_number, dtr_month_date,dtr_day,dtr_remarks)"
                    SQL += String.Format("VALUES('{0}','{1}','{2}','{3}')", empCode_1, dtrDate, Days, "NG")
                    clsDBConn.Execute(SQL)
                End If


            Catch ex As Exception

            End Try




        Next
    End Sub





    Public Class DTRDictionary
        Private dtrDay As String = ""
        Private in_am As String = ""
        Private out_am As String = ""
        Private in_pm As String = ""
        Private out_pm As String = ""
        Private late As Integer = 0
        Private undertime As Integer = 0
        Private total_hours_worked As Integer = 0
        Private OBNotes As String = ""
        Private dtrRemarks As String = ""

#Region "Setters"

        Public Property vDay() As String
            Get
                Return dtrDay
            End Get

            Set(ByVal value As String)
                dtrDay = value
            End Set
        End Property

        Public Property vAM_IN() As String
            Get
                Return in_am
            End Get
            Set(ByVal value As String)
                in_am = value
            End Set
        End Property

        Public Property vAM_OUT() As String
            Get
                Return out_am
            End Get
            Set(ByVal value As String)
                out_am = value
            End Set
        End Property

        Public Property vPM_IN() As String
            Get
                Return in_pm
            End Get
            Set(ByVal value As String)
                in_pm = value
            End Set
        End Property

        Public Property vPM_OUT() As String

            Get
                Return out_pm
            End Get
            Set(ByVal value As String)
                out_pm = value
            End Set
        End Property

        Public Property vLATE() As Integer
            Get
                Return late
            End Get

            Set(ByVal value As Integer)
                late = value
            End Set
        End Property

        Public Property vUNDERTIME() As Integer
            Get
                Return undertime
            End Get

            Set(ByVal value As Integer)
                undertime = value
            End Set
        End Property

        Public Property vHOURSWORK() As Integer
            Get
                Return total_hours_worked
            End Get

            Set(ByVal value As Integer)
                total_hours_worked = value
            End Set
        End Property

        'vREMARKS
        Public Property vREMARKS() As String

            Get
                Return dtrRemarks
            End Get
            Set(ByVal value As String)
                dtrRemarks = value
            End Set
        End Property

#End Region

        Sub New(ByVal empCode As String, ByVal dtrDate As String)
            Dim SQL As String = "select SysPK_emp_attendance, DAYOFMONTH(dtr_date) 'day', in_am, out_am, in_pm, "
            SQL += "out_pm, late, undertime, total_hours_worked, note_am_in, note_am_out,note_pm_in"
            SQL += ",note_pm_out,OB_notes FROM djemfcst_hris.hr_emp_attendance "
            SQL += String.Format(" WHERE employee_number='{0}' and dtr_date='{1}'", empCode, dtrDate)

            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQL)
            Dim datarows As Integer = MeData.Rows.Count
            If datarows > 0 Then
                Try
                    Dim SysPK As String = MeData.Rows(0).Item("SysPK_emp_attendance").ToString

                    ' ATTENDANCE BEGIN
                    If SysPK.Length > 0 Then
                        Me.dtrDay = dtrDate
                        If MeData.Rows(0).Item("in_am").ToString.Length > 0 Then
                            Me.in_am = Format(MeData.Rows(0).Item("in_am"), "hh:mm")
                        End If

                        If MeData.Rows(0).Item("out_am").ToString.Length > 0 Then
                            Me.out_am = Format(MeData.Rows(0).Item("out_am"), "hh:mm")
                        End If

                        If MeData.Rows(0).Item("in_pm").ToString.Length > 0 Then
                            Me.in_pm = Format(MeData.Rows(0).Item("in_pm"), "hh:mm")
                        End If

                        If MeData.Rows(0).Item("out_pm").ToString.Length > 0 Then
                            Me.out_pm = Format(MeData.Rows(0).Item("out_pm"), "hh:mm")
                        End If

                        ' FIELD DUTY BEGIN
                        If MeData.Rows(0).Item("note_am_in").ToString.Length > 0 Then
                            Me.in_am = MeData.Rows(0).Item("note_am_in").ToString
                        End If

                        If MeData.Rows(0).Item("note_am_out").ToString.Length > 0 Then
                            Me.out_am = MeData.Rows(0).Item("note_am_out").ToString
                        End If

                        If MeData.Rows(0).Item("note_pm_in").ToString.Length > 0 Then
                            Me.in_pm = MeData.Rows(0).Item("note_pm_in").ToString
                        End If

                        If MeData.Rows(0).Item("note_pm_out").ToString.Length > 0 Then
                            Me.out_pm = MeData.Rows(0).Item("note_pm_out").ToString
                        End If
                        ' FIELD DUTY BEGIN


                        Me.late = MeData.Rows(0).Item("late").ToString
                        Me.undertime = MeData.Rows(0).Item("undertime").ToString
                        Me.total_hours_worked = MeData.Rows(0).Item("total_hours_worked").ToString
                        Me.OBNotes = MeData.Rows(0).Item("OB_notes").ToString


                        '' leaves BEGIN
                        'SQL = "SELECT `hr_emp_leaves`.`leave_date`, `hr_emp_leave_type`.`leave_type`, leave_length_days, start_time,leave_status"
                        'SQL += " FROM `djemfcst_hris.`.`hr_emp_leaves`"
                        'SQL += " LEFT JOIN `djemfcst_hris.`.`hr_emp_leave_type` "
                        'SQL += " ON (`hr_emp_leaves`.`leave_type_id` = `hr_emp_leave_type`.`leave_number`)"
                        'SQL += " WHERE employee_id='" & empCode & "'"
                        'SQL += " AND leave_date='" & dtrDate & "'"
                        'SQL += " AND leave_status >= 3 "

                        'MeData = Nothing
                        'MeData = New DataTable

                        'MeData = clsDBConn.ExecQuery(SQL)

                        'If MeData.Rows.Count > 0 Then
                        '    Try

                        '        Dim LEAVETYPE As String = MeData.Rows(0).Item("leave_type").ToString
                        '        Dim LEAVELEN As Double = MeData.Rows(0).Item("leave_length_days")

                        '        Dim LEAVESTAT As Short = MeData.Rows(0).Item("leave_status")

                        '        If LEAVESTAT >= 3 Then
                        '            'If LEAVETYPE.Contains("VACATION") Then
                        '            '    LEAVETYPE = "VL"
                        '            'ElseIf LEAVETYPE.Contains("SICK") Then
                        '            '    LEAVETYPE = "SL"
                        '            'ElseIf LEAVETYPE.Contains("SPECIAL") Then
                        '            '    LEAVETYPE = "SP"
                        '            'ElseIf LEAVETYPE.Contains("FORCE") Then
                        '            '    LEAVETYPE = "FL"
                        '            'End If

                        '            If LEAVELEN = 1 Then
                        '                'Me.in_am = LEAVETYPE
                        '                'Me.out_am = LEAVETYPE
                        '                'Me.in_pm = LEAVETYPE
                        '                'Me.out_pm = LEAVETYPE
                        '                Me.dtrRemarks = LEAVETYPE
                        '            Else
                        '                Dim LeaveStartTime As String = MeData.Rows(0).Item("start_time").ToString

                        '                If LeaveStartTime = "08:00:00" Then
                        '                    'Me.in_am = LEAVETYPE
                        '                    'Me.out_am = LEAVETYPE
                        '                    Me.dtrRemarks = LEAVETYPE
                        '                Else
                        '                    'Me.in_pm = LEAVETYPE
                        '                    'Me.out_pm = LEAVETYPE
                        '                    Me.dtrRemarks = LEAVETYPE
                        '                End If
                        '            End If
                        '        End If







                        '    Catch ex As Exception

                        '    End Try


                        'End If 'LEAVE ENDS


                        ' Official Business BEGIN
                        If Me.OBNotes.Length > 0 And Me.total_hours_worked = 8 Then
                            Me.dtrRemarks = Me.OBNotes
                            'Me.in_am = Me.OBNotes
                            'Me.out_am = ""
                            'Me.in_pm = ""
                            'Me.out_pm = ""
                        End If
                        ' Official Business BEGIN

                    Else
                        MsgBox("hi")

                    End If
                    ' ATTENDANCE END

                    ' AWOL BEGIN
                    SQL = "SELECT total_hours_worked,att_remarks "
                    SQL += " FROM djemfcst_hris.hr_emp_attendance "
                    SQL += String.Format(" WHERE employee_number='{0}' and dtr_date='{1}'", empCode, dtrDate)

                    MeData = Nothing
                    MeData = New DataTable

                    MeData = clsDBConn.ExecQuery(SQL)

                    If MeData.Rows.Count > 0 Then
                        Try
                            Dim remarks As String = MeData.Rows(0).Item("att_remarks")

                            If remarks = "AWOL" Then
                                Me.late = -6
                            End If

                        Catch ex As Exception

                        End Try
                    End If

                    ' AWOL END

                Catch ex As Exception


                    Me.dtrDay = dtrDate
                    Me.in_am = ""
                    Me.out_am = ""

                    Me.in_pm = ""
                    Me.out_pm = ""

                    Me.late = 0
                    Me.undertime = 0
                    Me.total_hours_worked = 0

                End Try
                Dim holidayName As String = isHoliday(dtrDate)
                If holidayName.Length > 0 Then
                    Me.in_am = "HOLIDAY"
                    Me.out_am = ""
                    Me.in_pm = holidayName
                    Me.out_pm = ""
                    Exit Sub
                End If
            Else ' no dtr found on that day

                Me.dtrDay = dtrDate
                Me.in_am = ""
                Me.out_am = ""
                Me.in_pm = ""
                Me.out_pm = ""

                Dim holidayName As String = isHoliday(dtrDate)

                If holidayName.Length > 0 Then
                    Me.in_am = "HOLIDAY"
                    Me.out_am = ""
                    Me.in_pm = holidayName
                    Me.out_pm = ""
                    Exit Sub
                End If



                Me.late = 0
                Me.undertime = 0
                Me.total_hours_worked = 0

                'SQL = "SELECT `hr_emp_leaves`.`leave_date`, `hr_emp_leave_type`.`leave_type`, leave_length_days, start_time, leave_status"
                'SQL += " FROM `djemfcst_hris.`.`hr_emp_leaves`"
                'SQL += " LEFT JOIN `djemfcst_hris.`.`hr_emp_leave_type` "
                'SQL += " ON (`hr_emp_leaves`.`leave_type_id` = `hr_emp_leave_type`.`leave_number`)"
                'SQL += " WHERE employee_id='" & empCode & "'"
                'SQL += " AND leave_date='" & dtrDate & "'"
                'SQL += " AND leave_status >= 3 "
                ''WHEN `hr_emp_leaves`.`leave_status` = 0  THEN 'FOR APPROVAL'
                ''WHEN `hr_emp_leaves`.`leave_status` = 1  THEN 'REJECTED'
                ''WHEN `hr_emp_leaves`.`leave_status` = 2  THEN 'CANCELED'
                ''WHEN `hr_emp_leaves`.`leave_status` = 3  THEN 'SCHEDULED/APPROVED'
                ''WHEN `hr_emp_leaves`.`leave_status` = 4  THEN 'TAKEN'

                'MeData = Nothing
                'MeData = New DataTable

                'MeData = clsDBConn.ExecQuery(SQL)

                'If MeData.Rows.Count > 0 Then
                '    Try

                '        Dim LEAVETYPE As String = MeData.Rows(0).Item("leave_type").ToString
                '        Dim LEAVELEN As Double = MeData.Rows(0).Item("leave_length_days")
                '        Dim LEAVESTAT As Short = MeData.Rows(0).Item("leave_status")

                '        If LEAVESTAT >= 3 Then

                '            'If LEAVETYPE.Contains("VACATION") Then
                '            '    LEAVETYPE = "VL"
                '            'ElseIf LEAVETYPE.Contains("SICK") Then
                '            '    LEAVETYPE = "SL"
                '            'ElseIf LEAVETYPE.Contains("SPECIAL") Then
                '            '    LEAVETYPE = "SP"
                '            'ElseIf LEAVETYPE.Contains("FORCE") Then
                '            '    LEAVETYPE = "FL"
                '            'End If

                '            If LEAVELEN = 1 Then
                '                'Me.in_am = LEAVETYPE
                '                'Me.out_am = LEAVETYPE

                '                'Me.in_pm = LEAVETYPE
                '                'Me.out_pm = LEAVETYPE
                '                Me.dtrRemarks = LEAVETYPE

                '            Else
                '                Dim LeaveStartTime As String = MeData.Rows(0).Item("start_time").ToString

                '                If LeaveStartTime = "08:00:00" Then
                '                    'Me.in_am = LEAVETYPE
                '                    'Me.out_am = LEAVETYPE
                '                    Me.dtrRemarks = LEAVETYPE
                '                Else
                '                    'Me.in_pm = LEAVETYPE
                '                    'Me.out_pm = LEAVETYPE
                '                    Me.dtrRemarks = LEAVETYPE
                '                End If
                '            End If
                '        End If







                '    Catch ex As Exception

                '    End Try
                'End If


            End If


        End Sub

        Private Function isHoliday(ByVal dtrDate As String) As String

            Dim Holiday As String = ""





            Return Holiday
        End Function


    End Class

End Class


