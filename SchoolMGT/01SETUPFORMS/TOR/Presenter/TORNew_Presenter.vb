Imports System.ComponentModel
Imports DevExpress.Data
Imports DevExpress.XtraEditors.Controls
Imports DevExpress.XtraEditors.Repository
Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class TORNew_Presenter
    Private _view As frmTORNew
    Dim RecordModel As New TORNew_Model
    Dim Form9Details As New List(Of Form9Details)
    Dim OPERATION As String = ""
    Dim recordColumn As DataTable

    Public Sub New(view As frmTORNew)
        _view = view

        _student_category_id = 13
        _view.expEntryRecord.Expanded = False

        If _view.cmbStudent.Focus = False Then
            _view.cmbStudent.Select()
        End If

        loadStudent()
        loadSchoolName()
        loadSchoolAddress()
        loadhandler()

        If _view.CheckBox1.Checked = True Then
            _view.cmbSchoolName.Text = "DON JOSE ECLEO MEMORIAL COLLEGE"
            _view.cmbSchoolAddress.Text = "Justiniana Edera, San Jose, Dinagat Island"
        End If

        If _view.rdbBackTrack.Checked = False Or _view.rdbCurrentRecord.Checked = False Then
        End If

        recordColumn = RecordModel.PopulateColumn()
        dr = recordColumn

    End Sub

    Private Sub loadSchoolAddress()

        _view.cmbSchoolAddress.DataSource = RecordModel.getSchoolAddress()
        _view.cmbSchoolAddress.ValueMember = "id"
        _view.cmbSchoolAddress.DisplayMember = "name"
        _view.cmbSchoolAddress.SelectedIndex = -1

    End Sub

    Private Sub loadSchoolName()

        _view.cmbSchoolName.DataSource = RecordModel.getSchoolName()
        _view.cmbSchoolName.ValueMember = "id"
        _view.cmbSchoolName.DisplayMember = "name"
        _view.cmbSchoolName.SelectedIndex = -1

    End Sub

    Private Sub loadStudent()

        _view.cmbStudent.DataSource = RecordModel.getStudent()
        _view.cmbStudent.ValueMember = "id"
        _view.cmbStudent.DisplayMember = "name"
        _view.cmbStudent.SelectedIndex = -1

    End Sub

    Private Sub loadCheckBox()

        If _view.rdbBackTrack.Checked = True Then

            personID_image = 0
            _view.LabelX2.Visible = True
            _view.txtTotalSubject.Visible = True

            _view.Label13.Visible = False
            _view.cmbBatch.Visible = False

            _view.cmbYearLevel.DropDownStyle = ComboBoxStyle.DropDown
            _view.cmbSemester.DropDownStyle = ComboBoxStyle.DropDown

            OPERATION = "SAVE RECORD"
        Else

            personID_image = PERSON_ID

            _view.Label13.Visible = True
            _view.cmbBatch.Visible = True

            _view.LabelX2.Visible = False
            _view.txtTotalSubject.Visible = False

            _view.cmbYearLevel.DropDownStyle = ComboBoxStyle.DropDown
            _view.cmbSemester.DropDownStyle = ComboBoxStyle.DropDown


        End If

    End Sub

    Private Sub loadhandler()

        AddHandler _view.cmbStudent.SelectedIndexChanged, AddressOf SelectedIndexChanged_Student
        AddHandler _view.cmbAcademicYear.SelectedIndexChanged, AddressOf AcademicSelected
        AddHandler _view.cmbCourse.SelectionChangeCommitted, AddressOf CourseSelected
        AddHandler _view.cmbBatch.SelectionChangeCommitted, AddressOf BatchSelected
        AddHandler _view.cmbYearLevel.TextChanged, AddressOf TextChanged_YearLevel
        '     AddHandler _view.cmbSchoolName.SelectionChangeCommitted, AddressOf SchoolSelected
        '   AddHandler _view.cmbSchoolName.SelectedIndexChanged, AddressOf SchoolSelected
        AddHandler _view.cmbSchoolName.SelectedIndexChanged, AddressOf SchoolSelected

        AddHandler _view.rdbCurrentRecord.CheckedChanged, AddressOf EnableBatch
        AddHandler _view.rdbBackTrack.CheckedChanged, AddressOf EnableBatch
        AddHandler _view.CheckBox1.CheckedChanged, AddressOf DefaultChange

        AddHandler _view.btnAddRecord.Click, AddressOf AddRecord
        AddHandler _view.btnSave.Click, AddressOf SaveRecord
        AddHandler _view.btnLoadRecord.Click, AddressOf GetRecord
        AddHandler _view.btnPrint.Click, AddressOf PrintTORNew
        AddHandler _view.btnEditForm9.Click, AddressOf btnEditForm9_Click
        AddHandler _view.btnRemoveRecord.Click, AddressOf btnRemoveRecord_Click
        AddHandler _view.btnRemoveForm9.Click, AddressOf btnRemoveForm9_Click

        AddHandler _view.gvTOR.CellValueChanged, AddressOf gvForm9_CellValueChanged

        AddHandler _view.gvRecord.InitNewRow, AddressOf gvRecord_InitNewRow
        AddHandler _view.RepositoryItemLookUpEdit1.Closed, AddressOf RepositoryItemLookUpEdit1_Closed


        AddHandler _view.FormClosing, AddressOf FormClosed

    End Sub

    Private Sub TextChanged_YearLevel(sender As Object, e As EventArgs)
        _view.cmbYearLevel.Tag = _view.cmbYearLevel.Text
        _view.cmbYearLevel.Text = _view.cmbYearLevel.Tag
    End Sub

    Private Sub btnRemoveForm9_Click(sender As Object, e As EventArgs)

        If MessageBox.Show("Are you sure ?,You want to Delete this Record???", "Please verify...!!!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then

            If BackTrackID > 2 Then
                '         RecordModel.DeleteRecord(Form9ID)
                MsgBox("Record has been Detedted")
                'DisplayForm9List()
            Else
                MsgBox("Connot Delete Record..")
            End If

        End If


    End Sub

    Private Sub btnRemoveRecord_Click(sender As Object, e As EventArgs)

        Dim view As GridView = _view.gcRecord.FocusedView

        For x As Integer = 0 To view.RowCount - 1
            If view.GetRowCellDisplayText(x, "INCLUDE") = "True" Then
                view.DeleteRow(x)
            End If
        Next
    End Sub



    Private Sub gvForm9_CellValueChanged(sender As Object, e As CellValueChangedEventArgs)

        Dim view As GridView = TryCast(sender, GridView)
        Dim id = view.GetRowCellValue(e.RowHandle, view.Columns("BackTrackID"))
        BackTrackID = id

        Try

            Dim dt As DataTable = _view.gcTOR.DataSource

            If e.Column.FieldName = "INCLUDE" Then
                If e.Column.OptionsColumn.AllowEdit = True And id <> 1 Then

                    If dr.Rows.Count > 0 Then

                        Dim existing = dr.Select("id = '" & id & "'")

                        If existing.Length > 0 Then
                            For Each row As DataRow In From row1 As DataRow In dr.Rows Where (row1("id") = (id))
                                dr.Rows.Remove(row)
                                '      dr.Rows.AcceptChanges(
                            Next
                        Else
                            For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = (id))
                                dr.Rows.Add(e.Value, row.Item("subject_code"), row.Item("subject_name"), row.Item("finalgrade"),
                                row.Item("credit_hours"), row.Item("credit_distribution_id"), row.Item("person_id"),
                                "", row.Item("school_name"), row.Item("school_address"), row.Item("Program"), row.Item("semester"),
                                row.Item("year_level"), row.Item("academice_year"), row.Item("credit_inorder"), row.Item("id"))
                            Next
                        End If


                    Else
                        For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = (id))
                            dr.Rows.Add(e.Value, row.Item("subject_code"), row.Item("subject_name"), row.Item("finalgrade"),
                            row.Item("credit_hours"), row.Item("credit_distribution_id"), row.Item("person_id"),
                            "", row.Item("school_name"), row.Item("school_address"), row.Item("Program"), row.Item("semester"),
                            row.Item("year_level"), row.Item("academice_year"), row.Item("credit_inorder"), row.Item("id"))
                        Next
                    End If

                Else
                    view.SetRowCellValue(e.RowHandle, "INCLUDE", "True")
                End If
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Private Sub btnEditForm9_Click(sender As Object, e As EventArgs)

        '  Dim dt As DataTable = _view.gcForm9.DataSource
        'global_dt = _view.GridControl1.DataSource.clone
        'Dim Row As DataRow = RowView.Row

        dt_Record.Rows.Clear()

        For Each row As DataRow In dr.Rows

            If row.Item("INCLUDE").ToString = "True" And row.Item("id") <> 1 Then

                If _view.gvRecord.RowCount > 0 Then

                    dt_Record.Rows.Add("False", row.Item("Code"), row.Item("SubjectTitle"), row.Item("FinalGrade"), row.Item("CreditsHours"), row.Item("CreditID"), row.Item("PersonID"), "", row.Item("SchoolName").ToString, row.Item("SchoolAddress").ToString, row.Item("ProgramName").ToString, row.Item("Semester").ToString, row.Item("YearLevel").ToString, row.Item("AcademicYear").ToString, row.Item("inorder"), row.Item("id"))
                Else

                    If dt_Record.Columns.Count > 0 Then
                    Else
                        '                 dt_Record = RecordModel.getColumnHeader
                    End If

                    dt_Record.Rows.Add("False", row.Item("Code"), row.Item("SubjectTitle"), row.Item("FinalGrade"), row.Item("CreditsHours"), row.Item("CreditID"), row.Item("PersonID"), "", row.Item("SchoolName").ToString, row.Item("SchoolAddress").ToString, row.Item("ProgramName").ToString, row.Item("Semester").ToString, row.Item("YearLevel").ToString, row.Item("AcademicYear").ToString, row.Item("inorder"), row.Item("id"))
                End If


            End If


        Next
        _view.gcRecord.DataSource = dt_Record
        OPERATION = "UPDATE RECORD"
        _view.btnSave.Text = "UPDATE RECORD"
    End Sub

    Dim dr As DataTable

    Private Sub gvForm9_RowCellClick(sender As Object, e As RowCellClickEventArgs)


        Dim view As GridView = TryCast(sender, GridView)
        Dim id = view.GetRowCellValue(e.RowHandle, view.Columns("id"))

        'Dim rows = dr.Select("id=" & id & "")
        'If rows.Length > 0 Then
        '    For Each row As DataRow In From row1 As DataRow In dr.Rows Where (row1("id") = id)
        '        dr.Rows.Remove(row)
        '        dr.AcceptChanges()
        '    Next
        'Else
        '    Dim dt As DataTable = _view.gcForm9.DataSource
        '    For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = id)
        '        dr.ImportRow(row)
        '    Next
        'End If



        'If e.Column.FieldName = "INCLUDE" Then
        '    If e.Column.OptionsColumn.AllowEdit = False Then
        '        view.SetRowCellValue(e.RowHandle, "INCLUDE", "true")
        '    End If
        'End If

    End Sub

    'Private Sub RowCellStyle(sender As Object, e As RowCellStyleEventArgs)


    '    Dim view As GridView = TryCast(sender, GridView)

    '    Dim id = view.GetRowCellValue(e.RowHandle, view.Columns("id"))

    '    If id = 1 Then
    '        e.Column.OptionsColumn.AllowEdit = False
    '        e.Column.OptionsColumn.ReadOnly = True
    '        e.Appearance.BackColor = System.Drawing.Color.Gainsboro

    '    Else
    '        e.Column.OptionsColumn.AllowEdit = True
    '    End If


    'End Sub

    Dim Print As New TORDetails
    Private Sub PrintTORNew(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Print.PreviewTOR_DJEMFCST(_view.cmbStudent.SelectedValue, "", "", "", "")

        Cursor.Current = Cursors.Default



    End Sub

    Private Sub AcademicSelected(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbAcademicYear.SelectedItem, DataRowView)
            _academic_year = drv.Item("name").ToString
        Catch ex As Exception

        End Try
    End Sub

    Private Sub FormClosed(sender As Object, e As FormClosingEventArgs)
        personID_image = 0
        '    _view.Close()
    End Sub

    Private Sub DefaultChange(sender As Object, e As EventArgs)

        If _view.CheckBox1.Checked = True Then
            _view.cmbSchoolName.Text = "DON JOSE ECLEO MEMORIAL COLLEGE"
            _view.cmbSchoolAddress.Text = "Justiniana Edera, San Jose, Dinagat Island"
        Else

            _view.cmbSchoolName.DataSource = RecordModel.getSchoolName()
            _view.cmbSchoolName.ValueMember = "id"
            _view.cmbSchoolName.DisplayMember = "name"
            _view.cmbSchoolName.SelectedIndex = -1

            _view.cmbSchoolAddress.DataSource = RecordModel.getSchoolAddress()
            _view.cmbSchoolAddress.ValueMember = "id"
            _view.cmbSchoolAddress.DisplayMember = "name"
            _view.cmbSchoolAddress.SelectedIndex = -1


        End If

    End Sub

    Private Sub GetRecord(sender As Object, e As EventArgs)
        If _view.rdbCurrentRecord.Checked Then
            loadRecord(_studentID)
        Else
            loadManualEntryRecord()
        End If

    End Sub

    Dim BackTrackID As String
    Dim SchoolName As String
    Dim SchoolAddress As String
    Dim CourseCode As String
    Dim SubjectName As String
    Dim finalgrade As String

    Private Sub loadManualEntryRecord()

        If _view.rdbBackTrack.Checked = True Then

            If _view.cmbAcademicYear.Text = "" Then
                MsgBox("Required Fields", MessageBoxIcon.Information)
                Exit Sub
            End If
            If _view.cmbCourse.Text = "" Then
                MsgBox("Required Fields", MessageBoxIcon.Information)
                Exit Sub
            End If
            If _view.txtProgram.Text = "" Then
                MsgBox("Required Fields", MessageBoxIcon.Information)
                Exit Sub
            End If
            If _view.cmbSemester.Text = "" Then
                MsgBox("Required Fields", MessageBoxIcon.Information)
                Exit Sub
            End If
            If _view.cmbYearLevel.Text = "" Then
                MsgBox("Required Fields", MessageBoxIcon.Information)
                Exit Sub
            End If


            Dim ctr As Integer = 0
            While CInt(_view.txtTotalSubject.Text) > ctr
                
                dr.Rows.Add("False", "", "", _view.txtSetFG.Text, _view.txtSetEX.Text, _view.txtSetUnit.Text, "", PERSON_ID, "", _view.cmbSemester.Text.ToUpper, _view.cmbAcademicYear.Text, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.cmbYearLevel.Text.ToUpper, _view.txtProgram.Text)

                ctr += 1

            End While

            _view.gcRecord.DataSource = dr

        End If

        _view.txtTotalSubject.Text = "1"

    End Sub

    Private Sub SchoolSelected(sender As Object, e As EventArgs)

        Try

            Dim drv As DataRowView = TryCast(_view.cmbSchoolName.SelectedItem, DataRowView)
            _view.cmbSchoolAddress.Text = drv.Item("name").ToString

        Catch ex As Exception
        End Try

    End Sub

    Private Sub SaveRecord(sender As Object, e As EventArgs)

        If OPERATION = "SAVE RECORD" Then
            RecordModel.InsertRecord(_view.gvRecord)
        Else
            '       RecordModel.UpdateRecord(_view.gvRecord)

            OPERATION = "SAVE RECORD"
            _view.btnSave.Text = "SAVE RECORD"
        End If


        'Dim dt As DataTable = _view.gcRecord.DataSource
        'RecordModel.InsertRecord1(dt)

        _view.gcRecord.DataSource = Nothing
        dr.Rows.Clear()


        MessageBox.Show("Record Save...", "Successfully!")

        DisplayTORList()


    End Sub

    Public Sub RepositoryItemLookUpEdit1_Closed(sender As Object, e As ClosedEventArgs)

        Dim Repo As DevExpress.XtraEditors.LookUpEdit = DirectCast(sender, DevExpress.XtraEditors.LookUpEdit)

        Dim inorder = Repo.GetColumnValue("inorder")
        _view.gvRecord.SetRowCellValue(_view.gvRecord.FocusedRowHandle, _view.gvRecord.Columns("inorder"), inorder)

    End Sub

    Private Sub gvRecord_InitNewRow(sender As Object, e As InitNewRowEventArgs)


        Dim dt As DataTable = _view.gcRecord.DataSource
        '     _view.gvRecord.Columns.Clear()
        Dim dummy As New DataTable
        dummy = dt.Clone

        For x As Integer = 0 To dt.Rows.Count - 1

            If ROW = x Then
                '       Dim inorder As Integer = RecordModel.getCreditInOrder(dt(x)(5).ToString)
                dummy.Rows.Add(dt(x)(0), dt(x)(1), dt(x)(2), dt(x)(3), dt(x)(4), dt(x)(5), dt(x)(6), dt(x)(7), dt(x)(8), dt(x)(9), dt(x)(10), dt(x)(11), dt(x)(12), dt(x)(13), dt(x)(14))
                '        dummy(x)(13) = RecordModel.getCreditInOrder(dt(x)(5).ToString)
                dummy.Rows.Add("False", "", "", "", 0, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.cmbAcademicYear.Text, 0)

            Else
                '         Dim inorder As Integer = RecordModel.getCreditInOrder(dt(x)(5).ToString)
                dummy.Rows.Add(dt(x)(0), dt(x)(1), dt(x)(2), dt(x)(3), dt(x)(4), dt(x)(5), dt(x)(6), dt(x)(7), dt(x)(8), dt(x)(9), dt(x)(10), dt(x)(11), dt(x)(12), dt(x)(13), dt(x)(14))
                '            dummy(x)(13) = RecordModel.getCreditInOrder(dt(x)(5).ToString)
            End If

        Next

        _view.gcRecord.DataSource = Nothing

        _view.gcRecord.DataSource = dummy


    End Sub

    Dim ROW As Integer
    Dim dt_row As DataRow

    Private Sub gvRecord_RowCellClick(sender As Object, e As RowCellClickEventArgs)
        Dim view As GridView = DirectCast(sender, GridView)
        ROW = e.RowHandle


    End Sub


    Private Sub RepoSelectedChange(sender As Object, e As CustomDisplayTextEventArgs)

        If e.DisplayText <> "[EditValue is null]" Then

            Dim RepoCredits As RepositoryItemLookUpEdit = DirectCast(sender, RepositoryItemLookUpEdit)

            Dim x = RepoCredits.GetKeyValueByDisplayValue("inorder")
            Dim z = RepoCredits.GetDataSourceRowByDisplayValue("inorder")
            Dim y = RepoCredits.GetDisplayText(RepoCredits.Columns(2))

            Dim row As Integer = _view.gvRecord.FocusedRowHandle
            _view.gvRecord.SetRowCellValue(_view.gvRecord.FocusedRowHandle, _view.gvRecord.FocusedColumn, x)
        End If
    End Sub


    Dim dt_Record As New DataTable
    Private Sub AddRecord(sender As Object, e As EventArgs)

        If _view.rdbBackTrack.Checked = True Then

            If _view.gvRecord.RowCount > 0 Then
                _view.gcRecord.DataSource = Nothing
                dt_Record.Rows.Add("False", "", "", "", 0, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.cmbAcademicYear.Text, 0)
                _view.gcRecord.DataSource = dt_Record
            Else
                '         dt_Record = RecordModel.getColumnHeader()
                dt_Record.Rows.Add("False", "", "", "", 0, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.cmbAcademicYear.Text, 0)
                _view.gcRecord.DataSource = dt_Record
            End If

        Else
            _view.gvRecord.AddNewRow()
        End If



    End Sub

    Dim dummy As New DataTable

    Private Sub InsertRow()

        'GridView.SetFocusedRowCellValue("NameOfField","My Field Value")
        _view.gvRecord.AddNewRow()
        Dim rowHandler As Integer = _view.gvRecord.RowCount
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(0), "False")
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(1), "")
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(2), "")

        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(3), "")
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(4), 0)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(5), "")
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(6), PERSON_ID)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(7), _studentID)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(8), _view.cmbSchoolName.Text)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(9), _view.cmbSchoolAddress.Text)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(10), _view.txtProgram.Text)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(11), _view.cmbSemester.Text)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(12), _view.cmbYearLevel.Text)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(13), _view.cmbAcademicYear.Text)
        _view.gvRecord.SetRowCellValue(rowHandler, _view.gvRecord.Columns(14), "")



        'dummy.Rows.Count > 0 Or
        'If dummy.Rows.Count > 0 Then
        '    dummy.Rows.Add("False", "", "", "", 0, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.txtAY.Text, 0)
        '    _view.gcRecord.DataSource = Nothing
        '    _view.gcRecord.DataSource = dummy
        'Else

        '    dummy = RecordModel.getColumnHeader()
        '    dummy.Rows.Add("False", "", "", "", 0, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.txtAY.Text, 0)

        'End If

    End Sub

    Private Function BatchSelected() As Object
        Try

            Dim drv As DataRowView = DirectCast(_view.cmbBatch.SelectedItem, DataRowView)
            _view.cmbYearLevel.Text = drv.Item("year_level").ToString
            _view.cmbSemester.Text = drv.Item("semester").ToString

            '      _studentID = RecordModel.getStudentID(PERSON_ID, _view.cmbBatch.SelectedValue)
            '     loadRecord(_studentID)


        Catch ex As Exception

        End Try

        Return Nothing
    End Function

    Private Sub loadRecord(StudentID As Integer)

        _view.gcRecord.DataSource = Nothing
        '      _view.gcRecord.DataSource = RecordModel.getCreditDistributionRecord(StudentID)

        If _view.gvRecord.RowCount > 0 Then

            _view.gvRecord.BeginDataUpdate()

            For i As Integer = 0 To _view.gvRecord.DataRowCount - 1

                _view.gvRecord.SetRowCellValue(i, "SchoolName", _view.cmbSchoolName.Text)
                _view.gvRecord.SetRowCellValue(i, "SchoolAddress", _view.cmbSchoolAddress.Text)

            Next
            _view.gvRecord.EndDataUpdate()

        End If

    End Sub

    Private Sub CourseSelected(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCourse.SelectedItem, DataRowView)
            _courseID = drv.Item("id").ToString
            _view.txtProgram.Text = drv.Item("description").ToString
            'If _view.rdbCurrentRecord.Checked = True Then
            '    loadBatch()
            'End If
            '    loadCredDist()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Dim cmbRepoCredits As RepositoryItemLookUpEdit

    Dim dt_credit As DataTable

    Private Sub loadCredDist()

        _view.RepositoryItemLookUpEdit1 = New DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit()
        '   _view.RepositoryItemLookUpEdit1.DataSource = RecordModel.getCreditsDistribution
        _view.RepositoryItemLookUpEdit1.ValueMember = "id"
        _view.RepositoryItemLookUpEdit1.DisplayMember = "name"
        _view.RepositoryItemLookUpEdit1.BestFitMode = DevExpress.XtraEditors.Controls.BestFitMode.BestFitResizePopup
        _view.gvRecord.Columns("CreditID").ColumnEdit = _view.RepositoryItemLookUpEdit1
        _view.gvRecord.BestFitColumns()


    End Sub

    Private Sub loadBatch()

        '    _view.cmbBatch.DataSource = RecordModel.getBatch(_view.cmbAcademicYear.Text)
        _view.cmbBatch.ValueMember = "id"
        _view.cmbBatch.DisplayMember = "name"
        _view.cmbBatch.SelectedIndex = -1

    End Sub

    Private Sub EnableBatch(sender As Object, e As EventArgs)

        loadComboBox()

        loadCheckBox()

        _view.Panel7.Enabled = True
        _view.GroupBox1.Enabled = True
        _view.GroupPanel1.Enabled = True

        '_view.Panel1.Enabled = True
        '_view.GroupBox1.Enabled = True
        '_view.GroupPanel2.Enabled = True
        '_view.GroupPanel1.Visible = True


    End Sub

    Private Sub SelectedIndexChanged_Student(sender As Object, e As EventArgs)

        _view.expEntryRecord.Expanded = True
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbStudent.SelectedItem, DataRowView)
            PERSON_ID = drv.Item("id").ToString
            personID_image = drv.Item("id").ToString

            DisplayTORList()
            dummy.Rows.Clear()
            dummy.Columns.Clear()
        Catch ex As Exception
        End Try

    End Sub

    Private Sub DisplayTORList()

        Dim dt As New DataTable

        dt = RecordModel.loadTOR(PERSON_ID)
        If dt.Rows.Count > 0 Then

            dt.Columns.Add("INCLUDE")
            Dim lastColumns As Integer = dt.Columns.Count - 1

            Dim x As Integer = 0
            For Each rows As DataRow In dt.Rows
                If rows.Item("BackTrackID") = 0 Then
                    dt.Rows(x)(lastColumns) = "True"
                Else
                    dt.Rows(x)(lastColumns) = "False"
                End If
                x += 1
            Next


            _view.gcTOR.DataSource = dt

            DesignGridView(_view.gvTOR)

            '_view.gvTOR.Columns("SchoolNameAddress").GroupIndex = 0
            '_view.gvTOR.Columns("academice_year").GroupIndex = 1
            '_view.gvTOR.Columns("SemAY").GroupIndex = 2

            dt = Nothing

            dt = RecordModel.TORRemarks(PERSON_ID)
            If dt.Rows.Count > 0 Then
                Try
                    '_view.txtPurpose.Text = If(IsDBNull(dt(0)("remarks_purpose").ToString), "", dt(0)("remarks_purpose").ToString)
                    '_view.txtGraduated.Text = If(IsDBNull(dt(0)("remarks_graduate").ToString), "", dt(0)("remarks_graduate").ToString)
                    '_view.txtNSTP.Text = If(IsDBNull(dt(0)("remarks_nstp").ToString), "", dt(0)("remarks_nstp").ToString)
                    'subject_code = If(IsDBNull(dt(0)("subject_code").ToString), "", dt(0)("subject_code").ToString)
                    'NSTP_CODE = subject_code
                    'subject_id = If(IsDBNull(dt(0)("subject_id").ToString), "", dt(0)("subject_id").ToString)
                    '_view.cmbSubject.SelectedValue = subject_id
                    'graduate_status = If(IsDBNull(dt(0)("graduated").ToString), 0, dt(0)("graduated").ToString)
                    '_view.txtFilePath.Text = If(IsDBNull(dt(0)("photo_path").ToString), 0, dt(0)("photo_path").ToString)
                    'If graduate_status = 1 Then
                    '    _view.chkGraduate.Checked = True
                    '    _view.dtpDateGraduation.Value = If(IsDBNull(dt(0)("date_graduation").ToString), "", dt(0)("date_graduation").ToString)
                    'End If
                Catch ex As Exception

                End Try

            End If


        Else
            '         MsgBox("Record NOT FOUND...!!!", MsgBoxStyle.Critical, "RECORD NOT FOUND")
        End If

        _view.gvTOR.ExpandAllGroups()
    End Sub

    Private Sub DesignGridView(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)

        view.BeginUpdate()

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                'Case 0, 1, 2, 3, 4, 5, 6, 7, 8
                '    view.Columns(i).Visible = False
                Case 9
                    view.Columns(i).Caption = "COURSE CODE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 150
                Case 10
                    view.Columns(i).Caption = "DESCRIPTION OF COURSES"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).Width = 400
                Case 11
                    view.Columns(i).Caption = "FINAL"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
                Case 12
                    view.Columns(i).Caption = "RE-EXAM"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
                Case 13
                    view.Columns(i).Caption = "CREDIT"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
                Case Else
                    view.Columns(i).Visible = False
            End Select

        Next

        view.Columns("SchoolNameAddress").GroupIndex = 0
        view.Columns("academice_year").GroupIndex = 1
        view.Columns("SemAY").GroupIndex = 2

        view.EndUpdate()



    End Sub

    Private Sub DesignGridView(gvForm9 As GridView, lastColumns As Integer)

        Dim view As GridView = DirectCast(gvForm9, GridView)

        view.BeginUpdate()

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, lastColumns
                    view.Columns(i).Visible = False
                Case 12
                    view.Columns(i).Caption = "CODE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    '            view.Columns(i).Width = 100
                    view.Columns(i).BestFit()
                Case 13
                    view.Columns(i).Caption = "DESCRIPTION OF COURSES"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    '             view.Columns(i).Width = 150
                    view.Columns(i).BestFit()
                Case 14
                    view.Columns(i).Caption = "FINAL GRADE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    '           view.Columns(i).Width = 80
                    view.Columns(i).BestFit()
                Case 15
                    view.Columns(i).Caption = "CREDIT"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    '          view.Columns(i).Width = 80
                    view.Columns(i).BestFit()
                Case Else
                    view.Columns(i).Caption = view.Columns(i).FieldName
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    '          view.Columns(i).Width = 50
                    '           view.Columns(i).BestFit()
                    view.Columns(i).BestFit()
            End Select

        Next

        view.OptionsView.ColumnAutoWidth = True
        view.EndUpdate()

        view.Columns("SchoolNameAddress").GroupIndex = 0
        view.Columns("YrSchoolAcademic").GroupIndex = 1


        view.ExpandAllGroups()

    End Sub

    Private Sub loadComboBox()

        _view.cmbAcademicYear.DataSource = RecordModel.getAcademicYear()
        _view.cmbAcademicYear.ValueMember = "id"
        _view.cmbAcademicYear.DisplayMember = "name"
        _view.cmbAcademicYear.SelectedIndex = -1

        _view.cmbCourse.DataSource = RecordModel.getCourse()
        _view.cmbCourse.ValueMember = "id"
        _view.cmbCourse.DisplayMember = "name"
        _view.cmbCourse.SelectedIndex = -1

        _view.cmbYearLevel.DataSource = RecordModel.getYearLevel
        _view.cmbYearLevel.ValueMember = "id"
        _view.cmbYearLevel.DisplayMember = "name"
        _view.cmbYearLevel.SelectedIndex = -1

        _view.cmbSemester.DataSource = RecordModel.getSemester
        _view.cmbSemester.ValueMember = "id"
        _view.cmbSemester.DisplayMember = "name"
        _view.cmbSemester.SelectedIndex = -1

        _view.cmbBatch.DataSource = RecordModel.getBatch(_view.cmbAcademicYear.Text)
        _view.cmbBatch.ValueMember = "id"
        _view.cmbBatch.DisplayMember = "name"
        _view.cmbBatch.SelectedIndex = -1


    End Sub
End Class
