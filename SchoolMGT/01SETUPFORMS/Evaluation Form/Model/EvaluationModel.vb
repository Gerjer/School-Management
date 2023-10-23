Public Class EvaluationModel
    Friend Function getStudentRecord() As Object
        Dim str As String = ""
        str = "SELECT
person.person_id AS `id`,
person.display_name AS `name`
FROM
person
WHERE
person.person_type_id = 2 AND
person.status_type_id = 1 AND
person.end_time IS NULL

ORDER BY name
	           "
        Return DataSource(str)
    End Function

    Friend Function getStudentDetails(personID As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT
  person.person_id, 
	person.display_name, 
	Date_format(person.date_of_birth,'%M %d, %Y')'date_of_birth',  
	person.gender, 
	person.marital_status, 
	person.birth_place, 
	person_contact_person.contact_person, 
	person_address.address,
	person_address.address_type_id,
	(SELECT
course_name
FROM(SELECT 
  MAX(students.id) id,
	courses.course_name
FROM
	students
	INNER JOIN
	courses
	ON 
		students.course_id = courses.id
WHERE
	students.status_type_id = 1 AND
	students.person_id = person_id
	)A)'CourseName',
	(SELECT school_address FROM person_educational_attainment WHERE person_id = '" & personID & "' AND education_attainment = 'Elementary Graduate') 'Elementary',
	(SELECT school_address FROM person_educational_attainment WHERE person_id = '" & personID & "' AND education_attainment = 'High School Graduate') 'HighSchool'

FROM
	person
	INNER JOIN
	person_contact_person
	ON 
		person.person_id = person_contact_person.person_id
	INNER JOIN
	person_address
	ON 
		person.person_id = person_address.person_id AND person_address.address_type_id = 1
WHERE
	person.status_type_id = 1 AND
	person.end_time IS NULL AND
	person_contact_person.`status` = 1 AND
	person.person_id = '" & personID & "'
	"
        Return DataSource(sql)
    End Function

    Friend Function getCurriculum(personID As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT
  students_subjects.id,
	students_subjects.student_id,
	students_subjects.subject_id,
	CONCAT(students.year_level,' - ',CASE WHEN students.semester <> 'SUMMER' THEN SUBSTRING(students.semester,1,7)
	ELSE  students.semester END,' S.Y ',students.academice_year)'Title',
	subjects.`code`,
	subjects.`name`'Courses',
	IFNULL(students_subjects.equivalent,'') 'Grade',
	subjects.credit_hours 'No.OfUnits',
	program_of_study.pre_requisite,
	program_of_study.co_requisite,
	CASE WHEN program_of_study.pre_requisite IS NOT NULL THEN program_of_study.pre_requisite 
	     WHEN program_of_study.co_requisite IS NOT NULL THEN program_of_study.co_requisite
			 ELSE '' END AS 'Pre/CoRequest',
	subject_class_schedule.employee_name,		 
	'' AS 'SIGNATURE' 

FROM students
	INNER JOIN students_subjects ON students.id = students_subjects.student_id
	INNER JOIN subjects ON students_subjects.subject_id = subjects.id 
	INNER JOIN program_of_study ON subjects.id = program_of_study.id
	INNER JOIN subject_class_schedule ON students_subjects.subject_id = subject_class_schedule.subject_id
	
WHERE
 students.status_type_id = 1
 AND students.person_id = '" & personID & "'
 AND subject_class_schedule.employee_id <> 0
	
	GROUP BY subject_id
	ORDER BY students.id"
        Return DataSource(sql)
    End Function
End Class
