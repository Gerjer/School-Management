Imports DevComponents.DotNetBar
Imports SchoolMGT

Public Class TESApplicationRecordPresenter
    Dim RecordModel As New TESApplicationRecordModel
    Private _view As frmTESApplicationEntry
    Public id As Integer
    Public Operation As String = ""
    Dim TES As New TESApplication

    Public scholar_id As String = ""
    Public scholar_name As String = ""
    Public academic_year As String = ""


    Public Sub New(view As frmTESApplicationEntry)
        _view = view

        _view.btnSave.Focus()
        loadComboBox()
        '    LoadYear()
        loadHandler()

    End Sub



    Public Sub AssigningControls()

        Dim dt As New DataTable
        dt = RecordModel.getScholarshipRecord(id)
        If dt.Rows.Count > 0 Then
            PERSON_ID = dt(0)("person_id").ToString
            _view.txtExtensionName.Text = If(IsDBNull(dt(0)("student_extension_name")), "", dt(0)("student_extension_name"))
            _view.txtScholarshipName.Text = If(IsDBNull(dt(0)("scholarship_any")), "", dt(0)("scholarship_any"))
            _view.txtUII.Text = If(IsDBNull(dt(0)("UII")), "", dt(0)("UII"))
            _view.txtLearnRefNo.Text = If(IsDBNull(dt(0)("learner_ref_no")), "", dt(0)("learner_ref_no"))
            _view.txtDisability.Text = If(IsDBNull(dt(0)("disability")), "", dt(0)("disability"))
            _view.txtDSWDNo.Text = If(IsDBNull(dt(0)("dswd_household_no")), "", dt(0)("dswd_household_no"))
            _view.nudIncome.Value = If(IsDBNull(dt(0)("income")), 0, dt(0)("income"))
            _view.nudTotalAssessment.Value = If(IsDBNull(dt(0)("total_assessment")), 0, dt(0)("total_assessment"))
            _view.txtFLastName.Text = If(IsDBNull(dt(0)("father_last_name")), "", dt(0)("father_last_name"))
            _view.txtFGivenName.Text = If(IsDBNull(dt(0)("father_first_name")), "", dt(0)("father_first_name"))
            _view.txtFMiddleName.Text = If(IsDBNull(dt(0)("father_middle_name")), "", dt(0)("father_middle_name"))
            _view.txtMLastName.Text = If(IsDBNull(dt(0)("mother_last_name")), "", dt(0)("mother_last_name"))
            _view.txtMGivenName.Text = If(IsDBNull(dt(0)("mother_first_name")), "", dt(0)("mother_first_name"))
            _view.txtMMiddleName.Text = If(IsDBNull(dt(0)("mother_middle_name")), "", dt(0)("mother_middle_name"))
            _view.txtSex.Text = dt(0)("gender").ToString
            _view.txtStudentID.Text = dt(0)("std_number").ToString
            _view.txtSeqNo.Text = dt(0)("class_roll_no").ToString
            _view.txtContactNo.Text = If(IsDBNull(dt(0)("telephone1")), "", dt(0)("telephone1"))
            _view.txtEmailAdd.Text = If(IsDBNull(dt(0)("email")), "", dt(0)("email"))
            _view.dtpBirthDate.Value = If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth"))
            _view.txtProgram.Text = dt(0)("course_name").ToString
            _view.txtYearLevel.Text = dt(0)("year_level").ToString
            _view.txtStreetBrgy.Text = If(IsDBNull(dt(0)("address")), "", dt(0)("address"))
            _view.txtMunicipalityCity.Text = If(IsDBNull(dt(0)("citymunicipality")), "", dt(0)("citymunicipality"))
            _view.txtProvince.Text = If(IsDBNull(dt(0)("province")), "", dt(0)("province"))
            _view.txtZipCode.Text = If(IsDBNull(dt(0)("zipcode")), "", dt(0)("zipcode"))
            _view.txtindigenous.Text = If(IsDBNull(dt(0)("from_year")), "", dt(0)("from_year"))
            _view.cmbStudent.Text = If(IsDBNull(dt(0)("display_name")), "", dt(0)("display_name"))
            _studentID = If(IsDBNull(dt(0)("student_id")), "", dt(0)("student_id"))                                '

            _view.GroupBox1.Enabled = True
        End If
        _view.btnSave.Text = "Modify"
        _view.btnSave.Focus()
    End Sub

    Public Sub loadComboBox()
        _view.cmbStudent.DataSource = RecordModel.getStudentList(academic_year, scholar_name)
        _view.cmbStudent.ValueMember = "ID"
        _view.cmbStudent.DisplayMember = "Name"
        _view.cmbStudent.SelectedIndex = -1
    End Sub

    Private Sub loadHandler()

        AddHandler _view.btnSave.Click, AddressOf SaveRecord
        AddHandler _view.cmbStudent.SelectionChangeCommitted, AddressOf DropDownLoad
        AddHandler _view.cmbStudent.KeyUp, AddressOf EnterSelect
    End Sub

    Private Sub EnterSelect(sender As Object, e As KeyEventArgs)

        If e.KeyCode = Keys.Enter Then
            Try
                _view.GroupBox1.Enabled = True
                Dim drv As DataRowView = DirectCast(_view.cmbStudent.SelectedItem, DataRowView)
                PERSON_ID = drv.Item("ID").ToString
                _view.txtSeqNo.Text = drv.Item("SeqNumber").ToString
                _view.txtStudentID.Text = drv.Item("std_number").ToString
                _view.txtSex.Text = drv.Item("gender").ToString
                _view.dtpBirthDate.Value = drv.Item("date_of_birth").ToString
                _view.txtProgram.Text = drv.Item("course_name").ToString
                _view.txtYearLevel.Text = drv.Item("year_level").ToString
                _view.txtStreetBrgy.Text = drv.Item("address").ToString
                _view.txtMunicipalityCity.Text = drv.Item("citymunicipality").ToString
                _view.txtProvince.Text = drv.Item("province").ToString
                _view.txtZipCode.Text = drv.Item("zipcode").ToString
                _view.txtContactNo.Text = drv.Item("telephone1").ToString
                _view.txtEmailAdd.Text = drv.Item("email").ToString
                _view.txtFLastName.Text = drv.Item("Father").ToString
                _view.txtMLastName.Text = drv.Item("Mother").ToString
                _studentID = drv.Item("stdID").ToString
                scholar_name = drv.Item("scholarshipgrant").ToString
                _view.txtYearLevel.Text = drv.Item("year_level").ToString
            Catch ex As Exception

            End Try

        End If
    End Sub

    Private Sub DropDownLoad(sender As Object, e As EventArgs)

        Try
            _view.GroupBox1.Enabled = True
            Dim drv As DataRowView = DirectCast(_view.cmbStudent.SelectedItem, DataRowView)
            PERSON_ID = drv.Item("ID").ToString
            _view.txtSeqNo.Text = drv.Item("SeqNumber").ToString
            _view.txtStudentID.Text = drv.Item("std_number").ToString
            _view.txtSex.Text = drv.Item("gender").ToString
            _view.dtpBirthDate.Value = drv.Item("date_of_birth").ToString
            _view.txtProgram.Text = drv.Item("course_name").ToString
            _view.txtYearLevel.Text = drv.Item("year_level").ToString
            _view.txtStreetBrgy.Text = drv.Item("address").ToString
            _view.txtMunicipalityCity.Text = drv.Item("citymunicipality").ToString
            _view.txtProvince.Text = drv.Item("province").ToString
            _view.txtZipCode.Text = drv.Item("zipcode").ToString
            _view.txtContactNo.Text = drv.Item("telephone1").ToString
            _view.txtEmailAdd.Text = drv.Item("email").ToString
            _view.txtFLastName.Text = drv.Item("Father").ToString
            _view.txtMLastName.Text = drv.Item("Mother").ToString
            _studentID = drv.Item("stdID").ToString
            scholar_name = drv.Item("scholarshipgrant").ToString
            _view.txtYearLevel.Text = drv.Item("year_level").ToString
        Catch ex As Exception

        End Try




    End Sub

    Private Sub SaveRecord(sender As Object, e As EventArgs)

        With TES
            .id = id
            .person_id = PERSON_ID
            .UII = _view.txtUII.Text
            .scholarship_any = scholar_name  '_view.txtScholarshipName.Text
            .extension_name = _view.txtExtensionName.Text
            .learner_ref_no = _view.txtLearnRefNo.Text
            .disability = _view.txtDisability.Text
            .dswd_household_no = _view.txtDSWDNo.Text
            .income = _view.nudIncome.Value
            .total_assessment = _view.nudTotalAssessment.Value
            .father_last_name = _view.txtFLastName.Text
            .father_first_name = _view.txtFGivenName.Text
            .father_middle_name = _view.txtFMiddleName.Text
            .mother_last_name = _view.txtMLastName.Text
            .mother_first_name = _view.txtMGivenName.Text
            .mother_middle_name = _view.txtMMiddleName.Text
            .indigenous = _view.txtindigenous.Text
            .student_id = _studentID
            .scholar_id = scholar_id
            .year_level = _view.txtYearLevel.Text

        End With

        RecordModel.Insert(TES, Operation)
        _view.btnSave.Text = "Add"
    End Sub
End Class
