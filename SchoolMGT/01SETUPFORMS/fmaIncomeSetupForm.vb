Imports MySql.Data.MySqlClient
Imports System.Threading
Imports System.ComponentModel
Imports System.IO
Imports DevExpress.XtraReports.UI
Imports DevExpress.XtraPrinting.Drawing

Public Class fmaIncomeSetupForm

    Public Event INCOME_SETUP_CLOSING()

    Public FeeCategoryID As Integer = 0
    Public Amount As Double = 0
    Public Class_roll_no As Integer = 0
    Public stdID As Integer = 0
    Public request_form As Integer = 0
    Dim FirstLod As Boolean
    Public OPERATION As String
    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub

    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click

        If txtCatID.Text.Length = 0 Then
            MsgBox("Please Select Expense Type.", MsgBoxStyle.Critical)
            Exit Sub
        End If

        Dim finance_type As String = "Income"
        Dim category_id As String = ""
        Dim created_at As String = Format(DateTime.Now, "yyyy-MM-dd hh:mm:ss")

        If FeeCategoryID > 0 Then
            txtCatID.Text = FeeCategoryID
        End If

        If txtORNumber.Text = "" Then
            MsgBox("Please Enter Correct O.R Number.", MsgBoxStyle.Exclamation)
            Exit Sub
        End If

        If diAmount.Value <= 0 Then
            MsgBox("Please Enter Correct Amount.", MsgBoxStyle.Exclamation)
            Exit Sub
        End If


        title.Text = "Received From : " & cmbStudent.Text

        Dim SQLIN As String = "INSERT INTO finance_transactions(title,description,payee_type"
        SQLIN += " ,amount,category_id,student_id,issued_date"
        SQLIN += " ,created_at,transaction_date"
        SQLIN += " ,finance_type, receipt_no,payee_id,address,payment_type,user_id)"
        SQLIN += " VALUES("
        SQLIN += String.Format("'{0}', '{1}','{2}'", title.Text, Me.txtRemarks.Text, "BY ITEM PAYMENT")
        SQLIN += String.Format(",'{0}', '{1}', '{2}', '{3}'", Me.diAmount.Value, txtCatID.Text, stdID, Format(Me.dtiDateIssued.Value, "yyyy-MM-dd"))
        SQLIN += String.Format(",'{0}', '{1}'", created_at, Format(dtpPayDate.Value, "yyyy-MM-dd"))
        SQLIN += String.Format(",'{0}', '{1}', '{2}','{3}','{4}','{5}')", finance_type, txtORNumber.Text, Class_roll_no, txtcourse.Text, 1, LoginUserID)
        DataSource(SQLIN)

        '       If clsDBConn.Execute(SQLIN) Then
        MsgBox("Transaction has been saved.")


        If CollType = "FORM" Then

            Dim LasPk = DataObject(String.Format("SELECT MAX(id) FROM finance_transactions"))

            SQLIN = ""

            SQLIN = "INSERT INTO request_form(finance_transaction_id,date_filed"
            SQLIN += " ,date_due,claim_window,no_of_copies,purpose)"
            SQLIN += " VALUES("
            SQLIN += String.Format("'{0}', '{1}'", LasPk, Format(dtpDateFiled.Value, "yyyy-MM-dd"))
            SQLIN += String.Format(",'{0}', '{1}', '{2}', '{3}')", Format(dtpDateDute.Value, "yyyy-MM-dd"), txtClaimWindow.Text, nudNoCopies.Value, txtpurpose.Text)
            DataSource(SQLIN)

            If MessageBox.Show("Do you want to print CLAIM STAB?", "Please verify....", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = DialogResult.Yes Then

                Dim report As New XtraReport_ClaimStub

                report.XrLName.Text = cmbStudent.Text
                report.XrLDateFiled.Text = Format(dtpDateFiled.Value, "MM/dd/yyyy")
                report.XrLDueDate.Text = Format(dtpDateDute.Value, "MM/dd/yyyy")
                report.XrLClaimWindow.Text = txtClaimWindow.Text
                report.form.Text = cmbType.Text
                report.PrintingSystem.Document.AutoFitToPagesWidth = 1
                report.CreateDocument()
                report.ShowPreview

            Else

                MessageBox.Show("Record Save...", "Successfully!")

            End If



        End If



        '      End If


        If MessageBox.Show("Do you want to PRINT official Receipt?", "Please verify....", MessageBoxButtons.YesNo,
   MessageBoxIcon.Information) = DialogResult.Yes Then

            Dim new_report As New fzzReportViewerForm

            Dim SQLEX As String = "SELECT admission_no FROM students"
            SQLEX += " WHERE id ='" & 0 & "'"

            new_report.FolderName = "OFFICIAL RECEIPT"
            new_report.AttachReport(SQLEX, "OR - " & Me.txtORNumber.Text & ", " & cmbType.Text) = New rpt_ReceiptPrintout(Format(dtpPayDate.Value, "yyyy-MM-dd"),
                                                                                                                   Me.title.Text, diAmount.Value,
                                                                                                                      Me.txtRemarks.Text, Me.txtORNumber.Text)
            new_report.Show()

        End If


        Me.DialogResult = DialogResult.OK

        fmaIncomeListForm.Attach()
        fmaIncomeListForm.LoadRequesList()

    End Sub

    Private Sub fmaCashVoucherSetupForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        cmbCollType.SelectedIndex = -1
        txtClaimWindow.Text = ""
        txtpurpose.Text = ""
        cmbStudent.SelectedIndex = -1
        txtcourse.Text = ""
        cmbType.SelectedIndex = -1
        txtORNumber.Text = ""
        title.Text = ""
        txtRemarks.Text = ""
        diAmount.Value = 0


        If chkActive.Checked = False Then
            cmbStudent.DropDownStyle = ComboBoxStyle.DropDown
            cmbStudent.AutoCompleteMode = AutoCompleteMode.SuggestAppend
            cmbStudent.AutoCompleteSource = AutoCompleteSource.ListItems
            Label1.Visible = False

        Else
            cmbStudent.DropDownStyle = ComboBoxStyle.Simple
            cmbStudent.AutoCompleteMode = AutoCompleteMode.None
            cmbStudent.AutoCompleteSource = AutoCompleteSource.None
            cmbStudent.Focus()
            title.Text = ""
            txtcourse.Text = ""
            cmbStudent.Text = ""
            Label1.Visible = True
        End If


        FirstLod = True
        GroupPanel4.Visible = False
        Me.Size = New Size(600, 562)

        getCategoryCode()
        getStudent()
        loadComboBox()
        Me.dtpPayDate.Value = Date.Now

        FirstLod = False
    End Sub

    Private Sub loadComboBox()

        cmbCollType.DataSource = getCollectioType()
        cmbCollType.ValueMember = "id"
        cmbCollType.DisplayMember = "name"
        cmbCollType.SelectedIndex = -1

    End Sub

    Private Function getCollectioType() As Object
        Dim sql As String = ""
        sql = "SELECT DISTINCT
                0 as 'id',
                trans_type 'name',
                payment_mode
                FROM finance_transaction_categories
                WHERE payment_mode = 'COLLECTION'"
        Return DataSource(sql)
    End Function

    Private Sub getStudent()
        cmbStudent.DataSource = getStudentList()
        cmbStudent.ValueMember = "ID"
        cmbStudent.DisplayMember = "Name"
        cmbStudent.SelectedIndex = -1
    End Sub

    Private Function getStudentList() As Object
        Dim str As String = ""
        str = "SELECT
                students.class_roll_no AS `ID`,
                person.display_name AS `Name`,
                courses.code AS Course,
                file.company_name AS `SchoolName`,
                file.address AS Address,
                students.academice_year as 'AcademicYear',
                students.id 'std_id'

                FROM
                person
                LEFT JOIN file ON file.application_setup_id = person.application_setup_id
                LEFT JOIN students ON person.person_id = students.person_id
                LEFT JOIN courses ON students.course_id = courses.id
                WHERE
                person.status_type_id = 1 AND
                person.end_time IS NULL AND
                students.status_type_id = 1 AND
                students.end_time IS NULL

                ORDER BY
                `Name` ASC
                "
        Return DataSource(str)
    End Function

    Private Sub getCategoryCode()
        Dim SQLEX As String = "SELECT id,UPPER(name) 'name',description FROM finance_transaction_categories WHERE is_income=1"
        SQLEX += " and deleted <> 1 and payment_mode = 'COLLECTION' "
        If cmbCollType.Text <> "" Then
            SQLEX += " AND trans_type = '" & cmbCollType.Text & "' "
        End If

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbType.DataSource = MeData

        cmbType.ValueMember = "id"
        cmbType.DisplayMember = "name"

        cmbType.SelectedIndex = -1
        txtCatID.Text = ""
    End Sub


    Private Sub cmbType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbType.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbType.SelectedItem, DataRowView)
            FeeCategoryID = drv.Item("id").ToString
            Me.txtCatID.Text = drv.Item("id").ToString
        Catch ex As Exception
            Me.txtCatID.Text = ""
        End Try
    End Sub


    Private Sub cmbType_SelectionChangeCommitted(sender As Object, e As EventArgs) Handles cmbType.SelectionChangeCommitted

        'Try
        '    Dim drv As DataRowView = DirectCast(cmbType.SelectedItem, DataRowView)
        '    tor = drv.Item("name").ToString
        '    If tor.Contains("TOR").ToString Then
        '        GroupBox1.Enabled = True
        '        chkSlip.Enabled = True
        '    End If

        'Catch ex As Exception
        '    Me.txtCatID.Text = ""
        'End Try
    End Sub

    Public Course As String = ""
    Public SchoolName As String = ""
    Public Address As String = ""
    Public AcademicYear As String = ""

    'Private Sub cmbStudent_SelectionChangeCommitted(sender As Object, e As EventArgs) Handles cmbStudent.SelectionChangeCommitted

    '    Try
    '            Dim drv As DataRowView = DirectCast(cmbStudent.SelectedItem, DataRowView)
    '        Course = drv.Item("Course").ToString
    '        txtcourse.Text = drv.Item("Course").ToString
    '        SchoolName = drv.Item("SchoolName").ToString
    '        Address = drv.Item("Address").ToString
    '        AcademicYear = drv.Item("AcademicYear").ToString
    '        title.Text = drv.Item("name").ToString
    '        stdID = drv.Item("std_id").ToString
    '        Class_roll_no = drv.Item("ID").ToString
    '    Catch ex As Exception
    '        End Try

    'End Sub

    Dim CollType As String = ""
    Private Sub cmbCollType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCollType.SelectedIndexChanged

        If FirstLod = False Then
            Try
                Dim drv As DataRowView = DirectCast(cmbCollType.SelectedItem, DataRowView)
                CollType = drv.Item("name").ToString
                cmbCollType.Text = CollType
                If CollType = "FORM" Then
                    GroupPanel4.Visible = True
                    Me.Size = New Size(600, 692)
                Else
                    GroupPanel4.Visible = False
                    Me.Size = New Size(600, 562)
                End If
                getCategoryCode()
            Catch ex As Exception

            End Try
        End If

    End Sub

    Private Sub txtcourse_TextChanged(sender As Object, e As EventArgs) Handles txtcourse.TextChanged

        If stdID > 0 Then
            Course = txtcourse.Text
        End If

    End Sub

    Private Sub cmbStudent_KeyDown(sender As Object, e As KeyEventArgs) Handles cmbStudent.KeyDown
        If e.KeyCode = Keys.Back Then
            title.Text = ""
            txtcourse.Text = ""
        End If
    End Sub

    Private Sub chkActive_CheckedChanged(sender As Object, e As EventArgs) Handles chkActive.CheckedChanged

        If chkActive.Checked = False Then
            cmbStudent.DropDownStyle = ComboBoxStyle.DropDown
            cmbStudent.AutoCompleteMode = AutoCompleteMode.SuggestAppend
            cmbStudent.AutoCompleteSource = AutoCompleteSource.ListItems
            Label1.Visible = False
        Else
            cmbStudent.DropDownStyle = ComboBoxStyle.Simple
            cmbStudent.AutoCompleteMode = AutoCompleteMode.None
            cmbStudent.AutoCompleteSource = AutoCompleteSource.None
            cmbStudent.Focus()
            title.Text = ""
            txtcourse.Text = ""
            cmbStudent.Text = ""
            Label1.Visible = True
            stdID = 0
            Class_roll_no = 0
        End If


    End Sub

    Private Sub cmbStudent_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbStudent.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbStudent.SelectedItem, DataRowView)
            Course = drv.Item("Course").ToString
            txtcourse.Text = drv.Item("Course").ToString
            SchoolName = drv.Item("SchoolName").ToString
            Address = drv.Item("Address").ToString
            AcademicYear = drv.Item("AcademicYear").ToString
            title.Text = drv.Item("name").ToString
            stdID = drv.Item("std_id").ToString
            Class_roll_no = drv.Item("ID").ToString
        Catch ex As Exception
        End Try
    End Sub



    Private Sub fmaIncomeSetupForm_FormClosed(sender As Object, e As FormClosedEventArgs) Handles Me.FormClosed
        RaiseEvent INCOME_SETUP_CLOSING()
    End Sub
End Class