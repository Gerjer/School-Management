Imports System.Threading
Imports System.ComponentModel

Public Class fmaFeesMasterListForm

    Dim WithEvents masterFeeSetup As fmaFeesMasterSetupForm
    Dim WithEvents detailFeeSetup As fmaFeesDetailListForm
    Dim WithEvents importFees As fmaFeesMasterDuplicate

    Dim ROWINDEX As Integer = 0


    Private Sub fmaFeesMasterListForm_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        displayCategory()
        displayCourse()
        displayBatchYear()
        displaySemester()
        displayBatches()
        dgvFEES.Rows.Clear()
        displayDefault()
    End Sub

    Private Sub displayBatchYear()

        Dim SQLEX As String = "SELECT DISTINCT 1 AS 'id',batches.school_year 'name' "
        SQLEX += " FROM	batches "
        SQLEX += " WHERE school_year IS NOT NULL"
        If txtCourseID.Text <> "" Then
            SQLEX += " AND course_id = '" & txtCourseID.Text & "' "
        End If
        SQLEX += " ORDER BY school_year DESC"

        cmbYear.DataSource = DataSource(SQLEX)
        cmbYear.ValueMember = "id"
        cmbYear.DisplayMember = "name"
        cmbYear.SelectedIndex = -1


    End Sub

    Private Sub displayDefault()

        cmbDefault.DataSource = DataSource(String.Format("
                                            SELECT
                                              batches.id,
	                                            `name`
                                            FROM
	                                            batches
                                            WHERE
	                                            school_year IS NULL
                                                          "))
        cmbDefault.ValueMember = "id"
        cmbDefault.DisplayMember = "name"
        cmbDefault.SelectedIndex = -1

    End Sub

    Private Sub displayCategory()
        cmbCategory.DataSource = DataSource(String.Format("SELECT
	                                                    student_categories.id, 
	                                                    student_categories.`name`
                                                    FROM
	                                                    student_categories
                                                    WHERE is_deleted = 0
                                                    "))

        cmbCategory.DisplayMember = "name"
        cmbCategory.ValueMember = "id"
        cmbCategory.SelectedIndex = -1

    End Sub

    Private Sub displayCourse()

        Dim SQLEX As String = "SELECT id, course_name  FROM courses"
        SQLEX += " WHERE is_deleted <> 1 and category_id = '" & CatID & "'"
        SQLEX += " GROUP BY course_name"
        SQLEX += " ORDER BY course_name"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbCourse.DataSource = MeData

        cmbCourse.ValueMember = "id"
        cmbCourse.DisplayMember = "course_name"

        cmbCourse.SelectedIndex = -1
        txtCourseID.Text = ""


    End Sub


    Private Sub displayBatches()
        Dim SQLEX As String = ""

        'SQLEX = " SELECT batches.id, name FROM batches"
        'SQLEX += " INNER JOIN courses"
        'SQLEX += " ON (batches.course_id = courses.id)"
        'SQLEX += " WHERE batches.is_deleted =0 AND batches.is_active=1"
        'SQLEX += " AND course_id='" & Me.txtCourseID.Text & "'"

        SQLEX = "
SELECT
  	batches.id,
	`name`
NAME 
FROM
	batches
	INNER JOIN courses ON ( batches.course_id = courses.id ) 
WHERE
	batches.is_deleted = 0 
	AND batches.is_active = 1 
	AND course_id = '" & Me.txtCourseID.Text & "' AND school_year = '" & Year & "' AND semester = '" & Semester & "'   ORDER BY semester
	"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        cmbBatch.DataSource = MeData

        cmbBatch.ValueMember = "id"
        cmbBatch.DisplayMember = "name"
        cmbBatch.Text = ""
        cmbBatch.SelectedIndex = -1
        txtBatchID.Text = ""

       
    End Sub

    Private Sub cmbCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbCourse.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCourse.SelectedItem, DataRowView)
            Me.txtCourseID.Text = drv.Item("id").ToString
            displayBatchYear()
            '     displayBatches()
            cmbYear.Enabled = True
        Catch ex As Exception
            Me.txtCourseID.Text = ""
        End Try
    End Sub

    Private Sub cmbBatch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbBatch.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbBatch.SelectedItem, DataRowView)
            Me.txtBatchID.Text = drv.Item("id").ToString
        Catch ex As Exception
            Me.txtBatchID.Text = ""
        End Try
        cmbDefault.SelectedIndex = -1
    End Sub

    Private Sub getMasterFees()

        If cmbBatch.Text = "" Then
            dgvFEES.Rows.Clear()
            Exit Sub
        End If
        Dim TOTAL_FEES As Double = 0
        dgvFEES.Rows.Clear()

        Dim SQLEX As String = "SELECT finance_fee_categories.id 'masterid', finance_fee_categories.name 'catname',SUM(finance_fee_particulars.amount) 'masterfee', finance_fee_categories.description,finance_fee_particulars.mode_payments FROM finance_fee_categories"
        SQLEX += " LEFT JOIN finance_fee_particulars "
        SQLEX += " ON (finance_fee_particulars.finance_fee_category_id = finance_fee_categories.id)"
        SQLEX += " WHERE finance_fee_categories.is_deleted<> 1 AND batch_id='" & txtBatchID.Text & "'"
        SQLEX += " GROUP BY finance_fee_categories.name"
        SQLEX += " ORDER BY finance_fee_categories.id"

        Dim MeData As DataTable
        MeData = clsDBConn.ExecQuery(SQLEX)

        If MeData.Rows.Count > 0 Then
            For cnt As Integer = 0 To MeData.Rows.Count - 1
                Dim catname As String = MeData.Rows(cnt).Item("catname").ToString
                Dim catid As String = MeData.Rows(cnt).Item("masterid").ToString
                Dim description As String = MeData.Rows(cnt).Item("description").ToString
                Dim mode_paymens As String = MeData.Rows(cnt).Item("mode_payments").ToString
                Dim TotalAmt As String = ""
                Try
                    TotalAmt = Format(CDbl(MeData.Rows(cnt).Item("masterfee").ToString), "#,##0.00")
                Catch ex As Exception
                    TotalAmt = "0.00"
                End Try

                TOTAL_FEES += CDbl(TotalAmt)

                dgvFEES.Rows.Add(New String() {catname, "", "", TotalAmt, catid, description, mode_paymens})



                Dim SQLEXDetails As String = "SELECT name 'detailname', amount FROM finance_fee_particulars"
                SQLEXDetails += " WHERE finance_fee_category_id ='" & catid & "'"
                SQLEXDetails += " AND is_deleted !='1'"
                Dim inDataT As DataTable
                inDataT = clsDBConn.ExecQuery(SQLEXDetails)

                If inDataT.Rows.Count Then
                    For indataCtr As Integer = 0 To inDataT.Rows.Count - 1
                        Dim detailname As String = inDataT.Rows(indataCtr).Item("detailname").ToString
                        Dim amount As String = Format(CDbl(inDataT.Rows(indataCtr).Item("amount").ToString), "#,##0.00")

                        dgvFEES.Rows.Add(New String() {"", detailname, amount, "", "-"})


                    Next
                End If

            Next
            dgvFEES.Rows.Add(New String() {"", "--", "TOTAL", Format(TOTAL_FEES, "#,##0.00"), "++"})
            dgvFEES.Item(2, dgvFEES.Rows.Count - 1).Style.ForeColor = Color.Red
            dgvFEES.Item(3, dgvFEES.Rows.Count - 1).Style.ForeColor = Color.Red
            btnDuplicate.Visible = False
        Else
            btnDuplicate.Visible = True
        End If

    End Sub

    Private Sub txtBatchID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtBatchID.TextChanged
        If txtBatchID.Text.Length > 0 Then
            pbxSearch.Visible = True
            'getMasterFees()
            Timer1.Enabled = True
            rollingSpinner.Visible = True
            stillSpinner.Visible = False
            lblStatus.Text = "Searching.."
            btnAdd.Visible = True
        Else
            Timer1.Enabled = False
            lblTimer.Text = "0"
            pbxSearch.Visible = False
            rollingSpinner.Visible = False
            stillSpinner.Visible = True
            pbxSearch.Visible = False
            lblStatus.Text = ""
            btnAdd.Visible = False
        End If
    End Sub

    'Private Sub pbxSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles pbxSearch.Click
    '    getMasterFees()
    'End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim tick As Integer = CInt(lblTimer.Text)

        lblTimer.Text = tick + 1

        If tick = 1 Then
            Timer1.Enabled = False
            lblTimer.Text = "0"
            getMasterFees()

            lblStatus.Text = "Done."
            rollingSpinner.Visible = False
            stillSpinner.Visible = True
            pbxSearch.Visible = False
           
        End If
    End Sub

    Private Sub txtCourseID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCourseID.TextChanged
        dgvFEES.Rows.Clear()
    End Sub

    Private Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub btnAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        If masterFeeSetup Is Nothing Then
            masterFeeSetup = New fmaFeesMasterSetupForm
            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
            masterFeeSetup.btnDelete.Visible = False
            masterFeeSetup.btnSave.Text = "Save"
            masterFeeSetup.ShowDialog(Me)
        Else
            masterFeeSetup = Nothing
            masterFeeSetup = New fmaFeesMasterSetupForm
            masterFeeSetup.btnDelete.Visible = False
            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
            masterFeeSetup.btnSave.Text = "Save"
            masterFeeSetup.ShowDialog(Me)
        End If
    End Sub

    Private Sub masterFeeSetup_FeeAdded() Handles masterFeeSetup.FeeAdded
        getMasterFees()
    End Sub

    Private Sub dgvFEES_CellContentClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvFEES.CellContentClick
        If e.RowIndex < 0 Then
            Exit Sub
        End If

        ROWINDEX = e.RowIndex
        If e.ColumnIndex = 0 Then
            If dgvFEES.Item(0, ROWINDEX).Value.ToString = "" Then
                Exit Sub

            End If

            Dim catID As String = dgvFEES.Item(4, ROWINDEX).Value
            Dim name As String = dgvFEES.Item(0, ROWINDEX).Value
            Dim description As String = dgvFEES.Item(5, ROWINDEX).Value

            If detailFeeSetup Is Nothing Then
                detailFeeSetup = New fmaFeesDetailListForm
                detailFeeSetup.txtCatID.Text = catID
                detailFeeSetup.txt_name.Text = name
                detailFeeSetup.txtDescr.Text = description

                detailFeeSetup.ShowDialog(Me)
            Else
                detailFeeSetup = Nothing
                detailFeeSetup = New fmaFeesDetailListForm
                detailFeeSetup.txtCatID.Text = catID
                detailFeeSetup.txt_name.Text = name
                detailFeeSetup.txtDescr.Text = description

                detailFeeSetup.ShowDialog(Me)
            End If

        End If
    End Sub

    'Private Sub dgvFEES_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles dgvFEES.CellContentClick
    '    ROWINDEX = e.ColumnIndex

    '    If e.ColumnIndex = 0 Then

    '        Dim colIndex As Integer = e.ColumnIndex
    '        Dim rowIndex As Integer = e.RowIndex

    '        Dim catID As String = dgvFEES.Item(4, rowIndex).Value
    '        Dim name As String = dgvFEES.Item(0, rowIndex).Value
    '        Dim description As String = dgvFEES.Item(5, rowIndex).Value


    '        If masterFeeSetup Is Nothing Then
    '            masterFeeSetup = New fmaFeesMasterSetupForm
    '            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
    '            masterFeeSetup.txtCatID.Text = catID
    '            masterFeeSetup.txt_name.Text = name
    '            masterFeeSetup.txtDescr.Text = description
    '            masterFeeSetup.btnSave.Text = "Modify"
    '            masterFeeSetup.btnDelete.Visible = True
    '            masterFeeSetup.ShowDialog(Me)
    '        Else
    '            masterFeeSetup = Nothing
    '            masterFeeSetup = New fmaFeesMasterSetupForm
    '            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
    '            masterFeeSetup.txtCatID.Text = catID
    '            masterFeeSetup.txt_name.Text = name
    '            masterFeeSetup.txtDescr.Text = description
    '            masterFeeSetup.btnSave.Text = "Modify"
    '            masterFeeSetup.btnDelete.Visible = True
    '            masterFeeSetup.ShowDialog(Me)
    '        End If

    '    End If

    'End Sub

    Private Sub dgvFEES_CellMouseClick(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles dgvFEES.CellMouseClick
        If e.Button = Windows.Forms.MouseButtons.Right Then
            ROWINDEX = e.RowIndex
            If e.ColumnIndex = 0 Then
                If dgvFEES.Item(0, ROWINDEX).Value.ToString = "" Then
                    Exit Sub

                End If

                Dim point1 As Point

                If e.Button = Windows.Forms.MouseButtons.Right Then

                    point1 = Windows.Forms.Cursor.Position

                    Dim pt As Point = dgvFEES.PointToClient(point1)
                    CMenuStripOperations.Show(dgvFEES, pt)
                End If
            End If

        End If
    End Sub


    Private Sub ViewAssessmentToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ViewAssessmentToolStripMenuItem.Click
        Dim catID As String = dgvFEES.Item(4, ROWINDEX).Value
        Dim name As String = dgvFEES.Item(0, ROWINDEX).Value
        Dim description As String = dgvFEES.Item(5, ROWINDEX).Value


        If masterFeeSetup Is Nothing Then
            masterFeeSetup = New fmaFeesMasterSetupForm
            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
            masterFeeSetup.txtCatID.Text = catID
            masterFeeSetup.txt_name.Text = name
            masterFeeSetup.txtDescr.Text = description
            masterFeeSetup.btnSave.Text = "Modify"
            masterFeeSetup.btnDelete.Visible = True
            masterFeeSetup.ShowDialog(Me)
        Else
            masterFeeSetup = Nothing
            masterFeeSetup = New fmaFeesMasterSetupForm
            masterFeeSetup.BATCH_ID = Me.txtBatchID.Text
            masterFeeSetup.txtCatID.Text = catID
            masterFeeSetup.txt_name.Text = name
            masterFeeSetup.txtDescr.Text = description
            masterFeeSetup.btnSave.Text = "Modify"
            masterFeeSetup.btnDelete.Visible = True
            masterFeeSetup.ShowDialog(Me)
        End If
    End Sub

    Private Sub StatementOfAccountToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StatementOfAccountToolStripMenuItem.Click
        Dim catID As String = dgvFEES.Item(4, ROWINDEX).Value
        Dim name As String = dgvFEES.Item(0, ROWINDEX).Value
        Dim description As String = dgvFEES.Item(5, ROWINDEX).Value

        If detailFeeSetup Is Nothing Then
            detailFeeSetup = New fmaFeesDetailListForm
            detailFeeSetup.txtCatID.Text = catID
            detailFeeSetup.txt_name.Text = name
            detailFeeSetup.txtDescr.Text = description

            detailFeeSetup.ShowDialog(Me)
        Else
            detailFeeSetup = Nothing
            detailFeeSetup = New fmaFeesDetailListForm
            detailFeeSetup.txtCatID.Text = catID
            detailFeeSetup.txt_name.Text = name
            detailFeeSetup.txtDescr.Text = description

            detailFeeSetup.ShowDialog(Me)
        End If
    End Sub

    Private Sub detailFeeSetup_WINCLOSING() Handles detailFeeSetup.WINCLOSING
        getMasterFees()
    End Sub

   
    Private Sub btnDuplicate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDuplicate.Click
        MsgBox("Function Under Modification.")
        If importFees Is Nothing Then
            importFees = New fmaFeesMasterDuplicate
            importFees.CatID = CatID
            importFees.BatchYear = Year
            importFees.txtThisBatchID.Text = Me.txtBatchID.Text
            importFees.txtThisCourseID.Text = Me.txtCourseID.Text
            importFees.txtCourse.Text = Me.cmbCourse.Text
            importFees.txtBatch.Text = Me.cmbBatch.Text
            importFees.Show()
        End If

    End Sub

    Private Sub importFees_FEES_ADDED() Handles importFees.FEES_ADDED
        getMasterFees()
    End Sub

    Private Sub importFees_FORM_CLOSING() Handles importFees.FORM_CLOSING
        importFees = Nothing
    End Sub

    Private Sub ButtonX1_Click(sender As Object, e As EventArgs) Handles ButtonX1.Click

        Dim dt As New DataTable
        dt = DataSource(String.Format("SELECT
                            finance_fee_categories.id AS cat_id,
                            finance_fee_particulars.id AS part_id
                            FROM
                            finance_fee_categories
                            INNER JOIN finance_fee_particulars ON finance_fee_categories.id = finance_fee_particulars.finance_fee_category_id
                            WHERE
                            finance_fee_categories.batch_id = '" & cmbBatch.SelectedValue & "'
                            "))


        If dt.Rows.Count > 0 Then

            For Each row As DataRow In dt.Rows

                Dim dtt As New DataTable
                dtt = DataSource(String.Format("SELECT
                                finance_fee_particulars.id
                                FROM
                                finance_fee_categories
                                INNER JOIN finance_fee_particulars ON finance_fee_categories.id = finance_fee_particulars.finance_fee_category_id
                                WHERE
                                finance_fee_categories.batch_id = '" & cmbBatch.SelectedValue & "' AND finance_fee_categories.id = '" & row.Item("cat_id") & "'
                                "))

                If dtt.Rows.Count > 0 Then

                    For Each rrow As DataRow In dtt.Rows
                        DataSource(String.Format("DELETE FROM finance_fee_particulars WHERE id = '" & rrow.Item("id") & "'"))
                    Next

                End If

                DataSource(String.Format("DELETE FROM finance_fee_categories WHERE id = '" & row.Item("cat_id") & "' "))


            Next

            MsgBox("All Fees with in this Batch has been reset...Go to Duplicate Batch Fees")

        End If

        dgvFEES.Rows.Clear()
        btnDuplicate.Visible = True
    End Sub
    Dim CatID As Integer
    Private Sub cmbCategory_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCategory.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbCategory.SelectedItem, DataRowView)
            CatID = drv.Item("id")
            displayCourse()
            cmbCourse.Enabled = True
        Catch ex As Exception

        End Try
    End Sub

    Private Sub cmbDefault_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbDefault.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbDefault.SelectedItem, DataRowView)
            txtBatchID.Text = drv.Item("id")
            getMasterFees()
        Catch ex As Exception

        End Try


    End Sub

    Dim Year As String = ""
    Private Sub cmbYear_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbYear.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbYear.SelectedItem, DataRowView)
            Year = drv.Item("name")
            displaySemester()
            cmbSemester.Enabled = True
        Catch ex As Exception

        End Try
    End Sub

    Private Sub displaySemester()

        Dim SQLEX As String = ""
        SQLEX = "SELECT DISTINCT 1 AS 'id',batches.semester 'name'"
        SQLEX += "FROM	batches "
        SQLEX += " WHERE	school_year IS NOT NULL"
        If Year <> "" Then
            SQLEX += " AND school_year = '" & Year & "'"
        End If
        SQLEX += "ORDER BY `name` ASC"

        cmbSemester.DataSource = DataSource(SQLEX)
        cmbSemester.ValueMember = "id"
        cmbSemester.DisplayMember = "name"
        cmbSemester.SelectedIndex = "-1"
    End Sub

    Dim Semester As String = ""
    Private Sub cmbSemester_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbSemester.SelectedIndexChanged
        Try
            Dim drv As DataRowView = DirectCast(cmbSemester.SelectedItem, DataRowView)
            Semester = drv.Item("name")
            displayBatches()
            cmbBatch.Enabled = True
        Catch ex As Exception

        End Try
    End Sub
End Class