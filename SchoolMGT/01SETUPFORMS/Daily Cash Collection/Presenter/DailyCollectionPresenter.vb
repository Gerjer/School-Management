Imports DevExpress.Data
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Views.BandedGrid
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class DailyCollectionPresenter
    Private _view As frmDailyCashCollection
    Dim model As New DailyCollectionModel
    Dim RecordData As New DataTable
    Public Sub New(view As frmDailyCashCollection)

        _view = view

        LoadHandler()


        If AuthUserType = "SUPERUSER" Then
            _view.lbluser.Text = AuthUserName & " / SUPERUSER"
        ElseIf AuthUserType = "ADMIN" Then
            _view.lbluser.Text = AuthUserName & " / ADMINISTRATOR"
        Else
            _view.lbluser.Text = AuthUserName & " / CASHIER"
        End If



    End Sub

    Private Sub LoadHandler()

        ' AddHandler _view.dtpFilterDate.ValueChanged, AddressOf FilterDate
        AddHandler _view.btnFind.Click, AddressOf Search
        AddHandler _view.Timer1.Tick, AddressOf TTick
        AddHandler _view.btnPrint.Click, AddressOf PrintCDC
        AddHandler _view.BandedGridView1.RowCellClick, AddressOf RowCellClick

    End Sub



    Dim _rw As Integer
    Dim _cl As String = ""
    Dim ctr As Integer = 0
    Dim colHandle As Integer = 0

    Dim _width As Integer = 350
    Dim _heigth As Integer = 126


    Private Sub RowCellClick(sender As Object, e As RowCellClickEventArgs)

        _heigth = 126
        Dim bview As BandedGridView = DirectCast(sender, BandedGridView)

        Dim rowindex As Integer = e.RowHandle
        Dim colname As BandedGridColumn = e.Column
        Dim colindex As Integer = e.Column.VisibleIndex
        colHandle = colindex

        If colindex > 4 Then
            Dim id As Integer = bview.GetFocusedRowCellDisplayText("id")
            If model.CheckCollection(id) Then

                If _rw = 0 And _cl = "" Then
                    _rw = rowindex
                    _cl = colname.Caption
                    ctr = 1

                ElseIf _rw <> rowindex And _cl <> colname.Caption Then
                    _rw = rowindex
                    _cl = colname.Caption
                    ctr = 1
                Else
                    ctr = 0
                    _rw = 0
                    _cl = ""
                End If

                If ctr = 1 Then

                    _view.expTuitionCollection.Visible = True
                    _view.expTuitionCollection.Expanded = True

                    _view.GridControl2.DataSource = model.dt_colletction
                    _view.expTuitionCollection.TitleText = colname.Caption

                    Dim rowcnt As Integer = model.dt_colletction.Rows.Count

                    If rowcnt > 2 Then


                        _heigth = _heigth + (rowcnt * 10)
                        _view.expTuitionCollection.MinimumSize = New System.Drawing.Size(_width, _heigth)
                        _view.expTuitionCollection.MaximumSize = New System.Drawing.Size(_width, _heigth)


                    Else
                        _view.expTuitionCollection.MinimumSize = New System.Drawing.Size(_width, 126)
                        _view.expTuitionCollection.MaximumSize = New System.Drawing.Size(_width, 126)

                    End If

                Else

                    _view.expTuitionCollection.Expanded = False
                    _view.expTuitionCollection.Visible = False

                    _view.expTuitionCollection.MinimumSize = New System.Drawing.Size(36, 126)
                    _view.expTuitionCollection.MaximumSize = New System.Drawing.Size(36, 126)

                End If


            Else

                _view.expTuitionCollection.Expanded = False
                _view.expTuitionCollection.Visible = False

                _view.expTuitionCollection.MinimumSize = New System.Drawing.Size(36, 126)
                _view.expTuitionCollection.MaximumSize = New System.Drawing.Size(36, 126)
            End If

        End If





    End Sub

    Private Sub PrintCDC(sender As Object, e As EventArgs)

        Dim report As New xtrDailyCashCollection
        report.ShowPrintMarginsWarning = False
        report.xrHeader.Text = "Cash Daily Collection Report " & Format(_view.dtpFilterDate.Value, "yyyy")
        report.xrTitle.Text = Format(_view.dtpFilterDate.Value, "MMMM dd, yyyy") & " ( Booklet No. " & _view.txtBookLet.Text & " )"
        report.xrUserName.Text = AuthUserName

        _view.BandedGridView1.UserCellPadding = New Padding(3, 0, 3, 0)

        report.PrintableComponentContainer1.PrintableComponent = _view.GridControl1

        report.CreateDocument(False)
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1

        report.ShowPreview

    End Sub

    Private Sub TTick(sender As Object, e As EventArgs)

        Dim tick As Integer = CInt(_view.lblTimer.Text)

        _view.lblTimer.Text = tick + 1

        If tick = 1 Then
            _view.Timer1.Enabled = False
            _view.lblTimer.Text = "0"

            FilterDate(sender, e)

            _view.lblStatus.Text = "Done."
            _view.rollingSpinner.Visible = False
            _view.stillSpinner.Visible = True
            _view.PictureBox1.Visible = False
        End If

    End Sub

    Private Sub Search(sender As Object, e As EventArgs)

        _view.PictureBox1.Visible = True
        _view.Timer1.Enabled = True
        _view.rollingSpinner.Visible = True
        _view.stillSpinner.Visible = False
        _view.lblStatus.Text = "Searching.."

        'FilterDate(sender, e)

    End Sub

    Dim master_data As New DataTable
    Dim header_payee As New DataTable
    Dim header_fees As New DataTable
    Dim header_income As New DataTable
    Dim header_feesIncome As New DataTable
    Dim totalColumn As Integer = 0

    Private Sub FilterDate(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        _view.BandedGridView1.Columns.Clear()
        _view.BandedGridView1.Bands.Clear()
        _view.GridControl1.DataSource = Nothing

        master_data.Columns.Clear()
        master_data = model.getMasterData(_view.dtpFilterDate.Value)

        If master_data.Rows.Count > 0 Then

            header_payee.Columns.Clear()
            header_payee = model.getHeaderPayee()

            header_fees.Columns.Clear()
            header_fees = model.getHeaderFees(Format(_view.dtpFilterDate.Value, "yyyy-MM-dd"))

            header_income.Columns.Clear()
            header_income = model.getHearIncome(Format(_view.dtpFilterDate.Value, "yyyy-MM-dd"))

            totalColumn = header_fees.Rows.Count + header_income.Rows.Count

            If totalColumn <= 12 Then
                _view.BandedGridView1.OptionsView.ColumnAutoWidth = True
            Else
                _view.BandedGridView1.OptionsView.ColumnAutoWidth = False
            End If

            PopulateGridControl()

            PopulateData()

        End If

        Cursor.Current = Cursors.Default
    End Sub

    Dim PayeeList As New DataTable

    Private Sub PopulateData()

        RecordData.Rows.Clear()
        PayeeList.Columns.Clear()
        PayeeList = model.GetPayeeList(Format(_view.dtpFilterDate.Value, "yyyy-MM-dd"))

        For row As Integer = 0 To PayeeList.Rows.Count - 1

            RecordData.Rows.Add()
            Dim ctr1 As Integer = 0
            Dim ctr2 As Integer = 0
            Dim CashOnHand As Double = 0
            For x As Integer = 0 To RecordData.Rows.Count - 1

                For col As Integer = 0 To RecordData.Columns.Count - 1
                    If col <= 6 Then '5
                        'Payee Details
                        If col = 3 Then '2
                            RecordData(row)(col) = Format(PayeeList(row)(col).date, "MM/dd/yyyy")
                        Else
                            RecordData(row)(col) = PayeeList(row)(col).ToString
                        End If

                    Else
                        'Fees
                        Dim NameOfPayee As String = RecordData(row)("payee").ToString
                        Dim NameParticular As String = RecordData.Columns(col).ToString
                        Dim receipt_no As String = RecordData(row)("receipt_no").ToString

                        If header_fees.Rows.Count > ctr1 Then
                            Dim rows = master_data.Select("transaction_date ='" & Format(_view.dtpFilterDate.Value, "yyyy-MM-dd") & "' and particulars='" & NameParticular & "' and payee = '" & NameOfPayee & "' and receipt_no='" & receipt_no & "'  ")

                            Dim FeesAmount As String
                            If rows.Length = 0 Then
                                FeesAmount = Nothing
                            Else
                                FeesAmount = rows(0).Item("amount")
                            End If

                            If FeesAmount IsNot Nothing Then
                                RecordData(row)(col) = FormatNumber(FeesAmount, 2)
                                CashOnHand += FeesAmount
                            Else
                                RecordData(row)(col) = "-"
                                CashOnHand += 0
                            End If
                            ctr1 += 1

                        ElseIf header_income.Rows.Count > ctr2 Then
                            Dim rows = master_data.Select("transaction_date ='" & Format(_view.dtpFilterDate.Value, "yyyy-MM-dd") & "' and particulars='" & NameParticular & "' and payee = '" & NameOfPayee & "' and receipt_no='" & receipt_no & "'  ")

                            Dim IncomeAmount As String
                            If rows.Length = 0 Then
                                IncomeAmount = Nothing
                            Else
                                IncomeAmount = rows(0).Item("amount")
                            End If

                            If IncomeAmount IsNot Nothing Then
                                RecordData(row)(col) = FormatNumber(IncomeAmount, 2)
                                CashOnHand += IncomeAmount
                            Else
                                RecordData(row)(col) = "-"
                                CashOnHand += 0
                            End If
                            ctr2 += 1
                        Else
                            RecordData(row)(col) = FormatNumber(CashOnHand, 2)
                            GoTo bypass
                        End If

                    End If


                Next


            Next

bypass:
        Next


        Dim cnt As Integer = 1
        Dim dt As DataTable = RecordData.Copy
        For x As Integer = 0 To dt.Rows.Count - 1
            dt(x)("NO.") = cnt
            cnt += 1
        Next

        RecordData.Rows.Clear()
        RecordData = dt

        _view.GridControl1.DataSource = RecordData
        DesignGridView(_view.BandedGridView1)

        CreatGroupSummary(_view.BandedGridView1)

        _view.BandedGridView1.OptionsHint.ShowCellHints = True
        _view.BandedGridView1.Columns("TUITION").ToolTip = "Price of the product per item"

        _view.Label4.Visible = True
        _view.Label5.Visible = True
        _view.Label5.Text = RecordData.Rows.Count

    End Sub




    Private Sub CreatGroupSummary(bview As BandedGridView)

        Dim col As Integer = 0
        For Each column As Columns.GridColumn In bview.Columns

            If col > 6 Then

                column.Summary.Clear()
                Dim item As GridGroupSummaryItem = New GridGroupSummaryItem()
                item.FieldName = column.FieldName
                item.ShowInGroupColumnFooter = bview.Columns(column.FieldName)
                item.SummaryType = DevExpress.Data.SummaryItemType.Sum
                item.DisplayFormat = "{0:n2}"

                bview.GroupSummary.Add(item)

                column.Summary.Add(SummaryItemType.Sum, column.FieldName, "{0:n2}")

            ElseIf col = 6 Then

                column.Summary.Clear()
                Dim item As GridGroupSummaryItem = New GridGroupSummaryItem()
                item.FieldName = column.FieldName
                item.ShowInGroupColumnFooter = bview.Columns(column.FieldName)
                item.SummaryType = DevExpress.Data.SummaryItemType.Sum
                item.DisplayFormat = "{0:n2}"

                bview.GroupSummary.Add(item)

                column.Summary.Add(SummaryItemType.Sum, column.FieldName, "GRAND TOTAL{0:n2}")


            End If

            col += 1
        Next

    End Sub

    Private Sub DesignGridView(bview As BandedGridView)

        For i As Integer = 0 To bview.Columns.Count - 1

            If bview.Columns.Count > 15 Then
                Select Case i
                    Case 1, 3
                        bview.Columns(i).Visible = False
                    Case 2, 4
                        bview.Columns(i).Width = 80
                    Case 5
                        bview.Columns(i).Width = 250
                    Case 6
                        bview.Columns(i).Width = 150
                    Case 0
                        bview.Columns(i).Width = 50
                End Select

            Else

                Select Case i
                    Case 1, 3
                        bview.Columns(i).Visible = False
                    Case 2, 4
                        bview.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        bview.Columns(i).Width = 100
                    Case 0
                        bview.Columns(i).Width = 80
                End Select

            End If







        Next

    End Sub

    Private Sub PopulateGridControl()

        RecordData.Columns.Clear()

        NumberSeries()
        HeaderPayee()
        HeaderFees()
        HeaderIncome()
        HeaderCashOnHand()


    End Sub

    Private Sub NumberSeries()
        Dim FiedlName As String = "NO."
        Dim Name As String = "NO."

        Dim GridColumn As BandedGridColumn = New DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn()
        GridColumn.Caption = "NO."
        GridColumn.FieldName = "NO."
        GridColumn.Visible = True

        GridColumn.AppearanceCell.Options.UseTextOptions = True
        GridColumn.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        GridColumn.DisplayFormat.FormatString = "{n1}"
        GridColumn.DisplayFormat.FormatType = DevExpress.Utils.FormatType.Custom


        _view.BandedGridView1.Columns.Add(GridColumn)
        RecordData.Columns.Add(FiedlName)


        Dim GridBand As GridBand = New DevExpress.XtraGrid.Views.BandedGrid.GridBand()
        GridBand.AppearanceHeader.Options.UseTextOptions = True
        GridBand.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        GridBand.AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
        GridBand.Caption = Name
        GridBand.Columns.Add(GridColumn)

        _view.BandedGridView1.Bands.Add(GridBand)
    End Sub

    Private Sub HeaderCashOnHand()


        Dim FiedlName As String = "CashOnHand"
        Dim Name As String = "CASH ON HAND"

        Dim GridColumn As BandedGridColumn = New DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn()
        GridColumn.Caption = "CASH ON HAND"
        GridColumn.FieldName = "CashOnHand"
        GridColumn.Visible = True

        GridColumn.AppearanceCell.Options.UseTextOptions = True
        GridColumn.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far
        GridColumn.DisplayFormat.FormatString = "{n2}"
        GridColumn.DisplayFormat.FormatType = DevExpress.Utils.FormatType.Custom


        'GridColumn.Summary.AddRange(New DevExpress.XtraGrid.GridSummaryItem() {New DevExpress.XtraGrid.GridColumnSummaryItem(DevExpress.Data.SummaryItemType.Sum, GridColumn.FieldName, "SUM={n2}")})

        _view.BandedGridView1.Columns.Add(GridColumn)
        RecordData.Columns.Add(FiedlName)


        Dim GridBand As GridBand = New DevExpress.XtraGrid.Views.BandedGrid.GridBand()
        GridBand.AppearanceHeader.Options.UseTextOptions = True
        GridBand.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        GridBand.AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
        GridBand.Caption = Name
        GridBand.Columns.Add(GridColumn)

        _view.BandedGridView1.Bands.Add(GridBand)

    End Sub

    Private Sub HeaderIncome()

        If header_income.Rows.Count > 0 Then

            Dim BandHeader As GridBand = New DevExpress.XtraGrid.Views.BandedGrid.GridBand()
            BandHeader.Caption = "OTHERS"
            BandHeader.AppearanceHeader.Options.UseTextOptions = True
            BandHeader.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
            BandHeader.RowCount = 2

            _view.BandedGridView1.Bands.Add(BandHeader)


            For Each rows As DataRow In header_income.Rows

                Try
                    Dim FiedlName As String = rows.Item("particulars").ToString
                    Dim Name As String = rows.Item("particulars").ToString

                    Dim GridColumn As BandedGridColumn = New DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn()
                    GridColumn.Caption = Name
                    GridColumn.FieldName = FiedlName
                    GridColumn.Visible = True

                    GridColumn.AppearanceCell.Options.UseTextOptions = True
                    GridColumn.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far
                    GridColumn.DisplayFormat.FormatString = "{n2}"
                    GridColumn.DisplayFormat.FormatType = DevExpress.Utils.FormatType.Custom

                    'GridColumn.Summary.AddRange(New DevExpress.XtraGrid.GridSummaryItem() {New DevExpress.XtraGrid.GridColumnSummaryItem(DevExpress.Data.SummaryItemType.Sum, GridColumn.FieldName, "SUM={n2}")})


                    _view.BandedGridView1.Columns.Add(GridColumn)
                    RecordData.Columns.Add(Name)

                    Dim GridBand As GridBand = New DevExpress.XtraGrid.Views.BandedGrid.GridBand()
                    GridBand.AppearanceHeader.Options.UseTextOptions = True
                    GridBand.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    GridBand.AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
                    GridBand.Caption = Name
                    GridBand.Columns.Add(GridColumn)
                    GridBand.RowCount = 2

                    _view.BandedGridView1.Bands.Add(GridBand)

                    BandHeader.Children.Add(GridBand)
                Catch ex As Exception

                End Try




            Next
        End If

    End Sub

    Private Sub HeaderFees()

        For Each rows As DataRow In header_fees.Rows

            Dim FiedlName As String = rows.Item("particulars").ToString
            Dim Name As String = rows.Item("particulars").ToString

            Dim GridColumn As BandedGridColumn = New DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn()
            GridColumn.Caption = Name
            GridColumn.FieldName = FiedlName
            GridColumn.Visible = True

            GridColumn.AppearanceCell.Options.UseTextOptions = True
            GridColumn.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far
            GridColumn.DisplayFormat.FormatString = "{n2}"
            GridColumn.DisplayFormat.FormatType = DevExpress.Utils.FormatType.Custom

            'GridColumn.Summary.AddRange(New DevExpress.XtraGrid.GridSummaryItem() {New DevExpress.XtraGrid.GridColumnSummaryItem(DevExpress.Data.SummaryItemType.Sum, GridColumn.FieldName, "SUM={n2}")})


            _view.BandedGridView1.Columns.Add(GridColumn)
            RecordData.Columns.Add(Name)

            Dim GridBand As GridBand = New DevExpress.XtraGrid.Views.BandedGrid.GridBand()
            GridBand.AppearanceHeader.Options.UseTextOptions = True
            GridBand.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
            GridBand.AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
            GridBand.Caption = Name
            GridBand.Columns.Add(GridColumn)
            GridBand.RowCount = 2

            _view.BandedGridView1.Bands.Add(GridBand)

        Next


    End Sub

    Private Sub HeaderPayee()

        For col As Integer = 0 To header_payee.Columns.Count - 1

            Dim FiedlName As String = header_payee.Columns(col).ToString
            Dim Name As String = header_payee(0)(col).ToString

            Dim GridColumn As BandedGridColumn = New DevExpress.XtraGrid.Views.BandedGrid.BandedGridColumn()
            GridColumn.Caption = Name
            GridColumn.FieldName = FiedlName
            GridColumn.BestFit()

            If col = 0 Or col = 2 Then
                GridColumn.Visible = False
            Else
                GridColumn.Visible = True
            End If

            _view.BandedGridView1.Columns.Add(GridColumn)
            RecordData.Columns.Add(FiedlName)

            Dim GridBand As GridBand = New DevExpress.XtraGrid.Views.BandedGrid.GridBand()
            GridBand.AppearanceHeader.Options.UseTextOptions = True
            GridBand.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
            GridBand.AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap

            GridBand.Caption = Name

            GridBand.Columns.Add(GridColumn)
            GridBand.RowCount = 2

            If col = 0 Or col = 2 Then
                GridBand.Visible = False
            Else
                GridBand.Visible = True
            End If

            _view.BandedGridView1.Bands.Add(GridBand)

        Next

    End Sub
End Class
