Public Class fmaPaymentDetails

    Public Event FORM_CLOSING()

    Public isCash As Boolean = True
    Public isFullPayment As Boolean = False
    Public isDiscount As Boolean = False
    Dim dt_student_assement As New DataTable
    Public creatAnother As Boolean = False
    Public _sender As Object
    Public _e As EventArgs
    Private Sub fmaPaymentDetails_Load(sender As Object, e As EventArgs) Handles Me.Load
        displayStudentAssessment()
        displayDebitAccount()
    End Sub

    Private Sub displayDebitAccount()

        Dim SQLEX As String
        If isCash Then
            SQLEX = "SELECT CONCAT(account_id, '-', account_description) AS 'coa_account',account_id  FROM coa_debit_account where id='1'"
        Else
            SQLEX = "SELECT CONCAT(account_id, '-', account_description) AS 'coa_account',account_id FROM coa_debit_account where id='2'"
        End If

        Dim Medata As DataTable
        Medata = clsDBConn.ExecQuery(SQLEX)

        If Medata.Rows.Count > 0 Then
            txtDebitAcctCode.Text = Medata.Rows(0).Item("coa_account").ToString
            txtDebitAcctID.Text = Medata.Rows(0).Item("account_id").ToString
        End If

    End Sub

    Private Sub displayStudentAssessment()


        Dim TOTAL_FEES As Double = 0



        dgvFEES.Rows.Clear()

        Dim SQLEX As String = "SELECT masterfee,particulars,amount,total,stat,columnName, running_balance, finance_fee_particular_id, stat FROM students_assessment"
        SQLEX += " WHERE student_id ='" & Me.txtStudentID.Text & "'"

        'student assessment
        dt_student_assement = DataSource(String.Format("SELECT * FROM students_assessment WHERE student_id ='" & Me.txtStudentID.Text & "' "))

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then

            For nCtr As Integer = 0 To MeData.Rows.Count - 1

                Dim coa_code As String = ""
                Dim running_balance As String = ""
                Dim finance_fee_particular_id As String = ""
                Dim thisPayment = "-"


                If MeData.Rows(nCtr).Item("stat") = "-" And MeData.Rows(nCtr).Item("columnName") = "D" Then
                    If (MeData.Rows(nCtr).Item("running_balance") <> 0) Then
                        running_balance = Format(MeData.Rows(nCtr).Item("running_balance"), "#,##0.00")
                    Else
                        running_balance = "0.00"
                    End If
                End If

                Try
                    If (MeData.Rows(nCtr).Item("finance_fee_particular_id") = 0) Then

                        finance_fee_particular_id = "-"
                    Else
                        finance_fee_particular_id = MeData.Rows(nCtr).Item("finance_fee_particular_id")
                        Dim SQLAcctCode As String = "SELECT id, NAME, amount, account_code FROM finance_fee_particulars WHERE id ='" & finance_fee_particular_id & "'"
                        Dim coaMeData As DataTable

                        coaMeData = clsDBConn.ExecLongQuery(SQLAcctCode)

                        If coaMeData.Rows.Count > 0 Then
                            coa_code = coaMeData.Rows(0).Item("account_code").ToString
                        Else

                        End If

                        thisPayment = "0.00"
                    End If
                Catch ex As Exception
                    Dim msgStr As String = "Please Enter equivalent Account code on Fees Settings on this Batch Fees"

                    MsgBox(msgStr, MsgBoxStyle.Critical)
                    Exit Sub
                End Try


                dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("masterfee").ToString,
                                          MeData.Rows(nCtr).Item("particulars").ToString,
                                          MeData.Rows(nCtr).Item("amount").ToString,
                                          MeData.Rows(nCtr).Item("total").ToString, running_balance, finance_fee_particular_id, thisPayment, MeData.Rows(nCtr).Item("stat"), coa_code})

            Next

        End If

        If Me.isFullPayment = True Then

            AssignTotalFees()
        End If
        recomputeTotalFees()
    End Sub


    Private Sub recomputeTotalFees()
        Dim totalValue As Double = 0
        Dim runningBal As Double = 0


        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1


            Dim flag As String = dgvFEES.Item(7, nCtr).Value.ToString
            Dim value As String = dgvFEES.Item(6, nCtr).Value.ToString



            If dgvFEES.Item(5, nCtr).Value <> "-" Then

                totalValue += CDbl(value)
                runningBal += CDbl(dgvFEES.Item(4, nCtr).Value.ToString)
            End If
            If flag = "++" Then
                dgvFEES.Item(6, nCtr).Value = Format(totalValue, "#,##0.00")
                Me.txtTotalPayment.Text = Format(totalValue, "#,##0.00")


                'running balance total
                dgvFEES.Item(4, nCtr).Value = Format(runningBal, "#,##0.00")
            End If




        Next


    End Sub


    Private Sub AssignTotalFees()




        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1




            If dgvFEES.Item(5, nCtr).Value <> "-" Then
                dgvFEES.Item(6, nCtr).Value = Format(CDbl(dgvFEES.Item(4, nCtr).Value), "#,##0.00")


            End If


        Next


    End Sub

    Dim MasterFee As String = ""
    Dim MasterFeeId As String = ""
    Private Sub dgvFEES_CellEndEdit(sender As Object, e As DataGridViewCellEventArgs) Handles dgvFEES.CellEndEdit
        Dim rowIndex As Integer = e.RowIndex
        Dim colIndex As Integer = e.ColumnIndex


        'MsgBox("Row Index : " & rowIndex & vbNewLine & "Col Index : " & colIndex)
        Try

            dgvFEES.Item(colIndex, rowIndex).Value = Format(CDbl(dgvFEES.Item(colIndex, rowIndex).Value), "#,##0.00")


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        recomputeTotalFees()
    End Sub

    Public Function querryDatatable(dt As DataTable, Column1 As String, value1 As String, Column2 As String, value2 As String) As DataTable
        Dim result = dt.Clone()

        For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1(Column1) = (value1) And row1(Column2) = (value2))
            result.ImportRow(row)
        Next

        Return result

    End Function



    Private Sub dgvFEES_CellEnter(sender As Object, e As DataGridViewCellEventArgs) Handles dgvFEES.CellEnter
        Dim rowIndex As Integer = e.RowIndex
        Dim colIndex As Integer = e.ColumnIndex

        If colIndex = 6 Then

            If dgvFEES.Item(colIndex, rowIndex).Value = "-" Then
                dgvFEES.Item(colIndex, rowIndex).ReadOnly = True
            End If


            If dgvFEES.Item(4, rowIndex).Value = "0.00" Then
                dgvFEES.Item(6, rowIndex).ReadOnly = True
            End If
        End If



    End Sub

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        RaiseEvent FORM_CLOSING()
        Me.Close()
    End Sub

    Private Sub txtTotalPayment_TextChanged(sender As Object, e As EventArgs) Handles txtTotalPayment.TextChanged
        Dim toBePaid As Double = 0
        Dim totalPayment As Double = 0

        Try
            totalPayment = CDbl(Me.txtTotalPayment.Text)
            toBePaid = CDbl(Me.txtAmount.Text)
        Catch ex As Exception

        End Try


        If totalPayment = toBePaid Then
            Me.btnSave.Enabled = True
        Else
            Me.btnSave.Enabled = False
        End If

        Dim overshort As Double = 0

        overshort = toBePaid - totalPayment

        If toBePaid > totalPayment Then

            txtShortOver.Text = "Short <>" & overshort
            txtShortOver.ForeColor = Color.Red
        ElseIf toBePaid < totalPayment Then
            txtShortOver.Text = "Over <>" & overshort
            txtShortOver.ForeColor = Color.Blue
        Else
            txtShortOver.Text = overshort
            txtShortOver.ForeColor = Color.Black
        End If

    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim finance_id As String = "4"
        Dim finance_type As String = "FinanceFee"
        Dim payee_type As String = MasterFee
        Dim master_fee_id As String = MasterFeeId
        Dim category_id As String = "4"
        Dim title As String = "Received From : " & Me.txtStudentName.Text
        Dim created_at As String = Format(DateTime.Now, "yyyy-MM-dd hh:mm:ss")


        If MessageBox.Show("PLEASE MAKE SURE AMOUNT IS CORRECT." & vbNewLine _
                           & "ARE YOU SURE YOU WANT TO POST PAYMENT?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then


            Dim SQLIN As String = "INSERT INTO finance_transactions(title,description"
            SQLIN += " ,amount,category_id"
            SQLIN += " ,created_at,transaction_date"
            SQLIN += " ,finance_id,finance_type"
            SQLIN += " ,student_id,payee_id,receipt_no,user_id)"
            SQLIN += " VALUES("
            SQLIN += String.Format("'{0}', '{1}'", title, Me.txtRemarks.Text)
            SQLIN += String.Format(",'{0}', '{1}'", CDbl(Me.txtTotalPayment.Text), category_id)
            SQLIN += String.Format(",'{0}', '{1}'", created_at, Format(dtpPayDate.Value, "yyyy-MM-dd"))
            SQLIN += String.Format(",'{0}', '{1}'", finance_id, finance_type)
            SQLIN += String.Format(",'{0}', '{1}'", Me.txtStudentID.Text, txtClassRollNo.Text)
            SQLIN += String.Format(",'{0}','{1}')", Me.txtORNo.Text, LoginUserID)

            ' get ref(count of 0_refs/Year)

            Dim refcount As String = "" ' 0_refs.reference
            Dim refs_counter As Integer = 0

            Dim type_no As Integer = 1

            If clsDBConn.Execute(SQLIN) Then

                Dim sqlGetRef As String = "SELECT MAX(id) AS 'refcount' FROM djemfcst_acctng2022.0_refs WHERE TYPE ='0'"
                Dim refData As DataTable

                refData = clsDBConn.ExecQuery(sqlGetRef)

                If refData.Rows.Count > 0 Then
                    Try
                        Dim count As Integer = CInt(refData.Rows(0).Item("refcount"))
                        refs_counter = count + 1

                        refcount = Format(refs_counter, "000") & "/" & Me.txtDtpYear.Text
                        'type_no = refs_counter

                    Catch ex As Exception
                        refcount = "001" & "/" & Me.txtDtpYear.Text
                        refs_counter = 1
                    End Try



                End If

                'insert 0_refs
                Dim insertRefsSQL As String = "INSERT INTO djemfcst_acctng2022.0_refs(id, TYPE, reference)"
                insertRefsSQL += " VALUES("

                insertRefsSQL += String.Format("'{0}', '{1}', '{2}')", refs_counter, "0", refcount)

                clsDBConn.Execute(insertRefsSQL)

                ' insert audit_trail
                'get active fiscal year
                Dim selectFiscalYear As String = "SELECT id FROM djemfcst_acctng2022.0_fiscal_year WHERE closed =0 ORDER BY id DESC LIMIT 1"

                Dim fisData As DataTable
                Dim fiscal_year_id As Integer = 0
                fisData = clsDBConn.ExecQuery(selectFiscalYear)

                If fisData.Rows.Count > 0 Then
                    Try
                        fiscal_year_id = CInt(fisData.Rows(0).Item("id"))
                    Catch ex As Exception

                    End Try
                End If

                'insert audit_trai
                'trans_no=refs_counter
                Dim SQL_AUDIT_TRAIL_IN As String = "INSERT INTO djemfcst_acctng2022.0_audit_trail(type,trans_no,user,status,description,fiscal_year,gl_date,gl_seq)"
                SQL_AUDIT_TRAIL_IN += "VALUES("
                SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}','{2}',", "0", refs_counter, "1")
                SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}','{2}',", "0", "", fiscal_year_id)
                SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}')", Me.txtPaymentDate.Text, "0")

                clsDBConn.Execute(SQL_AUDIT_TRAIL_IN)


                'Journal Counter
                sqlGetRef = "SELECT MAX(trans_no) AS 'refcount' FROM djemfcst_acctng2022.0_journal WHERE TYPE ='0'"


                refData = clsDBConn.ExecQuery(sqlGetRef)

                If refData.Rows.Count > 0 Then
                    Try
                        Dim count As Integer = CInt(refData.Rows(0).Item("refcount"))
                        refs_counter = count + 1

                        type_no = refs_counter

                    Catch ex As Exception
                        refs_counter = 1
                    End Try



                End If

                Dim JournalAmount As Double = CDbl(Me.txtTotalPayment.Text)

                'insert into 0_journal
                insertRefsSQL = "INSERT INTO djemfcst_acctng2022.0_journal(TYPE,trans_no,tran_date,reference, event_date,doc_date,currency,amount,rate)"
                insertRefsSQL += " VALUES("
                insertRefsSQL += String.Format("'{0}', '{1}', '{2}', '{3}',", "0", type_no, txtPaymentDate.Text, refcount)
                insertRefsSQL += String.Format("'{0}', '{1}', '{2}',", Format(Date.Now, "yyyy-MM-dd"), txtPaymentDate.Text, "Php")
                insertRefsSQL += String.Format("'{0}', '{1}')", JournalAmount, "1")

                'insert Journal
                clsDBConn.Execute(insertRefsSQL)

                'get ID of Newly Inserted finance_transactions

                Dim SQLGET As String = "SELECT MAX(id) AS 'id' FROM finance_transactions WHERE student_id='" & Me.txtStudentID.Text & "'"
                SQLGET += " And amount = '" & CDbl(Me.txtTotalPayment.Text) & "'"
                SQLGET += " AND transaction_date = '" & Format(dtpPayDate.Value, "yyyy-MM-dd") & "'"
                SQLGET += " LIMIT 1"


                Dim MeData As DataTable
                Dim ft_id As Integer = 0

                MeData = clsDBConn.ExecQuery(SQLGET)

                If MeData.Rows.Count > 0 Then
                    Try
                        ft_id = MeData.Rows(0).Item("id")
                    Catch ex As Exception

                    End Try
                End If


                'UPDATE RUNNING BALANCE FROM STUDENTS
                Dim SQLUP As String = "UPDATE students SET runningbalance=runningbalance - '" & CDbl(Me.txtTotalPayment.Text) & "'"
                SQLUP += " WHERE id='" & txtStudentID.Text & "'"

                clsDBConn.ExecuteSilence(SQLUP)

                Dim dt_fees As New DataTable

                dt_fees.Columns.Add("FEE_id")
                dt_fees.Columns.Add("PARTICULARS")
                dt_fees.Columns.Add("AMOUNT")


                'insert DEBIT First into 0_gl_trans BEGIN

                Dim SQLINDebit As String = "INSERT INTO djemfcst_acctng2022.0_gl_trans(TYPE,type_no,tran_date,account,memo_,amount)"
                SQLINDebit += " VALUES("

                SQLINDebit += String.Format("'{0}', '{1}',", "0", type_no)
                SQLINDebit += String.Format("'{0}', '{1}','{2}','{3}')", Me.txtPaymentDate.Text, txtDebitAcctID.Text, "DR-" & txtStudentName.Text, JournalAmount)

                clsDBConn.Execute(SQLINDebit)

                'Update Scholarship Grand Details
                Dim remarks As String = ""
                If isDiscount = True Or isFullPayment = True Then

                    If isFullPayment = True Then
                        remarks = "FULL"
                    Else
                        remarks = "PARTIAL"
                    End If

                    DataSource(String.Format("UPDATE scholarship_grant_details SET deducted_amount = '" & CDbl(Me.txtTotalPayment.Text) & "',remarks = '" & remarks & "',is_grant = '1' WHERE student_id = '" & Me.txtStudentID.Text & "'"))

                End If


                'insert DEBIT First into 0_gl_trans END

                'Update students_assessment finance_fee particular running_balance
                'add fee details to table "finance_transactions_onetime_payments"
                Dim total_subdet As Double = 0
                For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1


                    Dim flag As String = dgvFEES.Item(7, nCtr).Value.ToString
                    Dim value As String = dgvFEES.Item(6, nCtr).Value.ToString
                    Dim feeId As String = dgvFEES.Item(5, nCtr).Value.ToString

                    Dim feeCatName As String = dgvFEES.Item(1, nCtr).Value.ToString

                    Dim credit_coa_code As String = dgvFEES.Item(8, nCtr).Value.ToString


                    If feeId <> "-" Then

                        If CDbl(value) = 0 Then
                            Continue For
                        End If

                        Dim URBSQL As String = "UPDATE students_assessment SET running_balance=running_balance - " & CDbl(value)
                            URBSQL += " WHERE student_id='" & Me.txtStudentID.Text & "'"
                            URBSQL += " AND finance_fee_particular_id='" & feeId & "'"

                            If Not clsDBConn.Execute(URBSQL) Then
                                MsgBox("Error in updating running balance")

                            End If


                            'insert details of payment
                            Dim DET_INSQL As String = "INSERT INTO finance_transactions_onetime_payments(class_roll_no,finance_fee_paticulars_id,amount,student_id,finance_transaction_id)"
                            DET_INSQL += " VALUES("
                            DET_INSQL += String.Format("'{0}', '{1}'", txtClassRollNo.Text, feeId)
                            DET_INSQL += String.Format(",'{0}', '{1}','{2}')", CDbl(value), Me.txtStudentID.Text, ft_id)


                            dt_fees.Rows.Add(New String() {credit_coa_code, feeCatName, CDbl(value)})
                            total_subdet += CDbl(value)



                            If Not clsDBConn.Execute(DET_INSQL) Then
                                MsgBox("Error in Inserting finance_transactions_onetime_payments")
                            End If


                            'write to accounting GL

                            'insert to 0_gl_trans credit

                            Dim creditAmount As Double = value

                            creditAmount = Math.Abs(creditAmount) * -1

                            Dim SQLINCredit As String = "INSERT INTO djemfcst_acctng2022.0_gl_trans(TYPE,type_no,tran_date,account,memo_,amount)"
                            SQLINCredit += " VALUES("

                            SQLINCredit += String.Format("'{0}', '{1}',", "0", type_no)
                            SQLINCredit += String.Format("'{0}', '{1}','{2}','{3}')", Me.txtPaymentDate.Text, credit_coa_code, "CR-" & txtStudentName.Text, creditAmount)

                            clsDBConn.Execute(SQLINCredit)


                        Else
                            If isDiscount = True And flag = "--" Then

                            'Update Discount Grid
                            dgvFEES.Item(3, nCtr).Value = txtAmount.Text

                            Dim DiscountID As Integer = DataObject(String.Format("SELECT id FROM students_assessment WHERE stat LIKE '" & flag & "' AND student_id = '" & Me.txtStudentID.Text & "'"))

                            'Update Discount Field
                            DataSource(String.Format("UPDATE students_assessment SET total = '" & txtAmount.Text & "' WHERE id = '" & DiscountID & "'"))

                        End If

                    End If

                Next

                'Update payee_type
                If dt_fees.Rows.Count > 1 Then
                    Dim str As String = "UPDATE finance_transactions SET payee_type = 'STARGGERED PAYMENT' WHERE id = '" & ft_id & "' "
                    DataSource(str)
                Else
                    Dim str As String = "UPDATE finance_transactions SET payee_type = 'ONETIME PAYMENT' WHERE id = '" & ft_id & "' "
                    DataSource(str)
                End If


                dt_fees.Rows.Add(New String() {"", "TOTAL __", Format(total_subdet, "#,##0.00")})


                btnSave.Enabled = False


                If MessageBox.Show("PAYMENT HAS BEEN POSTED FOR :" & Me.txtStudentName.Text & vbNewLine & vbNewLine _
                           & "DO YOU WANT TO PRINT THE RECEIPT?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
                    'print reciept

                    Dim new_report As New fzzReportViewerForm

                    Dim SQLEX As String = "SELECT admission_no FROM students"
                    SQLEX += " WHERE id ='" & txtStudentID.Text & "'"

                    new_report.FolderName = "SOA"
                    new_report.AttachReport(SQLEX, "RECEIPT " & txtORNo.Text & "-" & Me.txtStudentName.Text) = New rpt_ReceiptPrintout(Format(dtpPayDate.Value, "yyyy-MM-dd"),
                                                                                                                      Me.txtStudentName.Text, CDbl(Me.txtTotalPayment.Text),
                                                                                                                      Me.txtRemarks.Text, Me.txtORNo.Text, dt_fees)



                    new_report.Show()

                End If


                    txtORNo.Text = ""

                txtRemarks.Text = ""


            End If


        End If

        btnSave.Enabled = False
        dgvFEES.ReadOnly = True
    End Sub
End Class