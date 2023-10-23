<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmStudentAdmissionEntry
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmStudentAdmissionEntry))
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.btnCancel = New DevExpress.XtraEditors.SimpleButton()
        Me.btnSave = New DevExpress.XtraEditors.SimpleButton()
        Me.gcStudentProfile = New DevExpress.XtraEditors.GroupControl()
        Me.txtAge = New DevExpress.XtraEditors.TextEdit()
        Me.dtpDateBirth = New System.Windows.Forms.DateTimePicker()
        Me.LabelX22 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX19 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX20 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX21 = New DevComponents.DotNetBar.LabelX()
        Me.txtCurrentAddress = New DevExpress.XtraEditors.TextEdit()
        Me.txtContactNumber = New DevExpress.XtraEditors.TextEdit()
        Me.txtMName = New DevExpress.XtraEditors.TextEdit()
        Me.LabelX18 = New DevComponents.DotNetBar.LabelX()
        Me.txtFName = New DevExpress.XtraEditors.TextEdit()
        Me.txtLName = New DevExpress.XtraEditors.TextEdit()
        Me.LabelX16 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX17 = New DevComponents.DotNetBar.LabelX()
        Me.gcAdmissionDetails = New DevExpress.XtraEditors.GroupControl()
        Me.rdbReEntry = New System.Windows.Forms.RadioButton()
        Me.GroupControl4 = New DevExpress.XtraEditors.GroupControl()
        Me.LabelX24 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX23 = New DevComponents.DotNetBar.LabelX()
        Me.cmbStrand = New System.Windows.Forms.ComboBox()
        Me.cmbTrack = New System.Windows.Forms.ComboBox()
        Me.chkManulStdNum = New DevExpress.XtraEditors.CheckEdit()
        Me.GroupControl8 = New DevExpress.XtraEditors.GroupControl()
        Me.LabelX25 = New DevComponents.DotNetBar.LabelX()
        Me.txtIsFullDeduct = New DevExpress.XtraEditors.TextEdit()
        Me.txtGrant = New System.Windows.Forms.ComboBox()
        Me.txtIDNum = New DevExpress.XtraEditors.TextEdit()
        Me.txtAdmNum = New DevExpress.XtraEditors.TextEdit()
        Me.dtpAdmDate = New System.Windows.Forms.DateTimePicker()
        Me.LabelX12 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX13 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX14 = New DevComponents.DotNetBar.LabelX()
        Me.gcClassification = New DevExpress.XtraEditors.GroupControl()
        Me.LabelX15 = New DevComponents.DotNetBar.LabelX()
        Me.cxbxGrant = New DevExpress.XtraEditors.CheckEdit()
        Me.cmbCourseGrade = New System.Windows.Forms.ComboBox()
        Me.cmbBatchYear = New System.Windows.Forms.ComboBox()
        Me.cmbBatch = New System.Windows.Forms.ComboBox()
        Me.cmbYearLevel = New System.Windows.Forms.ComboBox()
        Me.cmbStatus = New System.Windows.Forms.ComboBox()
        Me.cmbStature = New System.Windows.Forms.ComboBox()
        Me.cmbCategory = New System.Windows.Forms.ComboBox()
        Me.LabelX7 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX10 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX11 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX5 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX6 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX2 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX3 = New DevComponents.DotNetBar.LabelX()
        Me.gcAccountStatus = New DevExpress.XtraEditors.GroupControl()
        Me.txtRemainingPayments = New DevExpress.XtraEditors.TextEdit()
        Me.txtRemainingBalance = New DevExpress.XtraEditors.TextEdit()
        Me.LabelX8 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX9 = New DevComponents.DotNetBar.LabelX()
        Me.chkBBal = New DevExpress.XtraEditors.CheckEdit()
        Me.gcEnrollmentStatus = New DevExpress.XtraEditors.GroupControl()
        Me.btnOld = New DevExpress.XtraEditors.SimpleButton()
        Me.btnNew = New DevExpress.XtraEditors.SimpleButton()
        Me.GroupControl1 = New DevExpress.XtraEditors.GroupControl()
        Me.GroupControl3 = New DevExpress.XtraEditors.GroupControl()
        Me.cmbSemester = New DevExpress.XtraEditors.ComboBoxEdit()
        Me.GroupControl2 = New DevExpress.XtraEditors.GroupControl()
        Me.cmbYearFrom = New DevExpress.XtraEditors.ComboBoxEdit()
        Me.cmbYearTo = New DevExpress.XtraEditors.ComboBoxEdit()
        Me.LabelX4 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.PanelControl1 = New DevExpress.XtraEditors.PanelControl()
        Me.LabelControl1 = New DevExpress.XtraEditors.LabelControl()
        Me.gcPicture = New DevExpress.XtraEditors.GroupControl()
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.pbxphoto = New System.Windows.Forms.PictureBox()
        Me.Panel4 = New System.Windows.Forms.Panel()
        Me.txtPhotoFileName = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.ButtonBrowsePic = New System.Windows.Forms.Button()
        Me.Panel1.SuspendLayout()
        CType(Me.gcStudentProfile, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gcStudentProfile.SuspendLayout()
        CType(Me.txtAge.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtCurrentAddress.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtContactNumber.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtMName.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtFName.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtLName.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.gcAdmissionDetails, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gcAdmissionDetails.SuspendLayout()
        CType(Me.GroupControl4, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl4.SuspendLayout()
        CType(Me.chkManulStdNum.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GroupControl8, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl8.SuspendLayout()
        CType(Me.txtIsFullDeduct.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtIDNum.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtAdmNum.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.gcClassification, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gcClassification.SuspendLayout()
        CType(Me.cxbxGrant.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.gcAccountStatus, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gcAccountStatus.SuspendLayout()
        CType(Me.txtRemainingPayments.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtRemainingBalance.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.chkBBal.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.gcEnrollmentStatus, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gcEnrollmentStatus.SuspendLayout()
        CType(Me.GroupControl1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl1.SuspendLayout()
        CType(Me.GroupControl3, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl3.SuspendLayout()
        CType(Me.cmbSemester.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GroupControl2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl2.SuspendLayout()
        CType(Me.cmbYearFrom.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.cmbYearTo.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PanelControl1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.PanelControl1.SuspendLayout()
        CType(Me.gcPicture, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.gcPicture.SuspendLayout()
        Me.Panel3.SuspendLayout()
        CType(Me.pbxphoto, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel4.SuspendLayout()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.Panel1.Controls.Add(Me.btnCancel)
        Me.Panel1.Controls.Add(Me.btnSave)
        Me.Panel1.Controls.Add(Me.gcStudentProfile)
        Me.Panel1.Controls.Add(Me.gcAdmissionDetails)
        Me.Panel1.Controls.Add(Me.gcClassification)
        Me.Panel1.Controls.Add(Me.gcAccountStatus)
        Me.Panel1.Controls.Add(Me.gcEnrollmentStatus)
        Me.Panel1.Controls.Add(Me.GroupControl1)
        Me.Panel1.Controls.Add(Me.PanelControl1)
        Me.Panel1.Controls.Add(Me.gcPicture)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(887, 710)
        Me.Panel1.TabIndex = 0
        '
        'btnCancel
        '
        Me.btnCancel.AppearanceHovered.BackColor = System.Drawing.Color.DarkGray
        Me.btnCancel.AppearanceHovered.Options.UseBackColor = True
        Me.btnCancel.AppearancePressed.BackColor = System.Drawing.Color.DarkGray
        Me.btnCancel.AppearancePressed.Options.UseBackColor = True
        Me.btnCancel.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.btnCancel.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.cancel_32x32
        Me.btnCancel.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter
        Me.btnCancel.Location = New System.Drawing.Point(721, 664)
        Me.btnCancel.Name = "btnCancel"
        Me.btnCancel.Size = New System.Drawing.Size(157, 39)
        Me.btnCancel.TabIndex = 124
        Me.btnCancel.Text = "&EXIT"
        '
        'btnSave
        '
        Me.btnSave.AppearanceHovered.BackColor = System.Drawing.Color.DarkGray
        Me.btnSave.AppearanceHovered.Options.UseBackColor = True
        Me.btnSave.AppearancePressed.BackColor = System.Drawing.Color.DarkGray
        Me.btnSave.AppearancePressed.Options.UseBackColor = True
        Me.btnSave.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.btnSave.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.saveto_32x32
        Me.btnSave.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter
        Me.btnSave.Location = New System.Drawing.Point(554, 665)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Size = New System.Drawing.Size(157, 39)
        Me.btnSave.TabIndex = 123
        Me.btnSave.Text = "&SAVE"
        '
        'gcStudentProfile
        '
        Me.gcStudentProfile.Appearance.BackColor = System.Drawing.Color.DarkGray
        Me.gcStudentProfile.Appearance.BackColor2 = System.Drawing.Color.Silver
        Me.gcStudentProfile.Appearance.BorderColor = System.Drawing.Color.DimGray
        Me.gcStudentProfile.Appearance.Options.UseBackColor = True
        Me.gcStudentProfile.Appearance.Options.UseBorderColor = True
        Me.gcStudentProfile.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.gcStudentProfile.Controls.Add(Me.txtAge)
        Me.gcStudentProfile.Controls.Add(Me.dtpDateBirth)
        Me.gcStudentProfile.Controls.Add(Me.LabelX22)
        Me.gcStudentProfile.Controls.Add(Me.LabelX19)
        Me.gcStudentProfile.Controls.Add(Me.LabelX20)
        Me.gcStudentProfile.Controls.Add(Me.LabelX21)
        Me.gcStudentProfile.Controls.Add(Me.txtCurrentAddress)
        Me.gcStudentProfile.Controls.Add(Me.txtContactNumber)
        Me.gcStudentProfile.Controls.Add(Me.txtMName)
        Me.gcStudentProfile.Controls.Add(Me.LabelX18)
        Me.gcStudentProfile.Controls.Add(Me.txtFName)
        Me.gcStudentProfile.Controls.Add(Me.txtLName)
        Me.gcStudentProfile.Controls.Add(Me.LabelX16)
        Me.gcStudentProfile.Controls.Add(Me.LabelX17)
        Me.gcStudentProfile.GroupStyle = DevExpress.Utils.GroupStyle.Card
        Me.gcStudentProfile.Location = New System.Drawing.Point(7, 535)
        Me.gcStudentProfile.Name = "gcStudentProfile"
        Me.gcStudentProfile.Size = New System.Drawing.Size(872, 125)
        Me.gcStudentProfile.TabIndex = 122
        Me.gcStudentProfile.Text = "STUDENT PROFILE"
        '
        'txtAge
        '
        Me.txtAge.Location = New System.Drawing.Point(763, 35)
        Me.txtAge.Name = "txtAge"
        Me.txtAge.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtAge.Size = New System.Drawing.Size(90, 22)
        Me.txtAge.TabIndex = 208
        '
        'dtpDateBirth
        '
        Me.dtpDateBirth.CalendarFont = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpDateBirth.CalendarForeColor = System.Drawing.SystemColors.HotTrack
        Me.dtpDateBirth.CustomFormat = "yyyy-MM-dd"
        Me.dtpDateBirth.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpDateBirth.Location = New System.Drawing.Point(572, 37)
        Me.dtpDateBirth.Name = "dtpDateBirth"
        Me.dtpDateBirth.Size = New System.Drawing.Size(160, 21)
        Me.dtpDateBirth.TabIndex = 207
        '
        'LabelX22
        '
        Me.LabelX22.AutoSize = True
        Me.LabelX22.BackColor = System.Drawing.Color.Transparent
        Me.LabelX22.Location = New System.Drawing.Point(736, 38)
        Me.LabelX22.Name = "LabelX22"
        Me.LabelX22.Size = New System.Drawing.Size(23, 16)
        Me.LabelX22.TabIndex = 206
        Me.LabelX22.Text = "AGE"
        '
        'LabelX19
        '
        Me.LabelX19.AutoSize = True
        Me.LabelX19.BackColor = System.Drawing.Color.Transparent
        Me.LabelX19.Location = New System.Drawing.Point(445, 38)
        Me.LabelX19.Name = "LabelX19"
        Me.LabelX19.Size = New System.Drawing.Size(81, 16)
        Me.LabelX19.TabIndex = 205
        Me.LabelX19.Text = "DATE OF BIRTH"
        '
        'LabelX20
        '
        Me.LabelX20.AutoSize = True
        Me.LabelX20.BackColor = System.Drawing.Color.Transparent
        Me.LabelX20.Location = New System.Drawing.Point(445, 93)
        Me.LabelX20.Name = "LabelX20"
        Me.LabelX20.Size = New System.Drawing.Size(100, 16)
        Me.LabelX20.TabIndex = 204
        Me.LabelX20.Text = "CURRENT ADDRESS"
        '
        'LabelX21
        '
        Me.LabelX21.AutoSize = True
        Me.LabelX21.BackColor = System.Drawing.Color.Transparent
        Me.LabelX21.Location = New System.Drawing.Point(445, 67)
        Me.LabelX21.Name = "LabelX21"
        Me.LabelX21.Size = New System.Drawing.Size(96, 16)
        Me.LabelX21.TabIndex = 203
        Me.LabelX21.Text = "CONTACT NUMBER"
        '
        'txtCurrentAddress
        '
        Me.txtCurrentAddress.Location = New System.Drawing.Point(571, 92)
        Me.txtCurrentAddress.Name = "txtCurrentAddress"
        Me.txtCurrentAddress.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtCurrentAddress.Size = New System.Drawing.Size(282, 22)
        Me.txtCurrentAddress.TabIndex = 41
        '
        'txtContactNumber
        '
        Me.txtContactNumber.Location = New System.Drawing.Point(571, 64)
        Me.txtContactNumber.Name = "txtContactNumber"
        Me.txtContactNumber.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtContactNumber.Size = New System.Drawing.Size(282, 22)
        Me.txtContactNumber.TabIndex = 39
        '
        'txtMName
        '
        Me.txtMName.Location = New System.Drawing.Point(139, 90)
        Me.txtMName.Name = "txtMName"
        Me.txtMName.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtMName.Size = New System.Drawing.Size(288, 22)
        Me.txtMName.TabIndex = 37
        '
        'LabelX18
        '
        Me.LabelX18.AutoSize = True
        Me.LabelX18.BackColor = System.Drawing.Color.Transparent
        Me.LabelX18.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX18.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX18.Location = New System.Drawing.Point(15, 94)
        Me.LabelX18.Name = "LabelX18"
        Me.LabelX18.Size = New System.Drawing.Size(74, 16)
        Me.LabelX18.TabIndex = 36
        Me.LabelX18.Text = "MIDDLE NAME"
        '
        'txtFName
        '
        Me.txtFName.Location = New System.Drawing.Point(139, 62)
        Me.txtFName.Name = "txtFName"
        Me.txtFName.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtFName.Size = New System.Drawing.Size(288, 22)
        Me.txtFName.TabIndex = 35
        '
        'txtLName
        '
        Me.txtLName.Location = New System.Drawing.Point(139, 32)
        Me.txtLName.Name = "txtLName"
        Me.txtLName.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtLName.Size = New System.Drawing.Size(288, 22)
        Me.txtLName.TabIndex = 34
        '
        'LabelX16
        '
        Me.LabelX16.AutoSize = True
        Me.LabelX16.BackColor = System.Drawing.Color.Transparent
        Me.LabelX16.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX16.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX16.Location = New System.Drawing.Point(15, 66)
        Me.LabelX16.Name = "LabelX16"
        Me.LabelX16.Size = New System.Drawing.Size(64, 16)
        Me.LabelX16.TabIndex = 33
        Me.LabelX16.Text = "FIRST NAME"
        '
        'LabelX17
        '
        Me.LabelX17.AutoSize = True
        Me.LabelX17.BackColor = System.Drawing.Color.Transparent
        Me.LabelX17.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX17.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX17.Location = New System.Drawing.Point(14, 37)
        Me.LabelX17.Name = "LabelX17"
        Me.LabelX17.Size = New System.Drawing.Size(59, 16)
        Me.LabelX17.TabIndex = 32
        Me.LabelX17.Text = "LAST NAME"
        '
        'gcAdmissionDetails
        '
        Me.gcAdmissionDetails.Appearance.BackColor = System.Drawing.Color.DarkGray
        Me.gcAdmissionDetails.Appearance.BackColor2 = System.Drawing.Color.Silver
        Me.gcAdmissionDetails.Appearance.BorderColor = System.Drawing.Color.DimGray
        Me.gcAdmissionDetails.Appearance.Options.UseBackColor = True
        Me.gcAdmissionDetails.Appearance.Options.UseBorderColor = True
        Me.gcAdmissionDetails.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.gcAdmissionDetails.Controls.Add(Me.rdbReEntry)
        Me.gcAdmissionDetails.Controls.Add(Me.GroupControl4)
        Me.gcAdmissionDetails.Controls.Add(Me.chkManulStdNum)
        Me.gcAdmissionDetails.Controls.Add(Me.GroupControl8)
        Me.gcAdmissionDetails.Controls.Add(Me.txtIDNum)
        Me.gcAdmissionDetails.Controls.Add(Me.txtAdmNum)
        Me.gcAdmissionDetails.Controls.Add(Me.dtpAdmDate)
        Me.gcAdmissionDetails.Controls.Add(Me.LabelX12)
        Me.gcAdmissionDetails.Controls.Add(Me.LabelX13)
        Me.gcAdmissionDetails.Controls.Add(Me.LabelX14)
        Me.gcAdmissionDetails.GroupStyle = DevExpress.Utils.GroupStyle.Card
        Me.gcAdmissionDetails.Location = New System.Drawing.Point(7, 398)
        Me.gcAdmissionDetails.Name = "gcAdmissionDetails"
        Me.gcAdmissionDetails.Size = New System.Drawing.Size(872, 133)
        Me.gcAdmissionDetails.TabIndex = 33
        Me.gcAdmissionDetails.Text = "ADMISSION DETAILS"
        '
        'rdbReEntry
        '
        Me.rdbReEntry.AutoSize = True
        Me.rdbReEntry.BackColor = System.Drawing.Color.Transparent
        Me.rdbReEntry.CheckAlign = System.Drawing.ContentAlignment.TopLeft
        Me.rdbReEntry.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.rdbReEntry.Location = New System.Drawing.Point(145, 26)
        Me.rdbReEntry.Margin = New System.Windows.Forms.Padding(2)
        Me.rdbReEntry.Name = "rdbReEntry"
        Me.rdbReEntry.Size = New System.Drawing.Size(109, 17)
        Me.rdbReEntry.TabIndex = 123
        Me.rdbReEntry.TabStop = True
        Me.rdbReEntry.Text = "Re-Entry Student"
        Me.rdbReEntry.UseVisualStyleBackColor = False
        '
        'GroupControl4
        '
        Me.GroupControl4.AppearanceCaption.BackColor = System.Drawing.Color.Transparent
        Me.GroupControl4.AppearanceCaption.BackColor2 = System.Drawing.Color.White
        Me.GroupControl4.AppearanceCaption.BorderColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.GroupControl4.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl4.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl4.Controls.Add(Me.LabelX24)
        Me.GroupControl4.Controls.Add(Me.LabelX23)
        Me.GroupControl4.Controls.Add(Me.cmbStrand)
        Me.GroupControl4.Controls.Add(Me.cmbTrack)
        Me.GroupControl4.Enabled = False
        Me.GroupControl4.GroupStyle = DevExpress.Utils.GroupStyle.Light
        Me.GroupControl4.Location = New System.Drawing.Point(571, 25)
        Me.GroupControl4.Name = "GroupControl4"
        Me.GroupControl4.Size = New System.Drawing.Size(286, 96)
        Me.GroupControl4.TabIndex = 122
        Me.GroupControl4.Text = "SENIOR "
        '
        'LabelX24
        '
        Me.LabelX24.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.LabelX24.AutoSize = True
        Me.LabelX24.BackColor = System.Drawing.Color.Transparent
        Me.LabelX24.Location = New System.Drawing.Point(12, 62)
        Me.LabelX24.Name = "LabelX24"
        Me.LabelX24.Size = New System.Drawing.Size(43, 16)
        Me.LabelX24.TabIndex = 116
        Me.LabelX24.Text = "STRAND"
        '
        'LabelX23
        '
        Me.LabelX23.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.LabelX23.AutoSize = True
        Me.LabelX23.BackColor = System.Drawing.Color.Transparent
        Me.LabelX23.Location = New System.Drawing.Point(12, 35)
        Me.LabelX23.Name = "LabelX23"
        Me.LabelX23.Size = New System.Drawing.Size(35, 16)
        Me.LabelX23.TabIndex = 115
        Me.LabelX23.Text = "TRACK"
        '
        'cmbStrand
        '
        Me.cmbStrand.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmbStrand.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbStrand.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbStrand.FormattingEnabled = True
        Me.cmbStrand.Items.AddRange(New Object() {"HUMSS", "ABM", "STEM", "TVL"})
        Me.cmbStrand.Location = New System.Drawing.Point(69, 60)
        Me.cmbStrand.Name = "cmbStrand"
        Me.cmbStrand.Size = New System.Drawing.Size(206, 21)
        Me.cmbStrand.TabIndex = 43
        '
        'cmbTrack
        '
        Me.cmbTrack.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmbTrack.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbTrack.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbTrack.FormattingEnabled = True
        Me.cmbTrack.Items.AddRange(New Object() {"ACADEMIC", "ICT"})
        Me.cmbTrack.Location = New System.Drawing.Point(69, 32)
        Me.cmbTrack.Name = "cmbTrack"
        Me.cmbTrack.Size = New System.Drawing.Size(206, 21)
        Me.cmbTrack.TabIndex = 42
        '
        'chkManulStdNum
        '
        Me.chkManulStdNum.EditValue = Nothing
        Me.chkManulStdNum.Location = New System.Drawing.Point(334, 100)
        Me.chkManulStdNum.Name = "chkManulStdNum"
        Me.chkManulStdNum.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.chkManulStdNum.Properties.Caption = ""
        Me.chkManulStdNum.Size = New System.Drawing.Size(21, 23)
        Me.chkManulStdNum.TabIndex = 120
        '
        'GroupControl8
        '
        Me.GroupControl8.AppearanceCaption.BackColor = System.Drawing.Color.Transparent
        Me.GroupControl8.AppearanceCaption.BackColor2 = System.Drawing.Color.White
        Me.GroupControl8.AppearanceCaption.BorderColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.GroupControl8.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl8.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl8.Controls.Add(Me.LabelX25)
        Me.GroupControl8.Controls.Add(Me.txtIsFullDeduct)
        Me.GroupControl8.Controls.Add(Me.txtGrant)
        Me.GroupControl8.GroupStyle = DevExpress.Utils.GroupStyle.Light
        Me.GroupControl8.Location = New System.Drawing.Point(366, 27)
        Me.GroupControl8.Name = "GroupControl8"
        Me.GroupControl8.Size = New System.Drawing.Size(197, 96)
        Me.GroupControl8.TabIndex = 119
        Me.GroupControl8.Text = "SCHOLARSHIP PROGRAM"
        '
        'LabelX25
        '
        Me.LabelX25.AutoSize = True
        Me.LabelX25.BackColor = System.Drawing.Color.Transparent
        Me.LabelX25.Location = New System.Drawing.Point(18, 61)
        Me.LabelX25.Name = "LabelX25"
        Me.LabelX25.Size = New System.Drawing.Size(90, 16)
        Me.LabelX25.TabIndex = 123
        Me.LabelX25.Text = "FULL DEDUCTION"
        '
        'txtIsFullDeduct
        '
        Me.txtIsFullDeduct.Location = New System.Drawing.Point(113, 58)
        Me.txtIsFullDeduct.Name = "txtIsFullDeduct"
        Me.txtIsFullDeduct.Properties.Appearance.ForeColor = System.Drawing.Color.Red
        Me.txtIsFullDeduct.Properties.Appearance.Options.UseForeColor = True
        Me.txtIsFullDeduct.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtIsFullDeduct.Size = New System.Drawing.Size(75, 22)
        Me.txtIsFullDeduct.TabIndex = 122
        '
        'txtGrant
        '
        Me.txtGrant.DropDownWidth = 200
        Me.txtGrant.FormattingEnabled = True
        Me.txtGrant.Items.AddRange(New Object() {"Transfered from Public School", "Transferred from Private School", "Grade School Graduate", "Senior High School Graduate", "ALS Passer"})
        Me.txtGrant.Location = New System.Drawing.Point(13, 32)
        Me.txtGrant.Name = "txtGrant"
        Me.txtGrant.Size = New System.Drawing.Size(180, 21)
        Me.txtGrant.TabIndex = 41
        '
        'txtIDNum
        '
        Me.txtIDNum.Enabled = False
        Me.txtIDNum.Location = New System.Drawing.Point(143, 102)
        Me.txtIDNum.Name = "txtIDNum"
        Me.txtIDNum.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtIDNum.Size = New System.Drawing.Size(186, 22)
        Me.txtIDNum.TabIndex = 118
        '
        'txtAdmNum
        '
        Me.txtAdmNum.Enabled = False
        Me.txtAdmNum.Location = New System.Drawing.Point(143, 74)
        Me.txtAdmNum.Name = "txtAdmNum"
        Me.txtAdmNum.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtAdmNum.Size = New System.Drawing.Size(216, 22)
        Me.txtAdmNum.TabIndex = 117
        '
        'dtpAdmDate
        '
        Me.dtpAdmDate.CalendarFont = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpAdmDate.CalendarForeColor = System.Drawing.SystemColors.HotTrack
        Me.dtpAdmDate.CustomFormat = "yyyy-MM-dd"
        Me.dtpAdmDate.Enabled = False
        Me.dtpAdmDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpAdmDate.Location = New System.Drawing.Point(145, 46)
        Me.dtpAdmDate.Name = "dtpAdmDate"
        Me.dtpAdmDate.Size = New System.Drawing.Size(216, 21)
        Me.dtpAdmDate.TabIndex = 116
        '
        'LabelX12
        '
        Me.LabelX12.AutoSize = True
        Me.LabelX12.BackColor = System.Drawing.Color.Transparent
        Me.LabelX12.Location = New System.Drawing.Point(30, 51)
        Me.LabelX12.Name = "LabelX12"
        Me.LabelX12.Size = New System.Drawing.Size(91, 16)
        Me.LabelX12.TabIndex = 114
        Me.LabelX12.Text = "ADMISSION DATE"
        '
        'LabelX13
        '
        Me.LabelX13.AutoSize = True
        Me.LabelX13.BackColor = System.Drawing.Color.Transparent
        Me.LabelX13.Location = New System.Drawing.Point(30, 101)
        Me.LabelX13.Name = "LabelX13"
        Me.LabelX13.Size = New System.Drawing.Size(60, 16)
        Me.LabelX13.TabIndex = 115
        Me.LabelX13.Text = "ID NUMBER"
        '
        'LabelX14
        '
        Me.LabelX14.AutoSize = True
        Me.LabelX14.BackColor = System.Drawing.Color.Transparent
        Me.LabelX14.Location = New System.Drawing.Point(30, 76)
        Me.LabelX14.Name = "LabelX14"
        Me.LabelX14.Size = New System.Drawing.Size(107, 16)
        Me.LabelX14.TabIndex = 113
        Me.LabelX14.Text = "ADMISSION NUMBER"
        '
        'gcClassification
        '
        Me.gcClassification.Appearance.BackColor = System.Drawing.Color.DarkGray
        Me.gcClassification.Appearance.BackColor2 = System.Drawing.Color.Silver
        Me.gcClassification.Appearance.BorderColor = System.Drawing.Color.DimGray
        Me.gcClassification.Appearance.Options.UseBackColor = True
        Me.gcClassification.Appearance.Options.UseBorderColor = True
        Me.gcClassification.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.gcClassification.Controls.Add(Me.LabelX15)
        Me.gcClassification.Controls.Add(Me.cxbxGrant)
        Me.gcClassification.Controls.Add(Me.cmbCourseGrade)
        Me.gcClassification.Controls.Add(Me.cmbBatchYear)
        Me.gcClassification.Controls.Add(Me.cmbBatch)
        Me.gcClassification.Controls.Add(Me.cmbYearLevel)
        Me.gcClassification.Controls.Add(Me.cmbStatus)
        Me.gcClassification.Controls.Add(Me.cmbStature)
        Me.gcClassification.Controls.Add(Me.cmbCategory)
        Me.gcClassification.Controls.Add(Me.LabelX7)
        Me.gcClassification.Controls.Add(Me.LabelX10)
        Me.gcClassification.Controls.Add(Me.LabelX11)
        Me.gcClassification.Controls.Add(Me.LabelX5)
        Me.gcClassification.Controls.Add(Me.LabelX6)
        Me.gcClassification.Controls.Add(Me.LabelX2)
        Me.gcClassification.Controls.Add(Me.LabelX3)
        Me.gcClassification.GroupStyle = DevExpress.Utils.GroupStyle.Card
        Me.gcClassification.Location = New System.Drawing.Point(7, 253)
        Me.gcClassification.Name = "gcClassification"
        Me.gcClassification.Size = New System.Drawing.Size(872, 141)
        Me.gcClassification.TabIndex = 32
        Me.gcClassification.Text = "CLASSIFICATION"
        '
        'LabelX15
        '
        Me.LabelX15.AutoSize = True
        Me.LabelX15.BackColor = System.Drawing.Color.Transparent
        Me.LabelX15.ForeColor = System.Drawing.Color.Red
        Me.LabelX15.Location = New System.Drawing.Point(583, 114)
        Me.LabelX15.Name = "LabelX15"
        Me.LabelX15.Size = New System.Drawing.Size(80, 16)
        Me.LabelX15.TabIndex = 116
        Me.LabelX15.Text = "WAVE ALL FEES"
        Me.LabelX15.Visible = False
        '
        'cxbxGrant
        '
        Me.cxbxGrant.EditValue = Nothing
        Me.cxbxGrant.Location = New System.Drawing.Point(556, 112)
        Me.cxbxGrant.Name = "cxbxGrant"
        Me.cxbxGrant.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.cxbxGrant.Properties.Caption = ""
        Me.cxbxGrant.Size = New System.Drawing.Size(21, 23)
        Me.cxbxGrant.TabIndex = 121
        Me.cxbxGrant.Visible = False
        '
        'cmbCourseGrade
        '
        Me.cmbCourseGrade.Enabled = False
        Me.cmbCourseGrade.FormattingEnabled = True
        Me.cmbCourseGrade.Location = New System.Drawing.Point(143, 59)
        Me.cmbCourseGrade.Name = "cmbCourseGrade"
        Me.cmbCourseGrade.Size = New System.Drawing.Size(282, 21)
        Me.cmbCourseGrade.TabIndex = 40
        '
        'cmbBatchYear
        '
        Me.cmbBatchYear.Enabled = False
        Me.cmbBatchYear.FormattingEnabled = True
        Me.cmbBatchYear.Location = New System.Drawing.Point(143, 86)
        Me.cmbBatchYear.Name = "cmbBatchYear"
        Me.cmbBatchYear.Size = New System.Drawing.Size(282, 21)
        Me.cmbBatchYear.TabIndex = 39
        '
        'cmbBatch
        '
        Me.cmbBatch.Enabled = False
        Me.cmbBatch.FormattingEnabled = True
        Me.cmbBatch.Location = New System.Drawing.Point(555, 32)
        Me.cmbBatch.Name = "cmbBatch"
        Me.cmbBatch.Size = New System.Drawing.Size(282, 21)
        Me.cmbBatch.TabIndex = 38
        '
        'cmbYearLevel
        '
        Me.cmbYearLevel.Enabled = False
        Me.cmbYearLevel.FormattingEnabled = True
        Me.cmbYearLevel.Location = New System.Drawing.Point(143, 112)
        Me.cmbYearLevel.Name = "cmbYearLevel"
        Me.cmbYearLevel.Size = New System.Drawing.Size(282, 21)
        Me.cmbYearLevel.TabIndex = 37
        '
        'cmbStatus
        '
        Me.cmbStatus.Enabled = False
        Me.cmbStatus.FormattingEnabled = True
        Me.cmbStatus.Items.AddRange(New Object() {"NEW", "OLD", "RETURNEE", "TRANSFEREE", "2nd Bachelor's Degree"})
        Me.cmbStatus.Location = New System.Drawing.Point(555, 58)
        Me.cmbStatus.Name = "cmbStatus"
        Me.cmbStatus.Size = New System.Drawing.Size(282, 21)
        Me.cmbStatus.TabIndex = 36
        '
        'cmbStature
        '
        Me.cmbStature.Enabled = False
        Me.cmbStature.FormattingEnabled = True
        Me.cmbStature.Items.AddRange(New Object() {"Report Card / Good Moral", "Clearance / Class Card", "Transcript of Record", "Alternative Learning System Passer"})
        Me.cmbStature.Location = New System.Drawing.Point(555, 86)
        Me.cmbStature.Name = "cmbStature"
        Me.cmbStature.Size = New System.Drawing.Size(282, 21)
        Me.cmbStature.TabIndex = 35
        '
        'cmbCategory
        '
        Me.cmbCategory.Enabled = False
        Me.cmbCategory.FormattingEnabled = True
        Me.cmbCategory.Location = New System.Drawing.Point(143, 30)
        Me.cmbCategory.Name = "cmbCategory"
        Me.cmbCategory.Size = New System.Drawing.Size(282, 21)
        Me.cmbCategory.TabIndex = 33
        '
        'LabelX7
        '
        Me.LabelX7.AutoSize = True
        Me.LabelX7.BackColor = System.Drawing.Color.Transparent
        Me.LabelX7.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX7.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX7.Location = New System.Drawing.Point(440, 90)
        Me.LabelX7.Name = "LabelX7"
        Me.LabelX7.Size = New System.Drawing.Size(110, 16)
        Me.LabelX7.TabIndex = 33
        Me.LabelX7.Text = "BASIS OF ADMISSION"
        '
        'LabelX10
        '
        Me.LabelX10.AutoSize = True
        Me.LabelX10.BackColor = System.Drawing.Color.Transparent
        Me.LabelX10.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX10.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX10.Location = New System.Drawing.Point(440, 63)
        Me.LabelX10.Name = "LabelX10"
        Me.LabelX10.Size = New System.Drawing.Size(76, 16)
        Me.LabelX10.TabIndex = 30
        Me.LabelX10.Text = "CLASS STATUS"
        '
        'LabelX11
        '
        Me.LabelX11.AutoSize = True
        Me.LabelX11.BackColor = System.Drawing.Color.Transparent
        Me.LabelX11.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX11.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX11.Location = New System.Drawing.Point(28, 113)
        Me.LabelX11.Name = "LabelX11"
        Me.LabelX11.Size = New System.Drawing.Size(62, 16)
        Me.LabelX11.TabIndex = 29
        Me.LabelX11.Text = "YEAR LEVEL"
        '
        'LabelX5
        '
        Me.LabelX5.AutoSize = True
        Me.LabelX5.BackColor = System.Drawing.Color.Transparent
        Me.LabelX5.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX5.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX5.Location = New System.Drawing.Point(30, 87)
        Me.LabelX5.Name = "LabelX5"
        Me.LabelX5.Size = New System.Drawing.Size(65, 16)
        Me.LabelX5.TabIndex = 27
        Me.LabelX5.Text = "BATCH YEAR"
        '
        'LabelX6
        '
        Me.LabelX6.AutoSize = True
        Me.LabelX6.BackColor = System.Drawing.Color.Transparent
        Me.LabelX6.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX6.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX6.Location = New System.Drawing.Point(442, 32)
        Me.LabelX6.Name = "LabelX6"
        Me.LabelX6.Size = New System.Drawing.Size(92, 16)
        Me.LabelX6.TabIndex = 23
        Me.LabelX6.Text = "BATCH / SECTION"
        '
        'LabelX2
        '
        Me.LabelX2.AutoSize = True
        Me.LabelX2.BackColor = System.Drawing.Color.Transparent
        Me.LabelX2.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX2.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX2.Location = New System.Drawing.Point(30, 59)
        Me.LabelX2.Name = "LabelX2"
        Me.LabelX2.Size = New System.Drawing.Size(89, 16)
        Me.LabelX2.TabIndex = 22
        Me.LabelX2.Text = "COURSE / GRADE"
        '
        'LabelX3
        '
        Me.LabelX3.AutoSize = True
        Me.LabelX3.BackColor = System.Drawing.Color.Transparent
        Me.LabelX3.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX3.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX3.Location = New System.Drawing.Point(30, 32)
        Me.LabelX3.Name = "LabelX3"
        Me.LabelX3.Size = New System.Drawing.Size(85, 16)
        Me.LabelX3.TabIndex = 21
        Me.LabelX3.Text = "CATEGORY TYPE"
        '
        'gcAccountStatus
        '
        Me.gcAccountStatus.AppearanceCaption.BackColor = System.Drawing.Color.Transparent
        Me.gcAccountStatus.AppearanceCaption.BackColor2 = System.Drawing.Color.White
        Me.gcAccountStatus.AppearanceCaption.BorderColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.gcAccountStatus.AppearanceCaption.Options.UseBackColor = True
        Me.gcAccountStatus.AppearanceCaption.Options.UseBorderColor = True
        Me.gcAccountStatus.Controls.Add(Me.txtRemainingPayments)
        Me.gcAccountStatus.Controls.Add(Me.txtRemainingBalance)
        Me.gcAccountStatus.Controls.Add(Me.LabelX8)
        Me.gcAccountStatus.Controls.Add(Me.LabelX9)
        Me.gcAccountStatus.Controls.Add(Me.chkBBal)
        Me.gcAccountStatus.GroupStyle = DevExpress.Utils.GroupStyle.Light
        Me.gcAccountStatus.Location = New System.Drawing.Point(452, 150)
        Me.gcAccountStatus.Name = "gcAccountStatus"
        Me.gcAccountStatus.Size = New System.Drawing.Size(427, 99)
        Me.gcAccountStatus.TabIndex = 31
        Me.gcAccountStatus.Text = "ACCOUNT STATUS"
        '
        'txtRemainingPayments
        '
        Me.txtRemainingPayments.Location = New System.Drawing.Point(152, 62)
        Me.txtRemainingPayments.Name = "txtRemainingPayments"
        Me.txtRemainingPayments.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtRemainingPayments.Size = New System.Drawing.Size(248, 22)
        Me.txtRemainingPayments.TabIndex = 31
        '
        'txtRemainingBalance
        '
        Me.txtRemainingBalance.Location = New System.Drawing.Point(152, 32)
        Me.txtRemainingBalance.Name = "txtRemainingBalance"
        Me.txtRemainingBalance.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtRemainingBalance.Size = New System.Drawing.Size(248, 22)
        Me.txtRemainingBalance.TabIndex = 30
        '
        'LabelX8
        '
        Me.LabelX8.AutoSize = True
        Me.LabelX8.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX8.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX8.Location = New System.Drawing.Point(34, 64)
        Me.LabelX8.Name = "LabelX8"
        Me.LabelX8.Size = New System.Drawing.Size(107, 16)
        Me.LabelX8.TabIndex = 29
        Me.LabelX8.Text = "RUNNING PAYMENTS"
        '
        'LabelX9
        '
        Me.LabelX9.AutoSize = True
        Me.LabelX9.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX9.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX9.Location = New System.Drawing.Point(34, 36)
        Me.LabelX9.Name = "LabelX9"
        Me.LabelX9.Size = New System.Drawing.Size(100, 16)
        Me.LabelX9.TabIndex = 28
        Me.LabelX9.Text = "ACCOUNT BALANCE"
        '
        'chkBBal
        '
        Me.chkBBal.EditValue = Nothing
        Me.chkBBal.Location = New System.Drawing.Point(6, 46)
        Me.chkBBal.Name = "chkBBal"
        Me.chkBBal.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.chkBBal.Properties.Caption = ""
        Me.chkBBal.Size = New System.Drawing.Size(21, 23)
        Me.chkBBal.TabIndex = 32
        '
        'gcEnrollmentStatus
        '
        Me.gcEnrollmentStatus.AppearanceCaption.BackColor = System.Drawing.Color.Transparent
        Me.gcEnrollmentStatus.AppearanceCaption.BackColor2 = System.Drawing.Color.White
        Me.gcEnrollmentStatus.AppearanceCaption.BorderColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.gcEnrollmentStatus.AppearanceCaption.Options.UseBackColor = True
        Me.gcEnrollmentStatus.AppearanceCaption.Options.UseBorderColor = True
        Me.gcEnrollmentStatus.Controls.Add(Me.btnOld)
        Me.gcEnrollmentStatus.Controls.Add(Me.btnNew)
        Me.gcEnrollmentStatus.GroupStyle = DevExpress.Utils.GroupStyle.Light
        Me.gcEnrollmentStatus.Location = New System.Drawing.Point(452, 62)
        Me.gcEnrollmentStatus.Name = "gcEnrollmentStatus"
        Me.gcEnrollmentStatus.Size = New System.Drawing.Size(427, 82)
        Me.gcEnrollmentStatus.TabIndex = 30
        Me.gcEnrollmentStatus.Text = "ENROLLMENT STATUS"
        '
        'btnOld
        '
        Me.btnOld.Appearance.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnOld.Appearance.Options.UseBackColor = True
        Me.btnOld.AppearanceHovered.BackColor = System.Drawing.Color.DarkOrange
        Me.btnOld.AppearanceHovered.Options.UseBackColor = True
        Me.btnOld.AppearancePressed.BackColor = System.Drawing.Color.DarkOrange
        Me.btnOld.AppearancePressed.Options.UseBackColor = True
        Me.btnOld.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.btnOld.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.employee_32x32
        Me.btnOld.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter
        Me.btnOld.Location = New System.Drawing.Point(234, 28)
        Me.btnOld.Name = "btnOld"
        Me.btnOld.Size = New System.Drawing.Size(151, 41)
        Me.btnOld.TabIndex = 1
        Me.btnOld.Tag = "2"
        Me.btnOld.Text = "OLD STUDENT"
        '
        'btnNew
        '
        Me.btnNew.Appearance.BackColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnNew.Appearance.Options.UseBackColor = True
        Me.btnNew.AppearanceHovered.BackColor = System.Drawing.Color.MediumAquamarine
        Me.btnNew.AppearanceHovered.Options.UseBackColor = True
        Me.btnNew.AppearancePressed.BackColor = System.Drawing.Color.MediumAquamarine
        Me.btnNew.AppearancePressed.Options.UseBackColor = True
        Me.btnNew.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.btnNew.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.customer_32x32
        Me.btnNew.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter
        Me.btnNew.Location = New System.Drawing.Point(50, 28)
        Me.btnNew.Name = "btnNew"
        Me.btnNew.Size = New System.Drawing.Size(151, 41)
        Me.btnNew.TabIndex = 0
        Me.btnNew.Tag = "1"
        Me.btnNew.Text = "NEW STUDENT"
        '
        'GroupControl1
        '
        Me.GroupControl1.Appearance.BackColor = System.Drawing.Color.DarkGray
        Me.GroupControl1.Appearance.BackColor2 = System.Drawing.Color.Silver
        Me.GroupControl1.Appearance.BorderColor = System.Drawing.Color.DimGray
        Me.GroupControl1.Appearance.Options.UseBackColor = True
        Me.GroupControl1.Appearance.Options.UseBorderColor = True
        Me.GroupControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.GroupControl1.Controls.Add(Me.GroupControl3)
        Me.GroupControl1.Controls.Add(Me.GroupControl2)
        Me.GroupControl1.GroupStyle = DevExpress.Utils.GroupStyle.Card
        Me.GroupControl1.Location = New System.Drawing.Point(7, 62)
        Me.GroupControl1.Name = "GroupControl1"
        Me.GroupControl1.Size = New System.Drawing.Size(439, 187)
        Me.GroupControl1.TabIndex = 28
        Me.GroupControl1.Text = "YEAR"
        '
        'GroupControl3
        '
        Me.GroupControl3.AppearanceCaption.BackColor = System.Drawing.Color.Transparent
        Me.GroupControl3.AppearanceCaption.BackColor2 = System.Drawing.Color.White
        Me.GroupControl3.AppearanceCaption.BorderColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.GroupControl3.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl3.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl3.Controls.Add(Me.cmbSemester)
        Me.GroupControl3.GroupStyle = DevExpress.Utils.GroupStyle.Light
        Me.GroupControl3.Location = New System.Drawing.Point(15, 120)
        Me.GroupControl3.Name = "GroupControl3"
        Me.GroupControl3.Size = New System.Drawing.Size(412, 58)
        Me.GroupControl3.TabIndex = 30
        Me.GroupControl3.Text = "SEMESTER"
        '
        'cmbSemester
        '
        Me.cmbSemester.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmbSemester.Location = New System.Drawing.Point(19, 27)
        Me.cmbSemester.Name = "cmbSemester"
        Me.cmbSemester.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.cmbSemester.Properties.Buttons.AddRange(New DevExpress.XtraEditors.Controls.EditorButton() {New DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)})
        Me.cmbSemester.Properties.Items.AddRange(New Object() {"1ST SEMESTER", "2ND SEMESTER", "SUMMER", "YEARLY"})
        Me.cmbSemester.Size = New System.Drawing.Size(369, 22)
        Me.cmbSemester.TabIndex = 26
        '
        'GroupControl2
        '
        Me.GroupControl2.AppearanceCaption.BackColor = System.Drawing.Color.Transparent
        Me.GroupControl2.AppearanceCaption.BackColor2 = System.Drawing.Color.White
        Me.GroupControl2.AppearanceCaption.BorderColor = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.GroupControl2.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl2.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl2.Controls.Add(Me.cmbYearFrom)
        Me.GroupControl2.Controls.Add(Me.cmbYearTo)
        Me.GroupControl2.Controls.Add(Me.LabelX4)
        Me.GroupControl2.Controls.Add(Me.LabelX1)
        Me.GroupControl2.GroupStyle = DevExpress.Utils.GroupStyle.Light
        Me.GroupControl2.Location = New System.Drawing.Point(15, 28)
        Me.GroupControl2.Name = "GroupControl2"
        Me.GroupControl2.Size = New System.Drawing.Size(412, 85)
        Me.GroupControl2.TabIndex = 29
        Me.GroupControl2.Text = "ACADEMIC YEAR"
        '
        'cmbYearFrom
        '
        Me.cmbYearFrom.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmbYearFrom.Location = New System.Drawing.Point(89, 27)
        Me.cmbYearFrom.Name = "cmbYearFrom"
        Me.cmbYearFrom.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.cmbYearFrom.Properties.Buttons.AddRange(New DevExpress.XtraEditors.Controls.EditorButton() {New DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)})
        Me.cmbYearFrom.Properties.Items.AddRange(New Object() {"1ST SEMESTER", "2ND SEMESTER", "SUMMER", "YEARLY"})
        Me.cmbYearFrom.Size = New System.Drawing.Size(297, 22)
        Me.cmbYearFrom.TabIndex = 29
        '
        'cmbYearTo
        '
        Me.cmbYearTo.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.cmbYearTo.Location = New System.Drawing.Point(90, 55)
        Me.cmbYearTo.Name = "cmbYearTo"
        Me.cmbYearTo.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.cmbYearTo.Properties.Buttons.AddRange(New DevExpress.XtraEditors.Controls.EditorButton() {New DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)})
        Me.cmbYearTo.Properties.Items.AddRange(New Object() {"1ST SEMESTER", "2ND SEMESTER", "SUMMER", "YEARLY"})
        Me.cmbYearTo.Size = New System.Drawing.Size(297, 22)
        Me.cmbYearTo.TabIndex = 28
        '
        'LabelX4
        '
        Me.LabelX4.AutoSize = True
        Me.LabelX4.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX4.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX4.Location = New System.Drawing.Point(31, 56)
        Me.LabelX4.Name = "LabelX4"
        Me.LabelX4.Size = New System.Drawing.Size(17, 16)
        Me.LabelX4.TabIndex = 29
        Me.LabelX4.Text = "TO"
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX1.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX1.Location = New System.Drawing.Point(27, 30)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(31, 16)
        Me.LabelX1.TabIndex = 28
        Me.LabelX1.Text = "FROM"
        '
        'PanelControl1
        '
        Me.PanelControl1.Appearance.BackColor = System.Drawing.Color.MediumAquamarine
        Me.PanelControl1.Appearance.BackColor2 = System.Drawing.Color.FromArgb(CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer), CType(CType(224, Byte), Integer))
        Me.PanelControl1.Appearance.BorderColor = System.Drawing.Color.Silver
        Me.PanelControl1.Appearance.Options.UseBackColor = True
        Me.PanelControl1.Appearance.Options.UseBorderColor = True
        Me.PanelControl1.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.PanelControl1.Controls.Add(Me.LabelControl1)
        Me.PanelControl1.Dock = System.Windows.Forms.DockStyle.Top
        Me.PanelControl1.Location = New System.Drawing.Point(0, 0)
        Me.PanelControl1.Name = "PanelControl1"
        Me.PanelControl1.Size = New System.Drawing.Size(887, 56)
        Me.PanelControl1.TabIndex = 27
        '
        'LabelControl1
        '
        Me.LabelControl1.Appearance.Font = New System.Drawing.Font("Tahoma", 24.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelControl1.Appearance.Options.UseFont = True
        Me.LabelControl1.Location = New System.Drawing.Point(245, 9)
        Me.LabelControl1.Name = "LabelControl1"
        Me.LabelControl1.Size = New System.Drawing.Size(357, 39)
        Me.LabelControl1.TabIndex = 0
        Me.LabelControl1.Text = "STUDENT ADMISSION"
        '
        'gcPicture
        '
        Me.gcPicture.Controls.Add(Me.Panel3)
        Me.gcPicture.Controls.Add(Me.Panel4)
        Me.gcPicture.Location = New System.Drawing.Point(604, 435)
        Me.gcPicture.Name = "gcPicture"
        Me.gcPicture.Size = New System.Drawing.Size(62, 45)
        Me.gcPicture.TabIndex = 218
        Me.gcPicture.Text = "PICTURE"
        '
        'Panel3
        '
        Me.Panel3.Controls.Add(Me.pbxphoto)
        Me.Panel3.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel3.Location = New System.Drawing.Point(2, 20)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Size = New System.Drawing.Size(58, 1)
        Me.Panel3.TabIndex = 204
        '
        'pbxphoto
        '
        Me.pbxphoto.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.pbxphoto.Cursor = System.Windows.Forms.Cursors.Hand
        Me.pbxphoto.Dock = System.Windows.Forms.DockStyle.Fill
        Me.pbxphoto.Image = CType(resources.GetObject("pbxphoto.Image"), System.Drawing.Image)
        Me.pbxphoto.Location = New System.Drawing.Point(0, 0)
        Me.pbxphoto.Name = "pbxphoto"
        Me.pbxphoto.Size = New System.Drawing.Size(58, 1)
        Me.pbxphoto.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.pbxphoto.TabIndex = 203
        Me.pbxphoto.TabStop = False
        '
        'Panel4
        '
        Me.Panel4.Controls.Add(Me.txtPhotoFileName)
        Me.Panel4.Controls.Add(Me.ButtonBrowsePic)
        Me.Panel4.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel4.Location = New System.Drawing.Point(2, 21)
        Me.Panel4.Name = "Panel4"
        Me.Panel4.Size = New System.Drawing.Size(58, 22)
        Me.Panel4.TabIndex = 205
        '
        'txtPhotoFileName
        '
        Me.txtPhotoFileName.AccessibleName = ""
        Me.txtPhotoFileName.BackColor = System.Drawing.SystemColors.ButtonHighlight
        '
        '
        '
        Me.txtPhotoFileName.Border.Class = "TextBoxBorder"
        Me.txtPhotoFileName.Dock = System.Windows.Forms.DockStyle.Fill
        Me.txtPhotoFileName.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtPhotoFileName.FocusHighlightEnabled = True
        Me.txtPhotoFileName.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtPhotoFileName.Location = New System.Drawing.Point(0, 0)
        Me.txtPhotoFileName.MaxLength = 30
        Me.txtPhotoFileName.Name = "txtPhotoFileName"
        Me.txtPhotoFileName.ReadOnly = True
        Me.txtPhotoFileName.Size = New System.Drawing.Size(0, 21)
        Me.txtPhotoFileName.TabIndex = 208
        '
        'ButtonBrowsePic
        '
        Me.ButtonBrowsePic.Dock = System.Windows.Forms.DockStyle.Right
        Me.ButtonBrowsePic.Enabled = False
        Me.ButtonBrowsePic.Location = New System.Drawing.Point(-8, 0)
        Me.ButtonBrowsePic.Name = "ButtonBrowsePic"
        Me.ButtonBrowsePic.Size = New System.Drawing.Size(66, 22)
        Me.ButtonBrowsePic.TabIndex = 214
        Me.ButtonBrowsePic.Text = "BROWSE"
        Me.ButtonBrowsePic.UseVisualStyleBackColor = True
        '
        'frmStudentAdmissionEntry
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(887, 710)
        Me.ControlBox = False
        Me.Controls.Add(Me.Panel1)
        Me.Name = "frmStudentAdmissionEntry"
        Me.ShowIcon = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "STUDENT ADMISSION - ENTRY"
        Me.Panel1.ResumeLayout(False)
        CType(Me.gcStudentProfile, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gcStudentProfile.ResumeLayout(False)
        Me.gcStudentProfile.PerformLayout()
        CType(Me.txtAge.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtCurrentAddress.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtContactNumber.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtMName.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtFName.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtLName.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.gcAdmissionDetails, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gcAdmissionDetails.ResumeLayout(False)
        Me.gcAdmissionDetails.PerformLayout()
        CType(Me.GroupControl4, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl4.ResumeLayout(False)
        Me.GroupControl4.PerformLayout()
        CType(Me.chkManulStdNum.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GroupControl8, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl8.ResumeLayout(False)
        Me.GroupControl8.PerformLayout()
        CType(Me.txtIsFullDeduct.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtIDNum.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtAdmNum.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.gcClassification, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gcClassification.ResumeLayout(False)
        Me.gcClassification.PerformLayout()
        CType(Me.cxbxGrant.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.gcAccountStatus, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gcAccountStatus.ResumeLayout(False)
        Me.gcAccountStatus.PerformLayout()
        CType(Me.txtRemainingPayments.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtRemainingBalance.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.chkBBal.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.gcEnrollmentStatus, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gcEnrollmentStatus.ResumeLayout(False)
        CType(Me.GroupControl1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl1.ResumeLayout(False)
        CType(Me.GroupControl3, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl3.ResumeLayout(False)
        CType(Me.cmbSemester.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GroupControl2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl2.ResumeLayout(False)
        Me.GroupControl2.PerformLayout()
        CType(Me.cmbYearFrom.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.cmbYearTo.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PanelControl1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.PanelControl1.ResumeLayout(False)
        Me.PanelControl1.PerformLayout()
        CType(Me.gcPicture, System.ComponentModel.ISupportInitialize).EndInit()
        Me.gcPicture.ResumeLayout(False)
        Me.Panel3.ResumeLayout(False)
        CType(Me.pbxphoto, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel4.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents Panel1 As Panel
    Friend WithEvents LabelX3 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX2 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX6 As DevComponents.DotNetBar.LabelX
    Friend WithEvents PanelControl1 As DevExpress.XtraEditors.PanelControl
    Friend WithEvents LabelControl1 As DevExpress.XtraEditors.LabelControl
    Friend WithEvents GroupControl1 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents GroupControl2 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents GroupControl3 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents cmbSemester As DevExpress.XtraEditors.ComboBoxEdit
    Friend WithEvents LabelX4 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents gcAccountStatus As DevExpress.XtraEditors.GroupControl
    Friend WithEvents LabelX8 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX9 As DevComponents.DotNetBar.LabelX
    Friend WithEvents gcEnrollmentStatus As DevExpress.XtraEditors.GroupControl
    Friend WithEvents btnNew As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents btnOld As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents txtRemainingPayments As DevExpress.XtraEditors.TextEdit
    Friend WithEvents txtRemainingBalance As DevExpress.XtraEditors.TextEdit
    Friend WithEvents chkBBal As DevExpress.XtraEditors.CheckEdit
    Friend WithEvents gcClassification As DevExpress.XtraEditors.GroupControl
    Friend WithEvents LabelX7 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX10 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX11 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX5 As DevComponents.DotNetBar.LabelX
    Friend WithEvents gcAdmissionDetails As DevExpress.XtraEditors.GroupControl
    Friend WithEvents LabelX12 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX13 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX14 As DevComponents.DotNetBar.LabelX
    Friend WithEvents dtpAdmDate As DateTimePicker
    Friend WithEvents txtAdmNum As DevExpress.XtraEditors.TextEdit
    Friend WithEvents txtIDNum As DevExpress.XtraEditors.TextEdit
    Friend WithEvents GroupControl8 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents cxbxGrant As DevExpress.XtraEditors.CheckEdit
    Friend WithEvents chkManulStdNum As DevExpress.XtraEditors.CheckEdit
    Friend WithEvents LabelX15 As DevComponents.DotNetBar.LabelX
    Friend WithEvents gcStudentProfile As DevExpress.XtraEditors.GroupControl
    Friend WithEvents txtIsFullDeduct As DevExpress.XtraEditors.TextEdit
    Friend WithEvents txtMName As DevExpress.XtraEditors.TextEdit
    Friend WithEvents LabelX18 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtFName As DevExpress.XtraEditors.TextEdit
    Friend WithEvents txtLName As DevExpress.XtraEditors.TextEdit
    Friend WithEvents LabelX16 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX17 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtCurrentAddress As DevExpress.XtraEditors.TextEdit
    Friend WithEvents txtContactNumber As DevExpress.XtraEditors.TextEdit
    Friend WithEvents LabelX22 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX19 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX20 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX21 As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnSave As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents txtAge As DevExpress.XtraEditors.TextEdit
    Friend WithEvents dtpDateBirth As DateTimePicker
    Friend WithEvents btnCancel As DevExpress.XtraEditors.SimpleButton
    Private WithEvents gcPicture As DevExpress.XtraEditors.GroupControl
    Friend WithEvents Panel3 As Panel
    Friend WithEvents pbxphoto As PictureBox
    Friend WithEvents Panel4 As Panel
    Friend WithEvents txtPhotoFileName As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents ButtonBrowsePic As Button
    Friend WithEvents cmbYearTo As DevExpress.XtraEditors.ComboBoxEdit
    Friend WithEvents cmbYearFrom As DevExpress.XtraEditors.ComboBoxEdit
    Friend WithEvents cmbCourseGrade As ComboBox
    Friend WithEvents cmbBatchYear As ComboBox
    Friend WithEvents cmbBatch As ComboBox
    Friend WithEvents cmbYearLevel As ComboBox
    Friend WithEvents cmbStatus As ComboBox
    Friend WithEvents cmbStature As ComboBox
    Friend WithEvents cmbCategory As ComboBox
    Friend WithEvents txtGrant As ComboBox
    Friend WithEvents GroupControl4 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents LabelX24 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX23 As DevComponents.DotNetBar.LabelX
    Friend WithEvents cmbStrand As ComboBox
    Friend WithEvents cmbTrack As ComboBox
    Friend WithEvents LabelX25 As DevComponents.DotNetBar.LabelX
    Friend WithEvents rdbReEntry As RadioButton
End Class
