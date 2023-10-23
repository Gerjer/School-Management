Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class EnrollmentListPresenter
    Private _view As frmEnrollmentList
    Dim ListModel As New EnrollmentListModel

    Public Sub New(view As frmEnrollmentList)
        _view = view
        loadComboBox()
        loadHandler()

    End Sub

    Private Sub loadHandler()
        AddHandler _view.btnGenerate.Click, AddressOf btnGenerate_Click
        AddHandler _view.cmbAcademicYear.SelectedIndexChanged, AddressOf cmbAcademicYear_SelectedIndexChanged
        AddHandler _view.cmbSemester.SelectedIndexChanged, AddressOf cmbSemester_SelectedIndexChanged

        AddHandler _view.cmbCourse.SelectedIndexChanged, AddressOf cmbCourse_SelectedIndexChanged
        AddHandler _view.Load, AddressOf load
        AddHandler _view.cmbCategory.SelectionChangeCommitted, AddressOf cmbCategory_SelectionChangeCommitted
    End Sub

    Private Sub cmbCategory_SelectionChangeCommitted(sender As Object, e As EventArgs)

        Try
            _view.cmbCourse.Enabled = True

            _view.cmbCourse.DataSource = ListModel.getCourse(_view.cmbCategory.SelectedValue)
            _view.cmbCourse.ValueMember = "id"
            _view.cmbCourse.DisplayMember = "name"
            _view.cmbCourse.SelectedIndex = -1
        Catch ex As Exception

        End Try

    End Sub

    Private Sub load(sender As Object, e As EventArgs)
        ListModel.tag = _view.Tag
    End Sub

    Private Sub cmbSemester_SelectedIndexChanged(sender As Object, e As EventArgs)
        _view.cmbCategory.Enabled = True
    End Sub

    Dim CourseDescription As String = ""


    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        If _view.cmbCourse.SelectedIndex > -1 Then


            Try
                Dim drv As DataRowView = DirectCast(_view.cmbCourse.SelectedItem, DataRowView)
                CourseDescription = drv.Item("description").ToString
            Catch ex As Exception

            End Try


            Dim dt As New DataTable
            Dim dt_list As New DataTable
            Try
                dt = ListModel.getEnrollmentList(_view.cmbAcademicYear.Text, _view.cmbSemester.Text, _view.cmbCourse.SelectedValue)
                If dt.Rows.Count > 0 Then


                    dt_list = ListModel.getHeader()

                    Dim str_date As String = ""
                    Dim IdNumber As String = ""
                    Dim no As Integer
                    Dim str_no As String = ""
                    For Each rows As DataRow In dt.Rows

                        If IdNumber = "" Then
                            IdNumber = rows("IDnumber")
                            str_date = Format(CDate(rows("DateOfBirth")).Date, "MM/dd/yyyy")
                            no = 1
                            str_no = CStr(no)
                        ElseIf IdNumber = rows("IDnumber") Then
                            rows("IDnumber") = ""
                            rows("LastName") = ""
                            rows("FirstName") = ""
                            rows("MiddleName") = ""
                            str_date = ""
                            rows("Gender") = ""
                            rows("HomeAddress") = ""
                            rows("YearLevel") = ""
                            str_no = ""
                        Else
                            IdNumber = rows("IDnumber")
                            str_date = Format(CDate(rows("DateOfBirth")).Date, "MM/dd/yyyy")
                            no += 1
                            str_no = CStr(no)
                        End If
                        dt_list.Rows.Add(str_no, rows("IDnumber"), rows("LastName"), rows("FirstName"), rows("MiddleName"), str_date, rows("Gender"), rows("HomeAddress"), rows("YearLevel"), rows("CourseCode"), rows("CourseDescription"), rows("Grades"), rows("Units"))
                    Next

                    _view.gcEnrollmentList.DataSource = dt_list
                    Design(_view.gvEnrollmentList)

                Else
                    _view.gcEnrollmentList.DataSource = Nothing

                End If
            Catch ex As Exception

            End Try

        End If

        Cursor.Current = Cursors.Default
    End Sub

    Private Sub cmbAcademicYear_SelectedIndexChanged(sender As Object, e As EventArgs)
        _view.cmbSemester.Enabled = True
    End Sub


    Private Sub Design(gvEnrollmentList As GridView)

        Dim View As GridView = DirectCast(gvEnrollmentList, GridView)
        View.BeginUpdate()

        For i As Integer = 0 To View.Columns.Count - 1

            Select Case i
                Case 0
                    View.Columns(i).Caption = "NO."
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).BestFit()
                '    View.Columns(i).Width = 40
                Case 1
                    View.Columns(i).Caption = "ID NUMBER"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    '      View.Columns(i).Width = 80
                    View.Columns(i).BestFit()
                Case 2
                    View.Columns(i).Caption = "LAST NAME"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
           '         View.Columns(i).Width = 100
                Case 3
                    View.Columns(i).Caption = "FIRST NAME"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
        '            View.Columns(i).Width = 100
                Case 4
                    View.Columns(i).Caption = "MIDDLE NAME"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
         '           View.Columns(i).Width = 100
                Case 5
                    View.Columns(i).Caption = "BIRTH.DATE"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).Width = 80
                Case 6
                    View.Columns(i).Caption = "GENDER"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).BestFit()
        '            View.Columns(i).Width = 50
                Case 7
                    View.Columns(i).Caption = "HOME ADDRESS"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
         '           View.Columns(i).Width = 250
                Case 8
                    View.Columns(i).Caption = "YR.LEVEL"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).BestFit()
        '            View.Columns(i).Width = 70
                Case 9
                    View.Columns(i).Caption = "COURSE CODE"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
        '            View.Columns(i).Width = 80
                Case 10
                    View.Columns(i).Caption = "COURSE DESCRIPTION"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    View.Columns(i).BestFit()
         '           View.Columns(i).Width = 230
                Case 11
                    View.Columns(i).Caption = "GRADES"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).BestFit()
         '           View.Columns(i).Width = 60
                Case 12
                    View.Columns(i).Caption = "UNITS"
                    View.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    View.Columns(i).BestFit()
                    '            View.Columns(i).Width = 60
            End Select

        Next

        View.EndUpdate()

    End Sub

    Private Sub loadComboBox()

        _view.cmbAcademicYear.DataSource = ListModel.getAcademicYear
        _view.cmbAcademicYear.ValueMember = "id"
        _view.cmbAcademicYear.DisplayMember = "name"
        _view.cmbAcademicYear.SelectedIndex = -1

        _view.cmbCategory.DataSource = ListModel.getCateogry
        _view.cmbCategory.ValueMember = "id"
        _view.cmbCategory.DisplayMember = "name"
        _view.cmbCategory.SelectedIndex = -1
    End Sub

    Private Sub btnGenerate_Click(sender As Object, e As EventArgs)
        Cursor.Current = Cursors.WaitCursor
        Try

            Dim report As New xtrEnrollmentList

            If ListModel.tag = 1 Then
                report.SchoolName.Text = "Don Jose Ecleo Memorial Foudation College of Science and Technology"
                report.XrLabel1.Text = "ENROLLMENT LIST"
            Else
                report.SchoolName.Text = "Don Jose Ecleo Memorial Foudation College of Science and Technology"
                report.XrLabel1.Text = "PROMOTIONAL REPORT"
            End If

            report.course.Text = CourseDescription  '_view.cmbCourse.Text
            report.academic_year.Text = _view.cmbAcademicYear.Text
            report.semester.Text = _view.cmbSemester.Text
            report.PrintableComponentContainer1.PrintableComponent = _view.gcEnrollmentList
            report.PrintingSystem.Document.AutoFitToPagesWidth = 1
            report.CreateDocument()
            report.ShowPreview

        Catch ex As Exception

        End Try
        Cursor.Current = Cursors.Default
    End Sub
End Class
