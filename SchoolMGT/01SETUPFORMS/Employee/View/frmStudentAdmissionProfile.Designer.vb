<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmStudentAdmissionProfile
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmStudentAdmissionProfile))
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.btnSave = New DevExpress.XtraEditors.SimpleButton()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.GroupControl1 = New DevExpress.XtraEditors.GroupControl()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.txtDisplayName = New System.Windows.Forms.TextBox()
        Me.GroupControl3 = New DevExpress.XtraEditors.GroupControl()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.dtpHighTo = New System.Windows.Forms.DateTimePicker()
        Me.dtpHighFrom = New System.Windows.Forms.DateTimePicker()
        Me.dtpElemTo = New System.Windows.Forms.DateTimePicker()
        Me.dtpElemFrom = New System.Windows.Forms.DateTimePicker()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.txtHighSchool = New DevExpress.XtraEditors.TextEdit()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.txtElementary = New DevExpress.XtraEditors.TextEdit()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.GroupControl2 = New DevExpress.XtraEditors.GroupControl()
        Me.dtpBDay = New DevComponents.Editors.DateTimeAdv.DateTimeInput()
        Me.txtParents = New DevExpress.XtraEditors.TextEdit()
        Me.Label16 = New System.Windows.Forms.Label()
        Me.txtAddress = New DevExpress.XtraEditors.TextEdit()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.txtPlaceBirth = New DevExpress.XtraEditors.TextEdit()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.txtEmail = New DevExpress.XtraEditors.TextEdit()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.RadioButton1 = New System.Windows.Forms.RadioButton()
        Me.RadioButton2 = New System.Windows.Forms.RadioButton()
        Me.txtContact = New DevExpress.XtraEditors.TextEdit()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.cmbCivilStatus = New System.Windows.Forms.ComboBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txtMiddleName = New DevExpress.XtraEditors.TextEdit()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.txtFirstName = New DevExpress.XtraEditors.TextEdit()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.txtLastName = New DevExpress.XtraEditors.TextEdit()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Panel1.SuspendLayout()
        Me.Panel2.SuspendLayout()
        CType(Me.GroupControl1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.GroupControl3, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl3.SuspendLayout()
        CType(Me.txtHighSchool.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtElementary.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GroupControl2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupControl2.SuspendLayout()
        CType(Me.dtpBDay, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtParents.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtAddress.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtPlaceBirth.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtEmail.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        CType(Me.txtContact.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtMiddleName.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtFirstName.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtLastName.Properties, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.btnSave)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(8, 468)
        Me.Panel1.Margin = New System.Windows.Forms.Padding(2)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Padding = New System.Windows.Forms.Padding(8)
        Me.Panel1.Size = New System.Drawing.Size(748, 56)
        Me.Panel1.TabIndex = 0
        '
        'btnSave
        '
        Me.btnSave.AppearanceHovered.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.btnSave.AppearanceHovered.BackColor2 = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.btnSave.AppearanceHovered.Options.UseBackColor = True
        Me.btnSave.AppearancePressed.BackColor = System.Drawing.Color.Lime
        Me.btnSave.AppearancePressed.Options.UseBackColor = True
        Me.btnSave.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.btnSave.DialogResult = System.Windows.Forms.DialogResult.OK
        Me.btnSave.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnSave.ImageOptions.Image = CType(resources.GetObject("btnSave.ImageOptions.Image"), System.Drawing.Image)
        Me.btnSave.ImageOptions.ImageToTextAlignment = DevExpress.XtraEditors.ImageAlignToText.LeftCenter
        Me.btnSave.Location = New System.Drawing.Point(630, 8)
        Me.btnSave.Margin = New System.Windows.Forms.Padding(2)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Size = New System.Drawing.Size(110, 40)
        Me.btnSave.TabIndex = 0
        Me.btnSave.Text = "Save"
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.Color.MediumAquamarine
        Me.Panel2.Controls.Add(Me.GroupControl1)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel2.Location = New System.Drawing.Point(8, 8)
        Me.Panel2.Margin = New System.Windows.Forms.Padding(2)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(748, 460)
        Me.Panel2.TabIndex = 1
        '
        'GroupControl1
        '
        Me.GroupControl1.AppearanceCaption.BackColor = System.Drawing.Color.DarkGray
        Me.GroupControl1.AppearanceCaption.BackColor2 = System.Drawing.Color.Silver
        Me.GroupControl1.AppearanceCaption.BorderColor = System.Drawing.Color.DimGray
        Me.GroupControl1.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl1.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl1.Controls.Add(Me.GroupBox2)
        Me.GroupControl1.Controls.Add(Me.GroupControl3)
        Me.GroupControl1.Controls.Add(Me.GroupControl2)
        Me.GroupControl1.Controls.Add(Me.txtMiddleName)
        Me.GroupControl1.Controls.Add(Me.Label3)
        Me.GroupControl1.Controls.Add(Me.txtFirstName)
        Me.GroupControl1.Controls.Add(Me.Label2)
        Me.GroupControl1.Controls.Add(Me.txtLastName)
        Me.GroupControl1.Controls.Add(Me.Label1)
        Me.GroupControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupControl1.Location = New System.Drawing.Point(0, 0)
        Me.GroupControl1.Margin = New System.Windows.Forms.Padding(2)
        Me.GroupControl1.Name = "GroupControl1"
        Me.GroupControl1.Size = New System.Drawing.Size(748, 460)
        Me.GroupControl1.TabIndex = 0
        Me.GroupControl1.Text = "Person Profile"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.txtDisplayName)
        Me.GroupBox2.Location = New System.Drawing.Point(442, 28)
        Me.GroupBox2.Margin = New System.Windows.Forms.Padding(2)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Padding = New System.Windows.Forms.Padding(2)
        Me.GroupBox2.Size = New System.Drawing.Size(286, 81)
        Me.GroupBox2.TabIndex = 47
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Display Name"
        '
        'txtDisplayName
        '
        Me.txtDisplayName.Location = New System.Drawing.Point(22, 25)
        Me.txtDisplayName.Margin = New System.Windows.Forms.Padding(2)
        Me.txtDisplayName.Multiline = True
        Me.txtDisplayName.Name = "txtDisplayName"
        Me.txtDisplayName.Size = New System.Drawing.Size(246, 41)
        Me.txtDisplayName.TabIndex = 0
        '
        'GroupControl3
        '
        Me.GroupControl3.AppearanceCaption.BackColor = System.Drawing.Color.DarkGray
        Me.GroupControl3.AppearanceCaption.BackColor2 = System.Drawing.Color.Silver
        Me.GroupControl3.AppearanceCaption.BorderColor = System.Drawing.Color.DimGray
        Me.GroupControl3.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl3.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl3.Controls.Add(Me.Label12)
        Me.GroupControl3.Controls.Add(Me.Label11)
        Me.GroupControl3.Controls.Add(Me.dtpHighTo)
        Me.GroupControl3.Controls.Add(Me.dtpHighFrom)
        Me.GroupControl3.Controls.Add(Me.dtpElemTo)
        Me.GroupControl3.Controls.Add(Me.dtpElemFrom)
        Me.GroupControl3.Controls.Add(Me.Label9)
        Me.GroupControl3.Controls.Add(Me.Label10)
        Me.GroupControl3.Controls.Add(Me.txtHighSchool)
        Me.GroupControl3.Controls.Add(Me.Label7)
        Me.GroupControl3.Controls.Add(Me.txtElementary)
        Me.GroupControl3.Controls.Add(Me.Label8)
        Me.GroupControl3.Location = New System.Drawing.Point(21, 332)
        Me.GroupControl3.Margin = New System.Windows.Forms.Padding(2)
        Me.GroupControl3.Name = "GroupControl3"
        Me.GroupControl3.Size = New System.Drawing.Size(707, 116)
        Me.GroupControl3.TabIndex = 46
        Me.GroupControl3.Text = "Educational Detals"
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.Label12.Location = New System.Drawing.Point(643, 25)
        Me.Label12.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(21, 13)
        Me.Label12.TabIndex = 45
        Me.Label12.Text = "TO"
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.ForeColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(0, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.Label11.Location = New System.Drawing.Point(557, 26)
        Me.Label11.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(36, 13)
        Me.Label11.TabIndex = 44
        Me.Label11.Text = "FROM"
        '
        'dtpHighTo
        '
        Me.dtpHighTo.Checked = False
        Me.dtpHighTo.CustomFormat = "yyyyy"
        Me.dtpHighTo.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpHighTo.Location = New System.Drawing.Point(626, 72)
        Me.dtpHighTo.Margin = New System.Windows.Forms.Padding(2)
        Me.dtpHighTo.Name = "dtpHighTo"
        Me.dtpHighTo.ShowUpDown = True
        Me.dtpHighTo.Size = New System.Drawing.Size(70, 21)
        Me.dtpHighTo.TabIndex = 17
        '
        'dtpHighFrom
        '
        Me.dtpHighFrom.Checked = False
        Me.dtpHighFrom.CustomFormat = "yyyyy"
        Me.dtpHighFrom.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpHighFrom.Location = New System.Drawing.Point(544, 72)
        Me.dtpHighFrom.Margin = New System.Windows.Forms.Padding(2)
        Me.dtpHighFrom.Name = "dtpHighFrom"
        Me.dtpHighFrom.ShowUpDown = True
        Me.dtpHighFrom.Size = New System.Drawing.Size(70, 21)
        Me.dtpHighFrom.TabIndex = 16
        '
        'dtpElemTo
        '
        Me.dtpElemTo.Checked = False
        Me.dtpElemTo.CustomFormat = "yyyyy"
        Me.dtpElemTo.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpElemTo.Location = New System.Drawing.Point(626, 43)
        Me.dtpElemTo.Margin = New System.Windows.Forms.Padding(2)
        Me.dtpElemTo.Name = "dtpElemTo"
        Me.dtpElemTo.ShowUpDown = True
        Me.dtpElemTo.Size = New System.Drawing.Size(70, 21)
        Me.dtpElemTo.TabIndex = 14
        '
        'dtpElemFrom
        '
        Me.dtpElemFrom.Checked = False
        Me.dtpElemFrom.CustomFormat = "yyyyy"
        Me.dtpElemFrom.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpElemFrom.Location = New System.Drawing.Point(544, 44)
        Me.dtpElemFrom.Margin = New System.Windows.Forms.Padding(2)
        Me.dtpElemFrom.Name = "dtpElemFrom"
        Me.dtpElemFrom.ShowUpDown = True
        Me.dtpElemFrom.Size = New System.Drawing.Size(70, 21)
        Me.dtpElemFrom.TabIndex = 13
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(435, 77)
        Me.Label9.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(97, 13)
        Me.Label9.TabIndex = 39
        Me.Label9.Text = "YEAR GRADUATED"
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(435, 46)
        Me.Label10.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(97, 13)
        Me.Label10.TabIndex = 38
        Me.Label10.Text = "YEAR GRADUATED"
        '
        'txtHighSchool
        '
        Me.txtHighSchool.Location = New System.Drawing.Point(112, 76)
        Me.txtHighSchool.Name = "txtHighSchool"
        Me.txtHighSchool.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtHighSchool.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtHighSchool.Size = New System.Drawing.Size(317, 22)
        Me.txtHighSchool.TabIndex = 15
        Me.txtHighSchool.Tag = "High School Graduate"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(32, 79)
        Me.Label7.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(76, 13)
        Me.Label7.TabIndex = 36
        Me.Label7.Text = "HIGH SCHOOL"
        '
        'txtElementary
        '
        Me.txtElementary.Location = New System.Drawing.Point(113, 45)
        Me.txtElementary.Name = "txtElementary"
        Me.txtElementary.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtElementary.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtElementary.Size = New System.Drawing.Size(317, 22)
        Me.txtElementary.TabIndex = 12
        Me.txtElementary.Tag = "Elementary Graduate"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(32, 48)
        Me.Label8.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(71, 13)
        Me.Label8.TabIndex = 34
        Me.Label8.Text = "ELEMENTARY"
        '
        'GroupControl2
        '
        Me.GroupControl2.AppearanceCaption.BackColor = System.Drawing.Color.DarkGray
        Me.GroupControl2.AppearanceCaption.BackColor2 = System.Drawing.Color.Silver
        Me.GroupControl2.AppearanceCaption.BorderColor = System.Drawing.Color.DimGray
        Me.GroupControl2.AppearanceCaption.Options.UseBackColor = True
        Me.GroupControl2.AppearanceCaption.Options.UseBorderColor = True
        Me.GroupControl2.Controls.Add(Me.dtpBDay)
        Me.GroupControl2.Controls.Add(Me.txtParents)
        Me.GroupControl2.Controls.Add(Me.Label16)
        Me.GroupControl2.Controls.Add(Me.txtAddress)
        Me.GroupControl2.Controls.Add(Me.Label15)
        Me.GroupControl2.Controls.Add(Me.txtPlaceBirth)
        Me.GroupControl2.Controls.Add(Me.Label14)
        Me.GroupControl2.Controls.Add(Me.txtEmail)
        Me.GroupControl2.Controls.Add(Me.Label13)
        Me.GroupControl2.Controls.Add(Me.GroupBox1)
        Me.GroupControl2.Controls.Add(Me.txtContact)
        Me.GroupControl2.Controls.Add(Me.Label5)
        Me.GroupControl2.Controls.Add(Me.cmbCivilStatus)
        Me.GroupControl2.Controls.Add(Me.Label6)
        Me.GroupControl2.Controls.Add(Me.Label4)
        Me.GroupControl2.Location = New System.Drawing.Point(21, 123)
        Me.GroupControl2.Margin = New System.Windows.Forms.Padding(2)
        Me.GroupControl2.Name = "GroupControl2"
        Me.GroupControl2.Size = New System.Drawing.Size(707, 205)
        Me.GroupControl2.TabIndex = 45
        Me.GroupControl2.Text = "Details"
        '
        'dtpBDay
        '
        Me.dtpBDay.AccessibleName = "hr_person_eligibility"
        '
        '
        '
        Me.dtpBDay.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.dtpBDay.ButtonDropDown.Visible = True
        Me.dtpBDay.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.dtpBDay.FocusHighlightEnabled = True
        Me.dtpBDay.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpBDay.ForeColor = System.Drawing.Color.MidnightBlue
        Me.dtpBDay.Location = New System.Drawing.Point(118, 75)
        Me.dtpBDay.MinDate = New Date(1900, 1, 1, 0, 0, 0, 0)
        '
        '
        '
        Me.dtpBDay.MonthCalendar.AnnuallyMarkedDates = New Date(-1) {}
        Me.dtpBDay.MonthCalendar.ClearButtonVisible = True
        '
        '
        '
        Me.dtpBDay.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2
        Me.dtpBDay.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpBDay.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground
        Me.dtpBDay.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.dtpBDay.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder
        Me.dtpBDay.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1
        Me.dtpBDay.MonthCalendar.DisplayMonth = New Date(2011, 5, 1, 0, 0, 0, 0)
        Me.dtpBDay.MonthCalendar.MarkedDates = New Date(-1) {}
        Me.dtpBDay.MonthCalendar.MonthlyMarkedDates = New Date(-1) {}
        '
        '
        '
        Me.dtpBDay.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.dtpBDay.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpBDay.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.dtpBDay.MonthCalendar.TodayButtonVisible = True
        Me.dtpBDay.Name = "dtpBDay"
        Me.dtpBDay.Size = New System.Drawing.Size(161, 20)
        Me.dtpBDay.TabIndex = 246
        '
        'txtParents
        '
        Me.txtParents.Location = New System.Drawing.Point(118, 167)
        Me.txtParents.Name = "txtParents"
        Me.txtParents.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtParents.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtParents.Size = New System.Drawing.Size(569, 22)
        Me.txtParents.TabIndex = 11
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Location = New System.Drawing.Point(28, 170)
        Me.Label16.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(52, 13)
        Me.Label16.TabIndex = 52
        Me.Label16.Text = "PARENTS"
        '
        'txtAddress
        '
        Me.txtAddress.Location = New System.Drawing.Point(118, 140)
        Me.txtAddress.Name = "txtAddress"
        Me.txtAddress.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtAddress.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtAddress.Size = New System.Drawing.Size(570, 22)
        Me.txtAddress.TabIndex = 10
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(28, 142)
        Me.Label15.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(53, 13)
        Me.Label15.TabIndex = 50
        Me.Label15.Text = "ADDRESS"
        '
        'txtPlaceBirth
        '
        Me.txtPlaceBirth.Location = New System.Drawing.Point(118, 110)
        Me.txtPlaceBirth.Name = "txtPlaceBirth"
        Me.txtPlaceBirth.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtPlaceBirth.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtPlaceBirth.Size = New System.Drawing.Size(571, 22)
        Me.txtPlaceBirth.TabIndex = 9
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(29, 112)
        Me.Label14.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(88, 13)
        Me.Label14.TabIndex = 48
        Me.Label14.Text = "PLACE OF BIRTH"
        '
        'txtEmail
        '
        Me.txtEmail.Location = New System.Drawing.Point(530, 43)
        Me.txtEmail.Name = "txtEmail"
        Me.txtEmail.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtEmail.Size = New System.Drawing.Size(160, 22)
        Me.txtEmail.TabIndex = 6
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(467, 46)
        Me.Label13.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(65, 13)
        Me.Label13.TabIndex = 46
        Me.Label13.Text = "E-MAIL ADD"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.RadioButton1)
        Me.GroupBox1.Controls.Add(Me.RadioButton2)
        Me.GroupBox1.Location = New System.Drawing.Point(26, 26)
        Me.GroupBox1.Margin = New System.Windows.Forms.Padding(2)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Padding = New System.Windows.Forms.Padding(2)
        Me.GroupBox1.Size = New System.Drawing.Size(160, 46)
        Me.GroupBox1.TabIndex = 4
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "GENDER"
        '
        'RadioButton1
        '
        Me.RadioButton1.AutoSize = True
        Me.RadioButton1.ForeColor = System.Drawing.Color.Blue
        Me.RadioButton1.Location = New System.Drawing.Point(24, 18)
        Me.RadioButton1.Margin = New System.Windows.Forms.Padding(2)
        Me.RadioButton1.Name = "RadioButton1"
        Me.RadioButton1.Size = New System.Drawing.Size(51, 17)
        Me.RadioButton1.TabIndex = 43
        Me.RadioButton1.TabStop = True
        Me.RadioButton1.Text = "MALE"
        Me.RadioButton1.UseVisualStyleBackColor = True
        '
        'RadioButton2
        '
        Me.RadioButton2.AutoSize = True
        Me.RadioButton2.ForeColor = System.Drawing.Color.Red
        Me.RadioButton2.Location = New System.Drawing.Point(85, 18)
        Me.RadioButton2.Margin = New System.Windows.Forms.Padding(2)
        Me.RadioButton2.Name = "RadioButton2"
        Me.RadioButton2.Size = New System.Drawing.Size(63, 17)
        Me.RadioButton2.TabIndex = 44
        Me.RadioButton2.TabStop = True
        Me.RadioButton2.Text = "FEMALE"
        Me.RadioButton2.UseVisualStyleBackColor = True
        '
        'txtContact
        '
        Me.txtContact.Location = New System.Drawing.Point(380, 76)
        Me.txtContact.Name = "txtContact"
        Me.txtContact.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtContact.Size = New System.Drawing.Size(309, 22)
        Me.txtContact.TabIndex = 8
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(295, 79)
        Me.Label5.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(85, 13)
        Me.Label5.TabIndex = 38
        Me.Label5.Text = "CONTACT NO.#"
        '
        'cmbCivilStatus
        '
        Me.cmbCivilStatus.FormattingEnabled = True
        Me.cmbCivilStatus.Items.AddRange(New Object() {"SINGLE", "MARRIED", "SEPARATED", "WIDOWED", "SOLO PARENT"})
        Me.cmbCivilStatus.Location = New System.Drawing.Point(283, 43)
        Me.cmbCivilStatus.Margin = New System.Windows.Forms.Padding(2)
        Me.cmbCivilStatus.Name = "cmbCivilStatus"
        Me.cmbCivilStatus.Size = New System.Drawing.Size(175, 21)
        Me.cmbCivilStatus.TabIndex = 5
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(202, 46)
        Me.Label6.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(74, 13)
        Me.Label6.TabIndex = 40
        Me.Label6.Text = "CIVIL STATUS"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(29, 78)
        Me.Label4.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(83, 13)
        Me.Label4.TabIndex = 36
        Me.Label4.Text = "DATE OF BIRTH"
        '
        'txtMiddleName
        '
        Me.txtMiddleName.Location = New System.Drawing.Point(100, 87)
        Me.txtMiddleName.Name = "txtMiddleName"
        Me.txtMiddleName.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtMiddleName.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtMiddleName.Size = New System.Drawing.Size(326, 22)
        Me.txtMiddleName.TabIndex = 3
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(19, 93)
        Me.Label3.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(75, 13)
        Me.Label3.TabIndex = 34
        Me.Label3.Text = "MIDDLE NAME"
        '
        'txtFirstName
        '
        Me.txtFirstName.Location = New System.Drawing.Point(100, 60)
        Me.txtFirstName.Name = "txtFirstName"
        Me.txtFirstName.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtFirstName.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtFirstName.Size = New System.Drawing.Size(326, 22)
        Me.txtFirstName.TabIndex = 2
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(19, 64)
        Me.Label2.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(67, 13)
        Me.Label2.TabIndex = 32
        Me.Label2.Text = "FIRST NAME"
        '
        'txtLastName
        '
        Me.txtLastName.Location = New System.Drawing.Point(100, 30)
        Me.txtLastName.Name = "txtLastName"
        Me.txtLastName.Properties.BorderStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.txtLastName.Properties.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtLastName.Size = New System.Drawing.Size(326, 22)
        Me.txtLastName.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(19, 33)
        Me.Label1.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(62, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "LAST NAME"
        '
        'frmStudentAdmissionProfile
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.MediumAquamarine
        Me.ClientSize = New System.Drawing.Size(764, 532)
        Me.Controls.Add(Me.Panel2)
        Me.Controls.Add(Me.Panel1)
        Me.Margin = New System.Windows.Forms.Padding(2)
        Me.Name = "frmStudentAdmissionProfile"
        Me.Padding = New System.Windows.Forms.Padding(8)
        Me.ShowIcon = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "STUDENT PROFILE"
        Me.Panel1.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        CType(Me.GroupControl1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl1.ResumeLayout(False)
        Me.GroupControl1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.GroupControl3, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl3.ResumeLayout(False)
        Me.GroupControl3.PerformLayout()
        CType(Me.txtHighSchool.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtElementary.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GroupControl2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupControl2.ResumeLayout(False)
        Me.GroupControl2.PerformLayout()
        CType(Me.dtpBDay, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtParents.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtAddress.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtPlaceBirth.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtEmail.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.txtContact.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtMiddleName.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtFirstName.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtLastName.Properties, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents Panel1 As Panel
    Friend WithEvents Panel2 As Panel
    Friend WithEvents GroupControl1 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents Label1 As Label
    Friend WithEvents RadioButton2 As RadioButton
    Friend WithEvents RadioButton1 As RadioButton
    Friend WithEvents cmbCivilStatus As ComboBox
    Friend WithEvents Label6 As Label
    Friend WithEvents txtContact As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label5 As Label
    Friend WithEvents Label4 As Label
    Friend WithEvents txtMiddleName As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label3 As Label
    Friend WithEvents txtFirstName As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label2 As Label
    Friend WithEvents txtLastName As DevExpress.XtraEditors.TextEdit
    Friend WithEvents GroupControl2 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents GroupBox1 As GroupBox
    Friend WithEvents GroupControl3 As DevExpress.XtraEditors.GroupControl
    Friend WithEvents txtHighSchool As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label7 As Label
    Friend WithEvents txtElementary As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label8 As Label
    Friend WithEvents btnSave As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents GroupBox2 As GroupBox
    Friend WithEvents txtDisplayName As TextBox
    Friend WithEvents Label12 As Label
    Friend WithEvents Label11 As Label
    Friend WithEvents dtpHighTo As DateTimePicker
    Friend WithEvents dtpHighFrom As DateTimePicker
    Friend WithEvents dtpElemTo As DateTimePicker
    Friend WithEvents dtpElemFrom As DateTimePicker
    Friend WithEvents Label9 As Label
    Friend WithEvents Label10 As Label
    Friend WithEvents txtParents As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label16 As Label
    Friend WithEvents txtAddress As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label15 As Label
    Friend WithEvents txtPlaceBirth As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label14 As Label
    Friend WithEvents txtEmail As DevExpress.XtraEditors.TextEdit
    Friend WithEvents Label13 As Label
    Friend WithEvents dtpBDay As DevComponents.Editors.DateTimeAdv.DateTimeInput
End Class
