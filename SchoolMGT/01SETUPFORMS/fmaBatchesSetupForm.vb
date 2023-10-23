Imports System.ComponentModel
Imports MySql.Data.MySqlClient

Public Class fmaBatchesSetupForm

    Public WithEvents clsGroup As clsData

    Public Event DB_MODIFIED()
    Public Event SETUP_CLOSED()

    Public OPERATION As String = ""
    Public batch_name As String = ""
    Dim FirstLoad As Boolean = True
#Region "Classes"
    Private Sub AttachClasses()
        clsGroup = New clsData(Me.txtSysPK, clsDBConn)
        clsGroup.AttachUserPK = Me.txtid

        clsGroup.AttachControl = Me.txtcoursename
        clsGroup.AttachControl = Me.txtcourse_id
        clsGroup.AttachControl = Me.txtname
        clsGroup.AttachControl = Me.txtyear_level
        clsGroup.AttachControl = Me.txtschool_year
        clsGroup.AttachControl = Me.txtsemester
        clsGroup.AttachControl = Me.txtgrade_dist_from
        clsGroup.AttachControl = Me.txtgrade_dist_to

        '      getCourseGrade()
        'Handles Add,Save and Delete
        clsGroup.AttachAddButton = Me.btnAdd
        clsGroup.AttachSaveButton = Me.btnSave
        clsGroup.AttachModifyButton = Me.btnModify

        clsGroup.Initialize() 'Always naa gyud ni siya at the end......


    End Sub

    Private Sub DetachClasses()
        clsGroup = Nothing
    End Sub
#End Region

    Private Sub fmaEmployeeSetupForm_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        Me.DetachClasses()
        RaiseEvent SETUP_CLOSED()
    End Sub


    Private Sub fmaEmployeeSetupForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        FirstLoadBatch = True

        If OPERATION = "ADD" Then
            Dim yearInit As Integer = 1900
            yearInit = CInt(Date.Now.Year)
            txtschool_year1.Value = yearInit
            txtschool_year2.Value = yearInit

        End If

        loadCategory()

        getCourseGrade()

        year_level()

        loadsemester()

        Me.AttachClasses()

        If Me.OPERATION = "ADD" Then
            Me.btnAdd.PerformClick()
            FirstLoadBatch = False
        ElseIf Me.OPERATION = "EDIT" Then
            Me.btnModify.PerformClick()
            cmbCategory.SelectedValue = _student_category_id
        End If


    End Sub

    Private Sub loadCategory()

        cmbCategory.DataSource = DataSource(String.Format("SELECT
	                                student_categories.id, 
	                                student_categories.`name`
                                FROM
	                                student_categories"))
        cmbCategory.ValueMember = "id"
        cmbCategory.DisplayMember = "name"
        cmbCategory.SelectedIndex = -1
    End Sub

    Private Sub loadsemester()


        Dim SQLEX As String = "       SELECT 0 AS 'id','1ST SEMESTER' AS 'name' 
                                     UNION			 	 	 
                                     SELECT 1 AS 'id','2ND SEMESTER' AS 'name'
                                     UNION			 	 	 
                                     SELECT 2 AS 'id','SUMMER' AS 'name'
                                     UNION			 	 	 
                                     SELECT 3 AS 'id','YEARLY' AS 'name'"
        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)

        txtsemester.DataSource = MeData

        txtsemester.ValueMember = "id"
        txtsemester.DisplayMember = "name"

        txtsemester.SelectedIndex = -1

    End Sub

    Private Function getSemester() As Object
        Dim sql As String = ""
        sql = "
             SELECT 0 AS 'id','1ST SEMESTER' AS 'name' 
             UNION			 	 	 
             SELECT 1 AS 'id','2ND SEMESTER' AS 'name'
             UNION			 	 	 
             SELECT 2 AS 'id','SUMMER' AS 'name'
             UNION			 	 	 
             SELECT 3 AS 'id','YEAR' AS 'name'"
        Return DataSource(sql)
    End Function

    Public Sub year_level()

        Dim SQLEX As String = "SELECT year_level.id, year_level.year_level AS `name` FROM  year_level"
        Dim MeData As DataTable

        MeData = clsDBConn.ExecQuery(SQLEX)

        txtyear_level.DataSource = MeData

        txtyear_level.ValueMember = "id"
        txtyear_level.DisplayMember = "name"

        txtyear_level.SelectedIndex = -1
        '      txtcourse_id.Text = ""


    End Sub

    Private Function loadYearLevel() As Object
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
            year_level.id,
            year_level.year_level AS `name`
            FROM
            year_level
            "))
        Return dt

    End Function

    Private Sub getCourseGrade()

        Dim SQLEX As String = "SELECT id,course_name,code from courses"
        SQLEX += " WHERE is_deleted <> 1 and category_id = '" & _catID & "'  GROUP BY course_name "
        SQLEX += " ORDER BY course_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        txtcoursename.DataSource = MeData

        txtcoursename.ValueMember = "id"
        txtcoursename.DisplayMember = "course_name"

        txtcoursename.SelectedIndex = -1
        txtcourse_id.Text = ""
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub

    Private Sub clsGroup_AfterDelete() Handles clsGroup.AfterDelete
        RaiseEvent DB_MODIFIED()

    End Sub

    Private Sub clsGroup_AfterRecordSave() Handles clsGroup.AfterRecordSave
        RaiseEvent DB_MODIFIED()

        If Me.OPERATION = "ADD" Then
            Me.btnAdd.PerformClick()
        ElseIf Me.OPERATION = "EDIT" Then
            Me.Close()
        End If

    End Sub


    Private Sub clsGroup_BeforeRecordSave() Handles clsGroup.BeforeRecordSave
        If Me.txtname.Text = "" Or Me.txtsemester.Text = "" Then
            MsgBox("Course Cannot be blank.", MsgBoxStyle.Critical)
            Me.DetachClasses()
            Me.AttachClasses()

            If Me.OPERATION = "ADD" Then
                Me.btnAdd.PerformClick()
            ElseIf Me.OPERATION = "EDIT" Then
                Me.btnModify.PerformClick()
            End If
        End If



    End Sub

    Public _dummyname As String

    Dim _course As String

    Private Sub txtcoursename_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtcoursename.SelectedIndexChanged

        If FirstLoadBatch = False Then

            Try
                Dim drv As DataRowView = DirectCast(txtcoursename.SelectedItem, DataRowView)
                txtcourse_id.Text = drv.Item("id").ToString
                '     _course = drv.Item("code").ToString & " - "
                _dummyname = drv.Item("code").ToString & " - "
                Me.txtname.Text = _dummyname
                _dummyname = ""
            Catch ex As Exception

            End Try



        End If

    End Sub



    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        'Dim _semister As String = ""
        'If selectedControls Then
        '    txtname.Text = _dummyname
        'Else
        '    If OPERATION = "ADD" Then
        '        If txtyear_level.Text.Length > 0 Then
        '            If txtsemester.Text.Length > 0 Then
        '                _semister = getSemister(txtsemester.Text)
        '                txtname.Text = _course & str_year & " " & _semister & " " & school_year
        '            Else
        '                txtname.Text = _course & str_year & " " & " " & school_year
        '            End If
        '        Else
        '            txtname.Text = _course & txtsemester.Text & " " & " " & school_year
        '        End If

        '    End If
        'End If

    End Sub


    Private Function convertTxt(text As String) As String
        Dim str As String = ""
        If text.Contains("1ST") Then
            str = "1st Year"
        ElseIf text.Contains("2ND") Then
            str = "2nd Year"
        ElseIf text.Contains("3RD") Then
            str = "3rd Year"
        ElseIf text.Contains("4TH") Then
            str = "4th Year"
        ElseIf text.Contains("5TH") Then
            str = "5th Year"
        ElseIf text.Contains("6TH") Then
            str = "6th Year"
        ElseIf text.Contains("7TH") Then
            str = "7th Year"
        ElseIf text.Contains("8TH") Then
            str = "8th Year"
        ElseIf text.Contains("9TH") Then
            str = "9th Year"
        ElseIf text.Contains("10TH") Then
            str = "10th Year"
        ElseIf text.Contains("11TH") Then
            str = "11th Year"
        ElseIf text.Contains("12TH") Then
            str = "12th Year"
        Else
            str = text
        End If
        Return str
    End Function


    Private Function getCategory(text As String) As Boolean
        Dim value As Integer = DataObject(String.Format("SELECT courses.category_id FROM courses WHERE courses.id = " & text & ""))
        If value = 13 Then
            Return True
        Else
            Return False
        End If
    End Function

    Dim _yearlevel As String
    Private Sub txtyear_level_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtyear_level.SelectedIndexChanged

        If FirstLoadBatch = False Then
            Try
                Dim drv As DataRowView = DirectCast(txtyear_level.SelectedItem, DataRowView)
                _yearlevel = drv.Item("name").ToString
                convertTxt(_yearlevel)
                _dummyname = Me.txtname.Text
                Me.txtname.Text = _dummyname & " " & convertTxt(_yearlevel)
                _dummyname = ""

            Catch ex As Exception

            End Try
        End If



    End Sub

    Dim _semester As String
    Private Sub txtsemester_SelectedIndexChanged(sender As Object, e As EventArgs) Handles txtsemester.SelectedIndexChanged

        If FirstLoadBatch = False Then
            Try
                Dim drv As DataRowView = DirectCast(txtsemester.SelectedItem, DataRowView)
                _semester = drv.Item("name")
                _dummyname = Me.txtname.Text
                txtschool_year.Text = txtschool_year1.Value
                Me.txtname.Text = _dummyname & " " & getSemister(_semester) & " (" & txtschool_year1.Value & ")"
                _dummyname = ""

            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If


    End Sub

    Private Function getSemister(text As String) As String
        Dim str As String = ""
        If text.Contains("1ST") Then
            str = "1st Sem"
        ElseIf text.Contains("2ND") Then
            str = "2nd Sem"
        ElseIf text.Contains("SUMMER") Then
            str = "Summer"
        Else
            str = "YEARLY"
        End If
        Return str
    End Function

    Dim _catID As Integer
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged

        If FirstLoadBatch = False Then
            Try
                Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
                _catID = drv.Item("id").ToString
                getCourseGrade()
            Catch ex As Exception

            End Try
        End If


    End Sub



End Class