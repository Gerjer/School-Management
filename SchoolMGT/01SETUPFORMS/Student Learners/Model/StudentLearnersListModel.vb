Public Class StudentLearnersListModel

    Friend Function getStudentRecord() As Object
        Dim str As String = ""
#Region "old"

        'str = "SELECT
        '        ID,
        '        `Name`
        '        FROM(
        '         SELECT
        '         person.person_id AS ID,
        '         person.display_name AS `Name`
        '         FROM
        '         person
        '         WHERE
        '         person.person_type_id = 2 AND
        '         person.status_type_id = 1 AND
        '         person.end_time IS NULL

        '         UNION all

        '         SELECT 0 AS 'ID','---- ALL ----' AS 'Name'

        '         )A  ORDER BY ID"
#End Region

        str = "SELECT
	            ID,
                `Name`
                 FROM(
			                SELECT
			                person.person_id AS ID,
			                person.display_name AS `Name`
   			                FROM
			                person
			                INNER JOIN students ON person.person_id = students.person_id
			                WHERE
			                person.person_type_id = 2 AND
			                person.status_type_id = 1 AND
			                person.end_time IS NULL 

	                    UNION all
			
                      SELECT 0 AS 'ID','---- ALL ----' AS 'Name'
			
			                )A
			                -- WHERE `Name` = 'BARANGAN, MARY ANN FABILLAR'  
			                GROUP BY ID"

        Return DataSource(str)
    End Function

    Public _EnterName As String = ""
     Friend Function getStudentDetails(selectedValue As Object) As DataTable

        Dim where As String = ""
        If selectedValue = "---- ALL ----" Then
            where = "WHERE ID LIKE '%%'"
        Else
            where = "WHERE `Name` = '" & selectedValue & "'"
        End If

        Dim str As String = ""
        str = "SELECT
	ID,
`Name`,
-- CONCAT(`Name`,'                    ',StudentIDNumber,'',ClassRollNo,'',EnrolledStatus,'',Stature) 'Name',
	ClassRoll_Number
      FROM(
			SELECT
			person.person_id AS ID,
			person.display_name AS `Name`,
            students.id 'ClassRoll_Number',
			CONCAT('     CLASS ROLL NUMBER',' : ',students.class_roll_no) 'ClassRollNo',
			CONCAT('     ENROLLED STATUS',' : ',students.enrollmentAS) 'EnrolledStatus',
			CONCAT('     STATURE',' : ',students.stature) 'Stature',
			CONCAT('     STUDENT ID-NUMBER',' : ',students.std_number) 'StudentIDNumber'
			FROM
			person
			INNER JOIN students ON person.person_id = students.person_id
			WHERE
			person.person_type_id = 2 AND
			person.status_type_id = 1 AND
			person.end_time IS NULL 

			-- GROUP BY person.person_id
			ORDER BY `Name`
			)A
			
			" & where & "  "
        Return DataSource(str)
    End Function

    Friend Function getStudentBatchDetails(BatchID As Object) As DataTable
        Dim str As String = ""
        str = "SELECT
students.id,
students.course_id,
courses.course_name 'CourseName',
courses.`code`,
courses.description,
students.batch_id,
batches.`name` 'BatchName',
students.status_description,
students.year_level,
students.semester,
students.academice_year

FROM
students
INNER JOIN batches ON students.batch_id = batches.id
INNER JOIN courses ON students.course_id = courses.id
WHERE
students.status_type_id = 1 AND
students.batch_id = '" & BatchID & "'
ORDER BY
batches.year_level ASC,
batches.semester ASC
"
        Return DataSource(str)
    End Function

    Friend Function getCOR_Copies() As DataTable
        Dim sql As String = ""
        sql = "SELECT * FROM copies_of_cor "
        Return DataSource(sql)
    End Function

    Friend Function getStudentID(admissionNo As String) As Integer
        Dim id As Integer
        id = DataObject(String.Format("SELECT id FROM students WHERE status_type_id = 1 AND admission_no = '" & admissionNo & "'"))
        Return id
    End Function

    Friend Function getStudentCourse(ClassRollNo As Object) As DataTable
        Dim str As String = ""
        str = "SELECT
students.id,
students.course_id,
courses.course_name 'CourseName',
courses.`code`,
courses.description,
students.batch_id,
students.admission_no,
batches.`name` 'BatchName',
students.status_description,
students.year_level,
students.semester,
students.academice_year

FROM
students
INNER JOIN batches ON students.batch_id = batches.id
INNER JOIN courses ON students.course_id = courses.id
WHERE
students.status_type_id = 1 AND
students.id = '" & ClassRollNo & "'
GROUP BY students.course_id
ORDER BY
batches.year_level ASC,
batches.semester ASC
"
        Return DataSource(str)
    End Function

    Friend Function ExistingAssessment(studentID As Integer) As Boolean
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	                            *
                            FROM
	                            students_assessment
                            WHERE
	                            students_assessment.student_id = '" & studentID & "'"))
        If dt.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    Friend Function getDetails(admissionNo As String) As DataTable

        Dim SQLEX As String = ""
        SQLEX = "	SELECT
		                admission_no,
		                subjCode,
                    subjname,
		                credit_hours,
		                CASE WHEN rate <> 0 THEN rate
										     WHEN stdsub_lec_amount <> 0 THEN stdsub_lec_amount
		                     ELSE amount END AS 'amount',
		                subjid,
		                no_exams,				 
		                NAME,
		                room,
		                employee_name,
		                lab_name,
										CASE WHEN lab_amount <> 0 THEN lab_amount
										     ELSE stdsub_lab_amount END AS 'lab_amount'
		                		
	                FROM(
					                SELECT
										        students.admission_no,
						                subjects.CODE 'subjCode',
						                subjects.NAME 'subjname',
						                subjects.credit_hours,						              
						                subjects.id 'subjid',
						                subjects.no_exams,
						                subject_class_schedule.NAME,
						                subject_class_schedule.room,
						                subject_class_schedule.employee_name,
						                IFNULL( subject_laboratory.lab_name, '' ) 'lab_name',
						                IFNULL( subject_laboratory.amount, 0 ) 'lab_amount',
													  IFNULL(students_subjects.lab_amt,0) 'stdsub_lab_amount',										
						                IFNULL(student_rate.rate,0)'rate',
														IFNULL(students_subjects.lec_amt,0) 'stdsub_lec_amount',
														subjects.amount
					                FROM
						                students_subjects
						                INNER JOIN students ON ( students_subjects.student_id = students.id )
						                INNER JOIN subjects ON ( students_subjects.subject_id = subjects.id )
						                LEFT JOIN subject_class_schedule ON ( students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item )
						                LEFT JOIN subject_laboratory ON ( subjects.sub_lab_id = subject_laboratory.id ) 
						                LEFT JOIN student_rate ON students.id = student_rate.student_id
					                WHERE
						                admission_no = '" & admissionNo & "'
						                )A"

        Return DataSource(SQLEX)

    End Function

    Friend Function getStudentSubjectAssessment(admissionNo As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT
		                admission_no,
		                subjCode,
                    subjname,
		                credit_hours,
		                CASE WHEN rate <> 0 THEN rate
										     WHEN stdsub_lec_amount <> 0 THEN stdsub_lec_amount
		                     ELSE amount END AS 'amount',
		                subjid,
                        no_exams,		 
		                NAME,
		                room,
		                employee_name,
		                lab_name,
										CASE WHEN lab_amount <> 0 THEN lab_amount
										     ELSE stdsub_lab_amount END AS 'lab_amount'
		                		
	                FROM(
					                SELECT
										        students.admission_no,
						                subjects.CODE 'subjCode',
						                subjects.NAME 'subjname',
						                subjects.credit_hours,						              
						                subjects.id 'subjid',
						                subjects.no_exams,
						                subject_class_schedule.NAME,
						                subject_class_schedule.room,
						                subject_class_schedule.employee_name,
						                IFNULL( subject_laboratory.lab_name, '' ) 'lab_name',
						                IFNULL( subject_laboratory.amount, 0 ) 'lab_amount',
													  IFNULL(students_subjects.lab_amt,0) 'stdsub_lab_amount',										
						                IFNULL(student_rate.rate,0)'rate',
														IFNULL(students_subjects.lec_amt,0) 'stdsub_lec_amount',
														subjects.amount
					                FROM
						                students_subjects
						                INNER JOIN students ON ( students_subjects.student_id = students.id )
						                INNER JOIN subjects ON ( students_subjects.subject_id = subjects.id )
						                LEFT JOIN subject_class_schedule ON ( students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item )
						                LEFT JOIN subject_laboratory ON ( subjects.sub_lab_id = subject_laboratory.id ) 
						                LEFT JOIN student_rate ON students.id = student_rate.student_id
					                WHERE
						                admission_no = '" & admissionNo & "'
						                )A"


        Return DataSource(String.Format(sql))
    End Function

    Friend Function AddFees(mode_payment As String, enroll_status As String, semester As String) As DataTable
        If enroll_status = "NEW" Or enroll_status = "TRANFEREE" Then
            enroll_status = "NEW"
        Else
            enroll_status = "OLD"
        End If

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                    fees_protocol.id,
                    fees_protocol.enroll_status,
                    fees_protocol.mode_payment,
                    fees_protocol.semester,
                    fees_protocol.`trigger`
                    FROM
                    fees_protocol
                    WHERE
                    fees_protocol.mode_payment = '" & mode_payment & "' AND
                    fees_protocol.enroll_status = '" & enroll_status & "' AND
                    fees_protocol.semester = '" & semester & "'
                    "))
        Return dt
    End Function

    Friend Function getCurriculunmStatus(studentID As Integer) As String
        Dim sql As String = ""
        sql = "SELECT
CASE
	WHEN students.is_regular = 0 THEN 
		'Regular'
	ELSE
     'Irregular'
END AS 'CurriculunmStatus'

FROM
students
WHERE
students.status_type_id = 1 AND
students.end_time IS NULL AND
students.id = '" & studentID & "'
"
        Return DataObject(sql)
    End Function

    Friend Function getStudents_COR_info(admissionNo As String) As DataTable
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
  students.std_number as 'IdNumber',
	CONCAT(person.display_name,' - ',courses.course_name ,'(', batches.year_level, ')') AS 'NameCourse',
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
		students.admission_no = '" & admissionNo & "'"))
        Return dt


    End Function

    Friend Function getStudent(studentID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	students.year_level, 
	students.semester, 
	students.academice_year, 
	courses.description
FROM
	students
	INNER JOIN
	courses
	ON 
		students.course_id = courses.id
WHERE
	students.status_type_id = 1 AND
	students.id = '" & studentID & "' "
        Return DataSource(sql)
    End Function

    Friend Function getStudent_Subject_info(admissionNo As String) As DataTable
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
	    admission_no = '" & admissionNo & "'"))
        Return dt
    End Function

    Friend Function getTotalAmount(studentID As Integer) As String
        Dim Amount As String = ""
        Amount = DataObject(String.Format("SELECT
students_assessment.total 'Amount'

FROM
students_assessment

WHERE
students_assessment.student_id = '" & studentID & "' AND
students_assessment.columnName = 'D' AND 
students_assessment.stat = 'T+'"))
        Return Amount
    End Function

    Friend Function getStudent_Assessment_info(studentID As Integer) As DataTable
        Dim dt As New DataTable
#Region "old"
        '        dt = DataSource(String.Format("SELECT
        'Charges,
        'Amount
        'FROM(
        'SELECT
        'students_assessment.particulars 'Charges',
        'students_assessment.amount 'Amount'

        'FROM
        'students_assessment
        'INNER JOIN finance_fee_particulars ON students_assessment.particulars = finance_fee_particulars.`name`
        'WHERE
        'students_assessment.student_id = '" & studentID & "' AND
        'students_assessment.columnName = 'D'

        'UNION ALL

        'SELECT
        'students_assessment.particulars 'Charges',
        'students_assessment.amount 'Amount'

        'FROM
        'students_assessment
        '-- INNER JOIN finance_fee_particulars ON students_assessment.particulars = finance_fee_particulars.`name`
        'WHERE
        'students_assessment.student_id = '" & studentID & "' AND
        'students_assessment.columnName = 'D' AND students_assessment.particulars LIKE '%TUITION%'

        '/*
        'UNION ALL


        'SELECT
        'students_assessment.amount 'Charges',
        'students_assessment.total 'Amount'

        'FROM
        'students_assessment

        'WHERE
        'students_assessment.student_id = '" & studentID & "'/* AND
        'students_assessment.columnName = 'D' AND students_assessment.stat = '++' OR 
        'students_assessment.stat = '-+'  OR students_assessment.stat = '--'*/

        ')A
        'GROUP BY Charges


        '"))
#End Region
        dt = DataSource(String.Format("SELECT
students_assessment.masterfee 'Charges',
students_assessment.total 'Amount'
FROM
students_assessment
WHERE
students_assessment.columnName = 'H' AND
students_assessment.student_id = '" & studentID & "'
"))


        Return dt
    End Function

    Friend Function getRecord(pERSON_ID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
	person.last_name, 
	person.first_name, 
	person.middle_name, 
	person.display_name, 
	person.gender, 
	person.birth_place, 
	person.date_of_birth, 
	person.marital_status, 
	person.telephone1, 
	person.email, 
	person_address.address, 
	person_contact_person.contact_person, 
	person_contact_person.contact_number, 
	person_contact_person.contact_address, 
	students_details.LRN_number, 
	students.scholarshipgrant
FROM
	person
	LEFT JOIN
	person_address
	ON 
		person.person_id = person_address.person_id AND
		person_address.address_type_id = 1
	LEFT JOIN
	person_contact_person
	ON 
		person_address.person_id = person_contact_person.person_id
	LEFT JOIN
	students_details
	ON 
		person_contact_person.person_id = students_details.person_id
    INNER JOIN students ON 	person.person_id = students.person_id
WHERE
	person.end_time IS NULL AND
	person.status_type_id = 1 AND
	 person.person_id = '" & pERSON_ID & "'
	 "
        Return DataSource(sql)


    End Function

    Friend Sub getStudentCategory(admissionNo As String)
        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
	student_categories.id,
	student_categories.NAME,
    students.person_id,
    students.course_id
FROM
	students
	INNER JOIN student_categories ON ( student_categories.id = students.student_category_id ) 
WHERE
	admission_no = '" & admissionNo & "'"))
        If dt.Rows.Count > 0 Then
            _student_category_id = dt(0)("id")
            _student_category = dt(0)("NAME")
            PERSON_ID = dt(0)("person_id")
            _courseID = dt(0)("course_id")
        End If
    End Sub

    Friend Function getStudentSubject(id As Object) As DataTable
        Dim str As String = ""
        str = "SELECT
students_subjects.student_id,
subjects.`code` AS `SUBJECT CODE`,
subjects.`name` AS `SUBJECT NAME`,
subjects.credit_hours AS UNITS,
subject_class_schedule.`code` AS `CLASS CODE`,
subject_class_schedule.`name` AS `SCHEDULE`,
subject_class_schedule.room AS ROOM,
students_subjects.batch_id,
students_subjects.student_id
 
 FROM students_subjects
  LEFT JOIN subject_class_schedule ON students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
 INNER JOIN subjects ON students_subjects.subject_id = subjects.id

  WHERE students_subjects.student_id = '" & id & "'
 "
        Return DataSource(str)
    End Function

    Friend Function getBatchGroup(ClassRollNo As Object) As DataTable
        Dim str As String = ""
        str = "SELECT
students.id,
students.course_id,
courses.course_name 'CourseName',
courses.`code`,
courses.description,
students.batch_id,
students.admission_no,
batches.`name` 'BatchName',
students.status_description,
students.year_level,
students.semester,
students.academice_year

FROM
students
INNER JOIN batches ON students.batch_id = batches.id
INNER JOIN courses ON students.course_id = courses.id
WHERE
students.status_type_id = 1 AND
students.id = '" & ClassRollNo & "'
-- GROUP BY students.course_id
ORDER BY
batches.year_level ASC,
batches.semester ASC
"
        Return DataSource(str)
    End Function

    Friend Function getPreviousBalance(studentID As Integer) As Object
        Dim SQLEX As String = "SELECT student_additional_fields.name"
        SQLEX += " , student_additional_details.student_id"
        SQLEX += " , student_additional_details.additional_info"
        SQLEX += " FROM student_additional_details"
        SQLEX += " INNER JOIN student_additional_fields "
        SQLEX += " ON (student_additional_details.additional_field_id = student_additional_fields.id)"
        SQLEX += " WHERE student_additional_fields.id='1'"
        SQLEX += " and student_id='" & studentID & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim prevBal As String = "0.00"
        If MeData.Rows.Count > 0 Then
            Dim value As Double = 0

            Try
                value = CDbl(MeData.Rows(0).Item("additional_info").ToString)
                prevBal = Format(value, "#,##0.00")

            Catch ex As Exception

            End Try
        End If


        Return prevBal
    End Function

    Friend Function getDiscount(studentID As Integer) As Object
        Dim SQLEX As String = "SELECT additional_info, student_additional_fields.id"
        SQLEX += " FROM student_additional_details"
        SQLEX += " INNER JOIN student_additional_fields"
        SQLEX += " ON (student_additional_details.additional_field_id = student_additional_fields.id)"
        SQLEX += " WHERE student_additional_fields.id ='2'"
        SQLEX += " and student_id='" & studentID & "'"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim prevBal As String = "0.00"
        If MeData.Rows.Count > 0 Then
            Dim value As Double = 0

            Try
                value = CDbl(MeData.Rows(0).Item("additional_info").ToString)
                prevBal = Format(value, "#,##0.00")

            Catch ex As Exception

            End Try
        End If


        Return prevBal
    End Function

    Friend Function getStudentLearnersDetails(admissionNo As String) As DataTable
        Dim sql As String = ""
        sql = "SELECT 
students.id,
course_name,
batches.school_year,
students.semester,
students.year_level 
FROM students 
INNER JOIN courses ON students.course_id = courses.id
INNER JOIN batches ON students.batch_id = batches.id
WHERE status_type_id = 1 AND admission_no = '" & admissionNo & "'"
        Return DataSource(sql)
    End Function
End Class
