<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmModify
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmModify))
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtRefundable = New System.Windows.Forms.TextBox()
        Me.cmbScholarship = New System.Windows.Forms.ComboBox()
        Me.txtGrandAmt = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.txtFullDedecution = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.cmbBatch = New System.Windows.Forms.ComboBox()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.Panel4 = New System.Windows.Forms.Panel()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.cmbBatch1 = New System.Windows.Forms.ComboBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.cmbCourse = New System.Windows.Forms.ComboBox()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.cmbYearLevel = New System.Windows.Forms.ComboBox()
        Me.TabPage5 = New System.Windows.Forms.TabPage()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.cmbSemester = New System.Windows.Forms.ComboBox()
        Me.TabPage6 = New System.Windows.Forms.TabPage()
        Me.txtAdmissionNo = New System.Windows.Forms.TextBox()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.btnSave = New DevExpress.XtraEditors.SimpleButton()
        Me.TabPage7 = New System.Windows.Forms.TabPage()
        Me.cmbLab = New System.Windows.Forms.ComboBox()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.nudAmount = New System.Windows.Forms.NumericUpDown()
        Me.btnadd = New DevExpress.XtraEditors.SimpleButton()
        Me.btnEdit = New DevExpress.XtraEditors.SimpleButton()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.Panel3.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        Me.Panel4.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        Me.TabPage5.SuspendLayout()
        Me.TabPage6.SuspendLayout()
        Me.Panel1.SuspendLayout()
        Me.TabPage7.SuspendLayout()
        CType(Me.nudAmount, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'TabControl1
        '
        Me.TabControl1.Appearance = System.Windows.Forms.TabAppearance.FlatButtons
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Controls.Add(Me.TabPage4)
        Me.TabControl1.Controls.Add(Me.TabPage5)
        Me.TabControl1.Controls.Add(Me.TabPage6)
        Me.TabControl1.Controls.Add(Me.TabPage7)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl1.Location = New System.Drawing.Point(0, 0)
        Me.TabControl1.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(391, 170)
        Me.TabControl1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.Color.PowderBlue
        Me.TabPage1.Controls.Add(Me.Panel2)
        Me.TabPage1.Location = New System.Drawing.Point(4, 25)
        Me.TabPage1.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage1.Size = New System.Drawing.Size(383, 141)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "SCHOLAR"
        '
        'Panel2
        '
        Me.Panel2.Controls.Add(Me.Label1)
        Me.Panel2.Controls.Add(Me.txtRefundable)
        Me.Panel2.Controls.Add(Me.cmbScholarship)
        Me.Panel2.Controls.Add(Me.txtGrandAmt)
        Me.Panel2.Controls.Add(Me.Label2)
        Me.Panel2.Controls.Add(Me.txtFullDedecution)
        Me.Panel2.Controls.Add(Me.Label3)
        Me.Panel2.Controls.Add(Me.Label4)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel2.Location = New System.Drawing.Point(2, 2)
        Me.Panel2.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(379, 137)
        Me.Panel2.TabIndex = 8
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(18, 11)
        Me.Label1.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(175, 17)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "SCHOLARSHIP GRANT"
        '
        'txtRefundable
        '
        Me.txtRefundable.Location = New System.Drawing.Point(189, 109)
        Me.txtRefundable.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.txtRefundable.Name = "txtRefundable"
        Me.txtRefundable.Size = New System.Drawing.Size(145, 20)
        Me.txtRefundable.TabIndex = 7
        '
        'cmbScholarship
        '
        Me.cmbScholarship.FormattingEnabled = True
        Me.cmbScholarship.Location = New System.Drawing.Point(17, 37)
        Me.cmbScholarship.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.cmbScholarship.Name = "cmbScholarship"
        Me.cmbScholarship.Size = New System.Drawing.Size(318, 21)
        Me.cmbScholarship.TabIndex = 0
        '
        'txtGrandAmt
        '
        Me.txtGrandAmt.Location = New System.Drawing.Point(189, 86)
        Me.txtGrandAmt.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.txtGrandAmt.Name = "txtGrandAmt"
        Me.txtGrandAmt.Size = New System.Drawing.Size(145, 20)
        Me.txtGrandAmt.TabIndex = 6
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(70, 64)
        Me.Label2.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(111, 15)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "FULL DEDUCTION"
        '
        'txtFullDedecution
        '
        Me.txtFullDedecution.Location = New System.Drawing.Point(189, 63)
        Me.txtFullDedecution.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.txtFullDedecution.Name = "txtFullDedecution"
        Me.txtFullDedecution.Size = New System.Drawing.Size(145, 20)
        Me.txtFullDedecution.TabIndex = 5
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(70, 84)
        Me.Label3.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(105, 15)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "GRAND AMOUNT"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(70, 106)
        Me.Label4.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(88, 15)
        Me.Label4.TabIndex = 4
        Me.Label4.Text = "REFUNDABLE"
        '
        'TabPage2
        '
        Me.TabPage2.BackColor = System.Drawing.Color.LightSkyBlue
        Me.TabPage2.Controls.Add(Me.Panel3)
        Me.TabPage2.Location = New System.Drawing.Point(4, 25)
        Me.TabPage2.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage2.Size = New System.Drawing.Size(383, 141)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "BATCH"
        '
        'Panel3
        '
        Me.Panel3.Controls.Add(Me.Label5)
        Me.Panel3.Controls.Add(Me.cmbBatch)
        Me.Panel3.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel3.Location = New System.Drawing.Point(2, 2)
        Me.Panel3.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Size = New System.Drawing.Size(379, 137)
        Me.Panel3.TabIndex = 4
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(14, 37)
        Me.Label5.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(137, 17)
        Me.Label5.TabIndex = 3
        Me.Label5.Text = "STUDENT BATCH"
        '
        'cmbBatch
        '
        Me.cmbBatch.FormattingEnabled = True
        Me.cmbBatch.Location = New System.Drawing.Point(14, 62)
        Me.cmbBatch.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.cmbBatch.Name = "cmbBatch"
        Me.cmbBatch.Size = New System.Drawing.Size(356, 21)
        Me.cmbBatch.TabIndex = 2
        '
        'TabPage3
        '
        Me.TabPage3.BackColor = System.Drawing.Color.Turquoise
        Me.TabPage3.Controls.Add(Me.Panel4)
        Me.TabPage3.Location = New System.Drawing.Point(4, 25)
        Me.TabPage3.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage3.Size = New System.Drawing.Size(383, 141)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "COURSE/GRADE"
        '
        'Panel4
        '
        Me.Panel4.Controls.Add(Me.Label7)
        Me.Panel4.Controls.Add(Me.cmbBatch1)
        Me.Panel4.Controls.Add(Me.Label6)
        Me.Panel4.Controls.Add(Me.cmbCourse)
        Me.Panel4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel4.Location = New System.Drawing.Point(2, 2)
        Me.Panel4.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.Panel4.Name = "Panel4"
        Me.Panel4.Size = New System.Drawing.Size(379, 137)
        Me.Panel4.TabIndex = 6
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(14, 62)
        Me.Label7.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(137, 17)
        Me.Label7.TabIndex = 7
        Me.Label7.Text = "STUDENT BATCH"
        '
        'cmbBatch1
        '
        Me.cmbBatch1.FormattingEnabled = True
        Me.cmbBatch1.Location = New System.Drawing.Point(13, 87)
        Me.cmbBatch1.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.cmbBatch1.Name = "cmbBatch1"
        Me.cmbBatch1.Size = New System.Drawing.Size(356, 21)
        Me.cmbBatch1.TabIndex = 6
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(9, 11)
        Me.Label6.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(219, 17)
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "STUDENT COURSE / GRADE"
        '
        'cmbCourse
        '
        Me.cmbCourse.FormattingEnabled = True
        Me.cmbCourse.Location = New System.Drawing.Point(12, 36)
        Me.cmbCourse.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.cmbCourse.Name = "cmbCourse"
        Me.cmbCourse.Size = New System.Drawing.Size(354, 21)
        Me.cmbCourse.TabIndex = 4
        '
        'TabPage4
        '
        Me.TabPage4.BackColor = System.Drawing.Color.PaleTurquoise
        Me.TabPage4.Controls.Add(Me.Label8)
        Me.TabPage4.Controls.Add(Me.cmbYearLevel)
        Me.TabPage4.Location = New System.Drawing.Point(4, 25)
        Me.TabPage4.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Padding = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage4.Size = New System.Drawing.Size(383, 141)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "YEAR LEVEL"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.Location = New System.Drawing.Point(14, 33)
        Me.Label8.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(191, 17)
        Me.Label8.TabIndex = 7
        Me.Label8.Text = "ADMISSION YEAR LEVEL"
        '
        'cmbYearLevel
        '
        Me.cmbYearLevel.FormattingEnabled = True
        Me.cmbYearLevel.Location = New System.Drawing.Point(13, 58)
        Me.cmbYearLevel.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.cmbYearLevel.Name = "cmbYearLevel"
        Me.cmbYearLevel.Size = New System.Drawing.Size(354, 21)
        Me.cmbYearLevel.TabIndex = 6
        '
        'TabPage5
        '
        Me.TabPage5.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.TabPage5.Controls.Add(Me.Label9)
        Me.TabPage5.Controls.Add(Me.cmbSemester)
        Me.TabPage5.Location = New System.Drawing.Point(4, 25)
        Me.TabPage5.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage5.Name = "TabPage5"
        Me.TabPage5.Padding = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage5.Size = New System.Drawing.Size(383, 141)
        Me.TabPage5.TabIndex = 4
        Me.TabPage5.Text = "SEMESTER"
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label9.Location = New System.Drawing.Point(20, 34)
        Me.Label9.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(180, 17)
        Me.Label9.TabIndex = 9
        Me.Label9.Text = "ADMISSION SEMESTER"
        '
        'cmbSemester
        '
        Me.cmbSemester.FormattingEnabled = True
        Me.cmbSemester.Items.AddRange(New Object() {"1ST SEMESTER", "2ND SEMESTER", "SUMMER", "YEARLY"})
        Me.cmbSemester.Location = New System.Drawing.Point(20, 59)
        Me.cmbSemester.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.cmbSemester.Name = "cmbSemester"
        Me.cmbSemester.Size = New System.Drawing.Size(354, 21)
        Me.cmbSemester.TabIndex = 8
        '
        'TabPage6
        '
        Me.TabPage6.BackColor = System.Drawing.Color.DarkSeaGreen
        Me.TabPage6.Controls.Add(Me.txtAdmissionNo)
        Me.TabPage6.Controls.Add(Me.Label10)
        Me.TabPage6.Location = New System.Drawing.Point(4, 25)
        Me.TabPage6.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage6.Name = "TabPage6"
        Me.TabPage6.Padding = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.TabPage6.Size = New System.Drawing.Size(383, 141)
        Me.TabPage6.TabIndex = 5
        Me.TabPage6.Text = "ADMISSION MUMBER"
        '
        'txtAdmissionNo
        '
        Me.txtAdmissionNo.Font = New System.Drawing.Font("Wide Latin", 16.2!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtAdmissionNo.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.txtAdmissionNo.Location = New System.Drawing.Point(6, 67)
        Me.txtAdmissionNo.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.txtAdmissionNo.Multiline = True
        Me.txtAdmissionNo.Name = "txtAdmissionNo"
        Me.txtAdmissionNo.Size = New System.Drawing.Size(365, 36)
        Me.txtAdmissionNo.TabIndex = 11
        Me.txtAdmissionNo.Text = "220718000500"
        Me.txtAdmissionNo.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label10.Location = New System.Drawing.Point(115, 35)
        Me.Label10.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(190, 20)
        Me.Label10.TabIndex = 10
        Me.Label10.Text = "ADMISSION NUMBER"
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.MediumAquamarine
        Me.Panel1.Controls.Add(Me.btnSave)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 170)
        Me.Panel1.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(391, 50)
        Me.Panel1.TabIndex = 1
        '
        'btnSave
        '
        Me.btnSave.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.btnSave.DialogResult = System.Windows.Forms.DialogResult.OK
        Me.btnSave.ImageOptions.Image = CType(resources.GetObject("btnSave.ImageOptions.Image"), System.Drawing.Image)
        Me.btnSave.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter
        Me.btnSave.Location = New System.Drawing.Point(275, 11)
        Me.btnSave.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Size = New System.Drawing.Size(98, 30)
        Me.btnSave.TabIndex = 0
        Me.btnSave.Text = "Save"
        '
        'TabPage7
        '
        Me.TabPage7.BackColor = System.Drawing.Color.Azure
        Me.TabPage7.Controls.Add(Me.btnEdit)
        Me.TabPage7.Controls.Add(Me.btnadd)
        Me.TabPage7.Controls.Add(Me.nudAmount)
        Me.TabPage7.Controls.Add(Me.Label12)
        Me.TabPage7.Controls.Add(Me.Label11)
        Me.TabPage7.Controls.Add(Me.cmbLab)
        Me.TabPage7.Location = New System.Drawing.Point(4, 25)
        Me.TabPage7.Name = "TabPage7"
        Me.TabPage7.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage7.Size = New System.Drawing.Size(383, 141)
        Me.TabPage7.TabIndex = 6
        Me.TabPage7.Text = "LABORATORY SETUP"
        '
        'cmbLab
        '
        Me.cmbLab.Enabled = False
        Me.cmbLab.FormattingEnabled = True
        Me.cmbLab.Location = New System.Drawing.Point(21, 65)
        Me.cmbLab.Name = "cmbLab"
        Me.cmbLab.Size = New System.Drawing.Size(322, 21)
        Me.cmbLab.TabIndex = 0
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label11.Location = New System.Drawing.Point(20, 41)
        Me.Label11.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(161, 17)
        Me.Label11.TabIndex = 10
        Me.Label11.Text = "LABORATORY NAME"
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label12.Location = New System.Drawing.Point(94, 102)
        Me.Label12.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(74, 17)
        Me.Label12.TabIndex = 11
        Me.Label12.Text = "AMOUNT"
        '
        'nudAmount
        '
        Me.nudAmount.DecimalPlaces = 2
        Me.nudAmount.Enabled = False
        Me.nudAmount.Location = New System.Drawing.Point(174, 100)
        Me.nudAmount.Maximum = New Decimal(New Integer() {9999999, 0, 0, 0})
        Me.nudAmount.Name = "nudAmount"
        Me.nudAmount.Size = New System.Drawing.Size(169, 20)
        Me.nudAmount.TabIndex = 12
        Me.nudAmount.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'btnadd
        '
        Me.btnadd.ImageOptions.Image = CType(resources.GetObject("btnadd.ImageOptions.Image"), System.Drawing.Image)
        Me.btnadd.Location = New System.Drawing.Point(209, 37)
        Me.btnadd.Name = "btnadd"
        Me.btnadd.Size = New System.Drawing.Size(60, 23)
        Me.btnadd.TabIndex = 13
        Me.btnadd.Text = "Add"
        '
        'btnEdit
        '
        Me.btnEdit.ImageOptions.Image = CType(resources.GetObject("SimpleButton2.ImageOptions.Image"), System.Drawing.Image)
        Me.btnEdit.Location = New System.Drawing.Point(280, 36)
        Me.btnEdit.Name = "btnEdit"
        Me.btnEdit.Size = New System.Drawing.Size(60, 23)
        Me.btnEdit.TabIndex = 14
        Me.btnEdit.Text = "Edit"
        '
        'frmModify
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(391, 220)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.Panel1)
        Me.Margin = New System.Windows.Forms.Padding(2, 2, 2, 2)
        Me.Name = "frmModify"
        Me.ShowIcon = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Modify"
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.Panel3.ResumeLayout(False)
        Me.Panel3.PerformLayout()
        Me.TabPage3.ResumeLayout(False)
        Me.Panel4.ResumeLayout(False)
        Me.Panel4.PerformLayout()
        Me.TabPage4.ResumeLayout(False)
        Me.TabPage4.PerformLayout()
        Me.TabPage5.ResumeLayout(False)
        Me.TabPage5.PerformLayout()
        Me.TabPage6.ResumeLayout(False)
        Me.TabPage6.PerformLayout()
        Me.Panel1.ResumeLayout(False)
        Me.TabPage7.ResumeLayout(False)
        Me.TabPage7.PerformLayout()
        CType(Me.nudAmount, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents TabControl1 As TabControl
    Friend WithEvents TabPage1 As TabPage
    Friend WithEvents TabPage2 As TabPage
    Friend WithEvents Panel1 As Panel
    Friend WithEvents btnSave As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents Label1 As Label
    Friend WithEvents cmbScholarship As ComboBox
    Friend WithEvents txtRefundable As TextBox
    Friend WithEvents txtGrandAmt As TextBox
    Friend WithEvents txtFullDedecution As TextBox
    Friend WithEvents Label4 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label5 As Label
    Friend WithEvents cmbBatch As ComboBox
    Friend WithEvents TabPage3 As TabPage
    Friend WithEvents Label6 As Label
    Friend WithEvents cmbCourse As ComboBox
    Friend WithEvents Panel2 As Panel
    Friend WithEvents Panel3 As Panel
    Friend WithEvents Panel4 As Panel
    Friend WithEvents Label7 As Label
    Friend WithEvents cmbBatch1 As ComboBox
    Friend WithEvents TabPage4 As TabPage
    Friend WithEvents Label8 As Label
    Friend WithEvents cmbYearLevel As ComboBox
    Friend WithEvents TabPage5 As TabPage
    Friend WithEvents Label9 As Label
    Friend WithEvents cmbSemester As ComboBox
    Friend WithEvents TabPage6 As TabPage
    Friend WithEvents txtAdmissionNo As TextBox
    Friend WithEvents Label10 As Label
    Friend WithEvents TabPage7 As TabPage
    Friend WithEvents Label12 As Label
    Friend WithEvents Label11 As Label
    Friend WithEvents cmbLab As ComboBox
    Friend WithEvents nudAmount As NumericUpDown
    Friend WithEvents btnEdit As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents btnadd As DevExpress.XtraEditors.SimpleButton
End Class
