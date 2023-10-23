Imports System.IO
Imports DevExpress.XtraPrinting.Drawing
Imports DevExpress.XtraTreeList
Imports DevExpress.XtraTreeList.Columns
Imports DevExpress.XtraTreeList.Nodes
Imports System.Threading
Imports System.ComponentModel
Imports DevExpress.Data
Imports DevExpress.XtraGrid
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraReports.UI
Imports DevExpress.XtraPrinting



Imports SchoolMGT
Imports DevExpress.XtraGrid.Views.Grid
Imports DevComponents.DotNetBar.Controls

Public Class StudentLearnersListPresenter
    Private _view As frmStudentLearnersList
    Dim ListModel As New StudentLearnersListModel
    Dim COE As New PrintCertificateOfEnrollment
    Dim Enroll_Slip As New PrintEnrollmentSlip
    Dim SubjectEnrollmentSlip As New List(Of Subject_EnrollmentSlip)

    Dim ReportRatingModel As New ReportRatingListModel

    Public Sub New(view As frmStudentLearnersList)
        _view = view

        _view.TabItem2.Visible = False

        loadComboBox()
        loadHandler()
        '   CreateColumns(_view.TreeList1)
        CreateColumns(_view.TreeList2)
        loadTreelistDesign(_view.TreeList2)
        _view.cmbStudentName.Focus()
        '      loadList()

        If ShortCut_PrintEnrollmentSlip Then
            _view.cmbStudentName.SelectedValue = PERSON_ID
            _view.btnSearch.PerformClick()
        End If
        ShortCut_PrintEnrollmentSlip = False
    End Sub

    Private Sub loadTreelistDesign(treeList2 As TreeList)
        Dim childNode As TreeListNode = Nothing
        treeList2.LookAndFeel.UseDefaultLookAndFeel = False
        treeList2.LookAndFeel.SkinName = "iMaginary"
        '     treeList2.TreeLevelWidth = 150
        treeList2.OptionsBehavior.Editable = False
        treeList2.OptionsView.ShowColumns = False
        treeList2.OptionsView.ShowIndicator = False
        treeList2.OptionsView.ShowHorzLines = False
        treeList2.OptionsView.ShowVertLines = False
        treeList2.ViewStyle = TreeListViewStyle.TreeView
        treeList2.OptionsView.TreeLineStyle = LineStyle.Solid
        treeList2.OptionsView.ShowTreeLines = DevExpress.Utils.DefaultBoolean.True
        '    treeList2.OptionsView.BestFitNodes = TreeListBestFitNodes.All

    End Sub

    Private Sub loadHandler()

        AddHandler _view.cmbStudentName.SelectedIndexChanged, AddressOf GetStudentDetails
        AddHandler _view.btnSearch.Click, AddressOf Treelistload
        AddHandler _view.TreeList2.FocusedNodeChanged, AddressOf getNodeValueAdmissionNo
        AddHandler _view.TreeList2.MouseUp, AddressOf MenuStripVisible
        AddHandler _view.TreeList2.Click, AddressOf CheckNodeLevel

        AddHandler _view.PrintCORToolStripMenuItem.Click, AddressOf PrintCOE
        AddHandler _view.EnrollmentSlipToolStripMenuItem.Click, AddressOf Print_EnrollmentSlip
        AddHandler _view.LoadEnrollmentSlipToolStripMenuItem.Click, AddressOf Load_EnrollmentSlip
        AddHandler _view.PrintNewEnrollmentSlipToolStripMenuItem.Click, AddressOf PrintNew_EnrollmentSlip
        AddHandler _view.PrintReportRatingToolStripMenuItem.Click, AddressOf PrintReportRating
        AddHandler _view.PrintRegistrationAssessment.Click, AddressOf PrintRegistrationAssessment

        AddHandler _view.cmbStudentName.KeyDown, AddressOf KeyDown
    End Sub

    Private Sub PrintRegistrationAssessment(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor
        If ListModel.ExistingAssessment(_studentID) Then
            computeTuitionFee()
            displayStudentFees()
            PrintRegistrationAssessment()
        Else
            MsgBox("Please Print Student Assessment First", MsgBoxStyle.Exclamation)
        End If
        Cursor.Current = Cursors.Default
    End Sub

    Dim EnrollmentStat As String = ""

    Private Sub PrintRegistrationAssessment()

        Dim SQLEX As String = ""
        SQLEX = "SELECT  students.admission_no"
        SQLEX += ", subjects.code 'subjCode', subjects.name 'subjname' "
            SQLEX += ", subjects.credit_hours, subjects.amount,subjects.id 'subjid',subjects.no_exams"
            SQLEX += ", subject_class_schedule.name"
            SQLEX += ", subject_class_schedule.room"
            SQLEX += ", UPPER(subject_class_schedule.employee_name) 'employee_name', students.is_enrolled,DATE_FORMAT(students.admission_date,'%M %d,%Y')'admission_date'"
            SQLEX += " FROM students_subjects"
            SQLEX += " INNER JOIN students ON (students_subjects.student_id = students.id)"
            SQLEX += " INNER JOIN subjects ON (students_subjects.subject_id = subjects.id)"
            SQLEX += " LEFT JOIN subject_class_schedule"
            SQLEX += " ON (students_subjects.subject_class_schedule_id = subject_class_schedule.SysPK_Item)"
        SQLEX += " WHERE admission_no='" & AdmissionNo & "'"


        Dim new_report As New fzzReportViewerForm
        new_report.FolderName = "STUDENT ASSESSMENT SHEET"
        new_report.AttachReport(SQLEX, "ASSESSMENT " & AdmissionNo) =
    New rpt_CollegeStudentAssessmentReport(_school_year, AdmissionNo, _view.cmbStudentName.Text,
                                           _course_name, "", _semester, _year_level, EnrollmentStat)

        new_report.Show()

    End Sub



    Private Sub displayStudentFees()

        Dim dt_fees As New DataTable
        Dim SQLEX As String = ""
        Dim MeData As DataTable

        Dim checkPaymentExists As String = "SELECT COUNT( finance_transactions.amount) 'payment'"
        checkPaymentExists += " FROM  finance_transactions"
        checkPaymentExists += " INNER JOIN students "
        checkPaymentExists += " ON (finance_transactions.student_id = students.id)"
        checkPaymentExists += " WHERE students.admission_no='" & AdmissionNo & "'"

        Dim TOTAL_FEES As Double = 0

        dt_fees.Columns.Add("FEE DESCRIPTION")
        dt_fees.Columns.Add("PARTICULARS")
        dt_fees.Columns.Add("AMOUNT")
        dt_fees.Columns.Add("TOTAL")
        dt_fees.Columns.Add("STAT")
        dt_fees.Columns.Add("COLUMNNAME")
        dt_fees.Columns.Add("PART_ID")


        SQLEX = "SELECT finance_fee_categories.id, finance_fee_categories.name, SUM(finance_fee_particulars.amount),finance_fee_particulars.mode_payments,students.batch_id,students.enrollmentAS,students.class_roll_no"
        SQLEX += " FROM students"
        SQLEX += " INNER JOIN finance_fee_categories "
        SQLEX += " On (students.batch_id = finance_fee_categories.batch_id)"
        SQLEX += " INNER JOIN finance_fee_particulars "
        SQLEX += " On (finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id)"
        SQLEX += " And finance_fee_particulars.is_deleted='0'"
        SQLEX += " WHERE students.admission_no='" & AdmissionNo & "'"
        SQLEX += " GROUP BY finance_fee_categories.name"
        SQLEX += " ORDER BY id"

        MeData = Nothing
        MeData = clsDBConn.ExecQuery(SQLEX)

        Dim catname As String = ""
        Dim catid As String = ""
        Dim TotalAmt As String = ""
        Dim dt_fees_policy As New DataTable

        If MeData.Rows.Count > 0 Then
            For cnt As Integer = 0 To MeData.Rows.Count - 1

                Dim mode_payment As String = MeData.Rows(cnt).Item("mode_payments").ToString
                Dim enroll_status As String = MeData.Rows(cnt).Item("enrollmentAS").ToString
                EnrollmentStat = enroll_status
                Dim class_roll_no As String = MeData.Rows(cnt).Item("class_roll_no").ToString

                Dim semester As String = _semester

                dt_fees_policy = ListModel.AddFees(mode_payment, enroll_status, semester)

                If dt_fees_policy.Rows.Count > 0 Then

                    If mode_payment = 3 And enroll_status = "OLD" And semester = "2ND SEMESTER" Then
                        Dim count As Integer = 0
                        count = DataObject(String.Format("SELECT count(DATE_FORMAT(admission_date,'%Y'))'Year' FROM students WHERE class_roll_no = '" & class_roll_no & "' AND DATE_FORMAT(admission_date,'%Y') = '" & Date.Now.Year & "'"))
                        If count = 2 Then
                            catname = MeData.Rows(cnt).Item("name").ToString
                            catid = MeData.Rows(cnt).Item("id").ToString
                            TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")
                        Else
                            Continue For
                        End If

                    Else

                        catname = MeData.Rows(cnt).Item("name").ToString
                        catid = MeData.Rows(cnt).Item("id").ToString
                        TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")

                    End If
                Else
                    If mode_payment = 1 Then

                        catname = MeData.Rows(cnt).Item("name").ToString
                        catid = MeData.Rows(cnt).Item("id").ToString
                        TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString), "#,##0.00")
                    Else
                        Continue For
                    End If

                End If


                If catname = "TUITION" Then

                    dt_fees.Rows.Add(New String() {catname, "", "", Format(TuitionFee_Lec + TuitionFee_lab, "#,##0.00"), "-", "H"})
                Else

                    dt_fees.Rows.Add(New String() {catname, "", "", TotalAmt, "-"})
                End If


                TOTAL_FEES += CDbl(MeData.Rows(cnt).Item("SUM(finance_fee_particulars.amount)").ToString)


                Dim SQLEXDetails As String = "SELECT id, name, amount FROM finance_fee_particulars"
                SQLEXDetails += " WHERE finance_fee_category_id ='" & catid & "'"
                SQLEXDetails += " AND is_deleted !='1'"
                Dim inDataT As DataTable
                inDataT = clsDBConn.ExecQuery(SQLEXDetails)

                If inDataT.Rows.Count Then
                    For indataCtr As Integer = 0 To inDataT.Rows.Count - 1
                        Dim part_id As String = inDataT.Rows(indataCtr).Item("id").ToString
                        Dim detailname As String = inDataT.Rows(indataCtr).Item("name").ToString
                        Dim amount As String = Format(CDbl(inDataT.Rows(indataCtr).Item("amount").ToString), "#,##0.00")

                        dt_fees.Rows.Add(New String() {"", detailname, amount, "", "-", "", part_id})

                    Next
                End If


            Next

        End If

        '' ####### Compute Lecture and Laboratory Fees
        Dim x As Integer = 0
        For Each rows As DataRow In dt_fees.Rows

            Dim flag As String = rows.Item("STAT")
            Dim value As String = rows.Item("PARTICULARS")

            If flag = "-" And value.Contains("Lecture") Then
                dt_fees(x)("AMOUNT") = Format(TuitionFee_Lec, "#,##0.00")
            End If

            If flag = "-" And value.Contains("Lab") Then
                dt_fees(x)("AMOUNT") = Format(TuitionFee_lab, "#,##0.00")
            End If
            x += 1
        Next


        TOTAL_FEES += TuitionFee_lab + TuitionFee_Lec

        Dim balance As Double = CDbl(ListModel.getPreviousBalance(_studentID))
        Dim discount As Double = CDbl(ListModel.getDiscount(_studentID))
        Dim TOTAL_BAL As Double = (TOTAL_FEES + balance) - discount


        dt_fees.Rows.Add(New String() {"", "", "TOTAL", Format(TOTAL_FEES, "#,##0.00"), "++"})


        dt_fees.Rows.Add(New String() {"", "", "PREVIOUS BALANCE", ListModel.getPreviousBalance(_studentID), "-+"})

        dt_fees.Rows.Add(New String() {"", "", "DISCOUNT", ListModel.getDiscount(_studentID), "--"})

        dt_fees.Rows.Add(New String() {"", "", "TOTAL PAYABLES", Format(TOTAL_BAL, "#,##0.00"), "T+"})

        report_dt_fees = New DataTable
        report_dt_fees = dt_fees

    End Sub

    Dim TuitionFee_Lec As Double
    Dim TuitionFee_lab As Double
    Private HasLab As Boolean = False
    Private Sub computeTuitionFee()

        TuitionFee_Lec = 0
        TuitionFee_lab = 0

        Dim dt As New DataTable

        dt = ListModel.getDetails(AdmissionNo)

        If dt.Rows.Count > 0 Then

            For Each rows As DataRow In dt.Rows

                Dim no_exams As String = rows.Item("no_exams").ToString
                Dim subj As String = rows.Item("subjname").ToString

                Dim amount As Double = rows.Item("amount")
                Dim Unit As Double = rows.Item("credit_hours")

                If no_exams = "False" Then '"0" 
                    TuitionFee_Lec += Unit * amount
                    Dim lab_name As String = rows.Item("lab_name")
                    Dim lab_amt As Double = rows.Item("lab_amount")
                    If lab_name <> "" Then
                        TuitionFee_lab += lab_amt
                        HasLab = True
                    End If

                Else
                    TuitionFee_lab += Unit * amount
                    HasLab = True
                End If


            Next



        Else
            MsgBox("No Subject Found!!!")
        End If


    End Sub

    Sub GetStudentDetails(sender As Object, e As EventArgs)

        Try
            Dim drv As DataRowView = DirectCast(_view.cmbStudentName.SelectedItem, DataRowView)
            id = drv.Item("Name").ToString
            Treelistload(sender, e)
        Catch ex As Exception

        End Try


    End Sub

    Private Sub PrintReportRating(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Dim StudentName As String = ""
        Dim Average As Decimal = 0

        Dim page As Integer = 1

        Dim main_report As New xtrMain_ReporRating

        Dim master_report(page) As xtrMain_ReporRating
        master_report(page) = New xtrMain_ReporRating

        Dim dt_ReportRating As New DataTable
        dt_ReportRating = ReportRatingModel.getReportRating(_studentID)

        Average = ReportRatingModel.gerAverage(_studentID)
        Average = FormatNumber(CDec(Average), 1, TriState.True, TriState.UseDefault)
        Dim new_Average = ReportRatingModel.gerNewAverage(Average)

        Dim final_Average As String = ""

        If Average = 0 Then
            final_Average = ""
        Else
            final_Average = Average & " (" & new_Average & ")"
        End If

        Dim ReportRatingList As New List(Of ReportRating)

        For Each rowss As DataRow In dt_ReportRating.Rows

            If StudentName = "" Then
                StudentName = rowss("display_name").ToString
            End If

            Dim obj As New ReportRating
            With obj
                .subject = rowss("SubjCode")
                .units = rowss("Units").ToString
                .ratings = rowss("Rating").ToString
            End With
            ReportRatingList.Add(obj)
        Next

        Dim studentDetails As DataTable = ListModel.getStudent(_studentID)

        Dim report As New xtrReportRating

#Region "Signatory"
        Try
            Dim dt_sigantory As DataTable = getSignatory(report.Tag)

            report.XrLabel12.Text = dt_sigantory(0)("name")
            report.XrLabel13.Text = dt_sigantory(0)("designation")

        Catch ex As Exception
        End Try

#End Region


        report._student_name = StudentName
        report._year = studentDetails(0)("year_level").ToString
        report._semester = studentDetails(0)("semester").ToString
        report._academic_year = studentDetails(0)("academice_year").ToString
        report._course = studentDetails(0)("description").ToString
        report.ddate.Text = Format(Date.Now.Date, "MMMM dd, yyyy")
        report.average.Text = "Gen. Average : " & final_Average
        report.DataSource = ReportRatingList
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1

        Dim Subreport As XRSubreport = TryCast(master_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
        Subreport.ReportSource = report

        master_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
        master_report(page).CreateDocument()

        main_report.Pages.AddRange(master_report(page).Pages)
        main_report.PrintingSystem.ContinuousPageNumbering = True

        page += 1

        StudentName = ""
        ReportRatingList.Clear()

        main_report.ShowPreview

        Cursor.Current = Cursors.Default

    End Sub

    Private Sub KeyDown(sender As Object, e As KeyEventArgs)
        If e.KeyCode = Keys.Enter Then
            Dim item As DevComponents.DotNetBar.Controls.ComboBoxEx = DirectCast(sender, ComboBoxEx)
            id = _view.cmbStudentName.Text
            Treelistload(sender, e)
        End If
    End Sub

    Dim id As String

    Public Sub PrintNew_EnrollmentSlip(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        Dim last_name As String = ""
        Dim first_name As String = ""
        Dim middle_name As String = ""
        Dim display_name As String = ""
        Dim gender As String = ""
        Dim birth_place As String = ""
        Dim date_of_birth As String = ""
        Dim age As String = ""
        Dim marital_status As String = ""
        Dim telephone1 As String = ""
        Dim email As String = ""
        Dim address As String = ""

        Dim contact_person As String = ""
        Dim contact_number As String = ""
        Dim contact_address As String = ""

        Dim ID_Number As String = ""
        Dim LRN_number As String = ""
        Dim Academic_year As String = ""
        Dim course_grade As String = ""
        Dim year_level As String = ""
        Dim semester As String = ""
        Dim scholarship_any As String = ""
        Dim basis_admission As String = ""

        Dim lastSchoolAttended1 As String = ""
        Dim lastSchoolAttended1_yearGraduated As String = ""
        Dim lastSchoolAttended2 As String = ""
        Dim lastSchoolAttended2_yearGraduted As String = ""

        Dim track As String = ""
        Dim strand As String = ""

        Dim Elementary_school As String = ""
        Dim Elementary_year_from As Date
        Dim Elementary_year_to As Date
        Dim High_school As String = ""
        Dim High_year_from As Date
        Dim High_year_to As Date

        Dim lecUnits As Double
        Dim labUnits As Double

        Try

            Dim dt_subject As New DataTable
            dt_subject = Enroll_Slip.LoadEnrollSlip(AdmissionNo)

            dt_subject_global = dt_subject

            If dt_subject.Rows.Count > 0 Then

                For Each row As DataRow In dt_subject.Rows
                    Dim obj As New Subject_EnrollmentSlip
                    With obj

                        Select Case _student_category_id
                            Case 13
                                .subject_code = If(IsDBNull(row("SUBJ.CODE").ToString), "", row("SUBJ.CODE").ToString)
                                .subject = If(IsDBNull(row("SUBJECT TITLE").ToString), "", row("SUBJECT TITLE").ToString)
                                .lec = If(IsDBNull(row("LEC").ToString), "", row("LEC").ToString)
                                .lab = If(IsDBNull(row("LAB").ToString), "", row("LAB").ToString)
                                .day = If(IsDBNull(row("DAYS").ToString), "", row("DAYS").ToString)
                                .time = If(IsDBNull(row("TIME").ToString), "", row("TIME").ToString)
                                .room = If(IsDBNull(row("ROOMS").ToString), "", row("ROOMS").ToString)
                                .instructor = If(IsDBNull(row("INSTRUCTOR").ToString), "", row("INSTRUCTOR").ToString)
                                basis_admission = If(IsDBNull(row("STATURE").ToString), "", row("STATURE").ToString)
                            Case 16
                                .subject_code = If(IsDBNull(row("SUBJ.AREAS").ToString), "", row("SUBJ.AREAS").ToString)
                                .subject = If(IsDBNull(row("SUBJECT TITLE").ToString), "", row("SUBJECT TITLE").ToString)
                                .room = If(IsDBNull(row("ROOMS").ToString), "", row("ROOMS").ToString)
                                .day = If(IsDBNull(row("DAYS").ToString), "", row("DAYS").ToString)
                                .time = If(IsDBNull(row("TIME").ToString), "", row("TIME").ToString)
                                .instructor = If(IsDBNull(row("INSTRUCTOR").ToString), "", row("INSTRUCTOR").ToString)
                                track = If(IsDBNull(row("TRACK").ToString), "", row("TRACK").ToString)
                                strand = If(IsDBNull(row("STRAND").ToString), "", row("STRAND").ToString)
                            Case Else
                                .subject = If(IsDBNull(row("SUBJECT TITLE").ToString), "", row("SUBJECT TITLE").ToString)
                                .time = If(IsDBNull(row("TIME").ToString), "", row("TIME").ToString)
                                .day = If(IsDBNull(row("DAYS").ToString), "", row("DAYS").ToString)
                                .instructor = If(IsDBNull(row("INSTRUCTOR").ToString), "", row("INSTRUCTOR").ToString)
                        End Select


                    End With

                    SubjectEnrollmentSlip.Add(obj)

                Next

                Try
                    Dim LastSchool_Attended As New DataTable
                    LastSchool_Attended = getLastAttended_School(PERSON_ID)
                    Elementary_school = If(IsDBNull(LastSchool_Attended(0)("SCHOOLNAME").ToString), "", LastSchool_Attended(0)("SCHOOLNAME").ToString)
                    Elementary_year_from = If(IsDBNull(LastSchool_Attended(0)("FROM").ToString), "", LastSchool_Attended(0)("FROM").ToString)
                    Elementary_year_to = If(IsDBNull(LastSchool_Attended(0)("TO").ToString), "", LastSchool_Attended(0)("TO").ToString)
                    High_school = If(IsDBNull(LastSchool_Attended(1)("SCHOOLNAME").ToString), "", LastSchool_Attended(1)("SCHOOLNAME").ToString)
                    High_year_from = If(IsDBNull(LastSchool_Attended(1)("FROM").ToString), "", LastSchool_Attended(1)("FROM").ToString)
                    High_year_to = If(IsDBNull(LastSchool_Attended(1)("TO").ToString), "", LastSchool_Attended(1)("TO").ToString)
                Catch ex As Exception

                End Try


                Dim dt As New DataTable
                dt = ListModel.getRecord(PERSON_ID)
                If dt.Rows.Count > 0 Then

                    Try
                        last_name = If(IsDBNull(dt(0)("last_name")), "", dt(0)("last_name"))
                        first_name = If(IsDBNull(dt(0)("first_name")), "", dt(0)("first_name"))
                        middle_name = If(IsDBNull(dt(0)("middle_name")), "", dt(0)("middle_name"))
                        display_name = If(IsDBNull(dt(0)("display_name")), "", dt(0)("display_name"))
                        gender = If(IsDBNull(dt(0)("gender")), "", dt(0)("gender"))
                        birth_place = If(IsDBNull(dt(0)("birth_place")), "", (dt(0)("birth_place")))
                        marital_status = If(IsDBNull(dt(0)("marital_status")), "", dt(0)("marital_status"))
                        telephone1 = If(IsDBNull(dt(0)("telephone1")), "", dt(0)("telephone1"))
                        email = If(IsDBNull(dt(0)("email")), "", dt(0)("email"))
                        address = If(IsDBNull(dt(0)("address")), "", dt(0)("address"))
                        contact_person = If(IsDBNull(dt(0)("contact_person")), "", dt(0)("contact_person"))
                        contact_number = If(IsDBNull(dt(0)("contact_number")), "", dt(0)("contact_number"))
                        contact_address = If(IsDBNull(dt(0)("contact_address")), "", dt(0)("contact_address"))

                        LRN_number = If(IsDBNull(dt(0)("LRN_number")), "", dt(0)("LRN_number"))
                        scholarship_any = If(IsDBNull(dt(0)("scholarshipgrant")), "", dt(0)("scholarshipgrant"))

                        Academic_year = If(IsDBNull(dt_subject(0)("A.Y.").ToString), "", dt_subject(0)("A.Y.").ToString)
                        course_grade = If(IsDBNull(dt_subject(0)("COURSE").ToString), "", dt_subject(0)("COURSE").ToString)
                        year_level = If(IsDBNull(dt_subject(0)("YEAR LEVEL").ToString), "", dt_subject(0)("YEAR LEVEL").ToString)
                        semester = If(IsDBNull(dt_subject(0)("SEMESTER").ToString), "", dt_subject(0)("SEMESTER").ToString)
                        ID_Number = If(IsDBNull(dt_subject(0)("STD.ID").ToString), "", dt_subject(0)("STD.ID").ToString)

                        lastSchoolAttended1 = Elementary_school
                        lastSchoolAttended1_yearGraduated = Format(Elementary_year_from.Date, "yyyy") + "-" + Format(Elementary_year_to.Date, "yyyy")
                        lastSchoolAttended2 = High_school
                        lastSchoolAttended2_yearGraduted = Format(High_year_from.Date, "yyyy") + "-" + Format(High_year_to.Date, "yyyy")

                        age = GetCurrentAge(If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth")))
                        Dim DOB As Date = If(IsDBNull(dt(0)("date_of_birth")), "", dt(0)("date_of_birth"))
                        date_of_birth = Format(DOB.Date, "MM-dd-yyyy")


                    Catch ex As Exception
                        MsgBox(ex.Message)
                    End Try


                    Dim page As Integer = 1
                    Dim total_page As Integer = 2

                    Dim Master_Report As New xtrEnrollmentSlip_Main

                    While page <= total_page

                        Dim Main_report(page) As xtrEnrollmentSlip_Main
                        Main_report(page) = New xtrEnrollmentSlip_Main

                        Select Case _student_category_id
                            Case 13
                                Dim deans_head As String = getDeansHead(_courseID)
                                Try
                                    lecUnits = 0
                                    labUnits = 0
                                    For Each row As DataRow In dt_subject.Rows
                                        '        If row.Item("LEC") <> "" Or row.Item("LEC") <>  Then
                                        lecUnits += row.Item("LEC")
                                        '       Else
                                        labUnits += row.Item("LAB")
                                        '       End If
                                    Next

                                    Dim report As New xtrEnrollmentSlip_College


#Region "Signatory"
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel1.Text = dt_sigantory(0)("name")
                                        report.XrLabel2.Text = dt_sigantory(0)("designation")
                                        report.XrLabel74.Text = dt_sigantory(0)("name")
                                        report.XrLabel71.Text = dt_sigantory(0)("designation")

                                        report.XrLabel3.Text = dt_sigantory(1)("name")
                                        report.XrLabel4.Text = dt_sigantory(1)("designation")
                                        report.XrLabel80.Text = dt_sigantory(1)("name")
                                        report.XrLabel79.Text = dt_sigantory(1)("designation")

                                        report.XrLabel10.Text = dt_sigantory(2)("name")
                                        report.XrLabel5.Text = dt_sigantory(2)("designation")
                                        report.XrLabel75.Text = dt_sigantory(2)("name")
                                        report.XrLabel78.Text = dt_sigantory(2)("designation")

                                        report.XrLabel6.Text = dt_sigantory(3)("name")
                                        report.XrLabel7.Text = dt_sigantory(3)("designation")
                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.title_header.Text = _batch_name
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")

                                    report.LecUnits.Text = lecUnits
                                    report.LabUnits.Text = labUnits

                                    If dt_subject(0)("enrollmentAS").ToString = "NEW" Or dt_subject(0)("enrollmentAS").ToString = "TRANSFEREE" Then
                                        report.GroupFooter2.Visible = True
                                        report.deans_name_new.Text = deans_head
                                    Else
                                        report.GroupFooter3.Visible = True
                                        report.deans_name_old.Text = deans_head
                                    End If

                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    '      report.txtCourse.Text = date_of_birth
                                    report.txtCivilStatus.Text = marital_status
                                    report.txtGender.Text = gender
                                    report.txtBirthDate.Text = date_of_birth
                                    report.txtContactNo.Text = telephone1
                                    report.txtYearLevel.Text = LRN_number
                                    report.txtAddress.Text = address

                                    report.txtParentGuardian.Text = contact_person
                                    '    report.txtContactNo.Text = contact_number
                                    report.txtBirthPlace.Text = birth_place

                                    report.txtSchAttended1.Text = lastSchoolAttended1
                                    report.txtYearCompleted1.Text = lastSchoolAttended1_yearGraduated
                                    report.txtSchAttended2.Text = lastSchoolAttended2
                                    report.txtYearCompleted2.Text = lastSchoolAttended2_yearGraduted

                                    If _courseID = 29 Then
                                        report.txtCourse.Text = dt_subject(0)("MAJOR").ToString
                                    Else
                                        report.txtCourse.Text = course_grade
                                    End If

                                    report.txtSemester.Text = semester
                                    report.txtYearLevel.Text = year_level
                                    report.txtAdmisBasis.Text = basis_admission
                                    report.txtScholarship.Text = scholarship_any
                                    report.txtIDNumber.Text = ID_Number
                                    report.txtAY.Text = Academic_year
                                    report.txtEmail.Text = email

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '   report.PrintableComponentContainer1.PrintableComponent = GridControl

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

#Region "Signatory"
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel1.Text = dt_sigantory(0)("name")
                                        report.XrLabel2.Text = dt_sigantory(0)("designation")
                                        report.XrLabel74.Text = dt_sigantory(0)("name")
                                        report.XrLabel71.Text = dt_sigantory(0)("designation")

                                        report.XrLabel3.Text = dt_sigantory(1)("name")
                                        report.XrLabel4.Text = dt_sigantory(1)("designation")
                                        report.XrLabel80.Text = dt_sigantory(1)("name")
                                        report.XrLabel79.Text = dt_sigantory(1)("designation")

                                        report.XrLabel10.Text = dt_sigantory(2)("name")
                                        report.XrLabel5.Text = dt_sigantory(2)("designation")
                                        report.XrLabel75.Text = dt_sigantory(2)("name")
                                        report.XrLabel78.Text = dt_sigantory(2)("designation")

                                        report.XrLabel6.Text = dt_sigantory(3)("name")
                                        report.XrLabel7.Text = dt_sigantory(3)("designation")
                                    Catch ex As Exception
                                    End Try

#End Region


                                    report.title_header.Text = _batch_name
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")

                                    report.LecUnits.Text = lecUnits
                                    report.LabUnits.Text = labUnits

                                    If dt_subject(0)("enrollmentAS").ToString = "NEW" Or dt_subject(0)("enrollmentAS").ToString = "TRANSFEREE" Then
                                        report.GroupFooter2.Visible = True
                                        report.deans_name_new.Text = deans_head
                                    Else
                                        report.GroupFooter3.Visible = True
                                        report.deans_name_old.Text = deans_head
                                    End If

                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    '       report.txtCourse.Text = date_of_birth
                                    report.txtCivilStatus.Text = marital_status
                                    report.txtGender.Text = gender
                                    report.txtBirthDate.Text = date_of_birth
                                    report.txtContactNo.Text = telephone1
                                    report.txtYearLevel.Text = LRN_number
                                    report.txtAddress.Text = address

                                    report.txtParentGuardian.Text = contact_person
                                    '  report.txtContactNo.Text = contact_number
                                    report.txtBirthPlace.Text = birth_place

                                    report.txtSchAttended1.Text = lastSchoolAttended1
                                    report.txtYearCompleted1.Text = lastSchoolAttended1_yearGraduated
                                    report.txtSchAttended2.Text = lastSchoolAttended2
                                    report.txtYearCompleted2.Text = lastSchoolAttended2_yearGraduted

                                    If _courseID = 29 Then
                                        report.txtCourse.Text = dt_subject(0)("MAJOR").ToString
                                    Else
                                        report.txtCourse.Text = course_grade
                                    End If

                                    report.txtSemester.Text = semester
                                    report.txtYearLevel.Text = year_level
                                    report.txtAdmisBasis.Text = basis_admission
                                    report.txtScholarship.Text = scholarship_any
                                    report.txtIDNumber.Text = ID_Number
                                    report.txtAY.Text = Academic_year
                                    report.txtEmail.Text = email

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '  report.PrintableComponentContainer1.PrintableComponent = GridControl

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
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_SeniorHigh

#Region "Signatory"
                                    report.XrLabel20.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region
                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR SENIOR HIGH"

                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated
                                    report.txtTrack.Text = track
                                    report.txtStrand.Text = strand

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '     report.PrintableComponentContainer1.PrintableComponent = GridControl

                                    Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Orange
                                        report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Blue
                                        report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                    End If

                                    Subreport.ReportSource = report

                                Catch ex As Exception

                                End Try

                                Try
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_SeniorHigh


#Region "Signatory"
                                    report.XrLabel20.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region

                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR SENIOR HIGH"

                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated
                                    report.txtTrack.Text = track
                                    report.txtStrand.Text = strand

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip
                                    '    report.PrintableComponentContainer1.PrintableComponent = GridControl

                                    Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Green
                                        report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year

                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Red
                                        report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year

                                    End If

                                    Subreport2.ReportSource = report
                                Catch ex As Exception

                                End Try


                            Case 15
                                Try
                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_JuniorG78910


#Region "Signatory"
                                    report.XrLabel112.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region
                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR JHS SECONDARY"
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                    report.title_header.Text = _batch_name
                                    '   report.DataSource = SubjectEnrollmentSlip

                                    Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Orange
                                        report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Blue
                                        report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                    End If

                                    Subreport.ReportSource = report

                                Catch ex As Exception

                                End Try

                                Try

                                    Dim adviser As String = getDeansHead(_courseID)
                                    Dim report As New xtrEnrollmentSlip_JuniorG78910

#Region "Signatory"
                                    report.XrLabel112.Text = adviser
                                    Try
                                        Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                        report.XrLabel6.Text = dt_sigantory(0)("name")
                                        report.XrLabel7.Text = dt_sigantory(0)("designation")

                                        report.XrLabel8.Text = dt_sigantory(1)("name")
                                        report.XrLabel9.Text = dt_sigantory(1)("designation")

                                        report.XrLabel11.Text = dt_sigantory(2)("name")
                                        report.XrLabel10.Text = dt_sigantory(2)("designation")

                                    Catch ex As Exception
                                    End Try

#End Region
                                    report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                    report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                    report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                    report.header.Text = "ENROLLMENT SLIP FOR JHS SECONDARY"
                                    report.txtLastName.Text = last_name
                                    report.txtFirstName.Text = first_name
                                    report.txtMiddleName.Text = middle_name
                                    report.txtBirtdate.Text = date_of_birth
                                    report.txtAge.Text = age
                                    report.txtGender.Text = gender
                                    report.txtBirthPlace.Text = birth_place
                                    report.txtContactNo.Text = telephone1
                                    report.txtLRN_no.Text = LRN_number
                                    report.txtAddress.Text = address
                                    report.txtParentGuardian.Text = contact_person
                                    report.txtSchAttended.Text = lastSchoolAttended1
                                    report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                    report.title_header.Text = _batch_name
                                    report.DataSource = SubjectEnrollmentSlip

                                    Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                    If page = 1 Then
                                        report.txtStudentCopySY.ForeColor = Color.Green
                                        report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year 'GridView.GetRowCellValue(0, "A.Y.")

                                    Else
                                        report.txtStudentCopySY.ForeColor = Color.Red
                                        report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year  'GridView.GetRowCellValue(0, "A.Y.")

                                    End If

                                    Subreport2.ReportSource = report
                                Catch ex As Exception

                                End Try


                            Case Else

                                Dim grade As String = dt_subject(0)("COURSE")
                                Select Case grade
                                    Case "G-1", "G-2", "G-3"
                                        Try

                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG123  'xtrEnrollmentSlip_JuinorElementary
#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region
                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            '   report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Orange
                                                report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Blue
                                                report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                            End If

                                            Subreport.ReportSource = report

                                        Catch ex As Exception

                                        End Try

                                        Try
                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG123
#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region
                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Green
                                                report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year 'GridView.GetRowCellValue(0, "A.Y.")

                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Red
                                                report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year  'GridView.GetRowCellValue(0, "A.Y.")

                                            End If

                                            Subreport2.ReportSource = report
                                        Catch ex As Exception

                                        End Try

                                    Case Else

                                        Try
                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG456  'xtrEnrollmentSlip_JuinorElementary

#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region
                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            '   report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)

                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Orange
                                                report.txtStudentCopySY.Text = "STUDENTS COPY S.Y." + Academic_year
                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Blue
                                                report.txtStudentCopySY.Text = "ADVISER’S COPY S.Y." + Academic_year
                                            End If

                                            Subreport.ReportSource = report

                                        Catch ex As Exception

                                        End Try

                                        Try
                                            Dim adviser As String = getDeansHead(_courseID)
                                            Dim report As New xtrEnrollmentSlip_ElementaryG456

#Region "Signatory"
                                            report.XrLabel112.Text = adviser
                                            Try
                                                Dim dt_sigantory As DataTable = getSignatory(report.Tag)

                                                report.XrLabel6.Text = dt_sigantory(0)("name")
                                                report.XrLabel7.Text = dt_sigantory(0)("designation")

                                                report.XrLabel8.Text = dt_sigantory(1)("name")
                                                report.XrLabel9.Text = dt_sigantory(1)("designation")

                                                report.XrLabel11.Text = dt_sigantory(2)("name")
                                                report.XrLabel10.Text = dt_sigantory(2)("designation")

                                            Catch ex As Exception
                                            End Try

#End Region
                                            report.txtDate.Text = Format(CDate(dt_subject(0)("admission_date")).Date, "MMM dd, yyyy")
                                            report.txtAdmissionNo.Text = dt_subject(0)("admission_no")
                                            report.txtStudentNo.Text = dt_subject(0)("STD.ID")

                                            report.header.Text = "ENROLLMENT SLIP FOR ELEMENTARY"
                                            report.txtLastName.Text = last_name
                                            report.txtFirstName.Text = first_name
                                            report.txtMiddleName.Text = middle_name
                                            report.txtBirtdate.Text = date_of_birth
                                            report.txtAge.Text = age
                                            report.txtGender.Text = gender
                                            report.txtBirthPlace.Text = birth_place
                                            report.txtContactNo.Text = telephone1
                                            report.txtLRN_no.Text = LRN_number
                                            report.txtAddress.Text = address
                                            report.txtParentGuardian.Text = contact_person
                                            report.txtSchAttended.Text = lastSchoolAttended1
                                            report.txtYearCompleted.Text = lastSchoolAttended1_yearGraduated

                                            report.title_header.Text = _batch_name
                                            report.DataSource = SubjectEnrollmentSlip

                                            Dim Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                                            If page = 1 Then
                                                report.txtStudentCopySY.ForeColor = Color.Green
                                                report.txtStudentCopySY.Text = "CASHIER’S COPY S.Y." + Academic_year 'GridView.GetRowCellValue(0, "A.Y.")

                                            Else
                                                report.txtStudentCopySY.ForeColor = Color.Red
                                                report.txtStudentCopySY.Text = "PRINCIPAL’S COPY S.Y." + Academic_year  'GridView.GetRowCellValue(0, "A.Y.")

                                            End If

                                            Subreport2.ReportSource = report
                                        Catch ex As Exception

                                        End Try

                                End Select




                        End Select


                        Main_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
                        Main_report(page).CreateDocument()

                        Master_Report.Pages.AddRange(Main_report(page).Pages)
                        Master_Report.PrintingSystem.ContinuousPageNumbering = True

                        page += 1
                    End While

                    Master_Report.ShowPreview

                    SubjectEnrollmentSlip.Clear()


                End If
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Cursor.Current = Cursors.Default

    End Sub

    Private Function getLastAttended_School(personID As Object) As DataTable
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

    Private Sub Load_EnrollmentSlip(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor
        _view.GridControl1.DataSource = Nothing
        _view.GridControl1.DataSource = Enroll_Slip.LoadEnrollSlip(AdmissionNo)
        DesignGridControl(_view.GridView1)
        Cursor.Current = Cursors.Default
    End Sub

    Private Sub DesignGridControl(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)
        view.BeginUpdate()

        Select Case _student_category_id
            Case 13
                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 60
             '               view.Columns(i).BestFit()
                        Case 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 250
                '            view.Columns(i).BestFit()
                        Case 11, 12
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 50
              '              view.Columns(i).BestFit()
                        Case 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 50
             '               view.Columns(i).BestFit()
                        Case 14
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 110
               '             view.Columns(i).BestFit()
                        Case 15
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).Width = 50
               '             view.Columns(i).BestFit()
                        Case 16
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).Width = 150
           '                 view.Columns(i).BestFit()
                        Case 17
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                            view.Columns(i).Width = 200
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

        '        view.RefreshData()
        view.EndUpdate()


    End Sub

    Private Sub Print_EnrollmentSlip(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor



        Dim dt As New DataTable
        dt = Enroll_Slip.LoadEnrollSlip(AdmissionNo)

        '     _view.GridView1.Columns.Clear()
        _view.GridControl1.DataSource = Nothing
        _view.GridControl1.DataSource = dt
        _view.GridView1.RefreshData()
        _view.GridView1.ClearDocument()
        DesignGridControl(_view.GridView1)
        Enroll_Slip.EnrollmentSlip(AdmissionNo, _view.GridControl1, PERSON_ID, _view.GridView1)



        Cursor.Current = Cursors.Default

    End Sub

    Private Sub GridControlDesign(gv As GridView)
        Dim view As GridView = DirectCast(gv, GridView)
        view.BeginUpdate()

        Select Case _student_category_id
            Case 13
                For i As Integer = 0 To view.Columns.Count - 1

                    Select Case i
                        Case 9
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            '          view.Columns(i).Width = 50
                            view.Columns(i).BestFit()
                        Case 10
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case 11, 12
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            '                       view.Columns(i).Width = 100
                            view.Columns(i).BestFit()
                        Case 13
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            '                    view.Columns(i).Width = 50
                            view.Columns(i).BestFit()
                        Case 14, 15
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                            view.Columns(i).BestFit()
                        Case 16
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                        Case 17
                            view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                            view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                            view.Columns(i).BestFit()
                            '                    view.Columns(i).Width = 200
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

    Private Sub PrintCOE(sender As Object, e As EventArgs)
        Cursor.Current = Cursors.WaitCursor

        COE.CertificateOfEnrollment(AdmissionNo)
        ListModel.getStudentCategory(AdmissionNo)

        Cursor.Current = Cursors.Default
    End Sub

    Private Sub PrintCORNew(sender As Object, e As EventArgs)

        Dim StudentID As Integer = ListModel.getStudentID(AdmissionNo)

        Dim COR_Copies As New DataTable
        COR_Copies = ListModel.getCOR_Copies()
        Dim row As Integer = 0

        Dim page As Integer = 1
        Dim total_page As Double = COR_Copies.Rows.Count
        total_page = total_page / 2
        total_page = Round_Up(total_page)

        Dim Master_Report As New XtraReport_CORMain

        While page <= total_page

            Dim Main_report(page) As XtraReport_CORMain
            Main_report(page) = New XtraReport_CORMain

            Dim report As New XtraReport_CORNew
            report.XrLabel1.Text = COMPANY_NAME
            report.XrLabel4.Text = "Contact #: " & COMPANY_MOBILE_NUMBER
            report.XrLabel5.Text = "Email Address: registrar@tpc.edu.ph"
            report.XrLabel11.Text = ListModel.getCurriculunmStatus(StudentID)

            If Not File.Exists(COMPANY_LOGO_PATH) Then
                report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(Default_LogoPath))
            Else
                report.XrPictureBox1.ImageSource = New ImageSource(New Bitmap(COMPANY_LOGO_PATH))
            End If

            Dim dt As New DataTable
            dt = ListModel.getStudents_COR_info(AdmissionNo)

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

            report.XrLabel25.Text = ListModel.getTotalAmount(StudentID)

            dt = Nothing

            Try
                dt = ListModel.getStudent_Subject_info(AdmissionNo)
                If dt.Rows.Count > 0 Then

                    For x As Integer = 0 To dt.Rows.Count - 1

                        Dim obj As New COR_Subject_Details
                        With obj
                            .Subject_code = dt(x)("subject_code")
                            .Descriptive_title = dt(x)("descriptive_title")
                            .Units = dt(x)("units")
                            .Time = If(IsDBNull(dt(x)("time")), "", dt(x)("time"))
                            .Day = If(IsDBNull(dt(x)("day")), "", dt(x)("day"))
                            .Room = If(IsDBNull(dt(x)("room")), "", dt(x)("room"))
                            .Instructor = If(IsDBNull(dt(x)("instructor")), "", dt(x)("instructor"))

                        End With
                        Subject_info.Add(obj)
                    Next
                End If
                Dim Subreport As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
                Subreport.ReportSource.DataSource = Subject_info

            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            dt = Nothing

            Try
                dt = ListModel.getStudent_Assessment_info(StudentID)
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

                Dim Subreport1 As XRSubreport = TryCast(report.Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Subreport1.ReportSource.DataSource = Assessment_info

            Catch ex As Exception
                MsgBox(ex.Message)
            End Try

            report.BindingSource1.DataSource = COR_info
            report.PrintingSystem.Document.AutoFitToPagesWidth = 1

            Dim Main_Subreport1 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport1", True), XRSubreport)
            Main_Subreport1.ReportSource = report

            Main_report(page).XrCopy1.Text = COR_Copies(row)("name")
            Main_report(page).XrCopy1.BackColor = Color.FromName(COR_Copies(row)("description"))

            If COR_Copies.Rows.Count - 1 <> row Then

                Dim Main_Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Main_Subreport2.ReportSource = report

                Main_report(page).XrCopy2.Text = COR_Copies(row + 1)("name")
                Main_report(page).XrCopy2.BackColor = Color.FromName(COR_Copies(row + 1)("description"))

            Else

                Dim Main_Subreport2 As XRSubreport = TryCast(Main_report(page).Bands(BandKind.Detail).FindControl("XrSubreport2", True), XRSubreport)
                Main_Subreport2.ReportSource = Nothing
                Main_Subreport2.Visible = False
                Main_report(page).XrCopy2.Visible = False

            End If

            Main_report(page).PrintingSystem.Document.AutoFitToPagesWidth = 1
            Main_report(page).CreateDocument()

            row += 2

            Master_Report.Pages.AddRange(Main_report(page).Pages)
            Master_Report.PrintingSystem.ContinuousPageNumbering = True

            page += 1

            Subject_info.Clear()
            Assessment_info.Clear()
        End While

        Master_Report.ShowPreview


    End Sub

    Function Round_Up(ByVal num As Double) As Integer
        Dim result As Integer
        result = Math.Round(num)
        If result >= num Then
            Round_Up = result
        Else
            Round_Up = result + 1
        End If
    End Function


    Dim COR_info As New Student_COR
    Dim Subject_info As New List(Of COR_Subject_Details)
    Dim Assessment_info As New List(Of COR_Assessment_Details)
    Dim Default_LogoPath As String = Directory.GetCurrentDirectory & "\TPC_logo.jpg"

    Public Sub PrintCOR(sender As Object, e As EventArgs)

        Dim StudentID As Integer = ListModel.getStudentID(AdmissionNo)


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

            report(page).XrLabel25.Text = ListModel.getTotalAmount(StudentID)


            If page = 2 Then
                report(page).XrLabeLRegistrarCopy.Visible = True
            Else
                report(page).XrLabeLRegistrarCopy.Visible = False
            End If

            Dim dt As New DataTable
            dt = ListModel.getStudents_COR_info(AdmissionNo)

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
                dt = ListModel.getStudent_Subject_info(AdmissionNo)


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
                dt = ListModel.getStudent_Assessment_info(StudentID)

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

        '    Cursor.Cursor = Cursors.Default



    End Sub

    Dim NodeLevel As Boolean = False
    Private Sub CheckNodeLevel(sender As Object, e As EventArgs)
        Dim TreList As TreeList = DirectCast(sender, TreeList)

        If TreList.FocusedNode IsNot Nothing Then
            If TreList.FocusedNode.Level = 2 Then
                NodeLevel = True
            Else
                NodeLevel = False
            End If
        End If

    End Sub

    Private Sub MenuStripVisible(sender As Object, e As MouseEventArgs)

        Dim point1 As Point

        If e.Button = Windows.Forms.MouseButtons.Right Then

            If NodeLevel Then
                point1 = Windows.Forms.Cursor.Position
                Dim pt As Point = _view.TreeList2.PointToClient(point1)
                _view.ContextMenuStrip1.Show(_view.TreeList2, pt)
                '             _view.
            Else
                _view.ContextMenuStrip1.Visible = False
            End If

        End If

    End Sub

    Dim AdmissionNo As String

    Private Sub getNodeValueAdmissionNo(sender As Object, e As FocusedNodeChangedEventArgs)

        Dim dt As New DataTable

        If e.Node IsNot Nothing Then
            If e.Node.Level = 2 Then
                AdmissionNo = e.Node.Tag
                ListModel.getStudentCategory(AdmissionNo)
                getBatch(AdmissionNo)
                '           _studentID = ListModel.getStudentID(AdmissionNo)
                dt = ListModel.getStudentLearnersDetails(AdmissionNo)
                If dt.Rows.Count > 0 Then
                    For Each rows As DataRow In dt.Rows
                        _studentID = rows.Item("id")
                        _course_name = rows.Item("course_name")
                        _school_year = rows.Item("school_year")
                        _semester = rows.Item("semester")
                        _year_level = rows.Item("year_level")
                    Next

                End If
            End If
            End If

    End Sub

    Public _EnterKey As Boolean = False

    Public Sub Treelistload(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor

        _view.TreeList2.ClearFocusedColumn()
        _view.TreeList2.ClearNodes()

        Dim dt As New DataTable
        dt = ListModel.getStudentDetails(id) '_view.cmbStudentName.SelectedValue

        CreateNodes(_view.TreeList2, dt)

        Cursor.Current = Cursors.Default
    End Sub


    Dim BestFitNodes As TreeListBestFitNodes
    Private Sub CreateNodes(treeList1 As TreeList, dt As DataTable)

        'If _view.cmbStudentName.SelectedValue = 0 Then
        treeList1.Appearance.Row.Font = New Font("Tahoma", 8.25)
        treeList1.Appearance.EvenRow.Font = New Font("Tahoma", 8.25)
        treeList1.Appearance.OddRow.Font = New Font("Tahoma", 8.25)
        'Else
        '    treeList1.Appearance.Row.Font = New Font("Tahoma", 12)
        '    treeList1.Appearance.EvenRow.Font = New Font("Tahoma", 12)
        '    treeList1.Appearance.OddRow.Font = New Font("Tahoma", 12)
        'End If

        treeList1.BeginUnboundLoad()

        For Each rows As DataRow In dt.Rows

            ' Create a root node .
            Dim ColumnName As String = rows.Item("Name")
            Dim parentForRootNodes As TreeListNode = Nothing
            Dim CourseNode As TreeListNode = treeList1.AppendNode(New Object() {ColumnName}, parentForRootNodes)
            'COURSE
            Dim dt1 As DataTable = ListModel.getStudentCourse(rows("ClassRoll_Number"))

            For Each rows1 As DataRow In dt1.Rows

                Dim value1 As String = rows1.Item("CourseName")
                Dim BatchNode As TreeListNode = treeList1.AppendNode(New Object() {value1}, CourseNode)
                If CourseNode IsNot Nothing Then
                    CourseNode.CheckState = CheckState.Checked
                    '           CourseNode.Expanded = True
                End If
                'BATCH
                Dim dt2 As DataTable = ListModel.getBatchGroup(rows("ClassRoll_Number"))
                For Each rows2 As DataRow In dt2.Rows

                    Dim value2 As String = rows2.Item("BatchName")
                    Dim SubbjectNode As TreeListNode = treeList1.AppendNode(New Object() {value2}, BatchNode)
                    SubbjectNode.Tag = rows2("admission_no")

                    If BatchNode IsNot Nothing Then
                        BatchNode.CheckState = CheckState.Checked
                        '           BatchNode.Expanded = True
                    End If
                    'BATCH SUBJECT DETAILS
                    Dim dt3 As DataTable = ListModel.getStudentSubject(rows2("id"))
                    For Each rows3 As DataRow In dt3.Rows
                        treeList1.AppendNode(New Object() {rows3("SUBJECT CODE"), rows3("SUBJECT NAME"), rows3("UNITS"), rows3("CLASS CODE"), rows3("SCHEDULE"), rows3("ROOM")}, SubbjectNode)

                        If SubbjectNode IsNot Nothing Then
                            SubbjectNode.CheckState = CheckState.Checked
                            '               SubbjectNode.Expanded = True
                        End If


                    Next
                Next
            Next
        Next
        treeList1.EndUnboundLoad()
        treeList1.OptionsView.BestFitNodes = TreeListBestFitNodes.Default
        If _view.cmbStudentName.SelectedValue > 0 Then
            treeList1.ExpandAll()
        Else
            '       _view.lbltimer.Text = "1"
        End If


    End Sub

    Private Sub loadComboBox()
        _view.cmbStudentName.DataSource = ListModel.getStudentRecord()
        _view.cmbStudentName.ValueMember = "ID"
        _view.cmbStudentName.DisplayMember = "Name"
        _view.cmbStudentName.SelectedIndex = -1
    End Sub


    Public Overridable Property FixedWidth As Boolean = True

    Private Sub CreateColumns(treeList1 As TreeList)

        ' Create three columns.
        treeList1.BeginUpdate()

        Dim col0 As TreeListColumn = treeList1.Columns.Add()
        col0.Caption = "SUBJECT CODE"
        col0.VisibleIndex = 0

        Dim col1 As TreeListColumn = treeList1.Columns.Add()
        col1.Caption = "SUBJECT NAME"
        col1.VisibleIndex = 1

        Dim col2 As TreeListColumn = treeList1.Columns.Add()
        col2.Caption = "UNITS"
        col2.VisibleIndex = 2

        Dim col3 As TreeListColumn = treeList1.Columns.Add()
        col3.Caption = "CLASS CODE"
        col3.VisibleIndex = 3

        Dim col4 As TreeListColumn = treeList1.Columns.Add()
        col4.Caption = "SCHEDULE"
        col4.VisibleIndex = 4

        Dim col5 As TreeListColumn = treeList1.Columns.Add()
        col5.Caption = "ROOM"
        col5.VisibleIndex = 5

        treeList1.EndUpdate()

    End Sub
End Class
