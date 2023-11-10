Public Class fmaUserList
    Private Sub fmaUserList_Load(sender As Object, e As EventArgs) Handles Me.Load

        loadlist()

    End Sub

    Public Function loadlist()

        Dim MeData As New DataTable


        Dim SQLEX As String = "SELECT id, username, first_name,last_name,Type_User AS 'type'"
        SQLEX += " FROM users"
        'SQLEX += " FROM users WHERE id <> 1"
        SQLEX += " ORDER BY first_name"


        tdbViewer.DataSource = Nothing

        MeData = clsDBConn.ExecQuery(SQLEX)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False
                '.DisplayColumns("a_code").Visible = False

                .DisplayColumns("username").DataColumn.Caption = "USERNAME"
                .DisplayColumns("username").Width = 300
                .DisplayColumns("username").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("username").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                .DisplayColumns("first_name").DataColumn.Caption = "FIRST NAME"
                .DisplayColumns("first_name").Width = 500
                .DisplayColumns("first_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("first_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                '.DisplayColumns("first_name").AutoComplete = True
                '.DisplayColumns("first_name").AutoSize()

                .DisplayColumns("last_name").DataColumn.Caption = "LAST NAME"
                .DisplayColumns("last_name").Width = 500
                .DisplayColumns("last_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("last_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                .DisplayColumns("type").DataColumn.Caption = "USER TYPE"
                .DisplayColumns("type").Width = 250
                .DisplayColumns("type").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("type").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near



            End With
        Catch ex As Exception

        End Try
        Return Nothing
    End Function

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub tdbViewer_KeyUp(sender As Object, e As KeyEventArgs) Handles tdbViewer.KeyUp
        If e.KeyCode = Keys.Enter Then
            If txtFilterText.Text.Length > 0 Then
                btnSearchCondition.PerformClick()
            End If
        End If
    End Sub

    Dim id As Integer
    Private Sub tdbViewer_MouseUp(sender As Object, e As MouseEventArgs) Handles tdbViewer.MouseUp
        Try
            If e.Button = Windows.Forms.MouseButtons.Left Then

                btnDelete.Enabled = True
                btnDelete.Visible = True
                btnEdit.Visible = True
                btnAdd.Visible = True

                Dim row = tdbViewer.Row
                Dim columnIndex = 0
                Dim cellValue = tdbViewer(row, "id")
                Dim cellValue1 = tdbViewer(row, columnIndex)
                id = tdbViewer.Columns.Item(0).Value

                AppSetup_Domain = getEmployeeId(tdbViewer(row, "last_name"), tdbViewer(row, "first_name"))

            End If
        Catch ex As Exception

        End Try

    End Sub

    Private Function getEmployeeId(lastname As Object, firstname As Object) As Integer
        Dim id As Integer = DataObject(String.Format("SELECT SysPK_Empl FROM djemfcst_hris.employees WHERE LastName_Empl = '" & lastname & "' AND FirstName_Empl = '" & firstname & "'"))
        Return id
    End Function

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
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

    Private Sub tdbViewer_FilterChange(sender As Object, e As EventArgs) Handles tdbViewer.FilterChange
        ' Build our filter expression.


        Dim dc As C1.Win.C1TrueDBGrid.C1DataColumn

        For Each dc In Me.tdbViewer.Columns
            Dim sb As New System.Text.StringBuilder()

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

    Private Sub btnSearchCondition_Click(sender As Object, e As EventArgs) Handles btnSearchCondition.Click
        searchFilterText()
    End Sub

    Private Sub searchFilterText()

        Dim SQLEX As String = ""


        If Me.txtFilterText.Text = "" Then
            SQLEX = "SELECT id, username, first_name,last_name,( CASE      WHEN admin = 1 THEN 'ADMIN'     WHEN student = 1 THEN 'STUDENT'     WHEN employee = 1 THEN 'EMPLOYEE' END) AS 'type'"
            SQLEX += " FROM users"
            'SQLEX += " FROM users WHERE id <> 1"
            SQLEX += " ORDER BY id DESC"
        Else
            SQLEX = "SELECT id, username, first_name,last_name,( CASE      WHEN admin = 1 THEN 'ADMIN'     WHEN student = 1 THEN 'STUDENT'     WHEN employee = 1 THEN 'EMPLOYEE' END) AS 'type'"
            SQLEX += " FROM users"

            SQLEX += " WHERE " & Me.txtFilterText.Text
            'SQLEX += " and id <> 1 ORDER by id DESC "
            SQLEX += " ORDER by id DESC "
        End If
        Dim MeData As New DataTable

        tdbViewer.DataSource = Nothing
        Dim LimitValue As Integer = PgCount.Value




        'SQLEX += String.Format(" LIMIT {0},{1}", 0, LimitValue)

        MeData = clsDBConn.ExecQuery(SQLEX)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False
                '.DisplayColumns("a_code").Visible = False

                .DisplayColumns("username").DataColumn.Caption = "USERNAME"
                .DisplayColumns("username").Width = 300
                .DisplayColumns("username").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("username").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                .DisplayColumns("first_name").DataColumn.Caption = "LAST NAME"
                .DisplayColumns("first_name").Width = 300
                .DisplayColumns("first_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("first_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("last_name").DataColumn.Caption = "FIRST NAME"
                .DisplayColumns("last_name").Width = 300
                .DisplayColumns("last_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("last_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                .DisplayColumns("type").DataColumn.Caption = "USER TYPE"
                .DisplayColumns("type").Width = 250
                .DisplayColumns("type").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("type").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

            End With
        Catch ex As Exception

        End Try


        MeData = Nothing
        Me.txtFilterText.Text = ""
    End Sub

    Private Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click


        With fmaUserSetup
            .Operation = "EDIT"
            .txtUserID.Text = tdbViewer.Columns.Item("id").Value
            .txtUserName.Text = tdbViewer.Columns.Item("username").Value
            .txtFirstName.Text = tdbViewer.Columns.Item("first_name").Value
            .txtLastName.Text = tdbViewer.Columns.Item("last_name").Value
            .txtUserType.Text = tdbViewer.Columns.Item("type").Value
            .Show(Me)
        End With

    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click

        With fmaUserSetup
            .Operation = "ADD"
            .Show(Me)
        End With
    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click

        If MessageBox.Show("Are you sure you want to DELETE this record..?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            DataSource(String.Format("DELETE FROM users WHERE id = '" & id & "'"))
            MessageBox.Show("Successfully Deleted...")
            loadlist()
        End If


    End Sub
End Class