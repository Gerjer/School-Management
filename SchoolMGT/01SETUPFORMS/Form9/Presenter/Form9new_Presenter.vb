Imports System.ComponentModel
Imports DevExpress.Data
Imports DevExpress.XtraEditors.Controls
Imports DevExpress.XtraEditors.Repository
Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class Form9new_Presenter
    Private _view As frmForm9new
    Dim RecordModel As New Form9new_Model
    Dim Form9Details As New List(Of Form9Details)
    Dim OPERATION As String = ""

    Public Sub New(view As frmForm9new)
        _view = view

        _student_category_id = 13
        _view.expEntryRecord.Expanded = False

        If _view.cmbStudent.Focus = False Then
            _view.cmbStudent.Select()
        End If

        loadStudent()
        loadSchoolName()
        loadSchoolAddress()
        '     loadComboBox()
        loadhandler()

        If _view.CheckBox1.Checked = True Then
            _view.cmbSchoolName.Text = "DON JOSE ECLEO MEMORIAL COLLEGE"
            _view.cmbSchoolAddress.Text = "Justiniana Edera, San Jose, Dinagat Island"
        End If

        If _view.rdbBackTrack.Checked = False Or _view.rdbCurrentRecord.Checked = False Then

            '_view.Panel1.Enabled = False
            '_view.GroupBox1.Enabled = False
            '_view.GroupPanel2.Enabled = False
        End If
        '        loadCheckBox()
        If dr Is Nothing Then
            dr = RecordModel.getColumnHeader
        End If

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

        AddHandler _view.cmbStudent.SelectedIndexChanged, AddressOf StudentLoad
        AddHandler _view.cmbAcademicYear.SelectedIndexChanged, AddressOf AcademicSelected
        AddHandler _view.cmbCourse.SelectionChangeCommitted, AddressOf CourseSelected
        AddHandler _view.cmbBatch.SelectionChangeCommitted, AddressOf BatchSelected

        '     AddHandler _view.cmbSchoolName.SelectionChangeCommitted, AddressOf SchoolSelected
        '   AddHandler _view.cmbSchoolName.SelectedIndexChanged, AddressOf SchoolSelected
        AddHandler _view.cmbSchoolName.SelectedIndexChanged, AddressOf SchoolSelected

        AddHandler _view.rdbCurrentRecord.CheckedChanged, AddressOf EnableBatch
        AddHandler _view.rdbBackTrack.CheckedChanged, AddressOf EnableBatch
        AddHandler _view.CheckBox1.CheckedChanged, AddressOf DefaultChange

        AddHandler _view.btnAddRecord.Click, AddressOf AddRecord
        AddHandler _view.btnSave.Click, AddressOf SaveRecord
        AddHandler _view.btnLoadRecord.Click, AddressOf GetRecord
        AddHandler _view.btnPrint.Click, AddressOf PrintForm9
        AddHandler _view.btnEditForm9.Click, AddressOf btnEditForm9_Click
        AddHandler _view.btnRemoveRecord.Click, AddressOf btnRemoveRecord_Click
        AddHandler _view.btnRemoveForm9.Click, AddressOf btnRemoveForm9_Click

        AddHandler _view.gvForm9.CellValueChanged, AddressOf gvForm9_CellValueChanged
        AddHandler _view.gvForm9.RowCellClick, AddressOf gvForm9_RowCellClick

        AddHandler _view.gvRecord.InitNewRow, AddressOf gvRecord_InitNewRow
        AddHandler _view.RepositoryItemLookUpEdit1.Closed, AddressOf RepositoryItemLookUpEdit1_Closed


        AddHandler _view.FormClosing, AddressOf FormClosed

    End Sub

    Private Sub btnRemoveForm9_Click(sender As Object, e As EventArgs)

        If MessageBox.Show("Are you sure ?,You want to Delete this Record???", "Please verify...!!!", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then

            If Form9ID > 2 Then
                RecordModel.DeleteRecord(Form9ID)
                MsgBox("Record has been Detedted")
                DisplayForm9List()
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

    Dim Form9ID As String = ""
    Private Sub gvForm9_CellValueChanged(sender As Object, e As CellValueChangedEventArgs)

        'Try

        '    Dim dt As DataTable = _view.gcForm9.DataSource

        '    If e.Column.FieldName = "INCLUDE" Then

        '        Dim view As GridView = TryCast(sender, GridView)
        '        '      Dim id = view.GetRowCellValue(e.RowHandle, view.Columns("id")).ToString
        '        '       Form9ID = id



        '        If e.Column.OptionsColumn.AllowEdit = True And id <> 1 Then

        '            If dr.Rows.Count > 0 Then

        '                Dim existing = dr.Select("id = '" & id & "'")

        '                If existing.Length > 0 Then
        '                    For Each row As DataRow In From row1 As DataRow In dr.Rows Where (row1("id") = (id))
        '                        dr.Rows.Remove(row)
        '                        '      dr.Rows.AcceptChanges(
        '                    Next
        '                Else
        '                    For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = (id))
        '                        dr.Rows.Add(e.Value, row.Item("subject_code"), row.Item("subject_name"), row.Item("finalgrade"),
        '                        row.Item("credit_hours"), row.Item("credit_distribution_id"), row.Item("person_id"),
        '                        "", row.Item("school_name"), row.Item("school_address"), row.Item("Program"), row.Item("semester"),
        '                        row.Item("year_level"), row.Item("academice_year"), row.Item("credit_inorder"), row.Item("id"))
        '                    Next
        '                End If


        '            Else
        '                For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = (id))
        '                    dr.Rows.Add(e.Value, row.Item("subject_code"), row.Item("subject_name"), row.Item("finalgrade"),
        '                    row.Item("credit_hours"), row.Item("credit_distribution_id"), row.Item("person_id"),
        '                    "", row.Item("school_name"), row.Item("school_address"), row.Item("Program"), row.Item("semester"),
        '                    row.Item("year_level"), row.Item("academice_year"), row.Item("credit_inorder"), row.Item("id"))
        '                Next
        '            End If

        '        Else
        '            view.SetRowCellValue(e.RowHandle, "INCLUDE", "True")
        '            '         MessageBox.Show("CONNOT MODIFY..!!", "DEFAULT ACADEMIC RECORD", MessageBoxButtons.OK)
        '            '     view.SetFocusedRowCellValue("INCLUDE", "False")
        '        End If
        '    End If
        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try


    End Sub

    Private Sub btnEditForm9_Click(sender As Object, e As EventArgs)

        '  Dim dt As DataTable = _view.gcForm9.DataSource
        'global_dt = _view.GridControl1.DataSource.clone
        'Dim Row As DataRow = RowView.Row

        dt_Record.Rows.Clear()

        For Each row As DataRow In dr.Rows

            If row.Item("INCLUDE").ToString = "False" And row.Item("id") <> 1 Then

                If _view.gvRecord.RowCount > 0 Then

                    dt_Record.Rows.Add("False", row.Item("Code"), row.Item("SubjectTitle"), row.Item("FinalGrade"), row.Item("CreditsHours"), row.Item("CreditID"), row.Item("PersonID"), "", row.Item("SchoolName").ToString, row.Item("SchoolAddress").ToString, row.Item("ProgramName").ToString, row.Item("Semester").ToString, row.Item("YearLevel").ToString, row.Item("AcademicYear").ToString, row.Item("inorder"), row.Item("id"))
                Else

                    If dt_Record.Columns.Count > 0 Then
                    Else
                        dt_Record = RecordModel.getColumnHeader
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

    Dim id As Integer
    Private Sub gvForm9_RowCellClick(sender As Object, e As RowCellClickEventArgs)

        Dim dt As DataTable = _view.gcForm9.DataSource
        Dim view As GridView = TryCast(sender, GridView)
        id = view.GetRowCellValue(e.RowHandle, view.Columns("id"))


        If id <> 1 Then

            If dr.Rows.Count > 0 Then

                Dim existing = dr.Select("id = '" & id & "'")

                If existing.Length > 0 Then
                    For Each row As DataRow In From row1 As DataRow In dr.Rows Where (row1("id") = (id))
                        dr.Rows.Remove(row)
                        '      dr.Rows.AcceptChanges(
                    Next
                Else
                    For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = (id))
                        dr.Rows.Add("False", row.Item("subject_code"), row.Item("subject_name"), row.Item("finalgrade"),
                        row.Item("credit_hours"), row.Item("credit_distribution_id"), row.Item("person_id"),
                        "", row.Item("school_name"), row.Item("school_address"), row.Item("Program"), row.Item("semester"),
                        row.Item("year_level"), row.Item("academice_year"), row.Item("credit_inorder"), row.Item("id"))
                    Next
                End If


            Else
                For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1("id") = (id))
                    dr.Rows.Add("False", row.Item("subject_code"), row.Item("subject_name"), row.Item("finalgrade"),
                    row.Item("credit_hours"), row.Item("credit_distribution_id"), row.Item("person_id"),
                    "", row.Item("school_name"), row.Item("school_address"), row.Item("Program"), row.Item("semester"),
                    row.Item("year_level"), row.Item("academice_year"), row.Item("credit_inorder"), row.Item("id"))
                Next
            End If

        Else
            view.SetRowCellValue(e.RowHandle, "INCLUDE", "True")
            '         MessageBox.Show("CONNOT MODIFY..!!", "DEFAULT ACADEMIC RECORD", MessageBoxButtons.OK)
            '     view.SetFocusedRowCellValue("INCLUDE", "False")
        End If



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

    Private Sub PrintForm9(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Dim dt_main As New DataTable
        dt_main = RecordModel.getFORM9_Main(PERSON_ID)

        If dt_main.Rows.Count > 0 Then

            Dim report As New xtrFORM9Main

            report.txtName.Text = dt_main(0)("display_name")
            report.lblNameCertified.Text = dt_main(0)("display_name")
            report.txtBirthDate.Text = If(IsDBNull(dt_main(0)("date_of_birth")), "", dt_main(0)("date_of_birth"))
            report.txtBirthPlace.Text = If(IsDBNull(dt_main(0)("birth_place")), "", dt_main(0)("birth_place"))
            report.txtAddress.Text = If(IsDBNull(dt_main(0)("HomeAddress")), "", dt_main(0)("HomeAddress"))
            report.txtGender.Text = If(IsDBNull(dt_main(0)("gender")), "", dt_main(0)("gender"))
            report.txtParents.Text = If(IsDBNull(dt_main(0)("guardian")), "", dt_main(0)("guardian"))

            report.txtStudentNo.Text = If(IsDBNull(dt_main(0)("std_number")), "", dt_main(0)("std_number"))
            report.txtProgram.Text = If(IsDBNull(dt_main(0)("Program")), "", dt_main(0)("Program"))
            report.txtMajor.Text = If(IsDBNull(dt_main(0)("Major")), "", dt_main(0)("Major"))
            report.txtBasisAdmission.Text = If(IsDBNull(dt_main(0)("BasisAdmission")), "", dt_main(0)("BasisAdmission"))
            report.txtDateGraduate.Text = If(IsDBNull(dt_main(0)("YearGraduate")), "", dt_main(0)("YearGraduate"))

            Dim dt As DataTable = RecordModel.getEducationBackgroun(PERSON_ID)
            If dt.Rows.Count > 0 Then

                For Each row As DataRow In dt.Rows
                    Dim SchoolName = If(IsDBNull(row.Item("SchoolName")), "", row.Item("SchoolName"))
                    If SchoolName.ToString.ToUpper.Contains("ELEMENTARY") Then
                        report.txtElementary.Text = If(IsDBNull(row.Item("SchoolName")), "", row.Item("SchoolName"))
                        report.txtElemYear.Text = If(IsDBNull(row.Item("SchoolYear")), "", row.Item("SchoolYear"))
                    Else
                        report.txtSeconday.Text = If(IsDBNull(row.Item("SchoolName")), "", row.Item("SchoolName"))
                        report.txtSecYear.Text = If(IsDBNull(row.Item("SchoolYear")), "", row.Item("SchoolYear"))
                    End If

                Next

            End If

            _dt_form9 = Nothing
            _dt_form9 = RecordModel.getForm9_Details(PERSON_ID)
            If _dt_form9.Rows.Count > 0 Then

                For Each rows As DataRow In _dt_form9.Rows

                    Dim obj As New Form9Details
                    With obj
                        .personID = rows.Item("person_id")
                        .school_name = rows.Item("school_name")
                        .school_address = rows.Item("school_address")
                        .school_name_address = rows.Item("SchoolNameAddress")
                        .semester_ay = rows.Item("YrSchoolAcademic")
                        .subject_code = rows.Item("subject_code")
                        .descriptive_title = rows.Item("subject_name")
                        .finale_grade = rows.Item("finalgrade")
                        .credtis = rows.Item("credit_hours")
                        .inorder = rows.Item("inorder")
                        .credits_distribution = rows.Item("name")
                        .semester = rows.Item("semester")
                        .year_level = rows.Item("year_level")
                    End With

                    Form9Details.Add(obj)
                Next

            End If

            Dim XrSubreport1 As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreportForm9", True), XRSubreport)
            XrSubreport1.ReportSource.DataSource = Form9Details

            report.PrintingSystem.Document.AutoFitToPagesWidth = 1
                report.CreateDocument()
                report.ShowPreview

            Form9Details.Clear()
        Else
                MsgBox("No Record Found!!!")
        End If


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

            If _view.gvRecord.RowCount > 0 Then
                    _view.gcRecord.DataSource = Nothing

                    Dim ctr As Integer = 0
                    While CInt(_view.txtTotalSubject.Text) > ctr

                        dt_Record.Rows.Add("False", "", "", _view.txtSetFG.Text, _view.txtSetCR.Text, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.cmbAcademicYear.Text, 0)

                        ctr += 1
                    End While

                    _view.gcRecord.DataSource = dt_Record
                Else

                    dt_Record = RecordModel.getColumnHeader()

                    Dim ctr As Integer = 0
                    While CInt(_view.txtTotalSubject.Text) > ctr

                        dt_Record.Rows.Add("False", "", "", _view.txtSetFG.Text, _view.txtSetCR.Text, 0, PERSON_ID, _studentID, _view.cmbSchoolName.Text, _view.cmbSchoolAddress.Text, _view.txtProgram.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.cmbAcademicYear.Text, 0)

                        ctr += 1
                    End While
                    _view.gcRecord.DataSource = dt_Record
                End If

            Else
                _view.gvRecord.AddNewRow()
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
            RecordModel.UpdateRecord(_view.gvRecord)

            OPERATION = "SAVE RECORD"
            _view.btnSave.Text = "SAVE RECORD"
        End If


        'Dim dt As DataTable = _view.gcRecord.DataSource
        'RecordModel.InsertRecord1(dt)

        _view.gcRecord.DataSource = Nothing


        MessageBox.Show("Record Save...", "Successfully!")

        DisplayForm9List()


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

    Private Sub CustomRowCellEditRepo(sender As Object, e As CustomRowCellEditEventArgs)

        'Try
        '    If e.CellValue IsNot Nothing Then

        '        If (e.Column.FieldName = "CreditID") Then

        '            '      Dim order As String = _view.RepositoryItemLookUpEdit1.GetDataSourceValue(_view.RepositoryItemLookUpEdit1.Columns("inorder").ToString, _view.RepositoryItemLookUpEdit1)
        '            Dim row As Integer = _view.RepositoryItemLookUpEdit1.GetDataSourceRowIndex(_view.RepositoryItemLookUpEdit1.Columns("inorder"), e.Column.View.FocusedValue)
        '            Dim x As String = _view.RepositoryItemLookUpEdit1.GetDisplayValueByKeyValue(e.CellValue)
        '            '         Dim z As String = _view.RepositoryItemLookUpEdit1.GetKeyValueByDisplayText(e.CellValue)
        '            Dim y As String = _view.RepositoryItemLookUpEdit1.GetKeyValueByDisplayValue(e.RepositoryItem)
        '            Dim s As String = _view.RepositoryItemLookUpEdit1.GetListSourceIndex(e.Column.View.FocusedValue)
        '            Dim q As Integer = _view.RepositoryItemLookUpEdit1.GetDataSourceValue(_view.RepositoryItemLookUpEdit1.Columns("inorder"), e.Column.View.FocusedValue)

        '            Dim xx = _view.RepositoryItemLookUpEdit1.GetDataSourceRowByDisplayValue("inorder")
        '            Dim zz = _view.RepositoryItemLookUpEdit1.GetDataSourceRowByKeyValue(e.Column.FieldName)
        '            Dim ss = _view.RepositoryItemLookUpEdit1.Columns.GetVisibleColumn(3)
        '            '      _view.RepositoryItemLookUpEdit1.GetDataSourceValue()

        '        End If
        '    End If
        'Catch ex As Exception

        'End Try


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
                dt_Record = RecordModel.getColumnHeader()
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

            _studentID = RecordModel.getStudentID(PERSON_ID, _view.cmbBatch.SelectedValue)
            '     loadRecord(_studentID)


        Catch ex As Exception

        End Try

        Return Nothing
    End Function

    Private Sub loadRecord(StudentID As Integer)

        _view.gcRecord.DataSource = Nothing
        _view.gcRecord.DataSource = RecordModel.getCreditDistributionRecord(StudentID)

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
            If _view.rdbCurrentRecord.Checked = True Then
                loadBatch()
            End If
            loadCredDist()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Dim cmbRepoCredits As RepositoryItemLookUpEdit

    Dim dt_credit As DataTable

    Private Sub loadCredDist()

        _view.RepositoryItemLookUpEdit1 = New DevExpress.XtraEditors.Repository.RepositoryItemLookUpEdit()
        _view.RepositoryItemLookUpEdit1.DataSource = RecordModel.getCreditsDistribution
        _view.RepositoryItemLookUpEdit1.ValueMember = "id"
        _view.RepositoryItemLookUpEdit1.DisplayMember = "name"
        _view.RepositoryItemLookUpEdit1.BestFitMode = DevExpress.XtraEditors.Controls.BestFitMode.BestFitResizePopup
        _view.gvRecord.Columns("CreditID").ColumnEdit = _view.RepositoryItemLookUpEdit1
        _view.gvRecord.BestFitColumns()


    End Sub

    Private Sub loadBatch()

        _view.cmbBatch.DataSource = RecordModel.getBatch(_view.cmbAcademicYear.Text)
        _view.cmbBatch.ValueMember = "id"
        _view.cmbBatch.DisplayMember = "name"
        _view.cmbBatch.SelectedIndex = -1

    End Sub

    Private Sub EnableBatch(sender As Object, e As EventArgs)

        loadComboBox()

        loadCheckBox()

        _view.Panel1.Enabled = True
        _view.GroupBox1.Enabled = True
        _view.GroupPanel2.Enabled = True
        _view.GroupPanel1.Visible = True
    End Sub

    Private Sub StudentLoad(sender As Object, e As EventArgs)

        _view.expEntryRecord.Expanded = True
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbStudent.SelectedItem, DataRowView)
            PERSON_ID = drv.Item("id").ToString
            personID_image = drv.Item("id").ToString

            DisplayForm9List()
            dummy.Rows.Clear()
            dummy.Columns.Clear()
        Catch ex As Exception
        End Try

    End Sub

    Private Sub DisplayForm9List()

        Dim dt As New DataTable
        '     dt = RecordModel.loadForm9Record(PERSON_ID)
        dt = RecordModel.loadNewForm9Record(PERSON_ID)

        If dt.Rows.Count > 0 Then

            'Add new column
            Dim column As DataTable = RecordModel.getColumn(PERSON_ID)
            For Each row As DataRow In column.Rows
                dt.Columns.Add(row("credit_inorder"))
            Next
            dt.Columns.Add("INCLUDE")
            Dim lastColumns As Integer = dt.Columns.Count - 1
            'Populate Credits Distribution

            'For x As Integer = 0 To dt.Rows.Count - 1
            '    For col As Integer = 16 To dt.Columns.Count - 1
            '        If dt(x)("credit_inorder").ToString = dt.Columns(col).ToString Then
            '            dt(x)(col) = dt(x)("credit_hours").ToString
            '            If dt(x)("id").ToString = 1 Then
            '                dt(x)(lastColumns) = "True"
            '            Else
            '                dt(x)(lastColumns) = "False"
            '            End If
            '        End If
            '    Next

            'Next


            _view.gcForm9.DataSource = dt

            DesignGridView(_view.gvForm9, lastColumns)
            _view.gcRecord.DataSource = Nothing
            '     _view.gvRecord.Columns.Clear()
            dr.Rows.Clear()
            _view.gcRecord.DataSource = Nothing
            _view.gcRecord.DataSource = RecordModel.getColumnHeader
            '          _view.gcRecord.DataSource = dr
        Else
            _view.gcForm9.DataSource = Nothing
            _view.gvForm9.Columns.Clear()

            _view.cmbSchoolName.Focus()
        End If
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
