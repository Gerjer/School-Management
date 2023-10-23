Imports System.Threading
Imports System.ComponentModel

Public Class fmaFeesDetailListForm
    Public Event WINCLOSING()


    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        RaiseEvent WINCLOSING()
        Me.Close()
    End Sub

    Private Sub txtCatID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCatID.TextChanged
        If txtCatID.Text.Length > 0 Then
            displayFeeDetails()
        End If
    End Sub

    Private Sub displayFeeDetails()
        tdbViewer.DataSource = Nothing
        Dim SQL As String = "SELECT id,name,description,amount,mode_payments,  CASE WHEN mode_payments = 1 THEN 'Default' when  mode_payments = 2 THEN 'One Time'  ELSE 'Yearly' END AS 'ModePayments',account_code  FROM finance_fee_particulars"
        SQL += " WHERE finance_fee_category_id='" & txtCatID.Text & "'"

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQL)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False

                .DisplayColumns("name").DataColumn.Caption = "NAME"
                .DisplayColumns("name").Width = 150
                .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("description").DataColumn.Caption = "DESCRIPTION"
                .DisplayColumns("description").Width = 200
                .DisplayColumns("description").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("description").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("amount").DataColumn.Caption = "AMOUNT"
                .DisplayColumns("amount").DataColumn.NumberFormat = "#,##0.00"
                .DisplayColumns("amount").Width = 80
                .DisplayColumns("amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                .DisplayColumns("mode_payments").Visible = False

                .DisplayColumns("ModePayments").DataColumn.Caption = "MODE OF PAYMENTS"
                .DisplayColumns("ModePayments").Width = 100
                .DisplayColumns("ModePayments").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near
                .DisplayColumns("ModePayments").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("account_code").DataColumn.Caption = "ACCOUNT CODE"
                .DisplayColumns("account_code").Width = 200
                .DisplayColumns("account_code").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near
                .DisplayColumns("account_code").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near



            End With
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        addDetails()
    End Sub

    Dim mode_payments As Integer
    Private Sub addDetails()
        If txtDetName.Text.Length = 0 Then
            MsgBox("Please Fill Fields Properly. *Name Should not be Blank", MsgBoxStyle.Information)
            Exit Sub
        End If

        'If txtAmount.Value = 0 Then
        '    MsgBox("Please Fill Fields Properly. *Amount Should not be Blank/Zero", MsgBoxStyle.Information)
        '    Exit Sub
        'End If

        'If cmbChartAccount.SelectedIndex = -1 Then
        '    MsgBox("Please Fill Fields Properly. *Charts of Account Should not be Blank", MsgBoxStyle.Information)
        '    Exit Sub
        'End If


        If RadioButton1.Checked = True Then
            mode_payments = RadioButton1.Tag
        ElseIf RadioButton2.Checked = True Then
            mode_payments = RadioButton2.Tag
        Else
            mode_payments = RadioButton3.Tag
        End If

        Dim ChartsOfAccount As String = ""
        If cmbChartAccount.SelectedIndex = -1 Then
            ChartsOfAccount = ""
        Else
            ChartsOfAccount = cmbChartAccount.SelectedValue
        End If



        If btnAdd.Text = "Add" Then
            Dim SQLIN As String = "INSERT INTO finance_fee_particulars(name,description,mode_payments,amount,finance_fee_category_id,account_code)"
            SQLIN += "VALUES("
            SQLIN += String.Format("'{0}', '{1}','{2}',", Me.txtDetName.Text, Me.txtDetDescr.Text, mode_payments)
            SQLIN += String.Format("'{0}', '{1}','{2}')", Me.txtAmount.Value, Me.txtCatID.Text, ChartsOfAccount)

            If clsDBConn.Execute(SQLIN) Then

                txtDetName.Text = ""
                txtDetDescr.Text = ""
                txtDetID.Text = ""
                txtAmount.Value = 0
                btnAdd.Text = "Add"
                RaiseEvent WINCLOSING()
                displayFeeDetails()
            End If

        ElseIf btnAdd.Text = "Modify" Then
            Dim SQLUP As String = "UPDATE finance_fee_particulars SET"
            SQLUP += String.Format(" name='{0}', description='{1}', mode_payments = '{2}',", Me.txtDetName.Text, Me.txtDetDescr.Text, mode_payments)
            SQLUP += String.Format(" amount='{0}',account_code='{1}'", Me.txtAmount.Value, Me.cmbChartAccount.SelectedValue)
            SQLUP += " WHERE id='" & txtDetID.Text & "'"

            If clsDBConn.Execute(SQLUP) Then
                txtDetName.Text = ""
                txtDetDescr.Text = ""
                txtDetID.Text = ""
                txtAmount.Value = 0
                cmbChartAccount.SelectedIndex = -1
                btnAdd.Text = "Add"
                displayFeeDetails()
                RaiseEvent WINCLOSING()
            End If
        End If

        
    End Sub

    Dim row As Integer

    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp


        If e.Button = Windows.Forms.MouseButtons.Left Then

            btnDelete.Visible = True
            btnEdit.Visible = True

            row = tdbViewer.Row

            txtDetID.Text = tdbViewer(row, "id").ToString
            txtDetName.Text = tdbViewer(row, "name").ToString
            txtDetDescr.Text = tdbViewer(row, "description").ToString
            txtAmount.Value = tdbViewer(row, "amount").ToString
            cmbChartAccount.SelectedValue = tdbViewer(row, "account_code").ToString

            mode_payments = tdbViewer(row, "mode_payments").ToString
            If mode_payments = 1 Then
                RadioButton2.Checked = True
                RadioButton1.Checked = False
                RadioButton3.Checked = False
            ElseIf mode_payments = 2 Then
                RadioButton1.Checked = True
                RadioButton2.Checked = False
                RadioButton3.Checked = False
            Else
                RadioButton1.Checked = False
                RadioButton2.Checked = False
                RadioButton3.Checked = True
            End If

        End If
    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim ITEMSYSPK As String = ""

        Try
            ITEMSYSPK = tdbViewer.Columns.Item(0).Value
        Catch ex As Exception

        End Try

        If MessageBox.Show("Are you sure you want to DELETE ITEM?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            Dim SQLDEL As String = "DELETE FROM finance_fee_particulars WHERE id ='" & ITEMSYSPK & "'"
            If clsDBConn.Execute(SQLDEL) Then
                MsgBox("Detail Fee has been deleted.", MsgBoxStyle.Information)
                RaiseEvent WINCLOSING()
                displayFeeDetails()
            End If

        End If
    End Sub

    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        txtDetID.Text = tdbViewer.Columns.Item(0).Value
        txtDetName.Text = tdbViewer.Columns.Item(1).Value
        txtDetDescr.Text = tdbViewer.Columns.Item(2).Value
        txtAmount.Value = CDbl(tdbViewer.Columns.Item(3).Value)
        btnAdd.Text = "Modify"
    End Sub

    Private Sub fmaFeesDetailListForm_Load(sender As Object, e As EventArgs) Handles Me.Load

        cmbChartAccount.DataSource = DataSource(String.Format("SELECT 
                                                `0_chart_master`.`account_code`'code',
                                                CONCAT(`0_chart_types`.`name`,' - ',`0_chart_master`.`account_name`,'---> (',`account_code`,')')'name'

                                                FROM `djemfcst_acctng2022`.`0_chart_types`
                                                INNER JOIN `djemfcst_acctng2022`.`0_chart_master` ON `id` = `account_type`"))
        cmbChartAccount.ValueMember = "code"
        cmbChartAccount.DisplayMember = "name"
        cmbChartAccount.SelectedIndex = -1

    End Sub
End Class