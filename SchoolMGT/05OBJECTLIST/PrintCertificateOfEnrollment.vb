Imports DevExpress.XtraReports.UI

Public Class PrintCertificateOfEnrollment

    Dim StudentName As String = ""
    Dim Program As String = ""
    Dim YearLevel As String = ""
    Dim SemesterAY As String = ""
    Dim BatchID As String = ""
    Dim stdID As Integer
    Public Function CertificateOfEnrollment(AdmissionNo As Object)

        Dim dt As New DataTable
        dt = getRecord(AdmissionNo)
        If dt.Rows.Count > 0 Then

            Dim report As New xtrCertificateOfEnrollment

            StudentName = dt(0)("StudentName").ToString
            Program = dt(0)("Program").ToString
            '     YearLevel = dt(0)("YearLevel").ToString
            SemesterAY = dt(0)("SemesterAY").ToString

            report.student_nme.Text = StudentName
            report.course.Text = Program
            '     report.year_level.Text = YearLevel
            report.semester_AY.Text = SemesterAY

            BatchID = dt(0)("batch_id").ToString
            stdID = dt(0)("id").ToString

            Dim dt_subject As New DataTable
            dt_subject = getSubject(stdID)

            Dim subjectOBJ As New List(Of COE_Subject)
            If dt_subject.Rows.Count > 0 Then
                Dim No As Integer = 1
                For Each rows As DataRow In dt_subject.Rows
                    Dim obj As New COE_Subject
                    With obj
                        .No = No
                        .Subject = rows("code")
                        .Lecture = rows("LEC")
                        .Laboratory = rows("LAB")
                        .Total = rows("TOTAL")
                    End With
                    No += 1
                    subjectOBJ.Add(obj)
                Next

            End If

            'Dim report_subject As New xtrCOE_SubreportSubject
            'report_subject.DataSource = subjectOBJ

            Dim SubSubject As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
            SubSubject.ReportSource.DataSource = subjectOBJ

            Dim str As String = ""
            If _student_category.Contains("HIGH SCHOOL") Then
                YearLevel = dt(0)("code").ToString
                report.year_level.Text = YearLevel
                str = "AND students_assessment.particulars LIKE '%Tuation%'"
                report.Tag = 10

            Else
                YearLevel = dt(0)("YearLevel").ToString
                report.year_level.Text = YearLevel
                str = "AND students_assessment.particulars LIKE '%Lecture%'"
                report.Tag = 7
            End If


            Dim dt_fees As New DataTable
            dt_fees = getFees(BatchID, str)

            Dim feesOBJ As New List(Of COE_Fees)
                If dt_fees.Rows.Count > 0 Then

                    For Each rows As DataRow In dt_fees.Rows
                        Dim obj As New COE_Fees
                        With obj
                            .FeesName = rows("name")
                            .Amount = rows("amount")
                        End With
                        feesOBJ.Add(obj)
                    Next

                End If

                'Dim report_fees As New xtrCOE_SubreportBilling
                'report_fees.DataSource = feesOBJ

                Dim SubFees As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                SubFees.ReportSource.DataSource = feesOBJ

#Region "Signatory"
            Try
                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                report.XrLabel8.Text = dt_sigantory(0)("name")
                report.XrLabel9.Text = dt_sigantory(0)("designation")

                report.XrLabel12.Text = dt_sigantory(1)("name")
                report.XrLabel13.Text = dt_sigantory(1)("designation")


            Catch ex As Exception
            End Try

#End Region





            report.PrintingSystem.Document.AutoFitToPagesWidth = 1
                report.CreateDocument()
                report.ShowPreview

                subjectOBJ.Clear()
                feesOBJ.Clear()
            Else
                MsgBox("No Records Found!..")
        End If


        Return Nothing
    End Function

    Private Function getFees(batchID As String, str As String) As DataTable
        Dim sql As String = ""
        sql = "	SELECT
				inorder,
				particulars 'name',
				amount
		FROM(
		     SELECT
								1 AS 'inorder',
								students_assessment.particulars,
								students_assessment.amount
								FROM
								finance_fee_categories
								INNER JOIN finance_fee_particulars ON finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id
								INNER JOIN students_assessment ON finance_fee_particulars.id = students_assessment.finance_fee_particular_id
								WHERE
								students_assessment.student_id = '" & _studentID & "' " & str & "
						
					    	UNION ALL
										
						    SELECT
								2 AS 'inorder',
								students_assessment.particulars,
								finance_fee_particulars.amount
								FROM
								finance_fee_categories
								INNER JOIN finance_fee_particulars ON finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id
								INNER JOIN students_assessment ON finance_fee_particulars.id = students_assessment.finance_fee_particular_id
								WHERE
								students_assessment.student_id = '" & _studentID & "' AND students_assessment.particulars LIKE '%Registration %'
								
								UNION ALL
								
								SELECT
								3 AS 'inorder',
								finance_fee_categories.`name` 'particulars',
								SUM(finance_fee_particulars.amount) 'amount'
								FROM
								finance_fee_categories
								INNER JOIN finance_fee_particulars ON finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id
								INNER JOIN students_assessment ON finance_fee_particulars.id = students_assessment.finance_fee_particular_id
								WHERE
								students_assessment.student_id = '" & _studentID & "' AND finance_fee_categories.`name` LIKE '%MISCELLANEOUS%'
								GROUP BY finance_fee_categories.`name`
								-- ORDER BY finance_fee_categories.`name`								
								UNION ALL
								
								SELECT
									4 AS 'inorder',
									subject_laboratory.lab_name 'particulars',
									subjects.amount_lab 'amount'
									
								FROM
									students_subjects
									INNER JOIN
									subjects
									ON 
										students_subjects.subject_id = subjects.id
									INNER JOIN
									subject_laboratory
									ON 
										subjects.sub_lab_id = subject_laboratory.id
								WHERE
									students_subjects.student_id = '" & _studentID & "'
									
									UNION ALL
									
									SELECT
								5 AS 'inorder',
								finance_fee_categories.`name` AS 'particular',
								sum(finance_fee_particulars.amount)'amount'
								FROM
								finance_fee_categories
								INNER JOIN finance_fee_particulars ON finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id
								WHERE
								finance_fee_categories.batch_id = '" & _batchID & "' AND
								finance_fee_categories.`name` LIKE 'OTHER SCHOOL FEES' 

								GROUP BY `particular`
						
			)A     ORDER BY inorder
                     
"
        Return DataSource(sql)


#Region "Old"
        '        Select Case
        'finance_fee_categories.`name`,
        'sum(finance_fee_particulars.amount) 'amount'
        '            FROM
        '            finance_fee_categories
        '            INNER Join finance_fee_particulars ON finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id
        'WHERE
        '            finance_fee_categories.batch_id = '" & batchID & "'
        '            GROUP BY `name`
        'ORDER by `name`
#End Region
    End Function

    Private Function getSubject(stdID As Integer) As DataTable
        Dim sql As String = ""
        sql = "SELECT
student_id,
`code`,
 CASE WHEN pos_id IS NULL AND no_exams = 0 THEN credit_hours
ELSE `LEC_POS`	END AS 'LEC',    	
 CASE WHEN pos_id IS NULL AND no_exams = 1 THEN credit_hours
 ELSE `LAB_POS` END AS 'LAB',  
IFNULL(LEC,0) + IFNULL(LAB,0) 'TOTAL'
FROM(
SELECT
students_subjects.student_id,
subjects.`code`,
subjects.no_exams,
subjects.credit_hours,
IFNULL(program_of_study.lec_units,0) AS 'LEC_POS',
IFNULL(program_of_study.lab_units,0) 'LAB_POS',
CASE WHEN subjects.no_exams = 0 THEN subjects.credit_hours END AS 'LEC',
CASE WHEN subjects.no_exams = 1 THEN subjects.credit_hours END AS 'LAB',
pos_id
FROM
students_subjects
INNER JOIN subjects ON students_subjects.subject_id = subjects.id
LEFT JOIN program_of_study on program_of_study.id = subjects.pos_id
ORDER BY `code`
)A 
WHERE student_id = '" & stdID & "'
GROUP BY `code`"
        Return DataSource(sql)
    End Function

    Private Function getRecord(admissionNo As Object) As DataTable
        Dim sql As String = ""
        sql = "SELECT
students.id,
concat(person.first_name,' ',Substring(person.middle_name,1,1),'.  ',person.last_name)'StudentName',
courses.`code`,
courses.description 'Program',
students.year_level 'YearLevel',
concat(students.semester,' , A.Y. ',students.academice_year)'SemesterAY',
students.batch_id
FROM
students
INNER JOIN person ON students.person_id = person.person_id
INNER JOIN courses ON courses.id = students.course_id
WHERE
students.admission_no = '" & admissionNo & "'
"
        Return DataSource(sql)
    End Function
End Class
