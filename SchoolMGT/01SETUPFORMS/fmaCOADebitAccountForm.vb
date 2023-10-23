Imports System.ComponentModel
Imports MySql.Data.MySqlClient

Public Class fmaCOADebitAccountForm


    Private Sub fmaCOADebitAccountForm_Load(sender As Object, e As EventArgs) Handles Me.Load


        displayCashAccount()
        displayChequeAccount()
    End Sub

    Private Sub displayCashAccount()
        Dim SQLEX As String = "SELECT   `account_code` , `account_name`"
        SQLEX += " FROM  `djemfcst_acctng2022`.`0_chart_master`"
        SQLEX += " ORDER BY account_code;"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        txtCashPayment.DataSource = MeData

        txtCashPayment.ValueMember = "account_code"
        txtCashPayment.DisplayMember = "account_name"

        txtCashPayment.SelectedValue = getCurrentDebitAccountCode(1)


    End Sub

    Private Sub displayChequeAccount()
        Dim SQLEX As String = "SELECT   `account_code` , `account_name`"
        SQLEX += " FROM  `djemfcst_acctng2022`.`0_chart_master`"
        SQLEX += " ORDER BY account_code;"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        txtChequePayment.DataSource = MeData

        txtChequePayment.ValueMember = "account_code"
        txtChequePayment.DisplayMember = "account_name"

        txtChequePayment.SelectedValue = getCurrentDebitAccountCode(2)


    End Sub

    Private Sub txtCashPayment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtCashPayment.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(txtCashPayment.SelectedItem, DataRowView)
            Me.txtCashDebitAcctID.Text = drv.Item("account_code").ToString



        Catch ex As Exception
            Me.txtCashDebitAcctID.Text = ""
        End Try
    End Sub

    Private Sub txtChequePayment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtChequePayment.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(txtChequePayment.SelectedItem, DataRowView)
            Me.txtChequeDebitAcctID.Text = drv.Item("account_code").ToString



        Catch ex As Exception
            Me.txtChequeDebitAcctID.Text = ""
        End Try
    End Sub

    Private Function getCurrentDebitAccountCode(ByVal account_id As Integer) As Integer
        Dim SQLEX As String = ""


        If account_id = 1 Then
            SQLEX = "SELECT account_id, account_description FROM coa_debit_account WHERE id = '1'"
        ElseIf account_id = 2 Then
            SQLEX = "SELECT account_id, account_description FROM coa_debit_account WHERE id = '2'"
        End If

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim account_code As Integer = 0

        If MeData.Rows.Count > 0 Then
            Try
                account_code = CInt(MeData.Rows(0).Item("account_id").ToString)
            Catch ex As Exception

            End Try
        End If

        Return account_code
    End Function

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub



    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click


        Dim SQLUPCASH As String = "UPDATE coa_debit_account SET "
        SQLUPCASH += " account_id = '" & Me.txtCashDebitAcctID.Text & "'"
        SQLUPCASH += " ,account_description ='" & Me.txtCashPayment.Text & "'"
        SQLUPCASH += " WHERE id = '1'"

        If Not clsDBConn.Execute(SQLUPCASH) Then
            MsgBox("Error in CASH DEBIT ACCOUNT UPDATE!", MsgBoxStyle.Critical)
        End If

        Dim SQLUPCHEQUE As String = "UPDATE coa_debit_account SET "
        SQLUPCHEQUE += " account_id = '" & Me.txtChequeDebitAcctID.Text & "'"
        SQLUPCHEQUE += " ,account_description ='" & Me.txtChequePayment.Text & "'"
        SQLUPCHEQUE += " WHERE id = '2'"

        If Not clsDBConn.Execute(SQLUPCHEQUE) Then
            MsgBox("Error in CHEQUE DEBIT ACCOUNT UPDATE!", MsgBoxStyle.Critical)
        End If


        MsgBox("DEBIT ACCOUNT UPDATED.", MsgBoxStyle.Information)
        Me.Close()
    End Sub
End Class