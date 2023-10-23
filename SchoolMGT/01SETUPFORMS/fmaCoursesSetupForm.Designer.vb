<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class fmaCoursesSetupForm
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(fmaCoursesSetupForm))
        Me.PanelEx1 = New DevComponents.DotNetBar.PanelEx()
        Me.WinLabel = New DevComponents.DotNetBar.LabelX()
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.txtdescription = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX5 = New DevComponents.DotNetBar.LabelX()
        Me.btnCourselist = New DevExpress.XtraEditors.SimpleButton()
        Me.LabelX4 = New DevComponents.DotNetBar.LabelX()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.btnSave = New DevComponents.DotNetBar.ButtonX()
        Me.btnCancel = New DevComponents.DotNetBar.ButtonX()
        Me.btnAdd = New DevComponents.DotNetBar.ButtonX()
        Me.txtsection_name = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX3 = New DevComponents.DotNetBar.LabelX()
        Me.txtcategory_name = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX2 = New DevComponents.DotNetBar.LabelX()
        Me.txtcode = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.txtcourse_name = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX7 = New DevComponents.DotNetBar.LabelX()
        Me.txtid = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtSysPK = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.btnModify = New DevComponents.DotNetBar.ButtonX()
        Me.btnList = New DevComponents.DotNetBar.ButtonX()
        Me.txtcategory_id = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtdean_name = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX6 = New DevComponents.DotNetBar.LabelX()
        Me.PanelEx1.SuspendLayout()
        Me.GroupPanel2.SuspendLayout()
        Me.Panel1.SuspendLayout()
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
        Me.PanelEx1.Size = New System.Drawing.Size(537, 34)
        Me.PanelEx1.Style.Alignment = System.Drawing.StringAlignment.Center
        Me.PanelEx1.Style.BackColor1.Color = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.PanelEx1.Style.BackColor2.Color = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.PanelEx1.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.PanelEx1.Style.BorderColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.PanelEx1.Style.ForeColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.PanelEx1.Style.GradientAngle = 90
        Me.PanelEx1.TabIndex = 0
        '
        'WinLabel
        '
        Me.WinLabel.Dock = System.Windows.Forms.DockStyle.Top
        Me.WinLabel.Location = New System.Drawing.Point(0, 0)
        Me.WinLabel.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.WinLabel.Name = "WinLabel"
        Me.WinLabel.Size = New System.Drawing.Size(537, 28)
        Me.WinLabel.TabIndex = 20
        Me.WinLabel.Text = "COURSE / GRADE LEVEL"
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
        Me.GroupPanel2.Controls.Add(Me.txtdean_name)
        Me.GroupPanel2.Controls.Add(Me.LabelX6)
        Me.GroupPanel2.Controls.Add(Me.txtdescription)
        Me.GroupPanel2.Controls.Add(Me.LabelX5)
        Me.GroupPanel2.Controls.Add(Me.btnCourselist)
        Me.GroupPanel2.Controls.Add(Me.LabelX4)
        Me.GroupPanel2.Controls.Add(Me.Panel1)
        Me.GroupPanel2.Controls.Add(Me.txtsection_name)
        Me.GroupPanel2.Controls.Add(Me.LabelX3)
        Me.GroupPanel2.Controls.Add(Me.txtcategory_name)
        Me.GroupPanel2.Controls.Add(Me.LabelX2)
        Me.GroupPanel2.Controls.Add(Me.txtcode)
        Me.GroupPanel2.Controls.Add(Me.LabelX1)
        Me.GroupPanel2.Controls.Add(Me.txtcourse_name)
        Me.GroupPanel2.Controls.Add(Me.LabelX7)
        Me.GroupPanel2.Controls.Add(Me.txtid)
        Me.GroupPanel2.Controls.Add(Me.txtSysPK)
        Me.GroupPanel2.Controls.Add(Me.btnModify)
        Me.GroupPanel2.Controls.Add(Me.btnList)
        Me.GroupPanel2.Controls.Add(Me.txtcategory_id)
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 34)
        Me.GroupPanel2.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Padding = New System.Windows.Forms.Padding(0, 0, 7, 6)
        Me.GroupPanel2.Size = New System.Drawing.Size(537, 409)
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
        'txtdescription
        '
        Me.txtdescription.AccessibleName = "courses"
        '
        '
        '
        Me.txtdescription.Border.Class = "TextBoxBorder"
        Me.txtdescription.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtdescription.FocusHighlightEnabled = True
        Me.txtdescription.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtdescription.Location = New System.Drawing.Point(217, 236)
        Me.txtdescription.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtdescription.Multiline = True
        Me.txtdescription.Name = "txtdescription"
        Me.txtdescription.Size = New System.Drawing.Size(293, 57)
        Me.txtdescription.TabIndex = 184
        '
        'LabelX5
        '
        Me.LabelX5.AutoSize = True
        Me.LabelX5.BackColor = System.Drawing.Color.Transparent
        Me.LabelX5.Location = New System.Drawing.Point(36, 236)
        Me.LabelX5.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX5.Name = "LabelX5"
        Me.LabelX5.Size = New System.Drawing.Size(91, 17)
        Me.LabelX5.TabIndex = 183
        Me.LabelX5.Text = "DESCRIPTION"
        '
        'btnCourselist
        '
        Me.btnCourselist.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.btnCourselist.ImageOptions.Image = CType(resources.GetObject("btnCourselist.ImageOptions.Image"), System.Drawing.Image)
        Me.btnCourselist.Location = New System.Drawing.Point(217, 62)
        Me.btnCourselist.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnCourselist.Name = "btnCourselist"
        Me.btnCourselist.Size = New System.Drawing.Size(56, 42)
        Me.btnCourselist.TabIndex = 182
        '
        'LabelX4
        '
        Me.LabelX4.AutoSize = True
        Me.LabelX4.BackColor = System.Drawing.Color.Transparent
        Me.LabelX4.Location = New System.Drawing.Point(36, 75)
        Me.LabelX4.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX4.Name = "LabelX4"
        Me.LabelX4.Size = New System.Drawing.Size(89, 17)
        Me.LabelX4.TabIndex = 181
        Me.LabelX4.Text = "COURSE LIST"
        '
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.Transparent
        Me.Panel1.Controls.Add(Me.btnSave)
        Me.Panel1.Controls.Add(Me.btnCancel)
        Me.Panel1.Controls.Add(Me.btnAdd)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 358)
        Me.Panel1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(524, 39)
        Me.Panel1.TabIndex = 180
        '
        'btnSave
        '
        Me.btnSave.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSave.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnSave.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnSave.Location = New System.Drawing.Point(152, 0)
        Me.btnSave.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.btnSave.Size = New System.Drawing.Size(124, 39)
        Me.btnSave.TabIndex = 11
        Me.btnSave.Text = "Save"
        '
        'btnCancel
        '
        Me.btnCancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnCancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnCancel.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnCancel.Location = New System.Drawing.Point(276, 0)
        Me.btnCancel.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnCancel.Name = "btnCancel"
        Me.btnCancel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.btnCancel.Size = New System.Drawing.Size(124, 39)
        Me.btnCancel.TabIndex = 12
        Me.btnCancel.Text = "Cancel"
        '
        'btnAdd
        '
        Me.btnAdd.AccessibleRole = System.Windows.Forms.AccessibleRole.None
        Me.btnAdd.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnAdd.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnAdd.Image = CType(resources.GetObject("btnAdd.Image"), System.Drawing.Image)
        Me.btnAdd.Location = New System.Drawing.Point(400, 0)
        Me.btnAdd.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnAdd.Name = "btnAdd"
        Me.btnAdd.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlA)
        Me.btnAdd.Size = New System.Drawing.Size(124, 39)
        Me.btnAdd.TabIndex = 13
        Me.btnAdd.Text = "Add"
        Me.btnAdd.Visible = False
        '
        'txtsection_name
        '
        Me.txtsection_name.AccessibleName = "courses"
        '
        '
        '
        Me.txtsection_name.Border.Class = "TextBoxBorder"
        Me.txtsection_name.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtsection_name.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtsection_name.FocusHighlightEnabled = True
        Me.txtsection_name.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtsection_name.Location = New System.Drawing.Point(217, 204)
        Me.txtsection_name.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtsection_name.Name = "txtsection_name"
        Me.txtsection_name.Size = New System.Drawing.Size(293, 22)
        Me.txtsection_name.TabIndex = 178
        '
        'LabelX3
        '
        Me.LabelX3.AutoSize = True
        Me.LabelX3.BackColor = System.Drawing.Color.Transparent
        Me.LabelX3.Location = New System.Drawing.Point(36, 207)
        Me.LabelX3.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX3.Name = "LabelX3"
        Me.LabelX3.Size = New System.Drawing.Size(116, 17)
        Me.LabelX3.TabIndex = 179
        Me.LabelX3.Text = "MAJOR / SECTION"
        '
        'txtcategory_name
        '
        Me.txtcategory_name.AccessibleName = "courses"
        Me.txtcategory_name.DisplayMember = "Text"
        Me.txtcategory_name.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.txtcategory_name.FormattingEnabled = True
        Me.txtcategory_name.ItemHeight = 14
        Me.txtcategory_name.Location = New System.Drawing.Point(217, 31)
        Me.txtcategory_name.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtcategory_name.Name = "txtcategory_name"
        Me.txtcategory_name.Size = New System.Drawing.Size(292, 20)
        Me.txtcategory_name.TabIndex = 176
        '
        'LabelX2
        '
        Me.LabelX2.AutoSize = True
        Me.LabelX2.BackColor = System.Drawing.Color.Transparent
        Me.LabelX2.Location = New System.Drawing.Point(36, 37)
        Me.LabelX2.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX2.Name = "LabelX2"
        Me.LabelX2.Size = New System.Drawing.Size(140, 17)
        Me.LabelX2.TabIndex = 175
        Me.LabelX2.Text = "STUDENT CATEGORY"
        '
        'txtcode
        '
        Me.txtcode.AccessibleName = "courses"
        '
        '
        '
        Me.txtcode.Border.Class = "TextBoxBorder"
        Me.txtcode.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtcode.FocusHighlightEnabled = True
        Me.txtcode.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtcode.Location = New System.Drawing.Point(217, 110)
        Me.txtcode.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtcode.Name = "txtcode"
        Me.txtcode.Size = New System.Drawing.Size(293, 22)
        Me.txtcode.TabIndex = 173
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.BackColor = System.Drawing.Color.Transparent
        Me.LabelX1.Location = New System.Drawing.Point(36, 116)
        Me.LabelX1.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(99, 17)
        Me.LabelX1.TabIndex = 174
        Me.LabelX1.Text = "COURSE CODE"
        '
        'txtcourse_name
        '
        Me.txtcourse_name.AccessibleName = "courses"
        '
        '
        '
        Me.txtcourse_name.Border.Class = "TextBoxBorder"
        Me.txtcourse_name.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtcourse_name.FocusHighlightEnabled = True
        Me.txtcourse_name.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtcourse_name.Location = New System.Drawing.Point(217, 139)
        Me.txtcourse_name.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtcourse_name.Multiline = True
        Me.txtcourse_name.Name = "txtcourse_name"
        Me.txtcourse_name.Size = New System.Drawing.Size(293, 58)
        Me.txtcourse_name.TabIndex = 171
        '
        'LabelX7
        '
        Me.LabelX7.AutoSize = True
        Me.LabelX7.BackColor = System.Drawing.Color.Transparent
        Me.LabelX7.Location = New System.Drawing.Point(36, 145)
        Me.LabelX7.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.LabelX7.Name = "LabelX7"
        Me.LabelX7.Size = New System.Drawing.Size(99, 17)
        Me.LabelX7.TabIndex = 172
        Me.LabelX7.Text = "COURSE NAME"
        '
        'txtid
        '
        Me.txtid.AccessibleName = "courses"
        '
        '
        '
        Me.txtid.Border.Class = "TextBoxBorder"
        Me.txtid.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtid.FocusHighlightEnabled = True
        Me.txtid.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtid.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtid.Location = New System.Drawing.Point(396, -4)
        Me.txtid.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtid.Name = "txtid"
        Me.txtid.Size = New System.Drawing.Size(51, 23)
        Me.txtid.TabIndex = 19
        Me.txtid.Tag = ""
        Me.txtid.Visible = False
        '
        'txtSysPK
        '
        Me.txtSysPK.AccessibleName = ""
        '
        '
        '
        Me.txtSysPK.Border.Class = "TextBoxBorder"
        Me.txtSysPK.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtSysPK.FocusHighlightEnabled = True
        Me.txtSysPK.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtSysPK.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtSysPK.Location = New System.Drawing.Point(337, -2)
        Me.txtSysPK.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtSysPK.Name = "txtSysPK"
        Me.txtSysPK.Size = New System.Drawing.Size(51, 23)
        Me.txtSysPK.TabIndex = 19
        Me.txtSysPK.Tag = "courses"
        Me.txtSysPK.Visible = False
        '
        'btnModify
        '
        Me.btnModify.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnModify.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnModify.Image = CType(resources.GetObject("btnModify.Image"), System.Drawing.Image)
        Me.btnModify.Location = New System.Drawing.Point(343, 97)
        Me.btnModify.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnModify.Name = "btnModify"
        Me.btnModify.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlD)
        Me.btnModify.Size = New System.Drawing.Size(13, 38)
        Me.btnModify.TabIndex = 148
        Me.btnModify.Text = "Modify"
        Me.btnModify.Visible = False
        '
        'btnList
        '
        Me.btnList.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnList.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnList.Image = CType(resources.GetObject("btnList.Image"), System.Drawing.Image)
        Me.btnList.Location = New System.Drawing.Point(416, 97)
        Me.btnList.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.btnList.Name = "btnList"
        Me.btnList.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlL)
        Me.btnList.Size = New System.Drawing.Size(13, 38)
        Me.btnList.TabIndex = 20
        Me.btnList.Text = "List's"
        Me.btnList.Visible = False
        '
        'txtcategory_id
        '
        Me.txtcategory_id.AccessibleName = "courses"
        '
        '
        '
        Me.txtcategory_id.Border.Class = "TextBoxBorder"
        Me.txtcategory_id.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtcategory_id.FocusHighlightEnabled = True
        Me.txtcategory_id.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtcategory_id.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtcategory_id.Location = New System.Drawing.Point(391, 31)
        Me.txtcategory_id.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.txtcategory_id.Name = "txtcategory_id"
        Me.txtcategory_id.Size = New System.Drawing.Size(51, 23)
        Me.txtcategory_id.TabIndex = 177
        Me.txtcategory_id.Tag = ""
        Me.txtcategory_id.Visible = False
        '
        'txtdean_name
        '
        Me.txtdean_name.AccessibleName = "courses"
        '
        '
        '
        Me.txtdean_name.Border.Class = "TextBoxBorder"
        Me.txtdean_name.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtdean_name.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtdean_name.FocusHighlightEnabled = True
        Me.txtdean_name.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtdean_name.Location = New System.Drawing.Point(217, 301)
        Me.txtdean_name.Margin = New System.Windows.Forms.Padding(4)
        Me.txtdean_name.Name = "txtdean_name"
        Me.txtdean_name.Size = New System.Drawing.Size(293, 22)
        Me.txtdean_name.TabIndex = 185
        '
        'LabelX6
        '
        Me.LabelX6.AutoSize = True
        Me.LabelX6.BackColor = System.Drawing.Color.Transparent
        Me.LabelX6.Location = New System.Drawing.Point(36, 304)
        Me.LabelX6.Margin = New System.Windows.Forms.Padding(4)
        Me.LabelX6.Name = "LabelX6"
        Me.LabelX6.Size = New System.Drawing.Size(89, 17)
        Me.LabelX6.TabIndex = 186
        Me.LabelX6.Text = "DEAN'S HEAD"
        '
        'fmaCoursesSetupForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.OrangeRed
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(537, 443)
        Me.ControlBox = False
        Me.Controls.Add(Me.GroupPanel2)
        Me.Controls.Add(Me.PanelEx1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Margin = New System.Windows.Forms.Padding(4, 4, 4, 4)
        Me.Name = "fmaCoursesSetupForm"
        Me.ShowIcon = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "COURSE / GRADE LEVEL SETUP"
        Me.PanelEx1.ResumeLayout(False)
        Me.GroupPanel2.ResumeLayout(False)
        Me.GroupPanel2.PerformLayout()
        Me.Panel1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents PanelEx1 As DevComponents.DotNetBar.PanelEx
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents txtSysPK As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents WinLabel As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnList As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnAdd As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnSave As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnCancel As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnModify As DevComponents.DotNetBar.ButtonX
    Friend WithEvents txtid As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtcode As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtcourse_name As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX7 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX2 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtcategory_id As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtcategory_name As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents txtsection_name As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX3 As DevComponents.DotNetBar.LabelX
    Friend WithEvents Panel1 As Panel
    Friend WithEvents btnCourselist As DevExpress.XtraEditors.SimpleButton
    Friend WithEvents LabelX4 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtdescription As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX5 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtdean_name As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX6 As DevComponents.DotNetBar.LabelX
End Class
