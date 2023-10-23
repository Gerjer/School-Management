Imports MySql.Data.MySqlClient

Public Class fmaCheckVoucherSetupForm

    Private ROW_INDEX As Integer = 0
    Private COL_INDEX As Integer = 0


    Private TOTAL_DEBIT As Double = 0
    Private TOTAL_CREDIT As Double = 0

    Public OPERATION_TYPE As String = "SAVE_NEW_VC"
    'Public OPERATION_TYPE As String = "UPDATE_VC"

    Private EDIT_BANK_ACCOUNT As String = ""

    Public Event VOUCHER_UPDATE()

    Private Sub fmaCashVoucherSetupForm_Load(sender As Object, e As EventArgs) Handles Me.Load

        If OPERATION_TYPE = "SAVE_NEW_VC" Then
            dtpPayDate.Value = Date.Now
            dgvFEES.Rows.Clear()
        End If


        diDebitAmount.Value = 0
        diCreditAmount.Value = 0
        displayBankAcct()
        displayDRAccount()



        If OPERATION_TYPE = "UPDATE_VC" Then
            btnSave.Text = "Update"
            Try
                cmbBankAccount.SelectedValue = EDIT_BANK_ACCOUNT
            Catch ex As Exception

            End Try

        End If



    End Sub



    Private Sub displayDRAccount()
        Dim SQLEX As String = "SELECT   account_code, CONCAT(account_code,'-',account_name) 'account_name' "
        SQLEX += " FROM  `djemfcst_acctng2022`.`0_chart_master`"
        SQLEX += " ORDER BY account_code;"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        txtDebit.DataSource = MeData

        txtDebit.ValueMember = "account_code"
        txtDebit.DisplayMember = "account_name"

        txtDebit.SelectedValue = -1


    End Sub

    Private Sub displayBankAcct()
        Dim SQLEX As String = "SELECT   account_code,CONCAT(bank_name, '-', bank_account_name) 'bank_account_name' ,bank_account_number"
        SQLEX += " FROM  `djemfcst_acctng2022`.`0_bank_accounts`"
        SQLEX += " ORDER BY account_code;"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBankAccount.DataSource = MeData

        cmbBankAccount.ValueMember = "bank_account_number"
        cmbBankAccount.DisplayMember = "bank_account_name"

        cmbBankAccount.SelectedValue = -1

        txtBankAcctNo.Text = ""

    End Sub



    Private Sub cmbBankAccount_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbBankAccount.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbBankAccount.SelectedItem, DataRowView)
            Me.txtBankAcctNo.Text = drv.Item("bank_account_number").ToString



        Catch ex As Exception
            Me.txtBankAcctNo.Text = ""
        End Try
    End Sub


    Private Function AmountInWords(ByVal nAmount As String, Optional ByVal wAmount _
                 As String = vbNullString, Optional ByVal nSet As Object = Nothing) As String
        'Let's make sure entered value is numeric
        If Not IsNumeric(nAmount) Then Return "Please enter numeric values only."

        Dim tempDecValue As String = String.Empty : If InStr(nAmount, ".") Then _
            tempDecValue = nAmount.Substring(nAmount.IndexOf("."))
        nAmount = Replace(nAmount, tempDecValue, String.Empty)

        Try
            Dim intAmount As Long = nAmount
            If intAmount > 0 Then
                nSet = IIf((intAmount.ToString.Trim.Length / 3) _
                 > (CLng(intAmount.ToString.Trim.Length / 3)),
                  CLng(intAmount.ToString.Trim.Length / 3) + 1,
                   CLng(intAmount.ToString.Trim.Length / 3))
                Dim eAmount As Long = Microsoft.VisualBasic.Left(intAmount.ToString.Trim,
                  (intAmount.ToString.Trim.Length - ((nSet - 1) * 3)))
                Dim multiplier As Long = 10 ^ (((nSet - 1) * 3))

                Dim Ones() As String =
                {"", "One", "Two", "Three",
                  "Four", "Five",
                  "Six", "Seven", "Eight", "Nine"}
                Dim Teens() As String = {"",
                "Eleven", "Twelve", "Thirteen",
                  "Fourteen", "Fifteen",
                  "Sixteen", "Seventeen", "Eighteen", "Nineteen"}
                Dim Tens() As String = {"", "Ten",
                "Twenty", "Thirty",
                  "Forty", "Fifty", "Sixty",
                  "Seventy", "Eighty", "Ninety"}
                Dim HMBT() As String = {"", "",
                "Thousand", "Million",
                  "Billion", "Trillion",
                  "Quadrillion", "Quintillion"}

                intAmount = eAmount

                Dim nHundred As Integer = intAmount \ 100 : intAmount = intAmount Mod 100
                Dim nTen As Integer = intAmount \ 10 : intAmount = intAmount Mod 10
                Dim nOne As Integer = intAmount \ 1

                If nHundred > 0 Then wAmount = wAmount &
                Ones(nHundred) & " Hundred " 'This is for hundreds                
                If nTen > 0 Then 'This is for tens and teens
                    If nTen = 1 And nOne > 0 Then 'This is for teens 
                        wAmount = wAmount & Teens(nOne) & " "
                    Else 'This is for tens, 10 to 90
                        wAmount = wAmount & Tens(nTen) & IIf(nOne > 0, "-", " ")
                        If nOne > 0 Then wAmount = wAmount & Ones(nOne) & " "
                    End If
                Else 'This is for ones, 1 to 9
                    If nOne > 0 Then wAmount = wAmount & Ones(nOne) & " "
                End If
                wAmount = wAmount & HMBT(nSet) & " "
                wAmount = AmountInWords(CStr(CLng(nAmount) -
                  (eAmount * multiplier)).Trim & tempDecValue, wAmount, nSet - 1)
            Else
                If Val(nAmount) = 0 Then nAmount = nAmount &
                tempDecValue : tempDecValue = String.Empty
                If (Math.Round(Val(nAmount), 2) * 100) > 0 Then wAmount =
                  Trim(AmountInWords(CStr(Math.Round(Val(nAmount), 2) * 100),
                  wAmount.Trim & " Pesos And ", 1)) & " Cents"
            End If
        Catch ex As Exception
            MessageBox.Show("Error Encountered: " & ex.Message,
              "Convert Numbers To Words",
              MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return "!#ERROR_ENCOUNTERED"
        End Try

        'Trap null values
        If IsNothing(wAmount) = True Then wAmount = String.Empty Else wAmount =
          IIf(InStr(wAmount.Trim.ToLower, "pesos"),
          wAmount.Trim, wAmount.Trim & " Pesos")

        'Display the result
        Return wAmount

        ''###########sample
        'Dim amount_words As String = AmountInWords(Format(Me.AMOUNT, "#,##0.00"))

        'Me.txtAmount.Text = amount_words & "(" & Format(Me.AMOUNT, "#,##0.00") & ")"


    End Function

    Private Sub diAmount_ValueChanged(sender As Object, e As EventArgs) Handles diAmount.ValueChanged
        Try
            Dim amount_words As String = AmountInWords(Format(Me.diAmount.Value, "#,##0.00"))

            Me.txtAmoutInWords.Text = amount_words

        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        'printVoucher("1")

        Me.Close()
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click



        'If txtVoucherNumber.Text.Length = 0 Then
        '    Dim vcNumSql As String = "SELECT cv_no FROM check_voucher ORDER BY id DESC LIMIT 1"
        '    Dim counter As Integer = 0

        '    Dim vcData As DataTable
        '    vcData = clsDBConn.ExecQuery(vcNumSql)

        '    If vcData.Rows.Count > 0 Then
        '        counter = CInt(vcData.Rows(0).Item("cv_no"))
        '        txtVoucherNumber.Text = counter + 1
        '    Else
        '        txtVoucherNumber.Text = "1"
        '    End If



        'End If

        If (txtVoucherNumber.Text.Length = 0) Then
            MsgBox("Please Enter Correct Voucher Number")
            Exit Sub
        End If

        If txtCheckNo.Text.Length = 0 Then
            MsgBox("Please Enter Check Number")
            Exit Sub
        End If

        If cmbBankAccount.Text.Length = 0 Then
            MsgBox("Please Fill Bank Account")
            Exit Sub
        End If

        If txtPayto.Text.Length = 0 Then
            MsgBox("Please Enter Pay To Information")
            Exit Sub
        End If

        If diAmount.Value = 0 Then
            MsgBox("Please Enter Correct Amount")
            Exit Sub
        End If

        Dim totalAmount As Double = CDbl(Me.txtTotalDebit.Text)

        If totalAmount <> diAmount.Value Then
            MsgBox("Information : Check Amount and Debit/Credit Amount is not Equal.", MsgBoxStyle.Information)
            'Exit Sub
        End If









        If btnSave.Text = "Save" Then
            'check double entry of voucher number
            Dim SQLEX As String = "SELECT id FROM check_voucher WHERE cv_no='" & Me.txtVoucherNumber.Text & "'"


            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then


                MsgBox("Voucher Number Already Exist. Please check Voucher Number and Try Again.")

                Exit Sub

            End If

            If MessageBox.Show("DO YOU WANT TO SAVE THIS CHECK VOUCHER?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then
                saveVoucher()
            End If
        ElseIf btnSave.Text = "Update" Then
            If MessageBox.Show("DO YOU WANT TO UPDATE THIS CHECK VOUCHER?", "Please Verify....", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Information) = DialogResult.Yes Then
                UpdateVoucher()
            End If
        End If





    End Sub

    Private Sub saveVoucher()

        Dim SQLIN As String = "INSERT INTO check_voucher(cv_no,check_no,cv_date,pay_to,amount,particulars,requester,bank_acct_no,bank_name, created_by)"
        SQLIN += " VALUES("
        SQLIN += String.Format("'{0}', '{1}', '{2}',", Me.txtVoucherNumber.Text, Me.txtCheckNo.Text, Format(dtpPayDate.Value, "yyyy-MM-dd"))
        SQLIN += String.Format("'{0}', '{1}', '{2}',", Me.txtPayto.Text, Me.diAmount.Value, Me.txtRemarks.Text)
        SQLIN += String.Format("'{0}', '{1}', '{2}',", Me.txtRequestedBy.Text, Me.txtBankAcctNo.Text, Me.cmbBankAccount.Text)
        SQLIN += String.Format("'{0}')", AuthUserName)

        If clsDBConn.Execute(SQLIN) Then

            Dim CV_ID As Integer = 0

            Dim SQLEX As String = "SELECT id FROM check_voucher WHERE cv_no='" & Me.txtVoucherNumber.Text & "'"
            SQLEX += " AND check_no='" & Me.txtCheckNo.Text & "'"


            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            If MeData.Rows.Count > 0 Then
                Me.txtVoucherID.Text = MeData.Rows(0).Item("id").ToString
            End If


            ' insert voucher details
            insertVoucherDetails(Me.txtVoucherID.Text)


            MsgBox("VOUCHER HAS BEEN SAVED.")
            printVoucher(Me.txtVoucherID.Text)
            btnSave.Enabled = False
            btnNewVC.Visible = True
        End If
    End Sub

    Private Sub UpdateVoucher()

        Dim SQLIN As String = "update check_voucher set cv_no='" & Me.txtVoucherNumber.Text & "'"
        SQLIN += " ,check_no='" & Me.txtCheckNo.Text & "'"
        SQLIN += " ,cv_date='" & Format(dtpPayDate.Value, "yyyy-MM-dd") & "'"
        SQLIN += " ,pay_to='" & Me.txtPayto.Text & "'"
        SQLIN += " ,amount='" & Me.diAmount.Value & "'"
        SQLIN += " ,particulars='" & Me.txtRemarks.Text & "'"
        SQLIN += " ,requester='" & Me.txtRequestedBy.Text & "'"
        SQLIN += " ,bank_acct_no='" & Me.txtBankAcctNo.Text & "'"
        SQLIN += " ,bank_name='" & Me.cmbBankAccount.Text & "'"
        SQLIN += " ,created_by='" & AuthUserName & "'"

        SQLIN += " WHERE ID='" & Me.txtVoucherID.Text & "'"


        If clsDBConn.Execute(SQLIN) Then

            Dim SQLDEL As String = "DELETE FROM check_voucher_details WHERE cv_id='" & Me.txtVoucherID.Text & "'"

            If Not clsDBConn.Execute(SQLDEL) Then
                MsgBox("Error In Deleting Voucher Details.", MsgBoxStyle.Information)
                Exit Sub
            End If


            ' insert voucher details
            insertVoucherDetails(Me.txtVoucherID.Text)


            MsgBox("VOUCHER HAS BEEN UPDATED.")

            btnSave.Enabled = False
            RaiseEvent VOUCHER_UPDATE()

            Me.Close()
        End If
    End Sub


    Private Sub insertVoucherDetails(ByVal CVID As String)

        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1

            Dim entry_type As String = dgvFEES.Item(4, nCtr).Value.ToString
            Dim coa_code As String = dgvFEES.Item(0, nCtr).Value.ToString
            Dim coa_descr As String = dgvFEES.Item(1, nCtr).Value.ToString


            Dim debit As Double = 0
            Dim credit As Double = 0


            If entry_type = "00-DR" Then
                debit = CDbl(dgvFEES.Item(2, nCtr).Value)
            ElseIf entry_type = "01-CR" Then

                credit = CDbl(dgvFEES.Item(3, nCtr).Value)
            End If

            Dim SQLIN As String = "INSERT INTO check_voucher_details(cv_id, entry_type,coa_code,coa_description,debit,credit)"
            SQLIN += " VALUES("
            SQLIN += String.Format("'{0}','{1}','{2}',", CVID, entry_type, coa_code)
            SQLIN += String.Format("'{0}','{1}','{2}')", coa_descr, debit, credit)

            clsDBConn.Execute(SQLIN)

        Next
    End Sub


    Private Sub printVoucher(ByVal CVID As String)

        Dim SQLEX As String = "SELECT cv_no,check_no,cv_date,pay_to,amount,particulars,requester,bank_acct_no,bank_name"
        SQLEX += " ,entry_type,coa_code,coa_description,debit,credit"
        SQLEX += " FROM check_voucher"
        SQLEX += " INNER JOIN check_voucher_details ON (check_voucher.id = check_voucher_details.cv_id)"
        SQLEX += " WHERE check_voucher.id='" & CVID & "'"
        SQLEX += " ORDER BY check_voucher_details.id"

        Dim new_report As New fzzReportViewerForm

        new_report.FolderName = "SOA"

        new_report.AttachReport(SQLEX, "CHECK VOUCHER NO. : " & CVID) = New rpt_CheckVoucherForm()
        new_report.Show()
        new_report.BringToFront()

    End Sub

    Private Sub btnAddDR_Click(sender As Object, e As EventArgs) Handles btnAddDR.Click

        Dim type As String = ""
        Dim debitAmount As String = ""
        Dim creditAmount As String = ""

        If txtDRCRType.Text = "DR" Then
            debitAmount = Format(diDebitAmount.Value, "#,000.00")
            type = "00-DR"
            TOTAL_DEBIT += diDebitAmount.Value
        ElseIf txtDRCRType.Text = "CR" Then
            creditAmount = Format(diCreditAmount.Value, "#,000.00")
            type = "01-CR"
            TOTAL_CREDIT += diCreditAmount.Value
        End If

        dgvFEES.Rows.Add(New String() {Me.txtDRid.Text, Me.txtDebit.Text, debitAmount, creditAmount, type})


        dgvFEES.Sort(dgvFEES.Columns(4), System.ComponentModel.ListSortDirection.Ascending)


        clearDRCRFields()


        txtTotalDebit.Text = Format(TOTAL_DEBIT, "#,00.00")
        txtTotalCredit.Text = Format(TOTAL_CREDIT, "#,00.00")

    End Sub

    Private Sub txtDRid_TextChanged(sender As Object, e As EventArgs) Handles txtDRid.TextChanged
        If txtDRid.Text.Length > 0 Then
            diDebitAmount.Enabled = True
            diCreditAmount.Enabled = True
            btnAddDR.Enabled = True
        Else
            diDebitAmount.Enabled = False
            diCreditAmount.Enabled = False
            btnAddDR.Enabled = False
        End If
    End Sub

    Private Sub diDebitAmount_ValueChanged(sender As Object, e As EventArgs) Handles diDebitAmount.ValueChanged
        If diDebitAmount.Value > 0 Then
            diCreditAmount.Value = 0
            txtDRCRType.Text = "DR"
        End If
    End Sub

    Private Sub diCreditAmount_ValueChanged(sender As Object, e As EventArgs) Handles diCreditAmount.ValueChanged
        If diCreditAmount.Value > 0 Then
            diDebitAmount.Value = 0
            txtDRCRType.Text = "CR"
        End If
    End Sub

    Private Sub txtDebit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtDebit.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(txtDebit.SelectedItem, DataRowView)
            Me.txtDRid.Text = drv.Item("account_code").ToString



        Catch ex As Exception
            Me.txtDRid.Text = ""
        End Try
    End Sub

    Private Sub clearDRCRFields()
        txtDebit.SelectedValue = -1
        txtDRid.Text = ""

        diDebitAmount.Value = 0
        diCreditAmount.Value = 0
    End Sub

    Private Sub txtTotalDebit_TextChanged(sender As Object, e As EventArgs) Handles txtTotalDebit.TextChanged

        Dim totaldebit As Double = 0
        Dim totalcredit As Double = 0

        Try
            totaldebit = CDbl(txtTotalDebit.Text)
            totalcredit = CDbl(txtTotalCredit.Text)
        Catch ex As Exception

        End Try
        If totaldebit = totalcredit Then
            If totaldebit = 0 Then
                Exit Sub
            End If

            btnSave.Enabled = True
        Else
            btnSave.Enabled = False
        End If
    End Sub

    Private Sub txtTotalCredit_TextChanged(sender As Object, e As EventArgs) Handles txtTotalCredit.TextChanged
        Dim totaldebit As Double = 0
        Dim totalcredit As Double = 0

        Try

            totalcredit = CDbl(txtTotalCredit.Text)
            totaldebit = CDbl(txtTotalDebit.Text)
        Catch ex As Exception

        End Try
        If totaldebit = totalcredit Then
            If totalcredit = 0 Then
                Exit Sub
            End If

            btnSave.Enabled = True
        Else
            btnSave.Enabled = False
        End If
    End Sub

    Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        dgvFEES.Rows.Clear()
        TOTAL_DEBIT = 0
        TOTAL_CREDIT = 0


        Me.txtTotalDebit.Text = "0.00"
        Me.txtTotalCredit.Text = "0.00"
    End Sub

    Private Sub btnNewVC_Click(sender As Object, e As EventArgs) Handles btnNewVC.Click
        clearFields()
        btnNewVC.Visible = False
    End Sub

    Private Sub clearFields()
        txtVoucherID.Text = ""
        txtVoucherNumber.Text = ""
        txtCheckNo.Text = ""


        cmbBankAccount.SelectedIndex = -1
        txtRequestedBy.Text = ""

        txtPayto.Text = ""
        diAmount.Value = 0
        txtRemarks.Text = ""


        txtDebit.SelectedIndex = -1
        diDebitAmount.Value = 0
        diCreditAmount.Value = 0
        btnAddDR.Enabled = False

        dgvFEES.Rows.Clear()
        TOTAL_DEBIT = 0
        TOTAL_CREDIT = 0


        Me.txtTotalDebit.Text = "0.00"
        Me.txtTotalCredit.Text = "0.00"

    End Sub

    Private Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        Try
            dgvFEES.Rows.RemoveAt(ROW_INDEX)
        Catch ex As Exception
            btnRemove.Enabled = False
        End Try
        btnRemove.Enabled = False
        recomputeTotalFees()
    End Sub

    Private Sub dgvFEES_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles dgvFEES.CellContentClick
        btnRemove.Enabled = True
        ROW_INDEX = e.RowIndex
        COL_INDEX = e.ColumnIndex



    End Sub


    Private Sub recomputeTotalFees()
        TOTAL_DEBIT = 0
        TOTAL_CREDIT = 0


        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1

            Try
                TOTAL_DEBIT += dgvFEES.Item(2, nCtr).Value
            Catch ex As Exception

            End Try

            Try
                TOTAL_CREDIT += dgvFEES.Item(3, nCtr).Value
            Catch ex As Exception

            End Try



        Next

        txtTotalDebit.Text = Format(TOTAL_DEBIT, "#,00.00")
        txtTotalCredit.Text = Format(TOTAL_CREDIT, "#,00.00")

    End Sub


    Public Sub loadUpdateForm(ByVal voucherID As Integer)

        Me.txtVoucherID.Text = voucherID.ToString


        Dim SQLEX As String = "SELECT cv_date,cv_no,check_no, bank_acct_no,bank_name,requester,"
        SQLEX += " pay_to,amount,particulars"
        SQLEX += " From check_voucher WHERE id='" & voucherID & "'"


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            Try
                Me.dtpPayDate.Value = CDate(MeData.Rows(0).Item("cv_date"))
                Me.txtVoucherNumber.Text = MeData.Rows(0).Item("cv_no").ToString
                Me.txtCheckNo.Text = MeData.Rows(0).Item("check_no").ToString
                EDIT_BANK_ACCOUNT = MeData.Rows(0).Item("bank_acct_no").ToString

                Me.txtRequestedBy.Text = MeData.Rows(0).Item("requester").ToString
                Me.txtPayto.Text = MeData.Rows(0).Item("pay_to").ToString
                Me.diAmount.Value = CDbl(MeData.Rows(0).Item("amount"))
                Me.txtRemarks.Text = MeData.Rows(0).Item("particulars").ToString

            Catch ex As Exception

            End Try


            SQLEX = "SELECT coa_code,coa_description,debit,credit,entry_type"
            SQLEX += " FROM check_voucher_details WHERE cv_id='" & voucherID & "'"


            MeData = Nothing

            MeData = clsDBConn.ExecQuery(SQLEX)

            TOTAL_DEBIT = 0
            TOTAL_CREDIT = 0



            If MeData.Rows.Count > 0 Then
                Try


                    For nCtr As Integer = 0 To MeData.Rows.Count - 1
                        TOTAL_DEBIT += MeData.Rows(nCtr).Item("debit")
                        TOTAL_CREDIT += MeData.Rows(nCtr).Item("credit")


                        dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("coa_code").ToString, MeData.Rows(nCtr).Item("coa_description").ToString,
                                     Format(MeData.Rows(nCtr).Item("debit"), "#,##0.00"), Format(MeData.Rows(nCtr).Item("credit"), "#,##0.00"), MeData.Rows(nCtr).Item("entry_type").ToString})

                    Next
                Catch ex As Exception

                End Try

            End If

            txtTotalDebit.Text = Format(TOTAL_DEBIT, "#,##0.00")
            txtTotalCredit.Text = Format(TOTAL_CREDIT, "#,##0.00")




        End If

    End Sub

End Class