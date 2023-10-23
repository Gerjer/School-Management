Imports System.Threading
Imports System.ComponentModel

Public Class fmaFeeCategoryListForm

    Private TABLEID As String = ""
    
    Private Sub fmaFeeCategoryListForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        displayFinanceCategoryList()
        loadComboBox

    End Sub

    Private Sub loadComboBox()

        cmbTransType.DataSource = getTransactionType()
        cmbTransType.ValueMember = "id"
        cmbTransType.DisplayMember = "name"
        cmbTransType.SelectedIndex = -1


        cmbPayMode.DataSource = getPaymentMode()
        cmbPayMode.ValueMember = "id"
        cmbPayMode.DisplayMember = "name"
        cmbPayMode.SelectedIndex = -1


        cmbAccCode.DataSource = getAccCode()
        cmbAccCode.ValueMember = "code"
        cmbAccCode.DisplayMember = "name"
        cmbAccCode.SelectedIndex = -1


    End Sub

    Private Function getAccCode() As Object
        Dim sql As String = ""
        sql = "SELECT 
                    `0_chart_master`.`account_code`'code',
                    CONCAT(`0_chart_types`.`name`,' - ',`0_chart_master`.`account_name`,'---> (',`account_code`,')')'name'
                    FROM `djemfcst_acctng2022`.`0_chart_types`
                    INNER JOIN `djemfcst_acctng2022`.`0_chart_master` ON `id` = `account_type`"
        Return DataSource(sql)
    End Function

    Private Function getPaymentMode() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
                0 as 'id',
                payment_mode 'name'
                FROM finance_transaction_categories;"
        Return DataSource(sql)
    End Function

    Private Function getTransactionType() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
                0 as 'id',
                trans_type 'name'
                FROM finance_transaction_categories;"
        Return DataSource(sql)
    End Function

    Private Sub displayFinanceCategoryList()
        tdbViewer.DataSource = Nothing
        Dim MeData As New DataTable

        Dim SQL As String = "SELECT id,name,description, "
        SQL += " CASE WHEN is_income = 0 THEN 'EXPENSE'"
        SQL += " ELSE 'INCOME'"
        SQL += " End 'TYPE',"
        SQL += " trans_type,payment_mode,account_code"
        SQL += " FROM finance_transaction_categories "
        SQL += " WHERE deleted=0"
        SQL += " ORDER BY is_income DESC"

        MeData = clsDBConn.ExecQuery(SQL)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)


        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False

                .DisplayColumns("name").DataColumn.Caption = "CATEGORY"
                .DisplayColumns("name").Width = 350
                .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("description").DataColumn.Caption = "DESCRIPTION"
                .DisplayColumns("description").Width = 300
                .DisplayColumns("description").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("description").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("TYPE").DataColumn.Caption = "ACCOUNT TYPE"
                .DisplayColumns("TYPE").Width = 100
                .DisplayColumns("TYPE").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("TYPE").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("trans_type").DataColumn.Caption = "TRANSACTION TYPE"
                .DisplayColumns("trans_type").Width = 300
                .DisplayColumns("trans_type").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("trans_type").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("payment_mode").DataColumn.Caption = "PAYMENT MODE"
                .DisplayColumns("payment_mode").Width = 250
                .DisplayColumns("payment_mode").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("payment_mode").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("account_code").DataColumn.Caption = "ACCOUNT CODE"
                .DisplayColumns("account_code").Width = 100
                .DisplayColumns("account_code").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("account_code").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center


            End With

        Catch ex As Exception

        End Try

    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp
        If e.Button = Windows.Forms.MouseButtons.Left Then

            btnDelete.Visible = True
            btnEdit.Visible = True
            TABLEID = tdbViewer.Columns.Item(0).Value

            txt_name.Text = tdbViewer.Columns.Item(1).Value
            txtDescr.Text = tdbViewer.Columns.Item(2).Value

            Dim type As String = tdbViewer.Columns.Item(3).Value

            If type = "INCOME" Then
                cmbType.SelectedIndex = 1
            Else
                cmbType.SelectedIndex = 0
            End If

            cmbTransType.Text = tdbViewer.Columns.Item(4).Value
            cmbPayMode.Text = tdbViewer.Columns.Item(5).Value
            cmbAccCode.SelectedValue = tdbViewer.Columns.Item(6).Value


            btnAdd.Text = "Add"
            txt_name.Enabled = False
            txtDescr.Enabled = False
            cmbType.Enabled = False
        End If

    End Sub

    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        If btnEdit.Text = "Edit" Then
            txt_name.Enabled = True
            txtDescr.Enabled = True
            cmbType.Enabled = True
            txt_name.Focus()
            btnEdit.Text = "Update"
        ElseIf btnEdit.Text = "Update" Then

            cmbTransType.Text = TranType
            cmbPayMode.Text = PayMode
            cmbAccCode.SelectedValue = AccCode

            Dim SQLUP As String = "update finance_transaction_categories SET"
            SQLUP += String.Format(" name='{0}', description='{1}',", txt_name.Text, txtDescr.Text)
            SQLUP += String.Format(" is_income='{0}',", cmbType.SelectedIndex)
            SQLUP += String.Format(" trans_type='{0}', payment_mode='{1}',account_code='{2}'", cmbTransType.Text, cmbPayMode.Text, cmbAccCode.SelectedValue)
            SQLUP += " WHERE id='" & TABLEID & "'"

            If clsDBConn.Execute(SQLUP) Then
                MsgBox("Category updated.", MsgBoxStyle.Information)
                clearFields()
                displayFinanceCategoryList()
            End If

        End If
    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If TABLEID <= 3 Then
            MsgBox("Cannot Delete Default Fees.", MsgBoxStyle.Critical)
            Exit Sub
        End If

        If MessageBox.Show("Are you sure you want to DELETE ITEM?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            Dim SQLUP As String = "UPDATE finance_transaction_categories set deleted='1'"
            SQLUP += " WHERE id='" & TABLEID & "'"

            If clsDBConn.Execute(SQLUP) Then
                MsgBox("Finance Fee Category Deleted.")
                clearFields()
                displayFinanceCategoryList()
            End If
        End If
    End Sub

    Private Sub btnClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClear.Click
        clearFields()
    End Sub

    Private Sub clearFields()
        txt_name.Text = ""
        txtDescr.Text = ""
        cmbType.Text = ""
        cmbType.SelectedIndex = -1
        btnDelete.Visible = False
        btnEdit.Visible = False
        TABLEID = ""
        btnAdd.Text = "Add"
        btnEdit.Text = "Edit"
        txt_name.Enabled = False
        txtDescr.Enabled = False
        cmbType.Enabled = False

    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If btnAdd.Text = "Add" Then
            If TABLEID.Length > 0 Then
                clearFields()

            End If

            btnAdd.Text = "Save"
            txt_name.Enabled = True
            txtDescr.Enabled = True
            cmbType.Enabled = True
            txt_name.Focus()
        ElseIf btnAdd.Text = "Save" Then
            If txt_name.Text.Length = 0 Then
                MsgBox("Please fill out Name.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If cmbType.Text.Length = 0 Then
                MsgBox("Please fill out Name.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If cmbTransType.Text.Length = 0 Then
                MsgBox("Please fill out Name.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If cmbPayMode.Text.Length = 0 Then
                MsgBox("Please fill out Name.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If cmbAccCode.Text.Length = 0 Then
                MsgBox("Please fill out Name.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            cmbTransType.Text = TranType
            cmbPayMode.Text = PayMode
            cmbAccCode.SelectedValue = AccCode

            Dim SQLIN As String = "INSERT INTO finance_transaction_categories(name,description,is_income,deleted,trans_type,payment_mode,account_code)"
            SQLIN += " VALUES("
            SQLIN += String.Format("'{0}', '{1}',", txt_name.Text, txtDescr.Text)
            SQLIN += String.Format("'{0}', '{1}',", cmbType.SelectedIndex, "0")
            SQLIN += String.Format("'{0}', '{1}','{2}')", cmbTransType.Text, cmbPayMode.Text, cmbAccCode.SelectedValue)

            If clsDBConn.Execute(SQLIN) Then
                MsgBox("Category has been added.")
                displayFinanceCategoryList()
            End If

        End If

        
    End Sub

    Dim TranType As String = ""
    Private Sub cmbTransType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbTransType.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbTransType.SelectedItem, DataRowView)
            TranType = drv.Item("name").ToString
        Catch ex As Exception

        End Try
    End Sub
    Dim PayMode As String = ""
    Private Sub cmbPayMode_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbPayMode.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbPayMode.SelectedItem, DataRowView)
            PayMode = drv.Item("name").ToString
        Catch ex As Exception

        End Try
    End Sub
    Dim AccCode As String = ""
    Private Sub cmbAccCode_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbAccCode.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbAccCode.SelectedItem, DataRowView)
            AccCode = drv.Item("code").ToString
        Catch ex As Exception

        End Try
    End Sub

    Private Sub cmbTransType_TextChanged(sender As Object, e As EventArgs) Handles cmbTransType.TextChanged
        TranType = cmbTransType.Text
    End Sub
End Class