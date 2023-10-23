Imports System.Text.RegularExpressions
Imports MySql.Data.MySqlClient

Public Class fmaStudentPaymentList

    Dim DebitAcctCode As String = ""
    Dim DebitAcctID As String = ""

    Dim JOURAL_AMT As Double = 0


    Dim fs_id As String = ""
    Dim st_id As String = ""

    Dim st_status As String = ""
    Dim st_name As String = ""


    Private Sub fmaStudentPaymentList_Load(sender As Object, e As EventArgs) Handles Me.Load
        dtpFrom.Value = New Date(Date.Now.Year, Date.Now.Month, 1)

        Dim lastDay As DateTime = New DateTime(dtpFrom.Value.Year, dtpFrom.Value.Month, 1)

        dtpTo.Value = New Date(dtpFrom.Value.Year, dtpFrom.Value.Month, lastDay.AddMonths(1).AddDays(-1).Day)

        displayDebitAccount()

        Me.tdbViewer.FilterBar = True
        Me.tdbViewer.AllowFilter = True

        Me.txtFilterText.Text = "[^a-z0-9!+]"

        '      Regex.Match(Me.txtFilterText.Text, "[^a-z0-9!+]", RegexOptions.IgnoreCase)

        Try
            Me.tdbViewer.Col = 1
            With tdbViewer.Splits(0)
                .FilterActive = True
            End With
        Catch ex As Exception

        End Try


    End Sub

    Private Sub filterViewer()



        displayPaymentList()
        '    If Me.txtFilterText.Text = "" Then

        '          Exit Sub
        '    End If


        'tdbViewer.DataSource = Nothing
        'Dim LimitValue As Integer = PgCount.Value


        'Dim SQL As String = "SELECT id,code,course_name,section_name,category_id,SysPK,description,category_name "
        'SQL += " FROM " & TABLENAME
        'SQL += " WHERE " & Me.txtFilterText.Text
        'SQL += " ORDER BY category_name, course_name "
        'SQL += String.Format(" LIMIT {0},{1}", 0, LimitValue)

        'MeData = clsDBConn.ExecQuery(SQL)
        'Me.tdbViewer.DataSource = MeData
        'Me.tdbViewer.Rebind(True)

        'Try
        '    With tdbViewer.Splits(0)
        '        .DisplayColumns("id").Visible = False

        '        .DisplayColumns("code").DataColumn.Caption = "CODE"
        '        .DisplayColumns("code").Width = 150
        '        .DisplayColumns("code").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
        '        .DisplayColumns("code").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

        '        .DisplayColumns("course_name").DataColumn.Caption = "NAME"
        '        .DisplayColumns("course_name").Width = 280
        '        .DisplayColumns("course_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
        '        .DisplayColumns("course_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

        '        .DisplayColumns("section_name").DataColumn.Caption = "MAJOR"
        '        .DisplayColumns("section_name").Width = 350
        '        .DisplayColumns("section_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
        '        .DisplayColumns("section_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

        '        .DisplayColumns("category_id").Visible = False
        '        .DisplayColumns("SysPK").Visible = False

        '        .DisplayColumns("description").DataColumn.Caption = "DESCRIPTION"
        '        .DisplayColumns("description").Width = 400
        '        .DisplayColumns("description").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
        '        .DisplayColumns("description").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

        '        .DisplayColumns("category_name").DataColumn.Caption = "CATEGORY"
        '        .DisplayColumns("category_name").Width = 150
        '        .DisplayColumns("category_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
        '        .DisplayColumns("category_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
        '    End With
        'Catch ex As Exception

        'End Try

        'If MeData.Rows.Count > 0 Then
        '    MeData = Nothing
        '    SQL = "SELECT count(SysPK) as count"
        '    SQL += " FROM " & TABLENAME
        '    MeData = clsDBConn.ExecQuery(SQL)

        '    recordCount.Text = "1-" & tdbViewer.RowCount & " of " & MeData.Rows(0).Item("count").ToString
        'End If


        'MeData = Nothing
        'Me.txtFilterText.Text = ""

    End Sub

    Private Sub displayDebitAccount()

        Dim SQLEX As String

        SQLEX = "SELECT CONCAT(account_id, '-', account_description) AS 'coa_account',account_id  FROM coa_debit_account where id='1'"


        Dim Medata As DataTable
        Medata = clsDBConn.ExecQuery(SQLEX)

        If Medata.Rows.Count > 0 Then
            DebitAcctCode = Medata.Rows(0).Item("coa_account").ToString
            DebitAcctID = Medata.Rows(0).Item("account_id").ToString
        End If

    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        displayPaymentList()



        JOURAL_AMT = 0


        fs_id = ""
        st_id = ""

        st_status = ""
        st_name = ""
        btnPostToJournal.Visible = False
        dgvFEES.Visible = False
    End Sub

    Private Sub displayPaymentList()
        Dim SQLEX As String = "SELECT finance_transactions.id 'fs_id',students.id 'student_id',finance_transactions.transaction_date,finance_transactions.receipt_no"
        SQLEX += " , finance_transactions.amount , person.display_name , batches.name"
        SQLEX += " , students.scholarshipgrant  , finance_transactions.description,finance_transactions.status 'fs_status'"
        SQLEX += " FROM    students"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (students.batch_id = batches.id)"
        SQLEX += " INNER JOIN person "
        SQLEX += " ON (students.person_id = person.person_id)"
        SQLEX += "  INNER JOIN finance_transactions "
        SQLEX += " ON (finance_transactions.student_id = students.id)"
        SQLEX += " WHERE transaction_date BETWEEN '" & Format(dtpFrom.Value, "yyyy-MM-dd") & "' AND '" & Format(dtpTo.Value, "yyyy-MM-dd") & "'"
        SQLEX += " ORDER BY fs_id"

        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Me.txtTotalTrans.Text = tdbViewer.Splits(0).Rows.Count


        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("fs_id").Visible = False
                .DisplayColumns("student_id").Visible = False

                .DisplayColumns("transaction_date").DataColumn.Caption = "DATE"
                .DisplayColumns("transaction_date").Width = 150
                .DisplayColumns("transaction_date").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("transaction_date").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("receipt_no").DataColumn.Caption = "OR NUMBER"
                .DisplayColumns("receipt_no").Width = 150
                .DisplayColumns("receipt_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("receipt_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("amount").DataColumn.Caption = "AMOUNT"
                .DisplayColumns("amount").DataColumn.NumberFormat = "#,##0.00"
                .DisplayColumns("amount").Width = 200
                .DisplayColumns("amount").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("amount").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Far

                .DisplayColumns("display_name").DataColumn.Caption = "STUDENT NAME"
                .DisplayColumns("display_name").Width = 250
                .DisplayColumns("display_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("display_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("name").DataColumn.Caption = "COURSE/BATCH"
                .DisplayColumns("name").Width = 250
                .DisplayColumns("name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("scholarshipgrant").DataColumn.Caption = "SCHOLARSHIP"
                .DisplayColumns("scholarshipgrant").Width = 150
                .DisplayColumns("scholarshipgrant").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("scholarshipgrant").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("description").DataColumn.Caption = "FEE DESCRIPTION"
                .DisplayColumns("description").Width = 250
                .DisplayColumns("description").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("description").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                .DisplayColumns("fs_status").Visible = False

            End With
        Catch ex As Exception

        End Try



        SQLEX = "SELECT SUM(finance_transactions.amount) 'total_amount' FROM finance_transactions "
        SQLEX += " WHERE transaction_date BETWEEN '" & Format(dtpFrom.Value, "yyyy-MM-dd") & "' AND '" & Format(dtpTo.Value, "yyyy-MM-dd") & "'"


        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            Try
                txtTotalAmount.Text = Format(CDbl(MeData.Rows(0).Item("total_amount")), "#,##0.00")
            Catch ex As Exception

            End Try
        End If


    End Sub

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub tdbViewer_MouseUp(sender As Object, e As MouseEventArgs) Handles tdbViewer.MouseUp


        Try

            fs_id = tdbViewer.Columns.Item("fs_id").Value
            st_id = tdbViewer.Columns.Item("student_id").Value
            st_status = tdbViewer.Columns.Item("fs_status").Value
            st_name = tdbViewer.Columns.Item("display_name").Value

            JOURAL_AMT = CDbl(tdbViewer.Columns.Item("amount").Value)
        Catch ex As Exception
            btnPrint.Visible = False
        End Try


        If st_status = "UNPOSTED" Then
            btnPostToJournal.Visible = True
            dgvFEES.Visible = True

            Dim SQLEX As String = "SELECT finance_fee_paticulars_id,amount FROM finance_transactions_onetime_payments"
            SQLEX += " WHERE student_id ='" & st_id & "'"
            SQLEX += " AND finance_transaction_id ='" & fs_id & "'"


            Dim MeData As DataTable

            MeData = clsDBConn.ExecQuery(SQLEX)


            dgvFEES.Rows.Clear()
            If MeData.Rows.Count > 0 Then
                Try
                    For nCtr As Integer = 0 To MeData.Rows.Count - 1


                        dgvFEES.Rows.Add(New String() {MeData.Rows(nCtr).Item("finance_fee_paticulars_id"), Format(MeData.Rows(nCtr).Item("amount"), "#,##0.00")})

                    Next
                Catch ex As Exception

                End Try
            End If


        ElseIf st_status = "POSTED" Then
            dgvFEES.Visible = False
            btnPostToJournal.Visible = False
        End If

    End Sub

    Private Sub btnPostToJournal_Click(sender As Object, e As EventArgs) Handles btnPostToJournal.Click

        Dim refcount As String = "" ' 0_refs.reference
        Dim refs_counter As Integer = 0

        Dim type_no As Integer = 1


        Dim sqlGetRef As String = "SELECT MAX(id) AS 'refcount' FROM djemfcst_acctng2022.0_refs WHERE TYPE ='0'"
        Dim refData As DataTable

        refData = clsDBConn.ExecQuery(sqlGetRef)

        If refData.Rows.Count > 0 Then
            Try
                Dim count As Integer = CInt(refData.Rows(0).Item("refcount"))
                refs_counter = count + 1

                refcount = Format(refs_counter, "000") & "/" & Format(Date.Now, "yyyy")
                'type_no = refs_counter

            Catch ex As Exception
                refcount = "001" & "/" & Format(Date.Now, "yyyy")
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
        SQL_AUDIT_TRAIL_IN += String.Format("'{0}','{1}')", Format(Date.Now, "yyyy-MM-dd"), "0")

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



        'insert into 0_journal
        insertRefsSQL = "INSERT INTO djemfcst_acctng2022.0_journal(TYPE,trans_no,tran_date,reference, event_date,doc_date,currency,amount,rate)"
        insertRefsSQL += " VALUES("
        insertRefsSQL += String.Format("'{0}', '{1}', '{2}', '{3}',", "0", type_no, Format(Date.Now, "yyyy-MM-dd"), refcount)
        insertRefsSQL += String.Format("'{0}', '{1}', '{2}',", Format(Date.Now, "yyyy-MM-dd"), Format(Date.Now, "yyyy-MM-dd"), "Php")
        insertRefsSQL += String.Format("'{0}', '{1}')", JOURAL_AMT, "1")

        'insert Journal
        clsDBConn.Execute(insertRefsSQL)



        'insert DEBIT First into 0_gl_trans BEGIN

        Dim SQLINDebit As String = "INSERT INTO djemfcst_acctng2022.0_gl_trans(TYPE,type_no,tran_date,account,memo_,amount)"
        SQLINDebit += " VALUES("

        SQLINDebit += String.Format("'{0}', '{1}',", "0", type_no)
        SQLINDebit += String.Format("'{0}', '{1}','{2}','{3}')", Format(Date.Now, "yyyy-MM-dd"), DebitAcctID, "DR-" & st_name, JOURAL_AMT)

        clsDBConn.Execute(SQLINDebit)



        'INSERT CREDIT
        Dim total_subdet As Double = 0
        For nCtr As Integer = 0 To dgvFEES.Rows.Count - 1




            Dim credit_coa_code As String = dgvFEES.Item(0, nCtr).Value.ToString

            Dim SQL_ACCT_CODE As String = "SELECT account_code FROM finance_fee_particulars WHERE id='" & credit_coa_code & "'"
            Dim accounting_coa_code As String = ""

            Dim tData As DataTable

            tData = clsDBConn.ExecQuery(SQL_ACCT_CODE)

            If tData.Rows.Count > 0 Then
                Try
                    accounting_coa_code = tData.Rows(0).Item("account_code").ToString
                Catch ex As Exception

                End Try
            End If

            'write to accounting GL

            'insert to 0_gl_trans credit

            Dim creditAmount As Double = CDbl(dgvFEES.Item(1, nCtr).Value.ToString)

            creditAmount = Math.Abs(creditAmount) * -1

            Dim SQLINCredit As String = "INSERT INTO djemfcst_acctng2022.0_gl_trans(TYPE,type_no,tran_date,account,memo_,amount)"
            SQLINCredit += " VALUES("

            SQLINCredit += String.Format("'{0}', '{1}',", "0", type_no)
            SQLINCredit += String.Format("'{0}', '{1}','{2}','{3}')", Format(Date.Now, "yyyy-MM-dd"), accounting_coa_code, "CR-" & st_name, creditAmount)

            clsDBConn.Execute(SQLINCredit)




        Next


        Dim SQLUP As String = "UPDATE finance_transactions SET status='POSTED' WHERE id='" & fs_id & "'"

        clsDBConn.Execute(SQLUP)

        MsgBox("JOURNAL HAS BEEN POSTED")
        btnSearch.PerformClick()
    End Sub

    Private Sub tdbViewer_FilterChange(sender As Object, e As EventArgs) Handles tdbViewer.FilterChange


        Dim sb As New System.Text.StringBuilder()
        Dim dc As C1.Win.C1TrueDBGrid.C1DataColumn

        For Each dc In Me.tdbViewer.Columns

            If dc.FilterText.Length > 0 Then

                If sb.Length > 0 Then

                    sb.Append(" AND ")

                End If

                If dc.DataField = "amount" Then
                    sb.Append((dc.DataField + " = " + "'" + dc.FilterText + "'"))
                Else
                    sb.Append((dc.DataField + " like " + "'%" + dc.FilterText + "%'"))
                End If

                Me.txtFilterText.Text = sb.ToString
            End If

        Next dc


    End Sub

End Class