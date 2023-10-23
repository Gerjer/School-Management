Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class ReportRatingLisPresenter
    Private _view As frmReportRating
    Dim ListModel As New ReportRatingListModel

    Public Sub New(view As frmReportRating)
        _view = view
        loadComboBox()
        loadHandler()
        displayYear()
        displayCourse()
    End Sub

    Private Sub displayCourse()

        _view.cmbCourse.DataSource = ListModel.getCourse(CatID)
        _view.cmbCourse.ValueMember = "id"
        _view.cmbCourse.DisplayMember = "name"
        _view.cmbCourse.SelectedIndex = -1

    End Sub

    Private Sub displayYear()

        _view.cmbYearLevel.DataSource = ListModel.getYear(CatID)
        _view.cmbYearLevel.ValueMember = "id"
        _view.cmbYearLevel.DisplayMember = "name"
        _view.cmbYearLevel.SelectedIndex = -1

    End Sub

    Private Sub loadHandler()
        AddHandler _view.cmbCategory.SelectedIndexChanged, AddressOf cmbCategory_SelectedIndexChanged
        AddHandler _view.cmbAcademicYear.SelectedIndexChanged, AddressOf cmbAcademicYear_SelectedIndexChanged
        AddHandler _view.cmbSemester.SelectedIndexChanged, AddressOf cmbSemester_SelectedIndexChanged
        AddHandler _view.cmbYearLevel.SelectedIndexChanged, AddressOf cmbYearLevel_SelectedIndexChanged
        AddHandler _view.cmbCourse.SelectedIndexChanged, AddressOf cmbCourse_SelectedIndexChanged
        AddHandler _view.btnSearch.Click, AddressOf btnSearch_click
        AddHandler _view.btnGenerate.Click, AddressOf btnGenerate_Click

    End Sub

    Dim course_description As String = ""
    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCourse.SelectedItem, DataRowView)
            course_description = drv.Item("description").ToString
        Catch ex As Exception

        End Try
    End Sub

    Dim CatID As String
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbCategory.SelectedItem, DataRowView)
            CatID = drv.Item("id").ToString
            displayYear()
            displayCourse()
            _view.cmbAcademicYear.Enabled = True
        Catch ex As Exception
            _view.cmbCategory.Text = ""
        End Try


    End Sub

    Private Sub btnGenerate_Click(sender As Object, e As EventArgs)

        Dim StudentName As String = ""
        Dim Average As Decimal = 0

        Dim dt As New DataTable
        dt = _view.gcRatingReport.DataSource

        Dim page As Integer = 1

        If dt.Rows.Count > 0 Then

            Dim main_report As New xtrMain_ReporRating


            For Each rows As DataRow In dt.Rows

                If rows("INCLUDE") = "True" Then

                    Dim master_report(page) As xtrMain_ReporRating
                    master_report(page) = New xtrMain_ReporRating


                    Dim dt_ReportRating As New DataTable
                    dt_ReportRating = ListModel.getReportRating(rows("id"))

                    Average = ListModel.gerAverage(rows("id"))
                    Average = FormatNumber(CDec(Average), 1, TriState.True, TriState.UseDefault)
                    Dim new_Average = ListModel.gerNewAverage(Average)

                    Dim final_Average As String = ""
                    final_Average = Average & " (" & new_Average & ")"

                    Dim ReportRatingList As New List(Of ReportRating)

                    For Each rowss As DataRow In dt_ReportRating.Rows

                        If StudentName = "" Then
                            StudentName = rowss("display_name").ToString
                        End If

                        Dim obj As New ReportRating
                        With obj
                            .subject = rowss("SubjCode")
                            .units = rowss("Units").ToString
                            .ratings = rowss("Rating").ToString
                        End With
                        ReportRatingList.Add(obj)
                    Next

                    Dim report As New xtrReportRating

                    report._student_name = StudentName
                    report._year = _view.cmbYearLevel.Text
                    report._semester = _view.cmbSemester.Text
                    report._academic_year = _view.cmbAcademicYear.Text
                    report._course = course_description  '_view.cmbCourse.Text
                    report.ddate.Text = Format(Date.Now.Date, "MMMM dd, yyyy")
                    report.average.Text = "Gen. Average : " & final_Average 'Average


                    report.DataSource = ReportRatingList
                    report.PrintingSystem.Document.AutoFitToPagesWidth = 1
                    '     report.CreateDocument()
                    '      report.ShowPreview
                    Dim Subreport As XRSubreport = TryCast(master_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
                    Subreport.ReportSource = report

                    master_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
                    master_report(page).CreateDocument()

                    main_report.Pages.AddRange(master_report(page).Pages)
                    main_report.PrintingSystem.ContinuousPageNumbering = True

                    page += 1

                    StudentName = ""
                    ReportRatingList.Clear()

                End If

            Next
            main_report.ShowPreview

        End If


    End Sub

    Private Sub btnSearch_click(sender As Object, e As EventArgs)
        Cursor.Current = Cursors.WaitCursor
        Try
            Dim dt As New DataTable
            dt = ListModel.getListStudent(_view.cmbAcademicYear.Text, _view.cmbSemester.Text, _view.cmbYearLevel.Text, _view.cmbCourse.SelectedValue)
            If dt.Rows.Count > 0 Then
                _view.gcRatingReport.DataSource = dt
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Cursor.Current = Cursors.Default
    End Sub

    Dim YearLevel As String = ""
    Private Sub cmbYearLevel_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbYearLevel.SelectedItem, DataRowView)
            YearLevel = drv.Item("name").ToString
            _view.cmbCourse.Enabled = True
        Catch ex As Exception
            _view.cmbYearLevel.Text = ""
            _view.cmbCourse.Enabled = False
        End Try


    End Sub

    Private Sub cmbSemester_SelectedIndexChanged(sender As Object, e As EventArgs)
        _view.cmbYearLevel.Enabled = True
    End Sub

    Private Sub cmbAcademicYear_SelectedIndexChanged(sender As Object, e As EventArgs)
        _view.cmbSemester.Enabled = True
    End Sub

    Private Sub loadComboBox()

        _view.cmbCategory.DataSource = ListModel.getCategory
        _view.cmbCategory.ValueMember = "id"
        _view.cmbCategory.DisplayMember = "name"
        _view.cmbCategory.SelectedIndex = -1

        _view.cmbAcademicYear.DataSource = ListModel.getAcademicYear
        _view.cmbAcademicYear.ValueMember = "id"
        _view.cmbAcademicYear.DisplayMember = "name"
        _view.cmbAcademicYear.SelectedIndex = -1



    End Sub
End Class
