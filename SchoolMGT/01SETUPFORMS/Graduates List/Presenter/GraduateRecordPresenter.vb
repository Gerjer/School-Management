Imports DevExpress.XtraEditors.Repository
Imports DevExpress.XtraGrid.Views.Grid
Imports SchoolMGT

Public Class GraduateRecordPresenter
    Private _view As frmGraduateRecord
    Dim RecordModel As New GraduateRecordModel
    Public Sub New(frmGraduateRecord As frmGraduateRecord)
        _view = frmGraduateRecord

        loadComboBox()
        loadHandler()
    End Sub

    Private Sub loadHandler()
        AddHandler _view.btnLoad.Click, AddressOf btnLoad_Click
        AddHandler _view.btnSave.Click, AddressOf btnAdd_Click
        '    AddHandler _view.btnRemove.Click, AddressOf btnRemove_Click
        AddHandler _view.cmbCourse.SelectedIndexChanged, AddressOf cmbCourse_SelectedIndexChanged

    End Sub

    Dim Category As String = ""
    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCourse.SelectedItem, DataRowView)
            Category = drv.Item("category_name").ToString
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnRemove_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs)
        Dim dt As New DataTable
        '      dt = _view.gcStudentList.DataSource
        If dt.Rows.Count > 0 Then
            For Each row As DataRow In dt.Rows

            Next


        End If


    End Sub

    Private Sub btnLoad_Click(sender As Object, e As EventArgs)
        Dim WHERE As String = ""
        If Category = "COLLEGE" Then
            WHERE = "WHERE
                        students.course_id = '" & _view.cmbCourse.SelectedValue & "' AND
                        students.academice_year = '" & _view.cmbAcademicYear.Text & "' AND
                        students.semester = '" & _view.cmbSemester.Text & "'
                       "
        Else
            WHERE = "WHERE
                        students.course_id = '" & _view.cmbCourse.SelectedValue & "' AND
                        students.academice_year = '" & _view.cmbAcademicYear.Text & "' AND
                        "
        End If

        Dim dt As New DataTable
        dt = RecordModel.getStudentList(WHERE)
        If dt.Rows.Count > 0 Then
            _view.gcStudentList.DataSource = dt
            _view.GridControl1.DataSource = dt
            DesignList(_view.gvStudentList)
        End If

        '  _view.Panel5.Visible = True
        _view.btnSave.Visible = True

    End Sub

    Private Sub DesignList(gvStudentList As GridView)
        Dim view As GridView = DirectCast(gvStudentList, GridView)
        view.BeginUpdate()
        view.OptionsView.ColumnAutoWidth = False

        Dim edit As RepositoryItemCheckEdit = New RepositoryItemCheckEdit()
        Dim trueValue As Int64 = 1
        Dim falseValue As Int64 = 0
        edit.ValueChecked = trueValue
        edit.ValueUnchecked = falseValue
        view.Columns("INCLUDE").ColumnEdit = edit
        _view.gcStudentList.RepositoryItems.Add(edit)

        For i As Integer = 0 To view.Columns.Count - 1
            Select Case i
                Case 0
                    view.Columns(i).Caption = "INCLUDE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).BestFit()
                  '  view.Columns(i).Visible = False
                Case 1
                    view.Columns(i).Caption = "STUDENT NO."
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 2
                    view.Columns(i).Caption = "LAST NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 3
                    view.Columns(i).Caption = "FIRST NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 4
                    view.Columns(i).Caption = "MIDDLE NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 5
                    view.Columns(i).Caption = "GENDER"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 6
                    view.Columns(i).Caption = "HOME ADDRESS"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 7
                    view.Columns(i).Caption = "PROGRAM | MAJOR | ACCREDITATION"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    view.Columns(i).OptionsColumn.AllowEdit = False
                Case 8
                    view.Columns(i).Caption = "RECOGNITION NO./AUTHORITY NO."
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                Case 9
                    view.Columns(i).Caption = "YEAR GRADUATE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                Case 10
                    view.Columns(i).Caption = "DATE GRADUATION"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                Case Else
                    view.Columns(i).Visible = False
            End Select
        Next


        'For i As Integer = 0 To view.Columns.Count - 1
        '    Select Case i
        '        Case 0, 1
        '            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).BestFit()
        '        Case 2, 3, 4
        '            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
        '            view.Columns(i).BestFit()
        '            view.Columns(i).OptionsColumn.AllowEdit = False
        '        Case 5
        '            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).BestFit()
        '            view.Columns(i).OptionsColumn.AllowEdit = False
        '        Case 6, 7
        '            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
        '            view.Columns(i).BestFit()
        '            view.Columns(i).OptionsColumn.AllowEdit = False
        '        Case 8, 9, 10
        '            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        '            view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
        '            view.Columns(i).BestFit()
        '            view.Columns(i).OptionsColumn.AllowEdit = True
        '        Case Else
        '            view.Columns(i).Visible = False
        '    End Select
        'Next
        view.EndUpdate()

    End Sub

    Private Sub loadComboBox()

        _view.cmbCourse.DataSource = RecordModel.getCourse
        _view.cmbCourse.ValueMember = "id"
        _view.cmbCourse.DisplayMember = "name"
        _view.cmbCourse.SelectedIndex = -1

        _view.cmbAcademicYear.DataSource = RecordModel.getAcademicYear
        _view.cmbAcademicYear.ValueMember = "id"
        _view.cmbAcademicYear.DisplayMember = "name"
        _view.cmbAcademicYear.SelectedIndex = -1

    End Sub
End Class
