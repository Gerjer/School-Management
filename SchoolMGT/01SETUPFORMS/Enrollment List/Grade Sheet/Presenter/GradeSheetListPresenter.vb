Imports SchoolMGT
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraPdfViewer
Imports DevExpress.Utils
Imports DevExpress.XtraPrinting.Drawing
Imports DevExpress.XtraPrinting
Imports System.IO
Imports DevExpress.XtraReports.UI
Imports DevComponents.DotNetBar
'Imports System.Web.UI.WebControls
Imports DevExpress.XtraReports.Design
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.BandedGrid
Imports DevExpress.XtraGrid.Views.Grid.GridView
Imports DevExpress.Data
Imports System.Text
Imports System.Net
Imports DevExpress.Spreadsheet
Imports System.Drawing
Imports DevExpress.XtraReports.Localization
Imports DevExpress.XtraEditors.Controls
Imports DevExpress.Xpf.Editors
Imports DevExpress.XtraEditors

Public Class GradeSheetListPresenter

    Dim _view As frmGradeSheet
    Dim ListModel As New GradeSheetListModel
    Dim dt_filtered As New DataTable
    Dim dt_default As New DataTable
    Dim FirstLoad As Boolean

    Public Overridable Property AllowSort As Boolean = False

    Public Sub New(frmGradeSheet As frmGradeSheet)
        _view = frmGradeSheet

        FirstLoad = True

        _view.pbxSearch.Visible = False

        loadComboBox()
        loadHandler()
        loadDTDefault()
        '    Refresh()
        FirstLoad = False
    End Sub

    Private Sub loadDTDefault()
        dt_default = ListModel.getGradeSheetRecord(_view.cmbYear.Text)
    End Sub

    Private Sub loadHandler()

        AddHandler _view.cmbStudentCategory.SelectedIndexChanged, AddressOf cmbStudentCategory_SelectedIndexChanged
        AddHandler _view.cmbYear.SelectedIndexChanged, AddressOf cmbYear_SelectedIndexChanged
        AddHandler _view.cmbSemester.SelectedIndexChanged, AddressOf cmbSemester_SelectedIndexChanged
        AddHandler _view.cmBatch.SelectedIndexChanged, AddressOf cmBatch_SelectedIndexChanged
        AddHandler _view.cmbCourse.SelectedIndexChanged, AddressOf cmbCourse_SelectedIndexChanged
        AddHandler _view.cmbXYearLevl.Properties.Closed, AddressOf cmbYearLevel_closed
        AddHandler _view.cmbYearLevel.SelectedIndexChanged, AddressOf cmbYearLevel_SelectedIndexChanged
        AddHandler _view.cmbSubject.SelectedIndexChanged, AddressOf cmbSubject_SelectedIndexChanged
        AddHandler _view.cmbDayName.SelectedIndexChanged, AddressOf cmbDayName_SelectedIndexChange
        AddHandler _view.cmbTimeSched.SelectedIndexChanged, AddressOf cmbTimeSched_SelectedIndexChange
        AddHandler _view.cmbRoom.SelectedIndexChanged, AddressOf cmbRoom_SelectedIndexChange
        AddHandler _view.Timer1.Tick, AddressOf TTick

        '     AddHandler _view.btnSearch.Click, AddressOf LoadList

        AddHandler _view.gvGradeSheet.DataSourceChanged, AddressOf gvGradeSheetDataSourceChanged
    End Sub

    Private Sub cmbYearLevel_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbYearLevel.SelectedItem, DataRowView)
            YearLevel = drv.Item("name").ToString
            _year_level = drv.Item("name").ToString

            _batchID = ListModel.getGradeSheetBatch(_courseID, _Semester, _year_level, _academic_year)

            If _view.cmbYearLevel.Focused Then
                Subject_DropDownList()
            End If

        Catch ex As Exception
            _view.cmbYearLevel.Text = ""
        End Try


    End Sub

    Private Sub SubjectDropDownNew(batchID As Integer)

        _view.cmbSubject.DataSource = ListModel.getSubject(batchID)
        _view.cmbSubject.ValueMember = "id"
        _view.cmbSubject.DisplayMember = "name"
        _view.cmbSubject.SelectedIndex = -1

    End Sub

    Private Sub TTick(sender As Object, e As EventArgs)

        Dim tick As Integer = CInt(_view.lblTimer.Text)

        _view.lblTimer.Text = tick + 1

        If tick = 1 Then
            _view.Timer1.Enabled = False
            _view.lblTimer.Text = "0"

            getGradeSheetList(SubjectID, subjID)

            _view.pbxSearch.Visible = False

        End If



    End Sub

    Dim YearLevel As String = ""

    Dim strSubjectID As String = ""
    Private Sub cmbYearLevel_closed(sender As Object, e As ClosedEventArgs)

        strSubjectID = ""
        Dim cmbXedit As CheckedComboBoxEdit = DirectCast(sender, CheckedComboBoxEdit)
        Dim Mode As DevExpress.Xpf.Editors.PopupCloseMode = e.CloseMode

        If Mode = 0 Then
            For Each YearLevel As CheckedListBoxItem In cmbXedit.Properties.Items
                If YearLevel.CheckState = CheckState.Checked Then

                    For Each row As DataRow In From row1 As DataRow In dt_subjectID.Rows Where (row1(1).Contains(YearLevel.ToString))

                        If strSubjectID = "" Then
                            strSubjectID = row.Item(0).ToString
                        ElseIf strSubjectID <> "" Then
                            strSubjectID = strSubjectID & "," & row.Item(0).ToString
                        End If

                    Next

                End If
            Next

            Subject_DropDownList()
            _view.cmbXYearLevl.ClosePopup()

            _view.gcGradeSheet.DataSource = Nothing

        End If


    End Sub

    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCourse.SelectedItem, DataRowView)
            _view.cmbCourse.Text = drv.Item("name").ToString
            _courseID = drv.Item("id").ToString
            If _view.cmbCourse.Focused = True Then
                _view.txtDean.Text = If(IsDBNull(drv.Item("dean_name").ToString), "", drv.Item("dean_name").ToString)
                YearLevel_DropDownList()

                _view.gcGradeSheet.DataSource = Nothing

            End If


        Catch ex As Exception
            _view.cmbCourse.Text = ""
        End Try

    End Sub

    Dim SubjectID As New List(Of String)
    Dim dt_subjectID As DataTable

    Private Sub YearLevel_DropDownList()

        Try
            SubjectID = Nothing
            dt_subjectID = ListModel.getYearLevel(_view.cmbStudentCategory.SelectedValue, _view.cmbYear.Text, _view.cmbSemester.Text, _view.cmbCourse.Text)

            Dim result As DataTable = GroupByName(dt_subjectID, "name")
            '_view.cmbXYearLevl.Properties.Items.Clear()

            'For Each row As DataRow In result.Rows
            '    _view.cmbXYearLevl.Properties.Items.Add(row("name"))
            'Next
            '_view.cmbXYearLevl.Properties.DisplayMember = "name"

            '_view.cmbXYearLevl.Properties.DropDownRows = result.Rows.Count + 1
            '_view.cmbXYearLevl.ShowPopup()

            _view.cmbYearLevel.DataSource = result
            _view.cmbYearLevel.ValueMember = "id"
            _view.cmbYearLevel.DisplayMember = "name"
            _view.cmbYearLevel.SelectedIndex = -1

        Catch ex As Exception

        End Try


    End Sub

    Private Function GroupByName(dt As DataTable, Optional paraMeter As String = Nothing) As DataTable
        Dim new_dt As DataTable = dt.AsEnumerable().GroupBy(Function(gb) gb.Field(Of String)(paraMeter)).[Select](Function(sel) sel.First()).CopyToDataTable()

        Return new_dt
    End Function

    Private Sub cmbRoom_SelectedIndexChange(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbRoom.SelectedItem, DataRowView)
            _view.cmbRoom.Text = drv.Item("room").ToString
            If _view.cmbRoom.Focused Then
                RoomDropDown_Parameter()
                _view.pbxSearch.Visible = True
                _view.Timer1.Enabled = True
                '     getGradeSheetList(SubjectID)
            End If

        Catch ex As Exception
            _view.cmbRoom.Text = ""
            '           MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub cmbTimeSched_SelectedIndexChange(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbTimeSched.SelectedItem, DataRowView)
            _view.cmbTimeSched.Text = drv.Item("class_time").ToString
            If _view.cmbTimeSched.Focused Then
                RoomAssign_DropDownList()
                '       RoomDropDown_Parameter()
                _view.pbxSearch.Visible = True
                _view.Timer1.Enabled = True
                '     getGradeSheetList(SubjectID)

            End If

        Catch ex As Exception
            _view.cmbTimeSched.Text = ""
        End Try

    End Sub

    Private Sub RoomDropDown_Parameter()
        Try
            SubjectID = New List(Of String)
            Dim result = dt_StudntSubjectID.Clone()
            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("name").Contains(_view.cmbSubject.Text) And row1("day").Contains(_view.cmbDayName.Text) And row1("class_time").Contains(_view.cmbTimeSched.Text) And row1("room").Contains(_view.cmbRoom.Text))

                SubjectID.Add(row.Item(0).ToString)
                result.ImportRow(row)
            Next

            getLoad = True

        Catch ex As Exception

        End Try


    End Sub

    Private Sub cmbDayName_SelectedIndexChange(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbDayName.SelectedItem, DataRowView)

            _view.cmbDayName.Text = drv.Item("day").ToString
            If _view.cmbDayName.Focused Then
                TimeSchedule_DropDownList()
                _view.pbxSearch.Visible = True
                _view.Timer1.Enabled = True
                '    getGradeSheetList(SubjectID)
            End If

        Catch ex As Exception
            _view.cmbDayName.Text = ""
        End Try
    End Sub

    Dim getLoad As Boolean = False
    Dim subjID As String = ""

    Private Sub cmbSubject_SelectedIndexChanged(sender As Object, e As EventArgs)

        If FirstLoad = False Then

            Try
                Dim drv As DataRowView = DirectCast(_view.cmbSubject.SelectedItem, DataRowView)


                _view.cmbSubject.SelectedValue = drv.Item("id").ToString
                _view.cmbSubject.Text = drv.Item("name").ToString
                subjID = drv.Item("subjID").ToString

                If _view.cmbSubject.Focused Then

                    _view.txtInstructor.Text = ListModel.getInstructor(subjID)

                    DaySchedule_DropDownList()
                    _view.pbxSearch.Visible = True
                    _view.Timer1.Enabled = True
                    '   getGradeSheetList(SubjectID)

                    _view.cmbDayName.Text = ""
                    _view.cmbTimeSched.Text = ""
                    _view.cmbRoom.Text = ""

                End If

                _view.GroupPanel6.Visible = True

            Catch ex As Exception
                _view.cmbSubject.Text = ""
                _view.lblcreditsunit.Text = ""
                _view.txtSubjectDescription.Text = ""
                '             MsgBox(ex.Message)
            End Try

            ColumnExisting = False

        End If

    End Sub

    Private Sub getStudentSubjectID(subjID As String)

        strSubjectID = ""

        Dim dt As New DataTable
        dt = ListModel.getStudentSubjectID(subjID)

        For Each rows As DataRow In dt.Rows

            If strSubjectID = "" Then
                strSubjectID = rows.Item("id").ToString
            ElseIf strSubjectID <> "" Then
                strSubjectID = strSubjectID & "," & rows.Item("id").ToString
            End If

        Next


    End Sub

    Private Sub RoomAssign_DropDownList()

        Try
            SubjectID = New List(Of String)
            Dim result = dt_StudntSubjectID.Clone()
            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("name").Contains(_view.cmbSubject.Text) And row1("day").Contains(_view.cmbDayName.Text) And row1("class_time").Contains(_view.cmbTimeSched.Text))

                SubjectID.Add(row.Item(0).ToString)
                result.ImportRow(row)
            Next

            getLoad = True
            result = GroupByName(result, "name")
            _view.cmbRoom.DataSource = result 'ListModel.getRoomAssign(_view.cmbSubject.Text, _view.cmBatch.SelectedValue)
            _view.cmbRoom.ValueMember = "id"
            _view.cmbRoom.DisplayMember = "room"
            _view.cmbRoom.SelectedIndex = -1
        Catch ex As Exception

        End Try


    End Sub

    Private Sub TimeSchedule_DropDownList()

        _dt_master_student = Nothing
        Try
            SubjectID = New List(Of String)
            Dim result = dt_StudntSubjectID.Clone()
            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("name").Contains(_view.cmbSubject.Text)) And (row1("day").Contains(_view.cmbDayName.Text))

                SubjectID.Add(row.Item(0).ToString)
                result.ImportRow(row)

            Next

            getLoad = True
            result = GroupByName(result, "name")

            _view.cmbTimeSched.DataSource = result 'ListModel.getTimeSchedule(_view.cmbSubject.Text, _view.cmBatch.SelectedValue)
            _view.cmbTimeSched.ValueMember = "id"
            _view.cmbTimeSched.DisplayMember = "class_time"
            _view.cmbTimeSched.SelectedIndex = -1
        Catch ex As Exception
            _view.cmbTimeSched.Text = ""
        End Try



    End Sub

    Private Sub DaySchedule_DropDownList()

        Try
            SubjectID = New List(Of String)
            Dim result = dt_StudntSubjectID.Clone()
            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("name").Contains(_view.cmbSubject.Text) And row1("GenderOrder").Contains("MALE"))

                SubjectID.Add(row.Item(0).ToString)

                result.ImportRow(row)
            Next

            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("name").Contains(_view.cmbSubject.Text) And row1("GenderOrder").Contains("FEMALE"))

                SubjectID.Add(row.Item(0).ToString)

                result.ImportRow(row)
            Next

            getLoad = False

            result = GroupByName(result, "name")

            _view.cmbDayName.DataSource = result 'ListModel.getDaySchedule(_view.cmbSubject.Text, _view.cmBatch.SelectedValue)
            _view.cmbDayName.ValueMember = "id"
            _view.cmbDayName.DisplayMember = "day"
            _view.cmbDayName.SelectedIndex = -1
            '        End If


        Catch ex As Exception
            MsgBox(ex.Message)
        End Try



    End Sub

    Private Sub cmBatch_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            _view.lblcreditsunit.Text = ""
            _view.txtSubjectDescription.Text = ""

            Dim drv As DataRowView = DirectCast(_view.cmBatch.SelectedItem, DataRowView)
            '          Batch = drv.Item("name").ToString
            _view.cmBatch.Text = drv.Item("name").ToString
            _view.cmBatch.SelectedValue = drv.Item("id").ToString

            If _view.cmBatch.Focused Then
                Subject_DropDownList()
            End If

            '        getParameter(True)

        Catch ex As Exception
            _view.cmBatch.Text = ""
        End Try


    End Sub

    Private Function cmbSemester_SelectedIndexChanged() As Object
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbSemester.SelectedItem, DataRowView)
            _view.cmbSemester.Text = drv.Item("name").ToString
            _Semester = drv.Item("name").ToString
            If _view.cmbSemester.Focused Then
                '           Batch_DropDownList()
                Course_DropDwownList()

                _view.gcGradeSheet.DataSource = Nothing

                _view.cmbXYearLevl.Properties.Items.Clear()
                _view.cmbSubject.DataSource = Nothing
                _view.cmbDayName.DataSource = Nothing
                _view.cmbTimeSched.DataSource = Nothing
                _view.cmbRoom.DataSource = Nothing

            End If

            '         getParameter()
        Catch ex As Exception
            _view.cmbSemester.Text = ""
        End Try

    End Function

    Private Sub Course_DropDwownList()

        Try
            _view.cmbCourse.DataSource = ListModel.getCourseSheet(_view.cmbStudentCategory.SelectedValue, _view.cmbYear.Text, _view.cmbSemester.Text)
            _view.cmbCourse.ValueMember = "id"
            _view.cmbCourse.DisplayMember = "name"
            _view.cmbCourse.SelectedIndex = -1
        Catch ex As Exception

        End Try

    End Sub

    Private Sub cmbStudentCategory_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbStudentCategory.SelectedItem, DataRowView)
            _student_category_id = drv.Item("id").ToString
            _view.cmbStudentCategory.Text = drv.Item("name").ToString
            '       _view.cmbStudentCategory.SelectedValue = drv.Item("id").ToString
            If _view.cmbStudentCategory.Focused Then
                AcademicYearLoadDropDown()

                _view.gcGradeSheet.DataSource = Nothing

            End If

            '       getParameter()
        Catch ex As Exception
            _view.cmbStudentCategory.Text = ""
            '           MsgBox(ex.Message)
        End Try

    End Sub

    Private Sub ClearFields()
        _view.gcGradeSheet.DataSource = Nothing
        _view.cmbYear.DataSource = Nothing
        _view.cmbSemester.DataSource = Nothing
        _view.cmbCourse.DataSource = Nothing
        _view.cmbXYearLevl.Properties.Items.Clear()
        _view.cmbSubject.DataSource = Nothing
        _view.cmbDayName.DataSource = Nothing
        _view.cmbTimeSched.DataSource = Nothing
        _view.cmbRoom.DataSource = Nothing
    End Sub

    Private Sub cmbYear_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbYear.SelectedItem, DataRowView)
            _view.cmbYear.Text = drv.Item("name").ToString
            _academic_year = drv.Item("name").ToString

            If _view.cmbYear.Focused Then
                Semester_DropDownList()
                _view.gcGradeSheet.DataSource = Nothing

            End If

        Catch ex As Exception
            _view.cmbYear.Text = ""
        End Try
        '      Cursor.Current = Cursors.Default
    End Sub

    Dim AcademicYear As String = ""
    Dim _Semester As String = ""
    Dim Batch As String = ""
    Dim Subject As String = ""
    Dim DaySched As String = ""
    Dim TimeSched As String = ""
    Dim RoomAssign As String = ""

    Dim dt_GradeSheet As New DataTable

    Dim dt As New DataTable
    Dim ColumnExisting As Boolean = False
    Private Sub getGradeSheetList(ListOfID As List(Of String), subjID As String)

        Cursor.Current = Cursors.WaitCursor

        _view.gvGradeSheet.Columns.Clear()

        _view.lblmalecount.Text = 0
        _view.lblfemalecount.Text = 0

        dt = Nothing
        '    dt = ListModel.LoadGradeSheetNew(ListOfID, subjID)
        If getLoad = True Then
            dt = loadSelectedGradeSheet(ListOfID, dt_GradeSheet)
        Else
            dt = ListModel.LoadGradeSheetPerSubject(subjID)
            dt_GradeSheet = dt
        End If


        If dt.Rows.Count > 0 Then

            'Add Column

            Dim dt_column As New DataTable
            dt_column = ListModel.getColumn(_view.cmbStudentCategory.SelectedValue)
            If dt_column.Rows.Count > 0 Then
                For Each colRoww As DataRow In dt_column.Rows
                    If ColumnExisting = False Then
                        dt.Columns.Add(colRoww.Item("name"))
                    End If
                Next
                ColumnExisting = True
            End If

            Dim ColumnName As String = ""
            Dim dt_grades As New DataTable

            Dim cnt_grade_setup As Integer = ListModel.getGradeSetup(_view.cmbStudentCategory.SelectedValue)
            Dim col_limit As Integer = dt.Columns.Count - 3  '10 + cnt_grade_setup
            Dim total_grade As Double = 0


            If dt.Rows.Count > 0 Then


                Dim row_grade As Integer = 0
                '    Dim ColInt As Integer
                '             Convert.ToInt32(dt.Columns("No."))

                For Each rows As DataRow In dt.Rows
                    Dim coll As Integer = 0


                    Try

                        dt_grades = ListModel.Grades(rows("StudentSubjID"))

                        For col As Integer = 0 To dt.Columns.Count - 1
                            coll = col
                            Dim ColName As String = dt.Columns(col).ToString
                            If col >= 9 And col < col_limit Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value

                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try


                            ElseIf "AVERAGE" = dt.Columns(col).ToString Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value

                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try


                            ElseIf "EQUIVALENT" = dt.Columns(col).ToString Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value
                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try


                            ElseIf "REMARKS" = dt.Columns(col).ToString Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value
                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try

                            End If


                        Next


                        'count
                        If rows.Item("GenderOrder") = "MALE" Then
                            _view.lblmalecount.Text += 1
                        Else
                            _view.lblfemalecount.Text += 1
                        End If

                        row_grade = 0

                    Catch ex As Exception
                        '           MsgBox(coll)
                        MsgBox(ex.Message)
                    End Try


                Next

                _view.lblTotal.Text = CInt(_view.lblmalecount.Text) + CInt(_view.lblfemalecount.Text)

                lastCol = dt.Columns.Count - 1


                Dim datav As New DataView
                datav = dt.DefaultView
                datav.Sort = "GenderOrder DESC,LAST NAME ASC" 'or ASC, or anything just search for dataview.
                dt = datav.ToTable()

                Dim newCntMale As String = "1"
                Dim newCntFemale As String = "1"

                For Each row As DataRow In dt.Rows
                    If row.Item("GenderOrder") = "MALE" Then
                        row.Item(dt.Columns(0).ToString) = newCntMale
                        newCntMale += 1
                    Else
                        row.Item(dt.Columns(0).ToString) = newCntFemale
                        newCntFemale += 1
                    End If
                Next

                _view.gcGradeSheet.DataSource = dt
       '         getDesign1GridControl(_view.gvGradeSheet)


                _view.btnPrint.Enabled = True
            End If


        End If

        Cursor.Current = Cursors.WaitCursor

    End Sub

    Private Function loadSelectedGradeSheet(listOfID As List(Of String), dt_GradeSheet As DataTable) As DataTable

        Dim result = dt_GradeSheet.Clone()

        For Each subjID In listOfID.ToList

            For Each row As DataRow In From row1 As DataRow In dt_GradeSheet.Rows Where (row1("StudentSubjID") = (subjID))
                result.ImportRow(row)
            Next

        Next
        Return result

    End Function

    Private Sub getParameter(Optional display As Boolean = Nothing)


        If _view.cmbYear.Text = "" Then
            AcademicYear = "%"
        Else
            AcademicYear = _view.cmbYear.Text
        End If

        If _view.cmbSemester.Text = "" Then
            _Semester = "%"
        Else
            _Semester = _view.cmbSemester.Text
        End If

        If _view.cmBatch.Text = "" Then
            Batch = "%"
        Else
            Batch = _view.cmBatch.Text
        End If


        If _view.cmbSubject.Text = "" Then
            Subject = "%"
        Else
            Subject = _view.cmbSubject.Text
        End If


        If _view.cmbDayName.Text = "" Then
            DaySched = "%"
        Else
            DaySched = _view.cmbDayName.Text
        End If


        If _view.cmbTimeSched.Text = "" Then
            TimeSched = "%"
        Else
            TimeSched = _view.cmbTimeSched.Text
        End If


        If _view.cmbRoom.Text = "" Then
            RoomAssign = "%"
        Else
            RoomAssign = _view.cmbRoom.Text
        End If

        '       If display Then
        LoadGradeSheet(_view.cmbStudentCategory.Text, AcademicYear, _Semester, Batch, Subject, DaySched, TimeSched, RoomAssign)
        '      End If

    End Sub

    Private Sub LoadGradeSheet(StudentCategory_id As String, AcademicYear As String, Semester As String, BatchI_id As String, Subject As Object, DaySched As Object, TimeSched As Object, Room As Object)

        _view.gvGradeSheet.Columns.Clear()


        _view.lblmalecount.Text = 0
        _view.lblfemalecount.Text = 0

        Dim dt As New DataTable
        '    _view.gcGradeSheet.DataSource = Nothing

        dt = ListModel.LoadGradeSheet(StudentCategory_id, AcademicYear, Semester, BatchI_id, Subject, DaySched, TimeSched, Room)

        If dt.Rows.Count > 0 Then

            'Add Column
            Dim dt_column As New DataTable
            dt_column = ListModel.getColumn(13)
            If dt_column.Rows.Count > 0 Then
                For Each colRoww As DataRow In dt_column.Rows
                    dt.Columns.Add(colRoww.Item("name"))
                Next
            End If

            Dim ColumnName As String = ""
            Dim dt_grades As New DataTable

            Dim cnt_grade_setup As Integer = ListModel.getGradeSetup(_view.cmbStudentCategory.SelectedValue)
            Dim col_limit As Integer = dt.Columns.Count - 3  '10 + cnt_grade_setup
            Dim total_grade As Double = 0


            If dt.Rows.Count > 0 Then


                Dim row_grade As Integer = 0

                For Each rows As DataRow In dt.Rows
                    Dim coll As Integer = 0
                    Try

                        dt_grades = ListModel.Grades(rows("StudentSubjID"))

                        If rows("No.") = 670 Then
                            rows("No.") = 670
                        End If

                        For col As Integer = 0 To dt.Columns.Count - 1
                            coll = col
                            Dim ColName As String = dt.Columns(col).ToString
                            If col >= 10 And col < col_limit Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
            Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value

                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try


                            ElseIf "AVERAGE" = dt.Columns(col).ToString Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value

                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try


                                'If dt_grades.Rows.Count > 3 Then
                                '    rows.Item(dt.Columns(col).ToString) = dt_grades(row_grade)("grades").ToString
                                '    row_grade += 1
                                'End If

                            ElseIf "EQUIVALENT" = dt.Columns(col).ToString Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value
                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try

                                'If dt_grades.Rows.Count > 3 Then
                                '    rows.Item(dt.Columns(col).ToString) = dt_grades(row_grade)("grades").ToString
                                '    row_grade += 1
                                'End If

                            ElseIf "REMARKS" = dt.Columns(col).ToString Then

                                Try
                                    Dim dtRow As DataRow() = dt_grades.Select("name = '" & ColName & "' ")
                                    Dim value = dtRow(0).ItemArray(1).ToString

                                    rows.Item(dt.Columns(col).ToString) = value
                                Catch ex As Exception
                                    rows.Item(dt.Columns(col).ToString) = ""
                                End Try



                                'If dt_grades.Rows.Count > 3 Then
                                '    rows.Item(dt.Columns(col).ToString) = dt_grades(row_grade)("grades").ToString
                                'End If
                            End If

                        Next

                        'count
                        If rows.Item("gender") = "MALE" Then
                            _view.lblmalecount.Text += 1
                        Else
                            _view.lblfemalecount.Text += 1
                        End If



                        row_grade = 0
                        '          ColumnName = ""

                        'End If

                    Catch ex As Exception
                        MsgBox(coll)
                    End Try


                Next

                _view.lblTotal.Text = CInt(_view.lblmalecount.Text) + CInt(_view.lblfemalecount.Text)

                lastCol = dt.Columns.Count - 1

                _view.gcGradeSheet.DataSource = dt

                getDesignGridControl(_view.gvGradeSheet)
                '           gvGradeSheetDataSourceChanged(_view.gvGradeSheet)

                _view.btnPrint.Enabled = True
            End If
        End If

    End Sub

    Private Sub gvGradeSheetDataSourceChanged(sender As Object, Optional e As EventArgs = Nothing)

        Dim View As GridView = DirectCast(sender, GridView)
        View.GroupFormat = "{1}"
        View.Columns("GenderOrder").GroupIndex = 0
        View.OptionsBehavior.KeepGroupExpandedOnSorting = False
        View.Columns("GenderOrder").SortOrder = ColumnSortOrder.Descending
        View.Columns("No.").SortOrder = ColumnSortOrder.Ascending
        '    View.GroupSummarySortInfo.Clear()

        For i As Integer = 0 To View.Columns.Count - 1

            Select Case i
                Case 0
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                    View.Columns(i).Width = 60
                    View.Columns(i).OptionsColumn.AllowSort = DefaultBoolean.False
                Case 1, 5, 6, 7, 8
                    View.Columns(i).Visible = False
                    View.Columns(i).OptionsColumn.AllowSort = DefaultBoolean.False
                Case 2, 3, 4
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Near
                    View.Columns(i).Width = 150
                    View.Columns(i).OptionsColumn.AllowSort = DefaultBoolean.False
                'Case 6
                '    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                '    View.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Near
                '    View.Columns(i).Width = 200
                '    View.Columns(i).OptionsColumn.AllowSort = DefaultBoolean.False
                Case lastCol
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                    View.Columns(i).Width = 150
                    View.Columns(i).OptionsColumn.AllowSort = DefaultBoolean.False
                Case Else
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                    View.Columns(i).Width = 100
                    View.Columns(i).OptionsColumn.AllowSort = DefaultBoolean.False
            End Select

        Next



        'View.BeginSort()

        '      View.Columns("GenderOrder").SortOrder = ColumnSortOrder.Descending
        '       View.Columns("No.").SortIndex = ColumnSortOrder.None

        'View.EndSort()

        View.ExpandAllGroups()

    End Sub





    Private Sub BatchSelectedValueChanged(sender As Object, e As EventArgs)

        If _view.cmBatch.Text.Length > 0 Then
            Subject_DropDownList()
        End If

    End Sub

    Private Sub loadfiltered(dt_filtered As DataTable)

        Dim dt As New DataTable

        dt = dt_filtered
        If dt.Rows.Count > 0 Then

            'Add Column
            Dim dt_column As New DataTable
            dt_column = ListModel.getColumn(13)
            If dt_column.Rows.Count > 0 Then
                For Each colRoww As DataRow In dt_column.Rows
                    dt.Columns.Add(colRoww.Item("name"))
                Next
            End If

            Dim ColumnName As String = ""
            Dim ColGrading As Integer = 0
            Dim dt_grades As New DataTable
            If dt.Rows.Count > 0 Then

                Dim x As Integer = 0

                For Each rows As DataRow In dt.Rows
                    For col As Integer = 0 To dt.Columns.Count - 1

                        ColumnName = dt.Columns(col).ToString
                        If ColumnName = "student_subject_id" Then
                            dt_grades = ListModel.Grades(rows("student_subject_id"))
                            If dt_grades.Rows.Count > 1 Then
                                ColGrading = col
                            End If
                        ElseIf ColGrading <> 0 Then
                            rows(ColumnName) = dt_grades(x)("grades")
                            x += 1
                            If dt_grades.Rows.Count - 1 >= x Then
                                ColumnName = dt_grades(x)("name")
                            End If
                        End If
                        'If ColumnName = "" Then

                        '    dt_grades = ListModel.Grades(rows("student_subject_id"))
                        '    ColumnName = dt_grades(0)("name")

                        'ElseIf ColumnName = dt.Columns(col).ToString Then

                        '    rows(ColumnName) = dt_grades(x)("grades")
                        '    x += 1
                        '    If dt_grades.Rows.Count - 1 >= x Then
                        '        ColumnName = dt_grades(x)("name")
                        '    End If
                        'End If
                        '                ColGrading = 0
                    Next

                    ''count
                    'If rows.Item("gender") = "MALE" Then
                    '    _view.lblmalecount.Text += 1
                    'Else
                    '    _view.lblfemalecount.Text += 1
                    'End If


                    x = 0
                    ColumnName = ""
                    ColGrading = 0
                Next

                '          _view.lblTotal.Text = CInt(_view.lblmalecount.Text) + CInt(_view.lblfemalecount.Text)


                _view.gcGradeSheet.DataSource = dt

                '       getDesign1GridControl(_view.gvGradeSheet)

            End If
        End If

        _view.gcGradeSheet.DataSource = dt

    End Sub

    Private Sub getDesign1GridControl(view As Views.Grid.GridView)

        view.Columns.View.OptionsBehavior.Editable = False

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 7, 11, 13, 14
                    view.Columns(i).Visible = False

                Case Else
                    If i > 14 Then
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                        view.Columns(i).BestFit()
                    Else
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Near
                        view.Columns(i).BestFit()
                    End If

            End Select

        Next

        view.OptionsView.ColumnAutoWidth = True
        '      view.EndUpdate()

    End Sub



    Private Sub loadComboBox()

        StudentCategory_DropDownList()

    End Sub

    Private Sub AcademicYearLoadDropDown()

        _view.cmbYear.DataSource = ListModel.getAcademicYear(_student_category_id)
        _view.cmbYear.DisplayMember = "name"
        _view.cmbYear.SelectedIndex = -1

    End Sub

    Private Sub Batch_DropDownList()

        _view.cmBatch.DataSource = ListModel.getBatchGradeSheet(_view.cmbStudentCategory.SelectedValue, _view.cmbYear.Text, _view.cmbSemester.Text)
        _view.cmBatch.ValueMember = "id"
        _view.cmBatch.DisplayMember = "name"
        _view.cmBatch.SelectedIndex = -1

    End Sub


    Private Sub Semester_DropDownList()

        _view.cmbSemester.DataSource = ListModel.getSemester(_view.cmbStudentCategory.SelectedValue, _view.cmbYear.Text)
        '       _view.cmbSemester.ValueMember = "id"
        _view.cmbSemester.DisplayMember = "name"
        _view.cmbSemester.SelectedIndex = -1

    End Sub


    Private Sub Department_DropDownList()

        _view.cmbDepartment.DataSource = ListModel.DepartmentList()
        _view.cmbDepartment.ValueMember = "ID"
        _view.cmbDepartment.DisplayMember = "name"
        _view.cmbDepartment.SelectedValue = -1

    End Sub

    Private Sub DayName_DropDownList(dt As DataTable)

        _view.cmbDayName.DataSource = dt 'ListModel.DayNameList()
        _view.cmbDayName.ValueMember = "ID"
        _view.cmbDayName.DisplayMember = "name"
        _view.cmbDayName.SelectedValue = -1
    End Sub

    Dim dt_StudntSubjectID As DataTable

    Dim _male As String = "MALE"
    Dim _female As String = "FEMALE"
    Private Sub Subject_DropDownList()

        Try
            dt_StudntSubjectID = Nothing
            SubjectID = New List(Of String)

            dt_StudntSubjectID = ListModel.SubjectListNew(_batchID)

            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("GenderOrder").Contains(_male) And row1("GenderOrder").Contains("MALE"))

                SubjectID.Add(row.Item(0).ToString)

            Next

            For Each row As DataRow In From row1 As DataRow In dt_StudntSubjectID.Rows Where (row1("GenderOrder").Contains(_female) And row1("GenderOrder").Contains("FEMALE"))

                SubjectID.Add(row.Item(0).ToString)

            Next

            Dim result As DataTable = GroupByName(dt_StudntSubjectID, "name")

            _view.cmbSubject.DataSource = result
            _view.cmbSubject.ValueMember = "id"
            _view.cmbSubject.DisplayMember = "name"
            _view.cmbSubject.SelectedIndex = -1
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Private Sub StudentCategory_DropDownList()

        _view.cmbStudentCategory.DataSource = ListModel.StudentCategoryList()
        _view.cmbStudentCategory.ValueMember = "id"
        _view.cmbStudentCategory.DisplayMember = "name"
        _view.cmbStudentCategory.SelectedValue = -1

    End Sub

    Dim lastCol As Integer

    Private Sub getDesignGridControl(view As Views.Grid.GridView)

        view.BeginUpdate()
        '     view.Columns.View.OptionsBehavior.Editable = False
        '   '      view.OptionsView.ColumnAutoWidth = False
        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 1, 5, 7, 8, 9
                    view.Columns(i).Visible = False
                Case 0
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                    view.Columns(i).Width = 70
                Case 2, 3, 4
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Near
                    view.Columns(i).Width = 150
                Case 6
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Near
                    view.Columns(i).Width = 200
                Case lastCol
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                    view.Columns(i).Width = 150
                Case Else
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorzAlignment.Center
                    view.Columns(i).Width = 100

            End Select

        Next

        _view.gvGradeSheet.Columns("gender").GroupIndex = 0
        view.OptionsView.ColumnAutoWidth = True
        '      _view.gvGradeSheet.ExpandAllGroups()

        view.EndUpdate()


    End Sub




    Friend Sub Print()

        Cursor.Current = Cursors.WaitCursor

        Try
            Dim report As New xtrGradeSheetNew
            'If Not File.Exists(COMPANY_HEADER_PATH) Then
            '    report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(DefaultHeaderPic))
            'Else
            '    report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(COMPANY_HEADER_PATH))
            'End If

            Dim yrLvl As String = ""
            For Each item As CheckedListBoxItem In _view.cmbXYearLevl.Properties.Items
                If item.CheckState = CheckState.Checked Then
                    If yrLvl = "" Then
                        yrLvl = item.Value
                    ElseIf yrLvl <> "" Then
                        yrLvl = yrLvl & "," & item.Value
                    End If
                End If
            Next

#Region "Signatory"
            Try

                report.XrLabel34.Text = _view.txtDean.Text
                report.XrLabel8.Text = _view.txtInstructor.Text

                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                report.XrLabel2.Text = dt_sigantory(0)("name")
                report.XrLabel3.Text = dt_sigantory(0)("designation")

                report.XrLabel11.Text = dt_sigantory(1)("name")
                report.XrLabel10.Text = dt_sigantory(1)("designation")

                report.XrLabel5.Text = dt_sigantory(2)("name")
                report.XrLabel4.Text = dt_sigantory(2)("designation")

                report.XrLabel14.Text = dt_sigantory(3)("name")
                report.XrLabel15.Text = dt_sigantory(3)("designation")


            Catch ex As Exception
            End Try

#End Region

            _view.cmbXYearLevl.Text = yrLvl
            report.str = yrLvl
            report.XrLyr.Text = _view.cmbXYearLevl.Text
            report.XrLdescription.Text = _view.cmbCourse.Text
            report.XrLsubject.Text = _view.cmbSubject.Text
            report.XrLsemester.Text = _view.cmbSemester.Text
            report.XrLacademicyear.Text = _view.cmbYear.Text
            report.XrLdeapartment.Text = _view.cmbDepartment.Text
            report.XrLdays.Text = _view.cmbDayName.Text
            report.XrLtime.Text = _view.cmbTimeSched.Text
            report.XrLroom.Text = _view.cmbRoom.Text

            report.XrLblcreditunit.Text = "CREDIT UNIT : " & _view.lblcreditsunit.Text
            'report.XrLblmalecount.Text = _view.lblmalecount.Text
            'report.XrLblfemalecount.Text = _view.lblfemalecount.Text
            'report.XrLbltotal.Text = _view.lblTotal.Text

            report.PrintableComponentContainer1.PrintableComponent = _view.gcGradeSheet

            report.PrintingSystem.Document.AutoFitToPagesWidth = 1
            report.CreateDocument()
            report.ShowPreview

        Catch ex As Exception

        End Try


        Cursor.Current = Cursors.Default


    End Sub

    Private Function CreateXRRichText() As XRRichText
        Dim XrRichText1 As New XRRichText()

        ' Set its height to be calculated automatically,
        ' and make its borders visible.
        XrRichText1.CanGrow = True
        XrRichText1.CanShrink = True
        XrRichText1.Borders = DevExpress.XtraPrinting.BorderSide.All

        ' Create an array of lines and assign it to the rich text.
        Dim BoxLines() As String = New String(2) {}
        BoxLines(0) = "Line 1"
        BoxLines(1) = "Line 2"
        BoxLines(2) = "Line 3"
        XrRichText1.Lines = BoxLines
        XrRichText1.Text = "Rogerfdfdsgsgsg"
        ' Export its contents to a text file.
        '      XrRichText10.1SaveFile("output.txt", XRRichTextStreamType.PlainText)

        Return XrRichText1


    End Function
End Class
