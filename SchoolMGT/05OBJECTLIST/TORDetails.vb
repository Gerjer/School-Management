Imports DevExpress.XtraReports.UI

Public Class TORDetails

    Public Property personID As Integer
    Public Property class_roll_number As String
    Public Property last_name As String
    Public Property first_name As String
    Public Property middle_name As String
    Public Property school_address_province As String
    Public Property program As String
    Public Property yearlevel_semister_academicyear As String
    Public Property semester As String
    Public Property academic_year As String
    Public Property subjectID As Integer
    Public Property subject_code As String
    Public Property subject_description As String
    Public Property final_grade As String
    Public Property re_exam As String
    Public Property credits As String
    Public Property batch_id As String

    Public Property date_printed As Date
    Public Property school_attended As String
    Public Property display_name As String
    Public Property student_number As String
    Public Property gender As String
    Public Property date_birth As Date
    Public Property place_birth As String
    Public Property address As String
    Public Property elementary As String
    Public Property elementary_year As String
    Public Property secondary As String
    Public Property secondary_year As String

    Public Property remarks_purpose As String
    Public Property remarks_graduate As String
    Public Property remarks_nstp As String
    Public Property nstp_code As String
    Public Property graduate As Integer
    Public Property date_graduated As Date
    Public Property photo_path As String

    Public Property basis_of_admission As String
    Public Property major_subject As String
    Public Property Parents As String



    Dim RecordModel As New TOR_Model
    Dim tor_subject As New List(Of TOR_SubjectDetails)
    Dim form9 As New List(Of Form9Details)

    Public Sub PreviewTOR_DJEMFCST(personID, Purpose, GraduatedRemarks, NSTPRemarks, SubjectCode)

        nstp_code = SubjectCode
        Dim dt As New DataTable

        dt = RecordModel.getStudentMain(personID)
        If dt.Rows.Count > 0 Then
            Dim x As Integer = 0
            For Each row As DataRow In dt.Rows
                display_name = If(IsDBNull(row("display_name").ToString), "", row("display_name").ToString)
                gender = If(IsDBNull(row("gender").ToString), "", row("gender").ToString)
                place_birth = If(IsDBNull(row("birth_place").ToString), "", row("birth_place").ToString)
                date_birth = If(IsDBNull(row("date_of_birth").ToString), "", row("date_of_birth").ToString)
                address = If(IsDBNull(row("address").ToString), "", row("address").ToString)
                student_number = If(IsDBNull(row("std_number").ToString), "", row("std_number").ToString)
                If x = 0 Then
                    elementary = If(IsDBNull(row("school_address").ToString), "", row("school_address").ToString)
                    elementary_year = If(IsDBNull(row("AY").ToString), "", row("AY").ToString)
                Else
                    secondary = If(IsDBNull(row("school_address").ToString), "", row("school_address").ToString)
                    secondary_year = If(IsDBNull(row("AY").ToString), "", row("AY").ToString)
                End If
                program = If(IsDBNull(row("description").ToString), "", row("description").ToString)
                x += 1
            Next

            dt = Nothing

            dt = RecordModel.getTORDetails(PERSON_ID)
            If dt.Rows.Count > 0 Then
                'Customize Term
                Dim Row As String = 1
                Dim dummyTerm As String = dt(0)("SemAY").ToString
                For i As Integer = 0 To dt.Rows.Count - 1

                    If dummyTerm = dt(i)("SemAY").ToString Then
                        If Row = 1 Then
                            dt(i)("Semester") = dt(i)("Sem").ToString
                        ElseIf Row = 2 Then
                            dt(i)("Semester") = dt(i)("academice_year")
                        Else
                            dt(i)("Semester") = ""
                        End If

                    Else
                        Row = 1
                        dt(i)("Semester") = dt(i)("Sem").ToString
                        dummyTerm = dt(i)("SemAY").ToString
                    End If

            '        dummyTerm = dt(i)("SemAY").ToString
                    Row += 1

                Next

                'Insert NSTP

                If SubjectCode IsNot Nothing Then
                    Dim dt_dummy As New DataTable
                    dt_dummy = RecordModel.CreatHeader()
                    Dim xxx = dt(0)("CourseCode").ToString
                    For i As Integer = 0 To dt.Rows.Count - 1
                        If SubjectCode = dt(i)("CourseCode").ToString Then
                            dt_dummy.Rows.Add(dt(i)("BackTrackID"), dt(i)("person_id"), dt(i)("StdID"), dt(i)("SchoolName"), dt(i)("SchoolAddress"), dt(i)("SemAY"), dt(i)("Semester"), dt(i)("academice_year"), dt(i)("CourseCode"), dt(i)("SubjectName"), dt(i)("finalgrade"), dt(i)("re_exam"), dt(i)("credit_hours"))
                            dt_dummy.Rows.Add(dt(i)("BackTrackID"), dt(i)("person_id"), dt(i)("StdID"), dt(i)("SchoolName"), dt(i)("SchoolAddress"), dt(i)("SemAY"), dt(i)("Semester"), dt(i)("academice_year"), "GRADUATED:", NSTPRemarks, "", "", "") 'dt(i)("finalgrade"), dt(i)("re_exam"), dt(i)("credit_hours")
                        Else
                            dt_dummy.Rows.Add(dt(i)("BackTrackID"), dt(i)("person_id"), dt(i)("StdID"), dt(i)("SchoolName"), dt(i)("SchoolAddress"), dt(i)("SemAY"), dt(i)("Semester"), dt(i)("academice_year"), dt(i)("CourseCode"), dt(i)("SubjectName"), dt(i)("finalgrade"), dt(i)("re_exam"), dt(i)("credit_hours"))
                        End If
                    Next

                    dt.Columns.Clear()
                    dt.Rows.Clear()
                    dt = dt_dummy.Copy
                    tor_subject_details = dt
                End If

                For Each rows As DataRow In dt.Rows

                    Dim obj As New TOR_SubjectDetails
                    With obj
                        .school_name = If(IsDBNull(rows("SchoolName").ToString), "", rows("SchoolName").ToString)
                        .school_address = If(IsDBNull(rows("SchoolAddress").ToString), "", rows("SchoolAddress").ToString)
                        .semester = If(IsDBNull(rows("Semester").ToString), "", rows("Semester").ToString)
                        .academic_year = If(IsDBNull(rows("academice_year").ToString), "", rows("academice_year").ToString)
                        .course_code = If(IsDBNull(rows("CourseCode").ToString), "", rows("CourseCode").ToString)
                        .description = If(IsDBNull(rows("SubjectName").ToString), "", rows("SubjectName").ToString)
                        .final = If(IsDBNull(rows("finalgrade").ToString), "", rows("finalgrade").ToString)
                        .re_exam = If(IsDBNull(rows("re_exam").ToString), "", rows("re_exam").ToString)
                        .credits = If(IsDBNull(rows("credit_hours").ToString), "", rows("credit_hours").ToString)
                    End With
                    tor_subject.Add(obj)
                Next


            End If


            Dim report As New xtrTORMain

#Region "Signatory"
            Try
                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                report.XrLabel21.Text = dt_sigantory(0)("name")
                report.XrLabel22.Text = dt_sigantory(0)("designation")

                report.XrLabel23.Text = dt_sigantory(1)("name")
                report.XrLabel24.Text = dt_sigantory(1)("designation")

                report.XrLabel36.Text = dt_sigantory(2)("name")
                report.XrLabel35.Text = dt_sigantory(2)("designation")
            Catch ex As Exception
            End Try

#End Region


            report.txtName.Text = display_name
            report.txtGender.Text = gender
            report.txtBirthPlace.Text = place_birth
            report.txtBirthDate.Text = Format(date_birth.Date, "MMMM dd, yyyy")
            report.txtAddress.Text = address
            report.txtStudentNo.Text = student_number
            report.txtElementary.Text = elementary
            report.txtElemYear.Text = elementary_year
            report.txtSeconday.Text = secondary
            report.txtSecYear.Text = secondary_year
            report.txtProgram.Text = program
            report.txtpurpose.Text = Purpose
            report.txtGraduated.Text = GraduatedRemarks

            Dim SubSubject As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
            SubSubject.ReportSource.DataSource = tor_subject

            report.PrintingSystem.Document.AutoFitToPagesWidth = 1
            report.CreateDocument()
            report.ShowPreview

        Else
            '          MsgBox("Record Not Found..!!!", MsgBoxStyle.Critical, "NOT EXIST")
        End If

        tor_subject.Clear()



    End Sub

    Friend Sub PreviewFROM9_DJEMFCST(personID As Integer, Purpose As String, GraduatedRemarks As String, NSTPRemarks As String, SubjectCode As String, dt_form9 As DataTable)

        nstp_code = SubjectCode
        Dim dt As New DataTable

        dt = RecordModel.getStudentMain(personID)
        If dt.Rows.Count > 0 Then
            Dim x As Integer = 0
            For Each row As DataRow In dt.Rows
                display_name = If(IsDBNull(row("display_name").ToString), "", row("display_name").ToString)
                gender = If(IsDBNull(row("gender").ToString), "", row("gender").ToString)
                place_birth = If(IsDBNull(row("birth_place").ToString), "", row("birth_place").ToString)
                date_birth = If(IsDBNull(row("date_of_birth").ToString), "", row("date_of_birth").ToString)
                address = If(IsDBNull(row("address").ToString), "", row("address").ToString)
                student_number = If(IsDBNull(row("std_number").ToString), "", row("std_number").ToString)
                basis_of_admission = If(IsDBNull(row("basis.admition").ToString), "", row("basis.admition").ToString)
                major_subject = If(IsDBNull(row("major.subject").ToString), "", row("major.subject").ToString)
                Parents = If(IsDBNull(row("parents").ToString), "", row("parents").ToString)
                date_graduated = If(IsDBNull(row("date_graduation").ToString), "", row("date_graduation").ToString)

                If x = 0 Then
                    elementary = If(IsDBNull(row("school_address").ToString), "", row("school_address").ToString)
                    elementary_year = If(IsDBNull(row("AY").ToString), "", row("AY").ToString)
                Else
                    secondary = If(IsDBNull(row("school_address").ToString), "", row("school_address").ToString)
                    secondary_year = If(IsDBNull(row("AY").ToString), "", row("AY").ToString)
                End If
                program = If(IsDBNull(row("description").ToString), "", row("description").ToString)
                x += 1
            Next


        End If


        'Creat Object List

        For Each row As DataRow In dt_form9.Rows

            Dim obj As New Form9Details
            With obj
                .school_name = If(IsDBNull(row("SchoolName").ToString), "", row("SchoolName").ToString)
                .school_address = If(IsDBNull(row("SchoolAddress").ToString), "", row("SchoolAddress").ToString)
                .school_name_address = .school_name & " - " & .school_address
                .semester_ay = If(IsDBNull(row("SemAY").ToString), "", row("SemAY").ToString)
                .subject_code = If(IsDBNull(row("CourseCode").ToString), "", row("CourseCode").ToString)
                .descriptive_title = If(IsDBNull(row("SubjectName").ToString), "", row("SubjectName").ToString)
                .finale_grade = If(IsDBNull(row("finalgrade").ToString), "", row("finalgrade").ToString)
                .credtis = If(IsDBNull(row("credit_hours").ToString), "", row("credit_hours").ToString)
                .credits_distribution = If(IsDBNull(row("cdID").ToString), "", row("cdID").ToString)
            End With
            form9.Add(obj)
        Next

        _dt_form9 = dt_form9

        Dim report As New xtrFORM9Main
        report.txtName.Text = display_name
            report.txtGender.Text = gender
            report.txtBirthPlace.Text = place_birth
            report.txtBirthDate.Text = Format(date_birth.Date, "MMMM dd, yyyy")
            report.txtAddress.Text = address
            report.txtStudentNo.Text = student_number
            report.txtElementary.Text = elementary
            report.txtElemYear.Text = elementary_year
            report.txtSeconday.Text = secondary
            report.txtSecYear.Text = secondary_year
            report.txtProgram.Text = program
        report.txtBasisAdmission.Text = basis_of_admission
        report.txtParents.Text = Parents
        report.txtMajor.Text = major_subject

        Dim SubSubject As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
        SubSubject.ReportSource.DataSource = dt_form9

        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
            report.CreateDocument()
            report.ShowPreview


        form9.Clear()

    End Sub
End Class
