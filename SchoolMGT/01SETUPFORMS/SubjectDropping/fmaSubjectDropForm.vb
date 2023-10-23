Imports System.ComponentModel
Imports MySql.Data.MySqlClient

Public Class fmaSubjectDropForm

    Private IS_ENROLLED As Boolean = False

    Private TuitionFee_Lec As Double = 0
    Private TuitionFee_lab As Double = 0

    Private TOTAL_PAYABLES As Double = 0

    Private display_TuitionFee_Lec As String = ""
    Private display_TuitionFee_lab As String = ""

    Private HAS_EXISTING_ASSESSMENT As Boolean = False

    Private m_AsyncWorker As New BackgroundWorker()

    Private HasLab As Boolean = False
    Dim ListModel As New StudentLearnersListModel



    Private cellRowIndex As Integer = 0
    Private cellColIndex As Integer = 0
    Private hasExistingPayment As Boolean = 0


    Private CLASS_SCHED As DataTable

    Dim WithEvents addSubj As fmaAddSubjectForm = Nothing

    Dim dgvcc As New DataGridViewComboBoxCell

    Private ROWSELECT As Integer = -1

    Dim FirstLoad As Boolean = True

    Public CourseID As Integer
    Public BatchID As Integer

    Dim StudentSubjectSysPK As String = ""


    Dim deletedSubjectlist As New List(Of Integer)


    Private Sub fmaSubjectDropForm_Load(sender As Object, e As EventArgs) Handles Me.Load
        loadAdjustmentHeader()
        ReloadAllDisplay()


    End Sub

    Private Sub ReloadAllDisplay()
        displayStudentsSubj()
        computeTuitionFee()
        displayStudentFees()

        displayRate()

    End Sub

    Private Sub displayRate()
        rate_per_unit = DataObject(String.Format("SELECT rate FROM student_rate WHERE person_id = '" & PERSON_ID & "'"))
        lblRate.Text = rate_per_unit

        If rate_per_unit > 0 Then
            chkApplyRate.Enabled = True
        Else
            chkApplyRate.Enabled = False
        End If
    End Sub

    Dim Adjustment As New DataTable
    Private Sub loadAdjustmentHeader()
        Adjustment.Columns.Add("ID")
        Adjustment.Columns.Add("LEC AMT")
        Adjustment.Columns.Add("LAB AMT")
    End Sub

    Private Sub displayStudentsSubj()

        dgvSubjects.Rows.Clear()

        Try

            Dim SQLEX As String = ""

            If Me.txtCategoryName.Text = "COLLEGE" Then
                SQLEX = "SELECT
			no_exams,
			lab_name,
			CASE WHEN stdsub_lab_amount = 0 THEN lab_amount
			     ELSE stdsub_lab_amount END AS 'lab_amount',		     			
			admission_no,
			subjCode,
			subjname,
            credit_hours,
			CASE WHEN stdsub_lec_amount = 0 THEN amount
		     ELSE stdsub_lec_amount END AS 'amount',
			subjid,
			NAME,
			room,
			employee_name,
			course_name,
			classcode,
            stdSubid
			FROM(		
					SELECT
						subjects.no_exams,
						IFNULL( subject_laboratory.lab_name, '' ) 'lab_name',
						IFNULL( subject_laboratory.amount, 0 ) 'lab_amount',
						students.admission_no,
						subjects.CODE 'subjCode',
						subjects.NAME 'subjname',
						subjects.credit_hours,
						subjects.amount,
						subjects.id 'subjid',
						subject_class_schedule.NAME,
						subject_class_schedule.room,
						subject_class_schedule.employee_name,
						courses.course_name,
						subject_class_schedule.`code` 'classcode',
					  IFNULL(students_subjects.lab_amt,0) 'stdsub_lab_amount',
						IFNULL(students_subjects.lec_amt,0) 'stdsub_lec_amount',
                        students_subjects.id 'stdSubid'
					FROM
						students_subjects
						INNER JOIN students ON ( students_subjects.student_id = students.id )
						INNER JOIN batches ON ( students_subjects.batch_id = batches.id )
						INNER JOIN courses ON ( batches.course_id = courses.id )
						INNER JOIN subjects ON ( students_subjects.subject_id = subjects.id )
						LEFT JOIN subject_class_schedule ON ( students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item )
						LEFT JOIN subject_laboratory ON ( subjects.sub_lab_id = subject_laboratory.id ) 
						
					WHERE
						student_id = '" & txtStudentID.Text & "'
						)A  "

                'SQLEX = "SELECT  subjects.no_exams,"
                'SQLEX += " IFNULL(subject_laboratory.lab_name,'')'lab_name',"
                'SQLEX += " IFNULL(subject_laboratory.amount,0) 'lab_amount',students.admission_no"
                'SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
                'SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid'"
                'SQLEX += ", subject_class_schedule.name"
                'SQLEX += ", subject_class_schedule.room"
                'SQLEX += ", subject_class_schedule.employee_name"
                'SQLEX += ", courses.course_name,subject_class_schedule.`code` 'classcode'"
                'SQLEX += " FROM students_subjects"
                'SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
                'SQLEX += " INNER JOIN batches ON (students_subjects.batch_id = batches.id)"
                'SQLEX += " INNER JOIN courses ON (batches.course_id = courses.id)"
                'SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
                'SQLEX += " LEFT JOIN subject_class_schedule"
                'SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
                'SQLEX += " LEFT JOIN subject_laboratory ON ( subjects.sub_lab_id = subject_laboratory.id )"
                'SQLEX += " WHERE student_id='" & txtStudentID.Text & "'"


            Else
                SQLEX = "SELECT  students.admission_no"
                SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
                SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid'"
                SQLEX += ", subject_class_schedule.name"
                SQLEX += ", subject_class_schedule.room"
                SQLEX += ", subject_class_schedule.employee_name"
                SQLEX += ", courses.course_name,subject_class_schedule.`code` 'classcode'"
                SQLEX += " FROM students_subjects"
                SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
                SQLEX += " INNER JOIN batches ON (students_subjects.batch_id = batches.id)"
                SQLEX += " INNER JOIN courses ON (batches.course_id = courses.id)"
                SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
                SQLEX += " LEFT JOIN subject_class_schedule"
                SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
                SQLEX += " WHERE student_id='" & txtStudentID.Text & "'"


            End If


            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then
                For cnt As Integer = 0 To MeData.Rows.Count - 1
                    Dim subjID As String = MeData.Rows(cnt).Item("subjid").ToString()

                    Dim subjlist As New List(Of Object)
                    subjlist.Add(MeData.Rows(cnt).Item("subjid").ToString())
                    'subjlist.Add(MeData.Rows(cnt).Item("batchname").ToString())
                    subjlist.Add(MeData.Rows(cnt).Item("subjCode").ToString())
                    '    subjlist.Add(MeData.Rows(cnt).Item("classcode").ToString())
                    subjlist.Add(MeData.Rows(cnt).Item("subjname").ToString())
                    subjlist.Add(MeData.Rows(cnt).Item("credit_hours").ToString())
                    dgvSubjects.Rows.Add(subjlist.ToArray)


                    dgvcc.DisplayMember = "name"
                    dgvcc.ValueMember = "SysPK_Item"
                    dgvcc.FlatStyle = FlatStyle.Popup
                    dgvcc = dgvSubjects.Rows(cnt).Cells(4)

                    Dim SQLEXSUBJ As String = "SELECT SysPK_Item,name,room,employee_name FROM subject_class_schedule"
                    SQLEXSUBJ += " WHERE subject_id='" & subjID & "'"
                    CLASS_SCHED = clsDBConn.ExecQuery(SQLEXSUBJ)

                    If CLASS_SCHED.Rows.Count > 0 Then
                        For comboRowCount As Short = 0 To CLASS_SCHED.Rows.Count - 1

                            Dim cmbItem As String = CLASS_SCHED.Rows(comboRowCount).Item("name").ToString
                            dgvcc.Items.Add(cmbItem)

                            If StudentSubjectSysPK = "" Then
                                StudentSubjectSysPK = CLASS_SCHED.Rows(comboRowCount).Item("SysPK_Item").ToString
                            Else
                                StudentSubjectSysPK = StudentSubjectSysPK + "," + CLASS_SCHED.Rows(comboRowCount).Item("SysPK_Item").ToString
                            End If

                        Next
                    Else
                        dgvcc.Items.Add("NO SCHED SET")

                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("name").ToString()) Then
                        dgvSubjects.Item(4, cnt).Value = MeData.Rows(cnt).Item("name").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("classcode").ToString()) Then
                        dgvSubjects.Item(5, cnt).Value = MeData.Rows(cnt).Item("classcode").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("room").ToString()) Then
                        dgvSubjects.Item(6, cnt).Value = MeData.Rows(cnt).Item("room").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("employee_name").ToString()) Then
                        dgvSubjects.Item(7, cnt).Value = MeData.Rows(cnt).Item("employee_name").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("course_name").ToString()) Then
                        dgvSubjects.Item(8, cnt).Value = MeData.Rows(cnt).Item("course_name").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("no_exams").ToString()) Then
                        dgvSubjects.Item(9, cnt).Value = MeData.Rows(cnt).Item("no_exams").ToString()
                    End If
                    If Not IsDBNull(MeData.Rows(cnt).Item("lab_name").ToString()) Then
                        dgvSubjects.Item(10, cnt).Value = MeData.Rows(cnt).Item("lab_name").ToString()
                    End If
                    If Not IsDBNull(MeData.Rows(cnt).Item("lab_amount").ToString()) Then
                        dgvSubjects.Item(11, cnt).Value = MeData.Rows(cnt).Item("lab_amount").ToString()
                    End If

                    If Not IsDBNull(MeData.Rows(cnt).Item("credit_hours").ToString()) Then
                        dgvSubjects.Item(12, cnt).Value = MeData.Rows(cnt).Item("credit_hours").ToString()
                    End If
                    If Not IsDBNull(MeData.Rows(cnt).Item("amount").ToString()) Then
                        dgvSubjects.Item(13, cnt).Value = MeData.Rows(cnt).Item("amount").ToString()
                    End If
                    If Not IsDBNull(MeData.Rows(cnt).Item("stdSubid").ToString()) Then
                        dgvSubjects.Item(14, cnt).Value = MeData.Rows(cnt).Item("stdSubid").ToString()
                    End If


                Next

            End If


            'Dim subjectList As New DataTable

            'subjectList.Columns.Add("Subject Code")
            'subjectList.Columns.Add("Subject Name")
            'subjectList.Columns.Add("Unit/S")


            getTotalUnits()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try



    End Sub

    Private Sub getTotalUnits()
        Dim totalUnits As Double = 0


        For nCtr As Integer = 0 To dgvSubjects.Rows.Count - 1
            Dim value As Double = CDbl(dgvSubjects.Item(3, nCtr).Value)

            totalUnits += value
        Next

        Me.txtNoOfUnits.Text = Format(totalUnits, "#.00")
    End Sub

    Private Sub ButtonX1_Click(sender As Object, e As EventArgs) Handles ButtonX1.Click
        Me.Close()
    End Sub

    Private Sub dgvSubjects_CellClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvSubjects.CellClick
        btnRemove.Enabled = True

        Try
            ROWSELECT = e.RowIndex

            Dim currentRow As DataGridViewRow = dgvSubjects.Rows(ROWSELECT)


            txtSubjectID.Text = currentRow.Cells(0).Value
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click

        TuitionFee_Lec = 0
        TuitionFee_lab = 0
        ROWSELECT = dgvSubjects.CurrentRow.Index

        Dim currentRow As DataGridViewRow = dgvSubjects.Rows(ROWSELECT)


        txtSubjectID.Text = currentRow.Cells(0).Value


        If MessageBox.Show("Are sure you want to Remove Subject from this student?", "Please Verify !", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            'Dim SQLDEL As String = "DELETE FROM students_subjects"
            'SQLDEL += " WHERE student_id='" & Me.txtStudentID.Text & "'"
            'SQLDEL += " AND subject_id='" & Me.txtSubjectID.Text & "'"

            'If clsDBConn.Execute(SQLDEL) Then
            '    MsgBox("Subject has been deleted.")
            '    displayFilterCategory()

            'End If
            deletedSubjectlist.Add(txtSubjectID.Text)


            dgvSubjects.Rows.RemoveAt(dgvSubjects.CurrentRow.Index)
            getTotalUnits()
            btnSave.Enabled = True
        End If

        computeTuitionFee()
        displayStudentFees()

    End Sub

    Private Sub dgvSubjects_SelectionChanged(sender As Object, e As EventArgs) Handles dgvSubjects.SelectionChanged

        Try
            ROWSELECT = dgvSubjects.CurrentRow.Index

            Dim currentRow As DataGridViewRow = dgvSubjects.Rows(ROWSELECT)


            txtSubjectID.Text = currentRow.Cells(0).Value
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Information)
        End Try


    End Sub

    Public Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        'remove students_subject
        If deletedSubjectlist.Count > 0 Then
            For Each number As Integer In deletedSubjectlist
                Console.WriteLine("FOR EACH: {0}", number)

                Dim SQLDEL As String = "DELETE FROM students_subjects"
                SQLDEL += " WHERE student_id='" & Me.txtStudentID.Text & "'"
                SQLDEL += " AND subject_id='" & number & "'"

                If clsDBConn.Execute(SQLDEL) Then


                End If

            Next
        End If

        If Adjustment.Rows.Count > 0 Then

            For Each row As DataRow In Adjustment.Rows

                DataSource(String.Format("UPDATE 
                                          `students_subjects` 
                                        SET
                                          `lec_amt` = '" & row("LEC AMT") & "',
                                          `lab_amt` = '" & row("LAB AMT") & "'
                                        WHERE `id` = '" & row("ID") & "' ;
                                        "))

            Next


        End If



        'update running balance
        setRunningBalance()
        'Save assessment
        saveStudentAssessment()
        btnSave.Enabled = False


    End Sub

    Private Sub PrintAssessment(EnrolledStatus As String)

        Dim SQLEX As String = ""
        If Me.txtCategoryName.Text = "COLLEGE" Then
            SQLEX = "SELECT  students.admission_no"
            SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
            SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid',subjects.no_exams"
            SQLEX += ", subject_class_schedule.name"
            SQLEX += ", subject_class_schedule.room"
            SQLEX += ", UPPER(subject_class_schedule.employee_name) 'employee_name', students.is_enrolled,DATE_FORMAT(students.admission_date,'%M %d,%Y')'admission_date'"
            SQLEX += " FROM students_subjects"
            SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
            SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
            SQLEX += " LEFT JOIN subject_class_schedule"
            SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
            SQLEX += " WHERE admission_no='" & txtAdmissionNo.Text & "'"
        Else

            SQLEX = "SELECT  students.admission_no"
            SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
            SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid',subjects.no_exams"
            SQLEX += ", subject_class_schedule.name"
            SQLEX += ", subject_class_schedule.room"
            SQLEX += ", UPPER(subject_class_schedule.employee_name) 'employee_name', students.is_enrolled,DATE_FORMAT(students.admission_date,'%M %d,%Y')'admission_date'"
            SQLEX += " FROM students_subjects"
            SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
            SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
            SQLEX += " LEFT JOIN subject_class_schedule"
            SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
            SQLEX += " WHERE admission_no='" & txtAdmissionNo.Text & "'"
        End If


        displayStudentsSubj()
        computeTuitionFee()
        displayStudentFees()

        'If MessageBox.Show("STUDENT ASSESSMENT FOR :" & Me.txtStudentName.Text & " HAS BEEN CHANGE..." & vbNewLine & vbNewLine _
        '                   & "DO YOU WANT TO PRINT ASSESSMENT?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then

        '    If Not hasExistingPayment Then

        '        displayStudentPayable()
        '        setRunningBalance()
        '        saveStudentAssessment()
        '    End If


        Dim new_report As New fzzReportViewerForm
            new_report.FolderName = "STUDENT ASSESSMENT SHEET"
            new_report.AttachReport(SQLEX, "ASSESSMENT " & Me.txtAdmissionNo.Text) =
        New rpt_CollegeStudentAssessmentReport(Me.txtSY.Text, Me.txtAdmissionNo.Text, Me.txtStudentName.Text,
                                               Me.txtCourse.Text, "", Me.txtSemester.Text, Me.txtYearLvl.Text, EnrolledStatus)

            new_report.Show()

        'Else
        '    '        displayStudentPayable()
        '    '     setRunningBalance()
        '    '      saveStudentAssessment()

        '    Dim new_report As New fzzReportViewerForm
        '    new_report.FolderName = "STUDENT ASSESSMENT SHEET"
        '    new_report.AttachReport(SQLEX, "ASSESSMENT " & Me.txtAdmissionNo.Text) =
        'New rpt_CollegeStudentAssessmentReport(Me.txtSY.Text, Me.txtAdmissionNo.Text, Me.txtStudentName.Text,
        '                                       Me.txtCourse.Text, "", Me.txtSemester.Text, Me.txtYearLvl.Text, EnrolledStatus)

        '    MsgBox("Student Assessment has been saved to 'STUDENT ASSESSMENT SHEET'", MsgBoxStyle.OkOnly, "SAVED DOCUMENTS")
        'End If


    End Sub



    Private Sub setRunningBalance()

        'total paid
        ' check all payments
        Dim SQLPaymentsmade As String = "SELECT amount FROM finance_transactions"
        SQLPaymentsmade += " WHERE finance_id = '4'"
        SQLPaymentsmade += " AND student_id='" & txtStudentID.Text & "'"
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
        TOTAL_PAYABLES = TOTAL_PAYABLES - TOTALPAYMENTSMADE

        Dim SQLUP As String = "UPDATE students SET"
        SQLUP += " bal_edit='1',"
        SQLUP += " runningbalance='" & TOTAL_PAYABLES & "'"
        SQLUP += " WHERE id='" & txtStudentID.Text & "'"
        clsDBConn.ExecuteSilence(SQLUP)

        Dim SQLTR As String = "SELECT student_id FROM finance_transactions"
        SQLTR += " WHERE student_id='" & txtStudentID.Text & "'"
        MeData = Nothing

        MeData = clsDBConn.ExecQuery(SQLTR)

        If MeData.Rows.Count > 0 Then
            Exit Sub
        End If



        Dim SQLEX As String = "SELECT bal_edit FROM students"
        SQLEX += " WHERE id='" & txtStudentID.Text & "'"


        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then

            Dim EditRunningBalance As String = MeData.Rows(0).Item("bal_edit").ToString


            SQLUP = "UPDATE students SET"
            SQLUP += " bal_edit='1',"
            SQLUP += " runningbalance='" & TOTAL_PAYABLES & "'"
            SQLUP += " WHERE id='" & txtStudentID.Text & "'"
            clsDBConn.ExecuteSilence(SQLUP)

        End If


    End Sub

    Private Sub saveStudentAssessment()

        'remove all assessment first
        Dim SQLDEL As String = "DELETE FROM students_assessment WHERE student_id='" & Me.txtStudentID.Text & "'"
        clsDBConn.ExecuteSilence(SQLDEL)

        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1

            Dim SQLIN As String = ""



            If dgvFEES.Item(1, nCtr).Value.ToString = "" And dgvFEES.Item(2, nCtr).Value.ToString = "" Then

                SQLIN = "INSERT INTO students_assessment(student_id,masterfee,particulars,amount,total,stat,columnName, finance_fee_particular_id)"
                SQLIN += " VALUES("

                SQLIN += String.Format("'{0}'", Me.txtStudentID.Text)
                SQLIN += String.Format(",'{0}', '{1}'", dgvFEES.Item(0, nCtr).Value, dgvFEES.Item(1, nCtr).Value)
                SQLIN += String.Format(",'{0}', '{1}'", dgvFEES.Item(2, nCtr).Value, dgvFEES.Item(3, nCtr).Value)
                SQLIN += String.Format(",'{0}','{1}', '0')", dgvFEES.Item(4, nCtr).Value, "H")
            Else

                Dim detAmount As Double = 0

                Try
                    detAmount = dgvFEES.Item(2, nCtr).Value
                Catch ex As Exception

                End Try

                Dim finance_particular_fee_id As Integer = 0
                If dgvFEES.Item(6, nCtr).Value = "" Then
                    finance_particular_fee_id = 0
                Else
                    finance_particular_fee_id = CInt(dgvFEES.Item(6, nCtr).Value)
                End If

                'adjust detail amount from existing payment
                Dim SQL_DetailPayment As String = "SELECT SUM(`amount`) 'total_amount', `finance_fee_paticulars_id` "
                SQL_DetailPayment += " FROM `finance_transactions_onetime_payments` WHERE student_id='" & Me.txtStudentID.Text & "'"
                SQL_DetailPayment += " AND finance_fee_paticulars_id='" & finance_particular_fee_id & "'"

                Dim detailPaymentTable As DataTable
                detailPaymentTable = clsDBConn.ExecQuery(SQL_DetailPayment)

                If detailPaymentTable.Rows.Count > 0 Then
                    Try
                        Dim total_amount As Double = CDbl(detailPaymentTable.Rows(0).Item("total_amount"))

                        detAmount = detAmount - total_amount
                    Catch ex As Exception

                    End Try
                End If


                SQLIN = "INSERT INTO students_assessment(student_id,masterfee,particulars,amount,total,stat,columnName, finance_fee_particular_id, running_balance)"
                SQLIN += " VALUES("

                SQLIN += String.Format("'{0}'", Me.txtStudentID.Text)
                SQLIN += String.Format(",'{0}', '{1}'", dgvFEES.Item(0, nCtr).Value, dgvFEES.Item(1, nCtr).Value)
                SQLIN += String.Format(",'{0}', '{1}'", dgvFEES.Item(2, nCtr).Value, dgvFEES.Item(3, nCtr).Value)
                SQLIN += String.Format(",'{0}','{1}','{2}', '{3}')", dgvFEES.Item(4, nCtr).Value, "D", finance_particular_fee_id, detAmount)
            End If



            clsDBConn.Execute(SQLIN)
        Next


    End Sub

    Private Sub computeTuitionFee()
        TuitionFee_lab = 0
        TuitionFee_Lec = 0

        If Me.txtCategoryID.Text = "13" Then

            Dim rowcount As Integer = dgvSubjects.Rows.Count

            For nCtr As Integer = 0 To dgvSubjects.Rows.Count - 1

                Dim flag As String = dgvSubjects.Item(7, nCtr).Value.ToString
                Dim no_exams As String = dgvSubjects.Item("no_exams", nCtr).Value.ToString



                Dim amount As Double = CDbl(dgvSubjects.Item("amount", nCtr).Value.ToString)
                Dim Unit As Double = CDbl(dgvSubjects.Item("credit_hours", nCtr).Value.ToString)


                If no_exams = "False" Then '"0" 
                    TuitionFee_Lec += Unit * amount
                    Dim lab_name As String = dgvSubjects.Item("lab_name", nCtr).Value.ToString
                    Dim lab_amt As Double = dgvSubjects.Item("lab_amount", nCtr).Value.ToString
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

    Private Function AddFees(mode_payment As String, enroll_status As String, semester As String) As DataTable

        If enroll_status = "NEW" Or enroll_status = "TRANFEREE" Then
            enroll_status = "NEW"
        Else
            enroll_status = "OLD"
        End If

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                    fees_protocol.id,
                    fees_protocol.enroll_status,
                    fees_protocol.mode_payment,
                    fees_protocol.semester,
                    fees_protocol.`trigger`
                    FROM
                    fees_protocol
                    WHERE
                    fees_protocol.mode_payment = '" & mode_payment & "' AND
                    fees_protocol.enroll_status = '" & enroll_status & "' AND
                    fees_protocol.semester = '" & semester & "'
                    "))
        Return dt
    End Function


    Private Sub displayStudentFees()
        Dim dt_fees As New DataTable
        Dim SQLEX As String = ""
        Dim MeData As DataTable


        Dim checkPaymentExists As String = "SELECT COUNT( finance_transactions.amount) 'payment'"
        checkPaymentExists += " FROM  finance_transactions"
        checkPaymentExists += " INNER JOIN students "
        checkPaymentExists += " ON (finance_transactions.student_id = students.id)"
        checkPaymentExists += " WHERE students.admission_no='" & Me.txtAdmissionNo.Text & "'"

        Dim Paymentdata As DataTable

        Paymentdata = clsDBConn.ExecQuery(checkPaymentExists)

        If Paymentdata.Rows.Count > 0 Then
            Try
                Dim count As Integer = CInt(Paymentdata.Rows(0).Item("payment").ToString)

                If count > 0 Then
                    dgvFEES.ReadOnly = True
                    hasExistingPayment = True
                Else
                    dgvFEES.ReadOnly = False
                    hasExistingPayment = False
                End If
            Catch ex As Exception
                hasExistingPayment = False
            End Try
        End If




        Dim rePrintCheck_Assessment As Integer = DataObject(String.Format("SELECT _checking.assessment_reprint FROM _checking"))

        If rePrintCheck_Assessment = 0 Then

#Region "Old"
            'CHECK IF ASSESSMENT WAS ALREADY CREATED.
            Dim SQLEXIST As String = "SELECT masterfee,particulars,amount,total,stat,columnName FROM students_assessment"
            SQLEXIST += " WHERE student_id ='" & Me.txtStudentID.Text & "'"

            Dim ExistingData As DataTable

            ExistingData = clsDBConn.ExecQuery(SQLEXIST)

            If ExistingData.Rows.Count > 0 Then

                dt_fees.Columns.Add("FEE DESCRIPTION")
                dt_fees.Columns.Add("PARTICULARS")
                dt_fees.Columns.Add("AMOUNT")
                dt_fees.Columns.Add("TOTAL")
                dt_fees.Columns.Add("STAT")

                dgvFEES.Rows.Clear()

                SQLEX = "SELECT masterfee,particulars,amount,total,stat,columnName,finance_fee_particular_id FROM students_assessment"
                SQLEX += " WHERE student_id ='" & Me.txtStudentID.Text & "'"



                MeData = clsDBConn.ExecQuery(SQLEX)

                If MeData.Rows.Count > 0 Then

                    For nCtr As Integer = 0 To MeData.Rows.Count - 1
                        dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("masterfee").ToString,
                                                  MeData.Rows(nCtr).Item("particulars").ToString,
                                                  MeData.Rows(nCtr).Item("amount").ToString,
                                                  MeData.Rows(nCtr).Item("total").ToString,
                                                  MeData.Rows(nCtr).Item("stat").ToString,
                                                  MeData.Rows(nCtr).Item("columnName").ToString,
                                                  MeData.Rows(nCtr).Item("finance_fee_particular_id").ToString})
                        dt_fees.Rows.Add(New String() {MeData.Rows(nCtr).Item("masterfee").ToString,
                                                  MeData.Rows(nCtr).Item("particulars").ToString,
                                                  MeData.Rows(nCtr).Item("amount").ToString,
                                                  MeData.Rows(nCtr).Item("total").ToString})




                    Next

                End If


                'dgvFEES.ReadOnly = True
                'btnPrintAssessment.Text = "Update and Re-Print Assesment"
                HAS_EXISTING_ASSESSMENT = True
                Exit Sub
            End If
#End Region

        End If

        'NO ASSESSMENT CREATED.
        Dim TOTAL_FEES As Double = 0

        dt_fees.Columns.Add("FEE DESCRIPTION")
        dt_fees.Columns.Add("PARTICULARS")
        dt_fees.Columns.Add("AMOUNT")
        dt_fees.Columns.Add("TOTAL")
        dt_fees.Columns.Add("STAT")
        dt_fees.Columns.Add("COLUMNNAME")
        dt_fees.Columns.Add("PART_ID")

        dgvFEES.Rows.Clear()




        'If Me.txtCategoryName.Text = "COLLEGE" Then
        '    ' add tuition according to enrolled subject
        '    dgvFEES.Rows.Add(New String() {"TUITION", "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-"})
        '    dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True

        '    dt_fees.Rows.Add(New String() {"TUITION", "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-"})
        '    If TuitionFee_Lec <> 0 Then
        '        dgvFEES.Rows.Add(New String() {"", "TUITION FEE LEC", Format(TuitionFee_Lec, "#,##0.00"), "", "-"})
        '        dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True

        '        dt_fees.Rows.Add(New String() {"", "TUITION FEE LEC", Format(TuitionFee_Lec, "#,##0.00"), "", "-"})

        '    End If

        '    If TuitionFee_lab <> 0 Then
        '        dgvFEES.Rows.Add(New String() {"", "TUITION FEE LAB", Format(TuitionFee_lab, "#,##0.00"), "", "-"})
        '        dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True
        '        dt_fees.Rows.Add(New String() {"", "TUITION FEE LAB", Format(TuitionFee_lab, "#,##0.00"), "", "-"})
        '    End If
        'End If


        SQLEX = "SELECT finance_fee_categories.id, finance_fee_categories.name, SUM(finance_fee_particulars.amount),finance_fee_particulars.mode_payments,students.batch_id,students.enrollmentAS,students.class_roll_no"
        SQLEX += " FROM students"
        SQLEX += " INNER JOIN finance_fee_categories "
        SQLEX += " On (students.batch_id = finance_fee_categories.batch_id)"
        SQLEX += " INNER JOIN finance_fee_particulars "
        SQLEX += " On (finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id)"
        SQLEX += " And finance_fee_particulars.is_deleted='0'"
        SQLEX += " WHERE students.admission_no='" & txtAdmissionNo.Text & "'"
        SQLEX += " GROUP BY finance_fee_categories.name"
        SQLEX += " ORDER BY id"

        MeData = Nothing
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim catname As String = ""
        Dim catid As String = ""
        Dim TotalAmt As String = ""
        Dim dt_fees_policy As New DataTable

        If MeData.Rows.Count > 0 Then
            For cnt As Integer = 0 To MeData.Rows.Count - 1

                'catname = MeData.Rows(cnt).Item("name").ToString
                'catid = MeData.Rows(cnt).Item("id").ToString
                'TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                'If MeData.Rows(cnt).Item("name").ToString = "ATHLETIC FEE" Then
                '    MsgBox("")
                'End If

                Dim mode_payment As String = MeData.Rows(cnt).Item("mode_payments").ToString
                Dim enroll_status As String = MeData.Rows(cnt).Item("enrollmentAS").ToString
                Dim class_roll_no As String = MeData.Rows(cnt).Item("class_roll_no").ToString
                Dim semester As String = txtSemester.Text

                dt_fees_policy = AddFees(mode_payment, enroll_status, semester)

                If dt_fees_policy.Rows.Count > 0 Then

                    If mode_payment = 3 And enroll_status = "OLD" And semester = "2ND SEMESTER" Then
                        Dim count As Integer = 0
                        count = DataObject(String.Format("SELECT count(DATE_FORMAT(admission_date,'%Y'))'Year' FROM students WHERE class_roll_no = '" & class_roll_no & "' AND DATE_FORMAT(admission_date,'%Y') = '" & Date.Now.Year & "'"))
                        If count = 2 Then
                            catname = MeData.Rows(cnt).Item("name").ToString
                            catid = MeData.Rows(cnt).Item("id").ToString
                            TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")
                        Else
                            Continue For
                        End If

                    Else

                        catname = MeData.Rows(cnt).Item("name").ToString
                        catid = MeData.Rows(cnt).Item("id").ToString
                        TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                    End If
                Else
                    If mode_payment = 1 Then

                        catname = MeData.Rows(cnt).Item("name").ToString
                        catid = MeData.Rows(cnt).Item("id").ToString
                        TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")
                    Else
                        Continue For
                    End If

                End If

#Region "olD"
                'If MeData.Rows(cnt).Item("mode_payments").ToString = 1 Then 'Default

                '    catname = MeData.Rows(cnt).Item("name").ToString
                '    catid = MeData.Rows(cnt).Item("id").ToString
                '    TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                'ElseIf MeData.Rows(cnt).Item("mode_payments").ToString = 2 And MeData.Rows(cnt).Item("enrollmentAS").ToString = "NEW" Then 'One Time
                '    If txtSemester.Text = "1ST SEMESTER" Or txtSemester.Text = "2ND SEMESTER" Then

                '        catname = MeData.Rows(cnt).Item("name").ToString
                '        catid = MeData.Rows(cnt).Item("id").ToString
                '        TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                '    End If
                'ElseIf MeData.Rows(cnt).Item("mode_payments").ToString = 3 Then 'Yearly
                '    If MeData.Rows(cnt).Item("enrollmentAS").ToString = "NEW" Then
                '        If txtSemester.Text = "1ST SEMESTER" Or txtSemester.Text = "2ND SEMESTER" Then

                '            catname = MeData.Rows(cnt).Item("name").ToString
                '            catid = MeData.Rows(cnt).Item("id").ToString
                '            TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                '            'Else 'Old
                '            '    If txtSemester.Text = "1ST SEMESTER" Then

                '            '        catname = MeData.Rows(cnt).Item("name").ToString
                '            '        catid = MeData.Rows(cnt).Item("id").ToString
                '            '        TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                '            '    End If
                '        End If

                '    Else
                '        If txtSemester.Text = "1ST SEMESTER" Then

                '            catname = MeData.Rows(cnt).Item("name").ToString
                '            catid = MeData.Rows(cnt).Item("id").ToString
                '            TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                '        End If
                '    End If
                '        Else
                '        Continue For
                'End If



                'If catname.ToLower.Contains("lab") Then
                '    If HasLab = False Then
                '        Continue For

                '    End If
                'End If


#End Region


#Region "old"
                'TOTAL_FEES += CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString)
                'If Me.txtCategoryName.Text = "COLLEGE" Then
                '    If catname = "TUITION" Then
                '        dgvFEES.Rows.Add(New String() {catname, "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-", "H"})
                '        dt_fees.Rows.Add(New String() {catname, "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-", "H"})
                '    Else
                '        dgvFEES.Rows.Add(New String() {catname, "", "", TotalAmt, "-", "H"})
                '    End If
                'Else
                '    dgvFEES.Rows.Add(New String() {catname, "", "", TotalAmt, "-", "H"})
                'End If



                'dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = False 'True
                'dt_fees.Rows.Add(New String() {catname, "", "", TotalAmt, "-"})
#End Region

                If catname = "TUITION" Then
                    dgvFEES.Rows.Add(New String() {catname, "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-", "H"})
                    dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = False 'True

                    dt_fees.Rows.Add(New String() {catname, "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-", "H"})
                Else
                    dgvFEES.Rows.Add(New String() {catname, "", "", TotalAmt, "-", "H"})
                    dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = False 'True

                    dt_fees.Rows.Add(New String() {catname, "", "", TotalAmt, "-"})
                End If


                TOTAL_FEES += CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString)


                Dim SQLEXDetails As String = "SELECT id, name, amount FROM finance_fee_particulars"
                SQLEXDetails += " WHERE finance_fee_category_id ='" & catid & "'"
                SQLEXDetails += " AND is_deleted !='1'"
                Dim inDataT As DataTable
                inDataT = clsDBConn.ExecQuery(SQLEXDetails)

                If inDataT.Rows.Count Then
                    For indataCtr As Integer = 0 To inDataT.Rows.Count - 1
                        Dim part_id As String = inDataT.Rows(indataCtr).Item("id").ToString
                        Dim detailname As String = inDataT.Rows(indataCtr).Item("name").ToString
                        Dim amount As String = Format(CDbl(inDataT.Rows(indataCtr).Item("amount").ToString), "#,##0.00")

                        dgvFEES.Rows.Add(New String() {"", detailname, amount, "", "-", "", part_id})
                        dt_fees.Rows.Add(New String() {"", detailname, amount, "", "-", "", part_id})

                    Next
                End If


            Next

        End If

        '' ####### Compute Lecture and Laboratory Fees
        If Me.txtCategoryName.Text = "COLLEGE" Then
            For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1



                Dim flag As String = dgvFEES.Item(4, nCtr).Value.ToString
                Dim value As String = dgvFEES.Item(1, nCtr).Value.ToString

                If flag = "-" And value.Contains("Lecture") Then
                    'dgvFEES.Rows.Add(New String() {"TUITION", "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-"})
                    dgvFEES.Item(2, nCtr).Value = Format(TuitionFee_Lec, "#,##0.00")
                    dt_fees.Rows(nCtr).Item(2) = Format(TuitionFee_Lec, "#,##0.00")
                End If

                If flag = "-" And value.Contains("Lab") Then
                    dgvFEES.Item(2, nCtr).Value = Format(TuitionFee_lab, "#,##0.00")
                    dt_fees.Rows(nCtr).Item(2) = Format(TuitionFee_lab, "#,##0.00")
                End If




            Next
            'recomputeTotalFees()
        End If



        TOTAL_FEES += TuitionFee_lab + TuitionFee_Lec

        Dim balance As Double = CDbl(getPreviousBalance())
        Dim discount As Double = CDbl(getDiscount())
        Dim TOTAL_BAL As Double = (TOTAL_FEES + balance) - discount



        dgvFEES.Rows.Add(New String() {"", "", "TOTAL", Format(TOTAL_FEES, "#,##0.00"), "++"})
        dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True
        dt_fees.Rows.Add(New String() {"", "", "TOTAL", Format(TOTAL_FEES, "#,##0.00"), "++"})

        dgvFEES.Rows.Add(New String() {"", "", "PREVIOUS BALANCE", getPreviousBalance(), "-+"})
        dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True
        dt_fees.Rows.Add(New String() {"", "", "PREVIOUS BALANCE", getPreviousBalance(), "-+"})

        dgvFEES.Rows.Add(New String() {"", "", "DISCOUNT", getDiscount(), "--"})
        dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True
        dt_fees.Rows.Add(New String() {"", "", "DISCOUNT", getDiscount(), "--"})

        dgvFEES.Rows.Add(New String() {"", "", "TOTAL PAYABLES", Format(TOTAL_BAL, "#,##0.00"), "T+"})
        dgvFEES.Item(2, dgvFEES.Rows.Count - 1).ReadOnly = True
        dt_fees.Rows.Add(New String() {"", "", "TOTAL PAYABLES", Format(TOTAL_BAL, "#,##0.00"), "T+"})

        report_dt_fees = New DataTable
        report_dt_fees = dt_fees
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
        Dim SQLEX As String = "SELECT additional_info, student_additional_fields.id"
        SQLEX += " FROM student_additional_details"
        SQLEX += " INNER JOIN student_additional_fields"
        SQLEX += " ON (student_additional_details.additional_field_id = student_additional_fields.id)"
        SQLEX += " WHERE student_additional_fields.id ='2'"
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

    Private Sub btnxAddSubj_Click(sender As Object, e As EventArgs) Handles btnxAddSubj.Click
        If addSubj Is Nothing Then
            addSubj = New fmaAddSubjectForm
            With addSubj
                .txtStudentID.Text = Me.txtStudentID.Text
                .StudentSubjectSysPK = StudentSubjectSysPK
                '.batchID = txtBatchName.Tag 'BatchID\
            End With

            addSubj.Show(Me)

        End If
    End Sub

    Private Sub addSubj_SUBJECTADDED() Handles addSubj.SUBJECTADDED
        btnSave.Enabled = True
        displayStudentsSubj()
        computeTuitionFee()
        displayStudentFees()
        btnSave.PerformClick()
    End Sub

    Private Sub ButtonX2_Click(sender As Object, e As EventArgs) Handles ButtonX2.Click
        PrintAssessment(Me.txtEnrolledStatus.Text)
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles chkApplyRate.CheckedChanged

        If chkApplyRate.Checked = True Then

            For nCtr As Integer = 0 To dgvSubjects.Rows.Count - 1

                Dim lecAmount = dgvSubjects.Item(13, nCtr).Value.ToString

                dgvSubjects.Item(13, nCtr).Value = ReplaceMe(lecAmount, rate_per_unit)

            Next

        End If

    End Sub


    Dim assmnt_total_lec_amnt As Double = 0
    Dim assmnt_total_lab_amnt As Double = 0
    Dim assmnt_total_tuition As Double = 0
    Dim assmnt_total_payables As Double = 0


    Private Sub btnAdjust_Click(sender As Object, e As EventArgs) Handles btnAdjust.Click

        btnSave.Enabled = True

        assmnt_total_lec_amnt = 0
        assmnt_total_lab_amnt = 0
        assmnt_total_tuition = 0
        assmnt_total_payables = 0

        If RateExist Then

            For nCtr As Integer = 0 To dgvSubjects.Rows.Count - 1

                Dim stdSubjectID = dgvSubjects.Item(14, nCtr).Value.ToString
                Dim labAmount = dgvSubjects.Item(11, nCtr).Value.ToString
                Dim lecAmount = dgvSubjects.Item(13, nCtr).Value.ToString
                Dim units = dgvSubjects.Item(12, nCtr).Value.ToString

                dgvSubjects.Item(13, nCtr).Value = ReplaceMe(lecAmount, rate_per_unit)
                lecAmount = dgvSubjects.Item(13, nCtr).Value

                Adjustment.Rows.Add(stdSubjectID, dgvSubjects.Item(13, nCtr).Value, labAmount)

                assmnt_total_lec_amnt += (lecAmount * units)
                assmnt_total_lab_amnt += labAmount
            Next

            assmnt_total_tuition = assmnt_total_lec_amnt + assmnt_total_lab_amnt

            Dim Previous_Tuition As Double = DataObject(String.Format("SELECT total 'amt' FROM `students_assessment` WHERE student_id = '" & _studentID & "' AND masterfee = 'TUITION';"))


            For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1


                Dim Tuition As String = dgvFEES.Item(0, nCtr).Value.ToString
                Dim Particulars As String = dgvFEES.Item(1, nCtr).Value.ToString
                Dim TotalPayables As String = dgvFEES.Item(2, nCtr).Value.ToString

                If Tuition.Contains("TUITION") Then
                    dgvFEES.Item(3, nCtr).Value = Format(assmnt_total_tuition, "#,##0.00")
                End If

                If Particulars.Contains("Lecture") Then
                    dgvFEES.Item(2, nCtr).Value = Format(assmnt_total_lec_amnt, "#,##0.00")
                End If

                If Particulars.Contains("Lab") Then
                    dgvFEES.Item(2, nCtr).Value = Format(assmnt_total_lab_amnt, "#,##0.00")
                End If

                If TotalPayables.Contains("TOTAL") Then

                    assmnt_total_payables = dgvFEES.Item(3, nCtr).Value.ToString
                    assmnt_total_payables = assmnt_total_payables - Previous_Tuition
                    assmnt_total_payables = assmnt_total_payables + assmnt_total_tuition

                    dgvFEES.Item(3, nCtr).Value = Format(assmnt_total_payables, "#,##0.00")
                End If

                If TotalPayables.Contains("PAYABLES") Then
                    dgvFEES.Item(3, nCtr).Value = Format(assmnt_total_payables, "#,##0.00")
                End If

            Next

            MsgBox("SUBJECT PER UNIT has been modified....")

        End If



    End Sub



    Dim rate_per_unit As Double = 0
    Private Function RateExist() As Boolean
        rate_per_unit = DataObject(String.Format("SELECT rate FROM student_rate WHERE person_id = '" & PERSON_ID & "'"))
        If rate_per_unit > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Private Sub addSubj_Click(sender As Object, e As EventArgs) Handles addSubj.Click

    End Sub

    Private Sub chkCompute_CheckedChanged(sender As Object, e As EventArgs) Handles chkCompute.CheckedChanged

        If chkCompute.Checked = True Then

            assmnt_total_lec_amnt = 0
            assmnt_total_lab_amnt = 0
            assmnt_total_tuition = 0
            assmnt_total_payables = 0

            For nCtr As Integer = 0 To dgvSubjects.Rows.Count - 1

                Dim stdSubjectID = dgvSubjects.Item(14, nCtr).Value.ToString
                Dim labAmount = dgvSubjects.Item(11, nCtr).Value.ToString
                    Dim lecAmount = dgvSubjects.Item(13, nCtr).Value.ToString
                    Dim units = dgvSubjects.Item(12, nCtr).Value.ToString

                Adjustment.Rows.Add(stdSubjectID, lecAmount, labAmount)

                assmnt_total_lec_amnt += (lecAmount * units)
                    assmnt_total_lab_amnt += labAmount
                Next

                assmnt_total_tuition = assmnt_total_lec_amnt + assmnt_total_lab_amnt

                Dim Previous_Tuition As Double = DataObject(String.Format("SELECT total 'amt' FROM `students_assessment` WHERE student_id = '" & _studentID & "' AND masterfee = 'TUITION';"))


                For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1


                    Dim Tuition As String = dgvFEES.Item(0, nCtr).Value.ToString
                    Dim Particulars As String = dgvFEES.Item(1, nCtr).Value.ToString
                    Dim TotalPayables As String = dgvFEES.Item(2, nCtr).Value.ToString

                    If Tuition.Contains("TUITION") Then
                        dgvFEES.Item(3, nCtr).Value = Format(assmnt_total_tuition, "#,##0.00")
                    End If

                    If Particulars.Contains("Lecture") Then
                        dgvFEES.Item(2, nCtr).Value = Format(assmnt_total_lec_amnt, "#,##0.00")
                    End If

                    If Particulars.Contains("Lab") Then
                        dgvFEES.Item(2, nCtr).Value = Format(assmnt_total_lab_amnt, "#,##0.00")
                    End If

                    If TotalPayables.Contains("TOTAL") Then

                        assmnt_total_payables = dgvFEES.Item(3, nCtr).Value.ToString
                        assmnt_total_payables = assmnt_total_payables - Previous_Tuition
                        assmnt_total_payables = assmnt_total_payables + assmnt_total_tuition

                        dgvFEES.Item(3, nCtr).Value = Format(assmnt_total_payables, "#,##0.00")
                    End If

                    If TotalPayables.Contains("PAYABLES") Then
                        dgvFEES.Item(3, nCtr).Value = Format(assmnt_total_payables, "#,##0.00")
                    End If

                Next

            MessageBox.Show("TUITION FEES has been change....", "UPDATE TUITION!!")

            If MessageBox.Show("Do you want to SAVE the new re-computed TUITION..??", "Please verify....", MessageBoxButtons.YesNo,
                   MessageBoxIcon.Information) = DialogResult.Yes Then
                btnSave_Click(sender, e)
            End If

        End If


    End Sub

    Private Sub ButtonX3_Click(sender As Object, e As EventArgs) Handles ButtonX3.Click
        ReloadAllDisplay()
    End Sub

    Private Sub LabelX9_Click(sender As Object, e As EventArgs) Handles LabelX9.Click

    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs) Handles GroupBox1.Enter

    End Sub
End Class