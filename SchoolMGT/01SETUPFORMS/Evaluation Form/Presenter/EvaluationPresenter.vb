Imports DevExpress.XtraReports.UI
Imports SchoolMGT

Public Class EvaluationPresenter
    Private _view As frmEvaluationForm
    Dim ListModel As New EvaluationModel
    Public Sub New(view As frmEvaluationForm)
        _view = view
        loadComboBox()
        loadHandler()
        _view.cmbStudentName.Focus()

    End Sub

    Private Sub loadHandler()
        AddHandler _view.btnSearch.Click, AddressOf btnSearchClick
        AddHandler _view.btnPrint.Click, AddressOf btnPrintClick
        AddHandler _view.cmbStudentName.Enter, AddressOf EnterName
        AddHandler _view.cmbStudentName.SelectedIndexChanged, AddressOf cmbStudentName_SelectedIndexChanged
    End Sub

    Private Sub cmbStudentName_SelectedIndexChanged(sender As Object, e As EventArgs)
        LoadRecord(_view.cmbStudentName.SelectedValue)
    End Sub

    Private Sub EnterName(sender As Object, e As EventArgs)
        LoadRecord(_view.cmbStudentName.SelectedValue)
    End Sub

    Private Sub LoadRecord(PersonID As Object)

        Dim dt As New DataTable
        dt = ListModel.getStudentDetails(PersonID)
        If dt.Rows.Count > 0 Then

            Try
                _view.txtcourse.Text = If(IsDBNull(dt(0)("CourseName")), "", dt(0)("CourseName"))
                _view.txtSex.Text = If(IsDBNull(dt(0)("gender")), "", dt(0)("gender"))
                _view.txtCivilStatus.Text = If(IsDBNull(dt(0)("marital_status")), "", dt(0)("marital_status"))
                _view.txtPlaceBirth.Text = If(IsDBNull(dt(0)("birth_place")), "", dt(0)("birth_place"))
                _view.txtParents.Text = If(IsDBNull(dt(0)("contact_person")), "", dt(0)("contact_person"))
                _view.txtAddress.Text = If(IsDBNull(dt(0)("address")), "", dt(0)("address"))
                _view.txtDateBirth.Text = If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth"))
                _view.txtIntermediate.Text = If(IsDBNull(dt(0)("Elementary")), "", dt(0)("Elementary"))
                _view.txtSecondary.Text = If(IsDBNull(dt(0)("HighSchool")), "", dt(0)("HighSchool"))

            Catch ex As Exception

            End Try


            LoadCurriculum(PersonID)

            '  Else
            '     MsgBox("Record Not Found!!", MessageBoxIcon.Information)
        End If


    End Sub

    Private Sub LoadCurriculum(personID As Object)

        Try

            Dim dt As New DataTable
            dt = ListModel.getCurriculum(personID)
            _view.GridControl1.DataSource = dt

        Catch ex As Exception

        End Try

    End Sub

    Dim Evaluation As New List(Of Evaluation)

    Private Sub btnPrintClick(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Dim report As New xtrEvaluationFormFinal

        report.Title.Text = "ACADEMIC EVALUATION FORM FOR " & _view.txtcourse.Text & " STUDENTS"
        report.StudentName.Text = _view.cmbStudentName.Text
        report.Course.Text = _view.txtcourse.Text
        report.Gender.Text = _view.txtSex.Text
        report.CivilStatus.Text = _view.txtCivilStatus.Text
        report.DateOfBirth.Text = _view.txtDateBirth.Text
        report.PlaceOfBirth.Text = _view.txtPlaceBirth.Text
        report.Guardian.Text = _view.txtParents.Text
        report.Address.Text = _view.txtAddress.Text
        report.Intermediate.Text = _view.txtIntermediate.Text
        report.Secondary.Text = _view.txtSecondary.Text
        report.Technical.Text = _view.txtTechnical.Text

        Dim dt As DataTable = _view.GridControl1.DataSource

        For Each row As DataRow In dt.Rows
            Dim obj As New Evaluation
            With obj
                .HeaderTitle = row.Item("Title").ToString
                .Courses = row.Item("Courses").ToString
                .Grades = row.Item("Grade").ToString
                .Units = row.Item("No.OfUnits").ToString
                .Reqeust = row.Item("Pre/CoRequest").ToString
                .Instructor = row.Item("employee_name").ToString
            End With
            Evaluation.Add(obj)
        Next

        report.Report.DataSource = Evaluation
        report.CreateDocument()
        report.ShowPreview

        Evaluation.Clear()

        Cursor.Current = Cursors.Default

    End Sub

    Private Sub btnSearchClick(sender As Object, e As EventArgs)
        '   Throw New NotImplementedException()
    End Sub

    Private Sub loadComboBox()
        _view.cmbStudentName.DataSource = ListModel.getStudentRecord()
        _view.cmbStudentName.ValueMember = "id"
        _view.cmbStudentName.DisplayMember = "name"
        _view.cmbStudentName.SelectedIndex = -1
    End Sub
End Class
