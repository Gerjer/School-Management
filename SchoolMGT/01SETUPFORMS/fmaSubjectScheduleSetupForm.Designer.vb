<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class fmaSubjectScheduleSetupForm
    Inherits DevComponents.DotNetBar.Office2007Form

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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(fmaSubjectScheduleSetupForm))
        Me.PanelEx1 = New DevComponents.DotNetBar.PanelEx()
        Me.WinLabel = New DevComponents.DotNetBar.LabelX()
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.btnSave = New DevComponents.DotNetBar.ButtonX()
        Me.btnCancel = New DevComponents.DotNetBar.ButtonX()
        Me.btnAdd = New DevComponents.DotNetBar.ButtonX()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.SimpleButton1 = New DevExpress.XtraEditors.SimpleButton()
        Me.txtday = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.txtname = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtLocation = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX10 = New DevComponents.DotNetBar.LabelX()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.btnAddTime = New DevExpress.XtraEditors.SimpleButton()
        Me.dtpTo = New System.Windows.Forms.DateTimePicker()
        Me.dtpFrom = New System.Windows.Forms.DateTimePicker()
        Me.LabelX8 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX7 = New DevComponents.DotNetBar.LabelX()
        Me.txtcode = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX6 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.txtclass_time = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.txtroom = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX4 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX5 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX2 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX3 = New DevComponents.DotNetBar.LabelX()
        Me.txtemployee_name = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.txtfloor = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX9 = New DevComponents.DotNetBar.LabelX()
        Me.txtday_schedule_id = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtroom_id = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtemployee_id = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtclass_timing_id = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtsubject_id = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.btnModify = New DevComponents.DotNetBar.ButtonX()
        Me.btnList = New DevComponents.DotNetBar.ButtonX()
        Me.txtSysPK_Item = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.PanelEx1.SuspendLayout()
        Me.GroupPanel2.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.Panel1.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'PanelEx1
        '
        Me.PanelEx1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.PanelEx1.CanvasColor = System.Drawing.SystemColors.Control
        Me.PanelEx1.Controls.Add(Me.WinLabel)
        Me.PanelEx1.Dock = System.Windows.Forms.DockStyle.Top
        Me.PanelEx1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.PanelEx1.Location = New System.Drawing.Point(0, 0)
        Me.PanelEx1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.PanelEx1.Name = "PanelEx1"
        Me.PanelEx1.Size = New System.Drawing.Size(524, 34)
        Me.PanelEx1.Style.Alignment = System.Drawing.StringAlignment.Center
        Me.PanelEx1.Style.BackColor1.Color = System.Drawing.Color.Azure
        Me.PanelEx1.Style.BackColor2.Color = System.Drawing.Color.MediumAquamarine
        Me.PanelEx1.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.PanelEx1.Style.BorderColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.PanelEx1.Style.ForeColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.PanelEx1.Style.GradientAngle = 90
        Me.PanelEx1.TabIndex = 0
        '
        'WinLabel
        '
        Me.WinLabel.BackColor = System.Drawing.Color.MediumAquamarine
        Me.WinLabel.Dock = System.Windows.Forms.DockStyle.Top
        Me.WinLabel.Location = New System.Drawing.Point(0, 0)
        Me.WinLabel.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.WinLabel.Name = "WinLabel"
        Me.WinLabel.Size = New System.Drawing.Size(524, 28)
        Me.WinLabel.TabIndex = 20
        Me.WinLabel.Text = "SUBJECT SCHEDULE SETUP"
        Me.WinLabel.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'ComboItem4
        '
        Me.ComboItem4.Text = "Staff"
        '
        'ComboItem3
        '
        Me.ComboItem3.Text = "User"
        '
        'ComboItem2
        '
        Me.ComboItem2.Text = "HR Personnel"
        '
        'ComboItem1
        '
        Me.ComboItem1.Text = "Accounting"
        '
        'GroupPanel2
        '
        Me.GroupPanel2.AutoScroll = True
        Me.GroupPanel2.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel2.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel2.Controls.Add(Me.Panel2)
        Me.GroupPanel2.Controls.Add(Me.Panel1)
        Me.GroupPanel2.Controls.Add(Me.txtroom_id)
        Me.GroupPanel2.Controls.Add(Me.txtemployee_id)
        Me.GroupPanel2.Controls.Add(Me.txtclass_timing_id)
        Me.GroupPanel2.Controls.Add(Me.txtsubject_id)
        Me.GroupPanel2.Controls.Add(Me.btnModify)
        Me.GroupPanel2.Controls.Add(Me.btnList)
        Me.GroupPanel2.Controls.Add(Me.txtSysPK_Item)
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 34)
        Me.GroupPanel2.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Size = New System.Drawing.Size(524, 338)
        '
        '
        '
        Me.GroupPanel2.Style.BackColor = System.Drawing.Color.FromArgb(CType(CType(198, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(198, Byte), Integer))
        Me.GroupPanel2.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel2.Style.BackColorGradientAngle = 90
        Me.GroupPanel2.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel2.Style.BorderBottomWidth = 1
        Me.GroupPanel2.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.GroupPanel2.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel2.Style.BorderLeftWidth = 1
        Me.GroupPanel2.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel2.Style.BorderRightWidth = 1
        Me.GroupPanel2.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel2.Style.BorderTopWidth = 1
        Me.GroupPanel2.Style.CornerDiameter = 4
        Me.GroupPanel2.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded
        Me.GroupPanel2.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center
        Me.GroupPanel2.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.GroupPanel2.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel2.TabIndex = 15
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.Color.Transparent
        Me.Panel2.Controls.Add(Me.btnSave)
        Me.Panel2.Controls.Add(Me.btnCancel)
        Me.Panel2.Controls.Add(Me.btnAdd)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel2.Location = New System.Drawing.Point(0, 284)
        Me.Panel2.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Padding = New System.Windows.Forms.Padding(5, 5, 5, 5)
        Me.Panel2.Size = New System.Drawing.Size(518, 48)
        Me.Panel2.TabIndex = 161
        '
        'btnSave
        '
        Me.btnSave.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSave.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnSave.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnSave.Location = New System.Drawing.Point(141, 5)
        Me.btnSave.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.btnSave.Size = New System.Drawing.Size(124, 38)
        Me.btnSave.TabIndex = 6
        Me.btnSave.Text = "Save"
        '
        'btnCancel
        '
        Me.btnCancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnCancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnCancel.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnCancel.Location = New System.Drawing.Point(265, 5)
        Me.btnCancel.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnCancel.Name = "btnCancel"
        Me.btnCancel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.btnCancel.Size = New System.Drawing.Size(124, 38)
        Me.btnCancel.TabIndex = 7
        Me.btnCancel.Text = "Cancel"
        '
        'btnAdd
        '
        Me.btnAdd.AccessibleRole = System.Windows.Forms.AccessibleRole.None
        Me.btnAdd.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnAdd.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnAdd.Image = CType(resources.GetObject("btnAdd.Image"), System.Drawing.Image)
        Me.btnAdd.Location = New System.Drawing.Point(389, 5)
        Me.btnAdd.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnAdd.Name = "btnAdd"
        Me.btnAdd.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlA)
        Me.btnAdd.Size = New System.Drawing.Size(124, 38)
        Me.btnAdd.TabIndex = 8
        Me.btnAdd.Text = "Add"
        Me.btnAdd.Visible = False
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.Transparent
        Me.Panel1.Controls.Add(Me.SimpleButton1)
        Me.Panel1.Controls.Add(Me.txtday)
        Me.Panel1.Controls.Add(Me.txtname)
        Me.Panel1.Controls.Add(Me.txtLocation)
        Me.Panel1.Controls.Add(Me.LabelX10)
        Me.Panel1.Controls.Add(Me.GroupBox1)
        Me.Panel1.Controls.Add(Me.txtcode)
        Me.Panel1.Controls.Add(Me.LabelX6)
        Me.Panel1.Controls.Add(Me.LabelX1)
        Me.Panel1.Controls.Add(Me.txtclass_time)
        Me.Panel1.Controls.Add(Me.txtroom)
        Me.Panel1.Controls.Add(Me.LabelX4)
        Me.Panel1.Controls.Add(Me.LabelX5)
        Me.Panel1.Controls.Add(Me.LabelX2)
        Me.Panel1.Controls.Add(Me.LabelX3)
        Me.Panel1.Controls.Add(Me.txtemployee_name)
        Me.Panel1.Controls.Add(Me.txtfloor)
        Me.Panel1.Controls.Add(Me.LabelX9)
        Me.Panel1.Controls.Add(Me.txtday_schedule_id)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(518, 332)
        Me.Panel1.TabIndex = 160
        '
        'SimpleButton1
        '
        Me.SimpleButton1.ButtonStyle = DevExpress.XtraEditors.Controls.BorderStyles.Style3D
        Me.SimpleButton1.ImageOptions.Image = CType(resources.GetObject("SimpleButton1.ImageOptions.Image"), System.Drawing.Image)
        Me.SimpleButton1.Location = New System.Drawing.Point(473, 59)
        Me.SimpleButton1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.SimpleButton1.Name = "SimpleButton1"
        Me.SimpleButton1.Size = New System.Drawing.Size(35, 22)
        Me.SimpleButton1.TabIndex = 168
        Me.SimpleButton1.Text = "SimpleButton1"
        '
        'txtday
        '
        Me.txtday.AccessibleDescription = "day_name"
        Me.txtday.AccessibleName = "subject_class_schedule"
        Me.txtday.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Suggest
        Me.txtday.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.txtday.CommandParameter = "day_schedule"
        Me.txtday.DisplayMember = "Text"
        Me.txtday.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.txtday.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtday.FocusHighlightEnabled = True
        Me.txtday.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtday.FormattingEnabled = True
        Me.txtday.ItemHeight = 14
        Me.txtday.Location = New System.Drawing.Point(168, 57)
        Me.txtday.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtday.Name = "txtday"
        Me.txtday.Size = New System.Drawing.Size(301, 20)
        Me.txtday.TabIndex = 166
        Me.txtday.Tag = "SCHEDULE DAY"
        '
        'txtname
        '
        Me.txtname.AccessibleName = "subject_class_schedule"
        Me.txtname.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtname.FocusHighlightEnabled = True
        Me.txtname.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtname.Location = New System.Drawing.Point(173, 262)
        Me.txtname.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtname.MaxLength = 30
        Me.txtname.Name = "txtname"
        Me.txtname.Size = New System.Drawing.Size(297, 15)
        Me.txtname.TabIndex = 165
        Me.txtname.Visible = False
        Me.txtname.WatermarkFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtname.WatermarkText = "ex. M-W-F , T-TH, Sat"
        '
        'txtLocation
        '
        Me.txtLocation.AccessibleName = "subject_class_schedule"
        '
        '
        '
        Me.txtLocation.Border.Class = "TextBoxBorder"
        Me.txtLocation.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtLocation.FocusHighlightEnabled = True
        Me.txtLocation.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtLocation.Location = New System.Drawing.Point(168, 169)
        Me.txtLocation.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtLocation.MaxLength = 30
        Me.txtLocation.Name = "txtLocation"
        Me.txtLocation.Size = New System.Drawing.Size(304, 22)
        Me.txtLocation.TabIndex = 163
        '
        'LabelX10
        '
        Me.LabelX10.AutoSize = True
        Me.LabelX10.BackColor = System.Drawing.Color.Transparent
        Me.LabelX10.Location = New System.Drawing.Point(33, 171)
        Me.LabelX10.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX10.Name = "LabelX10"
        Me.LabelX10.Size = New System.Drawing.Size(69, 17)
        Me.LabelX10.TabIndex = 164
        Me.LabelX10.Text = "LOCATION"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.btnAddTime)
        Me.GroupBox1.Controls.Add(Me.dtpTo)
        Me.GroupBox1.Controls.Add(Me.dtpFrom)
        Me.GroupBox1.Controls.Add(Me.LabelX8)
        Me.GroupBox1.Controls.Add(Me.LabelX7)
        Me.GroupBox1.Location = New System.Drawing.Point(32, 263)
        Me.GroupBox1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Padding = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.GroupBox1.Size = New System.Drawing.Size(69, 16)
        Me.GroupBox1.TabIndex = 160
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "SCHEDULE TIME"
        Me.GroupBox1.Visible = False
        '
        'btnAddTime
        '
        Me.btnAddTime.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnAddTime.ImageOptions.Image = CType(resources.GetObject("btnAddTime.ImageOptions.Image"), System.Drawing.Image)
        Me.btnAddTime.Location = New System.Drawing.Point(368, 22)
        Me.btnAddTime.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnAddTime.Name = "btnAddTime"
        Me.btnAddTime.Size = New System.Drawing.Size(51, 42)
        Me.btnAddTime.TabIndex = 156
        '
        'dtpTo
        '
        Me.dtpTo.CustomFormat = "h:mm tt"
        Me.dtpTo.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpTo.Location = New System.Drawing.Point(205, 43)
        Me.dtpTo.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.dtpTo.Name = "dtpTo"
        Me.dtpTo.Size = New System.Drawing.Size(156, 22)
        Me.dtpTo.TabIndex = 155
        '
        'dtpFrom
        '
        Me.dtpFrom.CustomFormat = "h:mm tt"
        Me.dtpFrom.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.dtpFrom.Location = New System.Drawing.Point(205, 16)
        Me.dtpFrom.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.dtpFrom.Name = "dtpFrom"
        Me.dtpFrom.Size = New System.Drawing.Size(156, 22)
        Me.dtpFrom.TabIndex = 154
        '
        'LabelX8
        '
        Me.LabelX8.AutoSize = True
        Me.LabelX8.BackColor = System.Drawing.Color.Transparent
        Me.LabelX8.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX8.Location = New System.Drawing.Point(148, 46)
        Me.LabelX8.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX8.Name = "LabelX8"
        Me.LabelX8.Size = New System.Drawing.Size(21, 17)
        Me.LabelX8.TabIndex = 153
        Me.LabelX8.Text = "TO"
        '
        'LabelX7
        '
        Me.LabelX7.AutoSize = True
        Me.LabelX7.BackColor = System.Drawing.Color.Transparent
        Me.LabelX7.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX7.Location = New System.Drawing.Point(141, 21)
        Me.LabelX7.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX7.Name = "LabelX7"
        Me.LabelX7.Size = New System.Drawing.Size(41, 17)
        Me.LabelX7.TabIndex = 152
        Me.LabelX7.Text = "FROM"
        '
        'txtcode
        '
        Me.txtcode.AccessibleName = "subject_class_schedule"
        '
        '
        '
        Me.txtcode.Border.Class = "TextBoxBorder"
        Me.txtcode.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtcode.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtcode.Location = New System.Drawing.Point(169, 21)
        Me.txtcode.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtcode.Name = "txtcode"
        Me.txtcode.Size = New System.Drawing.Size(304, 22)
        Me.txtcode.TabIndex = 1
        '
        'LabelX6
        '
        Me.LabelX6.BackColor = System.Drawing.Color.Transparent
        Me.LabelX6.ForeColor = System.Drawing.SystemColors.AppWorkspace
        Me.LabelX6.Location = New System.Drawing.Point(173, 236)
        Me.LabelX6.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX6.Name = "LabelX6"
        Me.LabelX6.Size = New System.Drawing.Size(292, 18)
        Me.LabelX6.TabIndex = 159
        Me.LabelX6.Text = "* Required to Fill Out All Fields."
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.BackColor = System.Drawing.Color.Transparent
        Me.LabelX1.Location = New System.Drawing.Point(32, 27)
        Me.LabelX1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(86, 17)
        Me.LabelX1.TabIndex = 15
        Me.LabelX1.Text = "CLASS CODE"
        '
        'txtclass_time
        '
        Me.txtclass_time.AccessibleName = "subject_class_schedule"
        Me.txtclass_time.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.txtclass_time.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.txtclass_time.DisplayMember = "Text"
        Me.txtclass_time.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.txtclass_time.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtclass_time.FocusHighlightEnabled = True
        Me.txtclass_time.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtclass_time.FormattingEnabled = True
        Me.txtclass_time.ItemHeight = 14
        Me.txtclass_time.Location = New System.Drawing.Point(169, 96)
        Me.txtclass_time.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtclass_time.Name = "txtclass_time"
        Me.txtclass_time.Size = New System.Drawing.Size(300, 20)
        Me.txtclass_time.TabIndex = 4
        '
        'txtroom
        '
        Me.txtroom.AccessibleName = "subject_class_schedule"
        Me.txtroom.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.txtroom.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.txtroom.DisplayMember = "Text"
        Me.txtroom.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.txtroom.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtroom.FocusHighlightEnabled = True
        Me.txtroom.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtroom.FormattingEnabled = True
        Me.txtroom.ItemHeight = 14
        Me.txtroom.Location = New System.Drawing.Point(169, 132)
        Me.txtroom.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtroom.Name = "txtroom"
        Me.txtroom.Size = New System.Drawing.Size(303, 20)
        Me.txtroom.TabIndex = 3
        '
        'LabelX4
        '
        Me.LabelX4.AutoSize = True
        Me.LabelX4.BackColor = System.Drawing.Color.Transparent
        Me.LabelX4.Location = New System.Drawing.Point(31, 102)
        Me.LabelX4.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX4.Name = "LabelX4"
        Me.LabelX4.Size = New System.Drawing.Size(39, 17)
        Me.LabelX4.TabIndex = 151
        Me.LabelX4.Text = "TIME*"
        '
        'LabelX5
        '
        Me.LabelX5.AutoSize = True
        Me.LabelX5.BackColor = System.Drawing.Color.Transparent
        Me.LabelX5.Location = New System.Drawing.Point(32, 138)
        Me.LabelX5.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX5.Name = "LabelX5"
        Me.LabelX5.Size = New System.Drawing.Size(51, 17)
        Me.LabelX5.TabIndex = 156
        Me.LabelX5.Text = "ROOM *"
        '
        'LabelX2
        '
        Me.LabelX2.AutoSize = True
        Me.LabelX2.BackColor = System.Drawing.Color.Transparent
        Me.LabelX2.Location = New System.Drawing.Point(32, 63)
        Me.LabelX2.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX2.Name = "LabelX2"
        Me.LabelX2.Size = New System.Drawing.Size(103, 17)
        Me.LabelX2.TabIndex = 17
        Me.LabelX2.Text = "SCHEDULE DAY"
        '
        'LabelX3
        '
        Me.LabelX3.AutoSize = True
        Me.LabelX3.BackColor = System.Drawing.Color.Transparent
        Me.LabelX3.Location = New System.Drawing.Point(29, 209)
        Me.LabelX3.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX3.Name = "LabelX3"
        Me.LabelX3.Size = New System.Drawing.Size(93, 17)
        Me.LabelX3.TabIndex = 150
        Me.LabelX3.Text = "INSTRUCTOR*"
        '
        'txtemployee_name
        '
        Me.txtemployee_name.AccessibleName = "subject_class_schedule"
        Me.txtemployee_name.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.txtemployee_name.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.txtemployee_name.DisplayMember = "Text"
        Me.txtemployee_name.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.txtemployee_name.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtemployee_name.FocusHighlightEnabled = True
        Me.txtemployee_name.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtemployee_name.FormattingEnabled = True
        Me.txtemployee_name.ItemHeight = 14
        Me.txtemployee_name.Location = New System.Drawing.Point(167, 206)
        Me.txtemployee_name.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtemployee_name.Name = "txtemployee_name"
        Me.txtemployee_name.Size = New System.Drawing.Size(303, 20)
        Me.txtemployee_name.TabIndex = 5
        '
        'txtfloor
        '
        Me.txtfloor.AccessibleName = "subject_class_schedule"
        '
        '
        '
        Me.txtfloor.Border.Class = "TextBoxBorder"
        Me.txtfloor.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtfloor.FocusHighlightEnabled = True
        Me.txtfloor.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtfloor.Location = New System.Drawing.Point(369, 133)
        Me.txtfloor.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtfloor.MaxLength = 30
        Me.txtfloor.Name = "txtfloor"
        Me.txtfloor.Size = New System.Drawing.Size(51, 22)
        Me.txtfloor.TabIndex = 161
        Me.txtfloor.Visible = False
        '
        'LabelX9
        '
        Me.LabelX9.AutoSize = True
        Me.LabelX9.BackColor = System.Drawing.Color.Transparent
        Me.LabelX9.Location = New System.Drawing.Point(232, 135)
        Me.LabelX9.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX9.Name = "LabelX9"
        Me.LabelX9.Size = New System.Drawing.Size(109, 17)
        Me.LabelX9.TabIndex = 162
        Me.LabelX9.Text = "ROOMS DETAILS"
        Me.LabelX9.Visible = False
        '
        'txtday_schedule_id
        '
        Me.txtday_schedule_id.AccessibleName = "subject_class_schedule"
        '
        '
        '
        Me.txtday_schedule_id.Border.Class = "TextBoxBorder"
        Me.txtday_schedule_id.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtday_schedule_id.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtday_schedule_id.FocusHighlightEnabled = True
        Me.txtday_schedule_id.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtday_schedule_id.Location = New System.Drawing.Point(357, 57)
        Me.txtday_schedule_id.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtday_schedule_id.MaxLength = 30
        Me.txtday_schedule_id.Name = "txtday_schedule_id"
        Me.txtday_schedule_id.Size = New System.Drawing.Size(37, 22)
        Me.txtday_schedule_id.TabIndex = 167
        Me.txtday_schedule_id.Visible = False
        Me.txtday_schedule_id.WatermarkFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        '
        'txtroom_id
        '
        Me.txtroom_id.AccessibleName = "subject_class_schedule"
        '
        '
        '
        Me.txtroom_id.Border.Class = "TextBoxBorder"
        Me.txtroom_id.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtroom_id.FocusHighlightEnabled = True
        Me.txtroom_id.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtroom_id.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtroom_id.Location = New System.Drawing.Point(311, 133)
        Me.txtroom_id.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtroom_id.Name = "txtroom_id"
        Me.txtroom_id.Size = New System.Drawing.Size(29, 23)
        Me.txtroom_id.TabIndex = 158
        Me.txtroom_id.TabStop = False
        Me.txtroom_id.Tag = ""
        Me.txtroom_id.Visible = False
        '
        'txtemployee_id
        '
        Me.txtemployee_id.AccessibleName = "subject_class_schedule"
        '
        '
        '
        Me.txtemployee_id.Border.Class = "TextBoxBorder"
        Me.txtemployee_id.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtemployee_id.FocusHighlightEnabled = True
        Me.txtemployee_id.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtemployee_id.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtemployee_id.Location = New System.Drawing.Point(311, 210)
        Me.txtemployee_id.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtemployee_id.Name = "txtemployee_id"
        Me.txtemployee_id.Size = New System.Drawing.Size(29, 23)
        Me.txtemployee_id.TabIndex = 155
        Me.txtemployee_id.TabStop = False
        Me.txtemployee_id.Tag = ""
        Me.txtemployee_id.Visible = False
        '
        'txtclass_timing_id
        '
        Me.txtclass_timing_id.AccessibleName = "subject_class_schedule"
        Me.txtclass_timing_id.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtclass_timing_id.FocusHighlightEnabled = True
        Me.txtclass_timing_id.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtclass_timing_id.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtclass_timing_id.Location = New System.Drawing.Point(311, 172)
        Me.txtclass_timing_id.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtclass_timing_id.Name = "txtclass_timing_id"
        Me.txtclass_timing_id.Size = New System.Drawing.Size(29, 16)
        Me.txtclass_timing_id.TabIndex = 154
        Me.txtclass_timing_id.TabStop = False
        Me.txtclass_timing_id.Tag = ""
        Me.txtclass_timing_id.Visible = False
        '
        'txtsubject_id
        '
        Me.txtsubject_id.AccessibleName = "subject_class_schedule"
        Me.txtsubject_id.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtsubject_id.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtsubject_id.FocusHighlightEnabled = True
        Me.txtsubject_id.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtsubject_id.Location = New System.Drawing.Point(171, 1)
        Me.txtsubject_id.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtsubject_id.MaxLength = 30
        Me.txtsubject_id.Name = "txtsubject_id"
        Me.txtsubject_id.Size = New System.Drawing.Size(169, 15)
        Me.txtsubject_id.TabIndex = 153
        Me.txtsubject_id.TabStop = False
        Me.txtsubject_id.Visible = False
        '
        'btnModify
        '
        Me.btnModify.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnModify.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnModify.Image = CType(resources.GetObject("btnModify.Image"), System.Drawing.Image)
        Me.btnModify.Location = New System.Drawing.Point(275, 79)
        Me.btnModify.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnModify.Name = "btnModify"
        Me.btnModify.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlD)
        Me.btnModify.Size = New System.Drawing.Size(65, 38)
        Me.btnModify.TabIndex = 148
        Me.btnModify.Text = "Modify"
        Me.btnModify.Visible = False
        '
        'btnList
        '
        Me.btnList.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnList.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnList.Image = CType(resources.GetObject("btnList.Image"), System.Drawing.Image)
        Me.btnList.Location = New System.Drawing.Point(275, 33)
        Me.btnList.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnList.Name = "btnList"
        Me.btnList.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlL)
        Me.btnList.Size = New System.Drawing.Size(65, 38)
        Me.btnList.TabIndex = 20
        Me.btnList.Text = "List's"
        Me.btnList.Visible = False
        '
        'txtSysPK_Item
        '
        Me.txtSysPK_Item.AccessibleName = ""
        '
        '
        '
        Me.txtSysPK_Item.Border.Class = "TextBoxBorder"
        Me.txtSysPK_Item.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtSysPK_Item.FocusHighlightEnabled = True
        Me.txtSysPK_Item.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtSysPK_Item.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtSysPK_Item.Location = New System.Drawing.Point(396, -1)
        Me.txtSysPK_Item.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtSysPK_Item.Name = "txtSysPK_Item"
        Me.txtSysPK_Item.Size = New System.Drawing.Size(65, 23)
        Me.txtSysPK_Item.TabIndex = 19
        Me.txtSysPK_Item.TabStop = False
        Me.txtSysPK_Item.Tag = "subject_class_schedule"
        Me.txtSysPK_Item.Visible = False
        '
        'fmaSubjectScheduleSetupForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(524, 372)
        Me.ControlBox = False
        Me.Controls.Add(Me.GroupPanel2)
        Me.Controls.Add(Me.PanelEx1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.MaximumSize = New System.Drawing.Size(542, 419)
        Me.MinimumSize = New System.Drawing.Size(542, 419)
        Me.Name = "fmaSubjectScheduleSetupForm"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "SUBJECT SCHEDULE"
        Me.PanelEx1.ResumeLayout(False)
        Me.GroupPanel2.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents PanelEx1 As DevComponents.DotNetBar.PanelEx
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents txtSysPK_Item As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtcode As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX2 As DevComponents.DotNetBar.LabelX
    Friend WithEvents WinLabel As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnList As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnAdd As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnSave As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnCancel As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnModify As DevComponents.DotNetBar.ButtonX
    Friend WithEvents txtemployee_name As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX3 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX4 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtclass_time As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents txtsubject_id As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtclass_timing_id As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtemployee_id As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtroom_id As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtroom As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX5 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX6 As DevComponents.DotNetBar.LabelX
    Friend WithEvents Panel2 As Panel
    Friend WithEvents Panel1 As Panel
    Friend WithEvents GroupBox1 As GroupBox
    Friend WithEvents btnAddTime As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents dtpTo As DateTimePicker
    Friend WithEvents dtpFrom As DateTimePicker
    Friend WithEvents LabelX8 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX7 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtLocation As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX10 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtfloor As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX9 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtname As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtday As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents txtday_schedule_id As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents SimpleButton1 As DevExpress.XtraEditors.SimpleButton
End Class
