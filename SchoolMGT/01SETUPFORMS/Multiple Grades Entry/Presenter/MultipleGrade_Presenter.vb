Imports DevExpress.Utils
Imports DevExpress.Utils.Win
Imports DevExpress.XtraBars.Forms
Imports DevExpress.XtraEditors
Imports DevExpress.XtraEditors.Controls
Imports DevExpress.XtraEditors.Repository
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraGrid.Views.Base
Imports SchoolMGT
Imports DevExpress.XtraGrid

Public Class MultipleGrade_Presenter

    Private _view As frmMutipleEntryGrades
    Dim model As New MultipleGrades_Model
    Dim tag As Integer
    Dim col_limit As Integer
    Dim col_starter As Integer = 4

    Dim compute_grade As New GradeComputation

    Public Sub New(view As frmMutipleEntryGrades)
        _view = view

        _view.btnAdd.AllowFocused = False
        _view.btnEdit.AllowFocused = False
        ColEdit = False

        loadComboBox()

        If AuthUserType = "USER" Then

            _view.cmbXInsttructor.Enabled = True
            _view.cmbXInsttructor.Properties.Items.Add(AppSetup_Domain, AuthUserName, CheckState.Checked, True)
            InstructorID = CStr(AppSetup_Domain).ToString

        Else
            _view.cmbXInsttructor.Enabled = False
        End If


        loadHandelr()
    End Sub


    Private Sub loadHandelr()

        AddHandler _view.cmbYear.SelectedIndexChanged, AddressOf Schoolyear_SelectedIndexChanged
        AddHandler _view.cmbCategory.SelectedIndexChanged, AddressOf Category_SelectedIndexChanged

        AddHandler _view.cmbXInsttructor.Click, AddressOf cmbXInsttructor_Click
        AddHandler _view.cmbXCourse.Click, AddressOf cmbXCourse_Click
        AddHandler _view.cmbXyearlevel.Click, AddressOf cmbXyearlevel_Click
        AddHandler _view.cmbXSemester.Click, AddressOf cmbXSemester_Click
        AddHandler _view.cmbXsubject.Click, AddressOf cmbXsubject_Click

        AddHandler _view.cmbXInsttructor.Properties.Closed, AddressOf buttonClosed
        AddHandler _view.cmbXCourse.Properties.Closed, AddressOf btnCourseClosedLoad
        AddHandler _view.cmbXyearlevel.Properties.Closed, AddressOf btnYRLevelClosedLoad
        AddHandler _view.cmbXSemester.Properties.Closed, AddressOf btnSemesterClosedLoad
        AddHandler _view.cmbXsubject.Properties.Closed, AddressOf btnSubjectClosedLoad

        AddHandler _view.cmbXInsttructor.Properties.Popup, AddressOf Popup
        AddHandler _view.cmbXCourse.Properties.Popup, AddressOf Popup
        AddHandler _view.cmbXyearlevel.Properties.Popup, AddressOf Popup
        AddHandler _view.cmbXSemester.Properties.Popup, AddressOf Popup
        AddHandler _view.cmbXsubject.Properties.Popup, AddressOf Popup

        AddHandler _view.GridControl1.EditorKeyUp, AddressOf UpdateComputation
        '    AddHandler _view.GridControl1.ProcessGridKey, AddressOf EnterSave

        AddHandler _view.GridView1.RowCellClick, AddressOf RowCellClick
        AddHandler _view.GridView1.RowCellStyle, AddressOf RowCellStyle
        '     AddHandler _view.GridView1.CellValueChanged, AddressOf CellValueChange

        '   AddHandler _view.GridView1.KeyDown, AddressOf EnterSave

        AddHandler _view.btnAdd.Click, AddressOf btnADDClick
        AddHandler _view.btnAdd.KeyUp, AddressOf AddKeyUp
        AddHandler _view.btnEdit.Click, AddressOf btnEDITClick
        AddHandler _view.btnEdit.KeyUp, AddressOf EditKeyUp
        AddHandler _view.btnsubmit.Click, AddressOf Submit

        AddHandler _view.btnCancel.Click, AddressOf closed

    End Sub

    Private Sub EnterSave(sender As Object, e As KeyEventArgs)

        Dim grid As GridControl = TryCast(sender, GridControl)
        Dim view As GridView = TryCast(TryCast(sender, GridControl).FocusedView, GridView)
        rowID = view.GetFocusedRowCellValue("StdSubject_id").ToString
        rowHandle = view.FocusedRowHandle
        rowData = view.GetFocusedDataRow
        Dim focusColumn = view.FocusedColumn.FieldName

        view_grade = grid.DataSource

        If view.RowCount > 0 Then
            If e.KeyCode = Keys.Enter Then
                Dim ave = view.GetFocusedRowCellValue("AVERAGE").ToString
                If ave <> "" Then

                    For Each rows As DataRow In view_grade.Rows
                        For Each rowColumn As DataRow In compute_grade.ColHeader.Rows

                            Dim colFieldName As String = rowColumn.Item("id").ToString
                            Dim stdSubjectID As String = rows.Item("StdSubject_id").ToString
                            Dim grade = rows.Item(colFieldName).ToString
                            Dim equivalent = view.GetFocusedRowCellValue("EQUIVALENT").ToString
                            Dim remarks = view.GetFocusedRowCellValue("REMARKS").ToString

                            If grade <> "" Then
                                If compute_grade.IfExist(stdSubjectID, colFieldName) = False Then
                                    model.InsertGrade(stdSubjectID, colFieldName, grade)
                                Else
                                    model.UpdateGrade(stdSubjectID, colFieldName, grade)
                                End If

                                model.UpdateFinal(stdSubjectID, ave, equivalent, remarks)

                            End If

                        Next
                        '          Notify = "Grade has been added...., Successfully!!!"
                        '        MessageBox.Show(Notify, "SAVED GRADE", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1)
                    Next

                End If


            End If
        End If


    End Sub

    Private Sub closed(sender As Object, e As EventArgs)
        _view.Close()
    End Sub

    Private Sub CellValueChange(sender As Object, e As CellValueChangedEventArgs)

        Dim view As GridView = DirectCast(sender, GridView)

        Dim col As GridColumn = e.Column

        '      Dim rows = compute_grade.ColHeader.Select("id= " & col.ToString & " ")

        If col.FieldName = "1" Then

            Dim focusColumn = view.FocusedColumn.FieldName.ToString
            Dim focusRowHandle = view.FocusedRowHandle
            Dim foucsRowModified As Boolean = view.FocusedRowModified

            Dim grade As String = ""


            For Each rowColumn As DataRow In compute_grade.ColHeader.Rows
                If rowColumn.Item("id").ToString = focusColumn Then
                    Dim fieldName = rowColumn.Item("id").ToString

                    grade = view.GetFocusedRowCellValue(fieldName)
                End If
            Next


        End If

    End Sub

    'Private Sub EnterKey(sender As Object, e As KeyEventArgs)

    '    Dim gControl As GridControl = TryCast(sender, GridControl)
    '    If e.KeyCode = Keys.Enter Then
    '        Dim gView As GridView = gControl.DefaultView
    '        Dim ColIndex As Integer = gView.FocusedColumn.ColumnHandle
    '        '     gView.FocusedColumn = gView.Columns("final")
    '        gView.Focus()
    '        '     gView.Focus()

    '    Else
    '        Return
    '    End If

    'End Sub

    Dim UpdateRowHandle As Integer = -1
    Dim view_grade As DataTable
    Private Sub UpdateComputation(sender As Object, e As KeyEventArgs)

        Dim view As GridView = DirectCast(TryCast(sender, GridControl).FocusedView, GridView)
        Dim row As Integer = view.FocusedRowHandle
        Dim col_focused As Integer = view.FocusedColumn.ColumnHandle
        Dim ColumnName As String = view.FocusedColumn.FieldName
        Dim InputGrade As String = ""

        rowID = view.GetFocusedRowCellValue("StdSubject_id").ToString

        If AuthUserType = "USER" Then
            _batchID = view.GetFocusedRowCellValue(view.Columns("batch_id"))
            If Not model.DateScheduleExpired(_batchID) Then
                Dim BatchSchedule As String = model.getBatchName(_batchID)
                MsgBox("CANNOT MODIFY OR EDIT GRADES. SCHEDULE OF GRADE DISTRIUTION FOR THIS BATCH HAS EXPIRED. PLS CONTACT SYSTEM ADMINISTRATOR." & vbNewLine & vbNewLine & "BATCH SCHEDULE : " & BatchSchedule, MsgBoxStyle.Critical, "SCHEDULE HAS EXPIRED")
                loadList()
                Exit Sub
            End If
        End If


        view.Appearance.FocusedCell.BackColor = Color.Gainsboro


        'If UpdateRowHandle < 0 Then
        '    UpdateRowHandle = view.FocusedRowHandle
        '    view.Columns(0).Tag = 0
        'ElseIf UpdateRowHandle <> view.FocusedRowHandle Then
        '    UpdateRowHandle = view.FocusedRowHandle
        '    view.Columns(0).Tag = 0
        'Else
        '    Dim ave = view.GetFocusedRowCellValue(view.Columns("AVERAGE"))
        '    If ave = "" Then
        '        view.Columns(0).Tag = 0
        '    End If
        'End If


            Try

            If CDbl(view.FocusedColumn.FieldName) > 0 Then

                If e.KeyCode > 47 And e.KeyCode < 58 Or e.KeyCode > 95 And e.KeyCode < 106 Then

                    Dim total_grades As Double = 0

                    Dim weight_percentage As Double = 0

                    Dim dt As New DataTable
                    dt = _view.GridControl1.DataSource

                    If view.EditingValueModified Then

                        If view.EditingValue.ToString.Length > 1 Then

                            Dim total_average As Double = 0

                            Try

                                Dim col As Integer = 0
                                For x As Integer = 0 To dt.Rows.Count - 1
                                    If col > 3 And col <= col_limit Then

                                        If col = col_focused Then
                                            total_average += (view.EditingValue * CDbl(view.Columns(col_focused).Tag) / 100)
                                        Else
                                            Dim grade = view.GetFocusedRowCellValue(view.Columns(col))
                                            If grade = "" Then
                                                grade = 0
                                            End If
                                            total_average += (grade * CDbl(view.Columns(col).Tag) / 100)
                                        End If
                                    End If
                                    col += 1
                                Next
                            Catch ex As Exception
                            End Try

                            Dim round_up_average = compute_grade.Round_Up(total_average)

                            view.SetRowCellValue(row, "AVERAGE", round_up_average)

                            'Check Column Grade if all not Empyy
                            Dim cntrChecker As Integer = 0
                            Dim StartColumn As Integer = 4

                            Try
                                Dim col As Integer = 0
                                For x As Integer = 0 To dt.Rows.Count - 1
                                    If col > 3 And col <= col_limit Then

                                        If col = col_focused Then
                                        Else
                                            Dim grade = view.GetFocusedRowCellValue(view.Columns(col))
                                            If grade <> "" Then
                                                If cntrChecker = 0 Then
                                                    cntrChecker = 1
                                                End If
                                            Else
                                                cntrChecker = 2
                                                Exit For
                                            End If
                                        End If
                                    End If
                                    col += 1
                                Next
                            Catch ex As Exception
                            End Try

                            If cntrChecker = 1 Then

                                Dim equivalent = model.getEquivalent(round_up_average)
                                If equivalent Is Nothing Then
                                    equivalent = "5.0"
                                End If

                                If CDbl(equivalent) <= 3.0 Then
                                    view.SetRowCellValue(row, "EQUIVALENT", equivalent)
                                    view.SetRowCellValue(row, "REMARKS", "PASSED")
                                Else
                                    view.SetRowCellValue(row, "EQUIVALENT", equivalent)
                                    view.SetRowCellValue(row, "REMARKS", "FAILED")
                                End If

                            Else

                                view.SetRowCellValue(row, "EQUIVALENT", "")
                                view.SetRowCellValue(row, "REMARKS", "NOT YET COMPLETE")

                            End If

                        End If

                    End If


                End If

            End If

        Catch ex As Exception

        End Try



    End Sub

    Private Sub UpdateViewGrade(rowID As String, columnName As String, grade As Object)

        For Each row As DataRow In From row1 As DataRow In view_grade.Rows Where (row1("StdSubject_id") = (rowID))
            row.SetField(columnName, grade)
            row.AcceptChanges()
        Next

    End Sub

    Private Sub cmbXSemester_Click(sender As Object, e As EventArgs)

        Dim control As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)
        If control.IsPopupOpen Then
            AddHandler(DirectCast(control, CheckedComboBoxEdit).Popup), AddressOf Popup
        End If

    End Sub

    Private Sub btnSemesterClosedLoad(sender As Object, e As ClosedEventArgs)
        Dim Mode As PopupCloseMode = e.CloseMode
        Dim cmbXedit As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If Mode = 0 Then
            Dim checkitem As String = ""

            For Each item In cmbXedit.Properties.GetItems().Cast(Of CheckedListBoxItem)()

                If item.CheckState = CheckState.Checked Then
                    If checkitem = "" Then
                        checkitem = "'" & item.Description & "'"
                    Else
                        checkitem = checkitem & "," & "'" & item.Description & "'"
                    End If
                End If
            Next

            Semester = checkitem

            Try
                Dim dt As DataTable = model.getYearLevel(Semester)
                Dim row As Integer = dt.Rows.Count + 1

                _view.cmbXyearlevel.Properties.Items.Clear()
                _view.cmbXyearlevel.Properties.DataSource = dt
                _view.cmbXyearlevel.Properties.ValueMember = "id"
                _view.cmbXyearlevel.Properties.DisplayMember = "name"
                _view.cmbXyearlevel.Properties.DropDownRows = row
                _view.cmbXyearlevel.ShowPopup()

                '    PopulateCombobOX(CourseID)

                cmbXedit.ClosePopup()
            Catch ex As Exception

            End Try

            '    loadList()
        End If
    End Sub

    Private Sub Schoolyear_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbYear.SelectedItem, DataRowView)
            _school_year = drv("name").ToString

            'If AuthUserType <> "USER" Then
            '    If _student_category_id > 0 Then
            '        loadInstructor()
            '    End If

            'Else
            '    loadCourse(AppSetup_Domain)
            'End If

        Catch ex As Exception
            _view.cmbYear.Text = ""
        End Try


    End Sub

    Private Sub CustomDrawCell(sender As Object, e As RowCellCustomDrawEventArgs)

        '     e.Column.AppearanceCell.BackColor = Color.MediumAquamarine

    End Sub

    Private Sub btnSubjectClosedLoad(sender As Object, e As ClosedEventArgs)

        Dim Mode As PopupCloseMode = e.CloseMode
        Dim cmbXedit As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If Mode = 0 Then
            tag = 3
            Dim checkitem As Object = cmbXedit.Properties.GetCheckedItems()
            SubjectID = checkitem

            cmbXedit.ClosePopup()
            '     PopulateCombobOX(SubjectID)

            loadList()
        End If

    End Sub

    Private Sub btnCourseClosedLoad(sender As Object, e As ClosedEventArgs)

        Dim Mode As PopupCloseMode = e.CloseMode
        Dim cmbXedit As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If Mode = 0 Then
            tag = 1

            Dim checkitem As Object = cmbXedit.Properties.GetCheckedItems()
            CourseID = checkitem

            Dim dt As DataTable = model.getSemester(CourseID)
            Dim row As Integer = dt.Rows.Count + 1

            _view.cmbXSemester.Properties.Items.Clear()
            _view.cmbXSemester.Properties.DataSource = dt
            _view.cmbXSemester.Properties.ValueMember = "id"
            _view.cmbXSemester.Properties.DisplayMember = "name"
            _view.cmbXSemester.Properties.DropDownRows = row
            _view.cmbXSemester.ShowPopup()

            '         cmbXedit.ClosePopup()

            _view.GridControl1.DataSource = Nothing
        End If

    End Sub

    'Private Sub CustomRowCellEdit(sender As Object, e As CustomRowCellEditEventArgs)

    '    Try
    '        If _view.btnEdit.AllowFocused Then
    '            If e.RowHandle = rowHandle Then
    '                e.Column.OptionsColumn.AllowEdit = True
    '            End If

    '            _view.btnEdit.AllowFocused = False
    '            End If
    '    Catch ex As Exception

    '    End Try



    'End Sub

    Dim ColEdit As Boolean = False

    Private Sub RowCellStyle(sender As Object, e As RowCellStyleEventArgs)


        Dim view As GridView = TryCast(sender, GridView)
        If e.Column.FieldName = "REMARKS" Then

            Dim remarks = view.GetRowCellValue(e.RowHandle, view.Columns("REMARKS"))

            If remarks = "FAILED" Then
                e.Appearance.ForeColor = Color.Red
            Else
                e.Appearance.ForeColor = Color.Black
            End If
        End If

        If e.Column.FieldName = "INCLUDE" Then

            Dim submitted = view.GetRowCellValue(e.RowHandle, view.Columns("INCLUDE"))

            If submitted = "True" Then
                e.Column.OptionsColumn.AllowEdit = False
            Else
                e.Column.OptionsColumn.AllowEdit = True
            End If
        End If




#Region "old"
        'rowID = e.Column.View.Columns("StdSubject_id").FieldName
        'rowHandle = e.RowHandle
        'If model.Exist(rowID) Then

        '    For Each col As GridColumn In _view.GridView1.Columns.ToList

        '    Next


        'End If

        'Dim view As GridView = DirectCast(sender, GridView)
        'Dim TotalRow As Integer = view.RowCount - 1

        'If _view.btnAdd.AllowFocused Then

        '    Dim dt As DataTable = compute_grade.dt_grade_period

        '    For row As Integer = 0 To dt.Rows.Count - 1

        '        Dim dtName = dt(row)(0).ToString
        '        Dim colName = e.Column.FieldName

        '        If dtName = colName Then

        '            Dim colValue = e.CellValue

        '            If colValue <> "" Then

        '                view.GetVisibleDetailView(e.RowHandle)
        '                For col As Integer = 0 To view.Columns.Count - 1
        '                    Dim GridCol As GridColumn = view.Columns(col).View.FocusedColumn

        '                    GridCol.AppearanceCell.BackColor = Color.MediumAquamarine
        '                    GridCol.OptionsColumn.AllowEdit = False

        '                Next

        '                'For col As Integer = 0 To rowData.Table.Columns.Count - 1

        '                '    e.Appearance.BackColor = Color.MediumAquamarine
        '                '    e.Column.OptionsColumn.AllowEdit = False


        '                'Next
        '            Else
        '                '                   MsgBox("hi")
        '            End If
        '        End If
        '    Next


        '    If TotalRow = e.RowHandle Then
        '        _view.btnAdd.AllowFocused = False
        '    End If


        'ElseIf _view.btnEdit.AllowFocused = True Then

        '    Try
        '        Dim ColName = e.Column.FieldName.ToString
        '        If rowValue = ColName And e.RowHandle = rowHandle Then

        '            e.Column.OptionsColumn.AllowEdit = True
        '            _view.btnEdit.AllowFocused = False
        '        End If

        '        If TotalRow = e.RowHandle Then
        '            _view.btnEdit.AllowFocused = False
        '        End If


        '    Catch ex As Exception

        '    End Try


        'ElseIf ColEdit = True Then

        '    Try
        '        Dim rowID = e.Column.View.GetRowCellDisplayText(e.RowHandle, "StdSubject_id")

        '        If model.Exist(rowID) Then

        '            For y As Integer = 0 To e.Column.View.Columns.Count - 1
        '                e.Appearance.BackColor = Color.MediumAquamarine
        '                e.Column.OptionsColumn.AllowEdit = False
        '            Next
        '        Else
        '            '                  MsgBox("HI")
        '            e.Column.OptionsColumn.AllowEdit = True
        '        End If

        '        If TotalRow = e.RowHandle Then
        '            ColEdit = False
        '        End If

        '    Catch ex As Exception

        '    End Try



        'End If
#End Region

    End Sub


    Dim total_finalgrade As Double
    Private Sub ProcessGridKey(sender As Object, e As KeyEventArgs)

        Dim view As GridView = DirectCast(TryCast(sender, GridControl).FocusedView, GridView)
        Dim row As Integer = view.FocusedRowHandle
        Dim col_focused As Integer = view.FocusedColumn.ColumnHandle
        Dim ColumnName As String = view.FocusedColumn.Caption
        Dim InputGrade As String = ""

        _batchID = view.GetFocusedRowCellValue(view.Columns("batch_id"))
        If Not model.DateScheduleExpired(_batchID) Then
            Dim BatchSchedule As String = model.getBatchName(_batchID)
            MsgBox("CANNOT MODIFY OR EDIT GRADES. SCHEDULE OF GRADE DISTRIUTION FOR THIS BATCH HAS EXPIRED. PLS CONTACT SYSTEM ADMINISTRATOR." & vbNewLine & vbNewLine & "BATCH SCHEDULE : " & BatchSchedule, MsgBoxStyle.Critical, "SCHEDULE HAS EXPIRED")
            loadList()
            Exit Sub
        End If

        view.Appearance.FocusedCell.BackColor = Color.Gainsboro

        Try

            If CDbl(view.FocusedColumn.FieldName) > 0 Then

                If e.KeyCode > 47 And e.KeyCode < 58 Or e.KeyCode > 95 And e.KeyCode < 106 Then

                    Dim total_grades As Double = 0
                    Dim total_average As Double = 0


                    For col As Integer = col_starter To view.Columns.Count - 1
                        If col > col_limit Then
                            Exit For
                        Else
                            If col = col_focused Then
                            Else
                                Dim grade = view.GetRowCellDisplayText(row, view.Columns(col).FieldName)
                                If grade = "" Then
                                    grade = 0
                                End If
                                total_grades += CDbl(grade)
                            End If
                        End If
                    Next

                    If view.EditingValueModified Then
                        total_grades += view.EditingValue
                    End If

                    total_average = total_grades / compute_grade.gradeperiod_cnt


                    Dim round_up_average = compute_grade.Round_Up(total_average)
                    '     Dim round_up_average = compute_grade.Round_Up(total_finalgrade)

                    view.SetRowCellValue(row, "AVERAGE", round_up_average)

                    Dim equivalent = model.getEquivalent(round_up_average)
                    If equivalent Is Nothing Then
                        equivalent = "5.0"
                    End If

                    If CDbl(equivalent) <= 3.0 Then
                        view.SetRowCellValue(row, "EQUIVALENT", equivalent)
                        view.SetRowCellValue(row, "REMARKS", "PASSED")
                    Else
                        view.SetRowCellValue(row, "EQUIVALENT", equivalent)
                        view.SetRowCellValue(row, "REMARKS", "FAILED")
                    End If



                End If

            End If

        Catch ex As Exception

        End Try



    End Sub

    Private Sub Submit(sender As Object, e As EventArgs)

        Dim res As Boolean = False
        If _view.GridView1.RowCount > 0 Then

            For x As Integer = 0 To _view.GridView1.RowCount - 1

                If "True" = _view.GridView1.GetRowCellValue(x, _view.GridView1.Columns("INCLUDE").FieldName.ToString) Then
                    rowID = _view.GridView1.GetRowCellValue(x, _view.GridView1.Columns("StdSubject_id").FieldName.ToString)
                    model.SubmitFinalGradeNew(rowID, 1)
                    res = True

                End If

            Next

            If res = True Then
                MsgBox("ALL GRADES HAS BEEN SUBMIITED....", MsgBoxStyle.Information, "SUBMITTED SUCCESSFULLY")
            End If

        End If
        loadList()
    End Sub

    Private Sub EditKeyUp(sender As Object, e As KeyEventArgs)
        If e.KeyCode = Keys.Enter Then
            btnEDITClick(sender, e)
        End If
    End Sub

    Private Sub AddKeyUp(sender As Object, e As KeyEventArgs)

        If e.KeyCode = Keys.Enter Then
            btnADDClick(sender, e)
        End If

    End Sub


    Private Sub Category_SelectedIndexChanged(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCategory.SelectedItem, DataRowView)
            _student_category_id = drv("id").ToString
            compute_grade.getGradingPeriod(_student_category_id)

            If AuthUserType = "USER" Then
                loadCourse(InstructorID)
                _view.cmbXCourse.ShowPopup()
            Else
                _view.cmbXInsttructor.Enabled = True
                loadInstructor()
            End If

            Cursor.Current = Cursors.Default
        Catch ex As Exception
            _view.cmbCategory.Text = ""
        End Try


    End Sub

    Private Sub loadInstructor()

        Dim dt As DataTable = model.getInstructor()
        _view.cmbXInsttructor.Properties.DropDownRows = dt.Rows.Count
        _view.cmbXInsttructor.Properties.DataSource = dt
        _view.cmbXInsttructor.Properties.ValueMember = "id"
        _view.cmbXInsttructor.Properties.DisplayMember = "name"
        _view.cmbXInsttructor.ShowPopup()
        '_view.cmbXInsttructor.Properties.GetCheckedItems()

    End Sub

    Dim rowHandle As Integer
    Dim rowData As DataRow
    Dim rowID As String
    Dim rowValue As String

    Private Sub RowCellClick(sender As Object, e As RowCellClickEventArgs)


        Dim view As GridView = DirectCast(sender, GridView)
        rowID = view.GetFocusedRowCellValue("StdSubject_id").ToString
        rowHandle = view.FocusedRowHandle
        rowData = view.GetFocusedDataRow

        If "INCLUDE" = e.Column.FieldName Then

            If AuthUserType = "USER" Then
                If "True" = _view.GridView1.GetRowCellValue(rowHandle, _view.GridView1.Columns("INCLUDE").FieldName.ToString) Then
                    MsgBox("CANNOT MODIFY..!!! PLS CONTACT SYSTEM ADMINISTRATOR.", MsgBoxStyle.Critical, "SYSTEM ADMINISTRATOR")
                    Exit Sub
                End If
            ElseIf AuthUserType = "ADMIN" Then
                If "True" = _view.GridView1.GetRowCellValue(rowHandle, _view.GridView1.Columns("INCLUDE").FieldName.ToString) Then
                    model.SubmitFinalGradeNew(rowID, 0)
                End If
            Else
                MsgBox("CANNOT MODIFY..!!! PLS CONTACT SYSTEM ADMINISTRATOR.", MsgBoxStyle.Critical, "SYSTEM ADMINISTRATOR")
                Exit Sub
            End If


            ElseIf "btnedit" = e.Column.FieldName Then

                Try
                    _view.btnEdit.AllowFocused = True
                    btnEDITClick(sender)
                Catch ex As Exception

                End Try

            ElseIf "btnadd" = e.Column.FieldName Then

                _view.btnAdd.AllowFocused = True
                btnADDClick(sender, e)
            Else
                rowValue = view.FocusedColumn.FieldName
            If view.GetFocusedRowCellValue("INCLUDE").ToString = "True" Then
                e.Column.OptionsColumn.AllowEdit = False
            Else
                e.Column.OptionsColumn.AllowEdit = True
            End If

        End If

    End Sub

    Private Sub EditorKeyDown(sender As Object, e As KeyEventArgs)

        Dim view As GridView = TryCast(TryCast(sender, GridControl).FocusedView, GridView)
        rowID = view.GetFocusedRowCellValue("StdSubject_id").ToString
        rowHandle = view.FocusedRowHandle
        rowData = view.GetFocusedDataRow

        If "REMARKS" <> view.FocusedColumn.FieldName Then
            '           If (Asc(e.KeyCode) > 47 AndAlso Asc(e.KeyCode) < 58) Or Asc(e.KeyCode) > 95 AndAlso Asc(e.KeyCode) < 106 Then

            If e.KeyCode > 47 And e.KeyCode < 58 Or e.KeyCode > 95 And e.KeyCode < 106 Then
                e.Handled = True
                view.ActiveEditor.Enabled = True

            ElseIf e.KeyCode = 13 Or e.KeyCode = 8 Then
                e.Handled = False
                view.ActiveEditor.Enabled = True
            Else
                view.ActiveEditor.Enabled = False
            End If

        Else
            e.Handled = False
            view.ActiveEditor.Enabled = True

        End If

        EditorKeyUp(sender, e)

    End Sub

    Dim Notify As String = ""
    Private Sub btnEDITClick(sender As Object, Optional e As EventArgs = Nothing)
        Notify = "GRADE IS SUCCESSFULLY..., UPDATE!!!"
        ComputeGrade()
        Exit Sub
    End Sub

    Private Sub btnADDClick(sender As Object, e As EventArgs)
        Notify = "GRADE IS SUCCESSFULLY..., SAVE!!!"
        ComputeGrade()
        Exit Sub
    End Sub

    Private Sub ComputeGrade()

        Try
            Dim res As Boolean = False

            Dim dt As DataTable = compute_grade.dt_grade_period
            For x As Integer = 0 To dt.Rows.Count - 1

                For xx As Integer = 0 To rowData.Table.Columns.Count - 1
                    Dim ColName = rowData.Table.Columns(xx).ColumnName.ToString
                    If dt(x)(0).ToString = ColName Then
                        If compute_grade.IfExist(rowID, ColName) = False Then
                            If rowData.Item(xx).ToString <> "" Then

                                model.InsertGrade(rowID, ColName, rowData.Item(xx).ToString)

                                model.UpdateFinal(rowID, rowData("AVERAGE").ToString, rowData("EQUIVALENT").ToString, rowData("REMARKS").ToString)
                                _view.GridView1.GetVisibleDetailView(rowHandle)

                                'For Each col As GridColumn In _view.GridView1.Columns.ToList
                                '    col.AppearanceCell.BackColor = Color.MediumAquamarine
                                '    col.OptionsColumn.AllowEdit = False
                                'Next

                                res = True
                                Exit For
                            Else
                                Exit For
                            End If
                        Else
                            If rowData.Item(xx).ToString <> "" Then
                                model.UpdateGrade(rowID, ColName, rowData.Item(xx).ToString)
                                model.UpdateFinal(rowID, rowData("AVERAGE").ToString, rowData("EQUIVALENT").ToString, rowData("REMARKS").ToString)
                                res = True
                                Exit For
                            Else
                                res = True
                                model.RemoveGrade(rowID, ColName, rowData.Item(xx).ToString)
                                loadList()
                                Exit For
                            End If
                        End If
                    End If
                Next

            Next

            If res = True Then

                If MessageBox.Show(Notify, "SUCCESSFULLY ADDED", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1) = DialogResult.OK Then
                    res = False
                End If


            End If
        Catch ex As Exception

        End Try


    End Sub

    Private Sub EditorKeyUp(sender As Object, e As KeyEventArgs)

        Dim view As GridView = TryCast(TryCast(sender, GridControl).FocusedView, GridView)
        Dim x = view.GetFocusedDisplayText

        Dim row As Integer = view.FocusedRowHandle
        Dim col_focused As Integer = view.FocusedColumn.ColumnHandle


        If view Is Nothing Then
            Return
        End If

        '      If "REMARKS" <> view.FocusedColumn.FieldName Then

        '    If e.KeyValue <> 8 Then
        ' If Asc(e.KeyCode) > 47 AndAlso Asc(e.KeyCode) < 58 Or Asc(e.KeyCode) > 95 AndAlso Asc(e.KeyCode) < 106 AndAlso view.Editable AndAlso view.SelectedRowsCount > 0 Then
        '  If Asc(e.KeyCode) <> 109 Then

        '      If e.Handled Then


        If view.ActiveEditor.Enabled Then

            If e.Handled = True Then

                Dim total_grades As Double = 0
                Dim total_average As Double = 0

                For col As Integer = col_starter To view.Columns.Count - 1
                    If col > col_limit Then
                        Exit For
                    Else
                        If col = col_focused Then
                        Else
                            Dim grade = view.GetRowCellDisplayText(row, view.Columns(col).FieldName)
                            If grade = "" Then
                                grade = 0
                            End If
                            total_grades += CDbl(grade)
                        End If
                    End If
                Next

                If view.EditingValueModified Then
                    total_grades += view.EditingValue
                End If


                total_average = total_grades / compute_grade.gradeperiod_cnt



                view.SetRowCellValue(row, "AVERAGE", total_average)

                Dim round_up_average = compute_grade.Round_Up(total_average)
                Dim equivalent = model.getEquivalent(round_up_average)

                view.SetRowCellValue(row, "EQUIVALENT", equivalent)

                If total_average > 75 Then
                    view.SetRowCellValue(row, "REMARKS", "PASSED")
                Else
                    view.SetRowCellValue(row, "REMARKS", "FAILED")
                End If
            End If
        End If


        '       End If
        '               End If
        '           End If
        '          End If
        '    End If

    End Sub

    Dim getValue As Object

    Private Sub cmbXsubject_Click(sender As Object, e As EventArgs)
        Dim control As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)
        If control.IsPopupOpen Then
            '          tag = 3
            AddHandler(DirectCast(control, CheckedComboBoxEdit).Popup), AddressOf Popup
        End If
    End Sub

    Private Sub cmbXyearlevel_Click(sender As Object, e As EventArgs)
        Dim control As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)
        If control.IsPopupOpen Then
            '         tag = 2
            AddHandler(DirectCast(control, CheckedComboBoxEdit).Popup), AddressOf Popup
        End If
    End Sub

    Private Sub cmbXInsttructor_Click(sender As Object, e As EventArgs)

        Dim control As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If control.IsPopupOpen Then
            '        tag = 4
            AddHandler(DirectCast(control, CheckedComboBoxEdit).Popup), AddressOf Popup
        End If

    End Sub
    Private Sub cmbXCourse_Click(sender As Object, e As EventArgs)

        list = New CheckedListBoxControl()

        Dim control As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If control.IsPopupOpen Then
            '        tag = 1
            AddHandler(DirectCast(control, CheckedComboBoxEdit).Popup), AddressOf Popup
        End If
    End Sub

    Private Sub btnYRLevelClosedLoad(sender As Object, e As ClosedEventArgs)
        Dim Mode As PopupCloseMode = e.CloseMode
        Dim cmbXedit As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If Mode = 0 Then
            '     tag = 2
            Dim checkitem As Object = cmbXedit.Properties.GetCheckedItems()
            YearlLevelID = checkitem

            Try
                Dim dt As DataTable = model.getSubject(YearlLevelID)
                If dt.Rows.Count > 0 Then

                    Dim row As Integer = dt.Rows.Count + 1
                    _view.cmbXsubject.Properties.Items.Clear()
                    _view.cmbXsubject.Properties.DataSource = dt
                    _view.cmbXsubject.Properties.ValueMember = "id"
                    _view.cmbXsubject.Properties.DisplayMember = "name"
                    _view.cmbXsubject.Properties.DropDownRows = row
                    _view.cmbXsubject.ShowPopup()

                End If
            Catch ex As Exception

            End Try

            '     cmbXedit.ClosePopup()

        End If

    End Sub

    Private Sub LoadComboSubject(courseID As String, yearlLevelID As String)

        'Dim dt As New DataTable
        'dt = model.getSubject(InstructorID, courseID, yearlLevelID)

        '_view.cmbXsubject.Properties.DataSource = dt
        '_view.cmbXsubject.Properties.ValueMember = "id"
        '_view.cmbXsubject.Properties.DisplayMember = "name"

    End Sub

    Private Sub LoadComboYearLevel(courseID As String)

        'Dim dt As New DataTable
        'dt = model.getYearLevel(InstructorID, courseID)

        '_view.cmbXyearlevel.Properties.DataSource = dt
        '_view.cmbXyearlevel.Properties.ValueMember = "id"
        '_view.cmbXyearlevel.Properties.DisplayMember = "name"
    End Sub

    Private Sub loadList()

        Populate_DataTable()

        DesignGridview(_view.GridView1)

        '       RowTagging(_view.GridView1)

        '_view.GridControl1.DataSource = model.DisplayGrade(CourseID, YearlLevelID, SubjectID, InstructorID)

    End Sub

    Private Sub RowTagging(gridView1 As GridView)
        Dim view As GridView = DirectCast(gridView1, GridView)
        view.BeginUpdate()

        Try

            For row As Integer = 0 To view.RowCount - 1
                Dim stdSubjID = view.GetRowCellDisplayText(row, "StdSubject_id")
                If model.Exist(stdSubjID) Then
                    view.FocusedRowHandle = row
                    For Each col As GridColumn In view.FocusedColumn.View.Columns.ToList
                        col.AppearanceCell.BackColor = Color.MediumAquamarine
                        col.OptionsColumn.AllowEdit = False
                    Next

                Else

                    view.FocusedRowHandle = row
                    For Each col As GridColumn In view.FocusedColumn.View.Columns.ToList
                        col.AppearanceCell.BackColor = Color.MediumAquamarine
                        col.OptionsColumn.AllowEdit = False
                    Next


                End If
            Next

            view.EndUpdate()
        Catch ex As Exception

        End Try
 '       view.EndUpdate()

    End Sub

    Private Sub Populate_DataTable()

        Try
            Dim dt_grade_list As New DataTable
            Dim dt_cat_grade As New DataTable
            Dim dt_final_grade As New DataTable

            'Populate Data Columns
            dt_final_grade = model.getFinalGrade(InstructorID, CourseID, YearlLevelID, SubjectID, Semester)

            'Dim CatID = dt_final_grade(0)("cat_id").ToString
            'compute_grade.getCountCategory(CatID)

            compute_grade.getCountCategory(_student_category_id)

            dt_grade_list = compute_grade.getColumnHeader(dt_final_grade)

            col_limit = (3 + compute_grade.gradeperiod_cnt)
            Dim col As Integer = 0
            Dim col_hdr As Integer = 0

            'Add Rows
            Dim cnt As Integer = 0
            Do While dt_final_grade.Rows.Count > cnt
                dt_grade_list.Rows.Add()
                cnt += 1
            Loop

            For Each column As DataColumn In dt_grade_list.Columns

                For rows As Integer = 0 To dt_grade_list.Rows.Count - 1


                    If col_hdr > 3 And col_hdr <= col_limit Then

                        If col_hdr = col_limit Then
                            col = 3
                        End If


                        Dim grade_id = column.ColumnName
                        Dim std_grade_id = dt_final_grade(rows)(0).ToString

                        Dim grade As String = ""
                        grade = model.getGrade(grade_id, std_grade_id)

                        dt_grade_list(rows)(column) = grade

                    Else

                        If column.ColumnName = "EQUIVALENT" Then
                            dt_grade_list(rows)(column) = dt_final_grade(rows)(col).ToString
                            'Dim AVERAGE = dt_final_grade(rows)(col - 1).ToString()
                            'If AVERAGE <> "" Then
                            '    Try
                            '        If CDbl(AVERAGE) >= 50 Then

                            '            Dim round_up_average = compute_grade.Round_Up(CDbl(AVERAGE))
                            '            Dim equivalent = model.getEquivalent(round_up_average)

                            '            dt_grade_list(rows)(column) = equivalent
                            '        Else
                            '            rowData("AVERAGE").ToString()
                            '        End If

                            '    Catch ex As Exception
                            '        dt_grade_list(rows)(column) = AVERAGE
                            '    End Try

                            'End If
                        Else
                            dt_grade_list(rows)(column) = dt_final_grade(rows)(col).ToString
                        End If


                    End If

                Next

                col += 1
                col_hdr += 1
            Next
            _view.totalStudents.Text = dt_grade_list.Rows.Count
            _view.GridControl1.DataSource = dt_grade_list
        Catch ex As Exception

        End Try



    End Sub

    Dim ee As ClosedEventArgs

    Public Sub buttonClosed(sender As Object, e As ClosedEventArgs)

        Dim Mode As PopupCloseMode = e.CloseMode
        Dim cmbXedit As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)

        If Mode = 0 Then

            tag = 4
            Dim checkitem As Object = cmbXedit.Properties.GetCheckedItems()
            InstructorID = checkitem

            '      cmbXedit.ClosePopup()

            Dim dt As DataTable = model.getCourse(InstructorID)

            _view.cmbXCourse.Properties.Items.Clear()
            _view.cmbXInsttructor.Properties.DropDownRows = dt.Rows.Count
            _view.cmbXCourse.Properties.DataSource = dt
            _view.cmbXCourse.Properties.ValueMember = "id"
            _view.cmbXCourse.Properties.DisplayMember = "name"
            _view.cmbXCourse.ShowPopup()

            '        PopulateCombobOX(InstructorID)

            _view.GridControl1.DataSource = Nothing
        End If

    End Sub

    Private Sub PopulateCombobOX(joinID As String)

        If tag = 4 Then

            loadCourse(joinID)

            joinID = ""

            loadYearLevel(joinID)

            LoadSubject(joinID)


        ElseIf tag = 1 Then

            loadCourse(joinID)

            loadYearLevel(joinID)

        ElseIf tag = 2 Then

            loadYearLevel(joinID)

        Else

            LoadSubject(joinID)


        End If

    End Sub

    Private Sub LoadSubject(joinID As String)

        _view.cmbXsubject.Properties.Items.Clear()
        _view.cmbXsubject.Properties.DataSource = model.getSubject(joinID)
        _view.cmbXsubject.Properties.ValueMember = "id"
        _view.cmbXsubject.Properties.DisplayMember = "name"


    End Sub

    Private Sub loadYearLevel(joinID As String)

        _view.cmbXyearlevel.Properties.Items.Clear()
        _view.cmbXyearlevel.Properties.DataSource = model.getYearLevel(joinID)
        _view.cmbXyearlevel.Properties.ValueMember = "id"
        _view.cmbXyearlevel.Properties.DisplayMember = "name"


    End Sub

    Private Sub loadCourse(joinID As String)

        _view.cmbXCourse.Properties.Items.Clear()
        _view.cmbXCourse.Properties.DataSource = model.getCourse(joinID)
        _view.cmbXCourse.Properties.ValueMember = "id"
        _view.cmbXCourse.Properties.DisplayMember = "name"

    End Sub

    Private subscribe As Boolean = True

    Dim joinID As String = ""
    Dim JoinValue As String = ""


    Dim CourseID As String = ""
    Dim YearlLevelID As String = ""
    Dim SubjectID As String = ""
    Dim InstructorID As String = ""
    Dim Semester As String = ""

    Dim list As CheckedListBoxControl

    Dim InstructorList As New List(Of String)
    Dim CourseList As New List(Of String)
    Dim YearLevelList As New List(Of String)
    Dim SubjectList As New List(Of String)
    Dim ListOfId As New List(Of String)
    Dim SubjectTitle As New List(Of String)



    Private Sub list_ItemCheck(sender As Object, e As ItemCheckEventArgs)

        Try
            list = TryCast(sender, CheckedListBoxControl)


            If e.State = 1 Then
                'Add to list
                For Each item As CheckedListBoxItem In list.Items

                    If item.CheckState = CheckState.Checked Then

                        Select Case tag
                            Case 1
                                If Not CourseList.Contains(list.SelectedValue) Then
                                    CourseList.Add(list.SelectedValue)
                                End If
                            Case 2
                                If Not YearLevelList.Contains(list.SelectedValue) Then
                                    YearLevelList.Add(list.SelectedValue)
                                End If
                            Case 3
                                If Not SubjectList.Contains(list.SelectedValue) Then
                                    SubjectList.Add(list.SelectedValue)
                                End If
                                If Not SubjectTitle.Contains(item.Description) Then
                                    SubjectTitle.Add(item.Description)
                                End If
                            Case Else
                                If Not InstructorList.Contains(list.SelectedValue) Then
                                    InstructorList.Add(list.SelectedValue)
                                End If
                        End Select


                    End If

                Next item

            ElseIf e.State = 0 Then
                'Remove to List
                For Each item As CheckedListBoxItem In list.Items

                    If item.CheckState = CheckState.Unchecked Then

                        Select Case tag
                            Case 1
                                If CourseList.Contains(list.SelectedValue) Then
                                    CourseList.Remove(list.SelectedValue)
                                End If
                            Case 2
                                If YearLevelList.Contains(list.SelectedValue) Then
                                    YearLevelList.Remove(list.SelectedValue)
                                End If
                            Case 3
                                If SubjectList.Contains(list.SelectedValue) Then
                                    SubjectList.Remove(list.SelectedValue)
                                End If
                                If SubjectTitle.Contains(item.Description) Then
                                    SubjectTitle.Remove(item.Description)
                                End If
                            Case Else
                                If InstructorList.Contains(list.SelectedValue) Then
                                    InstructorList.Remove(list.SelectedValue)
                                End If
                        End Select

                    End If

                Next item


            End If

            If tag = 3 Then
                If SubjectList.Count > 0 Then
                    _view.WinLabel.Text = ""
                    For Each row In SubjectTitle.ToList
                        If _view.WinLabel.Text = "" Then
                            _view.WinLabel.Text = row
                        ElseIf _view.WinLabel.Text <> "" Then
                            _view.WinLabel.Text = _view.WinLabel.Text & "," & row
                        End If
                    Next

                Else
                    _view.WinLabel.Text = ""
                End If


            End If
        Catch ex As Exception

        End Try




    End Sub


    Private Sub Popup(sender As Object, e As EventArgs)

        Try
            subscribe = True
            If subscribe Then ' 1st approach
                Dim list As CheckedListBoxControl = (TryCast(sender, IPopupControl)).PopupWindow.Controls.OfType(Of PopupContainerControl)().First().Controls.OfType(Of CheckedListBoxControl)().First()
                '          AddHandler list.ItemCheck, AddressOf list_ItemCheck

                subscribe = False
            End If

        Catch ex As Exception

        End Try

    End Sub



    Private Sub loadComboBox()

        loadSchoolYear()

        loadStudentCategory()

    End Sub

    Private Sub loadStudentCategory()
        _view.cmbCategory.DataSource = model.getCategory()
        _view.cmbCategory.ValueMember = "id"
        _view.cmbCategory.DisplayMember = "name"
        _view.cmbCategory.SelectedIndex = -1
  
    End Sub

    Private Sub loadSchoolYear()

        _view.cmbYear.DataSource = model.getBatchYear()
        _view.cmbYear.ValueMember = "id"
        _view.cmbYear.DisplayMember = "name"
        _view.cmbYear.SelectedIndex = -1
    End Sub

    Dim btnAdd As RepositoryItemButtonEdit = New RepositoryItemButtonEdit()
    Dim btnEdit As RepositoryItemButtonEdit = New RepositoryItemButtonEdit()

    Private Sub DesignGridview(gridView1 As GridView)

        Dim EditorButtonImageOptions1 As DevExpress.XtraEditors.Controls.EditorButtonImageOptions = New DevExpress.XtraEditors.Controls.EditorButtonImageOptions()
        Dim SerializableAppearanceObject1 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim SerializableAppearanceObject2 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim SerializableAppearanceObject3 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim SerializableAppearanceObject4 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim EditorButtonImageOptions2 As DevExpress.XtraEditors.Controls.EditorButtonImageOptions = New DevExpress.XtraEditors.Controls.EditorButtonImageOptions()
        Dim SerializableAppearanceObject5 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim SerializableAppearanceObject6 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim SerializableAppearanceObject7 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()
        Dim SerializableAppearanceObject8 As DevExpress.Utils.SerializableAppearanceObject = New DevExpress.Utils.SerializableAppearanceObject()


        Dim grade_period_col As Integer = 4 + compute_grade.gradeperiod_cnt
        Dim final_grade_col As Integer = grade_period_col + 3
        Dim button_col As Integer = final_grade_col + 2

        Dim view As GridView = DirectCast(gridView1, GridView)

        For i As Integer = 0 To view.Columns.Count - 1
            view.Columns(i).AppearanceCell.Font = New Font("Tahoma", 12)
            Select Case i
                Case 0
                    view.Columns(i).Visible = False
                    view.Columns(i).Tag = 0
                Case 1
                    view.Columns(i).Visible = False
                Case 2
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).Width = 300
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 3
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 120
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case i
                    If (i > 3) And i < grade_period_col Then

                        Dim HeaderName As DataTable = model.getHeaderName(view.Columns(i).FieldName)
                        view.Columns(i).Caption = HeaderName(0)("name").ToString
                        view.Columns(i).Tag = HeaderName(0)("weight_percentage").ToString
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).Width = 150
                        view.Columns(i).OptionsColumn.AllowEdit = True

                        view.Columns(i).AppearanceCell.FontStyleDelta = FontStyle.Bold

                    ElseIf i > (grade_period_col - 1) And i < final_grade_col Then

                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).OptionsColumn.AllowEdit = True

                        If "REMARKS" = view.Columns(i).FieldName Then
                            'view.Columns(i).OptionsColumn.AllowEdit = True
                            view.Columns(i).Width = 170
                        Else
                            'view.Columns(i).OptionsColumn.AllowEdit = False
                            view.Columns(i).Width = 120
                        End If

                    ElseIf i > (final_grade_col - 1) And i < button_col Then

                        If view.Columns(i).FieldName = "btnadd" Then

                            '       btnAdd = New RepositoryItemButtonEdit()

                            btnAdd.Appearance.BorderColor = System.Drawing.Color.Black
                            btnAdd.Appearance.Options.UseBorderColor = True
                            btnAdd.Appearance.Options.UseFont = True
                            btnAdd.Appearance.Options.UseTextOptions = True
                            btnAdd.AutoHeight = False
                            btnAdd.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Office2003
                            btnAdd.Buttons.AddRange(New DevExpress.XtraEditors.Controls.EditorButton() {New DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Glyph, "Apply", 100, True, True, False, EditorButtonImageOptions1, New DevExpress.Utils.KeyShortcut(System.Windows.Forms.Keys.None), SerializableAppearanceObject1, SerializableAppearanceObject2, SerializableAppearanceObject3, SerializableAppearanceObject4, "Apply Grades", Nothing, Nothing, DevExpress.Utils.ToolTipAnchor.[Default])})
                            btnAdd.ButtonsStyle = DevExpress.XtraEditors.Controls.BorderStyles.Office2003
                            btnAdd.Name = "btnAdd"
                            btnAdd.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.HideTextEditor

                            view.Columns(i).ColumnEdit = _view.btnAdd 'btnAdd
                            '       view.GridControl.RepositoryItems.Add(btnAdd)
                            view.GridControl.RepositoryItems.Add(_view.btnAdd)
                            view.Columns(i).Caption = "Appy"
                            view.Columns(i).OptionsColumn.ShowCaption = False
                            view.Columns(i).Width = 100

                        Else

                            '        btnEdit = New RepositoryItemButtonEdit()

                            btnEdit.Appearance.BorderColor = System.Drawing.Color.Black
                            btnEdit.Appearance.Options.UseBorderColor = True
                            btnEdit.Appearance.Options.UseFont = True
                            btnEdit.Appearance.Options.UseTextOptions = True
                            btnEdit.AutoHeight = False
                            btnEdit.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Office2003
                            btnEdit.Buttons.AddRange(New DevExpress.XtraEditors.Controls.EditorButton() {New DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Glyph, "Edit", 100, True, True, False, EditorButtonImageOptions2, New DevExpress.Utils.KeyShortcut(System.Windows.Forms.Keys.None), SerializableAppearanceObject5, SerializableAppearanceObject6, SerializableAppearanceObject7, SerializableAppearanceObject8, "Edit Grades", Nothing, Nothing, DevExpress.Utils.ToolTipAnchor.[Default])})
                            btnEdit.ButtonsStyle = DevExpress.XtraEditors.Controls.BorderStyles.Office2003
                            btnEdit.Name = "btnEdit"
                            btnEdit.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.HideTextEditor


                            view.Columns(i).ColumnEdit = _view.btnEdit ' btnEdit
                            '      view.GridControl.RepositoryItems.Add(btnEdit)
                            view.GridControl.RepositoryItems.Add(_view.btnEdit)
                            view.Columns(i).Caption = "Edit"
                            view.Columns(i).OptionsColumn.ShowCaption = False
                            view.Columns(i).Width = 100

                        End If

                    Else
                        view.Columns(i).Visible = False
                    End If

            End Select


        Next

        view.OptionsView.ShowButtonMode = DevExpress.XtraGrid.Views.Base.ShowButtonModeEnum.ShowAlways

        'Count number of check each item
        Dim instrutor_count As Integer = 0
        For Each item In _view.cmbXInsttructor.Properties.GetItems().Cast(Of CheckedListBoxItem)()
            If item.CheckState = CheckState.Checked Then
                instrutor_count += 1
            End If
        Next

        Dim subject_count As Integer = 0
        For Each item In _view.cmbXsubject.Properties.GetItems().Cast(Of CheckedListBoxItem)()
            If item.CheckState = CheckState.Checked Then
                subject_count += 1
            End If
        Next

        Dim semester_count As Integer = 0
        For Each item In _view.cmbXSemester.Properties.GetItems().Cast(Of CheckedListBoxItem)()
            If item.CheckState = CheckState.Checked Then
                semester_count += 1
            End If
        Next

        Dim yearlevel_count As Integer = 0
        For Each item In _view.cmbXyearlevel.Properties.GetItems().Cast(Of CheckedListBoxItem)()
            If item.CheckState = CheckState.Checked Then
                yearlevel_count += 1
            End If
        Next

        Dim Index As Integer = 0
        If instrutor_count > 1 Then

            view.Columns("employee_name").GroupIndex = 0
            If subject_count > 1 Then
                view.Columns("SubjectTitle").GroupIndex = 1
                If semester_count > 1 Then
                    view.Columns("semester").GroupIndex = 2
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 3
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                Else
                    view.Columns("semester").GroupIndex = -1
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 0
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                End If
            Else
                view.Columns("SubjectTitle").GroupIndex = -1
                If semester_count > 1 Then
                    view.Columns("semester").GroupIndex = 0
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 1
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                Else
                    view.Columns("semester").GroupIndex = -1
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 0
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                End If
            End If


        Else
            view.Columns("employee_name").GroupIndex = -1
            If subject_count > 1 Then
                view.Columns("SubjectTitle").GroupIndex = 0
                If semester_count > 1 Then
                    view.Columns("semester").GroupIndex = 1
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 2
                        DesignGroupRow(view)
                    End If
                Else
                    view.Columns("semester").GroupIndex = -1
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 2
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                End If
            Else
                view.Columns("SubjectTitle").GroupIndex = -1
                If semester_count > 1 Then
                    view.Columns("semester").GroupIndex = 0
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 1
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                Else
                    view.Columns("semester").GroupIndex = -1
                    If yearlevel_count > 1 Then
                        view.Columns("year_level").GroupIndex = 0
                        DesignGroupRow(view)
                    Else
                        view.Columns("year_level").GroupIndex = -1
                    End If
                End If
            End If

        End If




        'If subject_count > 1 Then
        '    view.Columns("SubjectTitle").GroupIndex = 1
        'End If

        'If semester_count > 1 Then
        '    view.Columns("semester").GroupIndex = 2
        'End If

        'If yearlevel_count > 1 Then
        '    view.Columns("year_level").GroupIndex = 3
        'End If
    End Sub

    Private Sub DesignGroupRow(view As GridView)
        view.GroupFormat = "{1}"
        view.GroupRowHeight = 25
        view.OptionsView.ShowIndicator = False
        view.Appearance.GroupRow.BackColor = System.Drawing.Color.Transparent
        view.Appearance.GroupRow.Font = New System.Drawing.Font("Tahoma", 12.0!, System.Drawing.FontStyle.Bold)
        view.Appearance.GroupRow.ForeColor = System.Drawing.Color.Black
        view.Appearance.GroupRow.Options.UseBackColor = True
        view.Appearance.GroupRow.Options.UseFont = True
        view.Appearance.GroupRow.Options.UseForeColor = True
        view.Appearance.GroupRow.Options.UseTextOptions = True
        view.OptionsBehavior.AutoExpandAllGroups = True
    End Sub
End Class
