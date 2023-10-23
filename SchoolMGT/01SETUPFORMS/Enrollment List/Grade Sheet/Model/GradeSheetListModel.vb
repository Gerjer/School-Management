Public Class GradeSheetListModel

    Public CatID As Integer

    Friend Function RetreivedList(where As String) As DataTable

        Dim dt As New DataTable
        Dim sql As String = ""
        sql += " SET @rowMale := 0;"
        sql += " SET @rowFemale := 0;"
        sql += " SELECT"
        sql += " CASE WHEN gender = 'MALE' Then @rowMale := @rowMale + 1 Else @rowFemale := @rowFemale + 1 End As 'NO.'"
        sql += " ,person_id,last_name 'LAST NAME',first_name 'FIRST NAME',middle_name 'MIDDLE NAME',gender"
        sql += " ,CONCAT(course_name,' ',year_level) 'COURSE / YEAR',finalgrade,student_subject_id"
        sql += " FROM("
        sql += "     SELECT"
        sql += "     person.person_id,person.last_name,person.first_name,person.middle_name,person.gender,courses.course_name,students.year_level"
        sql += "    ,students_subjects.finalgrade,students_subjects.id 'student_subject_id',subjects.id 'subjectid',students.semester"
        sql += "    ,students.academice_year,day_schedule_id,class_timing_id,room_id"
        sql += "      FROM"
        sql += "          students_subjects"
        sql += "          INNER JOIN subject_class_schedule ON students_subjects.subject_id = subject_class_schedule.subject_id"
        sql += "          INNER JOIN students ON students.id = students_subjects.student_id"
        sql += "          INNER JOIN person ON person.person_id = students.person_id"
        sql += "          INNER JOIN subjects ON subject_class_schedule.subject_id = subjects.id"
        sql += "          INNER JOIN courses ON students.course_id = courses.id"
        sql += "          WHERE person.status_type_id = 1 and person.end_time is NULL"
        sql += "      )A "
        sql += "        " & where & ""

        dt = clsDBConn.ExecQuery(sql)

        Return dt

#Region "Old"
        '        Dim dt As New DataTable
        '        dt = DataSource(String.Format("
        '       SELECT
        'CASE WHEN gender = 'MALE' THEN _male + 1
        'ELSE _female + 1 END as 'No.',
        'person_id,
        'last_name 'LAST NAME',
        'first_name 'FIRST NAME',
        'middle_name 'MIDDLE NAME',
        'gender,
        '	CONCAT(course_name,' ',year_level) 'COURSE / YEAR',
        'finalgrade,
        'student_subject_id

        'FROM(
        '			SELECT
        '			person.person_id,
        '			person.last_name,
        '			person.first_name,
        '			person.middle_name,
        '			person.gender,
        '			courses.course_name,
        '			students.year_level,
        '			students_subjects.finalgrade,
        '			students_subjects.id 'student_subject_id',
        '			subjects.id 'subjectid',
        '			students.semester,
        '			students.academice_year,
        '			day_schedule_id,
        '			class_timing_id,
        '			room_id,
        '			0 '_male',
        '			0 '_female'

        '			FROM
        '			students_subjects
        '			INNER JOIN subject_class_schedule ON students_subjects.subject_id = subject_class_schedule.subject_id
        '			INNER JOIN students ON students.id = students_subjects.student_id
        '			INNER JOIN person ON person.person_id = students.person_id 
        '			INNER JOIN subjects ON subject_class_schedule.subject_id = subjects.id
        '			INNER JOIN courses ON students.course_id = courses.id

        '			WHERE person.status_type_id = 1 and person.end_time is NULL


        '			)A 
        '              " & where & "
        ' 		ORDER BY gender desc,course_name,year_level,last_name
        '                        "))
        '        Return dt
#End Region
    End Function

    Friend Function getSubject(batchID As Integer) As Object
        Dim sql As String = ""
        sql = "SELECT
	            subjects.id, 
	            subjects.`name`
            FROM
	            subjects
            WHERE
	            subjects.batch_id = '" & batchID & "'"
        Return DataSource(sql)
    End Function

    Friend Function getGradeSheetBatch(courseID As Integer, semester As String, year_level As String, academic_year As String) As Integer
        Dim id As Integer = DataObject(String.Format("SELECT DISTINCT
	                            batches.id
	                            FROM
	                            batches
	                            INNER JOIN students ON batches.id = students.batch_id
                            WHERE
	                            batches.course_id = '" & courseID & "' AND
	                            batches.semester = '" & semester & "' AND
	                            batches.year_level = '" & year_level & "' AND
	                            academice_year = '" & academic_year & "'"))
        Return id
    End Function

    Friend Function getList(AcademicYear As String, Semester As String, CourseID As Object) As Object

        Dim WHERE As String = ""
        If CourseID = 0 Then
            WHERE = "WHERE academic_year = '" & AcademicYear & "' AND semester = '" & Semester & "'"
        Else
            WHERE = "WHERE academic_year = '" & AcademicYear & "' AND semester = '" & Semester & "' AND courses.id = '" & CourseID & "'"
        End If

        Dim sql As String = ""
        sql = "SELECT
graduates_list.id,
person.person_id,
(SELECT DISTINCT
students.std_number
FROM
students
WHERE
students.person_id = person.person_id
)'stdNumber',
person.last_name,
person.first_name,
person.middle_name,
person.gender,
CONCAT(person_address.address,', ',person_address.barangay,', ',person_address.citymunicipality)'Address',
courses.course_name 'Program',
graduates_list.recognition_no,
graduates_list.year_graduate,
graduates_list.graduation_date,
graduates_list.academic_year,
graduates_list.semester,
courses.id 'CourseID'

FROM
graduates_list
INNER JOIN person ON graduates_list.person_id = person.person_id
INNER JOIN courses ON graduates_list.course_id = courses.id
LEFT JOIN person_address ON person.person_id = person_address.person_id

" & WHERE & "
GROUP BY last_name
ORDER BY course_name,last_name"
        Return DataSource(sql)

    End Function

    Friend Function getYearLevel(CatID As Object, AcademicYear As String, Semester As String, CousreName As String) As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
                subject_id 'id',
	            students.year_level 'name'
            FROM
	            students
	            INNER JOIN 	courses	ON students.course_id = courses.id
                INNER JOIN students_subjects ON students.id = students_subjects.student_id
            WHERE
            student_category_id = '" & CatID & "' AND
            academice_year LIKE '" & AcademicYear & "' AND
            semester LIKE '" & Semester & "' AND
	            courses.course_name LIKE '" & CousreName & "'
            	GROUP BY id
            ORDER BY students.year_level  
"
        Return DataSource(sql)
    End Function

    Friend Function getRoomAssign(subjectName As String, batch_id As Integer) As Object
        Dim sql As String = ""
        sql = " SELECT DISTINCT
	subject_class_schedule.room_id 'id',
	subject_class_schedule.room 'name'
	
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	
	WHERE
      subjects.`name` = '" & subjectName & "' AND students_subjects.batch_id = '" & batch_id & "' "
        Return DataSource(sql)
    End Function

    Friend Function getDaySchedule(subjectName As String, batch_id As Integer) As Object
        Dim sql As String = ""
        sql = " SELECT DISTINCT
	subject_class_schedule.day_schedule_id 'id',
	subject_class_schedule.`day`'name'
	
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	
	WHERE
      subjects.`name` = '" & subjectName & "'  AND students_subjects.batch_id = '" & batch_id & "'"
        Return DataSource(sql)
    End Function

    Friend Function getTimeSchedule(subjectName As String, batch_id As Integer) As Object
        Dim sql As String = ""
        sql = " SELECT DISTINCT
	subject_class_schedule.class_timing_id 'id',
	subject_class_schedule.class_time 'name'    
	
	FROM
	students_subjects
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id
	INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
	INNER JOIN students ON students_subjects.student_id = students.id
	
	WHERE
      subjects.`name` = '" & subjectName & "' AND students_subjects.batch_id = '" & batch_id & "' "
        Return DataSource(sql)
    End Function

    Friend Function getCourse() As Object
        Dim sql As String = ""
        sql = "SELECT
courses.id,
courses.course_name 'name',
courses.category_name
FROM
courses
WHERE
courses.is_deleted = 0 AND courses.course_name LIKE '%GRADE 12%' OR  courses.category_name = 'COLLEGE' OR courses.course_name = 'GRADE-6'

GROUP BY courses.course_name
ORDER BY courses.category_name DESC
"
        Return DataSource(sql)
    End Function

    Friend Function LoadGradeSheet(student_category_id As String, academicYear As String, semester As String, batch_id As String, subject As Object, daySched As Object, timeSched As Object, room As Object) As DataTable

        Dim dt As New DataTable
        '      Dim sql As String = "CALL get_GradeSheet_ger2x('" & student_category_id & "','" & academicYear & "','" & semester & "','" & batch_id & "','" & subject & "','" & daySched & "','" & timeSched & "','" & room & "')"
        Dim sql As String = "CALL get_GradeSheetString_ger2x('" & student_category_id & "','" & academicYear & "','" & semester & "','" & batch_id & "','" & subject & "','" & daySched & "','" & timeSched & "','" & room & "')"

        dt = DataSource(String.Format(sql))
        Return dt

    End Function

    Friend Function getStudentSubjectID(subjID As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	students_subjects.id
FROM
	students_subjects
WHERE
 students_subjects.subject_id = " & subjID & ""
        Return DataSource(sql)
    End Function

    Friend Function getAcademicYear(StudentCategory_id As Integer) As Object

        Dim sql As String = ""
        sql = "SELECT DISTINCT students.academice_year 'name'"
        sql += " FROM students"
        sql += " WHERE academice_year is NOT NULL"
        If StudentCategory_id > 0 Then
            sql += " AND student_category_id = '" & StudentCategory_id & "'"
        End If
        Return DataSource(sql)

    End Function

    Friend Function getInstructor(subjID As String) As Object
        Dim instructor As String = ""
        instructor = "SELECT
  subject_class_schedule.employee_name
	FROM
	subject_class_schedule
WHERE
	subject_class_schedule.subject_id = '" & subjID & "'
	AND employee_id <> 0
/*	AND `day` <> 'TBA'
	AND class_time <> 'TBA'
	AND room <> 'TBA' */"
        Return DataObject(instructor)
    End Function

    Friend Function getGradeSheetRecord(AcademicYear As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
'' as 'No.',
person.person_id,
person.last_name,
person.first_name,
person.middle_name,
person.gender,
CONCAT(courses.course_name,' - ',SUBSTRING(students.year_level,1,1)) 'COURSE / YEAR',
students_subjects.id 'StudentSubjID',
(SELECT
	student_grade.grades
	FROM
	student_grade
	WHERE
	student_grade.students_grading_id = 1 AND
	student_grade.students_subject_id = 'StudentSubjID'
	) 'MIDTERM',
	(SELECT
	student_grade.grades
	FROM
	student_grade
	WHERE
	student_grade.students_grading_id = 2 AND
	student_grade.students_subject_id = 'StudentSubjID'
	) 'FINAL',
  CONCAT((SELECT
					student_grade.remarks
					FROM
					student_grade
					WHERE
					student_grade.students_grading_id = 1 AND
					student_grade.students_subject_id = 'StudentSubjID'
					) 
	,' ',
					(SELECT
					student_grade.remarks
					FROM
					student_grade
					WHERE
					student_grade.students_grading_id = 2 AND
					student_grade.students_subject_id = 'StudentSubjID'
					) ) 'Remarks',

    subjects.id 'ID',
	CONCAT(subjects.`code`,' - ',subjects.`name`) AS 'Name',
	CONCAT('Units = ',subjects.credit_hours,', ','Amount Unit = ',subjects.amount,', ','Credit Distribution - ',subjects.creditdistribution) As 'Description',
	employees.employee_department_id,
	employee_departments.`name` AS 'Deparment',
	students.semester,
	students.academice_year,
	subject_class_schedule.day_schedule_id,
	subject_class_schedule.`day`,
	subject_class_schedule.class_timing_id,
	subject_class_schedule.class_time,
	subject_class_schedule.room_id,
	subject_class_schedule.room

FROM
students_subjects
INNER JOIN subjects ON students_subjects.subject_id = subjects.id
INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id
INNER JOIN students ON students_subjects.student_id = students.id
INNER JOIN courses ON students.course_id = courses.id
LEFT JOIN employees ON subject_class_schedule.employee_id = employees.id
LEFT JOIN employee_departments ON employees.employee_department_id = employee_departments.id
INNER JOIN person ON person.person_id = students.person_id 

WHERE person.status_type_id = 1 AND students.academice_year = '" & AcademicYear & "'

-- GROUP BY id
ORDER BY gender DESC,course_name,year_level,last_name
-- ORDER BY subjects.`name` asc

"
        Return DataSource(sql)
    End Function

    Friend Function getCourseSheet(CatId As Object, AcademicYear As String, Semester As String) As Object

        Dim sql As String = ""
        sql = "SELECT DISTINCT
	            courses.id, 
	            courses.course_name AS `name`,
                courses.dean_name
            FROM
	            courses
	            INNER JOIN
	            students
	            ON 
		            courses.id = students.course_id
            WHERE
	            students.student_category_id = '" & CatId & "' AND
	            students.academice_year = '" & AcademicYear & "' AND
	            students.semester = '" & Semester & "'
                              
"


        Return DataSource(sql)
    End Function

    Friend Function getGradeSetup(selectedValue As Object) As Integer
        Dim sql As String = "SELECT
count(student_grading_period.id)
FROM
student_grading_period
WHERE
student_grading_period.student_category_id = '" & selectedValue & "' AND is_deleted = 0 "
        Return DataObject(sql)
    End Function

    Dim subecjtIDstr As String = ""
    Dim daynameIDstr As String = ""
    Dim timeschedIDstr As String = ""
    Dim roomIDstr As Object

    Friend Function Filter(subecjtID As Integer, semester As String, year As String, daynameID As Integer, timeschedID As Integer, roomID As Integer) As DataTable



        Dim where As String = ""

        If subecjtID = 0 Then
            subecjtIDstr = "subjectid LIKE '%%'"
        Else
            subecjtIDstr = "subjectid = '" & subecjtID & "'"
        End If
        If daynameID = 0 Then
            daynameIDstr = "day_schedule_id LIKE '%%'"
        Else
            daynameIDstr = "day_schedule_id = '" & daynameID & "'"
        End If
        If timeschedID = 0 Then
            timeschedIDstr = "class_timing_id LIKE '%%'"
        Else
            timeschedIDstr = "class_timing_id = '" & timeschedID & "'"
        End If
        If roomID = 0 Then
            roomIDstr = "room_id LIKE '%%'"
        Else
            roomIDstr = "room_id = '" & roomID & "'"
        End If

        where = "WHERE academice_year LIKE '%" & year & "%' AND semester LIKE '%" & semester & "%'  AND " & subecjtIDstr & "
                  AND " & daynameIDstr & " AND " & timeschedIDstr & " AND " & roomIDstr & "
                  ORDER BY `SUBJECT`"

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT  
      academice_year 'YEAR',
      semester 'SEMESTER',
      year_level 'YEAR LEVEL',
      `name` 'SUBJECT',
      `day` 'DAY SCHEDULE',
      class_time 'TIME SCHEDULE',
      room 'ROOM',
      person_id,
      last_name 'LAST NAME',
      first_name 'FIRST NAME',
      middle_name 'MIDDLE NAME',
      gender,
      CONCAT(course_name,' ',year_level) 'COURSE / YEAR',
      finalgrade,
      student_subject_id

      
  FROM( 
        SELECT          
	students.academice_year,
	students.semester,
	students.year_level,
	subjects.name,
	subject_class_schedule.day,
        subject_class_schedule.class_time,
        subject_class_schedule.room,
	person.person_id,
	person.last_name,
	person.first_name,
	person.middle_name,
	person.gender,
	courses.course_name,	
	students_subjects.finalgrade,
	students_subjects.id 'student_subject_id',
	subjects.id 'subjectid',
	day_schedule_id,
	class_timing_id,
	room_id
	
	FROM
	students_subjects
	INNER JOIN subject_class_schedule ON students_subjects.subject_id = subject_class_schedule.subject_id
	INNER JOIN students ON students.id = students_subjects.student_id
	INNER JOIN person ON person.person_id = students.person_id 
	INNER JOIN subjects ON subject_class_schedule.subject_id = subjects.id
	INNER JOIN courses ON students.course_id = courses.id
	)A
                   " & where & "                    
        "))
        Return dt

    End Function

    Friend Function RoomList() As Object

        Dim dt As New DataTable
        Dim str As String = ""
        If SubjectClassSchedule.Rows.Count > 0 Then
            For Each Rooms In SubjectClassSchedule.Rows
                If str = "" Then
                    str = Rooms("room_id").ToString
                Else
                    str = str + "," + Rooms("room_id").ToString
                End If

            Next
            dt = DataSource(String.Format("SELECT
            rooms.SysPK_Item 'ID',
            rooms.`name` 'Name'

            FROM
            rooms
            WHERE rooms.SysPK_Item IN('" & str & "')
            ORDER BY rooms.`name`
			"))
        Else
            dt = DataSource(String.Format("SELECT
            rooms.SysPK_Item 'ID',
            rooms.`name` 'Name'

            FROM
            rooms
            ORDER BY rooms.`name`"))
        End If
        Return dt
    End Function

    Dim dt_result As DataTable
    Friend Function LoadGradeSheetNew(listOfID As List(Of String), Optional subjectID As Integer = Nothing) As DataTable

        Dim ExitLoop As Boolean = False
        Dim id As String = ""
        Dim rowMale As Integer = 0
        Dim rowFemale As Integer = 0
        Dim gender As String = "MALE"
        Dim AddRow As Boolean = False
        Try
            dt_result = getHeaderColum()
            Dim dt As New DataTable
            Dim x As Integer = 0


            Try
                Dim sql As String = "CALL get_GradeSheetPerSubject_ger2x(" & subjectID & ")"
                dt = DataSource(String.Format(sql))

                If dt.Rows.Count > 0 Then

                    For row As Integer = 0 To dt.Rows.Count - 1

                        'backToLoopFemaleNew:

                        dt_result.Rows.Add()

                        For col As Integer = 0 To dt.Columns.Count - 1

                            If col = 0 Then


                                If gender = dt.Rows(row).Item("GenderOrder").ToString Then

                                    rowMale += 1
                                    dt_result(row)(col) = rowMale
                                    '         AddRow = True

                                Else
                                    rowFemale += 1
                                    dt_result(row)(col) = rowFemale
                                    'Else
                                    '    dt_result.Rows.Remove(dt_result.Rows(x))
                                    '    AddRow = False

                                End If
                                '    ElseIf gender = dt.Rows(row).Item("GenderOrder").ToString Then
                            Else
                                dt_result(x)(col) = dt.Rows(row).Item(col).ToString
                            End If

                        Next

                        'If AddRow Then
                        '    x += 1
                        'End If

                        'rowMale = 0
                        'gender = "FEMALE"
                        'If ExitLoop = False Then
                        '    ExitLoop = True
                        '    GoTo backToLoopFemaleNew
                        'End If

                    Next


                End If


            Catch ex As Exception

            End Try



            '            Try
            'backToLoopFemale:
            '                For Each row In listOfID.ToList
            '                    id = row.ToString

            '                    'If id = 1791 Or id = 27271 Then
            '                    '    MsgBox("hI")
            '                    'End If

            '                    Dim sql As String = "CALL get_NewGradeSheet_ger2x(" & row.ToString & ")"
            '                    dt = DataSource(String.Format(sql))
            '                    If dt.Rows.Count > 0 Then

            '                        dt_result.Rows.Add()

            '                        For col As Integer = 0 To dt.Columns.Count - 1

            '                            If col = 0 Then


            '                                If gender = dt.Rows(0).Item("GenderOrder").ToString Then

            '                                    rowMale += 1
            '                                    dt_result(x)(col) = rowMale
            '                                    AddRow = True

            '                                    'Else
            '                                    '    rowFemale += 1
            '                                    '    dt_result(x)(col) = rowFemale
            '                                Else
            '                                    dt_result.Rows.Remove(dt_result.Rows(x))
            '                                    AddRow = False

            '                                End If
            '                            ElseIf gender = dt.Rows(0).Item("GenderOrder").ToString Then
            '                                dt_result(x)(col) = dt.Rows(0).Item(col).ToString
            '                            End If

            '                        Next
            '                        If AddRow Then
            '                            x += 1
            '                        End If

            '                    End If
            '                Next
            '                rowMale = 0
            '                gender = "FEMALE"
            '                If ExitLoop = False Then
            '                    ExitLoop = True
            '                    GoTo backToLoopFemale
            '                End If
            '            Catch ex As Exception

            '            End Try



        Catch ex As Exception

        End Try


        Return dt_result
    End Function

    Friend Function LoadGradeSheetParameters(listOfID As List(Of String)) As DataTable

        Dim str As String = ""
        For Each row In listOfID.ToList
            If str = "" Then
                str = row
            Else
                str = str & "," & row
            End If
        Next

        Dim sql As String = ""
        sql = "call get_NewGradeSheet_ger2x('" & str & "')"
        Return DataSource(sql)
    End Function

    Friend Function LoadGradeSheetPerSubject(subjID As String) As DataTable

        Dim sql As String = ""
        sql = "call get_GradeSheetPerSubject_ger2x('" & subjID & "')"
        Return DataSource(sql)
    End Function

    Private Function getHeaderColum() As DataTable
        Dim sql As String = ""
        sql = "SELECT 'No.','person_id','LAST NAME','FIRST NAME','MIDDLE NAME','COURSE / YEAR','finalgrade','StudentSubjID','GenderOrder' limit 0"
        Return DataSource(sql)
    End Function

    Friend Function TimeSchedList() As Object

        Dim dt As New DataTable
        Dim str As String = ""
        If SubjectClassSchedule.Rows.Count > 0 Then
            For Each TimeSched In SubjectClassSchedule.Rows
                If str = "" Then
                    str = TimeSched("class_timing_id").ToString
                Else
                    str = str + "," + TimeSched("class_timing_id").ToString
                End If

            Next
            dt = DataSource(String.Format("SELECT
	        class_timings.id AS ID,
            class_timings.`name` AS `Name`
            FROM
            class_timings
            WHERE
            class_timings.is_deleted = 0 AND class_timings.id IN('" & str & "')
			"))
        Else
            dt = DataSource(String.Format("SELECT
            class_timings.id AS ID,
            class_timings.`name` AS `Name`
            FROM
            class_timings
            WHERE
            class_timings.is_deleted = 0
           "))
        End If
        Return dt
    End Function

    Friend Function DayNameList() As Object
        Dim dt As New DataTable
        Dim str As String = ""
        If SubjectClassSchedule.Rows.Count > 0 Then
            For Each DayName In SubjectClassSchedule.Rows
                If str = "" Then
                    str = DayName("day_schedule_id").ToString
                Else
                    str = str + "," + DayName("day_schedule_id").ToString
                End If

            Next
            dt = DataSource(String.Format("SELECT
			day_schedule.id AS ID,
			day_schedule.`day_name` AS `Name`
			FROM
			day_schedule
			WHERE  day_schedule.id IN('" & str & "')"))
        Else
            dt = DataSource(String.Format("SELECT
            day_schedule_id AS ID,
            day_schedule.`day_name` AS `Name`
            FROM
            day_schedule"))
        End If

        Return dt
    End Function

    Friend Function SubjectList(CourseName As String, YearLevel As String) As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT subjects.id,subjects.`name`,subjects.credit_hours,"
        sql += " CONCAT('Units = ', subjects.credit_hours, ', ', 'Amount Unit = ', subjects.amount, ', ', 'Credit Distribution - ', subjects.creditdistribution ) 'Description'"
        sql += " FROM students_subjects "
        sql += " INNER JOIN subjects ON students_subjects.subject_id = subjects.id "
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id "
        sql += " INNER JOIN students ON students_subjects.student_id = students.id "
        sql += " INNER JOIN courses ON courses.id = students.course_id "
        sql += " courses.category_name LIKE = '" & CourseName & "' AND students.year_level IN(" & YearLevel & ") "
        Return DataSource(sql)
    End Function

    Friend Function StudentCategoryList() As Object
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
student_categories.id,
student_categories.`name`
FROM
student_categories
WHERE
student_categories.is_deleted = 0 "))
        Return dt
    End Function

    Friend Function getSemester(StudentCategory_id As Integer, AcademicYear As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT DISTINCT students.semester 'name'  "
        sql += " FROM students"
        sql += " WHERE semester IS NOT NULL"
        If StudentCategory_id > 0 Then
            sql += " AND student_category_id = '" & StudentCategory_id & "' "
        End If
        If AcademicYear <> "" Then
            sql += " AND  academice_year = '" & AcademicYear & "'"
        End If
        sql += " ORDER BY semester"
        Return DataSource(sql)

    End Function

    Dim SubjectClassSchedule As New DataTable
    Dim SubjectID As Integer
    Friend Function getMultipleID_SubjectClassSchedule(subecjtID As Integer) As DataTable
        SubjectID = subecjtID
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
students.semester,
students.academice_year,
subject_class_schedule.day_schedule_id,
subject_class_schedule.class_timing_id,
subject_class_schedule.room_id,
subject_class_schedule.subject_id

FROM
subject_class_schedule
INNER JOIN students_subjects ON subject_class_schedule.subject_id = students_subjects.subject_id
INNER JOIN students ON students_subjects.student_id = students.id
WHERE
subject_class_schedule.subject_id = '" & subecjtID & "'

GROUP BY semester,academice_year,day_schedule_id,class_timing_id,room_id
"))

        If dt.Rows.Count > 0 Then
            SubjectClassSchedule = dt
        End If

        Return dt


    End Function

    Friend Function RetreivedNewList(subecjtID As Integer, semester As String, year As String, daynameID As Integer, timeschedID As Integer, roomID As Integer) As DataTable
        Dim dt As New DataTable
        Dim sql As String = "CALL get_Newgrade_sheet_ger2x('" & subecjtID & "','" & semester & "','" & year & "','" & daynameID & "','" & timeschedID & "','" & roomID & "')"
        dt = DataSource(String.Format(sql))     'dt = DataSource(String.Format(sql))
        Return dt
    End Function

    Friend Function DepartmentList() As Object
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                  `id` AS 'ID',
                  `name` AS 'Name'
                FROM `employee_departments`
                WHERE `status` = 1"))
        Return dt
    End Function

    Friend Function Grades(student_subject_id As Integer) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("
                SELECT
                `name`,
                grades,
                students_subject_id,
                id
                FROM(
			                SELECT
			                student_grading_period.`name`,
			                student_grade.grades,
			                student_grade.students_subject_id,
			                id
			                FROM
			                student_grade
			                INNER JOIN student_grading_period ON student_grade.students_grading_id = student_grading_period.id
			                WHERE
			                student_grade.students_subject_id = '" & student_subject_id & "'

                 UNION ALL               
							
							 SELECT	'AVERAGE' AS 'name',
				    			students_subjects.finalgrade AS 'grades',
					        	students_subjects.id AS 'students_subject_id',
								98 AS 'id'
							FROM
								students_subjects
							WHERE
								students_subjects.id = '" & student_subject_id & "'
						 
				  UNION ALL
                 
			    			 SELECT 
									'EQUIVALENT' AS 'name',
									equivalent AS 'grades',
									students_subjects.id AS 'students_subject_id',
									99 AS 'id'
									FROM
									students_subjects
									WHERE
									students_subjects.id = '" & student_subject_id & "'
                     
                 UNION ALL

								SELECT 
								    'REMARKS'  AS 'name',
								     IFNULL(finalremarks,'') AS 'grades',
										 	 '' AS 'students_subject_id',
											 100 AS 'id'
								 FROM students_subjects WHERE id = '" & student_subject_id & "'
                     )B
		                 ORDER BY id
                     "))
        Return dt
    End Function

    Friend Function getBatchList() As Object
        Dim sql As String = ""
        sql = "SELECT
	batches.id AS ID, 
	batches.`name` AS `NAME`, 
	batches.year_level, 
	batches.school_year, 
	batches.semester, 
	batches.course_id
FROM
	student_categories
	INNER JOIN
	courses
	ON 
		student_categories.id = courses.category_id
	INNER JOIN
	batches
	ON 
		courses.id = batches.course_id
WHERE
	batches.is_deleted = 0 AND
	batches.SysPk <> 0 AND
	student_categories.id = 13
ORDER BY
	batches.`name`, 
	batches.year_level, 
	batches.school_year
"
        Return DataSource(sql)
    End Function

    Friend Function getColumn(studentcategoryID As Integer) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
`name`
FROM(
SELECT
student_grading_period.`name`,
student_grading_period.id
FROM
student_grading_period
WHERE
student_grading_period.student_category_id = '" & studentcategoryID & "' AND is_deleted = 0

UNION ALL

SELECT
'AVERAGE' as 'name',
98 as 'id'

UNION ALL

SELECT
'EQUIVALENT' as 'name',
99 as 'id'

UNION ALL

SELECT
'REMARKS' as 'name',
100 as 'id'
)A
ORDER BY id"))
        Return dt
    End Function

    Friend Function getBatchGradeSheet(StudentCategory_id As Object, AcademicYear As String, Semester As String) As Object
        Dim sql As String = ""
        sql = " SELECT DISTINCT batches.id,batches.`name`"
        sql += " FROM students_subjects"
        sql += " INNER JOIN subjects ON students_subjects.subject_id = subjects.id"
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id   "
        sql += " INNER JOIN students ON students_subjects.student_id = students.id"
        sql += " INNER JOIN batches ON students.batch_id = batches.id"
        If StudentCategory_id > 0 Then
            sql += " WHERE students.student_category_id = '" & StudentCategory_id & "'"
        End If
        If AcademicYear <> "" Then
            sql += " AND students.academice_year LIKE '" & AcademicYear & "'"
        End If
        If Semester <> "" Then
            sql += " AND students.semester LIKE '" & Semester & "'"
        End If
        sql += " ORDER BY  `name`,students.semester,students.course_id,students.year_level"
        Return DataSource(sql)
    End Function

    Friend Function SubjectListNew(batchID As String) As Object

        Dim sql As String = ""
        sql = "SELECT students_subjects.id,subjects.`name`,`day`,class_time,room"
        sql += " ,(SELECT gender FROM person WHERE person.person_id = students.person_id ) 'GenderOrder',subjects.id 'subjID'"
        sql += " FROM students_subjects "
        sql += " INNER JOIN subjects ON students_subjects.subject_id = subjects.id "
        sql += " INNER JOIN subject_class_schedule ON subjects.id = subject_class_schedule.subject_id "
        sql += " INNER JOIN students ON students_subjects.student_id = students.id "
        sql += " INNER JOIN courses ON courses.id = students.course_id "
        '   sql += " WHERE  subjects.id IN(" & subjectID & ") "
        sql += " WHERE students_subjects.batch_id = '" & batchID & "' AND (SELECT gender FROM person WHERE person.person_id = students.person_id ) IS NOT NULL"
        sql += " order by `name`"
        Return DataSource(sql)

    End Function
End Class
