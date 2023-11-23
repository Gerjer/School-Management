Imports System.Threading
Imports System.ComponentModel
Imports DevExpress.Data
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraReports.UI
Imports System.IO
Imports DevExpress.XtraPrinting.Drawing
Imports DevExpress.XtraPrinting
Imports C1.Win.C1TrueDBGrid
Imports DevExpress.XtraGrid.Views.Grid

Public Class fmaStudentListForm

    Dim gradingPeriodGrades As New fmaStudentsGradingPeriod
    Dim subjectList As New fmaStudentsSubjectListForm
    Private m_AsyncWorker As New BackgroundWorker()

    Private Sub fmaStudentListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Privilege_TypeUser = Button_Privilege(LoginUserID)
        If Privilege_TypeUser IsNot Nothing Then
            btndelete.Visible = True
            btnRetrieve.Visible = True
            chkViewDeleted.Visible = True
        End If


        'AssignScheduleToolStripMenuItem.Visible = True
        'ASSESSMENTToolStripMenuItem.Visible = True
        'ViewGradesToolStripMenuItem.Visible = True
        'PreviewCORToolStripMenuItem.Visible = True


        If Me.Tag = 1 Then
            LabelControl1.Text = "STUDENT GRADE LIST"
            LabelX7.Text = "Double Click on Students in the list to Enter Grades . . ."

            ViewGradesToolStripMenuItem.Visible = True
            AssignScheduleToolStripMenuItem.Visible = False
            ASSESSMENTToolStripMenuItem.Visible = False
            PreviewCORToolStripMenuItem.Visible = False
            STUDETNADMISSIONToolStripMenuItem.Visible = False
            STUDETNADMISSIONToolStripMenuItem.Enabled = False
            SUBJECTACCESSToolStripMenuItem.Visible = False
            STUDENTPROFILEToolStripMenuItem.Visible = False
            SCHOLARSHIPASSIGNINGToolStripMenuItem.Visible = False
            SUBJECTACCESSToolStripMenuItem.Visible = False


        ElseIf Me.Tag = 2 Then
                LabelControl1.Text = "PRE-ADMISSION LIST"
                LabelX7.Text = "Double Click on Students in the list to Enter Subjects . . ."

                AssignScheduleToolStripMenuItem.Visible = True
                ViewGradesToolStripMenuItem.Visible = False
                ASSESSMENTToolStripMenuItem.Visible = False
                PreviewCORToolStripMenuItem.Visible = False
                STUDETNADMISSIONToolStripMenuItem.Visible = True
                STUDETNADMISSIONToolStripMenuItem.Enabled = True
                STUDENTPROFILEToolStripMenuItem.Visible = True
                SCHOLARSHIPASSIGNINGToolStripMenuItem.Visible = True
                SUBJECTACCESSToolStripMenuItem.Visible = True
            Else
                LabelControl1.Text = "STUDENT ASSESSMENT LIST"
            LabelX7.Text = "Double Click on Students in the to view Assessment . . ."

            ASSESSMENTToolStripMenuItem.Visible = True
            AssignScheduleToolStripMenuItem.Visible = False
            ViewGradesToolStripMenuItem.Visible = False
            PreviewCORToolStripMenuItem.Visible = False
            STUDETNADMISSIONToolStripMenuItem.Visible = False
            STUDETNADMISSIONToolStripMenuItem.Enabled = False
            STUDENTPROFILEToolStripMenuItem.Visible = False
            SCHOLARSHIPASSIGNINGToolStripMenuItem.Visible = False
            SUBJECTACCESSToolStripMenuItem.Visible = False
        End If

        lblStatus.Text = "Waiting ..."

        If AuthUserType = "USER" Then
            cmbyearbatch.DataSource = DataSource(String.Format("SELECT 
	                        batches.id,
	                        batches.school_year 'name'
                        FROM
	                        student_categories
	                        INNER JOIN courses ON student_categories.id = courses.category_id
	                        INNER JOIN batches ON courses.id = batches.course_id
	                        INNER JOIN students_subjects ON batches.id = students_subjects.batch_id
	                        INNER JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
	
	                        WHERE subject_class_schedule.employee_id = '" & AppSetup_Domain & "'
	                        GROUP BY batches.school_year
	                        ORDER BY school_year
                                    "))
            cmbyearbatch.ValueMember = "id"
            cmbyearbatch.DisplayMember = "name"
            cmbyearbatch.SelectedIndex = -1

        Else
            cmbyearbatch.DataSource = DataSource(String.Format("SELECT DISTINCT
                                    1 as 'id',
                                    batches.school_year 'name'
                                    FROM
                                    batches
                                    WHERE school_year is NOT NULL
                                    ORDER BY school_year DESC
                                    "))
            cmbyearbatch.ValueMember = "id"
            cmbyearbatch.DisplayMember = "name"
            cmbyearbatch.SelectedIndex = -1
        End If


        displayCategory()
        displayCourse()
        displayBatches()


        If AuthUserType = "ADMIN" Then
            AssignScheduleToolStripMenuItem.Visible = True
            ViewGradesToolStripMenuItem.Visible = True
            ASSESSMENTToolStripMenuItem.Visible = True
            PreviewCORToolStripMenuItem.Visible = True
            STUDETNADMISSIONToolStripMenuItem.Visible = True
            STUDETNADMISSIONToolStripMenuItem.Enabled = True
            STUDENTPROFILEToolStripMenuItem.Visible = True
            SCHOLARSHIPASSIGNINGToolStripMenuItem.Visible = True
            SUBJECTACCESSToolStripMenuItem.Visible = True
        End If




    End Sub

    Private Sub displayCategory()

        If AuthUserType = "USER" Then

            cmbCategory.DataSource = DataSource(String.Format("SELECT DISTINCT
                                student_categories.id,
                                student_categories.`name`
                                FROM
	                                student_categories
	                                INNER JOIN courses ON student_categories.id = courses.category_id
	                                INNER JOIN batches ON courses.id = batches.course_id
	                                INNER JOIN students_subjects ON batches.id = students_subjects.batch_id
	                                INNER JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
	
	                                WHERE subject_class_schedule.employee_id = '" & AppSetup_Domain & "'
	
                                                    "))

            cmbCategory.DisplayMember = "name"
            cmbCategory.ValueMember = "id"
            cmbCategory.SelectedIndex = -1

        Else
            cmbCategory.DataSource = DataSource(String.Format("SELECT
	                                                    student_categories.id, 
	                                                    student_categories.`name`
                                                    FROM
	                                                    student_categories
                                                    WHERE is_deleted = 0
                                                    "))

            cmbCategory.DisplayMember = "name"
            cmbCategory.ValueMember = "id"
            cmbCategory.SelectedIndex = -1
        End If



    End Sub

    Private Sub displayCourse()

        If AuthUserType = "USER" Then
            Dim SQLEX As String = "SELECT DISTINCT
	                                courses.id,
	                                courses.course_name
                                FROM
	                                student_categories
	                                INNER JOIN courses ON student_categories.id = courses.category_id
	                                INNER JOIN batches ON courses.id = batches.course_id
	                                INNER JOIN students_subjects ON batches.id = students_subjects.batch_id
	                                INNER JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
	
	                                WHERE subject_class_schedule.employee_id = '" & AppSetup_Domain & "' AND student_categories.id =  '" & CatID & "'

	                                ORDER BY courses.id"


            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            cmbCourse.DataSource = MeData

            cmbCourse.ValueMember = "id"
            cmbCourse.DisplayMember = "course_name"

            cmbCourse.SelectedIndex = -1
            txtCourseID.Text = ""
        Else
            Dim SQLEX As String = "SELECT id, course_name  FROM courses"
            SQLEX += " WHERE is_deleted <> 1 and category_id = '" & CatID & "'"
            SQLEX += " GROUP BY course_name"
            SQLEX += " ORDER BY course_name"

            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            cmbCourse.DataSource = MeData

            cmbCourse.ValueMember = "id"
            cmbCourse.DisplayMember = "course_name"

            cmbCourse.SelectedIndex = -1
            txtCourseID.Text = ""
        End If





        tdbViewer.DataSource = Nothing
    End Sub


    Private Sub displayBatches()

        If AuthUserType = "USER" Then
            Dim SQLEX As String = "SELECT 
	                    batches.id,
	                    batches.`name`
                    FROM
	                    student_categories
	                    INNER JOIN courses ON student_categories.id = courses.category_id
	                    INNER JOIN batches ON courses.id = batches.course_id
	                    INNER JOIN students_subjects ON batches.id = students_subjects.batch_id
	                    INNER JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
	
	                    WHERE subject_class_schedule.employee_id = '" & AppSetup_Domain & "' AND courses.id  ='" & Me.txtCourseID.Text & "' AND school_year = '" & _school_year & "'
	                    GROUP BY batches.id
	                    ORDER BY batches.`name`,batches.semester,batches.year_level"

            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            cmbBatch.DataSource = MeData

            cmbBatch.ValueMember = "id"
            cmbBatch.DisplayMember = "name"

            cmbBatch.SelectedIndex = -1
            txtBatchID.Text = ""



        Else
            Dim SQLEX As String = ""

            SQLEX = "SELECT batches.id, name, year_level FROM batches"
            SQLEX += " INNER JOIN courses"
            SQLEX += " ON (batches.course_id = courses.id)"
            SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"

            SQLEX += " AND course_id ='" & Me.txtCourseID.Text & "' AND school_year = '" & _school_year & "'  ORDER BY semester "
            Dim MeData As DataTable
            MeData = clsDBConn.ExecQuery(SQLEX)

            cmbBatch.DataSource = MeData

            cmbBatch.ValueMember = "id"
            cmbBatch.DisplayMember = "name"

            cmbBatch.SelectedIndex = -1
            txtBatchID.Text = ""

        End If


    End Sub

    Dim dt_record As New DataTable

    Public Sub displayFilterCategory()

        Dim tbl As String = ""
        If chkViewDeleted.Checked = True Then
            tbl = "  students_deleted  "
        Else
            tbl = "  students  "
        End If

        Me.tdbViewer.DataSource = Nothing

        Dim SQLEX As String = ""
        SQLEX += " SELECT " & tbl & ".id," & tbl & ".admission_no," & tbl & ".std_number"
        SQLEX += " , " & tbl & ".scholarshipgrant,REPLACE ( person.last_name, 'Ã±', 'ñ' ) AS 'last_name'"
        SQLEX += " , person.first_name,person.middle_name"
        SQLEX += " , courses.course_name"
        SQLEX += " , batches.`name` 'batchname',batches.`id` 'batch_id'," & tbl & ".year_level,batches.school_year," & tbl & ".semester"
        SQLEX += " , student_categories.name 'categoryname'"
        SQLEX += " , student_categories.id 'categoryid',"
        'SQLEX += " , students.id 'categoryid'"
        'SQLEX += " , IF(is_enrolled = 1, 'ENROLLED', 'NOT ENROLLED') 'status'"
        SQLEX += " Case is_enrolled"
        SQLEX += " WHEN 1 THEN 'ENROLLED'"
        SQLEX += " WHEN 2 THEN 'WITHDRAWN'"
        SQLEX += " Else 'NOT ENROLLED'"
        SQLEX += " End As 'status',person.person_id," & tbl & ".enrollmentAS"

        SQLEX += " FROM " & tbl & ""
        SQLEX += " INNER JOIN person"
        SQLEX += " ON (" & tbl & ".person_id = person.person_id AND " & tbl & ".status_type_id = 1 AND person.end_time IS NULL)"
        SQLEX += " INNER JOIN student_categories "
        SQLEX += " ON (" & tbl & ".student_category_id = student_categories.id)"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (" & tbl & ".batch_id = batches.id)"
        SQLEX += " INNER JOIN courses "
        SQLEX += " ON (batches.course_id = courses.id)"

        If AuthUserType = "USER" Then
            SQLEX += " INNER JOIN students_subjects ON  students.id = students_subjects.student_id "
            SQLEX += " INNER JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id =  subject_class_schedule.SysPK_Item"
        End If

        SQLEX += " WHERE courses.id='" & txtCourseID.Text & "'"

        If cmbyearbatch.Text <> "" Then
            SQLEX += " AND batches.school_year ='" & cmbyearbatch.Text & "'"
        End If

        If txtBatchID.Text <> "" Then
            SQLEX += " AND batches.id='" & txtBatchID.Text & "'"
        End If


        If AuthUserType = "USER" Then
            SQLEX += " AND subject_class_schedule.employee_id  = '" & AppSetup_Domain & "'"
        End If


        SQLEX += " ORDER BY last_name"


        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)
        dt_record = MeData
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)



        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False
                .DisplayColumns("person_id").Visible = False

                .DisplayColumns("admission_no").DataColumn.Caption = "ADMISSION NUMBER"
                .DisplayColumns("admission_no").Width = 110
                .DisplayColumns("admission_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("admission_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("admission_no").Locked = True

                .DisplayColumns("std_number").DataColumn.Caption = "ID NUMBER"
                .DisplayColumns("std_number").Width = 100
                .DisplayColumns("std_number").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("std_number").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("scholarshipgrant").DataColumn.Caption = "GRANT"
                .DisplayColumns("scholarshipgrant").Width = 150
                .DisplayColumns("scholarshipgrant").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("scholarshipgrant").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("last_name").DataColumn.Caption = "LAST NAME"
                .DisplayColumns("last_name").Width = 150
                .DisplayColumns("last_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("last_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("first_name").DataColumn.Caption = "FIRST NAME"
                .DisplayColumns("first_name").Width = 150
                .DisplayColumns("first_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("first_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("middle_name").DataColumn.Caption = "MIDDLE NAME"
                .DisplayColumns("middle_name").Width = 150
                .DisplayColumns("middle_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("middle_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("course_name").DataColumn.Caption = "COURSE"
                .DisplayColumns("course_name").Width = 140
                .DisplayColumns("course_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("course_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("batchname").DataColumn.Caption = "BATCH"
                .DisplayColumns("batchname").Width = 230
                .DisplayColumns("batchname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("batchname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("batch_id").Visible = False

                .DisplayColumns("year_level").DataColumn.Caption = "YEAR LEVEL"
                .DisplayColumns("year_level").Width = 100
                .DisplayColumns("year_level").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("year_level").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("school_year").Visible = False

                .DisplayColumns("semester").DataColumn.Caption = "SEMESTER"
                .DisplayColumns("semester").Width = 110
                .DisplayColumns("semester").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("semester").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("categoryname").Visible = False
                .DisplayColumns("categoryid").Visible = False

                .DisplayColumns("status").DataColumn.Caption = "STATUS"
                .DisplayColumns("status").Width = 100
                .DisplayColumns("status").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("status").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("enrollmentAS").DataColumn.Caption = "ENROLLED AS"
                .DisplayColumns("enrollmentAS").Width = 80
                .DisplayColumns("enrollmentAS").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("enrollmentAS").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near
            End With
        Catch ex As Exception

        End Try



    End Sub

    Public Function StudentNameFilter(str As String)
        Dim dt_new As New DataTable
        dt_new = likes(dt_record, "last_name", str.ToUpper)

        Dim MeData As DataTable
        MeData = dt_new
        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)


        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False
                .DisplayColumns("person_id").Visible = False

                .DisplayColumns("admission_no").DataColumn.Caption = "ADMISSION NUMBER"
                .DisplayColumns("admission_no").Width = 110
                .DisplayColumns("admission_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("admission_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("std_number").DataColumn.Caption = "ID NUMBER"
                .DisplayColumns("std_number").Width = 100
                .DisplayColumns("std_number").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("std_number").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("scholarshipgrant").DataColumn.Caption = "GRANT"
                .DisplayColumns("scholarshipgrant").Width = 150
                .DisplayColumns("scholarshipgrant").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("scholarshipgrant").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("last_name").DataColumn.Caption = "LAST NAME"
                .DisplayColumns("last_name").Width = 150
                .DisplayColumns("last_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("last_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("first_name").DataColumn.Caption = "FIRST NAME"
                .DisplayColumns("first_name").Width = 150
                .DisplayColumns("first_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("first_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("middle_name").DataColumn.Caption = "MIDDLE NAME"
                .DisplayColumns("middle_name").Width = 150
                .DisplayColumns("middle_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("middle_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("course_name").DataColumn.Caption = "COURSE"
                .DisplayColumns("course_name").Width = 140
                .DisplayColumns("course_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("course_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("batchname").DataColumn.Caption = "BATCH"
                .DisplayColumns("batchname").Width = 230
                .DisplayColumns("batchname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("batchname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("batch_id").Visible = False

                .DisplayColumns("year_level").DataColumn.Caption = "YEAR LEVEL"
                .DisplayColumns("year_level").Width = 100
                .DisplayColumns("year_level").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("year_level").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("school_year").Visible = False

                .DisplayColumns("semester").DataColumn.Caption = "SEMESTER"
                .DisplayColumns("semester").Width = 110
                .DisplayColumns("semester").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("semester").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("categoryname").Visible = False
                .DisplayColumns("categoryid").Visible = False

                .DisplayColumns("status").DataColumn.Caption = "STATUS"
                .DisplayColumns("status").Width = 100
                .DisplayColumns("status").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("status").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("enrollmentAS").DataColumn.Caption = "ENROLLED AS"
                .DisplayColumns("enrollmentAS").Width = 80
                .DisplayColumns("enrollmentAS").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("enrollmentAS").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near
            End With

        Catch ex As Exception

        End Try


        Return Nothing
    End Function


    Private Function likes(ByVal dt As DataTable, ByVal column As String, ByVal value As String)
        Dim result = dt.Clone()
        For Each row As DataRow In From row1 As DataRow In dt.Rows Where (row1(column).Contains(value))
            result.ImportRow(row)
        Next
        Return result
    End Function

    Private Sub cmbCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            Me.txtCourseID.Text = drv.Item("id").ToString
            _courseID = drv.Item("id").ToString
            cmbBatch.Enabled = True

        Catch ex As Exception
            Me.txtCourseID.Text = ""
        End Try

    End Sub

    Private Sub cmbBatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbBatch.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
            Me.txtBatchID.Text = drv.Item("id").ToString
            _batchID = drv.Item("id").ToString
        Catch ex As Exception
            Me.txtBatchID.Text = ""
        End Try

    End Sub

    Public Sub btnSearchCondition_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearchCondition.Click

        displayFilterCategory()

        'If txtStudentName.Text.Length > 0 Then
        '    SearchStudentName()
        'Else
        '    displayFilterCategory()
        'End If

    End Sub

    Private Sub txtStudentName_KeyUp(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles txtStudentName.KeyUp
        If e.KeyCode = Keys.Enter Then
            SearchStudentName()
        End If
    End Sub


    Private Sub txtStudentName_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtStudentName.TextChanged
        'If txtStudentName.Text.Length > 0 Then
        '    displayCourse()
        '    displayBatches()
        'End If

        StudentNameFilter(txtStudentName.Text)

    End Sub

    Private Sub btnClearFilter_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClearFilter.Click
        lblStatus.Text = "Waiting ..."
        txtStudentName.Text = ""
        displayCourse()
        displayBatches()

        tdbViewer.DataSource = Nothing
    End Sub

    Private Sub SearchStudentName()
        Me.tdbViewer.DataSource = Nothing

        Dim SQLEX As String = ""
        SQLEX += " SELECT students.id,students.admission_no,students.std_number"
        SQLEX += " , students.scholarshipgrant,REPLACE ( person.last_name, 'Ã±', 'ñ' ) AS 'last_name'"
        SQLEX += " , person.first_name,person.middle_name"
        SQLEX += " , courses.course_name"
        SQLEX += " , batches.`name` 'batchname',batches.`name` 'batch_id',students.year_level,batches.school_year,students.semester"
        SQLEX += " , student_categories.name 'categoryname'"
        SQLEX += " , student_categories.id 'categoryid'"
        SQLEX += " , IF(is_enrolled = 1, 'enrolled', 'not enrolled') 'status'"
        SQLEX += " FROM students"
        SQLEX += " INNER JOIN person"
        SQLEX += " ON (students.person_id = person.person_id AND students.status_type_id = 1 AND person.end_time IS NULL)"
        SQLEX += " INNER JOIN student_categories "
        SQLEX += " ON (students.student_category_id = student_categories.id)"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (students.batch_id = batches.id)"
        SQLEX += " INNER JOIN courses "
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE "
        SQLEX += " last_name LIKE '%" & txtStudentName.Text & "%'"
        SQLEX += " or first_name LIKE '%" & txtStudentName.Text & "%'"
        SQLEX += " or middle_name LIKE '%" & txtStudentName.Text & "%'"

        SQLEX += " ORDER BY last_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Me.tdbViewer.DataSource = MeData
        Me.tdbViewer.Rebind(True)

        Try
            With tdbViewer.Splits(0)
                .DisplayColumns("id").Visible = False

                .DisplayColumns("admission_no").DataColumn.Caption = "ADMISSION NUMBER"
                .DisplayColumns("admission_no").Width = 100
                .DisplayColumns("admission_no").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("admission_no").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("std_number").DataColumn.Caption = "ID NUMBER"
                .DisplayColumns("std_number").Width = 100
                .DisplayColumns("std_number").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("std_number").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("scholarshipgrant").DataColumn.Caption = "GRANT"
                .DisplayColumns("scholarshipgrant").Width = 100
                .DisplayColumns("scholarshipgrant").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("scholarshipgrant").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center

                .DisplayColumns("last_name").DataColumn.Caption = "LAST NAME"
                .DisplayColumns("last_name").Width = 250
                .DisplayColumns("last_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("last_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("first_name").DataColumn.Caption = "FIRST NAME"
                .DisplayColumns("first_name").Width = 250
                .DisplayColumns("first_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("first_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("middle_name").DataColumn.Caption = "MIDDLE NAME"
                .DisplayColumns("middle_name").Width = 100
                .DisplayColumns("middle_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("middle_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("course_name").DataColumn.Caption = "COURSE"
                .DisplayColumns("course_name").Width = 200
                .DisplayColumns("course_name").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("course_name").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near

                .DisplayColumns("batchname").DataColumn.Caption = "LEVEL / SEMESTER"
                .DisplayColumns("batchname").Width = 200
                .DisplayColumns("batchname").HeadingStyle.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Center
                .DisplayColumns("batchname").Style.HorizontalAlignment = C1.Win.C1TrueDBGrid.AlignHorzEnum.Near


                .DisplayColumns("batch_id").Visible = False
                .DisplayColumns("year_level").Visible = False
                .DisplayColumns("school_year").Visible = False
                .DisplayColumns("semester").Visible = False
                .DisplayColumns("categoryname").Visible = False
                'categoryid
                .DisplayColumns("categoryid").Visible = False
                '.DisplayColumns("status").Visible = False
            End With
        Catch ex As Exception

        End Try


    End Sub

    Private Sub AssignScheduleToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AssignScheduleToolStripMenuItem.Click

        _studentID = tdbViewer.Columns.Item("id").Value.ToString
        PERSON_ID = tdbViewer.Columns.Item("person_id").Value.ToString
        _student_category = tdbViewer.Columns.Item("categoryname").Value.ToString
        _student_category_id = tdbViewer.Columns.Item("categoryid").Value.ToString
        _batch_name = tdbViewer.Columns.Item("batchname").Value.ToString
        _batchID = tdbViewer.Columns.Item("batch_id").Value.ToString



        With fmaStudentsSubjectListForm
            .txtCategory.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
            .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
            .txtCoursename.Text = tdbViewer.Columns.Item("course_name").Value.ToString
            .txtBatchName.Text = tdbViewer.Columns.Item("batchname").Value.ToString
            .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                       & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                       & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
            .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
        End With

        '     fmaStudentsSubjectListForm.MdiParent = ftmdiMainForm
        ' fmaStudentsSubjectListForm.Show()

        fmaStudentsSubjectListForm.ShowDialog()
        fmaStudentsSubjectListForm.BringToFront()




    End Sub

    Private Sub ViewAssessmentToolStripMenuItem_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ASSESSMENTToolStripMenuItem.Click
        With fmaStudentAssessmentForm
            .txtCategoryID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString
            .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
            .txtIDNumber.Text = tdbViewer.Columns.Item("std_number").Value.ToString
            .txtGrant.Text = tdbViewer.Columns.Item("scholarshipgrant").Value.ToString
            .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
            .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                   & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                   & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
            .txtCourse.Text = tdbViewer.Columns.Item("course_name").Value.ToString
            'year_level,school_year,semester
            .txtSY.Text = tdbViewer.Columns.Item("school_year").Value.ToString
            .txtYearLvl.Text = tdbViewer.Columns.Item("year_level").Value.ToString
            .txtSemester.Text = tdbViewer.Columns.Item("semester").Value.ToString
            .txtCategoryName.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
            '.txtEnrollStat.Text = tdbViewer.Columns.Item("status").Value.ToString

        End With

        '     fmaStudentAssessmentForm.MdiParent = ftmdiMainForm
        fmaStudentAssessmentForm.Show()
        fmaStudentAssessmentForm.BringToFront()
    End Sub

    Dim row As Object
    Private ReadOnly student_COR_info As Object
    Dim scholarship_grant As String = ""
    Dim enroll_status As String = ""
    Dim year_level As String = ""
    Dim semester As String = ""
    Dim student_name As String
    Private Sub tdbViewer_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles tdbViewer.MouseUp
        If tdbViewer.RowCount > 0 Then

            _studentID = tdbViewer.Columns.Item("id").Value.ToString
            scholarship_grant = If(IsDBNull(tdbViewer.Columns.Item("scholarshipgrant").Value.ToString), "", tdbViewer.Columns.Item("scholarshipgrant").Value.ToString)
            enroll_status = tdbViewer.Columns.Item("STATUS").Value.ToString
            PERSON_ID = tdbViewer.Columns.Item("person_id").Value.ToString '
            year_level = tdbViewer.Columns.Item("year_level").Value.ToString
            semester = tdbViewer.Columns.Item("semester").Value.ToString
            txtBatchID.Text = tdbViewer.Columns.Item("batch_id").Value.ToString
            student_name = tdbViewer.Columns.Item("first_name").Value.ToString & " " & tdbViewer.Columns.Item("middle_name").Value.ToString & ", " & tdbViewer.Columns.Item("last_name").Value.ToString

            Dim point1 As Point

            If e.Button = Windows.Forms.MouseButtons.Right Then

                point1 = Windows.Forms.Cursor.Position

                Dim pt As Point = tdbViewer.PointToClient(point1)
                CMenuStripOperations.Show(tdbViewer, pt)

                row = tdbViewer.Row

                'If tdbViewer(row, "status") = "enrolled" Then
                '    printCOR(tdbViewer(row, "id"))
                'Else
                '    MsgBox("Cannot Print COR", MsgBoxStyle.Critical, "STUDENT NOT ENROLLED")
                'End If

            End If
        End If

    End Sub

    Dim COR_info As New Student_COR
    Dim Subject_info As New List(Of COR_Subject_Details)
    Dim Assessment_info As New List(Of COR_Assessment_Details)
    Dim Default_LogoPath As String = Directory.GetCurrentDirectory & "\TPC_logo.jpg"
    Private Sub printCOR(addmission_no As Object, id As Integer)

        Cursor = Cursors.WaitCursor

        Dim master_report As New XtraReport_COR
        '     Dim printTool As New printc(New XtraReport())

        Dim page As Integer = 1
        While page < 3

            Dim report(page) As XtraReport_COR
            report(page) = New XtraReport_COR

            report(page).XrLabel1.Text = COMPANY_NAME
            report(page).XrLabel4.Text = "Contact #: " & COMPANY_MOBILE_NUMBER
            report(page).XrLabel5.Text = "Email Address: " & COMPANY_EMAIL_ADDRESS

            If Not File.Exists(COMPANY_LOGO_PATH) Then
                report(page).XrPictureBox1.ImageSource = New ImageSource(New Bitmap(Default_LogoPath))
            Else
                report(page).XrPictureBox1.ImageSource = New ImageSource(New Bitmap(COMPANY_LOGO_PATH))
            End If
            report(page).XrLabel25.Text = getTotalAmount(id)

            If page = 2 Then
                report(page).XrLabeLRegistrarCopy.Visible = True
            Else
                report(page).XrLabeLRegistrarCopy.Visible = False
            End If

            Dim dt As New DataTable
            dt = getStudents_COR_info(addmission_no)

            If dt.Rows.Count > 0 Then

                For x As Integer = 0 To dt.Rows.Count - 1

                    Dim obj As New Student_COR
                    With obj
                        .Id_number = If(IsDBNull(dt(x)("IdNumber")), "", dt(x)("IdNumber"))
                        .Name = If(IsDBNull(dt(x)("NameCourse")), "", dt(x)("NameCourse")) 'dt(x)("NameCourse")
                        .Sim_year_date = If(IsDBNull(dt(x)("sem_year_date")), "", dt(x)("sem_year_date")) 'dt(x)("sem_year_date")
                        .Total_units = If(IsDBNull(dt(x)("TotalUnits")), 0, dt(x)("TotalUnits")) 'dt(x)("TotalUnits")
                        .Tution_fees = If(IsDBNull(dt(x)("TutionFees")), 0, dt(x)("TutionFees")) 'dt(x)("TutionFees")
                    End With
                    COR_info = obj
                Next

            End If
            dt = Nothing

            Try
                dt = getStudent_Subject_info(addmission_no)

                If dt.Rows.Count > 0 Then

                    For x As Integer = 0 To dt.Rows.Count - 1

                        Dim obj As New COR_Subject_Details
                        With obj
                            .Subject_code = dt(x)("subject_code")
                            .Descriptive_title = dt(x)("descriptive_title")
                            .Units = dt(x)("units")
                            .Time = dt(x)("time")
                            .Day = dt(x)("day")
                            .Room = dt(x)("room")
                            .Instructor = dt(x)("instructor")
                        End With
                        Subject_info.Add(obj)
                    Next
                End If

                Dim Subreport As XRSubreport = TryCast(report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
                Subreport.ReportSource.DataSource = Subject_info


            Catch ex As Exception

            End Try

            dt = Nothing

            Try
                dt = getStudent_Assessment_info(id)
                If dt.Rows.Count > 0 Then

                    For x As Integer = 0 To dt.Rows.Count - 1

                        Dim obj As New COR_Assessment_Details
                        With obj
                            .Charges = dt(x)("Charges")
                            .Amount = dt(x)("Amount")
                        End With
                        Assessment_info.Add(obj)
                    Next
                End If

                Dim Subreport As XRSubreport = TryCast(report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Subreport.ReportSource.DataSource = Assessment_info


            Catch ex As Exception

            End Try

            report(page).BindingSource1.DataSource = COR_info
            '        report(page).
            report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
            report(page).CreateDocument()

            master_report.Pages.AddRange(report(page).Pages)
            master_report.PrintingSystem.ContinuousPageNumbering = True

            Subject_info.Clear()
            Assessment_info.Clear()

            page += 1
        End While

        '      master_report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        master_report.ShowPreview

        Cursor = Cursors.Default

    End Sub

    'Private Function StartPrint() As PrintDocumentEventHandler

    'End Function

    Private Sub StartPrint(sender As Object, e As PrintDocumentEventArgs)
        Throw New NotImplementedException()
    End Sub

    Private Function getTotalAmount(id As Integer) As String
        Dim Amount As String = ""
        Amount = DataObject(String.Format("SELECT
students_assessment.total 'Amount'

FROM
students_assessment

WHERE
students_assessment.student_id = '" & id & "' AND
students_assessment.columnName = 'D' AND 
students_assessment.stat = 'T+'"))
        Return Amount
    End Function

    Private Function getStudent_Assessment_info(id As Integer) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
Charges,
Amount
FROM(
SELECT
students_assessment.particulars 'Charges',
students_assessment.amount 'Amount'

FROM
students_assessment
INNER JOIN finance_fee_particulars ON students_assessment.particulars = finance_fee_particulars.`name`
WHERE
students_assessment.student_id = '" & id & "' AND
students_assessment.columnName = 'D'

UNION ALL

SELECT
students_assessment.particulars 'Charges',
students_assessment.amount 'Amount'

FROM
students_assessment
-- INNER JOIN finance_fee_particulars ON students_assessment.particulars = finance_fee_particulars.`name`
WHERE
students_assessment.student_id = '" & id & "' AND
students_assessment.columnName = 'D' AND students_assessment.particulars LIKE '%TUITION%'

/*
UNION ALL


SELECT
students_assessment.amount 'Charges',
students_assessment.total 'Amount'

FROM
students_assessment

WHERE
students_assessment.student_id = '" & id & "'/* AND
students_assessment.columnName = 'D' AND students_assessment.stat = '++' OR 
students_assessment.stat = '-+'  OR students_assessment.stat = '--'*/

)A



"))
        Return dt
    End Function

    Private Function getStudent_Subject_info(addmission_no As Object) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	subjects.CODE 'subject_code',
	subjects.NAME 'descriptive_title',
	subjects.credit_hours 'units',
	subject_class_schedule.class_time 'time',
	subject_class_schedule.day 'day',
	subject_class_schedule.room 'room',
	subject_class_schedule.employee_name 'instructor'

FROM
	students_subjects
	INNER JOIN students ON ( students_subjects.student_id = students.id )
	INNER JOIN subjects ON ( students_subjects.subject_id = subjects.id )
	LEFT JOIN subject_class_schedule ON ( students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item ) 
WHERE
	admission_no = '" & addmission_no & "'"))
        Return dt
    End Function

    Private Function getStudents_COR_info(addmission_no As Object) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
  students.std_number as 'IdNumber',
	CONCAT(person.display_name,' - ',courses.course_name) AS 'NameCourse',
	CONCAT(batches.semester,' AY ',school_year,'// ',DATE_FORMAT(admission_date,'%m/%d/%Y')) AS 'sem_year_date',
	SUM(subjects.credit_hours) as 'TotalUnits',
	SUM(subjects.amount) as 'TutionFees'

FROM
	students_subjects
	INNER JOIN students ON ( students_subjects.student_id = students.id )
	INNER JOIN person ON (students.person_id = person.person_id)
	INNER JOIN courses ON (students.course_id = courses.id)
	INNER JOIN batches ON (students.batch_id = batches.id)
	INNER JOIN subjects ON ( students_subjects.subject_id = subjects.id )
	LEFT JOIN subject_class_schedule ON ( students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item ) 
WHERE
		students.admission_no = '" & addmission_no & "'"))
        Return dt
    End Function

    Private Sub txtCourseID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCourseID.TextChanged
        If txtCourseID.Text.Length > 0 Then
            If cmbBatch.Enabled = False Then
                cmbBatch.Enabled = True
            End If
            displayBatches()
        Else
            cmbBatch.Enabled = False
        End If
    End Sub

    Public Sub disableSubjectView()
        Me.CMenuStripOperations.Items(0).Enabled = False
    End Sub

    Public Sub disableAssessmentview()
        Me.CMenuStripOperations.Items(1).Enabled = False
    End Sub

    Public Sub disableGradeView()
        Me.ViewGradesToolStripMenuItem.Enabled = False
    End Sub

    Private Sub ViewGradesToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ViewGradesToolStripMenuItem.Click
        If gradingPeriodGrades Is Nothing Then
            gradingPeriodGrades = New fmaStudentsGradingPeriod
        Else
            gradingPeriodGrades = Nothing
            gradingPeriodGrades = New fmaStudentsGradingPeriod
        End If


        With gradingPeriodGrades
            .txtCategory.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
            .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
            .txtCoursename.Text = tdbViewer.Columns.Item("course_name").Value.ToString
            .txtBatchName.Text = tdbViewer.Columns.Item("batchname").Value.ToString
            .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                   & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                   & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
            .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
            'categoryid
            .txtCatID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString
        End With

        gradingPeriodGrades.ShowDialog(Me)
    End Sub

    Private Sub btnRemove_Click(sender As Object, e As EventArgs) Handles btnRemove.Click
        Me.Close()
    End Sub

    Private Sub PreviewCORToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PreviewCORToolStripMenuItem.Click

        If tdbViewer(row, "status") = "enrolled" Then
            printCOR(tdbViewer(row, "ADMISSION NUMBER"), tdbViewer(row, "id"))
        Else
            MsgBox("Cannot Print COR", MsgBoxStyle.Critical, "STUDENT NOT ENROLLED")
        End If

    End Sub

    Private Sub tdbViewer_DoubleClick(sender As Object, e As EventArgs) Handles tdbViewer.DoubleClick

        _studentID = tdbViewer.Columns.Item("id").Value.ToString
        PERSON_ID = tdbViewer.Columns.Item("person_id").Value.ToString
        _student_category = tdbViewer.Columns.Item("categoryname").Value.ToString
        _student_category_id = tdbViewer.Columns.Item("categoryid").Value.ToString
        _batch_name = tdbViewer.Columns.Item("batchname").Value.ToString
        _batchID = tdbViewer.Columns.Item("batch_id").Value.ToString


        If Me.Tag = 1 Then
            'STUDENT GRADES
            If gradingPeriodGrades Is Nothing Then
                gradingPeriodGrades = New fmaStudentsGradingPeriod
            Else
                gradingPeriodGrades = Nothing
                gradingPeriodGrades = New fmaStudentsGradingPeriod
            End If


            With gradingPeriodGrades
                .txtCategory.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
                .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
                .txtCoursename.Text = tdbViewer.Columns.Item("course_name").Value.ToString
                .txtBatchName.Text = tdbViewer.Columns.Item("batchname").Value.ToString
                .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                       & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                       & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
                .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
                'categoryid
                .txtBatchID.Text = tdbViewer.Columns.Item("batch_id").Value.ToString
                .txtCatID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString
            End With

            gradingPeriodGrades.ShowDialog(Me)

        ElseIf Me.Tag = 2 Then
            'STUDENTS SUBJECT
            With fmaStudentsSubjectListForm
                .txtCategory.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
                .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
                .txtCoursename.Text = tdbViewer.Columns.Item("course_name").Value.ToString
                .txtBatchName.Text = tdbViewer.Columns.Item("batchname").Value.ToString
                .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                       & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                       & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
                .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
                .lblEnrollStatus.Text = enroll_status
                _batchID = tdbViewer.Columns.Item("batch_id").Value.ToString

            End With

            'fmaStudentsSubjectListForm.MdiParent = ftmdiMainForm
            fmaStudentsSubjectListForm.WindowState = FormWindowState.Normal
            '      fmaStudentsSubjectListForm.Show()
            fmaStudentsSubjectListForm.ShowDialog()
            fmaStudentsSubjectListForm.BringToFront()

            If fmaStudentsSubjectListForm.DialogResult = DialogResult.OK Then

                With fmaSubjectDropForm
                    .txtCategoryID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString
                    .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
                    .txtIDNumber.Text = tdbViewer.Columns.Item("std_number").Value.ToString
                    .txtGrant.Text = tdbViewer.Columns.Item("scholarshipgrant").Value.ToString
                    .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
                    .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                               & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                               & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
                    .txtCourse.Text = tdbViewer.Columns.Item("course_name").Value.ToString
                    'year_level,school_year,semester
                    .txtSY.Text = tdbViewer.Columns.Item("school_year").Value.ToString
                    .txtYearLvl.Text = tdbViewer.Columns.Item("year_level").Value.ToString
                    .txtSemester.Text = tdbViewer.Columns.Item("semester").Value.ToString
                    .txtCategoryName.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
                    .txtBatchID.Text = Me.txtBatchID.Text
                    .txtEnrolledStatus.Text = enroll_status
                End With

                fmaSubjectDropForm.MdiParent = ftmdiMainForm
                fmaSubjectDropForm.Show()
                fmaSubjectDropForm.BringToFront()

            End If



        Else
            'STUDENT ASSESSMENT
            With fmaStudentAssessmentForm
                .txtCategoryID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString
                .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
                .txtIDNumber.Text = tdbViewer.Columns.Item("std_number").Value.ToString
                .txtGrant.Text = tdbViewer.Columns.Item("scholarshipgrant").Value.ToString
                .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
                .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                       & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                       & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
                .txtCourse.Text = tdbViewer.Columns.Item("course_name").Value.ToString
                'year_level,school_year,semester
                .txtSY.Text = tdbViewer.Columns.Item("school_year").Value.ToString
                .txtYearLvl.Text = tdbViewer.Columns.Item("year_level").Value.ToString
                .txtSemester.Text = tdbViewer.Columns.Item("semester").Value.ToString
                .txtCategoryName.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
                '.txtEnrollStat.Text = tdbViewer.Columns.Item("status").Value.ToString

            End With

            fmaStudentAssessmentForm.MdiParent = ftmdiMainForm
            fmaStudentAssessmentForm.Show()
            fmaStudentAssessmentForm.BringToFront()

        End If

    End Sub

    Private Sub tdbViewer_MouseHover(sender As Object, e As EventArgs) Handles tdbViewer.MouseHover
        ToolTip1.Show(LabelX7.Text, tdbViewer)
    End Sub


    Private Sub cmbyearbatch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbyearbatch.SelectedIndexChanged

        Try

            Dim drv As DataRowView = TryCast(cmbyearbatch.SelectedItem, DataRowView)
            _school_year = drv.Item("name").ToString
            cmbCategory.Enabled = True
        Catch ex As Exception

            cmbCategory.Enabled = False
        End Try

        'Try
        '    cmbBatch.Enabled = True

        '    Dim SQLEX As String = "SELECT batches.id, name FROM batches"
        '    SQLEX += " INNER JOIN courses"
        '    SQLEX += " ON (batches.course_id = courses.id)"
        '    SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
        '    SQLEX += " AND course_id='" & Me.txtCourseID.Text & "' AND batches.school_year = '" & cmbyearbatch.Text & "' "


        '    Dim MeData As DataTable
        '    MeData = clsDBConn.ExecQuery(SQLEX)

        '    cmbBatch.DataSource = MeData

        '    cmbBatch.ValueMember = "id"
        '    cmbBatch.DisplayMember = "name"
        '    cmbBatch.Text = ""
        '    cmbBatch.SelectedIndex = -1
        'Catch ex As Exception

        'End Try
    End Sub

    Dim CatID As Integer
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged

        Try
            Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
            CatID = drv.Item("id")
            _student_category_id = drv.Item("id")
            cmbCourse.Enabled = True
            displayCourse()
        Catch ex As Exception

        End Try


    End Sub

    Private Sub ModifyBatchToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifyBatchToolStripMenuItem.Click
        Dim frm As New frmModify
        frm.tagID = ModifyBatchToolStripMenuItem.Tag
        frm.batch_name = cmbBatch.Text
        frm.BringToFront()
        frm.ShowDialog()
        If frm.DialogResult = DialogResult.OK Then
            displayFilterCategory()
        End If
    End Sub

    'Private Sub ModifyScholarshipGrantToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifyScholarshipGrantToolStripMenuItem.Click
    '    Dim frm As New frmModify
    '    frm.tagID = ModifyScholarshipGrantToolStripMenuItem.Tag
    '    frm.scholarship_grant = scholarship_grant
    '    frm.BringToFront()
    '    frm.ShowDialog()
    '    If frm.DialogResult = DialogResult.OK Then
    '        displayFilterCategory()
    '    End If
    'End Sub

    Private Sub ModifyCourseGradeToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifyCourseGradeToolStripMenuItem.Click
        Dim frm As New frmModify
        frm.tagID = ModifyCourseGradeToolStripMenuItem.Tag
        frm.course_grade_name = cmbCourse.Text
        frm.BringToFront()
        frm.ShowDialog()
        If frm.DialogResult = DialogResult.OK Then
            displayFilterCategory()
        End If
    End Sub

    Private Sub ENROLLEDToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ENROLLEDToolStripMenuItem.Click
        If MessageBox.Show("Are you sure you want to change the status into  ENROLLED?", "Please verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            DataSource(String.Format("UPDATE students SET is_enrolled = 1 WHERE id = '" & _studentID & "'"))
            MessageBox.Show("Record Updated...", "Successfully!")
            displayFilterCategory()
        End If

    End Sub

    Private Sub NOTENROLLEDToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NOTENROLLEDToolStripMenuItem.Click
        If MessageBox.Show("Are you sure you want to change the status into NOT ENROLLED?", "Please verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            DataSource(String.Format("UPDATE students SET is_enrolled = 0 WHERE id = '" & _studentID & "'"))
            MessageBox.Show("Record Updated...", "Successfully!")
            displayFilterCategory()
        End If

    End Sub

    Private Sub WITHDRAWNToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles WITHDRAWNToolStripMenuItem.Click
        If MessageBox.Show("Are you sure you want to change the status into WITHDRAWN?", "Please verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then
            DataSource(String.Format("UPDATE students SET is_enrolled = 2 WHERE id = '" & _studentID & "'"))
            MessageBox.Show("Record Updated...", "Successfully!")
            displayFilterCategory()
        End If
    End Sub

    Private Sub NEWToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NEWToolStripMenuItem.Click
        changeEnrollAs(NEWToolStripMenuItem.Text)
    End Sub

    Private Sub OLDToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles OLDToolStripMenuItem.Click
        changeEnrollAs(OLDToolStripMenuItem.Text)
    End Sub

    Private Sub RETURNEEToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RETURNEEToolStripMenuItem.Click
        changeEnrollAs(RETURNEEToolStripMenuItem.Text)
    End Sub

    Private Sub TRANFEREEToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles TRANFEREEToolStripMenuItem.Click
        changeEnrollAs(TRANFEREEToolStripMenuItem.Text)
    End Sub

    Private Sub NdBachelorsDegreeToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NdBachelorsDegreeToolStripMenuItem.Click
    End Sub
    Private Sub changeEnrollAs(text As String)
        DataSource(String.Format("UPDATE students SET enrollmentAS = '" & text & "' WHERE id = '" & _studentID & "'"))
        MsgBox("Enrolled Status has been changed to " & text & "", MsgBoxStyle.Information, "CHANGED STATUS")
        displayFilterCategory()
    End Sub

    Private Sub GrantToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GrantToolStripMenuItem.Click
        Dim frm As New frmModify
        frm.tagID = GrantToolStripMenuItem.Tag
        frm.scholarship_grant = scholarship_grant
        frm.BringToFront()
        frm.ShowDialog()
        If frm.DialogResult = DialogResult.OK Then
            displayFilterCategory()
        End If
    End Sub

    Private Sub RemoveToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoveToolStripMenuItem.Click

        frmModify.DeleteScholarShip(PERSON_ID, _studentID)
        displayFilterCategory()
    End Sub

    Private Sub ModifyYearLevelToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifyYearLevelToolStripMenuItem.Click
        Dim frm As New frmModify
        frm.tagID = ModifyYearLevelToolStripMenuItem.Tag
        frm.year_level = year_level
        frm.BringToFront()
        frm.ShowDialog()
        displayFilterCategory()
    End Sub

    Private Sub ModifySemesterToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifySemesterToolStripMenuItem.Click
        Dim frm As New frmModify
        frm.tagID = ModifySemesterToolStripMenuItem.Tag
        frm.semester = semester
        frm.BringToFront()
        frm.ShowDialog()
        displayFilterCategory()
    End Sub

    Private Sub ADDDROPSubjectToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ADDDROPSubjectToolStripMenuItem.Click
        With fmaSubjectDropForm
            .txtCategoryID.Text = tdbViewer.Columns.Item("categoryid").Value.ToString
            .txtAdmissionNo.Text = tdbViewer.Columns.Item("admission_no").Value.ToString
            .txtIDNumber.Text = tdbViewer.Columns.Item("std_number").Value.ToString
            .txtGrant.Text = tdbViewer.Columns.Item("scholarshipgrant").Value.ToString
            .txtStudentID.Text = tdbViewer.Columns.Item("id").Value.ToString
            .txtStudentName.Text = tdbViewer.Columns.Item("last_name").Value.ToString _
                                       & ", " & tdbViewer.Columns.Item("first_name").Value.ToString() _
                                       & " " & tdbViewer.Columns.Item("middle_name").Value.ToString()
            .txtCourse.Text = tdbViewer.Columns.Item("course_name").Value.ToString
            'year_level,school_year,semester
            .txtSY.Text = tdbViewer.Columns.Item("school_year").Value.ToString
            .txtYearLvl.Text = tdbViewer.Columns.Item("year_level").Value.ToString
            .txtSemester.Text = tdbViewer.Columns.Item("semester").Value.ToString
            .txtCategoryName.Text = tdbViewer.Columns.Item("categoryname").Value.ToString
            .txtBatchID.Text = Me.txtBatchID.Text
            .txtEnrolledStatus.Text = enroll_status
        End With

        fmaSubjectDropForm.MdiParent = ftmdiMainForm
        fmaSubjectDropForm.Show()
        fmaSubjectDropForm.BringToFront()
    End Sub

    Private Sub ModifyAdmissionNumberToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifyAdmissionNumberToolStripMenuItem.Click
        Dim frm As New frmModify
        frm.tagID = ModifyAdmissionNumberToolStripMenuItem.Tag
        frm.admission_number = tdbViewer.Columns.Item("admission_no").Value.ToString
        frm.BringToFront()
        frm.ShowDialog()
        displayFilterCategory()
    End Sub

    Private Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click

        Cursor = Cursors.WaitCursor

        Dim SQLEX As String = ""
        SQLEX += " SELECT students.std_number 'STUDENT NUMBER'"
        SQLEX += " , REPLACE ( person.last_name, 'Ã±', 'ñ' ) AS 'LAST NAME'"
        SQLEX += " , person.first_name 'FIRST NAME',person.middle_name 'MIDDLE NAME'"
        SQLEX += " , person.gender 'GENDER'"
        SQLEX += " FROM students"
        SQLEX += " INNER JOIN person"
        SQLEX += " ON (students.person_id = person.person_id AND students.status_type_id = 1 AND person.end_time IS NULL)"
        SQLEX += " INNER JOIN student_categories "
        SQLEX += " ON (students.student_category_id = student_categories.id)"
        SQLEX += " INNER JOIN batches "
        SQLEX += " ON (students.batch_id = batches.id)"
        SQLEX += " INNER JOIN courses "
        SQLEX += " ON (batches.course_id = courses.id)"
        SQLEX += " WHERE courses.id='" & txtCourseID.Text & "'  AND  is_enrolled = 1"

        If cmbyearbatch.Text <> "" Then
            SQLEX += " AND batches.school_year ='" & cmbyearbatch.Text & "'"
        End If

        If txtBatchID.Text <> "" Then
            SQLEX += " AND batches.id='" & txtBatchID.Text & "'"
        End If

        SQLEX += " ORDER BY last_name"


        Dim MeData As New DataTable
        MeData = DataSource(String.Format(SQLEX))  'clsDBConn.ExecQuery(SQLEX)

        Dim TotalNoStudents As Integer = MeData.Rows.Count

        GridControl1.DataSource = MeData
        DesginGridView(GridView1)

        '   Dim GC As GridControl = 


        Dim report As New xtrStudentListperDepartment

        report.txtListStudent.Text = "LIST OF STUDENT IN SCHOOL YEAR " & cmbyearbatch.Text
        report.txtCourse.Text = cmbCourse.Text
        If txtBatchID.Text <> "" Then
            report.txtBatch.Text = cmbBatch.Text
        Else
            report.txtBatch.Visible = False
        End If
        report.txtTotal.Text = "TOTAL OF " & TotalNoStudents
        '   report.DataSource = MeData
        report.PrintableComponentContainer1.PrintableComponent = GridControl1
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()
        report.ShowPreview

        Cursor = Cursors.Default

    End Sub

    Private Sub DesginGridView(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)

        For i As Integer = 0 To view.Columns.Count - 1
            Select Case i
                Case 0
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
                Case 1, 2, 3
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Near
                    view.Columns(i).Width = 150
                Case Else
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).Width = 100
            End Select
        Next

    End Sub

    Private Sub btndelete_Click(sender As Object, e As EventArgs) Handles btndelete.Click

        If frmSU_Pass.ShowDialog = Windows.Forms.DialogResult.OK Then
            If Not frmSU_Pass.passwordOK = True Then
                MsgBox("Needs SuperUser Pin to Access Component.")
                frmSU_Pass.txtPassword.Text = ""
                Me.Show()
                Exit Sub
            End If

            If MessageBox.Show("Are you sure you want to DELETE this record?", "Please verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

                SelectInsert(_studentID, "students", "students_deleted")
                DataSource(String.Format("DELETE FROM students WHERE id = '" & _studentID & "'"))

                MessageBox.Show(" " & student_name & " has been deleted....", "Successfully !!")
                displayFilterCategory()
            Else
                Exit Sub
            End If



        End If

    End Sub

    Private Sub SelectInsert(studentID As Integer, tbl_select As String, tbl_insert As String)
        Dim sql As String = ""
        sql = "
INSERT INTO " & tbl_insert & " (id, admission_no, class_roll_no,scholarshipgrant,admission_date,batch_id,student_category_id,immediate_contact_id,is_sms_enabled,status_description,is_active,is_deleted,has_paid_fees,user_id,runningbalance,is_enrolled,bal_edit,is_regular,person_id,year_level,semester,
enrollmentAS,course_id,status_type_id,stature,std_number,academice_year,withdrawal_date,track,strand)
SELECT
	id, 
	admission_no, 
	class_roll_no, 
	scholarshipgrant, 
	admission_date, 
	batch_id, 
	student_category_id, 
	immediate_contact_id, 
	is_sms_enabled, 
	status_description, 
	is_active, 
	is_deleted, 
	has_paid_fees, 
	user_id, 
	runningbalance, 
	is_enrolled, 
	bal_edit, 
	is_regular, 
	person_id, 
	year_level, 
	semester, 
	enrollmentAS, 
	course_id, 
	status_type_id, 
	stature, 
	std_number, 
	academice_year, 
	withdrawal_date, 
	track, 
	strand
FROM
	 " & tbl_select & "            -- students
	WHERE id = '" & studentID & "'"
        DataSource(sql)

    End Sub

    Private Sub btnRetreive_Click(sender As Object, e As EventArgs) Handles btnRetrieve.Click
        If frmSU_Pass.ShowDialog = Windows.Forms.DialogResult.OK Then
            If Not frmSU_Pass.passwordOK = True Then
                MsgBox("Needs SuperUser Pin to Access Component.")
                frmSU_Pass.txtPassword.Text = ""
                Me.Show()
                Exit Sub
            End If

            If MessageBox.Show("Are you sure you want to RETRIEVE this record?", "Please verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

                SelectInsert(_studentID, "students_deleted", "students")
                DataSource(String.Format("DELETE FROM students_deleted WHERE id = '" & _studentID & "'"))

                MessageBox.Show(" " & student_name & " has been retrieve....", "Successfully !!")

                displayFilterCategory()
            Else
                Exit Sub
            End If



        End If
    End Sub

    Private Sub LabelX2_Click(sender As Object, e As EventArgs) Handles LabelX2.Click

    End Sub

    Private Sub LaboratorySubjectSetup_Click(sender As Object, e As EventArgs) Handles LaboratorySubjectSetup.Click
        Dim frm As New frmModify
        frm.tagID = LaboratorySubjectSetup.Tag
        frm.batch_name = cmbBatch.Text
        frm.BringToFront()
        frm.ShowDialog()
        If frm.DialogResult = DialogResult.OK Then
            displayFilterCategory()
        End If
    End Sub



    'Private Sub ModifyScholarshipGrantToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ModifyScholarshipGrantToolStripMenuItem.Click

    '    Dim frm As New frmModify
    '    frm.tagID = ModifyScholarshipGrantToolStripMenuItem.Tag
    '    frm.scholarship_grant = scholarship_grant
    '    frm.BringToFront()
    '    frm.ShowDialog()
    '    If frm.DialogResult = DialogResult.OK Then
    '        displayFilterCategory()
    '    End If

    'End Sub
End Class