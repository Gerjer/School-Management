Imports DevExpress.XtraReports.UI

Public Class fmaIncomeListForm
    Public FormControls As Collection
    Dim MeData As New DataTable

    Public Event ADD_BUTTON_CLICK()
    Public Event FORM_CLOSING()

    Private TABLENAME As String = "finance_transactions"

    Private WithEvents SETUPFORM As fmaIncomeSetupForm

#Region "Viewers Info"

    Dim dt As New DataTable
    Dim typeview As Integer
    Public Sub Attach()
        dt = Nothing

        tdbViewer.DataSource = Nothing
        Dim LimitValue As Integer = PgCount.Value


        Dim SQL As String = "SELECT finance_transactions.id 'ft_id',Date_Format(transaction_date,'%m/%d/%Y')'date_issued',`name`,category_id, "
        SQL += " receipt_no,amount,title,finance_transactions.description 'ft_description'"
        SQL += " FROM " & TABLENAME
        SQL += " INNER JOIN finance_transaction_categories ON finance_transactions.category_id = finance_transaction_categories.id"
        SQL += " WHERE finance_type = 'Income' "
        If GroupBox1.Visible = True Then
            SQL += " AND transaction_date ='" & Format(dtpFrom.Value, "yyyy-MM-dd") & "' "
        Else
            SQL += " AND YEAR(transaction_date) = '" & Format(dtpFrom.Value, "yyyy") & "'"
        End If
        SQL += " ORDER BY created_at desc "
        SQL += String.Format(" LIMIT {0},{1}", 0, LimitValue)

        MeData = clsDBConn.ExecQuery(SQL)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("ft_id").Visible = False

                .DisplayColumns("date_issued").DataColumn.Caption = "DATE ISSUED"
                .DisplayColumns("date_issued").Width = 100
                .DisplayColumns("date_issued").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("date_issued").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("category_id").Visible = False

                .DisplayColumns("name").DataColumn.Caption = "PAYMENT TYPE"
                .DisplayColumns("name").Width = 300
                .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("amount").DataColumn.Caption = "PAID AMOUNT"
                .DisplayColumns("amount").DataColumn.NumberFormat = "#,##0.00"
                .DisplayColumns("amount").Width = 150
                .DisplayColumns("amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                .DisplayColumns("receipt_no").DataColumn.Caption = "O.R NUMBER"
                .DisplayColumns("receipt_no").Width = 100
                .DisplayColumns("receipt_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("receipt_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("title").DataColumn.Caption = "RECEIVED FROM"
                .DisplayColumns("title").Width = 300
                .DisplayColumns("title").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("title").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("ft_description").DataColumn.Caption = "REMARKS"
                .DisplayColumns("ft_description").Width = 400
                .DisplayColumns("ft_description").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("ft_description").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


            End With
        Catch ex As Exception

        End Try

        If MeData.Rows.Count > 0 Then
            MeData = Nothing
            SQL = "SELECT count(finance_transactions.id) as count"
            SQL += " FROM " & TABLENAME
            MeData = clsDBConn.ExecQuery(SQL)

            recordCount.Text = "1-" & tdbViewer.RowCount & " of " & MeData.Rows(0).Item("count").ToString
        End If

        dt = Me.tdbViewer.DataSource

        MeData = Nothing
        Me.txtFilterText.Text = ""
    End Sub
    Private Sub Detach()

    End Sub
#End Region

    Private Sub fmaDepartmentViewerListForm_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        'Me.Detach()
        RaiseEvent FORM_CLOSING()
    End Sub

    Private Sub fmaDepartmentViewerListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Attach()
        Me.LoadRequesList()
    End Sub

    Public Sub LoadRequesList()

        tdbViewer1.DataSource = Nothing
        Dim LimitValue As Integer = PgCount.Value


        Dim SQL As String = "SELECT request_form.id 'rf_id',finance_transactions.title,finance_transaction_categories.`name`, "
        SQL += " Date_format(request_form.date_filed,'%m/%d/%y') 'date_filed',Date_format(request_form.date_due,'%m/%d/%y') 'date_due',"
        SQL += " request_form.claim_window,request_form.no_of_copies,request_form.purpose"
        SQL += " FROM 	request_form "
        SQL += " INNER JOIN finance_transactions ON  request_form.finance_transaction_id = finance_transactions.id "
        SQL += " INNER JOIN finance_transaction_categories ON finance_transactions.category_id = finance_transaction_categories.id "

        If GroupBox1.Visible = True Then
            SQL += " WHERE date_filed ='" & Format(dtpFrom.Value, "yyyy-MM-dd") & "' "
        Else
            SQL += " WHERE YEAR(date_filed) = '" & Format(dtpFrom.Value, "yyyy") & "'"
        End If

        SQL += " ORDER BY rf_id desc"

        MeData = clsDBConn.ExecQuery(SQL)
        Me.tdbViewer1.DataSource = MeData
        Me.tdbViewer1.Rebind(True)

        Try
            With tdbViewer1.Splits(0)
                .DisplayColumns("rf_id").Visible = False

                .DisplayColumns("title").DataColumn.Caption = "REQUESTOR"
                .DisplayColumns("title").Width = 300
                .DisplayColumns("title").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("title").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("name").DataColumn.Caption = "REQUEST FORM"
                .DisplayColumns("name").Width = 300
                .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("date_filed").DataColumn.Caption = "DATE FILED"
                .DisplayColumns("date_filed").Width = 150
                .DisplayColumns("date_filed").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("date_filed").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("date_due").DataColumn.Caption = "DATE DUE"
                .DisplayColumns("date_due").Width = 150
                .DisplayColumns("date_due").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("date_due").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("claim_window").DataColumn.Caption = "CLAIM WINDOW"
                .DisplayColumns("claim_window").Width = 100
                .DisplayColumns("claim_window").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("claim_window").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("no_of_copies").DataColumn.Caption = "NO.OF COPIES"
                .DisplayColumns("no_of_copies").Width = 100
                .DisplayColumns("no_of_copies").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("no_of_copies").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("purpose").DataColumn.Caption = "PURPOSE"
                .DisplayColumns("purpose").Width = 400
                .DisplayColumns("purpose").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("purpose").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

            End With
        Catch ex As Exception

        End Try


        MeData = Nothing


    End Sub

    Private Sub tdbViewer_FilterChange(ByVal sender As Object, ByVal e As System.EventArgs) Handles tdbViewer.FilterChange
        ' Build our filter expression.

        Dim sb As New System.Text.StringBuilder()
        Dim dc As C1.Win.C1TrueDBGrid.C1DataColumn

        For Each dc In Me.tdbViewer.Columns

            If dc.FilterText.Length > 0 Then

                If sb.Length > 0 Then

                    sb.Append(" AND ")

                End If
                If Me.RadioButton1.Checked Then
                    sb.Append((dc.DataField + " = " + "'" + dc.FilterText + "'"))
                Else
                    sb.Append((dc.DataField + " like " + "'%" + dc.FilterText + "%'"))
                End If

                Me.txtFilterText.Text = sb.ToString
            End If

        Next dc



    End Sub

    Private Sub searchFilterText()
        If Me.txtFilterText.Text = "" Then
            Attach()
            Exit Sub
        End If


        tdbViewer.DataSource = Nothing
        Dim LimitValue As Integer = PgCount.Value


        Dim SQL As String = "SELECT finance_transactions.id 'ft_id',Date_Format(transaction_date,'%m/%d/%Y')'date_issued',`name`,category_id, "
        SQL += " receipt_no,amount,title,finance_transactions.description 'ft_description'"
        SQL += " FROM " & TABLENAME
        SQL += " INNER JOIN finance_transaction_categories ON finance_transactions.category_id = finance_transaction_categories.id"
        SQL += " WHERE finance_type = 'Income' "
        SQL += " ORDER BY transaction_date desc "
        SQL += String.Format(" LIMIT {0},{1}", 0, LimitValue)

        MeData = clsDBConn.ExecQuery(SQL)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("ft_id").Visible = False

                .DisplayColumns("date_issued").DataColumn.Caption = "DATE ISSUED"
                .DisplayColumns("date_issued").Width = 100
                .DisplayColumns("date_issued").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("date_issued").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("category_id").Visible = False

                .DisplayColumns("name").DataColumn.Caption = "PAYMENT TYPE"
                .DisplayColumns("name").Width = 300
                .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("amount").DataColumn.Caption = "PAID AMOUNT"
                .DisplayColumns("amount").DataColumn.NumberFormat = "#,##0.00"
                .DisplayColumns("amount").Width = 150
                .DisplayColumns("amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                .DisplayColumns("receipt_no").DataColumn.Caption = "O.R NUMBER"
                .DisplayColumns("receipt_no").Width = 100
                .DisplayColumns("receipt_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("receipt_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("title").DataColumn.Caption = "RECEIVED FROM"
                .DisplayColumns("title").Width = 300
                .DisplayColumns("title").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("title").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("ft_description").DataColumn.Caption = "REMARKS"
                .DisplayColumns("ft_description").Width = 400
                .DisplayColumns("ft_description").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("ft_description").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


            End With
        Catch ex As Exception

        End Try

        If MeData.Rows.Count > 0 Then
            MeData = Nothing
            SQL = "SELECT count(finance_transactions.id) as count"
            SQL += " FROM " & TABLENAME
            MeData = clsDBConn.ExecQuery(SQL)

            recordCount.Text = "1-" & tdbViewer.RowCount & " of " & MeData.Rows(0).Item("count").ToString
        End If

        MeData = Nothing
        Me.txtFilterText.Text = ""
    End Sub

    Private Sub tdbViewer_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles tdbViewer.KeyUp



        If e.KeyCode = Keys.Enter Then
            If tdbViewer.RowCount > 0 Then
                Me.GridToTextboxes()
            End If
            ProcessFilterText(MeData, tdbViewer)
        End If

    End Sub

    Private Sub tdbViewer1_KeyUp(sender As Object, e As KeyEventArgs) Handles tdbViewer1.KeyUp


    End Sub


    Private Sub GridToTextboxes()
        Try
            For Each iControl As Control In FormControls
                Try
                    iControl.Text = tdbViewer.Columns(iControl.Name.Replace("txt", "")).Text
                Catch ex As Exception
                End Try
            Next
        Catch ex As Exception

        End Try

        'Me.Close()
    End Sub


    Private Sub ToolStripMenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.Close()
    End Sub

    Private Sub Button5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If Me.tdbViewer.FilterBar Then
            Me.tdbViewer.FilterBar = False
        Else
            Me.tdbViewer.FilterBar = True
        End If
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If SETUPFORM Is Nothing Then
            SETUPFORM = New fmaIncomeSetupForm
            SETUPFORM.OPERATION = "ADD"
        End If

        SETUPFORM.ShowDialog()
        Attach()
        '     LoadRequesList()
    End Sub

    'Private Sub SETUPFORM_DB_MODIFIED() Handles SETUPFORM.DB_MODIFIED
    '    Attach()
    'End Sub

    Private Sub SETUPFORM_Deactivate(ByVal sender As Object, ByVal e As System.EventArgs) Handles SETUPFORM.Deactivate
        SETUPFORM.Show()
        SETUPFORM.BringToFront()
    End Sub


    'Private Sub SETUPFORM_SETUP_CLOSED() Handles SETUPFORM.SETUP_CLOSED
    '    SETUPFORM = Nothing
    'End Sub

    Private Sub PgCount_ValueChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PgCount.ValueChanged
        Attach()
    End Sub

    Private Sub btnRight_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnRight.Click

        txtFrom.Text = CInt(txtFrom.Text) + 10
        txtTo.Text = CInt(txtFrom.Text) + 10

    End Sub

    Private Sub btnLeft_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLeft.Click

    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        If Me.tdbViewer.FilterBar Then
            Me.tdbViewer.FilterBar = False
            grpBoxSearch.Visible = False
            btnSearch.Text = "Show Filter Bar"
        Else
            Me.tdbViewer.FilterBar = True
            grpBoxSearch.Visible = True
            btnSearch.Text = "Hide Filter Bar"
            Try
                Me.tdbViewer.Col = 1
                With tdbViewer.Splits(0)
                    .FilterActive = True
                End With
            Catch ex As Exception

            End Try
        End If
    End Sub


    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp

        typeview = 0

        Dim point1 As Point

        If e.Button = Windows.Forms.MouseButtons.Right Then

            point1 = Windows.Forms.Cursor.Position

            Dim pt As Point = tdbViewer.PointToClient(point1)
            CMenuStripOperations.Show(tdbViewer, pt)
        End If
        If e.Button = Windows.Forms.MouseButtons.Left Then
            GroupBox1.Visible = True
            btnDelete.Visible = True
            btnEdit.Visible = True
        End If

    End Sub

    Private Sub btnDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        If MessageBox.Show("Are you sure you want to DELETE ITEM?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            deleteSelectedItem()
        End If
    End Sub

    Private Sub deleteSelectedItem()


        If typeview = 0 Then

            Dim ITEMSYSPK As String = ""

            Try
                ITEMSYSPK = tdbViewer.Columns.Item(0).Value
            Catch ex As Exception

            End Try

            If ITEMSYSPK <> "" Then
                Dim DELETESTR As String = "DELETE FROM " & TABLENAME
                DELETESTR += " WHERE SysPK_Item='" & ITEMSYSPK & "'"

                If clsDBConn.Execute(DELETESTR) Then
                    MsgBox("ITEM HAS BEEN DELETED", MsgBoxStyle.Information)
                    Attach()
                End If
            End If

        Else

            Dim id As String = ""

            Try
                id = tdbViewer1.Columns.Item(0).Value
            Catch ex As Exception

            End Try

            If id <> "" Then
                Dim DELETESTR As String = "DELETE FROM request_form "
                DELETESTR += " WHERE id ='" & id & "'"

                If clsDBConn.Execute(DELETESTR) Then
                    MsgBox("ITEM HAS BEEN DELETED", MsgBoxStyle.Information)
                    LoadRequesList()
                End If
            End If

        End If



    End Sub


    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        If SETUPFORM Is Nothing Then
            SETUPFORM = New fmaIncomeSetupForm
            SETUPFORM.OPERATION = "EDIT"

        End If


        SETUPFORM.Show(Me)

        'SETUPFORM.BringToFront()
        'Me.FormControls = SETUPFORM.clsGroup.FormControls
        'SETUPFORM.btnModify.PerformClick()
        'GridToTextboxes()

    End Sub

    Private Sub btnSearchCondition_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearchCondition.Click
        searchFilterText()
    End Sub

    Private Sub DeleteSelectedToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DeleteSelectedToolStripMenuItem.Click
        If MessageBox.Show("Are you sure you want to DELETE ITEM?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            deleteSelectedItem()
        End If
    End Sub

    Private Sub DeleteSelectedToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DeleteSelectedToolStripMenuItem1.Click
        If SETUPFORM Is Nothing Then
            SETUPFORM = New fmaIncomeSetupForm
            SETUPFORM.OPERATION = "EDIT"

        End If


        SETUPFORM.Show(Me)

        'SETUPFORM.BringToFront()
        'Me.FormControls = SETUPFORM.clsGroup.FormControls
        'SETUPFORM.btnModify.PerformClick()
        'GridToTextboxes()

    End Sub

    Private Sub DateTimePicker1_ValueChanged(sender As Object, e As EventArgs) Handles dtpFrom.ValueChanged
        Attach()
        LoadRequesList()
    End Sub

    Private Sub DateTimePicker2_ValueChanged(sender As Object, e As EventArgs) Handles dtpTo.ValueChanged
        Attach()
        LoadRequesList()
    End Sub

    Dim collection_income As New List(Of Collection_Income)
    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click

        Dim data As New DataTable
        data = getCollectionList(Format(dtpFrom.Value, "yyyy-MM-dd"))
        If data.Rows.Count Then

            Dim total As Double = 0
            Dim grand_total As Double = 0
            Dim _no As Integer = 0
            For Each row As DataRow In data.Rows
                Dim obj As New Collection_Income
                _no += 1
                With obj
                    .no = _no
                    .date_issued = row.Item("DATE").ToString
                    .or_no = row.Item("O.R #").ToString
                    .payee = row.Item("PAYEE").ToString
                    .course = row.Item("COURSE").ToString
                    .tuition = row.Item("TUITION").ToString
                    .modules = row.Item("MODULE").ToString
                    .others = row.Item("OTHERS").ToString
                    total = .tuition + .modules + .others
                    .amount = total
                    grand_total += total
                    .grand_total = grand_total
                End With
                collection_income.Add(obj)
            Next

            Dim report As New xtrCollection_Income

            report.header.Text = "DAILY CASH COLLECTION REPORT " & Format(dtpFrom.Value, "yyyy")
            report.datefrom.Text = Format(dtpFrom.Value, "MM/dd/yyyy")
            report.Report.DataSource = collection_income
            report.PrintingSystem.Document.AutoFitToPagesWidth = 1
            report.CreateDocument()
            report.ShowPreview

        Else
            MsgBox("No Record Found", MessageBoxIcon.Information)

        End If


        collection_income.Clear()

    End Sub

    Private Function getCollectionList(datefrom As String) As DataTable

#Region "old"
        '        "SELECT
        '			 @rownum:=@rownum+1 'No',
        '			 `DATE`,
        '			 `O.R #`,
        '			 `PAYEE`,
        '			 `COURSE`,	
        '			 `TUITION`,
        '			 `MODULE`,
        '			 `OTHERS`,
        '			 `TUITION` + `MODULE` + `OTHERS` 'AMOUNT'
        '			FROM(
        '			SELECT
        '				DATE_FORMAT(ft.transaction_date,'%m/%d/%Y') 'DATE', 
        '				ft.receipt_no 'O.R #',
        '				person.display_name 'PAYEE',
        '				courses.course_name 'COURSE',
        '				SUM(CASE WHEN ft.category_id = 4 THEN amount ELSE 0 END) AS 'TUITION',
        '				SUM(CASE WHEN ft.category_id = 20 THEN  amount ELSE 0 END) AS 'MODULE',
        '				SUM(CASE WHEN ft.category_id <> 4 AND ft.category_id <> 20 THEN amount ELSE 0 END) AS 'OTHERS'

        '			FROM
        '				finance_transactions ft
        '				INNER JOIN students ON ft.student_id = students.id
        '				INNER JOIN person ON students.person_id = person.person_id
        '				INNER JOIN courses ON students.course_id = courses.id
        '				INNER JOIN finance_transaction_categories ftc ON ft.category_id = ftc.id
        '				,(SELECT @rownum:=0) r

        '				WHERE ft.transaction_date = '" & datefrom & "'

        '				GROUP BY class_roll_no
        '				ORDER BY class_roll_no
        '	   )A 


        '"
#End Region

        Dim sql As String = ""
        sql = "		    SELECT
						DATE_FORMAT(transaction_date,'%m/%d/%Y') 'DATE', 
						receipt_no 'O.R #',
						SUBSTR(title FROM 17) 'PAYEE',
						CASE WHEN ft.student_id = 0 THEN address
						ELSE (SELECT 	course_name FROM courses INNER JOIN students ON courses.id = students.course_id WHERE students.id = ft.student_id) END 'COURSE',
						SUM(CASE WHEN category_id = 4 THEN amount ELSE 0 END) AS 'TUITION',
						SUM(CASE WHEN category_id = 20 THEN  amount ELSE 0 END) AS 'MODULE',
						SUM(CASE WHEN category_id <> 4 AND category_id <> 20 THEN amount ELSE 0 END) AS 'OTHERS'
						
						FROM
								finance_transactions ft
						WHERE transaction_date = '" & datefrom & "'		
								GROUP BY `PAYEE`
								ORDER BY `PAYEE`  "
        Return DataSource(sql)
    End Function

    Private Sub tdbViewer1_MouseUp(sender As Object, e As MouseEventArgs) Handles tdbViewer1.MouseUp

        typeview = 1

        Dim point1 As Point

        If e.Button = Windows.Forms.MouseButtons.Right Then

            point1 = Windows.Forms.Cursor.Position

            Dim pt As Point = tdbViewer.PointToClient(point1)
            CMenuStripOperations.Show(tdbViewer1, pt)
        End If
        If e.Button = Windows.Forms.MouseButtons.Left Then
            GroupBox1.Visible = True
            btnDelete.Visible = True
            btnEdit.Visible = True
        End If
    End Sub
End Class