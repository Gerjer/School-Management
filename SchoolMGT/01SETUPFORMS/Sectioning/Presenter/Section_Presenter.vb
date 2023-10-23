Imports DevExpress.Utils
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraGrid.Views.Grid.ViewInfo
Imports SchoolMGT
Imports System.ComponentModel
Public Class Section_Presenter
    Private _view As frmSectioning
    Private model As New Section_Model
    Dim section As New List(Of Sectioning)
    Dim section_details As New DataTable

    Private WithEvents menu As New ContextMenuStrip

    Public Sub New(view As frmSectioning)
        _view = view

        _view.ContextMenuStrip = menu
        '    _view.ContextMenuStrip.Text = "SCETION NAME"

        If _view.rdbCollege.Checked = True Then
            catID = _view.rdbCollege.Tag
            _student_category_id = _view.rdbCollege.Tag
        End If

        loadCombobox()
        loadHandler()
        SchoolYear = Format(Date.Now, "yyyy")
        loadList()

    End Sub

    Private Sub menu_Opening(sender As Object, e As CancelEventArgs) Handles menu.Opening
        If _view.ContextMenuStrip1.Items.Count = 0 Then

            For Each row As DataRow In SectionAvailable.Rows


                Dim newMenuItem As New ToolStripMenuItem
                newMenuItem.Text = row.Item("section_name").ToString
                newMenuItem.Tag = row.Item("id").ToString

                '      menu.Items.Add(newMenuItem)
                _view.ContextMenuStrip1.Items.Add(newMenuItem)

            Next
            '    Dim Menuitem = row.Item("section_name").ToString
            '    Dim MenuID = row.Item("Id").ToString
            '    menu.Items.AddRange({New ToolStripMenuItem(Menuitem), New ToolStripMenuItem(MenuID)})
            'Next

            'menu.Items.AddRange({New ToolStripMenuItem("First"),
            '                     New ToolStripMenuItem("Second"),
            '                     New ToolStripMenuItem("Third")})
        End If
    End Sub

    Private Sub menu_ItemClicked(sender As Object, e As ToolStripItemClickedEventArgs) Handles menu.ItemClicked

        If e.ClickedItem.Tag IsNot Nothing Then

            Try
                DataSource(String.Format("UPDATE sectioning_details SET `sectioning_id` = '" & e.ClickedItem.Tag & "' WHERE `id` = '" & id & "'"))
                MessageBox.Show("STUDENT HAS BEEN TRASNFERRED INTO ANOTHER SECTION", "", MessageBoxButtons.OK, MessageBoxIcon.Information)

                _view.gvSectionList.DeleteSelectedRows()

                Existt = True
            Catch ex As Exception

            End Try

        End If


    End Sub


    Private Sub loadList()

        Dim str As String = ""
        If _view.cmbYear.Text <> "" Then
            str = "WHERE sectioning.school_year = '" & SchoolYear & "' AND category_id = '" & catID & "'"
        End If
        If _view.cmbCourse.Text <> "--- ALL ---" Then
            str += " AND batches.course_id = '" & CourseID & "' "
        End If
        If _view.cmbSemester.Text <> "--- ALL ---" Then
            str += " AND batches.semester = '" & Semester & "' "
        End If
        If _view.cmbBatch.Text <> "--- ALL ---" Then
            str += " AND batches.id = '" & BatchId & "' "
        End If
        If _view.cmbSubjectName.Text <> "--- ALL ---" Then
            str += " AND subjects.id= '" & SubjectID & "' "
        End If
        If _view.cmbInstructor.Text <> "--- ALL ---" Then
            str += " AND instructor_id = '" & InstructorID & "' "
        End If

        Dim dt As DataTable
        dt = model.list(str)


        _view.gvSectionSetup.OptionsSelection.EnableAppearanceFocusedCell = True
        _view.gvSectionSetup.OptionsSelection.EnableAppearanceFocusedRow = True
        _view.gvSectionSetup.OptionsSelection.EnableAppearanceHideSelection = False

        _view.gvSectionSetup.FocusRectStyle = DevExpress.XtraGrid.Views.Grid.DrawFocusRectStyle.RowFocus

        For Each column As GridColumn In _view.gvSectionSetup.Columns
            column.OptionsColumn.AllowFocus = False
        Next

        _view.gcSectionSetup.DataSource = dt

        If _view.cmbInstructor.Text <> "--- ALL ---" Then
            _view.gvSectionSetup.FindFilterText = _view.cmbInstructor.Text
        Else
            _view.gvSectionSetup.FindFilterText = ""
        End If

        section_details = model.getSection("")


    End Sub

    Private Sub loadHandler()

        AddHandler _view.cmbCategory.SelectedIndexChanged, AddressOf cmbCategory_SelectedIndexChanged
        AddHandler _view.cmbYear.SelectedIndexChanged, AddressOf cmbYear_SelectedIndexChanged
        AddHandler _view.cmbCourse.SelectedIndexChanged, AddressOf cmbCourse_SelectedIndexChanged
        AddHandler _view.cmbBatch.SelectedIndexChanged, AddressOf cmbBatch_SelectedIndexChanged
        AddHandler _view.cmbSubjectName.SelectedIndexChanged, AddressOf cmbSubjectName_SelectedIndexChanged
        AddHandler _view.cmbInstructor.SelectedIndexChanged, AddressOf cmbInstructor_SelectedIndexChanged
        AddHandler _view.cmbSemester.SelectedIndexChanged, AddressOf cmbSemester_SelectedIndexChanged

        AddHandler _view.txtOrder.KeyPress, AddressOf txtOrder_KeyPress
        AddHandler _view.txtNoStudent.KeyPress, AddressOf txtNoStudent_KeyPress
        AddHandler _view.txtSection.TextChanged, AddressOf CheckExisting
        AddHandler _view.txtSection.KeyDown, AddressOf KeyDown

        AddHandler _view.btnAdd.Click, AddressOf btnAdd_Click
        AddHandler _view.btnEdit.Click, AddressOf btnEdit_Click
        AddHandler _view.btnDelete.Click, AddressOf btnDelete_Click

        AddHandler _view.rdbCollege.Click, AddressOf studentCategory
        AddHandler _view.rdbElementary.Click, AddressOf studentCategory
        AddHandler _view.rdbJuniorHigh.Click, AddressOf studentCategory
        AddHandler _view.rdbSeniorHigh.Click, AddressOf studentCategory

        AddHandler _view.gvSectionSetup.DoubleClick, AddressOf DoubleClickRow
        AddHandler _view.gvSectionSetup.RowCellClick, AddressOf RowCellClick
        AddHandler _view.gvSectionSetup.RowCellStyle, AddressOf RowCellStyle

        AddHandler _view.gvSectionSetup.MouseDown, AddressOf MouseDown
        AddHandler _view.gvSectionList.RowCellClick, AddressOf FindId

        AddHandler _view.ContextMenuStrip1.Opening, AddressOf menu_Opening
        AddHandler _view.ContextMenuStrip1.ItemClicked, AddressOf menu_ItemClicked

        AddHandler _view.TabItem13.MouseDown, AddressOf clickTab13
        AddHandler _view.TabItem14.MouseDown, AddressOf clickTab14
    End Sub

    Private Sub clickTab14(sender As Object, e As MouseEventArgs)

        loadSectionDetails(section_details, GroupColumn, GroupValue)

    End Sub

    Private Sub clickTab13(sender As Object, e As MouseEventArgs)

        loadList()

    End Sub

    Dim rowHandle As Integer
    Private Sub FindId(sender As Object, e As MouseEventArgs)

        Dim view As GridView = DirectCast(sender, GridView)
        id = view.GetFocusedRowCellValue("id")
        rowHandle = view.FocusedRowHandle

    End Sub

    Dim GroupLevel As Integer
    Dim GroupColumn As String = ""
    Dim GroupValue As String = ""
    Private Sub MouseDown(sender As Object, e As MouseEventArgs)
        ' Wir brauchen nur einen Doppelklick  

        menu.Items.Clear()
        _view.ContextMenuStrip1.Items.Clear()

        If e.Button <> MouseButtons.Left Or e.Clicks < 2 Then
            '         Exit Sub
        End If

        Dim view As GridView = sender

        Dim hi As GridHitInfo = view.CalcHitInfo(e.Location)

        ' wenn in eine Group Row Doppelt geklickt wurde..  
        If hi.InGroupRow Then

            DXMouseEventArgs.GetMouseArgs(e).Handled = True

            GroupLevel = hi.RowInfo.Level
            If GroupLevel = 2 Then
                GroupColumn = "Name_Empl"
                GroupValue = view.GetGroupRowValue(hi.RowInfo.RowHandle)
                loadSectionDetails(section_details, GroupColumn, GroupValue)
            End If

        End If



    End Sub

    Private Sub loadSectionDetails(dt As DataTable, groupColumn As String, groupValue As String)
        Dim result = dt.Clone()

        For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1(groupColumn) = (groupValue))
            result.ImportRow(row)
            _view.txtSubject.Text = row.Item("name").ToString
            If groupColumn = "id2" Then
                _view.txtInstructor.Text = row.Item("Name_Empl").ToString
            Else
                _view.txtInstructor.Text = groupValue
            End If
        Next


        SectionAvailable = model.getSectionAvailability(_view.txtSubject.Text, _view.txtInstructor.Text, _view.cmbYear.Text)
        '      CreatContexMenu()

        _view.gcSectionList.DataSource = result


    End Sub

    Dim Existt As Boolean = False

    Private Sub CheckItem(sender As Object, e As EventArgs)
        Dim menuItem = DirectCast(sender, ToolStripMenuItem)
        Dim data = menuItem.Tag


    End Sub



    Private Sub RowCellStyle(sender As Object, e As RowCellStyleEventArgs)

        Dim view As GridView = TryCast(sender, GridView)

        Dim total = view.GetRowCellValue(e.RowHandle, view.Columns("number_students"))
        Dim heads = view.GetRowCellValue(e.RowHandle, view.Columns("TOTAL"))

        If total = heads Then
            If e.Column.FieldName = "TOTAL" Then
                e.Appearance.ForeColor = Color.Red
            End If

        End If

    End Sub

    Private Sub KeyDown(sender As Object, e As KeyEventArgs)
        TextChange = True
    End Sub

    Dim id As String = ""
    Dim SectionName As String = ""
    Dim SectionAvailable As DataTable

    Private Sub RowCellClick(sender As Object, e As RowCellClickEventArgs)

        menu.Items.Clear()
        _view.ContextMenuStrip1.Items.Clear()


        Dim view As GridView = DirectCast(sender, GridView)
        Dim ChildName As String = view.ChildGridLevelName


        Try
            TextChange = False
            id = view.GetFocusedRowCellValue("id").ToString
            SectionName = view.GetFocusedRowCellValue("section_name").ToString
            _batchID = view.GetFocusedRowCellValue("batch_id").ToString
            BatchId = view.GetFocusedRowCellValue("batch_id").ToString
            SchoolYear = view.GetFocusedRowCellValue("school_year").ToString
            SubjectID = view.GetFocusedRowCellValue("subject_id").ToString
            _view.cmbSubjectName.Text = view.GetFocusedRowCellValue("name").ToString
            InstructorID = view.GetFocusedRowCellValue("instructor_id").ToString
            _view.cmbInstructor.Text = view.GetFocusedRowCellValue("employee_name").ToString

            SectionAvailable = model.getSectionAvailability(_view.cmbSubjectName.Text, _view.cmbInstructor.Text, _view.cmbYear.Text)


            Dim dt As New DataTable
            dt = model.getBatchDetails(view.GetFocusedRowCellValue("batch_id").ToString)


            _courseID = dt(0)("course_id").ToString
            _semester = dt(0)("semester").ToString

            _view.cmbCourse.SelectedValue = _courseID
            _view.cmbBatch.SelectedValue = _batchID
            _view.cmbBatch.Text = dt(0)("name").ToString
            _view.cmbSemester.Text = dt(0)("semester").ToString

            catID = model.getListCategory(_batchID)
            Select Case catID
                Case 13
                    _view.rdbCollege.Checked = True
                Case 14
                    _view.rdbElementary.Checked = True
                Case 15
                    _view.rdbJuniorHigh.Checked = True
                Case Else
                    _view.rdbSeniorHigh.Checked = True
            End Select

            _view.txtOrder.Text = view.GetFocusedRowCellValue("inorder").ToString
            _view.txtNoStudent.Text = view.GetFocusedRowCellValue("number_students").ToString
            _view.txtSection.Text = view.GetFocusedRowCellValue("section_name").ToString
        Catch ex As Exception

        End Try

        If view.RowCount > 0 Then
            If view.GetRowCellValue(e.RowHandle, view.Columns("TOTAL")) <> 0 Then

                Dim dt_section As New DataTable
                dt_section = model.getSection(id)

                For Each row As DataRow In dt_section.Rows

                    Dim obj As New Sectioning
                    With obj
                        .sectioning_detail_id = row.Item("id").ToString
                        .studentID = row.Item("std_number").ToString
                        .LastName = row.Item("last_name").ToString
                        .FirstName = row.Item("first_name").ToString
                        .MiddleName = row.Item("middle_name").ToString
                        .YearLevel = row.Item("year_level").ToString
                    End With

                    section.Add(obj)
                Next

                PrintPreview(view)

                section.Clear()

                loadSectionDetails(section_details, "id2", id)


            Else
                _view.DocumentViewer1.DocumentSource = ""
            End If
        End If


    End Sub

    Private Sub PrintPreview(view As GridView)

        Cursor.Current = Cursors.WaitCursor

        Dim report As New xtrSectioning

        report.section.Text = _view.cmbSubjectName.Text & " - SECTION " & SectionName
        report.dept.Text = _view.cmbCourse.Text
        report.batch.Text = _view.cmbBatch.Text
        report.instructor.Text = _view.cmbInstructor.Text
        report.DataSource = section
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()

        _view.DocumentViewer1.DocumentSource = report

        Cursor.Current = Cursors.Default
    End Sub

    Dim TextChange As Boolean = False
    Private Sub CheckExisting(sender As Object, e As EventArgs)

        If TextChange = True Then
            If model.checkIfExisting(_view.cmbSubjectName.SelectedValue, _view.cmbInstructor.SelectedValue, _view.txtSection.Text) Then
                MessageBox.Show("Section " & _view.txtSection.Text & "  is already EXIST...!" & vbCrLf & "in " & _view.cmbSubjectName.Text, "ALREADY EXIST", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                Exit Sub
            End If
        End If

    End Sub

    Private Sub DoubleClickRow(sender As Object, e As EventArgs)

        _view.btnEdit.Enabled = True

    End Sub

    Private Sub studentCategory(sender As Object, e As EventArgs)

        Dim rdbtn As RadioButton = DirectCast(sender, RadioButton)
        catID = rdbtn.Tag

    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnEdit_Click(sender As Object, e As EventArgs)


        If _view.txtSection.Text = "" Then
            MsgBox("Required Fields...")
            Exit Sub
        End If

        If _view.txtNoStudent.Text = "" Then
            MsgBox("Required Fields...")
            Exit Sub
        End If

        Try

            If MessageBox.Show("Are you sure you want to EDIT this record?", "PLEASE VERIFY....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
                Dim Current_NoOfStudent As Integer = model.getCurrentNoOfStudents(id)

                Dim Availability_Status As Boolean = False
                If Current_NoOfStudent = _view.txtNoStudent.Text Then
                    Availability_Status = False
                Else
                    Availability_Status = True
                End If
                model.Update(SchoolYear, SubjectID, InstructorID, _view.txtOrder.Text, _view.txtSection.Text, _view.txtNoStudent.Text, BatchId, catID, Availability_Status, id)
                MessageBox.Show("Section has been UPDATED...!!!", "UPDATE", MessageBoxButtons.OK, MessageBoxIcon.Information)
                loadList()
            End If

        Catch ex As Exception

        End Try

    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs)

        If _view.txtSection.Text = "" Then
            MsgBox("Required Fields...")
            Exit Sub
        End If

        If _view.txtNoStudent.Text = "" Then
            MsgBox("Required Fields...")
            Exit Sub
        End If

        Try

            If MessageBox.Show("Are you sure you want to ADD this record?", "PLEASE VERIFY....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
                model.Insert(SchoolYear, SubjectID, InstructorID, _view.txtOrder.Text, _view.txtSection.Text, _view.txtNoStudent.Text, BatchId, catID)
                MessageBox.Show("Section has been ADDED...!!!", "SAVED", MessageBoxButtons.OK, MessageBoxIcon.Information)
                loadList()
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Sub txtNoStudent_KeyPress(sender As Object, e As KeyPressEventArgs)
        If Asc(e.KeyChar) <> 8 Then
            If Asc(e.KeyChar) < 48 Or Asc(e.KeyChar) > 57 Then
                e.Handled = True
            End If
        End If
    End Sub

    Private Sub txtOrder_KeyPress(sender As Object, e As KeyPressEventArgs)
        If Asc(e.KeyChar) <> 8 Then
            If Asc(e.KeyChar) < 48 Or Asc(e.KeyChar) > 57 Then
                e.Handled = True
            End If
        End If
    End Sub

    Dim Semester As String = ""
    Private Sub cmbSemester_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbSemester.SelectedItem, DataRowView)
            Semester = drv.Item("name").ToString
            _semester = drv.Item("name").ToString
            loadBatch()
            '       loadList()
        Catch ex As Exception
            _view.cmbSemester.Text = ""
        End Try
    End Sub

    Dim InstructorID As String = ""
    Private Sub cmbInstructor_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbInstructor.SelectedItem, DataRowView)
            InstructorID = drv.Item("id").ToString
            '      loadList()
        Catch ex As Exception
            _view.cmbInstructor.Text = ""
        End Try
    End Sub

    Dim SubjectID As String = ""
    Dim SubjectCode As String = ""
    Private Sub cmbSubjectName_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbSubjectName.SelectedItem, DataRowView)
            SubjectID = drv.Item("id").ToString
            SubjectCode = drv.Item("code").ToString
            loadInstructor()
            loadList()
        Catch ex As Exception
            '           _view.cmbSubjectName.Text = ""
        End Try
    End Sub

    Dim BatchId As String = ""
    Private Sub cmbBatch_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbBatch.SelectedItem, DataRowView)
            BatchId = drv.Item("id").ToString
            _batchID = drv.Item("id").ToString
            loadSubject()
            '       loadList()
        Catch ex As Exception
            _view.cmbBatch.Text = ""
        End Try
    End Sub

    Dim CourseID As String = ""
    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCourse.SelectedItem, DataRowView)
            CourseID = drv.Item("id").ToString
            _courseID = drv.Item("id").ToString
            loadSemester()
            '       loadList()
        Catch ex As Exception
            _view.cmbCourse.Text = ""
        End Try
    End Sub

    Dim SchoolYear As String = ""
    Private Sub cmbYear_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbYear.SelectedItem, DataRowView)
            SchoolYear = drv.Item("name").ToString
            _batchyear = drv.Item("name").ToString
            loadList()
        Catch ex As Exception
            '        _view.cmbYear.Text = ""
        End Try
    End Sub

    Dim catID As String = ""
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCategory.SelectedItem, DataRowView)
            catID = drv.Item("id").ToString
            _student_category_id = drv.Item("id").ToString
            loadCourse()
        Catch ex As Exception
            _view.cmbCategory.Text = ""
        End Try
    End Sub

    Private Sub loadCombobox()
        '  loadCategory()
        loadSchoolYear()
        loadCourse()
        loadSemester()
        loadBatch()
        loadSubject()
        loadInstructor()
    End Sub

    Private Sub loadSemester()

        _view.cmbSemester.DataSource = model.getSemester
        _view.cmbSemester.ValueMember = "id"
        _view.cmbSemester.DisplayMember = "name"
        _view.cmbSemester.SelectedIndex = 0
        '     _view.cmbSemester.Text = ""

    End Sub

    Private Sub loadInstructor()

        _view.cmbInstructor.DataSource = model.getInstructor(SubjectID)
        _view.cmbInstructor.ValueMember = "id"
        _view.cmbInstructor.DisplayMember = "name"
        '      _view.cmbInstructor.SelectedIndex = -1
        '     _view.cmbInstructor.Text = ""

    End Sub

    Private Sub loadSubject()

        _view.cmbSubjectName.DataSource = model.getSubject
        _view.cmbSubjectName.ValueMember = "id"
        _view.cmbSubjectName.DisplayMember = "name"
        '    _view.cmbSubjectName.SelectedIndex = -1
        '    _view.cmbSubjectName.Text = ""

    End Sub

    Private Sub loadBatch()

        _view.cmbBatch.DataSource = model.getBatch
        _view.cmbBatch.ValueMember = "id"
        _view.cmbBatch.DisplayMember = "name"
        _view.cmbBatch.SelectedIndex = 0
        '   _view.cmbBatch.Text = ""

    End Sub

    Private Sub loadCourse()

        _view.cmbCourse.DataSource = model.getCourse
        _view.cmbCourse.ValueMember = "id"
        _view.cmbCourse.DisplayMember = "name"
        _view.cmbCourse.SelectedIndex = 0
        '     _view.cmbCourse.Text = ""

    End Sub


    Private Sub loadSchoolYear()

        _view.cmbYear.DataSource = model.getSchoolYear
        _view.cmbYear.ValueMember = "id"
        _view.cmbYear.DisplayMember = "name"
        _view.cmbYear.SelectedIndex = 0
        '   _view.cmbYear.Text = ""

    End Sub

    Private Sub loadCategory()

        _view.cmbCategory.DataSource = model.getCategory
        _view.cmbCategory.ValueMember = "id"
        _view.cmbCategory.DisplayMember = "name"
        _view.cmbCategory.SelectedIndex = 0
        '    _view.cmbCategory.Text = ""

    End Sub

    Private Class ContextMenuStripEx
    End Class
End Class
