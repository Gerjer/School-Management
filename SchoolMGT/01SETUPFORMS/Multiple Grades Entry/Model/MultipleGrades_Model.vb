Imports DevExpress.XtraGrid.Columns

Public Class MultipleGrades_Model

    Dim dt As New DataTable
    Dim sql As String = ""
    Dim compute_grade As New GradeComputation


    Friend Function getInstructor() As Object

        sql = Nothing

        sql = "SELECT DISTINCT subject_class_schedule.employee_id 'id',subject_class_schedule.employee_name 'name'"
        sql += " FROM subject_class_schedule"
        sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id AND subject_class_schedule.employee_id <> 0"
        sql += " INNER JOIN batches ON students_subjects.batch_id = batches.id "
        sql += " INNER JOIN courses ON courses.id = batches.course_id  "
        sql += " INNER JOIN student_categories ON student_categories.id = courses.category_id"
        If AuthUserType = "USER" Then
            sql += " WHERE subject_class_schedule.employee_id = '" & AppSetup_Domain & "'"
        Else
            sql += " WHERE batches.school_year = '" & _school_year & "' AND student_categories.id = '" & _student_category_id & "'"
        End If

        sql += " ORDER BY employee_name"

        Return DataSource(sql)

    End Function

    Public InstID As String = ""
    Friend Function getCourse(joinID As String) As Object
        InstID = joinID
        Dim sql As String = "SELECT courses.id,courses.course_name 'name'"
        sql += " FROM subjects"
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id AND subject_class_schedule.employee_id > 0"
        sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id"
        sql += " INNER JOIN batches ON students_subjects.batch_id = batches.id"
        sql += " INNER JOIN courses ON courses.id = batches.course_id"
        sql += " INNER JOIN year_level ON batches.year_level = year_level.year_level"
        If AuthUserType = "USER" Then
            InstID = AppSetup_Domain
        End If
        sql += " WHERE subject_class_schedule.employee_id IN (" & InstID & ")"
        sql += " AND batches.school_year = '" & _school_year & "'"
        sql += " AND courses.category_id = '" & _student_category_id & "' "
        sql += " GROUP BY courses.id ORDER BY courses.course_name "

        Return DataSource(sql)
    End Function

    Friend Function DisplayGrade(courseID As String, yearlLevelID As String, subjectID As String, InstructorID As String) As Object

        Dim dt_grade_list As New DataTable
        Dim dt_cat_grade As New DataTable
        Dim dt_final_grade As New DataTable

        'Populate Data Columns
        dt_final_grade = getFinalGrade(InstructorID, courseID, yearlLevelID, subjectID, Semester)

        Dim CatID = dt_final_grade(0)("cat_id").ToString
        compute_grade.getCountCategory(CatID)

        dt_grade_list = compute_grade.getColumnHeader(dt_final_grade)


        Dim Col_limit As Integer = 3 + compute_grade.gradeperiod_cnt
        Dim col As Integer = 0

        'Add Rows
        Dim cnt As Integer = 0
        Do While dt_final_grade.Rows.Count < cnt
            dt_grade_list.Rows.Add()
            cnt += 1
        Loop

        For Each column As DataColumn In dt_grade_list.Columns
            For rows As Integer = 0 To dt_grade_list.Rows.Count - 1

                col += 1

                If column.ColumnName = dt_final_grade.Columns(col).ToString Then

                    For x As Integer = 0 To dt_final_grade.Rows.Count - 1
                        dt_grade_list(x)(column) = dt_final_grade(x)(col).ToString
                    Next

                Else
                    Dim insert_col As Integer = col

                    For xx As Integer = 0 To dt_grade_list.Rows.Count - 1

                        dt_cat_grade = getCategoryGrade(dt_grade_list(xx)(0))
                        If dt_cat_grade.Rows.Count > 0 Then

                            For Each row As DataRow In dt_cat_grade.Rows

                                If dt_grade_list.Columns(insert_col).ToString = row("ColumnName").ToString Then
                                    dt_grade_list(rows)(insert_col) = row("Grades").ToString
                                    insert_col += 1
                                End If
                            Next
                            insert_col = col

                        End If

                    Next

                    col -= compute_grade.gradeperiod_cnt

                End If

            Next
        Next


    End Function

    Friend Function Exist(rowID As Object) As Boolean
        Dim result As Integer = DataObject(String.Format("SELECT count(students_grading_id) FROM `student_grade` WHERE students_subject_id = '" & rowID & "'"))
        If result > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Friend Sub SubmitFinalGrade(rowID As String, average As Object, remarks As Object)

        Try
            DataSource(String.Format("UPDATE `students_subjects` 
                                        SET 
                                        `finalgrade` = '" & average & "',
                                        `finalremarks` = '" & remarks & "'
                                        WHERE
	                                        `id` = '" & rowID & "';"))
        Catch ex As Exception

        End Try
    End Sub

    Friend Function getEquivalent(total_average As Double) As Object

        Dim average As Double = 0
        sql = Nothing
        sql = "SELECT ratings FROM `grading_system` WHERE equivalent = '" & total_average & "'"
        Return DataObject(sql)
    End Function

    Private Function getCategoryGrade(StdSubjGrade_ID As Object) As DataTable

        sql = Nothing
        sql = "SELECT
	            student_grade.students_grading_id, 
               student_grading_period.`name` 'ColumnName',
	            IFNULL(student_grade.grades,'') 'Grades'
	         
            FROM
	            student_grade
            INNER JOIN student_grading_period ON 	student_grading_period.id = student_grade.students_grading_id
            WHERE
	            student_grade.students_subject_id = '" & StdSubjGrade_ID & "'
	            ORDER BY students_grading_id"

        Return DataSource(sql)
    End Function

    Dim CourseID As String = ""
    Friend Function getSemester(joinID As String) As Object
        CourseID = joinID
        sql = Nothing
        sql = "SELECT batches.id,batches.semester 'name'"
        sql += " FROM subjects"
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id AND subject_class_schedule.employee_id > 0 "
        sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id"
        sql += " INNER JOIN batches ON students_subjects.batch_id = batches.id"
        sql += " INNER JOIN courses ON courses.id = batches.course_id"
        sql += " INNER JOIN year_level ON batches.year_level = year_level.year_level"
        If AuthUserType = "USER" Then
            InstID = AppSetup_Domain
        End If
        sql += " WHERE subject_class_schedule.employee_id IN (" & InstID & ")"
        sql += " AND batches.school_year = '" & _school_year & "'"
        sql += " AND courses.category_id = '" & _student_category_id & "' "
        sql += " AND batches.course_id IN(" & CourseID & ")"
        sql += " GROUP BY batches.semester 	ORDER BY batches.semester"

        Return DataSource(sql)
    End Function

    Friend Sub InsertGrade(rowID As String, gradeperiodID As String, grade_value As String)

        Try
            DataSource(String.Format("INSERT INTO student_grade (`students_grading_id`, `students_subject_id`, `grades`) VALUES ('" & gradeperiodID & "', '" & rowID & "', '" & grade_value & "');"))
        Catch ex As Exception

        End Try


    End Sub

    Public Function getFinalGrade(instructorID As String, courseID As String, yearlLevelID As String, subjectID As String, semester As String) As DataTable

        sql = Nothing

        sql = "SELECT students_subjects.id 'StdSubject_id',students.id 'Std_id',person.display_name 'STUDENT NAME'"
        sql += ", concat(courses.course_name,' - ',SUBSTR( batches.year_level , 1, 1 )) 'COURSE NAME',IFNULL(finalgrade,'') 'AVERAGE'"
        sql += ", IFNULL(equivalent,'') 'EQUIVALENT',IFNULL(finalremarks,'')'REMARKS','' AS 'btnadd','' AS 'btnedit',students_subjects.subject_id"
        sql += ", subjects.`name` 'SubjectTitle',students.student_category_id 'cat_id',students.academice_year"
        sql += ", students.course_id,.students_subjects.batch_id,batches.semester,batches.year_level   "
        sql += ", subject_class_schedule.employee_id,subject_class_schedule.employee_name, CASE WHEN submit = 1 THEN 'True' ELSE 'False' END AS 'INCLUDE' "
        sql += "  FROM 	subject_class_schedule"
        sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id"
        sql += " INNER JOIN	students ON students_subjects.student_id = students.id"
        sql += " INNER JOIN	person	ON 	students.person_id = person.person_id"
        sql += " INNER JOIN	subjects	ON 	students_subjects.subject_id = subjects.id"
        sql += " INNER JOIN	batches ON students_subjects.batch_id = batches.id"
        sql += " INNER JOIN courses ON batches.course_id = courses.id"
        sql += " INNER JOIN year_level ON batches.year_level = year_level.year_level"
        sql += " WHERE subject_class_schedule.employee_id > 0"

        If instructorID <> "(Select All)" Then
            sql += " AND subject_class_schedule.employee_id IN (" & instructorID & ")"
        End If
        If courseID <> "" Then
            sql += " AND batches.course_id IN (" & courseID & ")"
        End If
        If yearlLevelID <> "" Then
            sql += " AND year_level.id IN(" & yearlLevelID & ")"
        End If
        If subjectID <> "" Then
            sql += " AND students_subjects.subject_id IN( " & subjectID & ")"
        End If
        If subjectID <> "" Then
            sql += " AND batches.semester IN( " & semester & ")"
        End If

        sql += " ORDER BY `cat_id`,academice_year,year_level.id,batches.semester,course_id,`SubjectTitle`,display_name"

        Return DataSource(sql)

    End Function

    Friend Sub RemoveGrade(rowID As String, gradeperiodID As String, toString As String)
        Try
            DataSource(String.Format("DELETE FROM student_grade WHERE `students_grading_id` = '" & gradeperiodID & "' AND `students_subject_id` = '" & rowID & "'"))
            DataSource(String.Format("UPDATE `students_subjects` SET `finalgrade` = '',equivalent = '',finalremarks = ''  WHERE `id` = '" & rowID & "';"))
        Catch ex As Exception

        End Try
    End Sub

    Friend Sub UpdateGrade(rowID As String, gradeperiodID As String, grade_value As String)

        Try
            DataSource(String.Format("UPDATE `student_grade` SET `grades` = '" & grade_value & "' WHERE	`students_grading_id` = '" & gradeperiodID & "' AND `students_subject_id` = '" & rowID & "';"))
        Catch ex As Exception

        End Try

    End Sub

    Friend Function getGrade(grade_id As String, std_grade_id As String) As String

        Dim grades As String = ""

        sql = Nothing
        sql = "SELECT grades FROM `student_grade` WHERE students_grading_id = '" & grade_id & "' AND students_subject_id = '" & std_grade_id & "'"

        grades = DataObject(sql)

        If grades Is Nothing Then
            grades = ""
        End If

        Return grades
    End Function

    Friend Function getBatchName(batchID As Object) As String
        Dim str As String = DataObject(String.Format("SELECT `name` FROM batches WHERE id = '" & batchID & "'"))
        Return str
    End Function

    Friend Function DateScheduleExpired(batchID As Integer) As Boolean
        Dim id As Integer = DataObject(String.Format("SELECT id FROM batches WHERE grade_dist_from <= '" & Format(Date.Now, "yyyy-MM-dd") & "' AND grade_dist_to >= '" & Format(Date.Now, "yyyy-MM-dd") & "' AND id = '" & batchID & "'"))
        If id > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Dim Semester As String = ""
    Friend Function getYearLevel(joinName As String) As Object
        Semester = joinName
        sql = Nothing
        sql = "SELECT year_level.id,year_level.year_level'name'"
        sql += " FROM subjects"
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id AND subject_class_schedule.employee_id > 0 "
        sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id"
        sql += " INNER JOIN batches ON students_subjects.batch_id = batches.id"
        sql += " INNER JOIN courses ON courses.id = batches.course_id"
        sql += " INNER JOIN year_level ON batches.year_level = year_level.year_level"
        If AuthUserType = "USER" Then
            InstID = AppSetup_Domain
        End If
        sql += " WHERE subject_class_schedule.employee_id IN (" & InstID & ")"
        sql += " AND batches.school_year = '" & _school_year & "'"
        sql += " AND courses.category_id = '" & _student_category_id & "' "
        sql += " AND batches.course_id IN(" & CourseID & ")"
        sql += " AND batches.semester IN(" & Semester & ")"
        sql += " GROUP BY id	ORDER BY `name`"

        Return DataSource(sql)
    End Function

    Dim YRLevelID As String = ""
    Friend Function getSubject(joinID As String) As Object

        YRLevelID = joinID
        sql = Nothing
        sql = "SELECT subjects.id,subjects.`name`"
        sql += " FROM subjects"
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id AND subject_class_schedule.employee_id > 0 "
        sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id"
        sql += " INNER JOIN batches ON students_subjects.batch_id = batches.id"
        sql += " INNER JOIN courses ON courses.id = batches.course_id"
        sql += " INNER JOIN year_level ON batches.year_level = year_level.year_level"
        If AuthUserType = "USER" Then
            InstID = AppSetup_Domain
        End If
        sql += " WHERE subject_class_schedule.employee_id IN (" & InstID & ")"
        sql += " AND batches.school_year = '" & _school_year & "'"
        sql += " AND courses.category_id = '" & _student_category_id & "' "
        sql += " AND batches.course_id IN(" & CourseID & ")"
        sql += " AND batches.semester IN(" & Semester & ")"
        sql += " AND year_level.id IN(" & YRLevelID & ")"
        sql += " GROUP BY id	ORDER BY `name`"

        Return DataSource(sql)
    End Function

    Friend Function getHeaderName(std_grade_id As String) As DataTable
        Dim str As String = ""
        sql = ""
        sql = "SELECT CONCAT(student_grading_period.`name` ,' (',student_grading_period.weight_percentage,'%)')'name' ,weight_percentage FROM `student_grading_period` WHERE id = '" & std_grade_id & "'"
        Return DataSource(sql)
    End Function

    Friend Function getCategory() As Object

        If AuthUserType = "USER" Then
            sql = Nothing
            sql = "SELECT DISTINCT
                    student_categories.id,
                    student_categories.`name`
                    FROM
	                    student_categories
	                    INNER JOIN courses ON student_categories.id = courses.category_id
	                    INNER JOIN batches ON courses.id = batches.course_id
	                    INNER JOIN students_subjects ON batches.id = students_subjects.batch_id
	                    INNER JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
	
	                    WHERE subject_class_schedule.employee_id = " & AppSetup_Domain & "
	                    "
            Return DataSource(sql)
        Else

            sql = Nothing
            sql = "SELECT DISTINCT student_categories.id,student_categories.`name`"
            sql += " FROM 	subject_class_schedule"
            sql += " INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id"
            sql += " INNER JOIN batches ON students_subjects.batch_id = batches.id"
            sql += " INNER JOIN courses ON courses.id = batches.course_id"
            sql += " INNER JOIN student_categories ON student_categories.id = courses.category_id"
            If _school_year <> "" Then
                sql += " WHERE batches.school_year = '" & _school_year & "'"
            End If
            sql += " GROUP BY category_id"
            Return DataSource(sql)

        End If


    End Function

    Friend Sub UpdateFinal(rowID As String, FinalGrade As String, FinalEquivalent As String, FinalRemakrs As String)

        Try
            DataSource(String.Format("UPDATE `students_subjects` SET `finalgrade` = '" & FinalGrade & "',equivalent = '" & FinalEquivalent & "',finalremarks = '" & FinalRemakrs & "'  WHERE `id` = '" & rowID & "';"))
        Catch ex As Exception

        End Try


    End Sub

    Friend Function getBatchYear() As Object


        If AuthUserType = "USER" Then
            Dim sql As String = ""
            sql = "SELECT
                    batches.id,
                    batches.school_year 'name',
                    courses.category_id
                    FROM
	                    subject_class_schedule
	                    INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id
	                    INNER JOIN batches ON students_subjects.batch_id = batches.id
	                    INNER JOIN courses ON courses.id = batches.course_id
	                    INNER JOIN student_categories ON student_categories.id = courses.category_id
	
	                    WHERE subject_class_schedule.employee_id = '" & AppSetup_Domain & "'
	                    GROUP BY category_id
	                    ORDER BY `name` DESC"
            Return DataSource(sql)

        Else

            Dim sql As String = ""
            sql = "SELECT
                    batches.id,
                    batches.school_year 'name',
                    courses.category_id
                    FROM
	                    subject_class_schedule
	                    INNER JOIN students_subjects ON subject_class_schedule.SysPK_Item = students_subjects.subject_class_schedule_id
	                    INNER JOIN batches ON students_subjects.batch_id = batches.id
	                    INNER JOIN courses ON courses.id = batches.course_id
	                    INNER JOIN student_categories ON student_categories.id = courses.category_id
		                 
	                    GROUP BY category_id
	                    ORDER BY `name` DESC"
            Return DataSource(sql)

        End If


    End Function

    Friend Sub SubmitFinalGradeNew(rowID As String, Submitted As Integer)
        Try
            DataSource(String.Format("UPDATE `students_subjects` 
                                        SET 
                                        `submit` = '" & Submitted & "'
                                         WHERE
	                                        `id` = '" & rowID & "';"))
        Catch ex As Exception

        End Try
    End Sub
End Class
