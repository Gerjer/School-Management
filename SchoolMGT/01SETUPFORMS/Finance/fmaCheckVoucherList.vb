Imports MySql.Data.MySqlClient

Public Class fmaCheckVoucherList

    Private WithEvents CHECK_VOUCHER_FORM As fmaCheckVoucherSetupForm

    Private Sub fmaCheckVoucherList_Load(sender As Object, e As EventArgs) Handles Me.Load

        dtpFrom.Value = New Date(Date.Now.Year, Date.Now.Month, 1)

        Dim lastDay As DateTime = New DateTime(dtpFrom.Value.Year, dtpFrom.Value.Month, 1)

        dtpTo.Value = New Date(dtpFrom.Value.Year, dtpFrom.Value.Month, lastDay.AddMonths(1).AddDays(-1).Day)


    End Sub

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        displayCVList()
        btnPrint.Visible = False
        dgvFEES.Rows.Clear()
        btnPostToJournal.Visible = False
        btnEdit.Visible = False
        lblIsPosted.Visible = False

        txtTotalCredit.Text = ""
        txtTotalDebit.Text = ""
    End Sub


    Private Sub displayCVList()

        Dim SQLEX As String = "SELECT id, cv_no,check_no,cv_date,pay_to,amount,particulars,"
        SQLEX += " requester,bank_acct_no,bank_name,status,date_created,created_by "
        SQLEX += " FROM check_voucher WHERE cv_date between '" & Format(dtpFrom.Value, "yyyy-MM-dd") & "' AND '" & Format(dtpTo.Value, "yyyy-MM-dd") & "'"
        SQLEX += " ORDER BY cv_date"

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)


        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False

                .DisplayColumns("cv_no").DataColumn.Caption = "CV NUMBER"
                .DisplayColumns("cv_no").Width = 150
                .DisplayColumns("cv_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("cv_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("check_no").DataColumn.Caption = "CHECK NUMBER"
                .DisplayColumns("check_no").Width = 150
                .DisplayColumns("check_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("check_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("cv_date").DataColumn.Caption = "DATE"
                .DisplayColumns("cv_date").Width = 200
                .DisplayColumns("cv_date").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("cv_date").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("pay_to").DataColumn.Caption = "PAY TO"
                .DisplayColumns("pay_to").Width = 250
                .DisplayColumns("pay_to").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("pay_to").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("amount").DataColumn.Caption = "AMOUNT"
                .DisplayColumns("amount").DataColumn.NumberFormat = "#,##0.00"
                .DisplayColumns("amount").Width = 250
                .DisplayColumns("amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                .DisplayColumns("particulars").Visible = False

                .DisplayColumns("requester").DataColumn.Caption = "REQUESTED BY"
                .DisplayColumns("requester").Width = 250
                .DisplayColumns("requester").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("requester").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                'bank_acct_no
                .DisplayColumns("bank_acct_no").Visible = False

                .DisplayColumns("bank_name").DataColumn.Caption = "BANK ACCOUNT"
                .DisplayColumns("bank_name").Width = 250
                .DisplayColumns("bank_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("bank_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("status").DataColumn.Caption = "STATUS"
                .DisplayColumns("status").Width = 150
                .DisplayColumns("status").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("status").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("date_created").DataColumn.Caption = "DATE CREATED"
                .DisplayColumns("date_created").Width = 150
                .DisplayColumns("date_created").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("date_created").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("created_by").DataColumn.Caption = "USER"
                .DisplayColumns("created_by").Width = 150
                .DisplayColumns("created_by").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("created_by").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


            End With
        Catch ex As Exception

        End Try
    End Sub

    Private Sub tdbViewer_MouseUp(sender As Object, e As MouseEventArgs) Handles tdbViewer.MouseUp
        Dim totalDebit As Double = 0
        Dim totalCredit As Double = 0
        Dim isPosted As String = ""

        Dim vc_id As String = ""

        Try
            vc_id = tdbViewer.Columns.Item(0).Value
            txtVoucherID.Text = vc_id
            btnPrint.Visible = True

            'status
            isPosted = tdbViewer.Columns.Item("status").Value

            txtJournalAmount.Text = tdbViewer.Columns.Item("amount").Value
            'cv_date
            txtPaymentDate.Text = Format(tdbViewer.Columns.Item("cv_date").Value, "yyyy-MM-dd")
            txtCVNumber.Text = tdbViewer.Columns.Item("cv_no").Value

            txtCheckNo.Text = tdbViewer.Columns.Item("check_no").Value
            txtBankAccount.Text = tdbViewer.Columns.Item("bank_acct_no").Value
        Catch ex As Exception
            btnPrint.Visible = False
        End Try


        Dim SQLEX As String = "SELECT coa_code,coa_description,debit,credit,entry_type"
        SQLEX += " FROM check_voucher_details WHERE cv_id='" & vc_id & "'"


        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)


        dgvFEES.Rows.Clear()

        If MeData.Rows.Count > 0 Then
            Try
                'dgvFEES.Rows.Add(New String() {Me.txtDRid.Text, Me.txtDebit.Text, debitAmount, creditAmount, type})

                For nCtr As Integer = 0 To MeData.Rows.Count - 1
                    totalDebit += MeData.Rows(nCtr).Item("debit")
                    totalCredit += MeData.Rows(nCtr).Item("credit")


                    dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("coa_code").ToString, MeData.Rows(nCtr).Item("coa_description").ToString,
                                     Format(MeData.Rows(nCtr).Item("debit"), "#,##0.00"), Format(MeData.Rows(nCtr).Item("credit"), "#,##0.00"), MeData.Rows(nCtr).Item("entry_type").ToString})

                Next
            Catch ex As Exception

            End Try

        End If

        txtTotalDebit.Text = Format(totalDebit, "#,##0.00")
        txtTotalCredit.Text = Format(totalCredit, "#,##0.00")


        If isPosted = "UNPOSTED" Then
            lblIsPosted.Text = "UNPOSTED TO JOURNAL"
            btnPostToJournal.Visible = True
            lblIsPosted.ForeColor = Color.Firebrick
            btnEdit.Visible = True
            btnEdit.Enabled = True
        ElseIf isPosted = "POSTED" Then
            lblIsPosted.Text = "POSTED TO JOURNAL"
            lblIsPosted.ForeColor = Color.DarkBlue
            btnPostToJournal.Visible = False
            btnEdit.Visible = True
            btnEdit.Enabled = False
        End If

        lblIsPosted.Visible = True

        btnPrint.Visible = True



    End Sub

    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        printVoucher(Me.txtVoucherID.Text)
    End Sub

    Private Sub printVoucher(ByVal CVID As String)

        Dim SQLEX As String = "SELECT cv_no,check_no,cv_date,pay_to,amount,particulars,requester,bank_acct_no,bank_name"
        SQLEX += " ,entry_type,coa_code,coa_description,debit,credit"
        SQLEX += " FROM check_voucher"
        SQLEX += " INNER JOIN check_voucher_details ON (check_voucher.id = check_voucher_details.cv_id)"
        SQLEX += " WHERE check_voucher.id='" & CVID & "'"
        SQLEX += " ORDER BY check_voucher_details.id"

        Dim new_report As New fzzReportViewerForm

        new_report.FolderName = "CHECK VOUCHER"

        new_report.AttachReport(SQLEX, "CHECK VOUCHER NO." & CVID) = New rpt_CheckVoucherForm()
        new_report.Show()
        new_report.BringToFront()

    End Sub

    Private Sub btnPostToJournal_Click(sender As Object, e As EventArgs) Handles btnPostToJournal.Click
        If MessageBox.Show("ARE YOU SURE YOU WANT TO POST THIS TO JOURNAL ENTRY?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then
            saveJournalEntry()
        End If
    End Sub

    Private Sub saveJournalEntry()
        'Write 0_refs, 0_supp_trans, 0_gl_trans


        Dim refcount As String = "" ' 0_refs.reference
        Dim refs_counter As Integer = 0

        Dim type_no As Integer = 1


        'TYPE 22 FOR SUPPLIER PAYMENT-CHECK VOUCHER
        Dim sqlGetRef As String = "SELECT MAX(id) AS 'refcount' FROM djemfcst_acctng2022.0_refs WHERE TYPE ='22'"
        Dim refData As DataTable

        refData = clsDBConn.ExecQuery(sqlGetRef)

        If refData.Rows.Count > 0 Then
            Try
                Dim count As Integer = CInt(refData.Rows(0).Item("refcount"))
                refs_counter = count + 1

                refcount = Format(refs_counter, "000") & "/" & Date.Now.Year
                'type_no = refs_counter

            Catch ex As Exception
                refcount = "001" & "/" & Date.Now.Year
                refs_counter = 1
            End Try



        End If

        'insert 0_refs
        Dim insertRefsSQL As String = "INSERT INTO djemfcst_acctng2022.0_refs(id, TYPE, reference)"
        insertRefsSQL += " VALUES("

        insertRefsSQL += String.Format("'{0}', '{1}', '{2}')", refs_counter, "22", refcount)

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
        SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}','{2}',", "22", refs_counter, "1")
        SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}','{2}',", "0", "", fiscal_year_id)
        SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}')", Me.txtPaymentDate.Text, "0")

        clsDBConn.Execute(SQL_AUDIT_TRAIL_IN)


        'supplier trans
        sqlGetRef = "SELECT MAX(trans_no) AS 'refcount' FROM djemfcst_acctng2022.0_supp_trans WHERE type ='22'"


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

        Dim JournalAmount As Double = CDbl(Me.txtJournalAmount.Text)
        JournalAmount = Math.Abs(JournalAmount) * -1

        'insert into 0_supp_trans
        insertRefsSQL = "INSERT INTO djemfcst_acctng2022.0_supp_trans(type,supplier_id,reference,tran_date,due_date,ov_amount,or_number,  c_number)"
        insertRefsSQL += " VALUES("
        insertRefsSQL += String.Format("'{0}', '{1}', '{2}',", "22", "1", refcount)
        insertRefsSQL += String.Format("'{0}', '{1}', '{2}',", txtPaymentDate.Text, txtPaymentDate.Text, JournalAmount)
        insertRefsSQL += String.Format("'{0}','{1}')", txtCVNumber.Text, txtCheckNo.Text)

        'insert Journal
        clsDBConn.Execute(insertRefsSQL)

        'getBankAccount index
        Dim bankID_SQL As String = "SELECT id FROM djemfcst_acctng2022.0_bank_accounts WHERE bank_account_number='" & Me.txtBankAccount.Text & "'"
        Dim bank_account_id As Integer = 0

        Dim bankData As DataTable
        bankData = clsDBConn.ExecQuery(bankID_SQL)

        If bankData.Rows.Count > 0 Then
            Try
                bank_account_id = CInt(bankData.Rows(0).Item("id"))
            Catch ex As Exception

            End Try
        End If




        'insert 0_bank_trans
        Dim insertBankTransSQL As String = "INSERT INTO djemfcst_acctng2022.0_bank_trans(type,trans_no,bank_act,ref,trans_date,amount,person_type_id,person_id)"
        insertBankTransSQL += "VALUES("
        insertBankTransSQL += String.Format("'{0}','{1}','{2}',", "22", refs_counter, bank_account_id)
        insertBankTransSQL += String.Format("'{0}','{1}','{2}',", refcount, Me.txtPaymentDate.Text, JournalAmount)
        insertBankTransSQL += String.Format("'{0}','{1}')", "3", "1")

        clsDBConn.Execute(insertBankTransSQL)


        ' insert debit-credit 
        Dim total_subdet As Double = 0
        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1

            Dim cr_dr_type As String = ""
            Dim flag As String = dgvFEES.Item(4, nCtr).Value.ToString

            Dim credit_coa_code As String = dgvFEES.Item(0, nCtr).Value.ToString


            Dim creditAmount As Double = 0

            If flag = "00-DR" Then
                creditAmount = CDbl(dgvFEES.Item(2, nCtr).Value)
                cr_dr_type = "DR"
            ElseIf flag = "01-CR" Then
                cr_dr_type = "CR"
                creditAmount = CDbl(dgvFEES.Item(3, nCtr).Value)
                creditAmount = Math.Abs(creditAmount) * -1
            End If




            Dim SQLINCredit As String = "INSERT INTO djemfcst_acctng2022.0_gl_trans(type,type_no,tran_date,account,memo_,amount)"
            SQLINCredit += " VALUES("

            SQLINCredit += String.Format("'{0}', '{1}',", "22", type_no)
            SQLINCredit += String.Format("'{0}', '{1}','{2}','{3}')", Me.txtPaymentDate.Text, credit_coa_code, cr_dr_type & "-" & "PAYMENT TO SUPPLIER", creditAmount)

            clsDBConn.Execute(SQLINCredit)


        Next

        'update check_voucher status to 'POSTED'


        Dim SQLUP As String = "UPDATE check_voucher SET STATUS='POSTED' WHERE id='" & txtVoucherID.Text & "'"

        If clsDBConn.Execute(SQLUP) Then
            MsgBox("CHECK VOUCHER HAS BEEN POSTED TO JOURNAL", MsgBoxStyle.Information)

            btnSearch.PerformClick()
        End If

    End Sub

    Private Sub tdbViewer_KeyUp(sender As Object, e As KeyEventArgs) Handles tdbViewer.KeyUp

        If e.KeyCode = Keys.Up Or e.KeyCode = Keys.Down Then




            Dim totalDebit As Double = 0
            Dim totalCredit As Double = 0
            Dim isPosted As String = ""

            Dim vc_id As String = ""

            Try
                vc_id = tdbViewer.Columns.Item(0).Value
                txtVoucherID.Text = vc_id
                btnPrint.Visible = True

                'status
                isPosted = tdbViewer.Columns.Item("status").Value

                txtJournalAmount.Text = tdbViewer.Columns.Item("amount").Value
                'cv_date
                txtPaymentDate.Text = Format(tdbViewer.Columns.Item("cv_date").Value, "yyyy-MM-dd")
                txtCVNumber.Text = tdbViewer.Columns.Item("cv_no").Value

                txtCheckNo.Text = tdbViewer.Columns.Item("check_no").Value
                txtBankAccount.Text = tdbViewer.Columns.Item("bank_acct_no").Value
            Catch ex As Exception
                btnPrint.Visible = False
            End Try


            Dim SQLEX As String = "SELECT coa_code,coa_description,debit,credit,entry_type"
            SQLEX += " FROM check_voucher_details WHERE cv_id='" & vc_id & "'"


            Dim MeData As DataTable

            MeData = clsDBConn.ExecQuery(SQLEX)


            dgvFEES.Rows.Clear()

            If MeData.Rows.Count > 0 Then
                Try
                    'dgvFEES.Rows.Add(New String() {Me.txtDRid.Text, Me.txtDebit.Text, debitAmount, creditAmount, type})

                    For nCtr As Integer = 0 To MeData.Rows.Count - 1
                        totalDebit += MeData.Rows(nCtr).Item("debit")
                        totalCredit += MeData.Rows(nCtr).Item("credit")


                        dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("coa_code").ToString, MeData.Rows(nCtr).Item("coa_description").ToString,
                                         Format(MeData.Rows(nCtr).Item("debit"), "#,##0.00"), Format(MeData.Rows(nCtr).Item("credit"), "#,##0.00"), MeData.Rows(nCtr).Item("entry_type").ToString})

                    Next
                Catch ex As Exception

                End Try

            End If

            txtTotalDebit.Text = Format(totalDebit, "#,##0.00")
            txtTotalCredit.Text = Format(totalCredit, "#,##0.00")


            If isPosted = "UNPOSTED" Then
                lblIsPosted.Text = "UNPOSTED TO JOURNAL"
                btnPostToJournal.Visible = True
                lblIsPosted.ForeColor = Color.Firebrick
                btnEdit.Visible = True
                btnEdit.Enabled = True
            ElseIf isPosted = "POSTED" Then
                lblIsPosted.Text = "POSTED TO JOURNAL"
                lblIsPosted.ForeColor = Color.DarkBlue
                btnPostToJournal.Visible = False
                btnEdit.Visible = False
                btnEdit.Enabled = False
            End If

            lblIsPosted.Visible = True
            btnPrint.Visible = True
        End If
    End Sub

    Private Sub btnPrintList_Click(sender As Object, e As EventArgs) Handles btnPrintList.Click
        Dim SQLEX As String = "SELECT id, cv_no,check_no,cv_date,pay_to,amount,particulars,"
        SQLEX += " requester,bank_acct_no,bank_name,status,date_created,created_by "
        SQLEX += " FROM check_voucher WHERE cv_date between '" & Format(dtpFrom.Value, "yyyy-MM-dd") & "' AND '" & Format(dtpTo.Value, "yyyy-MM-dd") & "'"


    End Sub

    Private Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click
        If CHECK_VOUCHER_FORM Is Nothing Then
            CHECK_VOUCHER_FORM = New fmaCheckVoucherSetupForm
            CHECK_VOUCHER_FORM.OPERATION_TYPE = "UPDATE_VC"
            CHECK_VOUCHER_FORM.loadUpdateForm(Me.txtVoucherID.Text)
            CHECK_VOUCHER_FORM.ShowDialog(Me)
        End If

    End Sub

    Private Sub CHECK_VOUCHER_FORM_FormClosing(sender As Object, e As FormClosingEventArgs) Handles CHECK_VOUCHER_FORM.FormClosing
        CHECK_VOUCHER_FORM = Nothing
    End Sub

    Private Sub CHECK_VOUCHER_FORM_VOUCHER_UPDATE() Handles CHECK_VOUCHER_FORM.VOUCHER_UPDATE
        btnSearch.PerformClick()
    End Sub
End Class