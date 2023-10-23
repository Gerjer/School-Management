Imports System.IO
Imports DevExpress.XtraGrid.Views
Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraPrinting.Drawing
Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class RequisitionSlipRecordPresenter
    Private _view As frmRequisitionSlip
    Dim RecordModel As New RequisitionSlipRecordModel
    Dim TypeOfRequest As New List(Of Requisition_TypeOfRequest)
    Dim PurposeOfRequest As New List(Of Requisition_PurposeRequest)
    Dim _id As Integer
    Dim OPERATION As String
    Dim Request As New Requesition

    Public Sub New(view As frmRequisitionSlip)
        _view = view

        loadCombobox()
        loadHandler()
        loadList()
        loadFormType()

        _view.TabItem13.Visible = False

    End Sub

    Private Sub loadFormType()

        Dim dt As New DataTable
        dt = RecordModel.getFormType()
        _view.gcFormType.DataSource = dt
        '       _view.gvFormType.OptionsBehavior.Editable = False
        getDesign1GridView(_view.gvFormType)
    End Sub

    Private Sub getDesign1GridView(view As Grid.GridView)

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 0, 1, 5, 6
                    view.Columns(i).Visible = False
                Case 2, 3
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.ReadOnly = True
                Case 4
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).BestFit()

            End Select

        Next

        view.OptionsView.ColumnAutoWidth = True

    End Sub

    Private Sub loadList()
        _view.gcRequestList.DataSource = RecordModel.getRecordList()
        getDesign1GridControl(_view.gvRequestList)
    End Sub
    Private Sub getDesign1GridControl(view As GridView)

        view.Columns.View.OptionsBehavior.Editable = False

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 0, 1, 2
                    view.Columns(i).Visible = False
                Case 3
                    view.Columns(i).Caption = "STUDENT NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).Width = 150
                Case 4
                    view.Columns(i).Caption = "DATE FILED"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
           '         view.Columns(i).Width = 150
                Case 5
                    view.Columns(i).Caption = "FIRST COPY?"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).Width = 150
                Case 6
                    view.Columns(i).Caption = "YEAR GRADUATED"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                Case 7
                    view.Columns(i).Caption = "YEAR FIRST ATTENDANCE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                Case 8
                    view.Columns(i).Caption = "YEAR LAST ATTENDANCE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceHeader.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                Case 9
                    view.Columns(i).Caption = "DUE DATE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                Case 10
                    view.Columns(i).Caption = "CLAIM WINDOW"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
            End Select

        Next

        view.OptionsView.ColumnAutoWidth = True

    End Sub
    Public Function getSelectedID(ID As Integer)
        RecordModel._id = ID
    End Function

    Private Sub loadHandler()

        AddHandler _view.cmbStudentName.SelectionChangeCommitted, AddressOf getValueDropDown
        AddHandler _view.cmbStudentName.KeyDown, AddressOf getValueEnter
        AddHandler _view.btnSave.Click, AddressOf Save
        AddHandler _view.gvRequestList.RowCellClick, AddressOf RowSelect
        AddHandler _view.btnAdd.Click, AddressOf Add
        AddHandler _view.btnCancel.Click, AddressOf Cancel
        AddHandler _view.gcRequestList.DoubleClick, AddressOf gcDoubleClick
        AddHandler _view.btnPrint.Click, AddressOf PrinDocument
        AddHandler _view.gvFormType.RowCellClick, AddressOf RowCheckboxSelect
        AddHandler _view.gvFormType.CellValueChanged, AddressOf CellValueChanged



    End Sub

    Private Sub SelectCheckbox(sender As Object, e As MouseEventArgs)
        'Dim View As GridView = DirectCast(sender, GridView)
        'If View.Columns("SELECT").ToString = "SELECT" Then
        '    If View.GetFocusedRowCellValue("SELECT") = False Then
        '        View.SetFocusedRowCellValue("NO. OF COPIES", 0)
        '    End If
        'End If


    End Sub

    Private Sub CheckCheckBox(sender As Object, e As CellValueChangedEventArgs)
        Dim View As GridView = DirectCast(sender, GridView)
        If e.Column.FieldName = "SELECT" Then
            If View.GetFocusedRowCellValue("SELECT") = False Then
                View.SetFocusedRowCellValue("NO. OF COPIES", 0)
            End If
        End If
    End Sub

    Dim FinanceTransactionCategoryID As Integer
    Dim FormTypeID As Integer
    Dim FormTypeName As String = ""
    Dim NoOfCopies As String = ""
    Dim Amount As Double

    Private Sub RowCheckboxSelect(sender As Object, e As RowCellClickEventArgs)
        Dim View As GridView = DirectCast(sender, GridView)
        FormTypeID = View.GetFocusedRowCellValue("id")
        FinanceTransactionCategoryID = _view.gvFormType.GetFocusedRowCellValue("finance_transaction_categories_id")
        Amount = _view.gvFormType.GetFocusedRowCellValue("amount")
    End Sub

    Private Sub getValueEnter(sender As Object, e As KeyEventArgs)
        If e.KeyCode = Keys.Enter Then
            Try
                Dim drv As DataRowView = DirectCast(_view.cmbStudentName.SelectedItem, DataRowView)
                _view.txtCourse.Text = drv.Item("Course").ToString
                _view.txtContact.Text = drv.Item("ContactNumber").ToString
                _view.txtAddress.Text = drv.Item("ADDRESS").ToString
                _view.lblstudent_ID.Text = drv.Item("class_roll_no").ToString
            Catch ex As Exception
            End Try
        End If
    End Sub

    Private Sub gvFormTypeDesign(sender As Object, e As EventArgs)

        Dim View As GridView = DirectCast(sender, GridView)

        For i As Integer = 0 To View.Columns.Count - 1

            Select Case i
                Case 0, 4, 5
                    View.Columns(i).Visible = False
                Case 1, 2
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
                    View.Columns(i).OptionsColumn.ReadOnly = True
                Case 3
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).BestFit()

            End Select

        Next

        View.OptionsView.ColumnAutoWidth = True

    End Sub

    Private Sub CellValueChanged(sender As Object, e As CellValueChangedEventArgs)

        Dim View As GridView = DirectCast(sender, GridView)

        If e.Column.FieldName = "SELECT" Then
            If e.Value = "False" Then
                View.SetFocusedRowCellValue("NO. OF COPIES", 0)

            Else
                View.Columns("NO. OF COPIES").OptionsColumn.ReadOnly = False
                View.FocusedRowHandle = e.RowHandle
                View.FocusedColumn = View.Columns("NO. OF COPIES")

                If RecordModel.CheckFormTypeToFinanceCategory(FinanceTransactionCategoryID) = True Then

                    Dim frm As New fmaIncomeSetupForm
                    frm.FeeCategoryID = FinanceTransactionCategoryID
                    frm.Amount = Amount
                    frm.Class_roll_no = _view.cmbStudentName.SelectedValue
                    frm.stdID = CInt(_view.lblstudent_ID.Text)
                    frm.txtRemarks.Text = "TOR - Requisition Slip"
                    frm.request_form = 1
                    frm.BringToFront()
                    frm.ShowDialog()
                End If

            End If

        End If


    End Sub

    Private Sub PrinDocument(sender As Object, e As EventArgs)

        If _view.rdbClaimStudb.Checked = True Then
            PrintClaimStub(_id)
        ElseIf _view.rdbtnBlankRequestForm.Checked Then
        Else

        End If


    End Sub

    Private Sub PrintClaimStub(id As Integer)

        Dim report As New XtraReport_ClaimStub

        'If Not File.Exists(COMPANY_HEADER_PATH) Then
        '    report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(DefaultHeaderPic))
        'Else
        '    report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(COMPANY_HEADER_PATH))
        'End If

        report.XrLName.Text = _view.cmbStudentName.Text
        report.XrLDateFiled.Text = _view.dtpDateFiled.Value
        report.XrLDueDate.Text = _view.dtpDateDue.Value
        report.XrLClaimWindow.Text = _view.txtClaimWindow.Text
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()
        report.ShowPreview

    End Sub

    Private Sub gcDoubleClick(sender As Object, e As EventArgs)

        If _view.gvRequestList.RowCount > 0 Then
            _view.btnAdd.Text = "Edit"

            _view.cmbStudentName.SelectedValue = row.Item("class_roll_number")

            getValueDropDown(_view.cmbStudentName.SelectedValue, _e)

            _view.dtpDateFiled.Value = row.Item("date_filed")
            _view.dtpDateDue.Value = row.Item("due_date")
            _view.txtYearGraduated.Text = row.Item("year_graduated")
            _view.txtFirstAttendance.Text = row.Item("year_first_attendance")
            _view.txtLastAttendance.Text = row.Item("year_last_attendance")
            _view.txtClaimWindow.Text = row.Item("request_window")
            If row.Item("first_copy") = "YES" Then
                _view.rdbtnYes.Checked = True
            Else
                _view.rdbtnNo.Checked = True
            End If

            _view.gvRequestList.OptionsDetail.EnableDetailToolTip = True

            'Type of Rwquest
            Dim dt As New DataTable
            dt = RecordModel.getTypeOfRequestRecord(_id)
            If dt.Rows.Count > 0 Then
                getTypeOfRequest(dt)
            End If
            dt = Nothing

            'Purpose of Request
            dt = RecordModel.gerPurposeOfRequest(_id)
            If dt.Rows.Count > 0 Then
                getPurposeOfRequest(dt)
            End If
        End If

    End Sub

    Private Sub Cancel(sender As Object, e As EventArgs)

        CleanAllControls(_view)

    End Sub

    Dim _e As EventArgs
    Private Sub Add(sender As Object, e As EventArgs)
        _view.Panel5.Enabled = True
        _view.TabControl4.Enabled = True


        If _view.btnAdd.Text = "Add" Then
            OPERATION = "ADD"
            CleanAllControls(_view)
        Else
            OPERATION = "EDIT"
        End If


    End Sub

    Dim row As DataRow
    Private Sub RowSelect(sender As Object, e As RowCellClickEventArgs)

        If _view.gvRequestList.RowCount > 0 Then
            '       _view.btnAdd.Text = "Edit"

            _id = _view.gvRequestList.GetFocusedRowCellValue("id")

            row = _view.gvRequestList.GetDataRow(e.Handled)

            '    _view.cmbStudentName.SelectedValue = row.Item("class_roll_number")

            '    getValueDropDown(_view.cmbStudentName.SelectedValue, _e)

            '    _view.dtpDateFiled.Value = row.Item("date_filed")
            '    _view.dtpDateDue.Value = row.Item("due_date")
            '    _view.txtYearGraduated.Text = row.Item("year_graduated")
            '    _view.txtFirstAttendance.Text = row.Item("year_first_attendance")
            '    _view.txtLastAttendance.Text = row.Item("year_last_attendance")
            '    _view.txtClaimWindow.Text = row.Item("request_window")
            '    If row.Item("first_copy") = "YES" Then
            '        _view.rdbtnYes.Checked = True
            '    Else
            '        _view.rdbtnNo.Checked = True
            '    End If

            '    _view.gvRequestList.OptionsDetail.EnableDetailToolTip = True


            '    'Type of Rwquest
            '    Dim dt As New DataTable
            '    dt = RecordModel.getTypeOfRequestRecord(_id)
            '    If dt.Rows.Count > 0 Then
            '        getTypeOfRequest(dt)
            '    End If
            '    dt = Nothing

            '    'Purpose of Request
            '    dt = RecordModel.gerPurposeOfRequest(_id)
            '    If dt.Rows.Count > 0 Then
            '        getPurposeOfRequest(dt)
            '    End If
        End If

    End Sub

    Public Function ClearObjectList()

        TypeOfRequest.Clear()
        PurposeOfRequest.Clear()

    End Function

    Private Sub getPurposeOfRequest(dt As DataTable)

        For Each row As DataRow In dt.Rows

            Dim CheckBox = Me.GetAllControls(_view).OfType(Of CheckBox)().ToList()
            For Each item As CheckBox In CheckBox
                If row.Item("purpose_request") = item.Text Then
                    item.Checked = True
                End If

            Next
        Next

    End Sub

    Private Sub getTypeOfRequest(dt As DataTable)

        For Each row As DataRow In dt.Rows

            Dim Label = Me.GetAllControls(_view).OfType(Of DevComponents.DotNetBar.LabelX)().ToList()
            For Each lbl As DevComponents.DotNetBar.LabelX In Label
                If row.Item("type_of_request") = lbl.Text Then
                    '      lbl.ForeColor = Color.OrangeRed

                    Dim TextBox = Me.GetAllControls(_view).OfType(Of DevComponents.DotNetBar.Controls.TextBoxX)().ToList()
                    For Each txtbx As DevComponents.DotNetBar.Controls.TextBoxX In TextBox
                        If lbl.Tag = txtbx.Tag Then
                            txtbx.Text = row.Item("no_of_copies")
                        End If
                    Next
                End If
            Next
        Next
    End Sub

    Dim LastPK As Integer
    Private Sub Save(sender As Object, e As EventArgs)

        ClearObjectList()

        With Request
            .class_roll_number = _view.cmbStudentName.SelectedValue
            .date_filed = FormatDate(_view.dtpDateFiled.Value)
            .due_date = FormatDate(_view.dtpDateFiled.Value)
            .first_copy = If(_view.rdbtnYes.Checked = True, 1, 0)
            .year_graduated = _view.txtYearGraduated.Text
            .year_first_attendance = _view.txtFirstAttendance.Text
            .year_last_attendance = _view.txtLastAttendance.Text
            .request_window = _view.txtClaimWindow.Text
        End With

        'Dim TextBox = Me.GetAllControls(_view).OfType(Of DevComponents.DotNetBar.Controls.TextBoxX)().ToList()
        'For Each txtbx As DevComponents.DotNetBar.Controls.TextBoxX In TextBox
        '    If txtbx.AccessibleName = "Type of Request" And txtbx.Text.Length > 0 Then

        '        Dim Label = Me.GetAllControls(_view).OfType(Of DevComponents.DotNetBar.LabelX)().ToList()
        '        For Each lbl As DevComponents.DotNetBar.LabelX In Label
        '            If txtbx.Tag = lbl.Tag Then
        '                Dim obj As New Requisition_TypeOfRequest
        '                With obj
        '                    .TypeOfFormName = lbl.Text
        '                    .NoOfCopies = txtbx.Text
        '                    .Tag = txtbx.Tag
        '                End With
        '                TypeOfRequest.Add(obj)
        '            End If
        '        Next

        '    End If
        'Next

        If _view.gvRequestList.RowCount > 0 Then
            Dim dt As New DataTable
            dt = _view.gcRequestList.DataSource
            For Each rows As DataRow In dt.Rows
                If rows.Item("SELECT").ToString = "True" Then
                    Dim obj As New Requisition_TypeOfRequest
                    With obj
                        .TypeOfFormName = rows.Item("FORM").ToString
                        .TypeOfFormID = rows.Item("id").ToString
                        .NoOfCopies = rows.Item("NO. OF COPIES").ToString
                    End With
                    TypeOfRequest.Add(obj)
                End If
            Next
        End If

        Dim CheckBox = Me.GetAllControls(_view).OfType(Of CheckBox)().ToList()
        For Each item As CheckBox In CheckBox
            If item.Checked = True Then
                Dim obj As New Requisition_PurposeRequest
                With obj
                    .PurposeOfRequest = item.Text
                End With
                PurposeOfRequest.Add(obj)
            End If

        Next

        RecordModel._id = _id
        LastPK = RecordModel.Insert(OPERATION, Request)
        RecordModel.InsertObjectList(TypeOfRequest, PurposeOfRequest, LastPK)

        MyMessageBox(OPERATION)
        loadList()
        CleanAllControls(_view)

        _view.Panel5.Enabled = False
        _view.TabControlPanel9.Enabled = False
        _view.TabControlPanel10.Enabled = False

        _view.btnAdd.Text = "Add"

    End Sub

    Friend Sub TrapInput(sender As Object)
        Dim txtBox As TextBox = sender
        Select Case txtBox.Text
            Case "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", ""
                '         add_objectlist(txtBox.Text, txtBox.Tag)
                txtBox.Text = txtBox.Text
            Case Else
                MsgBox("Invalid Input")
                txtBox.Text = ""
        End Select

    End Sub

    Private Sub add_objectlist(NoOfCopies As String, tag As Object)
        Dim RequestType As String = ""
        Dim labelX = Me.GetAllControls(_view).OfType(Of DevComponents.DotNetBar.LabelX)().ToList()
        If tag = 13 Then
            RequestType = _view.TextBoxX11.Text
            Dim obj As New Requisition_TypeOfRequest
            With obj
                .TypeOfFormName = RequestType
                .NoOfCopies = NoOfCopies
                .Tag = tag
            End With
            TypeOfRequest.Add(obj)
        Else


            For Each item As DevComponents.DotNetBar.LabelX In labelX
                If item.Tag = tag Then
                    RequestType = item.Text
                    'If exist modify
                    For Each rows In TypeOfRequest.ToList
                        If rows.Tag = tag Then
                            rows.NoOfCopies = ReplaceMe(rows.NoOfCopies, NoOfCopies)
                        End If
                    Next

                    'Add if not exist
                    Dim obj As New Requisition_TypeOfRequest
                    With obj
                        .TypeOfFormName = RequestType
                        .NoOfCopies = NoOfCopies
                        .Tag = tag
                    End With
                    TypeOfRequest.Add(obj)
                End If

            Next

        End If

    End Sub

    Private Function GetAllControls(control As Control) As IEnumerable(Of Control)
        Dim controls = control.Controls.Cast(Of Control)()
        Return controls.SelectMany(Function(ctrl) GetAllControls(ctrl)).Concat(controls)
    End Function

    Friend Sub ChekBoxEdit(Name As String)

        'If exist modify
        For Each rows In PurposeOfRequest.ToList
            If rows.PurposeOfRequest = Name Then
                rows.PurposeOfRequest = ReplaceMe(rows.PurposeOfRequest, Name)
            End If
        Next

        'Add if not exist
        Dim obj As New Requisition_PurposeRequest
        With obj
            .PurposeOfRequest = Name
        End With
        PurposeOfRequest.Add(obj)

    End Sub


    Public Sub getValueDropDown(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbStudentName.SelectedItem, DataRowView)
            _view.txtCourse.Text = drv.Item("Course").ToString
            _view.txtContact.Text = drv.Item("ContactNumber").ToString
            _view.txtAddress.Text = drv.Item("ADDRESS").ToString
            _view.lblstudent_ID.Text = drv.Item("stdID").ToString
        Catch ex As Exception

        End Try

    End Sub

    Private Sub loadCombobox()

        _view.cmbStudentName.DataSource = RecordModel.getStudentRecord()
        _view.cmbStudentName.ValueMember = "ID"
        _view.cmbStudentName.DisplayMember = "Name"
        _view.cmbStudentName.SelectedIndex = -1

    End Sub
End Class
