Imports DevExpress.XtraGrid.Views.Grid
Imports SchoolMGT

Public Class GraduatesListPresenter
    Private _view As frmGraduatesList
    Dim ListModel As New GraduateListModel
    Public Sub New(frmGraduatesList As frmGraduatesList)
        _view = frmGraduatesList
        loadComboBox()
        loadHandler()

    End Sub

    Private Sub loadHandler()

        AddHandler _view.cmbAcademicYear.SelectedIndexChanged, AddressOf cmbAcademicYear_SelectedIndexChanged
        AddHandler _view.cmbSemester.SelectedIndexChanged, AddressOf cmbSemester_SelectedIndexChanged

        AddHandler _view.btnAdd.Click, AddressOf btnAdd_Click
        AddHandler _view.btnGenerate.Click, AddressOf btnGenerate_Click
        AddHandler _view.btnSearch.Click, AddressOf btnSearch_Click

    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs)
        _view.gvGraduatesList.Columns.Clear()
        _view.gcGraduatesList.DataSource = ListModel.getList(_view.cmbAcademicYear.Text, _view.cmbSemester.Text, _view.cmbCourse.SelectedValue)
        DesignGridView(_view.gvGraduatesList)

    End Sub

    Private Sub DesignGridView(gvGraduatesList As GridView)

        Dim view As GridView = DirectCast(gvGraduatesList, GridView)

        view.BeginUpdate()

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 0, 1, 12, 13, 14
                    view.Columns(i).Visible = False
                Case 2
                    view.Columns(i).Caption = "ID NUMBER"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    '      View.Columns(i).Width = 80
                    view.Columns(i).BestFit()
                Case 3
                    view.Columns(i).Caption = "LAST NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
           '         View.Columns(i).Width = 100
                Case 4
                    view.Columns(i).Caption = "FIRST NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
        '            View.Columns(i).Width = 100
                Case 5
                    view.Columns(i).Caption = "MIDDLE NAME"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
         '           View.Columns(i).Width = 100
                Case 6
                    view.Columns(i).Caption = "GENDER"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 80
                Case 7
                    view.Columns(i).Caption = "ADDRESS"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
        '            View.Columns(i).Width = 50
                Case 8
                    view.Columns(i).Caption = "PROGRAM NAME|MAJOR|ACCREDITATION"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
         '           View.Columns(i).Width = 250
                Case 9
                    view.Columns(i).Caption = "RECOGNITON NO."
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).BestFit()
        '            View.Columns(i).Width = 70
                Case 10
                    view.Columns(i).Caption = "YEAR GRADUATE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
        '            View.Columns(i).Width = 80
                Case 11
                    view.Columns(i).Caption = "GRADUATION DATE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).BestFit()
                    '           View.Columns(i).Width = 230
            End Select

        Next

        view.EndUpdate()

    End Sub

    Private Sub btnGenerate_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs)

        Try
            Dim frm As New frmGraduateRecord
            frm.BringToFront()
            frm.ShowDialog()

        Catch ex As Exception

        End Try

    End Sub

    Private Sub cmbSemester_SelectedIndexChanged(sender As Object, e As EventArgs)
        _view.cmbCourse.Enabled = True
    End Sub

    Private Sub cmbAcademicYear_SelectedIndexChanged(sender As Object, e As EventArgs)
        _view.cmbSemester.Enabled = True
    End Sub

    Private Sub loadComboBox()

        _view.cmbAcademicYear.DataSource = ListModel.getAcademicYear
        '    _view.cmbAcademicYear.ValueMember = "id"
        _view.cmbAcademicYear.DisplayMember = "name"
        _view.cmbAcademicYear.SelectedIndex = -1

        _view.cmbCourse.DataSource = ListModel.getCourse
        _view.cmbCourse.ValueMember = "id"
        _view.cmbCourse.DisplayMember = "name"
        _view.cmbCourse.SelectedIndex = -1



    End Sub
End Class
