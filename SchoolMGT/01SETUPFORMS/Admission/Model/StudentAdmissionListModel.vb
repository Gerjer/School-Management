Public Class StudentAdmissionListModel

    Public AllSemester As Boolean
    Public DailyRange As Boolean

    Public dateFrom As Date
    Public dateTo As Date

    Friend Function getSummaryOfEnrollment(YearFrom As String, YearTo As String, Semester As String, CatID As Integer) As DataTable

        Dim strSummer As String = ""
        If AllSemester = True Then
            strSummer = " students.semester LIKE '%'  "
        Else
            strSummer = " students.semester = '" & Semester & "'  "
        End If

        Dim strDateRange As String = ""
        If DailyRange = True Then
            strDateRange = " admission_date BETWEEN '" & Format(dateFrom.Date, "yyyy-MM-dd") & "' AND '" & Format(dateTo.Date, "yyyy-MM-dd") & "' "
        Else
            Dim AY As String = YearFrom & "-" & YearTo
            strDateRange = " academice_year = '" & AY & "'"
            '" academice_year BETWEEN '" & YearFrom & "' AND '" & YearTo & "' "
        End If


        Dim str As String = ""
        Select Case _student_category_id
            Case 13
                str = "CASE WHEN year_level LIKE '%1st%' THEN 'I'
                        WHEN year_level LIKE '%2nd%' THEN 'II'
                        WHEN year_level LIKE '%3rd%' THEN 'III'
                        ELSE 'IV' END AS 'YEAR LEVEL',"
            Case 14
                str = "CASE WHEN year_level LIKE '%1st%' THEN 'Grade 1'
                        WHEN year_level LIKE '%2nd%' THEN 'Grade 2'
                        WHEN year_level LIKE '%3rd%' THEN 'Grade 3'
                        WHEN year_level LIKE '%4th%' THEN 'Grade 4'
                        WHEN year_level LIKE '%5th%' THEN 'Grade 5'
                        ELSE 'Grade 6' END AS 'YEAR LEVEL',"
            Case 15
                str = "CASE WHEN year_level LIKE '%7th%' THEN 'Grade 7'
                        WHEN year_level LIKE '%8th%' THEN 'Grade 8'
                        WHEN year_level LIKE '%9th%' THEN 'Grade 9'	 
                        ELSE 'Grade 10' END AS 'YEAR LEVEL',"
            Case Else
                str = "CASE WHEN year_level LIKE '%11th%' THEN 'Grade 11'
                        ELSE 'Grade 12' END AS 'YEAR LEVEL',"
        End Select


        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
course_name 'PROGRAMS',
" & str & "
SUM(MALE) 'MALE',
SUM(FEMALE)'FEMALE',
SUM(MALE) + SUM(FEMALE) 'TOTAL',
semester 'SEMESTER',
academice_year,
student_category_id,
admission_date,
course_name 'PROGRAMS'
FROM
(
				SELECT
										courses.course_name, 
										batches.year_level,
										count(CASE WHEN person.gender = 'MALE' then 1
										ELSE 0 end) AS 'MALE',
										0 as 'FEMALE',
										students.semester,
										academice_year,
										students.student_category_id,
										students.admission_date

										FROM
										students
										INNER JOIN courses ON students.course_id = courses.id
										INNER JOIN person ON person.person_id = students.person_id
										INNER JOIN batches ON students.batch_id = batches.id

										where gender = 'MALE' AND is_enrolled = 1
										AND " & strSummer & "
										AND " & strDateRange & "
								     	AND student_category_id = '" & CatID & "'
									 
										GROUP BY semester,gender,year_level,course_name
										-- ORDER BY students.course_id,semester,batches.year_level
										
										
										
					UNION ALL
					
					
					
						SELECT
										courses.course_name, 
										batches.year_level,
										0 as 'MALE',
										count(CASE WHEN person.gender = 'FEMALE' then 1
										ELSE 0 end) AS 'FEMALE',
										students.semester,
										academice_year,
										students.student_category_id,
										students.admission_date

										FROM
										students
										INNER JOIN courses ON students.course_id = courses.id
										INNER JOIN person ON person.person_id = students.person_id
										INNER JOIN batches ON students.batch_id = batches.id

										where gender = 'FEMALE' AND is_enrolled = 1
						    			AND " & strSummer & "
										AND " & strDateRange & "
								     	AND student_category_id = '" & CatID & "'
									 
										GROUP BY semester,gender,year_level,course_name
										-- ORDER BY students.course_id,semester,batches.year_level

)A

 GROUP BY course_name,semester,year_level
 ORDER BY course_name,semester,year_level

"))
        Return dt
    End Function

    Friend Function getCategory() As Object

        Dim sql As String = ""
        sql = "SELECT
	student_categories.id, 
	student_categories.`name`
FROM
	student_categories
WHERE
	student_categories.is_deleted = 0"
        Return DataSource(sql)

    End Function

    Friend Function getComparativeData_Previous_Current_Year(YearFrom As String, YearTo As String) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	course_name 'PROGRAMS',
	CASE WHEN year_level LIKE '%1st%' THEN 'FIRST YEAR'
	 WHEN year_level LIKE '%2nd%' THEN 'SECOND YEAR'
	 WHEN year_level LIKE '%3rd%' THEN 'THIRD YEAR'
	 WHEN year_level LIKE '%4th%' THEN 'FOURTH YEAR'
	ELSE 'FIFTH YEAR' END AS 'YEAR LEVEL',
	sum(PreviousYear) '" & YearFrom & "',
	SUM(CurrentYear) '" & YearTo & "',
	academice_year
	
FROM(      
				SELECT
				courses.course_name, 
				students.year_level,
				CASE WHEN academice_year = '" & YearFrom & "' then 1
				ELSE 0 end  AS 'PreviousYear',
					0 AS 'CurrentYear',
	   	   academice_year

				FROM
				students
				INNER JOIN courses ON students.course_id = courses.id
				INNER JOIN person ON person.person_id = students.person_id
				INNER JOIN batches ON students.batch_id = batches.id

			   where academice_year BETWEEN '" & YearFrom & "' AND '" & YearTo & "'

				
			UNION ALL
			
				SELECT
				courses.course_name, 
				students.year_level,
				0 AS 'PreviousYear',
				CASE WHEN academice_year = '" & YearTo & "' then 1
				ELSE 0 end AS 'CurrentYear',
	   	   academice_year

				FROM
				students
				INNER JOIN courses ON students.course_id = courses.id
				INNER JOIN person ON person.person_id = students.person_id
				INNER JOIN batches ON students.batch_id = batches.id

			   where academice_year BETWEEN '" & YearFrom & "' AND '" & YearTo & "'

				)A
		 GROUP BY year_level,course_name"))
        Return dt
    End Function

    Friend Function getDefaultColumn(fromYear As String, toYear As String) As DataTable

        Dim str As String = ""
        Select Case _student_category_id
            Case 13
                str = "CASE WHEN students.year_level LIKE '%1st%' THEN 'FIRST YEAR'
                        WHEN students.year_level LIKE '%2nd%' THEN 'SECOND YEAR'
                        WHEN students.year_level LIKE '%3rd%' THEN 'THIRD YEAR'
                        ELSE 'FOURTH YEAR' END AS 'YEAR LEVEL',"
            Case 14
                str = "CASE WHEN students.year_level LIKE '%1st%' THEN 'Grade 1'
                        WHEN students.year_level LIKE '%2nd%' THEN 'Grade 2'
                        WHEN students.year_level LIKE '%3rd%' THEN 'Grade 3'
                        WHEN students.year_level LIKE '%4th%' THEN 'Grade 4'
                        WHEN students.year_level LIKE '%5th%' THEN 'Grade 5'
                        ELSE 'Grade 6' END AS 'YEAR LEVEL',"
            Case 15
                str = "CASE WHEN students.year_level LIKE '%7th%' THEN 'Grade 7'
                        WHEN students.year_level LIKE '%8th%' THEN 'Grade 8'
                        WHEN students.year_level LIKE '%9th%' THEN 'Grade 9'	 
                        ELSE 'Grade 10' END AS 'YEAR LEVEL',"
            Case Else
                str = "CASE WHEN students.year_level LIKE '%11th%' THEN 'Grade 11'
                        ELSE 'Grade 12' END AS 'YEAR LEVEL',"
        End Select


        Dim dt As New DataTable
        dt = DataSource(String.Format("

          SELECT
				courses.course_name,
                " & str & "
				students.year_level
	           

				FROM
				students
				INNER JOIN courses ON students.course_id = courses.id
				INNER JOIN person ON person.person_id = students.person_id
				INNER JOIN batches ON students.batch_id = batches.id
				
				  where academice_year BETWEEN '" & fromYear & "' AND '" & toYear & "' AND student_category_id = '" & _student_category_id & "'
				 GROUP BY year_level,course_name
				 
				 ORDER BY course_name,academice_year
				 "))
        Return dt
    End Function

    Friend Function getTotalEnrolled(course As Object, year_level As Object, year As String, Optional StatureIndex As String = "") As Integer

        Dim Total_Enrolled As Integer = 0
        If StatureIndex = "" Then
            Total_Enrolled = DataObject(String.Format("	SELECT
	   	   count(academice_year) AS '" & year & "'

				FROM
				students
				INNER JOIN courses ON students.course_id = courses.id
				INNER JOIN person ON person.person_id = students.person_id
				INNER JOIN batches ON students.batch_id = batches.id

			   WHERE students.year_level = '" & year_level & "' AND course_name = '" & course & "' AND  academice_year = '" & year & "'"))

        Else
            Total_Enrolled = DataObject(String.Format(" SELECT
                 count(academice_year) AS '" & year & "'
                  FROM(
			                 SELECT
	   	                        academice_year,
				                CASE WHEN students.stature = 'Transfered from Public School' THEN 0
				                     WHEN students.stature = 'Transferred from Private School' THEN 1
			  		                 WHEN students.stature = 'Senior High School Graduate' THEN 2
						                 ELSE 3 END AS 'StatureIndex'
			
				                FROM
				                students
				                INNER JOIN courses ON students.course_id = courses.id
				                INNER JOIN person ON person.person_id = students.person_id
				                INNER JOIN batches ON students.batch_id = batches.id

	    		                WHERE students.year_level = '" & year_level & "' AND course_name = '" & course & "' AND  academice_year = '" & year & "'
		                 )A
	                WHERE StatureIndex = '" & StatureIndex & "'"))

        End If


        Return Total_Enrolled
    End Function

    Friend Function checkRecordOfTheYear(year As String) As Integer
        Dim record As Integer = 0


        record = DataObject(String.Format("	 SELECT
	   	   count(academice_year)

				FROM
				students
				INNER JOIN courses ON students.course_id = courses.id
				INNER JOIN person ON person.person_id = students.person_id
				INNER JOIN batches ON students.batch_id = batches.id

			   WHERE  academice_year = '" & year & "'"))

        'Else

        '    record = DataObject(String.Format("SELECT
        '            count(academice_year)
        '            -- StatureIndex
        '            FROM(	 
        '             SELECT
        '                 academice_year,
        '                CASE WHEN students.stature = 'Transfered from Public School' THEN 0
        '                    WHEN students.stature = 'Transferred from Private School' THEN 1
        '                   WHEN students.stature = 'Senior High School Graduate' THEN 2
        '                  ELSE 3 END AS 'StatureIndex'
        '               FROM
        '               students
        '               INNER JOIN courses ON students.course_id = courses.id
        '               INNER JOIN person ON person.person_id = students.person_id
        '               INNER JOIN batches ON students.batch_id = batches.id

        '               WHERE academice_year = '" & year & "'
        '                )A
        '              WHERE StatureIndex = '" & StatureIndex & "'"))

        'End If

        Return record
    End Function

    Friend Function getListOfTransferred(fromYear As String, toYear As String, stature As String) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format(""))
        Return dt
    End Function
End Class
