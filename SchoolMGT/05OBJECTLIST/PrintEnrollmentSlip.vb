Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraReports.UI


Public Class PrintEnrollmentSlip

    Dim EnrollSlip As New List(Of EnrollmentSlip)

    Friend Sub EnrollmentSlip(admissionNo As String, GridControl As GridControl, personID As Integer, GridView As GridView)

        Dim dt_units As New DataTable
        dt_units = GridControl.DataSource

        Dim LecUnits As Double = 0
        Dim LabUnits As Double = 0



        Dim Elementary_school As String = ""
        Dim Elementary_year_from As Date
        Dim Elementary_year_to As Date
        Dim High_school As String = ""
        Dim High_year_from As Date
        Dim High_year_to As Date

        Try
            Dim LastSchool_Attended As New DataTable
            LastSchool_Attended = getLastAttended_School(personID)
            Elementary_school = If(IsDBNull(LastSchool_Attended(0)("SCHOOLNAME").ToString), "", LastSchool_Attended(0)("SCHOOLNAME").ToString)
            Elementary_year_from = If(IsDBNull(LastSchool_Attended(0)("FROM").ToString), "", LastSchool_Attended(0)("FROM").ToString)
            Elementary_year_to = If(IsDBNull(LastSchool_Attended(0)("TO").ToString), "", LastSchool_Attended(0)("TO").ToString)
            High_school = If(IsDBNull(LastSchool_Attended(1)("SCHOOLNAME").ToString), "", LastSchool_Attended(1)("SCHOOLNAME").ToString)
            High_year_from = If(IsDBNull(LastSchool_Attended(1)("FROM").ToString), "", LastSchool_Attended(1)("FROM").ToString)
            High_year_to = If(IsDBNull(LastSchool_Attended(1)("TO").ToString), "", LastSchool_Attended(1)("TO").ToString)
        Catch ex As Exception

        End Try


        Dim dt As New DataTable
        dt = getRecord(personID)
        If dt.Rows.Count > 0 Then

            Try
                Dim obj As New EnrollmentSlip
                With obj
                    .last_name = If(IsDBNull(dt(0)("last_name")), "", dt(0)("last_name"))
                    .first_name = If(IsDBNull(dt(0)("first_name")), "", dt(0)("first_name"))
                    .middle_name = If(IsDBNull(dt(0)("middle_name")), "", dt(0)("middle_name"))
                    .display_name = If(IsDBNull(dt(0)("display_name")), "", dt(0)("display_name"))
                    .gender = If(IsDBNull(dt(0)("gender")), "", dt(0)("gender"))
                    .birth_place = If(IsDBNull(dt(0)("birth_place")), "", dt(0)("birth_place"))
                    .marital_status = If(IsDBNull(dt(0)("marital_status")), "", dt(0)("marital_status"))
                    .telephone1 = If(IsDBNull(dt(0)("telephone1")), "", dt(0)("telephone1"))
                    .email = If(IsDBNull(dt(0)("email")), "", dt(0)("email"))
                    .address = If(IsDBNull(dt(0)("address")), "", dt(0)("address"))
                    .contact_person = If(IsDBNull(dt(0)("contact_person")), "", dt(0)("contact_person"))
                    .contact_number = If(IsDBNull(dt(0)("contact_number")), "", dt(0)("contact_number"))
                    .contact_address = If(IsDBNull(dt(0)("contact_address")), "", dt(0)("contact_address"))
                    .LRN_number = If(IsDBNull(dt(0)("LRN_number")), "", dt(0)("LRN_number"))
                    .scholarship_any = If(IsDBNull(dt(0)("scholarship_any")), "", dt(0)("scholarship_any"))

                    .Academic_year = GridView.GetRowCellValue(0, "A.Y.") 'GridView.Columns(7).ToString
                    .course_grade = GridView.GetRowCellValue(0, "COURSE") 'GridView.Columns(4).ToString
                    .year_level = GridView.GetRowCellValue(0, "YEAR LEVEL") 'GridView.Columns(5).ToString
                    .semester = GridView.GetRowCellValue(0, "SEMESTER") 'GridView.Columns(6).ToString
                    .ID_Number = GridView.GetRowCellValue(0, "STD.ID") 'GridView.Columns(8).ToString

                    .lastSchoolAttended1 = Elementary_school
                    .lastSchoolAttended1_yearGraduated = Format(Elementary_year_from.Date, "yyyy") + "-" + Format(Elementary_year_to.Date, "yyyy")
                    .lastSchoolAttended2 = High_school
                    .lastSchoolAttended2_yearGraduted = Format(High_year_from.Date, "yyyy") + "-" + Format(High_year_to.Date, "yyyy")

                    .age = GetCurrentAge(If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth")))
                    Dim DOB As Date = If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth"))
                    .date_of_birth = Format(DOB.Date, "dd-MM-yyy")

                    .track = GridView.GetRowCellValue(0, "TRACK")
                    .strand = GridView.GetRowCellValue(0, "STRAND")
                End With
                EnrollSlip.Add(obj)
            Catch ex As Exception

            End Try


            'Dim page As Integer = 1
            'Dim total_page As Double = COR_Copies.Rows.Count
            'total_page = total_page / 2
            'total_page = Round_Up(total_page)


            Dim page As Integer = 1
            Dim total_page As Integer = 2

            Dim Master_Report As New xtrEnrollmentSlip_Main

            While page <= total_page

                Dim Main_report(page) As xtrEnrollmentSlip_Main
                Main_report(page) = New xtrEnrollmentSlip_Main

                Select Case _student_category_id
                    Case 13

                        Try

                            For Each row As DataRow In dt_units.Rows
                                If row.Item("LEC") <> "" Then
                                    LecUnits += row.Item("LEC")
                                Else
                                    LabUnits += row.Item("LAB")
                                End If
                            Next

                            Dim report As New xtrEnrollmentSlip_College

                            report.title_header.Text = _batch_name

                            report.LecUnits.Text = LecUnits
                            report.LabUnits.Text = LabUnits

                            If GridView.GetRowCellValue(0, "enrollmentAS") = "NEW" Or GridView.GetRowCellValue(0, "enrollmentAS") = "TRANSFEREE" Then
                                report.GroupFooter2.Visible = True
                            Else
                                report.GroupFooter3.Visible = True
                            End If

                            report.DataSource = EnrollSlip
                            'report.PrintableComponentContainer1.PrintableComponent = GridControl

                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                            If page = 1 Then
                                report.copy.ForeColor = Color.Orange
                                report.copy.Text = "STUDENTS COPY"
                            Else
                                report.copy.ForeColor = Color.Gold
                                report.copy.Text = "REGISTRAR’S COPY"
                            End If

                            Subreport.ReportSource = report

                        Catch ex As Exception

                        End Try

                        Try
                            Dim report As New xtrEnrollmentSlip_College

                            report.title_header.Text = _batch_name

                            report.LecUnits.Text = LecUnits
                            report.LabUnits.Text = LabUnits

                            If GridView.GetRowCellValue(0, "enrollmentAS") = "NEW" Or GridView.GetRowCellValue(0, "enrollmentAS") = "TRANSFEREE" Then
                                report.GroupFooter2.Visible = True
                            Else
                                report.GroupFooter3.Visible = True
                            End If

                            report.DataSource = EnrollSlip
                            'report.PrintableComponentContainer1.PrintableComponent = GridControl

                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                            If page = 1 Then
                                report.copy.ForeColor = Color.Purple
                                report.copy.Text = "DEANS’S COPY"

                            Else
                                report.copy.ForeColor = Color.DarkCyan
                                report.copy.Text = "ACCOUNTING’S COPY"

                            End If

                            Subreport2.ReportSource = report
                        Catch ex As Exception

                        End Try

                    Case 16

                        Try
                            Dim report As New xtrEnrollmentSlip_SeniorHigh

                            report.header.Text = "ENROLLMENT SLIP FOR SENIOR HIGH"
                            report.title_header.Text = _batch_name
                            report.DataSource = EnrollSlip
                            '     report.PrintableComponentContainer1.PrintableComponent = GridControl

                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                            If page = 1 Then
                                report.txtStudentCopySY.ForeColor = Color.Orange
                                report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")
                            Else
                                report.txtStudentCopySY.ForeColor = Color.Blue
                                report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")
                            End If

                            Subreport.ReportSource = report

                        Catch ex As Exception

                        End Try

                        Try
                            Dim report As New xtrEnrollmentSlip_SeniorHigh

                            report.header.Text = "ENROLLMENT SLIP FOR SENIOR HIGH"
                            report.title_header.Text = _batch_name
                            report.DataSource = EnrollSlip
                            '      report.PrintableComponentContainer1.PrintableComponent = GridControl

                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                            If page = 1 Then
                                report.txtStudentCopySY.ForeColor = Color.Green
                                report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")

                            Else
                                report.txtStudentCopySY.ForeColor = Color.Red
                                report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")

                            End If

                            Subreport2.ReportSource = report
                        Catch ex As Exception

                        End Try


                    Case Else

                        Try
                            Dim report As New xtrEnrollmentSlip_JuinorElementary

                            If _student_category.ToUpper.Contains("ELEMENTARY") Then
                                report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                            Else
                                report.header.Text = "ENROLLMENT SLIP FOR JHS SECONDARY"
                            End If

                            report.title_header.Text = _batch_name
                            report.DataSource = EnrollSlip
                            '  report.PrintableComponentContainer1.PrintableComponent = GridControl

                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                            If page = 1 Then
                                report.txtStudentCopySY.ForeColor = Color.Orange
                                report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")
                            Else
                                report.txtStudentCopySY.ForeColor = Color.Blue
                                report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")
                            End If

                            Subreport.ReportSource = report

                        Catch ex As Exception

                        End Try

                        Try
                            Dim report As New xtrEnrollmentSlip_JuinorElementary
                            If _student_category.ToUpper.Contains("ELEMENTARY") Then
                                report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                            Else
                                report.header.Text = "ENROLLMENT SLIP FOR JHS SECONDARY"
                            End If
                            report.title_header.Text = _batch_name
                            report.DataSource = EnrollSlip
                            '  report.PrintableComponentContainer1.PrintableComponent = GridControl

                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                            If page = 1 Then
                                report.txtStudentCopySY.ForeColor = Color.Green
                                report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")

                            Else
                                report.txtStudentCopySY.ForeColor = Color.Red
                                report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + GridView.GetRowCellValue(0, "A.Y.")

                            End If

                            Subreport2.ReportSource = report
                        Catch ex As Exception

                        End Try

                End Select


                Main_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
                Main_report(page).CreateDocument()

                Master_Report.Pages.AddRange(Main_report(page).Pages)
                Master_Report.PrintingSystem.ContinuousPageNumbering = True

                page += 1
            End While

            Master_Report.ShowPreview

            EnrollSlip.Clear()
        End If

        GridView.ClearDocument()

    End Sub



    Private Function getLastAttended_School(personID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
		school_address  AS 'SCHOOLNAME', 
	  date_from AS 'FROM',
      date_to as 'TO'
FROM
	person_educational_attainment
WHERE
	person_id = '" & personID & "' AND 
	education_attainment IN('Elementary Graduate','High School Graduate')

ORDER BY education_attainment
	
	"
        Return DataSource(sql)
    End Function

    Private Function getRecord(personID As Integer) As DataTable
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
	students_details.scholarship_any
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
WHERE
	person.end_time IS NULL AND
	person.status_type_id = 1 AND
	 person.person_id = '" & personID & "'
	 "
        Return DataSource(sql)
    End Function

    Friend Function LoadEnrollSlip(admissionNo As String) As Object
        Dim dt As New DataTable
        dt = getEnrollmentRecord(admissionNo)
        If dt.Rows.Count > 0 Then
            Return dt
        End If
    End Function

    Private Function getEnrollmentRecord(admissionNo As String) As DataTable

        Dim str As String = ""

        Dim dt As New DataTable
        Dim sql As String = ""


#Region "old"
        'Case WHEN subjects.no_exams = 0 THEN subjects.credit_hours
        '                  Else '' END AS 'LEC',
        'Case WHEN subjects.no_exams = 1 THEN subjects.credit_hours
        '                  Else '' END AS 'LAB',
#End Region

        Select Case _student_category_id
            Case 13
                sql = "SELECT
                        pos_id,
                        id,
                        admission_no,
                        `STUDENT NAME`,
                        COURSE,
                        `YEAR LEVEL`,
                        SEMESTER,
                        MAJOR,
                        `YEAR LEVEL`,
                        SEMESTER,
                        `A.Y.`,
                        `STD.ID`,
                        `SUBJ.CODE`,
                        `SUBJECT TITLE`,
                        CASE WHEN pos_id IS NULL AND no_exams = 0 THEN credit_hours
			                         ELSE `LEC_POS`	END AS 'LEC',    
		
                        CASE WHEN pos_id IS NULL AND no_exams = 1 THEN credit_hours
                             ELSE `LAB_POS` END AS 'LAB',  

                        credit_hours,
                        no_exams,
                       -- DAYS,
                       -- TIME,
                       -- ROOMS,
                       -- INSTRUCTOR,
                        CASE WHEN DAYS = 'TBA' THEN '' ELSE DAYS END AS 'DAYS',
						CASE WHEN TIME = 'TBA' THEN '' ELSE TIME END AS 'TIME',
						CASE WHEN ROOMS = 'TBA' THEN '' ELSE ROOMS END AS 'ROOMS',
						CASE WHEN INSTRUCTOR = 'TBA' THEN '' ELSE INSTRUCTOR END AS 'INSTRUCTOR',
                        SIGNATURE,
                        STATURE,
                        enrollmentAS,
                        admission_date
                        FROM(
                        SELECT
			                        students.id, 
			                        students.admission_no, 
			                        students.class_roll_no, 
			                        person.display_name 'STUDENT NAME',
			                        courses.code 'COURSE',
			                        students.year_level 'YEAR LEVEL',
			                        students.semester 'SEMESTER',
			                        students.academice_year 'A.Y.',
			                        students.std_number 'STD.ID',                       
			                        subjects.code 'SUBJ.CODE',
			                        subjects.`name` 'SUBJECT TITLE',                    
			                        IFNULL(program_of_study.lec_units,0) AS 'LEC_POS',
                                 -- CASE WHEN IFNULL(program_of_study.lec_units,0) = 0 THEN subjects.credit_hours
								-- ELSE IFNULL(program_of_study.lec_units,0) END AS 'LEC_POS',		
			                        IFNULL(program_of_study.lab_units,0) 'LAB_POS',
			                        subjects.credit_hours,
			                        subjects.no_exams,
			                        subject_class_schedule.`day` 'DAYS',
	  	                        subject_class_schedule.class_time 'TIME',  
			                        subject_class_schedule.room 'ROOMS',
			                        djemfcst_hris.employees.Name_Empl 'INSTRUCTOR',
			                        '' AS 'SIGNATURE',
			                        students.stature 'STATURE' ,
			                        students.enrollmentAS,
			                        pos_id,
                                    students.admission_date,
                                    courses.section_name 'MAJOR'

			                        FROM
			                        students_subjects
			                        INNER JOIN
			                        subjects
			                        ON 
				                        students_subjects.subject_id = subjects.id
			                        LEFT JOIN
			                        subject_class_schedule
			                        ON 
				                        students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
			                        INNER JOIN
			                        students
			                        ON 
				                        students_subjects.student_id = students.id
			                        LEFT JOIN
			                        djemfcst_hris.employees
			                        ON 
				                        subject_class_schedule.employee_id = djemfcst_hris.employees.SysPK_Empl
			                        INNER JOIN
			                        person
			                        ON 
				                        students.person_id = person.person_id
					                        INNER JOIN
			                        courses
			                        ON 
				                        courses.id  = students.course_id

		                         LEFT JOIN program_of_study on program_of_study.id = subjects.pos_id

			                        WHERE
			                        students.admission_no = '" & admissionNo & "'AND
			                        person.end_time IS NULL AND
                              person.status_type_id = 1 
	                         )A
                        "

            Case 16

                sql = "SELECT
                        students.id, 
                        students.admission_no, 
                        students.class_roll_no, 
                        person.display_name 'STUDENT NAME',
                        courses.code 'COURSE',
                        students.year_level 'YEAR LEVEL',
                        students.semester 'SEMESTER',
                        students.academice_year 'A.Y.',
                        students.std_number 'STD.ID',
                        subjects.code 'SUBJ.AREAS',
                        subjects.`name` 'SUBJECT TITLE',
                        -- subject_class_schedule.room 'ROOMS',
                        CASE WHEN subject_class_schedule.room = 'TBA' THEN '' ELSE subject_class_schedule.room END AS 'ROOMS',
                        -- subject_class_schedule.`day` 'DAYS',
                         CASE WHEN subject_class_schedule.`day` = 'TBA' THEN '' ELSE subject_class_schedule.`day` END AS 'DAYS',
                        -- subject_class_schedule.class_time 'TIME',  
                        CASE WHEN subject_class_schedule.class_time = 'TBA' THEN '' ELSE subject_class_schedule.class_time END AS 'TIME',
                        -- djemfcst_hris.employees.Name_Empl 'INSTRUCTOR',
                        CASE WHEN djemfcst_hris.employees.Name_Empl = 'TBA' THEN '' ELSE djemfcst_hris.employees.Name_Empl END AS 'INSTRUCTOR',
                       											
                        '' AS 'SIGNATURE',
                        students.track 'TRACK',
                        students.strand 'STRAND',
                        students.stature 'STATURE',                       
                        students.enrollmentAS,
                        students.admission_date

                        FROM
                        students_subjects
                        INNER JOIN
                        subjects
                        ON 
	                        students_subjects.subject_id = subjects.id
                        LEFT JOIN
                        subject_class_schedule
                        ON 
	                        students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
                        INNER JOIN
                        students
                        ON 
	                        students_subjects.student_id = students.id
                        LEFT JOIN
                        djemfcst_hris.employees
                        ON 
	                        subject_class_schedule.employee_id = djemfcst_hris.employees.SysPK_Empl
                        INNER JOIN
                        person
                        ON 
	                        students.person_id = person.person_id
		                        INNER JOIN
                        courses
                        ON 
	                        courses.id  = students.course_id

                       LEFT JOIN program_of_study on program_of_study.id = subjects.pos_id

                        WHERE
                        students.admission_no = '" & admissionNo & "' AND
                        person.end_time IS NULL AND
	                    person.status_type_id = 1 
	 
                    "

            Case Else

                sql = "SELECT
                        students.id, 
                        students.admission_no, 
                        students.class_roll_no, 
                        person.display_name 'STUDENT NAME',
                        courses.code 'COURSE',
                        students.year_level 'YEAR LEVEL',
                        students.semester 'SEMESTER',
                        students.academice_year 'A.Y.',
                        students.std_number 'STD.ID',
                        subjects.`name` 'SUBJECT TITLE',
                        -- subject_class_schedule.class_time 'TIME',
                        CASE WHEN subject_class_schedule.class_time = 'TBA' THEN '' ELSE subject_class_schedule.class_time END AS 'TIME',                      
                        -- subject_class_schedule.`day` 'DAYS',  
                        CASE WHEN subject_class_schedule.`day` = 'TBA' THEN '' ELSE subject_class_schedule.`day` END AS 'DAYS',
                        -- djemfcst_hris.employees.Name_Empl 'INSTRUCTOR',
                        CASE WHEN djemfcst_hris.employees.Name_Empl = 'TBA' THEN '' ELSE djemfcst_hris.employees.Name_Empl END AS 'INSTRUCTOR',
                        '' AS 'SIGNATURE',                   
                        students.enrollmentAS,
                        students.admission_date

                        FROM
                        students_subjects
                        INNER JOIN
                        subjects
                        ON 
	                        students_subjects.subject_id = subjects.id
                        LEFT JOIN
                        subject_class_schedule
                        ON 
	                       students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item
                        INNER JOIN
                        students
                        ON 
	                        students_subjects.student_id = students.id
                        LEFT JOIN
                        djemfcst_hris.employees
                        ON 
	                        subject_class_schedule.employee_id = djemfcst_hris.employees.SysPK_Empl
                        INNER JOIN
                        person
                        ON 
	                        students.person_id = person.person_id
		                        INNER JOIN
                        courses
                        ON 
	                        courses.id  = students.course_id

                       LEFT JOIN program_of_study on program_of_study.id = subjects.pos_id

                        WHERE
                        students.admission_no = '" & admissionNo & "' AND
                        person.end_time IS NULL AND
	                    person.status_type_id = 1 
	 
                    "

        End Select


        dt = DataSource(sql)
        Return dt
    End Function

    Friend Sub DesignGridControl(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)
        view.BeginUpdate()

        Select Case _student_category_id
            Case 13
                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9, 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case 11, 12, 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 14, 15
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 16, 17
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()

                        Case Else
                            view.Columns(i).Visible = False
                    End Select

                Next

            Case 16

                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()

                        Case 11, 12, 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 14, 15
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case Else
                            view.Columns(i).Visible = False
                    End Select

                Next
            Case Else

                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 300
                        '    view.Columns(i).BestFit()
                        Case 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 130
                        Case 11
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 130
                   '         view.Columns(i).BestFit()
                        Case 12
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 200
                            '             view.Columns(i).BestFit()
                        Case 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 150
                        Case Else
                            view.Columns(i).Visible = False
                    End Select

                Next
        End Select

        view.RefreshData()
        view.EndUpdate()


    End Sub
End Class
