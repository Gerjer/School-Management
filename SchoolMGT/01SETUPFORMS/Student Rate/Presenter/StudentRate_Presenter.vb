Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.Grid
Imports SchoolMGT

Public Class StudentRate_Presenter
    Private _view As frmStudentRate
    Dim ListModel As New StudentRate_Model
    Public Sub New(view As frmStudentRate)
        _view = view

        loadComboBox()
        loadHandler()

    End Sub

    Private Sub loadHandler()

        AddHandler _view.cmbCategory.SelectionChangeCommitted, AddressOf cmbCategory_SelectionChangeCommitted
        AddHandler _view.cmbCourseGrade.SelectionChangeCommitted, AddressOf cmbCourseGrade_SelectionChangeCommitted
        AddHandler _view.cmbAvademicYear.SelectionChangeCommitted, AddressOf cmbAvademicYear_SelectionChangeCommitted
        AddHandler _view.cmbBatchGroup.SelectionChangeCommitted, AddressOf cmbBatchGroup_SelectionChangeCommitted
        AddHandler _view.GridView1.CellValueChanged, AddressOf GridView1_CellValueChanged
        AddHandler _view.GridView1.RowCellStyle, AddressOf GridView1_RowCellStyle
        AddHandler _view.btnSearch.Click, AddressOf Search

    End Sub

    Private Sub Search(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor
        loadList()
        Cursor.Current = Cursors.Default
    End Sub

    Private Sub GridView1_RowCellStyle(sender As Object, e As RowCellStyleEventArgs)

        Dim view As GridView = TryCast(sender, GridView)

        If e.Column.FieldName = "NEW TUITION" Then
            Dim new_tuition = view.GetRowCellDisplayText(e.RowHandle, e.Column)
            Dim cellValue = e.CellValue.ToString()

            Dim tuition = view.GetRowCellValue(e.RowHandle, view.Columns("TUITION"))
            Dim rate = view.GetRowCellValue(e.RowHandle, view.Columns("RATE PER UNIT"))

            If rate <> 0 And tuition <> new_tuition Then
                e.Appearance.ForeColor = Color.Red
            ElseIf rate = 0 And tuition <> new_tuition Then
                e.Appearance.ForeColor = Color.Red
            End If
        End If
    End Sub

    Private Sub GridView1_CellValueChanged(sender As Object, e As CellValueChangedEventArgs)

        Try
            If e.Column.FieldName = "RATE PER UNIT" Then
                If e.Value IsNot Nothing Then

                    Dim view As GridView = DirectCast(sender, GridView)
                    Dim rate = e.Value

                    'Chek Record If exist Update,If not Insert
                    If IsDBNull(view.GetFocusedRowCellValue("id")) = False Then
                        'Update end time record
                        DataSource(String.Format("UPDATE student_rate SET end_time = '" & _current_time_stamp & "' WHERE id = '" & view.GetFocusedRowCellValue("id") & "'"))
                        DataSource(String.Format("INSERT INTO student_rate (person_id,student_id,batch_id,rate) VALUES('" & view.GetFocusedRowCellValue("person_id") & "','" & view.GetFocusedRowCellValue("std_id") & "','" & view.GetFocusedRowCellValue("batch_id") & "','" & rate & "')"))
                    Else
                        DataSource(String.Format("INSERT INTO student_rate (person_id,student_id,batch_id,rate) VALUES('" & view.GetFocusedRowCellValue("person_id") & "','" & view.GetFocusedRowCellValue("std_id") & "','" & view.GetFocusedRowCellValue("batch_id") & "','" & rate & "')"))
                    End If

                    view.SetRowCellValue(e.RowHandle, "INCLUDE", "True")

                End If


            End If

                  loadList()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try



    End Sub

    Private Function exist(studentID As Object, batchID As Object) As Boolean
        '    Dim id As Integer = DataObject(String.Format())

    End Function

    Private Sub cmbBatchGroup_SelectionChangeCommitted(sender As Object, e As EventArgs)

        Try
            '        loadList()
        Catch ex As Exception

        End Try

    End Sub

    Dim AcademicYear As String
    Private Sub cmbAvademicYear_SelectionChangeCommitted(sender As Object, e As EventArgs)


        Try
            _view.cmbCourseGrade.Enabled = True
            Dim drv As DataRowView = DirectCast(_view.cmbAvademicYear.SelectedItem, DataRowView)
            AcademicYear = drv.Item("name").ToString

            _view.cmbBatchGroup.DataSource = ListModel.getBatch(AcademicYear, _view.cmbCourseGrade.SelectedValue)
            _view.cmbBatchGroup.ValueMember = "id"
            _view.cmbBatchGroup.DisplayMember = "name"
            _view.cmbBatchGroup.SelectedIndex = -1

            '     loadList()

        Catch ex As Exception

        End Try

    End Sub

    Private Sub loadList()

        Dim dt As New DataTable
        dt = ListModel.getPersonList(AcademicYear, _view.cmbCourseGrade.SelectedValue, _view.cmbBatchGroup.SelectedValue)

        _view.GridControl1.DataSource = Nothing
        _view.GridView1.Columns.Clear()
        _view.GridControl1.DataSource = dt

        DesignGridView(_view.GridView1)

    End Sub

    Private Sub DesignGridView(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)
        view.BeginUpdate()

        If _view.cmbCourseGrade.SelectedIndex = -1 And _view.cmbBatchGroup.SelectedIndex = -1 Then

            For i As Integer = 0 To view.Columns.Count - 1

                Select Case i
                    Case 5, 9, 11
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = False
                    Case 10
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = True
                    Case 6, 7, 8
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = False
                    Case Else
                        view.Columns(i).Visible = False
                End Select

            Next

        ElseIf _view.cmbCourseGrade.SelectedIndex > -1 And _view.cmbBatchGroup.SelectedIndex = -1 Then
            For i As Integer = 0 To view.Columns.Count - 1

                Select Case i
                    Case 5, 8, 10
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = False
                    Case 9
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = True
                    Case 6, 7
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = False
                    Case Else
                        view.Columns(i).Visible = False
                End Select

            Next

        Else
            For i As Integer = 0 To view.Columns.Count - 1

                Select Case i
                    Case 5, 7, 9
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = False
                    Case 8
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = True
                    Case 6
                        view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                        view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                        view.Columns(i).BestFit()
                        view.Columns(i).OptionsColumn.AllowEdit = False
                    Case Else
                        view.Columns(i).Visible = False
                End Select

            Next
        End If
        view.EndUpdate()
        '      view.OptionsView.ColumnAutoWidth = False

    End Sub

    Private Sub cmbCourseGrade_SelectionChangeCommitted(sender As Object, e As EventArgs)

        Try
            _view.cmbBatchGroup.Enabled = True
            _view.cmbBatchGroup.DataSource = ListModel.getBatch(_view.cmbAvademicYear.Text, _view.cmbCourseGrade.SelectedValue)
            _view.cmbBatchGroup.ValueMember = "id"
            _view.cmbBatchGroup.DisplayMember = "name"
            _view.cmbBatchGroup.SelectedIndex = -1

            '         loadList()

        Catch ex As Exception

        End Try

    End Sub

    'Private Sub DesigGridView(gridView1 As GridView)

    '    For i As Integer = 0 To gridView1.Columns.Count - 1

    '        Select Case i
    '       '     Case 0
    '       '         gridView1.Columns(i).AppearanceHeader.TextOptions.HAlignment = HorizontalAlignment.Center
    '       '         gridView1.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
    '       ''         gridView1.Columns(i).Width = 100
    '            Case 2, 3, 4
    '                gridView1.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
    '                gridView1.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
    '   '             gridView1.Columns(i).Width = 150

    '            Case 5
    '                gridView1.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
    '                gridView1.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
    '                '           gridView1.Columns(i).Width = 200

    '            Case Else
    '                gridView1.Columns(i).Visible = False
    '        End Select


    '    Next


    'End Sub

    Private Sub cmbCategory_SelectionChangeCommitted(sender As Object, e As EventArgs)

        _view.cmbAvademicYear.Enabled = True

        _student_category_id = _view.cmbCategory.SelectedValue
        _view.cmbCourseGrade.DataSource = ListModel.getCourseGrade(_view.cmbCategory.SelectedValue)
        _view.cmbCourseGrade.ValueMember = "id"
        _view.cmbCourseGrade.DisplayMember = "name"
        _view.cmbCourseGrade.SelectedIndex = -1


        _view.cmbAvademicYear.DataSource = ListModel.getAcademicYear()
        _view.cmbAvademicYear.ValueMember = "id"
        _view.cmbAvademicYear.DisplayMember = "name"
        _view.cmbAvademicYear.SelectedIndex = -1

    End Sub

    Private Sub loadComboBox()

        _view.cmbCategory.DataSource = ListModel.getCategory()
        _view.cmbCategory.ValueMember = "id"
        _view.cmbCategory.DisplayMember = "name"
        _view.cmbCategory.SelectedIndex = -1

        _view.cmbAvademicYear.DataSource = ListModel.getAcademicYear()
        _view.cmbAvademicYear.ValueMember = "id"
        _view.cmbAvademicYear.DisplayMember = "name"
        _view.cmbAvademicYear.SelectedIndex = -1
    End Sub
End Class
