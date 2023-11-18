﻿Imports System.Threading
Imports System.ComponentModel
Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraGrid
Imports DevExpress.Data
Imports DevExpress.XtraGrid.Columns

Public Class fmaStudentFeePaymentsForm

    Private TuitionFee_Lec As Double = 0
    Private TuitionFee_lab As Double = 0

    Private TOTAL_PAYABLES As Double = 0

    Private HasLab As Boolean = False

    Public shortcut As Boolean = False

    Public FirstLoad As Boolean = True

    Dim WithEvents PAYMENTDETAILS As fmaPaymentDetails

    Private NO_ASSESSMENT As Boolean = False


    Private Sub fmaStudentFeePaymentsForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If AuthUserType = "SUPERUSER" Then
            lbluser.Text = AuthUserName & " / SUPERUSER"
        ElseIf AuthUserType = "ADMIN" Then
            lbluser.Text = AuthUserName & " / ADMINISTRATOR"
        Else
            lbluser.Text = AuthUserName & " / CASHIER"
        End If



        NO_ASSESSMENT = False
        dtpPayDate.Value = Date.Now
        FirstLoad = True

        _student_category_id = RadioButton1.Tag

        displayCourse()
        If shortcut Then
            SelectedValue(sender, e)
        End If
        shortcut = False

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

        loadHandler()

        displayCheckerStudent()

        FirstLoad = False

        cxbxFullPayment.Visible = False
    End Sub

    Private Sub loadHandler()
        AddHandler cmbStudentList.SelectedIndexChanged, AddressOf cmbStudentList_SelectedIndexChanged
    End Sub


    Private Sub cmbStudentList_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(cmbStudentList.SelectedItem, DataRowView)
            Me.txtAdmissionNo.Text = drv.Item("admission_no").ToString
            Me.txtStudentID.Text = drv.Item("studentid").ToString
            class_roll_no = drv.Item("class_roll_no").ToString
            PERSON_ID = drv.Item("person_id").ToString
            getListOfId(PERSON_ID)

            '      btnSearchCondition_Click(sender, e)

        Catch ex As Exception
            Me.txtStudentID.Text = ""
            Me.txtAdmissionNo.Text = ""
        End Try
    End Sub

    Private Sub loadPaymentHistory(listOfID As String)

        Dim dt As DataTable = getPaymentHistory(listOfID)
        gcPaymentHistory.DataSource = dt
        creatFooter(gvPaymentHistory)

    End Sub

    Private Sub creatFooter(gvPaymentHistory As GridView)

        Dim gview As GridView = gvPaymentHistory

        Dim id As String = ""

        Dim col As Integer = 0
        For Each column As Columns.GridColumn In gview.Columns

            If col = 2 Then

                Dim item As GridGroupSummaryItem = New GridGroupSummaryItem()
                item.FieldName = column.FieldName
                item.ShowInGroupColumnFooter = gview.Columns("Particular")
                item.SummaryType = DevExpress.Data.SummaryItemType.Average
                item.DisplayFormat = "TOTAL PAYABLES : {0:n2}"

                gview.GroupSummary.Add(item)

            End If

            col += 1
        Next


    End Sub

    Private Function getPaymentHistory(listOfID As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	students.id,
	CONCAT(batches.`name`,' - PREVIOUS BALANCE : ',FORMAT(students.runningbalance,2)) 'title',
	-- CONCAT('TOTAL PAYABLES : ',students_assessment.totaL) 'TotalPayable',
students_assessment.totaL 'TotalPayable',
	'-' AS 'LESS',
	DATE_FORMAT(finance_transactions_onetime_payments.date_paid,'%M %d, %Y') 'datepaid',
	finance_fee_particulars.`name` 'Particular',
	FORMAT(finance_transactions_onetime_payments.amount,2)'amount'

FROM
	students
	INNER JOIN person ON students.person_id = person.person_id and person.status_type_id <> 2 and person.status_type_id <> 0
	INNER JOIN batches ON students.batch_id = batches.id
  INNER JOIN students_assessment ON students.id = students_assessment.student_id AND students_assessment.amount = 'TOTAL PAYABLES'
  INNER JOIN finance_transactions ON students.id = finance_transactions.student_id AND payment_type = 0
	INNER JOIN finance_transactions_onetime_payments ON finance_transactions.id = finance_transactions_onetime_payments.finance_transaction_id
	INNER JOIN finance_fee_particulars ON finance_transactions_onetime_payments.finance_fee_paticulars_id = finance_fee_particulars.id
	
	WHERE students.status_type_id = 1  AND students.runningbalance <> 0
	AND students.id IN(" & listOfID & ")
	
	
	
	"
        Return DataSource(sql)
    End Function

    Private Sub SelectedValue(sender As Object, e As EventArgs)

        cmbCourse.SelectedValue = _courseID
        Me.txtCourseID.Text = _courseID
        cmbCourse_SelectedIndexChanged(sender, e)
        txtCourseID_TextChanged(sender, e)

        cmbBatch.SelectedValue = _batchID
        Me.txtBatchID.Text = _batchID
        cmbBatch_SelectedIndexChanged(sender, e)
        txtBatchID_TextChanged(sender, e)

        cmbyearbatch.Text = _batchyear

        '   cmbStudentList.SelectedValue = _studentID
        Me.txtStudentID.Text = _studentID
        '      cmbStudentList_SelectedIndexChanged(sender, e)
        txtStudentID_TextChanged(sender, e)



    End Sub


    Private Sub displayCourse()
        Dim SQLEX As String = "SELECT id, course_name FROM courses"
        SQLEX += " WHERE is_deleted <> 1"
        If _student_category_id > 0 Then
            SQLEX += " AND category_id = '" & _student_category_id & "' "
        End If
        SQLEX += " GROUP BY course_name "
        SQLEX += " ORDER BY course_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbCourse.DataSource = MeData

        cmbCourse.ValueMember = "id"
        cmbCourse.DisplayMember = "course_name"

        cmbCourse.SelectedIndex = -1
        txtCourseID.Text = ""
    End Sub


    Private Sub cmbCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            Me.txtCourseID.Text = drv.Item("id").ToString
            '     cmbBatch.Focus()

        Catch ex As Exception
            Me.txtCourseID.Text = ""
        End Try

        '   CheckBox1_Click(sender, e)
    End Sub

    Private Sub txtCourseID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCourseID.TextChanged
        If txtCourseID.Text.Length > 0 Then
            If cmbBatch.Enabled = False Then
                cmbBatch.Enabled = True
            End If
            displayBatches()
        Else
            cmbBatch.Enabled = False
        End If
    End Sub

    Private Sub displayBatches()

        Dim SQLEX As String = "SELECT batches.id, name FROM batches"
        SQLEX += " INNER JOIN courses"
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
        SQLEX += " AND course_id='" & Me.txtCourseID.Text & "' AND batches.school_year = '" & cmbyearbatch.Text & "' "
        SQLEX += " ORDER BY semester,year_level"


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBatch.DataSource = MeData

        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"
        cmbBatch.Text = ""
        cmbBatch.SelectedIndex = -1


    End Sub

    Private Sub cmbBatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbBatch.SelectedIndexChanged

        If cmbBatch.Focused Then
            Try
                Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
                Me.txtBatchID.Text = drv.Item("id").ToString
                cmbStudentList.Focus()
                displayStudents()
            Catch ex As Exception
                '     Me.txtBatchID.Text = ""
            End Try
        End If


    End Sub

    Private Sub txtBatchID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBatchID.TextChanged
        If txtBatchID.Text.Length > 0 Then
            If cmbStudentList.Enabled = False Then
                cmbStudentList.Enabled = True
            End If
            displayStudents()
        Else
            cmbStudentList.Enabled = False
        End If
    End Sub

    Private Sub displayStudents()
        Dim SQLEX As String = "SELECT DISTINCT students.id AS studentid,students.admission_no,CONCAT(students.scholarshipgrant,' ',IFNULL(scholarship_grant_details.grant_amount,''))'scholarshipgrant',students.class_roll_no"
        SQLEX += " , person.display_name AS studentname"
        SQLEX += " , courses.course_name"
        SQLEX += " , batches.`name` AS batchname,students.year_level,batches.school_year,students.semester"
        SQLEX += " , student_categories.`name` AS categoryname"
        SQLEX += " , student_categories.id AS categoryid"
        SQLEX += " , students.runningbalance,students.has_paid_fees"
        SQLEX += " , students.person_id,IFNULL(scholarship_grant_details.grant_amount,0)'grant_amount',IFNULL(scholarship_grant_details.is_grant,2)'is_grant',ifnull(scholarship_grant.fullDeduct,'')'fullDeduct' "
        SQLEX += " FROM person"
        SQLEX += " INNER JOIN students ON students.person_id = person.person_id"
        SQLEX += " INNER JOIN courses ON students.course_id = courses.id "
        SQLEX += " INNER JOIN batches ON students.batch_id = batches.id "
        SQLEX += " INNER JOIN student_categories ON students.student_category_id = student_categories.id"
        SQLEX += " INNER JOIN students_subjects ON students.id = students_subjects.student_id "
        SQLEX += " LEFT JOIN scholarship_grant_details ON students.id = scholarship_grant_details.student_id "
        SQLEX += " 	LEFT JOIN scholarship_grant ON scholarship_grant_details.scholarship_code = scholarship_grant.`code` "
        'AND students.batch_id = students_subjects.batch_id
        SQLEX += " WHERE person.status_type_id = 1 AND person.end_time IS NULL AND person.person_type_id = 2 AND "
        SQLEX += " students.course_id = '" & txtCourseID.Text & "'"
        If txtBatchID.Text <> "" Then
            SQLEX += " AND students.batch_id ='" & txtBatchID.Text & "'"
        End If
        SQLEX += " ORDER BY studentname"


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbStudentList.DataSource = MeData

        cmbStudentList.ValueMember = "studentid"
        cmbStudentList.DisplayMember = ("studentname")

        cmbStudentList.SelectedIndex = -1
        txtStudentID.Text = ""

        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("studentid").Visible = False
                .DisplayColumns("admission_no").Visible = False
                .DisplayColumns("scholarshipgrant").Visible = False
                .DisplayColumns("class_roll_no").Visible = False
                .DisplayColumns("course_name").Visible = False
                .DisplayColumns("batchname").Visible = False
                .DisplayColumns("year_level").Visible = False
                .DisplayColumns("school_year").Visible = False
                .DisplayColumns("semester").Visible = False
                .DisplayColumns("categoryname").Visible = False
                .DisplayColumns("categoryid").Visible = False
                .DisplayColumns("runningbalance").Visible = False
                .DisplayColumns("has_paid_fees").Visible = False

                .DisplayColumns("studentname").Width = 300

            End With
        Catch ex As Exception

        End Try

    End Sub

    'Private Sub cmbStudentList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbStudentList.SelectedIndexChanged

    '    Try
    '        Dim drv As DataRowView = DirectCast(cmbStudentList.SelectedItem, DataRowView)
    '        Me.txtAdmissionNo.Text = drv.Item("admission_no").ToString
    '        Me.txtStudentID.Text = drv.Item("studentid").ToString
    '        class_roll_no = drv.Item("class_roll_no").ToString

    '        btnSearchCondition_Click(sender, e)

    '    Catch ex As Exception
    '        Me.txtStudentID.Text = ""
    '        Me.txtAdmissionNo.Text = ""
    '    End Try
    'End Sub

    Private Sub btnClearFilter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        cmbCourse.Text = ""
        cmbBatch.Text = ""
        cmbStudentList.Text = ""
        cmbyearbatch.Text = ""
        diAmount.Value = 0
        cxbxFullPayment.Visible = False
        txtORNo.Text = ""
        txtRemarks.Text = ""

        '     groupboxStudDetails.Visible = False
        'btnPrintStatement.Enabled = False
        'diAmount.Enabled = False
        dgvFEES.Rows.Clear()
        displayCourse()
        displayBatches()
        displayStudents()
    End Sub

    Private Sub txtStudentID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtStudentID.TextChanged
        If txtStudentID.Text.Length > 0 Then
            ''groupboxStudDetails.Visible = True

            'lblAdmNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
            'lblName.Text = tdbViewer.Columns.Item("studentname").Value.ToString
            'lblCourse.Text = tdbViewer.Columns.Item("course_name").Value.ToString
            'lblCategory.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
            'lblCategoryID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString

            'lblYearlvl.Text = tdbViewer.Columns.Item("year_level").Value.ToString
            'lblSY.Text = tdbViewer.Columns.Item("school_year").Value.ToString
            'lblSem.Text = tdbViewer.Columns.Item("semester").Value.ToString

            ''runningbalance

            'lblBalance.Text = Format(tdbViewer.Columns.Item("runningbalance").Value, "P #,##0.00")


            'TuitionFee_Lec = 0
            'TuitionFee_lab = 0

            'TOTAL_PAYABLES = 0


            'displayStudentsSubj()
            'computeTuitionFee()
            'displayStudentFees()

            ''displayStudentPayable()
            'dgvFEES.Visible = True
            btnSearchCondition.Enabled = True
        Else
            'groupboxStudDetails.Visible = True
            '       dgvFEES.Visible = False
            '      groupboxPayment.Visible = False
            btnSearchCondition.Enabled = False
        End If
    End Sub

    Private Sub displayStudentsSubj()

        If txtAdmissionNo.Text = "" Then
            Exit Sub
        End If

        Dim SQLEX As String = ""

        '  If Me.lblCategory.Text = "COLLEGE" Then

        SQLEX = "SELECT  students.admission_no, students.scholarshipgrant"
        SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
        SQLEX += ", subjects.credit_hours, CASE WHEN IFNULL(students_subjects.lec_amt,0) = 0 THEN subjects.amount ELSE IFNULL(students_subjects.lec_amt,0) END AS 'amount',subjects.id 'subjid',subjects.no_exams"
        SQLEX += ", subject_class_schedule.name"
        SQLEX += ", subject_class_schedule.room"
        SQLEX += ", subject_class_schedule.employee_name"
        SQLEX += " FROM students_subjects"
        SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
        SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
        SQLEX += " LEFT JOIN subject_class_schedule"
        SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
        SQLEX += " WHERE admission_no='" & txtAdmissionNo.Text & "'"
        SQLEX += " AND subjects.is_deleted = '0'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Me.tdbViewerSubjects.DataSource = MeData

        Try
            With tdbViewerSubjects.Splits(0)
                .DisplayColumns("id").Visible = False
                .DisplayColumns("admission_no").Visible = False
                .DisplayColumns("scholarshipgrant").Visible = False
                .DisplayColumns("credit_hours").Visible = False
                .DisplayColumns("amount").Visible = False
                .DisplayColumns("no_exams").Visible = False
                .DisplayColumns("name").Visible = False
                .DisplayColumns("room").Visible = False
                .DisplayColumns("employee_name").Visible = False

                .DisplayColumns("subjname").DataColumn.Caption = "SUBJECT NAME"

            End With
        Catch ex As Exception

        End Try

        '  End If

    End Sub

    Private Sub computeTuitionFee()

        If Me.lblCategoryID.Text = "4" Then

            Dim rowcount As Integer = tdbViewerSubjects.RowCount

            For jRows As Integer = 0 To (rowcount - 1)
                'tdbViewerSubjects.Item(2, jRows).Value =

                Dim no_exams As String = tdbViewerSubjects.Columns("no_exams").CellText(jRows).ToString
                Dim subj As String = tdbViewerSubjects.Columns("subjname").CellText(jRows).ToString

                Dim amount As Double = CDbl(tdbViewerSubjects.Columns("amount").CellText(jRows).ToString)
                Dim Unit As Double = CDbl(tdbViewerSubjects.Columns("credit_hours").CellText(jRows).ToString)


                If no_exams = "0" Then
                    TuitionFee_Lec += Unit * amount
                    Dim lab_name As String = tdbViewerSubjects.Columns("lab_name").CellText(jRows).ToString
                    Dim lab_amt As Double = tdbViewerSubjects.Columns("lab_amount").CellText(jRows).ToString
                    If lab_name <> "" Then
                        TuitionFee_lab += lab_amt
                        HasLab = True
                    End If

                Else
                    TuitionFee_lab += Unit * amount
                    HasLab = True
                End If

            Next

        End If


    End Sub

    Private Sub displayStudentAssessment()

        'If cmbStudentList.Text.Length = 0 Then
        '    Exit Sub
        'End If

        Dim TOTAL_FEES As Double = 0

        Dim dt_fees As New DataTable
        Dim dt_SOA As New DataTable

        dt_fees.Columns.Add("FEE DESCRIPTION")
        dt_fees.Columns.Add("PARTICULARS")
        dt_fees.Columns.Add("AMOUNT")
        dt_fees.Columns.Add("TOTAL")
        dt_fees.Columns.Add("STAT")

        dt_SOA.Columns.Add("FEE DESCRIPTION")
        dt_SOA.Columns.Add("PARTICULARS")
        dt_SOA.Columns.Add("AMOUNT")
        dt_SOA.Columns.Add("TOTAL")
        dt_SOA.Columns.Add("STAT")


        dgvFEES.Rows.Clear()

        Dim SQLEX As String = "SELECT masterfee,particulars,amount,total,stat,columnName FROM students_assessment"
        SQLEX += " WHERE student_id ='" & Me.txtStudentID.Text & "'"

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then

            For nCtr As Integer = 0 To MeData.Rows.Count - 1
                dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("masterfee").ToString,
                                          MeData.Rows(nCtr).Item("particulars").ToString,
                                          MeData.Rows(nCtr).Item("amount").ToString,
                                          MeData.Rows(nCtr).Item("total").ToString})
                dt_fees.Rows.Add(New String() {MeData.Rows(nCtr).Item("masterfee").ToString,
                                          MeData.Rows(nCtr).Item("particulars").ToString,
                                          MeData.Rows(nCtr).Item("amount").ToString,
                                          MeData.Rows(nCtr).Item("total").ToString})

                If MeData.Rows(nCtr).Item("columnName").ToString = "H" Then
                    dt_SOA.Rows.Add(New String() {MeData.Rows(nCtr).Item("masterfee").ToString,
                                          MeData.Rows(nCtr).Item("particulars").ToString,
                                          MeData.Rows(nCtr).Item("amount").ToString,
                                          MeData.Rows(nCtr).Item("total").ToString})

                End If

                If MeData.Rows(nCtr).Item("stat").ToString = "++" Then
                    Try
                        dt_SOA.Rows.Add(New String() {MeData.Rows(nCtr).Item("amount").ToString,
                                          "",
                                          "",
                                          MeData.Rows(nCtr).Item("total").ToString})
                    Catch ex As Exception

                    End Try
                End If

                If MeData.Rows(nCtr).Item("stat").ToString = "-+" Then
                    Try
                        dt_SOA.Rows.Add(New String() {MeData.Rows(nCtr).Item("amount").ToString,
                                          "",
                                          "",
                                          MeData.Rows(nCtr).Item("total").ToString})
                    Catch ex As Exception

                    End Try
                End If
                If MeData.Rows(nCtr).Item("stat").ToString = "--" Then
                    Try

                        dt_SOA.Rows.Add(New String() {MeData.Rows(nCtr).Item("amount").ToString,
                                          "",
                                          "",
                                          MeData.Rows(nCtr).Item("total").ToString})
                    Catch ex As Exception
                    End Try
                End If


                If MeData.Rows(nCtr).Item("stat").ToString = "T+" Then
                    Try
                        Dim bal As Double = CDbl(MeData.Rows(nCtr).Item("total").ToString)
                        dt_SOA.Rows.Add(New String() {MeData.Rows(nCtr).Item("amount").ToString,
                                          "",
                                          "",
                                          MeData.Rows(nCtr).Item("total").ToString})
                        TOTAL_PAYABLES = bal
                    Catch ex As Exception

                    End Try
                End If




                'dt_fees.Rows.Add(New String() {dgvFEES.Item(0, nCtr).Value.ToString, _
                '                          dgvFEES.Item(1, nCtr).Value.ToString, _
                '                          dgvFEES.Item(2, nCtr).Value.ToString, _
                '                          dgvFEES.Item(3, nCtr).Value.ToString})

                'dt_SOA.Rows.Add(New String() {dgvFEES.Item(0, nCtr).Value.ToString, _
                '                          dgvFEES.Item(1, nCtr).Value.ToString, _
                '                          dgvFEES.Item(2, nCtr).Value.ToString, _
                '                          dgvFEES.Item(3, nCtr).Value.ToString})
            Next
        Else
            MsgBox("Please Print Student Assessment First", MsgBoxStyle.Exclamation)
            btnClearFilter.PerformClick()
        End If

        report_dt_fees = New DataTable
        report_dt_fees = dt_fees
        report_dt_SOA = New DataTable
        report_dt_SOA = dt_SOA

    End Sub


    Private Sub displayStudentFees()

        Dim TOTAL_FEES As Double = 0

        Dim dt_fees As New DataTable
        Dim dt_SOA As New DataTable

        dt_fees.Columns.Add("FEE DESCRIPTION")
        dt_SOA.Columns.Add("FEE DESCRIPTION")
        dt_fees.Columns.Add("PARTICULARS")
        dt_SOA.Columns.Add("PARTICULARS")
        dt_fees.Columns.Add("AMOUNT")
        dt_SOA.Columns.Add("AMOUNT")
        dt_fees.Columns.Add("TOTAL")
        dt_SOA.Columns.Add("TOTAL")


        dgvFEES.Rows.Clear()

        ' if college, recompute tuition fee for lecture and lab based on price per unit.
        If Me.lblCategory.Text = "COLLEGE" Then
            ' add tuition according to enrolled subject
            dgvFEES.Rows.Add(New String() {"TUITION", "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00")})
            dt_fees.Rows.Add(New String() {"TUITION", "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00")})
            dt_SOA.Rows.Add(New String() {"TUITION", "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00")})
            If TuitionFee_Lec <> 0 Then

                dgvFEES.Rows.Add(New String() {"", "TUITION FEE LEC", Format(TuitionFee_Lec, "#,##0.00"), ""})
                dt_fees.Rows.Add(New String() {"", "TUITION FEE LEC", Format(TuitionFee_Lec, "#,##0.00"), ""})
            End If

            If TuitionFee_lab <> 0 Then
                dgvFEES.Rows.Add(New String() {"", "TUITION FEE LAB", Format(TuitionFee_lab, "#,##0.00"), ""})
                dt_fees.Rows.Add(New String() {"", "TUITION FEE LAB", Format(TuitionFee_lab, "#,##0.00"), ""})
            End If
        End If


        Dim SQLEX As String = "SELECT finance_fee_categories.id, finance_fee_categories.name,SUM(finance_fee_particulars.amount)"
        SQLEX += " FROM students"
        SQLEX += " INNER JOIN finance_fee_categories "
        SQLEX += " ON (students.batch_id = finance_fee_categories.batch_id)"
        SQLEX += " INNER JOIN finance_fee_particulars "
        SQLEX += " ON (finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id)"
        SQLEX += " WHERE students.admission_no='" & txtAdmissionNo.Text & "'"
        SQLEX += " AND finance_fee_particulars.is_deleted='0'"
        SQLEX += " GROUP BY finance_fee_categories.name"
        SQLEX += " ORDER BY id"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            For cnt As Integer = 0 To MeData.Rows.Count - 1
                Dim catname As String = MeData.Rows(cnt).Item("name").ToString
                Dim catid As String = MeData.Rows(cnt).Item("id").ToString
                Dim TotalAmt As String = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")
                TOTAL_FEES += CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString)

                If catname.ToLower.Contains("lab") Then
                    If HasLab = False Then
                        Continue For
                    End If
                End If

                dgvFEES.Rows.Add(New String() {catname, "", "", TotalAmt})
                dt_fees.Rows.Add(New String() {catname, "", "", TotalAmt})
                dt_SOA.Rows.Add(New String() {catname, "", "", TotalAmt})

                Dim SQLEXDetails As String = "SELECT name, amount FROM finance_fee_particulars"
                SQLEXDetails += " WHERE finance_fee_category_id ='" & catid & "'"
                SQLEXDetails += " AND is_deleted !='1'"
                Dim inDataT As DataTable
                inDataT = clsDBConn.ExecQuery(SQLEXDetails)

                If inDataT.Rows.Count Then
                    For indataCtr As Integer = 0 To inDataT.Rows.Count - 1
                        Dim detailname As String = inDataT.Rows(indataCtr).Item("name").ToString
                        Dim amount As String = Format(CDbl(inDataT.Rows(indataCtr).Item("amount").ToString), "#,##0.00")

                        dgvFEES.Rows.Add(New String() {"", detailname, amount, ""})
                        dt_fees.Rows.Add(New String() {"", detailname, amount, ""})

                    Next
                End If


            Next

        End If

        TOTAL_FEES += TuitionFee_lab + TuitionFee_Lec

        Dim balance As Double = CDbl(getPreviousBalance())
        Dim discount As Double = CDbl(getDiscount())
        Dim TOTAL_BAL As Double = (TOTAL_FEES + balance) - discount



        dgvFEES.Rows.Add(New String() {"", "", "TOTAL", Format(TOTAL_FEES, "#,##0.00")})
        dt_fees.Rows.Add(New String() {"", "", "TOTAL", Format(TOTAL_FEES, "#,##0.00")})
        dt_SOA.Rows.Add(New String() {"", "TOTAL", "", Format(TOTAL_FEES, "#,##0.00")})

        dgvFEES.Rows.Add(New String() {"", "", "PREVIOUS BALANCE", getPreviousBalance()})
        dt_fees.Rows.Add(New String() {"", "", "PREVIOUS BALANCE", getPreviousBalance()})
        dt_SOA.Rows.Add(New String() {"", "PREVIOUS BALANCE", "", getPreviousBalance()})

        dgvFEES.Rows.Add(New String() {"", "", "DISCOUNT", getDiscount()})
        dt_fees.Rows.Add(New String() {"", "", "DISCOUNT", getDiscount()})
        dt_SOA.Rows.Add(New String() {"", "DISCOUNT", "", getDiscount()})

        dgvFEES.Rows.Add(New String() {"", "", "TOTAL BALANCE", Format(TOTAL_BAL, "#,##0.00")})
        dt_fees.Rows.Add(New String() {"", "", "TOTAL BALANCE", Format(TOTAL_BAL, "#,##0.00")})
        dt_SOA.Rows.Add(New String() {"", "TOTAL BALANCE", "", Format(TOTAL_BAL, "#,##0.00")})


        '
        report_dt_fees = New DataTable
        report_dt_fees = dt_fees
        report_dt_SOA = New DataTable
        report_dt_SOA = dt_SOA

        TOTAL_PAYABLES = TOTAL_BAL




    End Sub

    Private Function getPreviousBalance() As String
        Dim SQLEX As String = "SELECT student_additional_fields.name"
        SQLEX += " , student_additional_details.student_id"
        SQLEX += " , student_additional_details.additional_info"
        SQLEX += " FROM student_additional_details"
        SQLEX += " INNER JOIN student_additional_fields "
        SQLEX += " ON (student_additional_details.additional_field_id = student_additional_fields.id)"
        SQLEX += " WHERE student_additional_fields.id='1'"
        SQLEX += " and student_id='" & txtStudentID.Text & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim prevBal As String = "0.00"
        If MeData.Rows.Count > 0 Then
            Dim value As Double = 0

            Try
                value = CDbl(MeData.Rows(0).Item("additional_info").ToString)
                prevBal = Format(value, "#,##0.00")

            Catch ex As Exception

            End Try
        End If


        Return prevBal
    End Function


    Private Function getDiscount() As String
        Dim SQLEX As String = "SELECT student_additional_fields.name"
        SQLEX += " , student_additional_details.student_id"
        SQLEX += " , student_additional_details.additional_info"
        SQLEX += " FROM student_additional_details"
        SQLEX += " INNER JOIN student_additional_fields "
        SQLEX += " ON (student_additional_details.additional_field_id = student_additional_fields.id)"
        SQLEX += " WHERE student_additional_fields.id='2'"
        SQLEX += " and student_id='" & txtStudentID.Text & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim prevBal As String = "0.00"
        If MeData.Rows.Count > 0 Then
            Dim value As Double = 0

            Try
                value = CDbl(MeData.Rows(0).Item("additional_info").ToString)
                prevBal = Format(value, "#,##0.00")

            Catch ex As Exception

            End Try
        End If


        Return prevBal
    End Function


    Dim is_grant As Integer
    Dim grand_amount As Double
    Dim FullDeduct As String
    Private Sub btnSearchCondition_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearchCondition.Click
        ''     groupboxStudDetails.Visible = True
        'If cmbStudentList.SelectedIndex = -1 Then
        '    Exit Sub
        'End If

        gcPaymentHistory.DataSource = Nothing
        loadPaymentHistory(ListOfID)

        cxbxFullPayment.Checked = False

        is_grant = tdbViewer.Columns.Item("is_grant").Value
        grand_amount = tdbViewer.Columns.Item("grant_amount").Value.ToString
        FullDeduct = tdbViewer.Columns.Item("fullDeduct").Value.ToString
        lblGrant.Text = tdbViewer.Columns.Item("scholarshipgrant").Value.ToString

        If lblGrant.Text = "" Then
            cxbxFullPayment.Visible = False
            cbxdiscount.Visible = False
        Else
            If FullDeduct = "YES" Then
                cxbxFullPayment.Visible = True
                cbxdiscount.Visible = False
            Else
                If is_grant = 2 Then
                    cbxdiscount.Visible = False
                Else
                    cbxdiscount.Visible = True
                End If
            End If
        End If



        lblAdmNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
        lblName.Text = tdbViewer.Columns.Item("studentname").Value.ToString

        lblCourse.Text = tdbViewer.Columns.Item("course_name").Value.ToString
        lblCategory.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
        lblCategoryID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString

        lblYearlvl.Text = tdbViewer.Columns.Item("year_level").Value.ToString
        lblSY.Text = tdbViewer.Columns.Item("school_year").Value.ToString
        lblSem.Text = tdbViewer.Columns.Item("semester").Value.ToString

        'runningbalance
        lblBalance.Text = Format(tdbViewer.Columns.Item("runningbalance").Value, "#,##0.00")
        If tdbViewer.Columns.Item("has_paid_fees").Value.ToString = "1" Then
            lblBalance.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, FontStyle.Strikeout Or FontStyle.Bold)
        Else
            lblBalance.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        End If


        TuitionFee_Lec = 0
        TuitionFee_lab = 0

        TOTAL_PAYABLES = 0


        displayStudentsSubj()
        computeTuitionFee()
        'displayStudentFees()
        displayStudentAssessment()

        If NO_ASSESSMENT = False Then
            Exit Sub
        End If
        displayStudentPayable()
        dgvFEES.Visible = True
        groupboxPayment.Visible = True
        btnPrintStatement.Enabled = True
        diAmount.Enabled = True

        dtpPayDate.Focus()

    End Sub


    Private Sub displayStudentPayable()

        'If cmbStudentList.SelectedIndex = -1 Then
        '    Exit Sub
        'End If

        ' check all payments
        Dim SQLPaymentsmade As String = "SELECT amount FROM finance_transactions"
        SQLPaymentsmade += " WHERE finance_id = '3'"
        SQLPaymentsmade += " AND payee_id='" & txtStudentID.Text & "'"
        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLPaymentsmade)

        Dim paymentdic As New List(Of Double)
        Dim TOTALPAYMENTSMADE As Double = 0

        If MeData.Rows.Count > 0 Then
            For modecnt As Integer = 0 To MeData.Rows.Count - 1
                Dim amount As Double = MeData.Rows(modecnt).Item("amount")
                TOTALPAYMENTSMADE += amount
                paymentdic.Add(amount)
            Next
        End If

        MeData = Nothing

        dgvFEES.Rows.Add(New String() {"MODE OF PAYMENTS"})

        Dim SQLEX As String = "SELECT description FROM fee_schedule"
        SQLEX += " WHERE student_category_id='" & lblCategoryID.Text & "'"


        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim paymentCount As Integer = 1

        If MeData.Rows.Count > 0 Then

            'dgvFEES.Rows.Clear()

            Dim paymodeRate As Double = (TOTAL_PAYABLES - TOTALPAYMENTSMADE) / MeData.Rows.Count

            'dgvPayment.Rows.Clear()
            For modecnt As Integer = 0 To MeData.Rows.Count - 1



                Dim paymentType As String = MeData.Rows(modecnt).Item("description").ToString

                Try
                    If paymentdic(modecnt) > 0 Then
                        paymodeRate = paymentdic(modecnt)
                        dgvFEES.Rows.Add(New String() {"", paymentType, "-" & Format(paymodeRate, "#,##0.00")})
                    Else
                        dgvFEES.Rows.Add(New String() {"", paymentType, Format(paymodeRate, "#,##0.00")})
                    End If
                Catch ex As Exception

                    paymodeRate = (TOTAL_PAYABLES - TOTALPAYMENTSMADE) / (MeData.Rows.Count - paymentdic.Count)
                    dgvFEES.Rows.Add(New String() {"", paymentType, Format(paymodeRate, "#,##0.00")})
                End Try




            Next
            dgvFEES.Rows.Add(New String() {"TOTAL INSTALLMENT", "", Format(TOTAL_PAYABLES, "#,##0.00")})


        End If



    End Sub

    Private Sub diAmount_ValueChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles diAmount.ValueChanged
        If tdbViewer.Columns.Item("has_paid_fees").Value.ToString = "1" Then
            Exit Sub
        End If


        If diAmount.Value > 0 Then
            btnPost.Enabled = True
        Else
            btnPost.Enabled = False
        End If
    End Sub

    Private Sub btnPost_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPost.Click

        If Not PAYMENTDETAILS Is Nothing Then
            PAYMENTDETAILS = Nothing
            PAYMENTDETAILS = New fmaPaymentDetails
        Else
            PAYMENTDETAILS = New fmaPaymentDetails
        End If


        If cxbxFullPayment.Checked = True Then
            PAYMENTDETAILS.isFullPayment = True
        Else
            PAYMENTDETAILS.isFullPayment = False
        End If

        If cbxdiscount.Checked = True Then
            PAYMENTDETAILS.isDiscount = True
            '      PAYMENTDETAILS.txtTotalPayment.Text = diAmount.Value
            PAYMENTDETAILS.LabelX1.Text = "DISCOUNTED AMOUNT :"
        Else
            PAYMENTDETAILS.isDiscount = False
            PAYMENTDETAILS.txtTotalPayment.Text = ""
            PAYMENTDETAILS.LabelX1.Text = "AMOUNT TO BE PAID :"
        End If





        PAYMENTDETAILS.txtStudentID.Text = Me.txtStudentID.Text
        PAYMENTDETAILS.txtAmount.Text = Format(diAmount.Value, "#,##0.00")
        PAYMENTDETAILS.txtClassRollNo.Text = Me.class_roll_no
        PAYMENTDETAILS.txtORNo.Text = Me.txtORNo.Text
        PAYMENTDETAILS.txtRemarks.Text = Me.txtRemarks.Text
        PAYMENTDETAILS.dtpPayDate.Value = Me.dtpPayDate.Value
        PAYMENTDETAILS.txtStudentName.Text = Me.lblName.Text

        PAYMENTDETAILS.txtDtpYear.Text = Format(dtpPayDate.Value, "yyyy")
        PAYMENTDETAILS.txtPaymentDate.Text = Format(dtpPayDate.Value, "yyyy-MM-dd")

        PAYMENTDETAILS.Show(Me)
        Exit Sub


        If CDbl(Me.lblBalance.Text) = 0 Then
            MsgBox("Please Issue Students Assessment First before Payment can be made.", MsgBoxStyle.Critical)
            Exit Sub
        End If

        Dim finance_id As String = "4"
        Dim finance_type As String = "FinanceFee"
        Dim payee_type As String = "Student"
        Dim category_id As String = "4"
        Dim title As String = "Received From : " & Me.lblName.Text
        Dim created_at As String = Format(DateTime.Now, "yyyy-MM-dd hh:mm:ss")

        If MessageBox.Show("PLEASE MAKE SURE AMOUNT IS CORRECT." & vbNewLine _
                           & "ARE YOU SURE YOU WANT TO POST PAYMENT?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then


            Dim SQLIN As String = "INSERT INTO finance_transactions(title,description"
            SQLIN += " ,amount,category_id"
            SQLIN += " ,created_at,transaction_date"
            SQLIN += " ,finance_id,finance_type"
            SQLIN += " ,student_id,payee_id,payee_type,receipt_no)"
            SQLIN += " VALUES("
            SQLIN += String.Format("'{0}', '{1}'", title, Me.txtRemarks.Text)
            SQLIN += String.Format(",'{0}', '{1}'", Me.diAmount.Value, category_id)
            SQLIN += String.Format(",'{0}', '{1}'", created_at, Format(dtpPayDate.Value, "yyyy-MM-dd"))
            SQLIN += String.Format(",'{0}', '{1}'", finance_id, finance_type)
            SQLIN += String.Format(",'{0}', '{1}','{2}'", Me.txtStudentID.Text, class_roll_no, payee_type)
            SQLIN += String.Format(",'{0}')", Me.txtORNo.Text)

            If clsDBConn.Execute(SQLIN) Then
                'MsgBox("PAYMENT HAS BEEN POSTED FOR :" & Me.lblName.Text, MsgBoxStyle.Information)

                'UPDATE RUNNING BALANCE FROM STUDENTS
                Dim SQLUP As String = "UPDATE students SET runningbalance=runningbalance - '" & Me.diAmount.Value & "'"
                SQLUP += " WHERE id='" & txtStudentID.Text & "'"

                clsDBConn.ExecuteSilence(SQLUP)


                If MessageBox.Show("PAYMENT HAS BEEN POSTED FOR :" & Me.lblName.Text & vbNewLine & vbNewLine _
                           & "DO YOU WANT TO PRINT THE RECEIPT?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then
                    'print reciept

                    Dim new_report As New fzzReportViewerForm

                    Dim SQLEX As String = "SELECT admission_no FROM students"
                    SQLEX += " WHERE id ='" & txtStudentID.Text & "'"

                    new_report.FolderName = "SOA"
                    new_report.AttachReport(SQLEX, "RECEIPT " & txtORNo.Text & "-" & Me.lblName.Text) = New rpt_ReceiptPrintout(Format(dtpPayDate.Value, "yyyy-MM-dd"),
                                                                                                                      Me.lblName.Text, diAmount.Value,
                                                                                                                      Me.txtRemarks.Text, Me.txtORNo.Text)



                    new_report.Show()

                Else
                    cmbStudentList.Focus()
                End If


                txtORNo.Text = ""
                diAmount.Value = 0
                txtRemarks.Text = ""
                btnPost.Enabled = False
                '         btnClearFilter.PerformClick()


            End If



        End If
    End Sub

    Private Sub btnPrintStatement_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPrintStatement.Click
        Dim tRemarks As String = ""
        With remarksDlg.ShowDialog = Windows.Forms.DialogResult.OK
            tRemarks = remarksDlg.txtRemarks.Text
        End With


        Dim SQLEX As String = "SELECT description, receipt_no, transaction_date, amount FROM finance_transactions"
        SQLEX += " WHERE student_id ='" & txtStudentID.Text & "' AND payee_type = 0  "


        Dim dt_payments_made As New DataTable

        dt_payments_made.Columns.Add("description")
        dt_payments_made.Columns.Add("receipt_no")
        dt_payments_made.Columns.Add("transaction_date")
        dt_payments_made.Columns.Add("amount")

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)
        Dim totalPayments As Double = 0


        If MeData.Rows.Count > 0 Then
            For nCtr As Integer = 0 To MeData.Rows.Count - 1
                Dim description As String = MeData.Rows(nCtr).Item("description").ToString
                Dim receipt_no As String = MeData.Rows(nCtr).Item("receipt_no").ToString
                Dim transaction_date As String = Format(MeData.Rows(nCtr).Item("transaction_date"), "yyyy-MM-dd")
                Dim amount As Double = MeData.Rows(nCtr).Item("amount")
                Dim amountwords As Double = Format(amount, "#,##0.00")
                totalPayments += amount

                dt_payments_made.Rows.Add(New String() {description, receipt_no, transaction_date, amountwords})
            Next
        End If

        dt_payments_made.Rows.Add(New String() {"", "", "TOTAL", Format(totalPayments, "#,##0.00")})





        report_dt_StudentsPayment = New DataTable
        report_dt_StudentsPayment = dt_payments_made

        Dim new_report As New fzzReportViewerForm
        new_report.FolderName = "STATEMENT OF ACCOUNTS"
        new_report.AttachReport(SQLEX, "SOA " & txtORNo.Text & "-" & Me.lblName.Text) = New rpt_StudentStatementofAccount(
        Me.lblSY.Text, Me.txtAdmissionNo.Text, Me.lblName.Text, Me.lblCourse.Text, Me.lblSem.Text, Me.lblYearlvl.Text, Me.lblBalance.Text, tRemarks, lblGrant.Text)
        new_report.Show()

    End Sub

    Private Sub ButtonX1_Click(sender As Object, e As EventArgs) Handles ButtonX1.Click
        Me.Close()
    End Sub

    Private Sub LabelX3_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs) Handles GroupBox1.Enter

    End Sub

    Public class_roll_no As String
    Private Sub tdbViewer_MouseDown(sender As Object, e As MouseEventArgs) Handles tdbViewer.MouseDown

        Dim row As Integer = tdbViewer.Row
        txtStudentID.Text = tdbViewer(row, "studentid")
        class_roll_no = tdbViewer(row, "class_roll_no")

    End Sub

    Private Sub Panel1_Paint(sender As Object, e As PaintEventArgs)

    End Sub

    Private Sub lblName_Click(sender As Object, e As EventArgs) Handles lblName.Click

    End Sub

    Private Sub cmbCourse_KeyDown(sender As Object, e As KeyEventArgs) Handles cmbCourse.KeyDown
        If e.KeyCode = Keys.Enter Then
            Try
                Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
                Me.txtCourseID.Text = drv.Item("id").ToString
                cmbBatch.Focus()
            Catch ex As Exception
                Me.txtCourseID.Text = ""
            End Try
            '         cmbBatch.Text = Focus()
        End If
    End Sub

    Private Sub cmbBatch_KeyDown(sender As Object, e As KeyEventArgs) Handles cmbBatch.KeyDown
        If e.KeyCode = Keys.Enter Then
            Try
                Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
                Me.txtBatchID.Text = drv.Item("id").ToString
                cmbStudentList.Focus()
            Catch ex As Exception
                Me.txtBatchID.Text = ""
            End Try
        End If
    End Sub

    Private Sub cmbStudentList_KeyDown(sender As Object, e As KeyEventArgs) Handles cmbStudentList.KeyDown
        Try
            Dim drv As DataRowView = DirectCast(cmbStudentList.SelectedItem, DataRowView)
            Me.txtAdmissionNo.Text = drv.Item("admission_no").ToString
            Me.txtStudentID.Text = drv.Item("studentid").ToString
            class_roll_no = drv.Item("class_roll_no").ToString
            PERSON_ID = drv.Item("person_id").ToString
            getListOfId(PERSON_ID)

            '    btnSearchCondition_Click(sender, e)

        Catch ex As Exception
            Me.txtStudentID.Text = ""
            Me.txtAdmissionNo.Text = ""
        End Try
    End Sub

    Dim ListOfID As String
    Private Sub getListOfId(pERSON_ID As Integer)
        ListOfID = ""
        Dim dt As DataTable = DataSource(String.Format("SELECT 	students.id 
                FROM
	                person
	                INNER JOIN students ON person.person_id = students.person_id 
                WHERE
	                person.status_type_id NOT IN (0,2)
	                AND students.status_type_id = 1
	                AND person.person_id = '" & pERSON_ID & "'"))
        If dt.Rows.Count > 0 Then
            For Each row As DataRow In dt.Rows
                If ListOfID = "" Then
                    ListOfID = row.Item("id")
                Else
                    ListOfID += "," & row.Item("id")
                End If
            Next

        End If

    End Sub

    Private Sub dtpPayDate_KeyDown(sender As Object, e As KeyEventArgs) Handles dtpPayDate.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtORNo.Focus()
        End If
    End Sub

    Private Sub txtORNo_KeyDown(sender As Object, e As KeyEventArgs) Handles txtORNo.KeyDown
        If e.KeyCode = Keys.Enter Then
            txtRemarks.Focus()
        End If
    End Sub

    Private Sub txtRemarks_KeyDown(sender As Object, e As KeyEventArgs) Handles txtRemarks.KeyDown
        If e.KeyCode = Keys.Enter Then
            diAmount.Focus()
        End If
    End Sub

    Private Sub diAmount_KeyDown(sender As Object, e As KeyEventArgs) Handles diAmount.KeyDown
        If e.KeyCode = Keys.Enter Then
            btnPost.Focus()
        End If
    End Sub

    Private Sub cmbCourse_SelectedValueChanged(sender As Object, e As EventArgs) Handles cmbCourse.SelectedValueChanged

        'Try
        '    Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
        '    Me.txtBatchID.Text = drv.Item("id").ToString
        '    cmbStudentList.Focus()
        'Catch ex As Exception
        '    Me.txtBatchID.Text = ""
        'End Try
        'CheckBox1_Click(sender, e)

    End Sub

    Private Sub CheckBox1_Click(sender As Object, e As EventArgs) Handles CheckBox1.Click

        If CheckBox1.Checked = True And cmbCourse.SelectedIndex > -1 Then

            Dim SQLEX As String = " "
            SQLEX = "SELECT
	                    batches.id,
                    NAME 
                    FROM
	                    batches
	                    INNER JOIN courses ON ( batches.course_id = courses.id ) 
                    WHERE
	                    batches.is_deleted = 0 
	                    AND batches.is_active = 1 
	                    AND course_name = '" & cmbCourse.Text & "' 
	                    and batches.school_year = '" & Date.Now.AddYears(-1).Year & "'"

            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            cmbBatch.DataSource = MeData

            cmbBatch.ValueMember = "id"
            cmbBatch.DisplayMember = "name"

            cmbBatch.SelectedIndex = -1
            txtBatchID.Text = ""

        Else

            displayBatches()

        End If

    End Sub


    Private Sub cmbyearbatch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbyearbatch.SelectedIndexChanged

        If cmbyearbatch.Focused Then
            Try

                Dim drv As DataRowView = DirectCast(cmbyearbatch.SelectedItem, DataRowView)
                _school_year = drv.Item("name").ToString
                Me.cmbyearbatch.Text = drv.Item("name").ToString
                displayBatches()


            Catch ex As Exception
                cmbyearbatch.Text = ""
            End Try
        End If


    End Sub

    Private Sub PAYMENTDETAILS_FORM_CLOSING() Handles PAYMENTDETAILS.FORM_CLOSING

        PAYMENTDETAILS = Nothing
        btnClearFilter.PerformClick()
    End Sub

    Private Sub dtpDateEnroll_ValueChanged(sender As Object, e As EventArgs) Handles dtpDateEnroll.ValueChanged
        displayCheckerStudent()
    End Sub

    Private Sub displayCheckerStudent()

        GridControl1.DataSource = DataSource(String.Format("SELECT
	person.person_id AS `Person ID`, 
	person.display_name AS `Student Name`, 
	students.admission_no AS `Admission No.`, 
	courses.course_name AS Program, 
	batches.`name` AS `Batch Name`, 
	Count(students_subjects.subject_id) AS `Total Subject`, 
	users.username 'Encoder UserName'
FROM
	students
	INNER JOIN
	person
	ON 
		students.person_id = person.person_id
	INNER JOIN
	courses
	ON 
		students.course_id = courses.id
	INNER JOIN
	batches
	ON 
		students.batch_id = batches.id
	LEFT JOIN
	students_subjects
	ON 
		students.id = students_subjects.student_id
	INNER JOIN
	users
	ON 
		students.user_id = users.id
WHERE
	students.admission_date = '" & Format(dtpDateEnroll.Value, "yyyy-MM-dd") & "'
GROUP BY
	display_name
ORDER BY
	display_name ASC"))

    End Sub

    Private Sub lblGrant_TextChanged(sender As Object, e As EventArgs) Handles lblGrant.TextChanged
        If lblGrant.Text = "" Then
            cxbxFullPayment.Visible = False
            cbxdiscount.Visible = False
        Else
            If FullDeduct = "Yes" Then
                cxbxFullPayment.Visible = True
            Else
                If is_grant = 0 Then
                    cbxdiscount.Visible = True
                Else
                    cbxdiscount.Visible = False
                End If
            End If
        End If

    End Sub



    Private Sub cxbxFullPayment_CheckStateChanged(sender As Object, e As EventArgs) Handles cxbxFullPayment.CheckStateChanged
        If cxbxFullPayment.Checked = True Then
            txtORNo.Text = "000-000"
            txtRemarks.Text = "Scholarship Grant:" & lblGrant.Text

            Dim mBalance As Double = 0


            mBalance = CDbl(lblBalance.Text)

            diAmount.Value = mBalance
            btnPost.Enabled = True
            btnPost.PerformClick()
        Else
            txtORNo.Text = ""
            txtRemarks.Text = ""



            diAmount.Value = 0


        End If
    End Sub

    Private Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged
        Dim rbtn As RadioButton = sender
        _student_category_id = rbtn.Tag
        displayCourse()
    End Sub

    Private Sub RadioButton2_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton2.CheckedChanged
        Dim rbtn As RadioButton = sender
        _student_category_id = rbtn.Tag
        displayCourse()
    End Sub

    Private Sub RadioButton3_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton3.CheckedChanged
        Dim rbtn As RadioButton = sender
        _student_category_id = rbtn.Tag
        displayCourse()
    End Sub

    Private Sub RadioButton4_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton4.CheckedChanged
        Dim rbtn As RadioButton = sender
        _student_category_id = rbtn.Tag
        displayCourse()
    End Sub

    Private Sub cbxdiscount_CheckStateChanged(sender As Object, e As EventArgs) Handles cbxdiscount.CheckStateChanged
        If cbxdiscount.Checked = True Then

            txtRemarks.Text = "Scholarship Grant:" & lblGrant.Text

            diAmount.Value = grand_amount
            btnPost.Enabled = True
            btnPost.PerformClick()
        Else
            txtORNo.Text = ""
            txtRemarks.Text = ""

            diAmount.Value = 0


        End If
    End Sub
End Class