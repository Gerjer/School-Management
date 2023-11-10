Imports MySql.Data.MySqlClient
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Drawing
Imports System.Linq
Imports System.Text
Imports System.Windows.Forms
Imports System.Drawing.Imaging
Imports System.Drawing.Drawing2D
Imports System.IO
Imports System.Threading
Imports DevExpress.Utils
'Imports DevComponents.DotNetBar
Imports DevExpress.XtraEditors.Controls
Imports SchoolMGT

Public Class AdmissionRecordPresenter
    Private _view As frmStudentAdmissionEntry
    Dim recordModel As New AdmissionRecordModel

    Dim AcademicYear As String = ""
    Dim SelectedRow As DataRow
    Dim Default_Image As Image

    Public Sub New(view As frmStudentAdmissionEntry)
        _view = view

        getFilterStudent_global()

        loadComboBox()
        loadHandler()
        CloseGroupControl()
    End Sub

    Private Sub loadHandler()

        AddHandler _view.btnCancel.Click, AddressOf btnCancel_Click
        AddHandler _view.btnSave.Click, AddressOf btnSave_Click
        AddHandler _view.btnNew.Click, AddressOf btnNew_Click
        AddHandler _view.btnOld.Click, AddressOf btnOld_Click
        AddHandler _view.cmbSemester.SelectedIndexChanged, AddressOf OpenEnrollmentStatus

        AddHandler _view.cmbCategory.SelectionChangeCommitted, AddressOf cmbCategory_SelectionChangeCommitted
        AddHandler _view.cmbCourseGrade.SelectionChangeCommitted, AddressOf cmbCourseGrade_SelectionChangeCommitted
        AddHandler _view.cmbBatchYear.SelectionChangeCommitted, AddressOf cmbBatchYear_SelectionChangeCommitted
        AddHandler _view.cmbBatch.SelectionChangeCommitted, AddressOf cmbBatch_SelectionChangeCommitted
        AddHandler _view.cmbYearLevel.SelectionChangeCommitted, AddressOf cmbYearLevel_SelectionChangeCommitted
        AddHandler _view.cmbStatus.SelectionChangeCommitted, AddressOf cmbStatus_SelectionChangeCommitted

        AddHandler _view.txtGrant.SelectedIndexChanged, AddressOf txtGrant_SelectedIndexChanged
        AddHandler _view.cxbxGrant.CheckedChanged, AddressOf checkScholarGrant
        AddHandler _view.chkManulStdNum.CheckedChanged, AddressOf ManualStudentNumber
        AddHandler _view.rdbReEntry.CheckedChanged, AddressOf TrapReEntryStudentData
    End Sub

    Private Sub TrapReEntryStudentData(sender As Object, e As EventArgs)
        If _view.rdbReEntry.Checked = True Then
            _view.dtpAdmDate.Enabled = True
            _view.txtAdmNum.Enabled = True
        Else
            _view.dtpAdmDate.Enabled = False
            _view.txtAdmNum.Enabled = False
        End If
    End Sub

    Private Sub ManualStudentNumber(sender As Object, e As EventArgs)
        If _view.chkManulStdNum.Checked = True Then
            _view.txtIDNum.Enabled = True
        Else
            _view.txtIDNum.Enabled = False
        End If
    End Sub

    Private Sub checkScholarGrant(sender As Object, e As EventArgs)
        If _view.cxbxGrant.Checked Then
            _view.txtGrant.Enabled = False
        Else
            _view.txtGrant.Enabled = True
        End If
    End Sub

    Private Sub txtGrant_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.txtGrant.SelectedItem, DataRowView)
            _view.txtIsFullDeduct.Text = drv.Item("fullDeduct").ToString
        Catch ex As Exception
            _view.txtIsFullDeduct.Text = ""
        End Try


        If _view.txtIsFullDeduct.Text = "YES" Then
            '        _view.cxbxGrant.Checked = True
        Else
            '       _view.cxbxGrant.Checked = False
        End If

    End Sub

    Private Sub cmbStatus_SelectionChangeCommitted(sender As Object, e As EventArgs)
        '     _view.cmbStature.Enabled = True
    End Sub

    Dim year_level As String
    Private Sub cmbYearLevel_SelectionChangeCommitted(sender As Object, e As EventArgs)
        '_view.cmbStatus.Enabled = True
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbYearLevel.SelectedItem, DataRowView)
            year_level = drv.Item("name").ToString
            loadBatch()
        Catch ex As Exception

        End Try

    End Sub

    Private Sub cmbBatch_SelectionChangeCommitted(sender As Object, e As EventArgs)

        _view.cmbStatus.Enabled = True
        _view.cmbStature.Enabled = True

        '  loadYearLevel()

        _view.txtAdmNum.Text = generateAdmissionNum()
        '      loadBatch()

        If EnrollmentStatus = 1 Then
            _view.txtIDNum.Text = generateStudentNumber()
        End If
    End Sub

    Dim UserName As String = ""
    Private Function generateStudentNumber() As String
        Dim StdNumber As String = ""
        Dim year As String = Format(Date.Now.Date, "yyyy")
        Dim sem As String = getSemister(_view.cmbSemester.Text)
        Dim lastNumber As String = getClassRollNo()

        If lastNumber = "" Then
            lastNumber = 1
        Else
            lastNumber += 1
        End If

        ClassRollNo = lastNumber

        lastNumber = String.Format("{0:D4}", CInt(lastNumber))
        StdNumber = String.Format("{0}{1}{2}{3}{4}", year, "-", sem, "-", lastNumber)

        UserName = year + sem + lastNumber

        Return StdNumber
    End Function

    Private Function getClassRollNo() As String
        Dim StdNumber As String = ""
        StdNumber = DataObject(String.Format("SELECT
                    IFNULL(MAX(CAST(`students`.`class_roll_no` AS UNSIGNED)),'')
                FROM
                    `students`
                    INNER JOIN `person` 
                        ON (`students`.`person_id` = `person`.`person_id` AND `person`.status_type_id = 1 AND `person`.end_time IS NULL)
                "))
        Return StdNumber
    End Function

    Dim semister As String = ""
    Private Function getSemister(text As String) As String
        Dim sem As String = ""

        If semister.Contains("1") Then
            sem = "1"
        ElseIf semister.Contains("2") Then
            sem = "2"
        ElseIf semister.Contains("Summer") Then
            sem = "3"
        Else
            sem = "4"
        End If

        Return sem
    End Function

    Private Function generateAdmissionNum() As String
        Dim year As String = Format(_view.dtpAdmDate.Value, "yyyy")
        Dim yymmdd As String = year.Substring(year.Length - 2) & Format(_view.dtpAdmDate.Value, "MMdd")

        'Check Last Record
        Dim AdmisionDate As New Date

        If CheckStudentData() = True Then
            AdmisionDate = CheckPresentRecord()
        Else
            AdmisionDate = Format(_view.dtpAdmDate.Value, "yyyy-MM-dd")
        End If


        Dim SQLEX As String = DataObject("SELECT IFNULL(admission_no,0) from students WHERE id = (SELECT max(id) from students WHERE admission_date = '" & Format(AdmisionDate, "yyyy-MM-dd") & "')")

        Dim count As String = ""
        Try
            count = CInt(SQLEX.Substring(6, 6))

            If CInt(count) > 0 Then
                yymmdd = yymmdd & Format(count + 1, "000000")
            Else
                count = 1
                yymmdd = yymmdd & Format(count, "000000")
            End If

        Catch ex As Exception
            count = 1
            yymmdd = yymmdd & Format(CInt(count), "000000")
        End Try


        Return yymmdd



        'Dim MeData As DataTable
        'MeData = clsDBConn.ExecQuery(SQLEX)

        'If MeData.Rows.Count > 0 Then
        '    Try
        '        Dim count As String = MeData(0)("lastcount")   'CInt(MeData.Rows(0).Item("lastcount").ToString)
        '        yymmdd = yymmdd & Format(count + 1, "000000")
        '    Catch ex As Exception
        '        MsgBox(ex.Message)
        '    End Try
        'End If

        '     Return yymmdd

    End Function

    Private Function CheckPresentRecord() As Date
        Dim id As Integer
        id = DataObject(String.Format("SELECT IFNULL(max(id),0)'id' from students WHERE admission_date = '" & Format(_view.dtpAdmDate.Value, "yyyy-MM-dd") & "'"))
        If id > 0 Then
            Return Format(_view.dtpAdmDate.Value, "yyyy-MM-dd")
        Else
            Return Format(_view.dtpAdmDate.Value.AddDays(-1), "yyyy-MM-dd")
        End If

    End Function

    Private Function CheckStudentData() As Boolean
        Dim id As Integer
        id = DataObject(String.Format("SELECT IFNULL(max(id),0) from students"))
        If id > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Sub loadYearLevel()
        _view.cmbYearLevel.Enabled = True
        _view.cmbYearLevel.DataSource = recordModel.getYearLevel(_view.cmbCategory.SelectedValue)
        _view.cmbYearLevel.ValueMember = "id"
        _view.cmbYearLevel.DisplayMember = "name"
        _view.cmbYearLevel.SelectedIndex = -1
    End Sub

    Private Sub cmbBatchYear_SelectionChangeCommitted(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbBatchYear.SelectedItem, DataRowView)
            Year_batch = drv.Item("name").ToString

            '       Year_batch = _view.cmbBatchYear.Text
            '        loadBatch()
            loadYearLevel()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub cmbCourseGrade_SelectionChangeCommitted(sender As Object, e As EventArgs)
        Try
            CourseID = _view.cmbCourseGrade.SelectedValue
            loadBatchYear()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub cmbCategory_SelectionChangeCommitted(sender As Object, e As EventArgs)
        Try
            CatID = _view.cmbCategory.SelectedValue
            _student_category_id = _view.cmbCategory.SelectedValue
            loadCourseGrade(CatID)
            If CatID = 16 Then
                _view.GroupControl4.Enabled = True
            End If

        Catch ex As Exception
            CatID = 0
        End Try
    End Sub

    Dim Year_batch As String = ""
    Private Sub cmbBatchYear_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbBatchYear.SelectedItem, DataRowView)
            Year_batch = drv.Item("name")
            '    loadBatch
            _view.cmbYearLevel.Enabled = True
        Catch ex As Exception

        End Try
    End Sub

    Private Sub loadBatch()

        _view.cmbBatch.Enabled = True
        Dim dt As New DataTable
        dt = recordModel.getBatch(CourseID, Year_batch, _view.cmbSemester.Text, year_level)

        If dt.Rows.Count > 0 Then
            _view.cmbBatch.DataSource = dt
            _view.cmbBatch.ValueMember = "id"
            _view.cmbBatch.DisplayMember = "name"
            _view.cmbBatch.SelectedIndex = -1
        Else
            MsgBox("This Batch are not Exist....!!", MsgBoxStyle.Exclamation, "NOT EXIST")
        End If


    End Sub

    Dim CourseID As Integer = 0
    Private Sub cmbCourseGrade_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            'Dim drv As DataRowView = DirectCast(_view.cmbCourseGrade.SelectedItem, DataRowView)
            'CourseID = drv.Item("id")
            CourseID = _view.cmbCourseGrade.SelectedValue
            loadBatchYear()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub loadBatchYear()

        _view.cmbBatchYear.Enabled = True
            _view.cmbBatchYear.DataSource = recordModel.getBatchYear
            _view.cmbBatchYear.ValueMember = "id"
            _view.cmbBatchYear.DisplayMember = "name"
            _view.cmbBatchYear.SelectedIndex = -1

    End Sub

    Dim CatID As Integer = 0
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs)

        Try
            'If _view.cmbCategory.SelectedValue > 0 Then
            '    Dim drv As DataRowView = DirectCast(_view.cmbCategory.SelectedItem, DataRowView)
            '    CatID = drv.Item("id")
            '    loadCourseGrade(CatID)
            'End If
            CatID = _view.cmbCategory.SelectedValue
            loadCourseGrade(CatID)

        Catch ex As Exception
            CatID = 0
        End Try

    End Sub

    Private Sub loadCourseGrade(catID As Integer)

        _view.cmbCourseGrade.Enabled = True
            _view.cmbCourseGrade.DataSource = recordModel.getCourseGrade(catID)
            _view.cmbCourseGrade.ValueMember = "id"
            _view.cmbCourseGrade.DisplayMember = "name"
            _view.cmbCourseGrade.SelectedIndex = -1

    End Sub

    Private Sub OpenEnrollmentStatus(sender As Object, e As EventArgs)
        _view.gcEnrollmentStatus.Enabled = True
    End Sub

    Public Sub OpenGroupControl()
        _view.gcAccountStatus.Enabled = True
        _view.gcAdmissionDetails.Enabled = True
        _view.gcClassification.Enabled = True
        _view.gcEnrollmentStatus.Enabled = True
        _view.gcStudentProfile.Enabled = True
    End Sub
    Public Sub CloseGroupControl()
        _view.gcAccountStatus.Enabled = False
        _view.gcAdmissionDetails.Enabled = False
        _view.gcClassification.Enabled = False
        _view.gcEnrollmentStatus.Enabled = False
        _view.gcStudentProfile.Enabled = False
    End Sub


    Private Sub btnOld_Click(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        _semester = _view.cmbSemester.Text
        _academic_year = _view.cmbYearFrom.Text & "-" & _view.cmbYearTo.Text

        UpdateFilterStudent()

        OpenStudetForm(_view.btnOld.Tag)
        OpenGroupControl()

        Cursor.Current = Cursors.Default

    End Sub

    Private Sub btnNew_Click(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        EnrollmentStatus = 1

        '     OpenStudetForm(_view.btnNew.Tag)
        OPERATION = "ADD"
        Dim frm As New frmStudentAdmissionProfile
        frm.BringToFront()
        frm.ShowDialog()
        If frm.DialogResult = DialogResult.OK Then

            _view.txtLName.Text = frm.txtLastName.Text
            _view.txtFName.Text = frm.txtFirstName.Text
            _view.txtMName.Text = frm.txtMiddleName.Text
            _view.txtCurrentAddress.Text = frm.txtAddress.Text
            _view.dtpDateBirth.Value = frm.dtpBDay.Value
            _view.txtAge.Text = GetCurrentAge(_view.dtpDateBirth.Value)
            _view.txtContactNumber.Text = frm.txtContact.Text
            frm.Close()

            _view.Panel1.BackColor = Color.MediumAquamarine
            loadCategory()
            OpenGroupControl()

        End If

        '  OpenGroupControl()


        Cursor.Current = Cursors.Default

    End Sub

    Dim EnrollmentStatus As Integer = 0
    Private Sub OpenStudetForm(tag As Object)
        EnrollmentStatus = tag

        AcademicYear = _view.cmbYearFrom.Text & "-" & _view.cmbYearTo.Text
        Dim frm As New frmFilterPerson
        frm.Tag = tag
        frm.AcademicYear = AcademicYear
        frm.Semester = _view.cmbSemester.Text
        frm.BringToFront()
        frm.ShowDialog()

        If frm.DialogResult = DialogResult.OK Then

            If tag = 1 Then
                _view.Panel1.BackColor = Color.MediumAquamarine
            Else
                _view.Panel1.BackColor = Color.DarkOrange
            End If

            loadCategory()

            SelectedRow = frm.SelectedRow
            SelectedRowAssingValue(frm.SelectedRow)

            frm.Close()

        Else
            frm.Close()

        End If
        '    cmbSemester.Text = SemesterName
        '     cmbCategory.Focus()
    End Sub

    Dim student_class_roll_no As String = ""
    Dim ClassRollNo As String = ""
    Dim stedent_fullname As String = ""
    Dim gender As String = ""
    Dim student_userID As Integer
    Dim _sender As New Object
    Dim _e As New EventArgs

    Private Sub SelectedRowAssingValue(selectedRow As DataRow)
        Dim CategoryID As Integer = 0
        Dim CourseID As Integer = 0
        If selectedRow IsNot Nothing Then

            student_class_roll_no = If(IsDBNull(selectedRow("class_roll_no")), 0, selectedRow("class_roll_no"))
            ClassRollNo = student_class_roll_no
            _view.txtIDNum.Text = If(IsDBNull(selectedRow("ID NUMBER")), "", selectedRow("ID NUMBER"))
            _view.txtLName.Text = If(IsDBNull(selectedRow("last_name")), "", selectedRow("last_name"))
            _view.txtFName.Text = If(IsDBNull(selectedRow("first_name")), "", selectedRow("first_name"))
            _view.txtMName.Text = If(IsDBNull(selectedRow("middle_name")), "", selectedRow("middle_name"))

            stedent_fullname = _view.txtLName.Text & ", " & _view.txtFName.Text & " " & _view.txtMName.Text

            _view.txtContactNumber.Text = If(IsDBNull(selectedRow("ContactNumber")), "", selectedRow("ContactNumber"))
            _view.txtCurrentAddress.Text = If(IsDBNull(selectedRow("Address")), "", selectedRow("Address"))
            _view.txtRemainingBalance.Text = If(IsDBNull(selectedRow("runningbalance")), "", selectedRow("runningbalance"))
            _view.txtRemainingBalance.Text = If(IsDBNull(selectedRow("scholarshipgrant")), "", selectedRow("scholarshipgrant"))

            gender = If(IsDBNull(selectedRow("gender")), "", selectedRow("gender"))

            _view.dtpDateBirth.Value = If(IsDBNull(selectedRow("date_of_birth")), Format(Date.Now.Date, "yyyy-MM-dd"), selectedRow("date_of_birth"))
            _view.txtAge.Text = GetCurrentAge(_view.dtpDateBirth.Value)
            _view.txtPhotoFileName.Text = If(IsDBNull(selectedRow("photo_file_name")), "", selectedRow("photo_file_name"))

            _view.cmbStature.Text = If(IsDBNull(selectedRow("stature")), "", selectedRow("stature"))
            CategoryID = If(IsDBNull(selectedRow("student_category_id")), 0, selectedRow("student_category_id"))
            If CategoryID > 0 Then
                _view.cmbCategory.SelectedValue = CategoryID
                cmbCategory_SelectionChangeCommitted(_sender, _e)
            Else
                _view.cmbCategory.SelectedIndex = -1
            End If
            CourseID = If(IsDBNull(selectedRow("course_id")), 0, selectedRow("course_id"))
            If CourseID > 0 Then
                _view.cmbCourseGrade.SelectedValue = CourseID
                cmbCourseGrade_SelectionChangeCommitted(_sender, _e)
            Else
                _view.cmbCourseGrade.SelectedIndex = -1
            End If

            student_userID = If(IsDBNull(selectedRow("user_id")), 0, selectedRow("user_id"))
            PERSON_ID = selectedRow("person_id")

            '  If Not _view.txtPhotoFileName.Text.Length = 0 Then
            'Dim curPath = Directory.GetCurrentDirectory
            'If rbtnNew.Checked Then
            '    Dir = curPath & "\PIC\PERSON\"
            'Else
            '    curPath = curPath & "\PIC\"

            '    Dim dt As New DataTable
            '    dt = getStudentDescription(selectedRow("person_id"))

            '    Dim Category = If(IsDBNull(dt(0)("name").ToString), "", dt(0)("name").ToString)
            '    Dim Course = If(IsDBNull(dt(0)("course_name").ToString), "", dt(0)("course_name").ToString)

            'End If

            '   loadPicture(True, txtPhotoFileName.Text)
            'End If
        End If

        '      _view.cmbStature.Enabled = True

    End Sub


    Private Sub loadCategory()
        _view.cmbCategory.Enabled = True
        _view.cmbCategory.DataSource = recordModel.getCategory
        _view.cmbCategory.ValueMember = "id"
        _view.cmbCategory.DisplayMember = "name"
        _view.cmbCategory.SelectedIndex = -1
    End Sub

    Dim txtStudentDBID As String = ""
    Private Sub btnSave_Click(sender As Object, e As EventArgs)

        Try
            If _view.txtIDNum.Text = "" Then
                MsgBox("Please check Entry, ID Number is required", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If ifStudentIDExist(_view.txtIDNum.Text) And EnrollmentStatus = 1 Then
                MsgBox("Please check Entry, ID Number Exists.", MsgBoxStyle.Critical)
                Exit Sub
            End If

            If CatID = 16 Then
                If _view.cmbTrack.SelectedIndex = -1 Or _view.cmbStrand.SelectedIndex = -1 Then
                    MsgBox("Please check Entry, Track and Strand is required.", MsgBoxStyle.Critical)
                    Exit Sub
                End If
            End If

            If _view.cmbStatus.Text = "" Then
                    MsgBox("Please check Entry, Class Status is required.", MsgBoxStyle.Critical)
                    Exit Sub
                End If

            If _view.cmbStatus.Text = "" Then
                MsgBox("Please check Entry, Class Status is required.", MsgBoxStyle.Critical)
                Exit Sub
            End If



            If MessageBox.Show("Are you sure you want to Continue And Save Student Data?", "Please Verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

                '      PERSON_ID = SelectedRow("person_id")

                saveStudentsData()
                Else
                    Exit Sub
            End If


            Dim SQLEX As String = "SELECT id from students where admission_no='" & _view.txtAdmNum.Text & "'"

            Dim userData As DataTable
            userData = clsDBConn.ExecQuery(SQLEX)
            If userData.Rows.Count > 0 Then
                txtStudentDBID = userData.Rows(0).Item("id").ToString
            End If

            _courseID = _view.cmbCourseGrade.SelectedValue
            _batchID = _view.cmbBatch.SelectedValue
            _studentID = txtStudentDBID
            _batchyear = _view.cmbBatchYear.Text
            _class_roll_no = student_class_roll_no

            Dim frm As New fmaStudentsSubjectListForm

            With frm
                .txtCategory.Text = _view.cmbCategory.Text
                .txtStudentID.Text = txtStudentDBID
                .txtCoursename.Text = _view.cmbCourseGrade.Text
                .txtCoursename.Tag = _view.cmbCourseGrade.SelectedValue
                .txtBatchName.Text = _view.cmbBatch.Text
                .txtBatchName.Tag = _view.cmbBatch.SelectedValue
                .txtStudentName.Text = _view.txtLName.Text _
                                       & ", " & _view.txtFName.Text _
                                       & " " & _view.txtMName.Text
                .txtAdmissionNo.Text = _view.txtAdmNum.Text
            End With

            frm.BringToFront()
            frm.ShowDialog()
            '      frm.ShowDialog(Me)
            clearData()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Private Sub clearData()
        _view.dtpAdmDate.Value = Date.Now
        _view.cxbxGrant.Checked = False
        _view.txtGrant.Text = Nothing

        _view.txtGrant.Enabled = True

        _view.txtAdmNum.Text = ""
        _view.txtIDNum.Text = ""

        _view.txtLName.Text = ""
        _view.txtFName.Text = ""
        _view.txtMName.Text = ""
        _view.txtContactNumber.Text = ""
        _view.txtCurrentAddress.Text = ""
        _view.txtAge.Text = ""
        _view.dtpDateBirth.Value = Date.Now

        _view.cmbYearLevel.SelectedIndex = -1
        _view.cmbStatus.SelectedIndex = -1
        _view.cmbStature.SelectedIndex = -1

        _view.cmbCategory.SelectedIndex = -1
        _view.cmbCourseGrade.SelectedIndex = -1
        _view.cmbBatch.SelectedIndex = -1

        _view.pbxphoto.Image = Default_Image
    End Sub

    Private Sub saveStudentsData()

        '      SavePicture()

        If _view.txtIDNum.Text = "" Then
            Exit Sub
        End If

        Dim SQLIN As String = ""

        If _view.cxbxGrant.Checked Then

            If _view.txtGrant.Text.Length = 0 Then
                MsgBox("Please Fill Scholarship Grant.", MsgBoxStyle.Critical)
            End If

            Dim userID As String = ""
            If student_userID = 0 Then
                userID = 0 'createNewUserAccount()
            Else
                userID = student_userID
                ClassRollNo = student_class_roll_no
            End If

            If _view.rdbReEntry.Checked = False Then
                _view.txtAdmNum.Text = generateAdmissionNum()
            End If


            'Update End Time
            UpdateEndTime(student_class_roll_no)

            'Double Checking ClassRollNo
            Dim CheckingRollNo = getCheckingClassRollNo()
            If ClassRollNo <> CheckingRollNo Then
                ClassRollNo = CheckingRollNo
            End If

            SQLIN = "INSERT INTO students(admission_no,class_roll_no,admission_date,"
                SQLIN += " batch_id,student_category_id,academice_year,"
                SQLIN += " user_id,stature,std_number,"
                SQLIN += " scholarshipgrant,has_paid_fees,person_id,year_level,semester,status_description,course_id,"
                SQLIN += " runningbalance,track,strand "
                SQLIN += ")"
                SQLIN += " VALUES("
                SQLIN += String.Format("'{0}','{1}','{2}',", _view.txtAdmNum.Text, ClassRollNo, Format(_view.dtpAdmDate.Value, "yyyy-MM-dd"))
                SQLIN += String.Format("'{0}','{1}','{2}',", _view.cmbBatch.SelectedValue, _view.cmbCategory.SelectedValue, _view.cmbYearFrom.Text & "-" & _view.cmbYearTo.Text)
                SQLIN += String.Format("'{0}','{1}','{2}',", LoginUserID, _view.cmbStature.Text, _view.txtIDNum.Text)
                SQLIN += String.Format("'{0}','{1}','{2}','{3}','{4}','{5}','{6}',", _view.txtGrant.Text.Replace("'", "`"), "1", SelectedRow("person_id"), _view.cmbYearLevel.Text, _view.cmbSemester.Text, _view.cmbStatus.Text, _view.cmbCourseGrade.SelectedValue) '
                If _view.chkBBal.Checked = True Then
                    SQLIN += String.Format("'{0}','{1}','{2}'", _view.txtRemainingBalance.Text, _view.cmbTrack.Text, _view.cmbStrand.Text)
                Else
                    SQLIN += String.Format("'{0}','{1}','{2}'", 0, _view.cmbTrack.Text, _view.cmbStrand.Text)
                End If
                SQLIN += ")"
                If clsDBConn.Execute(SQLIN) Then
                    MsgBox("Student data has been saved.", MsgBoxStyle.Information)
                End If


            Else
                'create new User Account
                Dim userID As String = ""
            If student_userID = 0 Then
                userID = 0 'createNewUserAccount()
            Else
                userID = student_userID
                ClassRollNo = student_class_roll_no
            End If

            If _view.rdbReEntry.Checked = False Then
                _view.txtAdmNum.Text = generateAdmissionNum()
            End If


            'Update End Time
            UpdateEndTime(student_class_roll_no)

            'Double Checking ClassRollNo
            Dim CheckingRollNo = getCheckingClassRollNo()
            If ClassRollNo <> CheckingRollNo Then
                ClassRollNo = CheckingRollNo
            End If

            SQLIN = "INSERT INTO students(admission_no,class_roll_no,admission_date,"
                SQLIN += " batch_id,student_category_id,academice_year,"
                SQLIN += " user_id,stature,std_number,"
                SQLIN += " person_id,year_level,semester,enrollmentAS,course_id,"
                SQLIN += " runningbalance,track,strand,scholarshipgrant "
                SQLIN += ")"
                SQLIN += " VALUES("
                SQLIN += String.Format("'{0}','{1}','{2}',", _view.txtAdmNum.Text, ClassRollNo, Format(_view.dtpAdmDate.Value, "yyyy-MM-dd"))
                SQLIN += String.Format("'{0}','{1}','{2}',", _view.cmbBatch.SelectedValue, _view.cmbCategory.SelectedValue, _view.cmbYearFrom.Text & "-" & _view.cmbYearTo.Text)
                SQLIN += String.Format("'{0}','{1}','{2}',", LoginUserID, _view.cmbStature.Text, _view.txtIDNum.Text)
                SQLIN += String.Format("'{0}','{1}','{2}','{3}','{4}',", PERSON_ID, _view.cmbYearLevel.Text, _view.cmbSemester.Text, _view.cmbStatus.Text, _view.cmbCourseGrade.SelectedValue) '
                If _view.chkBBal.Checked = True Then
                    SQLIN += String.Format("'{0}','{1}','{2}','{3}'", 0, _view.cmbTrack.Text, _view.cmbStrand.Text, _view.txtGrant.Text.Replace("'", "`"))
                Else
                    SQLIN += String.Format("'{0}','{1}','{2}','{3}'", 0, _view.cmbTrack.Text, _view.cmbStrand.Text, _view.txtGrant.Text.Replace("'", "`"))
                End If
                SQLIN += ")"

                If clsDBConn.Execute(SQLIN) Then
                    MsgBox("Student data has been saved.", MsgBoxStyle.Information)
                    _view.rdbReEntry.Checked = False
                    _view.chkManulStdNum.Checked = False
                End If
            End If

        'If BrowsePic_Selected = True Then
        '    SavePicture()
        'End If


    End Sub

    Private Function getCheckingClassRollNo() As Object
        Dim sql As String = ""
        sql = "SELECT
	                IFNULL( MAX( CAST( `students`.`class_roll_no` AS UNSIGNED )+ 1 ), '' ) 
                FROM
	                `students`
	                INNER JOIN `person` ON (
		                `students`.`person_id` = `person`.`person_id` 
		                AND `person`.status_type_id = 1 
	                AND `person`.end_time IS NULL 
	                )"
        Return DataObject(Sql)
    End Function

    Private Sub UpdateEndTime(student_class_roll_no As String)
        Dim id As Integer = DataObject(String.Format("SELECT 	IFNULL(Max(id),1)  FROM	students WHERE	status_type_id = 1 	AND class_roll_no = '" & student_class_roll_no & "'"))
        If id > 0 Then
            DataSource(String.Format("UPDATE `students` SET `end_time` = '" & Format(Date.Now, "yyyy-MM-dd H:mm:ss") & "'  WHERE id = '" & id & "'"))
        End If

    End Sub

    Private Function createNewUserAccount() As String
        Dim userID As String = ""

        Dim salt As String = CREATERANDOMSALT()
        Dim hashedPassword As String = HASH512(UserName, salt) ' txtAdmNum.Text


        Dim SQLIN As String = "INSERT INTO users(username,first_name,last_name,student,admin,employee,hashed_password,salt,application_setup_id)"
        SQLIN += " VALUES("
        SQLIN += String.Format("'{0}', '{1}',", UserName, _view.txtFName.Text)
        SQLIN += String.Format("'{0}', '{1}',", _view.txtLName.Text, "1")
        SQLIN += String.Format("'{0}', '{1}',", "0", "0")
        SQLIN += String.Format("'{0}', '{1}','{2}')", hashedPassword, salt, AppSetup_Domain)

        If clsDBConn.Execute(SQLIN) Then
            Dim SQLEX As String = "SELECT id from users where username='" & UserName & "'"

            Dim userData As DataTable
            userData = clsDBConn.ExecQuery(SQLEX)

            If userData.Rows.Count > 0 Then
                userID = userData.Rows(0).Item("id").ToString
            End If
        End If

        Return userID
    End Function

    Private Function ifStudentIDExist(IDNumber As String) As Boolean

        Dim dt As New DataTable
        dt = recordModel.getExistingIDnumber(IDNumber)
        If dt.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Sub btnCancel_Click(sender As Object, e As EventArgs)
        _view.Close()
    End Sub

    Private Sub loadComboBox()
        ComboxYear()
        loadScholarshipGrant
    End Sub

    Private Sub loadScholarshipGrant()

        _view.txtGrant.DataSource = recordModel.getScholarGrant
        _view.txtGrant.ValueMember = "id"
        _view.txtGrant.DisplayMember = "name"
        _view.txtGrant.SelectedIndex = -1

        _view.txtIsFullDeduct.Text = ""
    End Sub

    Private Sub ComboxYear()

        _view.cmbYearFrom.Properties.Items.Clear()

        For i As Integer = Year(Date.Now) To 2010 Step -1   ' 2000 To Format(Date.Now, "yyyy")
            Dim item As ComboBoxItem = New ComboBoxItem()
            item.Value = i
            _view.cmbYearFrom.Properties.Items.Add(item)
        Next
        _view.cmbYearFrom.SelectedIndex = 0


        _view.cmbYearTo.Properties.Items.Clear()
        For i As Integer = Year(Date.Now) + 1 To 2010 Step -1   ' 2000 To Format(Date.Now, "yyyy")
            Dim item As ComboBoxItem = New ComboBoxItem()
            item.Value = i
            _view.cmbYearTo.Properties.Items.Add(item)
        Next
        _view.cmbYearTo.SelectedIndex = 0
    End Sub
End Class
