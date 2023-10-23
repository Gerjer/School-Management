Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI
Imports System.Configuration
Imports System.IO
Imports DevExpress.XtraPrinting
Imports DevExpress.XtraPrinting.Drawing
Imports SchoolMGT
Imports System.Windows.Forms
Imports System.Drawing.Imaging.ImageCodecInfo
Imports System.Drawing.Drawing2D
Imports System.Threading

Public Class TOR_Presenter
    Public _view As frmTOR
    Dim RecordModel As New TOR_Model

    Public Sub New(frmTOR As frmTOR)

        _view = frmTOR

        _view.expBackTrack.Expanded = False
        _view.expSchoolName.Expanded = False
        _view.expStudentRecord.Expanded = False


        loadComboBox()
        loadHandler()
        loadHeaderSubject()

        _view.btnEditTORdata.Enabled = False
        _view.btnRemoveTORdata.Enabled = False

    End Sub

    Dim dt_subject As New DataTable
    Private Sub loadHeaderSubject()
        '      dt_subject = RecordModel.creatHeaderSubject()
        dt_subject.Columns.Add("Semester")
        dt_subject.Columns.Add("academice_year")
        dt_subject.Columns.Add("CourseCode")
        dt_subject.Columns.Add("SubjectName")
        dt_subject.Columns.Add("finalgrade")
        dt_subject.Columns.Add("re_exam") '
        dt_subject.Columns.Add("credit_hours")
        dt_subject.Columns.Add("year_level")
    End Sub

    Private Sub loadHandler()

        '    AddHandler _view.btnRemoveTORdata.Click, AddressOf btnAdd_Click
        AddHandler _view.btnPrint.Click, AddressOf PrintTOR
        AddHandler _view.btnSave.Click, AddressOf Save
        AddHandler _view.btnLoadFinalGrade.Click, AddressOf LoadFinalGrade
        AddHandler _view.btnEditTORdata.Click, AddressOf EditTOR
        AddHandler _view.btnRemoveSubject.Click, AddressOf RemoveSubjectOnTheList
        AddHandler _view.btnRemoveTORdata.Click, AddressOf RemoveTORdata
        AddHandler _view.btnAddSubject.Click, AddressOf AddSubject

        AddHandler _view.cmbStudent.SelectionChangeCommitted, AddressOf SelectedStudent
        AddHandler _view.cmbSubject.SelectedIndexChanged, AddressOf cmbSubject_SelectedIndex
        '    AddHandler _view.cmbBatch.SelectedIndexChanged, AddressOf SelectedIndexBatch_AcdemicDeails
        AddHandler _view.cmbBatch.SelectionChangeCommitted, AddressOf SelectedChangeCommited

        AddHandler _view.txtFilePath.ButtonCustomClick, AddressOf OpenFile1

        AddHandler _view.gvTOR.RowCellClick, AddressOf SelectRow


        AddHandler _view.rdbFinalGrade.CheckedChanged, AddressOf SelectTab_FinalGrade
        AddHandler _view.rdbBacktrackGrade.CheckedChanged, AddressOf SelectTab_BackTrack
        'AddHandler _view.cmbYearLevel1.SelectedIndexChanged, AddressOf SelectedIndexYearLevel_AcdemicDeails
        'AddHandler _view.cmbSemester1.SelectedIndexChanged, AddressOf SelectedIndexSemester_AcdemicDeails
        'AddHandler _view.cmbAcademicYear1.SelectedIndexChanged, AddressOf SelectedIndexAcademicYear_AcdemicDeails



    End Sub

    Private Sub SelectedChangeCommited(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbBatch.SelectedItem, DataRowView)
            _studentID = drv.Item("id").ToString
            _view.cmbYearLevel1.Text = drv.Item("year_level").ToString
            _view.cmbSemester1.Text = drv.Item("semester").ToString
            _view.cmbAcademicYear1.Text = drv.Item("academice_year").ToString

        Catch ex As Exception

        End Try

    End Sub

    Private Sub RemoveTORdata(sender As Object, e As EventArgs)
        _view.gvTOR.DeleteRow(_view.gvTOR.FocusedRowHandle)

        DataSource(String.Format("DELETE FROM backtrack_entry WHERE id = '" & back_track_id & "'"))
        MessageBox.Show("Record has been remove to TOR....", "Successfully!")
        loadTOR(_view.cmbStudent.SelectedValue)

    End Sub

    Private Sub RemoveSubjectOnTheList(sender As Object, e As EventArgs)
        _view.gvSubjectList.DeleteRow(_view.gvSubjectList.FocusedRowHandle)

        MessageBox.Show("Subject has been remove to the list...", "Successfully!")
    End Sub

    'Private Sub Enter_event(sender As Object, e As KeyEventArgs)
    '    If e.KeyCode = Keys.Enter Then
    '        loadTOR(_view.cmbStudent.SelectedValue)
    '    End If
    'End Sub

    Private Sub EditTOR(sender As Object, e As EventArgs)

        If back_track_id > 0 Then
            SelectedTab = "Backtrack Entry"

            OPERATION = "EDIT"

            _view.expBackTrack.Expanded = True
            _view.expSchoolName.Expanded = True
            _view.expStudentRecord.Expanded = True

            _view.TabItem2.Visible = True
            _view.TabItem3.Visible = False
            _view.TabControl4.SelectedTab = _view.TabItem2

            _view.gcSubjectList.Enabled = False
            _view.Panel11.Enabled = False
            _view.btnSave.Text = "Update"


        End If
    End Sub


    Private Sub SelectTab_BackTrack(sender As Object, e As EventArgs)
        _view.TabItem2.Visible = True
        _view.TabItem3.Visible = False
        SelectedTab = "Backtrack Entry"
        OPERATION = "ADD"

        Dim CheckIDExist = RecordModel.CheckStudent(PERSON_ID, _view.txtacademic_year.Text, _view.cmbsemester.Text, _view.txtacademic_year.Text)
        If CheckIDExist Is Nothing Then
            _view.txtStudentID.Text = System.Guid.NewGuid.GetHashCode
        Else
            _view.txtStudentID.Text = CheckIDExist
        End If

        _view.expBackTrack.Expanded = True
        loadStudentAcademic()

    End Sub

    Private Sub SelectTab_FinalGrade(sender As Object, e As EventArgs)
        _view.TabItem3.Visible = True
        _view.TabItem2.Visible = False
        SelectedTab = "Current Grade Entry"
        OPERATION = "ADD"

        _view.expBackTrack.Expanded = True
        loadStudentAcademic()

    End Sub

    Private Sub LoadFinalGrade(sender As Object, e As EventArgs)

        If _view.cmbBatch.SelectedIndex = -1 Then
            MessageBox.Show("Requird Fields....Batch", "Warning!!!")
            Exit Sub
        End If


        Dim dt As New DataTable
        dt = RecordModel.getFinalGrade(_studentID)
        If dt.Rows.Count > 0 Then

            _view.gcFinalGrade.DataSource = dt

            MessageBox.Show("All Subject has been added to the list...", "Successfully!")

        End If

    End Sub



    Private Sub SelectedIndexBatch_AcdemicDeails(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbBatch.SelectedItem, DataRowView)
            _studentID = drv.Item("id").ToString
            _view.cmbYearLevel1.Text = drv.Item("year_level").ToString
            _view.cmbSemester1.Text = drv.Item("semester").ToString
            _view.cmbAcademicYear1.Text = drv.Item("academice_year").ToString

        Catch ex As Exception

        End Try

    End Sub


    Private Sub AddSubject(sender As Object, e As EventArgs)

        If _view.gvSubjectList.RowCount > 0 Then
            dt_subject = _view.gcSubjectList.DataSource
        End If

        dt_subject.Rows.Add(_view.cmbsemester.Text, _view.txtacademic_year.Text, _view.txtsubject_code.Text, _view.txtsubject_name.Text, _view.txtfinalgrade.Text, _view.txtre_exam.Text, _view.txtcredit_hours.Text, _view.cmbYearLevel.Text)
        _view.gcSubjectList.DataSource = Nothing
        _view.gcSubjectList.DataSource = dt_subject

        MessageBox.Show("Subject ha been to the list..", "Successfully!")

    End Sub

    Dim names As String = ""
    Dim LoadedImage As Boolean = False
    Private Sub OpenFile1(sender As Object, e As EventArgs)
        With _view.OpenFileDialog1
            .Title = "Select an Image"  ' Path.GetFileName(.FileName)
            .InitialDirectory = "C:\"
            .Filter = "Image Files(*.BMP;*.JPG;*.GIF;*.PNG)|*.BMP;*.JPG;*.GIF;*PNG|All files (*.*)|*.*" '"JPEGs|*.jpg|GIFs|*.gif|Bitmaps|*.bmp|AllFiles|*.*"
            .FilterIndex = 1

        End With
        If _view.OpenFileDialog1.ShowDialog() = Windows.Forms.DialogResult.OK Then
            LoadedImage = True
            With _view.PictureBox1
                .Image = Image.FromFile(_view.OpenFileDialog1.FileName)
                .SizeMode = PictureBoxSizeMode.StretchImage
                .BorderStyle = BorderStyle.Fixed3D

            End With
        End If

        _view.txtFilePath.Text = _view.OpenFileDialog1.FileName
        _photo_path = _view.txtFilePath.Text
        'source_path = _view.txtpicturepath.Text
        names = _view.txtFilePath.Text.Trim
        Dim phrase As String = names.Substring(names.LastIndexOf("\"c) + 1)

        '     _photo_filename = phrase
        _view.txtFilePath.Text = phrase


    End Sub

    Dim _photo_path As String
    Dim _photo_filename As String
    Dim SelectedImage As Boolean = False

    Private Sub OpenFile(sender As Object, e As EventArgs)
        With _view.OpenFileDialog2
            .Title = "Select an Image"  ' Path.GetFileName(.FileName)
            .InitialDirectory = "C:\"
            .Filter = "Image Files(*.BMP;*.JPG;*.GIF;*.PNG)|*.BMP;*.JPG;*.GIF;*PNG|All files (*.*)|*.*" '"JPEGs|*.jpg|GIFs|*.gif|Bitmaps|*.bmp|AllFiles|*.*"
            .FilterIndex = 1

        End With
        If Windows.Forms.DialogResult.OK Then
            SelectedImage = True
            With _view.PictureBox1
                .Image = Image.FromFile(_view.OpenFileDialog2.FileName)
                .SizeMode = PictureBoxSizeMode.StretchImage
                .BorderStyle = BorderStyle.Fixed3D

            End With
        End If

        _photo_path = _view.OpenFileDialog1.FileName
        _view.txtFilePath.Text = _view.OpenFileDialog1.FileName
        Dim names = _view.txtFilePath.Text.Trim
        Dim phrase As String = names.Substring(names.LastIndexOf("\"c) + 1)

        _photo_filename = phrase
        _view.txtFilePath.Text = phrase
    End Sub

    Dim subject_code As String
    Private Sub cmbSubject_SelectedIndex(sender As Object, e As EventArgs)
        Try
            Dim drv As DataRowView = DirectCast(_view.cmbSubject.SelectedItem, DataRowView)
            subject_code = drv.Item("code").ToString
            NSTP_CODE = drv.Item("code").ToString
        Catch ex As Exception

        End Try
    End Sub

    Dim back_track_id As Integer
    Private Sub SelectRow(sender As Object, e As RowCellClickEventArgs)
        back_track_id = _view.gvTOR.GetFocusedRowCellValue("BackTrackID")

        _view.txtschool_name.Text = _view.gvTOR.GetFocusedRowCellValue("SchoolName")
        _view.txtschool_address.Text = _view.gvTOR.GetFocusedRowCellValue("SchoolAddress")
        _view.cmbYearLevel.Text = _view.gvTOR.GetFocusedRowCellValue("year_level")
        _view.cmbsemester.Text = _view.gvTOR.GetFocusedRowCellValue("Semester")
        _view.txtacademic_year.Text = _view.gvTOR.GetFocusedRowCellValue("academice_year")
        _view.txtsubject_code.Text = _view.gvTOR.GetFocusedRowCellValue("CourseCode")
        _view.txtsubject_name.Text = _view.gvTOR.GetFocusedRowCellValue("SubjectName")
        _view.txtfinalgrade.Text = _view.gvTOR.GetFocusedRowCellValue("finalgrade")
        _view.txtre_exam.Text = _view.gvTOR.GetFocusedRowCellValue("re_exam")
        _view.txtcredit_hours.Text = _view.gvTOR.GetFocusedRowCellValue("credit_hours")

        _view.btnEditTORdata.Enabled = True
        _view.btnRemoveTORdata.Enabled = True

    End Sub

    Dim SelectedTab As String = ""
    Dim graduate_status As Integer
    Private Sub Save(sender As Object, e As EventArgs)


        If SelectedTab = "Backtrack Entry" Then
            If _view.txtschool_name.Text = "" Then
                MessageBox.Show("Required fields.....Name of School", "Warning!!!")
                Exit Sub
            End If
            If _view.txtschool_address.Text = "" Then
                MessageBox.Show("Required fields.....School Address", "Warning!!!")
                Exit Sub
            End If
            If _view.cmbYearLevel.Text = "" Then
                MessageBox.Show("Required fields.....Year Level", "Warning!!!")
                Exit Sub
            End If

            If _view.cmbsemester.Text = "" Then
                MessageBox.Show("Required fields.....Semester", "Warning!!!")
                Exit Sub
            End If

            If _view.txtacademic_year.Text = "" Then
                MessageBox.Show("Required fields.....Academic Year", "Warning!!!")
                Exit Sub
            End If

            If _view.txtsubject_name.Text = "" Then
                MessageBox.Show("Required fields.....Subject", "Warning!!!")
                Exit Sub
            End If

            If _view.txtsubject_code.Text = "" Then
                MessageBox.Show("Required fields.....Subject Code", "Warning!!!")
                Exit Sub
            End If

        Else


            If _view.cmbBatch.Text = "" Then
                MessageBox.Show("Required fields.....Batch", "Warning!!!")
                Exit Sub
            End If

            If _view.cmbYearLevel1.Text = "" Then
                MessageBox.Show("Required fields.....Year Level", "Warning!!!")
                Exit Sub
            End If

            If _view.cmbSemester1.Text = "" Then
                MessageBox.Show("Required fields.....Semester", "Warning!!!")
                Exit Sub
            End If

            If _view.cmbAcademicYear1.Text = "" Then
                MessageBox.Show("Required fields.....Academic Year", "Warning!!!")
                Exit Sub
            End If

            Dim cnt As Integer = 0
            For i As Integer = 0 To _view.gvFinalGrade.DataRowCount - 1
                If _view.gvFinalGrade.GetRowCellValue(i, "INCLUDE") = "False" Then
                    cnt += 0
                Else
                    cnt += 1
                End If
            Next

            If cnt = 0 Then
                MessageBox.Show("Required fields.....Select SUBJECT on the list", "Warning!!!")
                Exit Sub
            End If


        End If



            If _view.chkGraduate.Checked Then
            graduate_status = 1
        Else
            graduate_status = 0
        End If

        RecordModel.BacktrackID = back_track_id
        RecordModel.subject_code = subject_code
        RecordModel.graduate_status = graduate_status
        RecordModel.subject_list = _view.gcSubjectList.DataSource
        RecordModel.subject_id = _view.cmbSubject.SelectedValue


        RecordModel.Insert(_view, _view.gvFinalGrade, SelectedTab, _view.gvSubjectList)

        SavePicture()


        _view.gcSubjectList.DataSource = Nothing
        _view.gcFinalGrade.DataSource = Nothing


        _view.gcFinalGrade.Enabled = True


        _view.btnSave.Text = "Save"

        _view.expBackTrack.Expanded = False

        _view.gcSubjectList.Enabled = False
        _view.Panel11.Enabled = True

        _view.btnEditTORdata.Enabled = False
        _view.btnRemoveTORdata.Enabled = False

        loadTOR(_view.cmbStudent.SelectedValue)


        clearControls()

    End Sub

    Private Sub clearControls()

        _view.txtschool_name.Text = ""
        _view.txtschool_address.Text = ""
        _view.txtprogram_name.Text = ""
        _view.txtacademic_year.Text = ""
        _view.txtsubject_code.Text = ""
        _view.txtsubject_name.Text = ""
        _view.txtcredit_hours.Text = ""
        _view.txtre_exam.Text = ""
        _view.txtPurpose.Text = ""
        _view.txtGraduated.Text = ""
        _view.txtNSTP.Text = ""
        _view.txtFilePath.Text = ""

        _view.cmbBatch.SelectedIndex = -1
        _view.cmbYearLevel.SelectedIndex = -1
        _view.cmbYearLevel1.SelectedIndex = -1
        _view.cmbsemester.SelectedIndex = -1
        _view.cmbSemester1.SelectedIndex = -1


    End Sub

    Private Sub SavePicture()

        '      If SelectedImage = True Then

        If clsDBConn.ServerName = "localhost" Then

            'Save Picture CurrentDirectory
            Dim dir As String = Directory.GetCurrentDirectory & "\PIC"

            If (Not System.IO.Directory.Exists(Path.Combine(dir, "GRADUATE"))) Then
                System.IO.Directory.CreateDirectory(Path.Combine(dir, "GRADUATE"))
                dir = dir & "\" & "GRADUATE\"
            End If

            _photo_path = dir & _view.cmbStudent.Text & ".jpeg"

            Dim _Image As Image
            _Image = _view.PictureBox1.Image
            _view.PictureBox1.Image = _Image
            If Not File.Exists(_photo_path) Then
                _view.PictureBox1.Image.Save(_photo_path)
            End If

            '     SaveImage_Global(PERSON_ID, "GRADUATE", "Graduated Image", _photo_path, _photo_filename)


        Else

            If SavingDir = "local.dir" Then
                'Save Picture CurrentDirectory
                Dim dir As String = Directory.GetCurrentDirectory & "\PIC"

                If (Not System.IO.Directory.Exists(Path.Combine(dir, "GRADUATE"))) Then
                    System.IO.Directory.CreateDirectory(Path.Combine(dir, "GRADUATE"))
                End If

                _photo_path = dir & _photo_filename

                Dim _Image As Image
                _Image = _view.PictureBox1.Image
                _view.PictureBox1.Image = _Image
                If Not File.Exists(_photo_path) Then
                    _view.PictureBox1.Image.Save(_photo_path)
                End If

                '   SaveImage_Global(PERSON_ID, "GRADUATE", "Graduated Image", _photo_path, _photo_filename)

            Else
                'Save Picture to Server

                Dim appSettings As String = ConfigurationManager.AppSettings("Server_GRADUATE_Path")
                Dim directory_info As DirectoryInfo = New DirectoryInfo(appSettings)
                Dim target_path As String = ""
                Try

                    target_path = directory_info.FullName & "\" & _photo_filename
                    If Not File.Exists(target_path) Then
                        Dim document As FileStream
                        document = File.Create(target_path)
                        document.Close()
                    End If

                    If _photo_path <> target_path Then
                        System.IO.File.Copy(_photo_path, target_path.ToString, True)
                    End If

                    '   SaveImage_Global(PERSON_ID, "GRADUATE", "Graduated Image", target_path, _photo_filename)

                Catch ex As Exception
                    MsgBox(ex.Message)
                End Try
            End If

        End If
        '     End If

    End Sub

    Dim Print As New TORDetails

    Private Sub PrintTOR(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Print.PreviewTOR_DJEMFCST(_view.cmbStudent.SelectedValue, _view.txtPurpose.Text, _view.txtGraduated.Text, _view.txtNSTP.Text, subject_code)

        Cursor.Current = Cursors.Default

    End Sub

    Private Sub SelectedStudent(sender As Object, e As EventArgs)

        _view.Panel7.Enabled = True

        PERSON_ID = _view.cmbStudent.SelectedValue
        loadTOR(_view.cmbStudent.SelectedValue)
        '     loadStudentAcademic()

    End Sub

    Private Sub loadStudentAcademic()

        Dim dt As New DataTable
        dt = RecordModel.getAcademicDetails(PERSON_ID)

        If dt.Rows.Count > 0 Then

            _view.txtCourseName.Text = dt(0)("course_name")

            _view.cmbBatch.DataSource = dt
            _view.cmbBatch.ValueMember = "id"
            _view.cmbBatch.DisplayMember = "name"
            _view.cmbBatch.SelectedIndex = -1

            _view.cmbYearLevel1.SelectedIndex = -1
            _view.cmbSemester1.SelectedIndex = -1
            _view.cmbAcademicYear1.SelectedIndex = -1


            '_view.cmbYearLevel1.DataSource = dt
            '_view.cmbYearLevel1.ValueMember = "id"
            '_view.cmbYearLevel1.DisplayMember = "year_level"
            '_view.cmbYearLevel1.SelectedIndex = -1

            '_view.cmbSemester1.DataSource = dt
            '_view.cmbSemester1.ValueMember = "id"
            '_view.cmbSemester1.DisplayMember = "semester"
            '_view.cmbSemester1.SelectedIndex = -1

            '_view.cmbAcademicYear1.DataSource = dt
            '_view.cmbAcademicYear1.ValueMember = "id"
            '_view.cmbAcademicYear1.DisplayMember = "academice_year"
            '_view.cmbAcademicYear1.SelectedIndex = -1

        End If

    End Sub

    Dim subject_id As Integer = 0
    Private Sub loadTOR(personID As Object)

        Dim dt As New DataTable
        dt = RecordModel.getTOR(personID)
        If dt.Rows.Count > 0 Then

            _view.gcTOR.DataSource = dt

            DesignGridView(_view.gvTOR)

            _view.gvTOR.Columns("SchoolName").GroupIndex = 0
            _view.gvTOR.Columns("SchoolAddress").GroupIndex = 1
            _view.gvTOR.Columns("SemAY").GroupIndex = 2

            dt = Nothing

            dt = RecordModel.TORRemarks(personID)
            If dt.Rows.Count > 0 Then
                Try
                    _view.txtPurpose.Text = If(IsDBNull(dt(0)("remarks_purpose").ToString), "", dt(0)("remarks_purpose").ToString)
                    _view.txtGraduated.Text = If(IsDBNull(dt(0)("remarks_graduate").ToString), "", dt(0)("remarks_graduate").ToString)
                    _view.txtNSTP.Text = If(IsDBNull(dt(0)("remarks_nstp").ToString), "", dt(0)("remarks_nstp").ToString)
                    subject_code = If(IsDBNull(dt(0)("subject_code").ToString), "", dt(0)("subject_code").ToString)
                    NSTP_CODE = subject_code
                    subject_id = If(IsDBNull(dt(0)("subject_id").ToString), "", dt(0)("subject_id").ToString)
                    _view.cmbSubject.SelectedValue = subject_id
                    graduate_status = If(IsDBNull(dt(0)("graduated").ToString), 0, dt(0)("graduated").ToString)
                    _view.txtFilePath.Text = If(IsDBNull(dt(0)("photo_path").ToString), 0, dt(0)("photo_path").ToString)
                    If graduate_status = 1 Then
                        _view.chkGraduate.Checked = True
                        _view.dtpDateGraduation.Value = If(IsDBNull(dt(0)("date_graduation").ToString), "", dt(0)("date_graduation").ToString)
                    End If
                Catch ex As Exception

                End Try

            End If


        Else
            '         MsgBox("Record NOT FOUND...!!!", MsgBoxStyle.Critical, "RECORD NOT FOUND")
        End If

        _view.gvTOR.ExpandAllGroups()

    End Sub

    Private Sub DesignGridView(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)

        view.BeginUpdate()

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                'Case 0, 1, 2, 3, 4, 5, 6, 7, 8
                '    view.Columns(i).Visible = False
                Case 9
                    view.Columns(i).Caption = "COURSE CODE"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 150
                Case 10
                    view.Columns(i).Caption = "DESCRIPTION OF COURSES"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).Width = 250
                Case 11
                    view.Columns(i).Caption = "FINAL"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 150
                Case 12
                    view.Columns(i).Caption = "RE-EXAM"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 150
                Case 13
                    view.Columns(i).Caption = "CREDIT"
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 150
                Case Else
                    view.Columns(i).Visible = False
            End Select

        Next

        view.EndUpdate()



    End Sub

    Dim expand As Integer = 0
    Private Sub btnAdd_Click(sender As Object, e As EventArgs)

        If expand = 0 Then
            _view.expBackTrack.Expanded = True
            expand = 1
        Else
            _view.expBackTrack.Expanded = False
            expand = 0
        End If

    End Sub

    Private Sub loadComboBox()

        _view.cmbStudent.DataSource = RecordModel.getStudent()
        _view.cmbStudent.ValueMember = "id"
        _view.cmbStudent.DisplayMember = "name"
        _view.cmbStudent.SelectedIndex = -1

        _view.cmbSubject.DataSource = RecordModel.getSubject()
        _view.cmbSubject.ValueMember = "id"
        _view.cmbSubject.DisplayMember = "name"
        _view.cmbSubject.SelectedIndex = -1

        _view.cmbYearLevel.DataSource = RecordModel.getYearLevel(13)
        _view.cmbYearLevel.ValueMember = "id"
        _view.cmbYearLevel.DisplayMember = "name"
        _view.cmbYearLevel.SelectedIndex = -1
    End Sub
End Class
