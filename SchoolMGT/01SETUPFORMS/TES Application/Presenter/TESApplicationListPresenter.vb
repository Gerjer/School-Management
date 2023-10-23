Imports DevComponents.DotNetBar
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class TESApplicationListPresenter
    Private _view As frmTESApplicationList
    Dim ListModel As New TESApplicationListModel
    Dim id As Integer
    Public Sub New(frmTESApplicationList As frmTESApplicationList)
        _view = frmTESApplicationList

        _view.gcTESApplication.Focus()
        loadComboBox()
        '     LoadYear()
        '     loadList()
        loadHandler()
    End Sub

    Private Sub loadComboBox()
        '_view.cmbUII.DataSource = ListModel.getUII()
        '_view.cmbUII.ValueMember = "ID"
        '_view.cmbUII.DisplayMember = "Name"
        '_view.cmbUII.SelectedIndex = -1

        _view.cmbScholar.DataSource = ListModel.getScholarName()
        _view.cmbScholar.ValueMember = "id"
        _view.cmbScholar.DisplayMember = "name"
        _view.cmbScholar.SelectedIndex = -1

        _view.cmbAcademicYear.DataSource = ListModel.getAcademicYear()
        _view.cmbAcademicYear.ValueMember = "id"
        _view.cmbAcademicYear.DisplayMember = "name"
        _view.cmbAcademicYear.SelectedIndex = -1

    End Sub

    Private Sub LoadYear()

        _view.cmbAcademicYear.Items.Clear()

        For i As Integer = Year(Date.Now) - 1 To 2000 Step -1
            Dim item As ComboBoxItem = New ComboBoxItem()
            item.Text = i
            _view.cmbAcademicYear.Items.Add(item)
        Next

        _view.cmbAcademicYear.SelectedIndex = 0

        _view.cmbScholar.Items.Clear()

        For i As Integer = Year(Date.Now) To 2000 Step -1
            Dim item As ComboBoxItem = New ComboBoxItem()
            item.Text = i
            _view.cmbScholar.Items.Add(item)
        Next
        _view.cmbScholar.SelectedIndex = 0


    End Sub

    Private Sub loadHandler()

        AddHandler _view.btnAdd.Click, AddressOf AddRecord
        AddHandler _view.btnEdit.Click, AddressOf EditRecord
        AddHandler _view.cmbAcademicYear.SelectionChangeCommitted, AddressOf cmbAcademicYear_SelectionChangeCommitted
        AddHandler _view.btnGenerate.Click, AddressOf GenerateHEIUII
        AddHandler _view.btnPrint.Click, AddressOf PrintReportTES
        AddHandler _view.btnPrintList.Click, AddressOf PrintReportTES
        '   AddHandler _view.gvTESApplication.RowCellClick, AddressOf SelectedRow
        AddHandler _view.BandedGridView1.RowCellClick, AddressOf SelectedRow

    End Sub



    Private Sub cmbAcademicYear_SelectionChangeCommitted(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbAcademicYear.SelectedItem, DataRowView)
            Dim academic_year = drv.Item("name").ToString

            loadList(_view.cmbScholar.SelectedValue, academic_year)
        Catch ex As Exception

        End Try
        _view.btnAdd.Focus()

    End Sub

    Private Sub PrintReportTES(sender As Object, e As EventArgs)

        Dim dt As New DataTable
        dt = _view.gcTESApplication.DataSource
        Select Case _view.cmbScholar.Text
            Case "TES"

            Case "GOVERNORS SCHOLAR"
            Case "LGU SAN JOSE"
            Case "LGU BASILISA"
            Case Else

        End Select

        PrintTES(dt)

    End Sub

    Private Sub PrintTES(dt As DataTable)

        Dim report As New xtrScholarApplicationList
        report.xrlacademicyear.Text = _view.cmbAcademicYear.Text
        report.txtHeader.Text = _view.cmbScholar.Text & " - " & "APPLICATION LIST"

        report.PrintableComponentContainer1.PrintableComponent = _view.gcTESApplication
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()
        report.ShowPreview




    End Sub

    Dim UII As String = ""
    Private Sub PrintTES(sender As Object, e As EventArgs)

        If _view.cmbUII.SelectedIndex = -1 Or _view.cmbUII.Text.Length > 0 Then
            Exit Sub
        Else
            If ListModel.CheckUII(_view.cmbUII.SelectedValue, _view.cmbAcademicYear.Text, _view.cmbScholar.Text) Then

                ContinuePrint()
            Else

                ListModel.SaveUII(_view.cmbUII.Text, _view.cmbAcademicYear.Text, _view.cmbScholar.Text)
                loadComboBox()
                ContinuePrint()
            End If

        End If


    End Sub

    Private Sub ContinuePrint()

        Dim TES As New List(Of TESApplication)
        Dim report As New XtraReportScholarshipTES

        Dim dt As New DataTable
        dt = ListModel.getScholarshipList(UII, _view.cmbAcademicYear.Text, _view.cmbScholar.Text)
        If dt.Rows.Count > 0 Then

            For Each row As DataRow In dt.Rows
                Dim obj As New TESApplication
                With obj

                    .class_roll_no = row.Item("class_roll_no")
                    .learner_ref_no = If(IsDBNull(row.Item("learner_ref_no")), "", row.Item("learner_ref_no"))
                    .std_number = If(IsDBNull(row.Item("std_number")), "", row.Item("std_number"))
                    .last_name = If(IsDBNull(row.Item("last_name")), "", row.Item("last_name"))
                    .first_name = If(IsDBNull(row.Item("first_name")), "", row.Item("first_name"))
                    .extension_name = If(IsDBNull(row.Item("student_extension_name")), "", row.Item("student_extension_name"))
                    .middle_name = If(IsDBNull(row.Item("middle_name")), "", row.Item("middle_name"))
                    .gender = If(IsDBNull(row.Item("gender")), "", row.Item("gender"))
                    .date_of_birth = If(IsDBNull(row.Item("date_of_birth")), "", row.Item("date_of_birth"))
                    .program_degree = If(IsDBNull(row.Item("course_name")), "", row.Item("course_name"))
                    .year_level = If(IsDBNull(row.Item("year_level")), "", row.Item("year_level"))
                    .father_last_name = If(IsDBNull(row.Item("father_last_name")), "", row.Item("father_last_name"))
                    .father_first_name = If(IsDBNull(row.Item("father_first_name")), "", row.Item("father_first_name"))
                    .father_middle_name = If(IsDBNull(row.Item("father_middle_name")), "", row.Item("father_middle_name"))
                    .mother_last_name = If(IsDBNull(row.Item("mother_last_name")), "", row.Item("mother_last_name"))
                    .mother_first_name = If(IsDBNull(row.Item("mother_first_name")), "", row.Item("mother_first_name"))
                    .mother_middle_name = If(IsDBNull(row.Item("mother_middle_name")), "", row.Item("mother_middle_name"))
                    .dswd_household_no = If(IsDBNull(row.Item("dswd_household_no")), "", row.Item("dswd_household_no"))
                    .income = If(IsDBNull(row.Item("income")), 0, row.Item("income"))
                    .address = If(IsDBNull(row.Item("address")), "", row.Item("address"))
                    .citymunicipality = If(IsDBNull(row.Item("citymunicipality")), "", row.Item("citymunicipality"))
                    .province = If(IsDBNull(row.Item("province")), "", row.Item("province"))
                    .zipcode = If(IsDBNull(row.Item("zipcode")), "", row.Item("zipcode"))
                    .total_assessment = If(IsDBNull(row.Item("total_assessment")), 0, row.Item("total_assessment"))
                    .disability = If(IsDBNull(row.Item("disability")), "", row.Item("disability"))
                    .telephone1 = If(IsDBNull(row.Item("telephone1")), "", row.Item("telephone1"))
                    .email = If(IsDBNull(row.Item("email")), "", row.Item("email"))
                    .UII = If(IsDBNull(row.Item("UII")), "", row.Item("UII"))
                    .indigenous = If(IsDBNull(row.Item("from_year")), "", row.Item("from_year"))
                    .to_year = If(IsDBNull(row.Item("to_year")), "", row.Item("to_year"))
                    .academic_year = If(IsDBNull(row.Item("from_year")), "", row.Item("from_year")) & "-" & If(IsDBNull(row.Item("to_year")), "", row.Item("to_year"))

                    ListModel.ModifyUII(row.Item("id"), UII)

                End With

                TES.Add(obj)

            Next

        End If

        report.xrlshcollname.Text = COMPANY_NAME
        report.xrlUII.Text = UII
        report.xrlacademicyear.Text = _view.cmbAcademicYear.Text & "-" & _view.cmbScholar.Text
        report.DataSource = TES
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()
        report.ShowPreviewDialog



    End Sub

    Private Sub GenerateHEIUII(sender As Object, e As EventArgs)

        _view.GroupPanel2.Visible = True
        _view.btnPrint.Focus()

        Dim dt As New DataTable
        dt = _view.gcTESApplication.DataSource
        Select Case _view.cmbScholar.Text
            Case "TES"
                PrintTES(dt)
            Case "GOVERNORS SCHOLAR"
            Case "LGU SAN JOSE"
            Case "LGU BASILISA"
            Case Else

        End Select

    End Sub

    Private Sub SelectedRow(sender As Object, e As RowCellClickEventArgs)

        Dim view As GridView = DirectCast(sender, GridView)
        id = view.GetFocusedRowCellValue("id")
    End Sub

    Private Sub EditRecord(sender As Object, e As EventArgs)
        _view.btnPrint.Focus()
        _view.GroupPanel2.Visible = False
        Dim frm As New frmTESApplicationEntry
        frm.scholar_id = _view.cmbScholar.SelectedValue
        frm.scholar_name = _view.cmbScholar.Text
        frm.academic_year = _view.cmbAcademicYear.Text
        frm.Operation = "EDIT"
        frm.id = id
        frm.BringToFront()
        frm.ShowDialog()

        If frm.DialogResult = DialogResult.OK Then
            loadList(_view.cmbScholar.SelectedValue, _view.cmbAcademicYear.Text)
            '         loadList()
        Else
            frm.Close()
        End If

    End Sub

    Private Sub AddRecord(sender As Object, e As EventArgs)

        _view.btnPrint.Focus()
        _view.GroupPanel2.Visible = False
        Dim NameHeader As String = ""
        Dim frm As New frmTESApplicationEntry
        If _view.cmbScholar.Text.Contains("SCHOLAR") Then
            NameHeader = _view.cmbScholar.Text & " RECORD ENTRY"
        Else
            NameHeader = _view.cmbScholar.Text & " SCHOLAR RECORD ENTRY"
        End If
        frm.scholar_id = _view.cmbScholar.SelectedValue
        frm.scholar_name = _view.cmbScholar.Text
        frm.academic_year = _view.cmbAcademicYear.Text
        frm.WinLabel.Text = NameHeader
        frm.Operation = "ADD"
        frm.BringToFront()
        frm.ShowDialog()

        If frm.DialogResult = DialogResult.OK Then
            '        loadList()
            loadList(_view.cmbScholar.SelectedValue, _view.cmbAcademicYear.Text)
        Else
            frm.Close()
        End If

    End Sub

    Public Sub loadList(ScholarID As String, AcademicYear As String)
        Dim dt As New DataTable
        dt = ListModel.getList(ScholarID, AcademicYear)
        _view.gcTESApplication.DataSource = Nothing
        _view.gcTESApplication.DataSource = dt
        '        Design(_view.BandedGridView1)
        '      Design(_view.BandedGridView1)

        '      DesignBandedView()
    End Sub

    Private Sub Design(view As GridView)

        '      view.BeginUpdate()
        'view.Bands.View.Columns.Count - 1
        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 2, 3, 8, 9, 11, 14, 17, 18, 20, 27, 28
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).BestFit()
                    '        view.Bands(i).Columns.View.BestFitColumns()
            '        view.Bands(i).Width = 100

                Case 4, 5, 6, 7, 10, 15, 19, 21, 22, 23, 24, 25, 26
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
         '           view.Bands(i).Columns.View.BestFitColumns()
                Case 16, 29
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Far
                    'gvTESviewApplication.Columns(i).BestFit()
                    '             view.Bands(i).Columns.View.BestFitColumns()
                Case Else
                    view.Columns(i).Visible = False
                    '         view.Bands(i).Visible = False
            End Select

        Next
        '     view.Bands.View.EndUpdate()

        '      view.EndUpdate()

    End Sub
End Class
