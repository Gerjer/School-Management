Imports DevExpress.Data
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Grid

Public Class frmProgramStudy

    Public catId As Integer

    Public FirstLoad As Boolean = True
    Private Sub frmProgramStudy_Load(sender As Object, e As EventArgs) Handles Me.Load


        FirstLoad = True

        loadCategory()

        If catId = 16 Then
            Panel5.Visible = True
        Else
            Panel5.Visible = False
        End If

        If catId = 13 Then
            GroupBox1.Enabled = True
        End If

        If catId = 13 Or catId = 16 Or catId = 0 Then
            cmbSemester.Enabled = True
            cmbYearLevel.Enabled = True
            loadYearLevel()
        End If


        If sender.tag = 1 Then
            cmbCourse.SelectedValue = _courseID
            cmbYearLevel.Text = _year_level

            Panel7.Visible = False
            btnApplySubject.Visible = True

            getProgramStudy()
        Else
            Panel7.Visible = True
            btnApplySubject.Visible = False
        End If



        FirstLoad = False
    End Sub

    Private Sub loadYearLevel()

        If catId = 13 Then
            cmbYearLevel.DataSource = DataSource(String.Format(" SELECT
			                                                        id,
			                                                        `name`
			                                                        FROM(SELECT
			                                                        year_level.id, 
			                                                        year_level.year_level 'name'
			                                                        FROM
			                                                        year_level
				                                                        WHERE year_level  < 5
				
				                                                        UNION
				
				                                                        SELECT  0 AS 'id','-- ALL --' AS 'name'
				                                                        )A ORDER BY id"))
        ElseIf catId = 16 Then
            cmbYearLevel.DataSource = DataSource(String.Format("    SELECT
			                                                    id,
			                                                    `name`
			                                                    FROM(SELECT
			                                                    year_level.id, 
			                                                    year_level.year_level 'name'
			                                                    FROM
			                                                    year_level
				                                                    WHERE year_level  > 10
				
				                                                    UNION
				
				                                                    SELECT  0 AS 'id','-- ALL --' AS 'name'
				                                                    )A ORDER BY id"))
        Else

        End If

        cmbYearLevel.ValueMember = "id"
        cmbYearLevel.DisplayMember = "name"
        cmbYearLevel.SelectedIndex = -1
    End Sub

    Private Sub loadCategory()
        If Tag = 1 Then
            cmbCategory.DataSource = DataSource(String.Format("SELECT
	                                    student_categories.id, 
	                                    student_categories.`name`
                                    FROM
	                                    student_categories
                                    WHERE
	                                    student_categories.id = '" & catId & "'
                                         "))
            cmbCategory.ValueMember = "id"
            cmbCategory.DisplayMember = "name"

            loadCourse()
        Else
            cmbCategory.DataSource = DataSource(String.Format("SELECT
	                                    student_categories.id, 
	                                    student_categories.`name`
                                    FROM
	                                    student_categories
                                                                            "))
            cmbCategory.ValueMember = "id"
            cmbCategory.DisplayMember = "name"
            cmbCategory.SelectedIndex = -1
        End If



        '   cmbCategory.SelectedIndex = -1
    End Sub

    Private Sub loadCourse(Optional tag As Integer = 0)
        If tag = 1 Then
            cmbCourse.DataSource = DataSource(String.Format("	SELECT
	                                        id,
	                                        `name`,
	                                        description,
                                            category_id
	                                        FROM(		
			                                        SELECT
			                                        courses.id, 
			                                        courses.course_name 'name', 
			                                        courses.description,
                                                    courses.category_id
			                                        FROM
			                                        courses
	
			                                        UNION

			                                        SELECT 0 AS 'id',
						                                         '-- ALL --' AS 'name',
						                                         '' AS 'description',
                                                                 0 AS 'category_id'
						 
					                                        )A WHERE category_id = '" & catId & "' OR category_id = 0
                                                  ORDER BY `name`			
                                        "))
        Else
            cmbCourse.DataSource = DataSource(String.Format("	SELECT
	                                        id,
	                                        `name`,
	                                        description,
                                            category_id
	                                        FROM(		
			                                        SELECT
			                                        courses.id, 
			                                        courses.course_name 'name', 
			                                        courses.description,
                                                    courses.category_id
			                                        FROM
			                                        courses
	
			                                        UNION

			                                        SELECT 0 AS 'id',
						                                         '-- ALL --' AS 'name',
						                                         '' AS 'description',
                                                                 0 AS 'category_id'
						 
					                                        )A ORDER BY `name`			
                      "))

        End If


        cmbCourse.ValueMember = "id"
        cmbCourse.DisplayMember = "name"
        cmbCourse.SelectedIndex = -1
    End Sub

    'Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged

    '    If FirstLoad = False Then
    '        Try
    '            loadCourse()
    '            If catId = 16 Then
    '                Panel5.Visible = True
    '            Else
    '                Panel5.Visible = False
    '            End If
    '        Catch ex As Exception
    '        End Try
    '    End If


    'End Sub

    Private Sub cmbCourse_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCourse.SelectedIndexChanged

        If FirstLoad = False Then
            Try
                Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
                txtProgramName.Text = drv.Item("description").ToString
            Catch ex As Exception
            End Try

            If catId <> 13 Then

                getProgramStudy()
            End If
        End If

    End Sub

    Private Sub getProgramStudy()

        GridView1.Columns.Clear()

        Dim dt As New DataTable

        dt = getList()
        If dt.Rows.Count > 0 Then
            GridControl1.DataSource = dt
            DesignGridView(GridView1)
        Else
            GridControl1.DataSource = Nothing
        End If

    End Sub

    Private Sub DesignGridView(gridView1 As GridView)
        Dim view As GridView = gridView1
        For i As Integer = 0 To view.Columns.Count - 1
            If catId = 13 Then
                Select Case i
                    Case 0, 8
                        view.Columns(i).Visible = False
                End Select
            Else
                Select Case i
                    Case 0, 3, 4, 5, 6, 7, 8
                        view.Columns(i).Visible = False
                End Select
            End If

        Next

        Dim col As Integer = 0
        For Each column As Columns.GridColumn In view.Columns

            If col > 2 And col < 6 Then

                Dim item As GridGroupSummaryItem = New GridGroupSummaryItem()
                item.FieldName = column.FieldName
                item.ShowInGroupColumnFooter = view.Columns(column.FieldName)
                item.SummaryType = DevExpress.Data.SummaryItemType.Sum
                item.DisplayFormat = "{0:#}"

                view.GroupSummary.Remove(item)

                column.Summary.Add(SummaryItemType.Sum, column.FieldName, "{0:#}")

            End If


            col += 1

        Next

    End Sub

    Private Sub cmbYearLevel_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbYearLevel.SelectedIndexChanged

        If FirstLoad = False Then
            getProgramStudy()
        End If

    End Sub

    Private Function getList() As DataTable

        Dim dt As New DataTable
        Dim where As String = ""

        Dim str1 As String = ""
        Dim str2 As String = ""
        Dim str3 As String = ""

        If cmbYearLevel.Text = "-- ALL --" Then
            str1 = "program_of_study.year_level LIKE '%' "
        Else
            str1 = "program_of_study.year_level = '" & cmbYearLevel.Text & "' "
        End If

        If cmbSemester.Text = "-- ALL --" Then
            str2 = "program_of_study.semester like '%' "
        Else
            str2 = "program_of_study.semester = '" & cmbSemester.Text & "' "
        End If

        If cmbCourse.Text = "-- ALL --" Then
            str3 = "program_of_study.course_grade like '%' "
        Else
            str3 = "program_of_study.course_grade = '" & cmbCourse.Text & "' "
        End If

        If catId = 13 Then
            If cmbCategory.SelectedIndex > -1 And cmbCourse.SelectedIndex > -1 And cmbYearLevel.SelectedIndex > -1 And cmbSemester.SelectedIndex > -1 Then

                If RadioButton1.Checked Then
                    where = "WHERE
	                    program_of_study.cat_id = '" & catId & "' AND
	                  -- program_of_study.course_grade = '" & cmbCourse.Text & "' AND
                        " & str1 & " AND
	                    " & str2 & " AND  
                        " & str3 & " AND  
                        program_of_study.class_type = 'DAY' "

                    dt = getRecord(where)

                Else
                    where = "WHERE
	                    program_of_study.cat_id = '" & catId & "' AND
	                   -- program_of_study.course_grade = '" & cmbCourse.Text & "' AND
	                    " & str1 & " AND
	                    " & str2 & " AND 
                        " & str3 & " AND  
                        program_of_study.class_type = 'NIGHT' "

                    dt = getRecord(where)
                End If


            End If

        ElseIf catId = 16 Then
            If cmbCategory.SelectedIndex > -1 And cmbCourse.SelectedIndex > -1 And cmbYearLevel.SelectedIndex > -1 And cmbSemester.SelectedIndex > -1 And cmbTrack.SelectedIndex > -1 And cmbStrand.SelectedIndex > -1 Then
                where = "WHERE
	                    program_of_study.cat_id = '" & catId & "' AND
	                   -- program_of_study.course_grade = '" & cmbCourse.Text & "' AND
	                    " & str1 & " AND
	                    " & str2 & " AND 
                        " & str3 & " AND  
                        program_of_study.track = '" & cmbTrack.Text & "' AND
                        program_of_study.strand = '" & cmbStrand.Text & "'   "

                dt = getRecord(where)
            End If
        Else
            If cmbCategory.SelectedIndex > -1 And cmbCourse.SelectedIndex > -1 Then
                where = "WHERE
	                    program_of_study.cat_id = '" & catId & "' GROUP BY program_of_study.descriptive_title 
	                   --  AND program_of_study.course_grade = '" & cmbCourse.Text & "' "

                dt = getRecord(where)
            End If
        End If


        Return dt
    End Function

    Private Function getRecord(where As String) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                                        'False' AS 'INCLUDE',
                                        program_of_study.descriptive_title 'DESCRIPTIVE TITLE', 
	                                    program_of_study.course_number 'COURSE CODE', 
	                                    program_of_study.lec_units 'LEC', 
	                                    program_of_study.lab_units 'LAB', 
	                                    program_of_study.units 'UNITS', 
	                                    program_of_study.pre_requisite 'PRE-REQUISITE', 
	                                    program_of_study.co_requisite 'CO-REQUISITE',
                                          program_of_study.id
                                    FROM
	                                    program_of_study
                                      " & where & "
                                    "))
        Return dt
    End Function

    Private Sub SimpleButton1_Click(sender As Object, e As EventArgs) Handles btnApplySubject.Click
        Me.Close()
    End Sub

    Private Sub cmbSemester_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbSemester.SelectedIndexChanged

        If FirstLoad = False Then
            getProgramStudy()
        End If

    End Sub

    Private Sub cmbTrack_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbTrack.SelectedIndexChanged
        If FirstLoad = False Then
            getProgramStudy()
        End If

    End Sub

    Private Sub cmbStrand_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbStrand.SelectedIndexChanged
        If FirstLoad = False Then
            getProgramStudy()
        End If

    End Sub

    Private Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged
        If FirstLoad = False Then
            getProgramStudy()
        End If
    End Sub

    Private Sub RadioButton2_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton2.CheckedChanged
        If FirstLoad = False Then
            getProgramStudy()
        End If
    End Sub


    Private Sub nudLec_ValueChanged(sender As Object, e As EventArgs) Handles nudLec.ValueChanged
        nudTotalUnits.Value = nudLec.Value + nudLab.Value
    End Sub

    Private Sub nudLab_ValueChanged(sender As Object, e As EventArgs) Handles nudLab.ValueChanged
        nudTotalUnits.Value = nudLec.Value + nudLab.Value
    End Sub

    Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
        GroupPanel2.Enabled = True
        btnEdit.Enabled = False
        OPERATION = "ADD"

        txtDescriptiveTitle.Text = ""
        txtCode.Text = ""
        txtPrerequisite.Text = ""
        txtCorequisite.Text = ""
        nudLec.Value = 0
        nudLab.Value = 0
        nudTotalUnits.Value = 0

        Panel8.Enabled = True

    End Sub

    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged
        If FirstLoad = False Then
            Try
                Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
                catId = drv.Item("id").ToString
                If catId = 13 Then
                    GroupBox1.Enabled = True
                ElseIf catId = 16 Then
                    Panel5.Visible = True
                Else
                    GroupBox1.Enabled = False
                    Panel5.Visible = False
                End If

                loadCourse(1)
                loadYearLevel()
            Catch ex As Exception

            End Try
        End If
    End Sub

    Private Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click
        GroupPanel2.Enabled = True
        Panel8.Enabled = True
        OPERATION = "EDIT"
    End Sub


    Private Sub RemoveSubjectToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoveSubjectToolStripMenuItem.Click

    End Sub

    Dim id As Integer = 0
    Private Sub GridView1_RowCellClick(sender As Object, e As RowCellClickEventArgs) Handles GridView1.RowCellClick
        id = GridView1.GetFocusedRowCellValue("id")

        txtDescriptiveTitle.Text = GridView1.GetFocusedRowCellValue("DESCRIPTIVE TITLE")
        txtCode.Text = If(IsDBNull(GridView1.GetFocusedRowCellValue("COURSE CODE").ToString), "", GridView1.GetFocusedRowCellValue("COURSE CODE").ToString)
        txtPrerequisite.Text = If(IsDBNull(GridView1.GetFocusedRowCellValue("PRE-REQUISITE").ToString), "", GridView1.GetFocusedRowCellValue("PRE-REQUISITE").ToString)
        txtCorequisite.Text = If(IsDBNull(GridView1.GetFocusedRowCellValue("CO-REQUISITE").ToString), "", GridView1.GetFocusedRowCellValue("CO-REQUISITE").ToString)
        nudLec.Value = CInt(GridView1.GetFocusedRowCellValue("LEC"))
        nudLab.Value = CInt(GridView1.GetFocusedRowCellValue("LAB"))
        nudTotalUnits.Value = CInt(GridView1.GetFocusedRowCellValue("UNITS"))

        btnAdd.Enabled = False
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim class_type As String = ""
        If RadioButton1.Checked = True Then
            class_type = "DAY"
        Else
            class_type = "NIGHT"
        End If


        If OPERATION = "EDIT" And id > 0 Then

            DataSource(String.Format("UPDATE 
                          `program_of_study` 
                        SET
                          `cat_id` = '" & catId & "',
                          `course_ID` = '" & cmbCourse.SelectedValue & "',
                          `course_grade` = '" & cmbCourse.Text & "',
                          `program_name` = '" & txtProgramName.Text & "',
                          `year_level` = '" & cmbYearLevel.Text & "',
                          `semester` = '" & cmbSemester.Text & "',
                          `descriptive_title` = '" & txtDescriptiveTitle.Text & "',
                          `course_number` = '" & txtCode.Text & "',
                          `lec_units` = '" & CStr(nudLec.Value) & "',
                          `lab_units` = '" & CStr(nudLab.Value) & "',
                          `units` = '" & CStr(nudTotalUnits.Value) & "',
                          `pre_requisite` = '" & txtPrerequisite.Text & "',
                          `co_requisite` = '" & txtCorequisite.Text & "',
                          `track` = '" & cmbTrack.Text & "',
                          `strand` = '" & cmbStrand.Text & "',
                          `class_type` = '" & class_type & "'   
                        WHERE `id` = '" & id & "' ;

                        "))


        Else

            DataSource(String.Format("INSERT INTO `program_of_study` (
                          `cat_id`,
                          `course_ID`,
                          `course_grade`,
                          `program_name`,
                          `year_level`,
                          `semester`,
                          `descriptive_title`,
                          `course_number`,
                          `lec_units`,
                          `lab_units`,
                          `units`,
                          `pre_requisite`,
                          `co_requisite`,
                          `track`,
                          `strand`,
                          `class_type`
                        ) 
                        VALUES
                          (
    
                            '" & catId & "',
                            '" & cmbCourse.SelectedValue & "',
                            '" & cmbCourse.Text & "',
                            '" & txtProgramName.Text & "',
                            '" & cmbYearLevel.Text & "',
                            '" & cmbSemester.Text & "',
                            '" & txtDescriptiveTitle.Text & "',
                            '" & txtCode.Text & "',
                            '" & CStr(nudLec.Value) & "',
                            '" & CStr(nudLab.Value) & "',
                            '" & CStr(nudTotalUnits.Value) & "',
                            '" & txtPrerequisite.Text & "',
                            '" & txtCorequisite.Text & "',
                            '" & cmbTrack.Text & "',
                            '" & cmbStrand.Text & "',
                            '" & class_type & "'  
                           ) ;

                        "))


        End If

        If OPERATION = "ADD" Then
            MessageBox.Show("Record Save...", "Successfully!")
        Else
            MessageBox.Show("Record Updated...", "Successfully!")
        End If

        btnAdd.Enabled = True
        btnEdit.Enabled = True
        GroupPanel2.Enabled = False
        getProgramStudy()

    End Sub

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        Close()
    End Sub
End Class