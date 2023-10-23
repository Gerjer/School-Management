<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class fmaIncomeListForm
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
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(fmaIncomeListForm))
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.TabControl4 = New DevComponents.DotNetBar.TabControl()
        Me.TabControlPanel9 = New DevComponents.DotNetBar.TabControlPanel()
        Me.Button3 = New System.Windows.Forms.Button()
        Me.tdbViewer = New C1.Win.C1TrueDBGrid.C1TrueDBGrid()
        Me.ButtonX11 = New DevComponents.DotNetBar.ButtonX()
        Me.ButtonX12 = New DevComponents.DotNetBar.ButtonX()
        Me.ButtonX13 = New DevComponents.DotNetBar.ButtonX()
        Me.ButtonX14 = New DevComponents.DotNetBar.ButtonX()
        Me.TabItem13 = New DevComponents.DotNetBar.TabItem(Me.components)
        Me.TabControlPanel10 = New DevComponents.DotNetBar.TabControlPanel()
        Me.tdbViewer1 = New C1.Win.C1TrueDBGrid.C1TrueDBGrid()
        Me.TabItem14 = New DevComponents.DotNetBar.TabItem(Me.components)
        Me.PanelEx1 = New DevComponents.DotNetBar.PanelEx()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.cmbFilter = New System.Windows.Forms.ComboBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.dtpFrom = New System.Windows.Forms.DateTimePicker()
        Me.dtpTo = New System.Windows.Forms.DateTimePicker()
        Me.txtFilterText = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.grpBoxSearch = New System.Windows.Forms.GroupBox()
        Me.btnSearchCondition = New DevComponents.DotNetBar.ButtonX()
        Me.RadioButton2 = New System.Windows.Forms.RadioButton()
        Me.RadioButton1 = New System.Windows.Forms.RadioButton()
        Me.txtTo = New System.Windows.Forms.TextBox()
        Me.txtFrom = New System.Windows.Forms.TextBox()
        Me.btnRight = New System.Windows.Forms.Button()
        Me.btnLeft = New System.Windows.Forms.Button()
        Me.recordCount = New DevComponents.DotNetBar.LabelX()
        Me.GroupPanel1 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.btnPrint = New System.Windows.Forms.Button()
        Me.btnSearch = New System.Windows.Forms.Button()
        Me.btnEdit = New System.Windows.Forms.Button()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.btnDelete = New System.Windows.Forms.Button()
        Me.btnAdd = New System.Windows.Forms.Button()
        Me.PgCount = New DevComponents.Editors.IntegerInput()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.WinTitle = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.CMenuStripOperations = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.DeleteSelectedToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.DeleteSelectedToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.GroupPanel2.SuspendLayout()
        CType(Me.TabControl4, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl4.SuspendLayout()
        Me.TabControlPanel9.SuspendLayout()
        CType(Me.tdbViewer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControlPanel10.SuspendLayout()
        CType(Me.tdbViewer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.PanelEx1.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.grpBoxSearch.SuspendLayout()
        Me.GroupPanel1.SuspendLayout()
        CType(Me.PgCount, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.CMenuStripOperations.SuspendLayout()
        Me.SuspendLayout()
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
        Me.GroupPanel2.Controls.Add(Me.TabControl4)
        Me.GroupPanel2.Controls.Add(Me.PanelEx1)
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 0)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Size = New System.Drawing.Size(1151, 398)
        '
        '
        '
        Me.GroupPanel2.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel2.Style.BackColorGradientAngle = 90
        Me.GroupPanel2.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
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
        Me.GroupPanel2.TabIndex = 17
        '
        'TabControl4
        '
        Me.TabControl4.BackColor = System.Drawing.Color.SkyBlue
        Me.TabControl4.CanReorderTabs = False
        Me.TabControl4.Controls.Add(Me.TabControlPanel9)
        Me.TabControl4.Controls.Add(Me.TabControlPanel10)
        Me.TabControl4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl4.Location = New System.Drawing.Point(0, 155)
        Me.TabControl4.Name = "TabControl4"
        Me.TabControl4.SelectedTabFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold)
        Me.TabControl4.SelectedTabIndex = 0
        Me.TabControl4.Size = New System.Drawing.Size(1145, 237)
        Me.TabControl4.TabIndex = 53
        Me.TabControl4.TabLayoutType = DevComponents.DotNetBar.eTabLayoutType.FixedWithNavigationBox
        Me.TabControl4.Tabs.Add(Me.TabItem13)
        Me.TabControl4.Tabs.Add(Me.TabItem14)
        Me.TabControl4.Text = "TabControl4"
        '
        'TabControlPanel9
        '
        Me.TabControlPanel9.Controls.Add(Me.Button3)
        Me.TabControlPanel9.Controls.Add(Me.tdbViewer)
        Me.TabControlPanel9.Controls.Add(Me.ButtonX11)
        Me.TabControlPanel9.Controls.Add(Me.ButtonX12)
        Me.TabControlPanel9.Controls.Add(Me.ButtonX13)
        Me.TabControlPanel9.Controls.Add(Me.ButtonX14)
        Me.TabControlPanel9.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlPanel9.Location = New System.Drawing.Point(0, 26)
        Me.TabControlPanel9.Name = "TabControlPanel9"
        Me.TabControlPanel9.Padding = New System.Windows.Forms.Padding(1)
        Me.TabControlPanel9.Size = New System.Drawing.Size(1145, 211)
        Me.TabControlPanel9.Style.BackColor1.Color = System.Drawing.Color.FromArgb(CType(CType(142, Byte), Integer), CType(CType(179, Byte), Integer), CType(CType(231, Byte), Integer))
        Me.TabControlPanel9.Style.BackColor2.Color = System.Drawing.Color.FromArgb(CType(CType(223, Byte), Integer), CType(CType(237, Byte), Integer), CType(CType(254, Byte), Integer))
        Me.TabControlPanel9.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.TabControlPanel9.Style.BorderColor.Color = System.Drawing.Color.FromArgb(CType(CType(59, Byte), Integer), CType(CType(97, Byte), Integer), CType(CType(156, Byte), Integer))
        Me.TabControlPanel9.Style.BorderSide = CType(((DevComponents.DotNetBar.eBorderSide.Left Or DevComponents.DotNetBar.eBorderSide.Right) _
            Or DevComponents.DotNetBar.eBorderSide.Bottom), DevComponents.DotNetBar.eBorderSide)
        Me.TabControlPanel9.Style.GradientAngle = 90
        Me.TabControlPanel9.TabIndex = 1
        Me.TabControlPanel9.TabItem = Me.TabItem13
        '
        'Button3
        '
        Me.Button3.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Button3.Location = New System.Drawing.Point(780, 449)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(75, 23)
        Me.Button3.TabIndex = 19
        Me.Button3.Text = "Cancel"
        Me.Button3.UseVisualStyleBackColor = True
        Me.Button3.Visible = False
        '
        'tdbViewer
        '
        Me.tdbViewer.AllowFilter = False
        Me.tdbViewer.AllowHorizontalSplit = True
        Me.tdbViewer.AllowUpdate = False
        Me.tdbViewer.AllowVerticalSplit = True
        Me.tdbViewer.AlternatingRows = True
        Me.tdbViewer.BackColor = System.Drawing.Color.LightBlue
        Me.tdbViewer.Caption = "COLLECTION LIST"
        Me.tdbViewer.CaptionHeight = 30
        Me.tdbViewer.DirectionAfterEnter = C1.Win.C1TrueDBGrid.DirectionAfterEnterEnum.MoveNone
        Me.tdbViewer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tdbViewer.ExtendRightColumn = True
        Me.tdbViewer.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.tdbViewer.ForeColor = System.Drawing.Color.MidnightBlue
        Me.tdbViewer.GroupByCaption = "Drag a column header here to group by that column"
        Me.tdbViewer.Images.Add(CType(resources.GetObject("tdbViewer.Images"), System.Drawing.Image))
        Me.tdbViewer.Location = New System.Drawing.Point(1, 1)
        Me.tdbViewer.MaintainRowCurrency = True
        Me.tdbViewer.MarqueeStyle = C1.Win.C1TrueDBGrid.MarqueeEnum.HighlightRow
        Me.tdbViewer.Name = "tdbViewer"
        Me.tdbViewer.PictureAddnewRow = CType(resources.GetObject("tdbViewer.PictureAddnewRow"), System.Drawing.Image)
        Me.tdbViewer.PictureCurrentRow = CType(resources.GetObject("tdbViewer.PictureCurrentRow"), System.Drawing.Image)
        Me.tdbViewer.PictureFilterBar = CType(resources.GetObject("tdbViewer.PictureFilterBar"), System.Drawing.Image)
        Me.tdbViewer.PreviewInfo.Location = New System.Drawing.Point(0, 0)
        Me.tdbViewer.PreviewInfo.Size = New System.Drawing.Size(0, 0)
        Me.tdbViewer.PreviewInfo.ZoomFactor = 75.0R
        Me.tdbViewer.PrintInfo.PageSettings = CType(resources.GetObject("tdbViewer.PrintInfo.PageSettings"), System.Drawing.Printing.PageSettings)
        Me.tdbViewer.RowDivider.Color = System.Drawing.Color.DarkBlue
        Me.tdbViewer.RowDivider.Style = C1.Win.C1TrueDBGrid.LineStyleEnum.None
        Me.tdbViewer.RowHeight = 25
        Me.tdbViewer.RowSubDividerColor = System.Drawing.Color.Navy
        Me.tdbViewer.Size = New System.Drawing.Size(1143, 209)
        Me.tdbViewer.TabAcrossSplits = True
        Me.tdbViewer.TabIndex = 21
        Me.tdbViewer.Text = "C1TrueDBGrid1"
        Me.tdbViewer.VisualStyle = C1.Win.C1TrueDBGrid.VisualStyle.Office2007Blue
        Me.tdbViewer.PropBag = resources.GetString("tdbViewer.PropBag")
        '
        'ButtonX11
        '
        Me.ButtonX11.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.ButtonX11.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.ButtonX11.Image = CType(resources.GetObject("ButtonX11.Image"), System.Drawing.Image)
        Me.ButtonX11.Location = New System.Drawing.Point(886, 441)
        Me.ButtonX11.Name = "ButtonX11"
        Me.ButtonX11.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlL)
        Me.ButtonX11.Size = New System.Drawing.Size(93, 31)
        Me.ButtonX11.TabIndex = 29
        Me.ButtonX11.Text = "List's"
        '
        'ButtonX12
        '
        Me.ButtonX12.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.ButtonX12.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.ButtonX12.Image = CType(resources.GetObject("ButtonX12.Image"), System.Drawing.Image)
        Me.ButtonX12.Location = New System.Drawing.Point(137, 441)
        Me.ButtonX12.Name = "ButtonX12"
        Me.ButtonX12.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.ButtonX12.Size = New System.Drawing.Size(93, 31)
        Me.ButtonX12.TabIndex = 27
        Me.ButtonX12.Text = "Save"
        '
        'ButtonX13
        '
        Me.ButtonX13.AccessibleRole = System.Windows.Forms.AccessibleRole.None
        Me.ButtonX13.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.ButtonX13.Image = CType(resources.GetObject("ButtonX13.Image"), System.Drawing.Image)
        Me.ButtonX13.Location = New System.Drawing.Point(14, 441)
        Me.ButtonX13.Name = "ButtonX13"
        Me.ButtonX13.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlA)
        Me.ButtonX13.Size = New System.Drawing.Size(93, 31)
        Me.ButtonX13.TabIndex = 0
        Me.ButtonX13.Text = "Add"
        '
        'ButtonX14
        '
        Me.ButtonX14.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.ButtonX14.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.ButtonX14.Image = CType(resources.GetObject("ButtonX14.Image"), System.Drawing.Image)
        Me.ButtonX14.Location = New System.Drawing.Point(260, 441)
        Me.ButtonX14.Name = "ButtonX14"
        Me.ButtonX14.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlD)
        Me.ButtonX14.Size = New System.Drawing.Size(93, 31)
        Me.ButtonX14.TabIndex = 28
        Me.ButtonX14.Text = "Delete"
        '
        'TabItem13
        '
        Me.TabItem13.AttachedControl = Me.TabControlPanel9
        Me.TabItem13.Name = "TabItem13"
        Me.TabItem13.Text = "COLLECTION LIST"
        '
        'TabControlPanel10
        '
        Me.TabControlPanel10.Controls.Add(Me.tdbViewer1)
        Me.TabControlPanel10.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlPanel10.Location = New System.Drawing.Point(0, 26)
        Me.TabControlPanel10.Name = "TabControlPanel10"
        Me.TabControlPanel10.Padding = New System.Windows.Forms.Padding(1)
        Me.TabControlPanel10.Size = New System.Drawing.Size(1145, 211)
        Me.TabControlPanel10.Style.BackColor1.Color = System.Drawing.Color.FromArgb(CType(CType(142, Byte), Integer), CType(CType(179, Byte), Integer), CType(CType(231, Byte), Integer))
        Me.TabControlPanel10.Style.BackColor2.Color = System.Drawing.Color.FromArgb(CType(CType(223, Byte), Integer), CType(CType(237, Byte), Integer), CType(CType(254, Byte), Integer))
        Me.TabControlPanel10.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.TabControlPanel10.Style.BorderColor.Color = System.Drawing.Color.FromArgb(CType(CType(59, Byte), Integer), CType(CType(97, Byte), Integer), CType(CType(156, Byte), Integer))
        Me.TabControlPanel10.Style.BorderSide = CType(((DevComponents.DotNetBar.eBorderSide.Left Or DevComponents.DotNetBar.eBorderSide.Right) _
            Or DevComponents.DotNetBar.eBorderSide.Bottom), DevComponents.DotNetBar.eBorderSide)
        Me.TabControlPanel10.Style.GradientAngle = 90
        Me.TabControlPanel10.TabIndex = 2
        Me.TabControlPanel10.TabItem = Me.TabItem14
        '
        'tdbViewer1
        '
        Me.tdbViewer1.AllowFilter = False
        Me.tdbViewer1.AllowHorizontalSplit = True
        Me.tdbViewer1.AllowUpdate = False
        Me.tdbViewer1.AllowVerticalSplit = True
        Me.tdbViewer1.AlternatingRows = True
        Me.tdbViewer1.BackColor = System.Drawing.Color.LightBlue
        Me.tdbViewer1.Caption = "COLLECTION LIST"
        Me.tdbViewer1.CaptionHeight = 30
        Me.tdbViewer1.DirectionAfterEnter = C1.Win.C1TrueDBGrid.DirectionAfterEnterEnum.MoveNone
        Me.tdbViewer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tdbViewer1.ExtendRightColumn = True
        Me.tdbViewer1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.tdbViewer1.ForeColor = System.Drawing.Color.MidnightBlue
        Me.tdbViewer1.GroupByCaption = "Drag a column header here to group by that column"
        Me.tdbViewer1.Images.Add(CType(resources.GetObject("tdbViewer1.Images"), System.Drawing.Image))
        Me.tdbViewer1.Location = New System.Drawing.Point(1, 1)
        Me.tdbViewer1.MaintainRowCurrency = True
        Me.tdbViewer1.MarqueeStyle = C1.Win.C1TrueDBGrid.MarqueeEnum.HighlightRow
        Me.tdbViewer1.Name = "tdbViewer1"
        Me.tdbViewer1.PictureAddnewRow = CType(resources.GetObject("tdbViewer1.PictureAddnewRow"), System.Drawing.Image)
        Me.tdbViewer1.PictureCurrentRow = CType(resources.GetObject("tdbViewer1.PictureCurrentRow"), System.Drawing.Image)
        Me.tdbViewer1.PictureFilterBar = CType(resources.GetObject("tdbViewer1.PictureFilterBar"), System.Drawing.Image)
        Me.tdbViewer1.PreviewInfo.Location = New System.Drawing.Point(0, 0)
        Me.tdbViewer1.PreviewInfo.Size = New System.Drawing.Size(0, 0)
        Me.tdbViewer1.PreviewInfo.ZoomFactor = 75.0R
        Me.tdbViewer1.PrintInfo.PageSettings = CType(resources.GetObject("tdbViewer1.PrintInfo.PageSettings"), System.Drawing.Printing.PageSettings)
        Me.tdbViewer1.RowDivider.Color = System.Drawing.Color.DarkBlue
        Me.tdbViewer1.RowDivider.Style = C1.Win.C1TrueDBGrid.LineStyleEnum.None
        Me.tdbViewer1.RowHeight = 25
        Me.tdbViewer1.RowSubDividerColor = System.Drawing.Color.Navy
        Me.tdbViewer1.Size = New System.Drawing.Size(1143, 209)
        Me.tdbViewer1.TabAcrossSplits = True
        Me.tdbViewer1.TabIndex = 22
        Me.tdbViewer1.Text = "C1TrueDBGrid1"
        Me.tdbViewer1.VisualStyle = C1.Win.C1TrueDBGrid.VisualStyle.Office2007Blue
        Me.tdbViewer1.PropBag = resources.GetString("tdbViewer1.PropBag")
        '
        'TabItem14
        '
        Me.TabItem14.AttachedControl = Me.TabControlPanel10
        Me.TabItem14.Name = "TabItem14"
        Me.TabItem14.Text = "REQUEST FORM LIST"
        '
        'PanelEx1
        '
        Me.PanelEx1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.PanelEx1.CanvasColor = System.Drawing.SystemColors.Control
        Me.PanelEx1.Controls.Add(Me.GroupBox1)
        Me.PanelEx1.Controls.Add(Me.txtFilterText)
        Me.PanelEx1.Controls.Add(Me.grpBoxSearch)
        Me.PanelEx1.Controls.Add(Me.txtTo)
        Me.PanelEx1.Controls.Add(Me.txtFrom)
        Me.PanelEx1.Controls.Add(Me.btnRight)
        Me.PanelEx1.Controls.Add(Me.btnLeft)
        Me.PanelEx1.Controls.Add(Me.recordCount)
        Me.PanelEx1.Controls.Add(Me.GroupPanel1)
        Me.PanelEx1.Controls.Add(Me.PgCount)
        Me.PanelEx1.Controls.Add(Me.LabelX1)
        Me.PanelEx1.Controls.Add(Me.WinTitle)
        Me.PanelEx1.Controls.Add(Me.Label2)
        Me.PanelEx1.Dock = System.Windows.Forms.DockStyle.Top
        Me.PanelEx1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.PanelEx1.Location = New System.Drawing.Point(0, 0)
        Me.PanelEx1.Name = "PanelEx1"
        Me.PanelEx1.Size = New System.Drawing.Size(1145, 155)
        Me.PanelEx1.Style.Alignment = System.Drawing.StringAlignment.Center
        Me.PanelEx1.Style.BackColor1.Color = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.PanelEx1.Style.BackColor2.Color = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer), CType(CType(128, Byte), Integer))
        Me.PanelEx1.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.PanelEx1.Style.BorderColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.PanelEx1.Style.ForeColor.ColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.PanelEx1.Style.GradientAngle = 90
        Me.PanelEx1.TabIndex = 12
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.cmbFilter)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.dtpFrom)
        Me.GroupBox1.Controls.Add(Me.dtpTo)
        Me.GroupBox1.Location = New System.Drawing.Point(7, -2)
        Me.GroupBox1.Margin = New System.Windows.Forms.Padding(2)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Padding = New System.Windows.Forms.Padding(2)
        Me.GroupBox1.Size = New System.Drawing.Size(544, 114)
        Me.GroupBox1.TabIndex = 34
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Filter Date"
        '
        'cmbFilter
        '
        Me.cmbFilter.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbFilter.FormattingEnabled = True
        Me.cmbFilter.Items.AddRange(New Object() {"DATE", "YEAR", "RANGE"})
        Me.cmbFilter.Location = New System.Drawing.Point(154, 24)
        Me.cmbFilter.Name = "cmbFilter"
        Me.cmbFilter.Size = New System.Drawing.Size(372, 24)
        Me.cmbFilter.TabIndex = 34
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(10, 29)
        Me.Label3.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(100, 20)
        Me.Label3.TabIndex = 33
        Me.Label3.Text = "Type of Filter"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(8, 66)
        Me.Label1.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(131, 20)
        Me.Label1.TabIndex = 30
        Me.Label1.Text = "Transaction Date"
        '
        'dtpFrom
        '
        Me.dtpFrom.CalendarFont = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpFrom.CustomFormat = ""
        Me.dtpFrom.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.dtpFrom.Location = New System.Drawing.Point(154, 64)
        Me.dtpFrom.Margin = New System.Windows.Forms.Padding(2)
        Me.dtpFrom.Name = "dtpFrom"
        Me.dtpFrom.Size = New System.Drawing.Size(151, 26)
        Me.dtpFrom.TabIndex = 32
        '
        'dtpTo
        '
        Me.dtpTo.CalendarFont = New System.Drawing.Font("Microsoft Sans Serif", 11.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpTo.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.dtpTo.Location = New System.Drawing.Point(359, 65)
        Me.dtpTo.Margin = New System.Windows.Forms.Padding(2)
        Me.dtpTo.Name = "dtpTo"
        Me.dtpTo.Size = New System.Drawing.Size(161, 26)
        Me.dtpTo.TabIndex = 33
        Me.dtpTo.Visible = False
        '
        'txtFilterText
        '
        '
        '
        '
        Me.txtFilterText.Border.Class = "TextBoxBorder"
        Me.txtFilterText.Location = New System.Drawing.Point(460, 3)
        Me.txtFilterText.Name = "txtFilterText"
        Me.txtFilterText.Size = New System.Drawing.Size(41, 26)
        Me.txtFilterText.TabIndex = 29
        Me.txtFilterText.Visible = False
        '
        'grpBoxSearch
        '
        Me.grpBoxSearch.Controls.Add(Me.btnSearchCondition)
        Me.grpBoxSearch.Controls.Add(Me.RadioButton2)
        Me.grpBoxSearch.Controls.Add(Me.RadioButton1)
        Me.grpBoxSearch.Location = New System.Drawing.Point(556, 0)
        Me.grpBoxSearch.Name = "grpBoxSearch"
        Me.grpBoxSearch.Size = New System.Drawing.Size(247, 112)
        Me.grpBoxSearch.TabIndex = 28
        Me.grpBoxSearch.TabStop = False
        Me.grpBoxSearch.Text = "Search Conditions"
        Me.grpBoxSearch.Visible = False
        '
        'btnSearchCondition
        '
        Me.btnSearchCondition.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSearchCondition.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.btnSearchCondition.Location = New System.Drawing.Point(31, 57)
        Me.btnSearchCondition.Name = "btnSearchCondition"
        Me.btnSearchCondition.Size = New System.Drawing.Size(180, 44)
        Me.btnSearchCondition.TabIndex = 28
        Me.btnSearchCondition.Text = "SEARCH"
        Me.btnSearchCondition.Tooltip = "Search"
        '
        'RadioButton2
        '
        Me.RadioButton2.AutoSize = True
        Me.RadioButton2.Checked = True
        Me.RadioButton2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.RadioButton2.Location = New System.Drawing.Point(122, 28)
        Me.RadioButton2.Name = "RadioButton2"
        Me.RadioButton2.Size = New System.Drawing.Size(80, 17)
        Me.RadioButton2.TabIndex = 1
        Me.RadioButton2.TabStop = True
        Me.RadioButton2.Text = "CONTAINS"
        Me.RadioButton2.UseVisualStyleBackColor = True
        '
        'RadioButton1
        '
        Me.RadioButton1.AutoSize = True
        Me.RadioButton1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.RadioButton1.Location = New System.Drawing.Point(26, 30)
        Me.RadioButton1.Name = "RadioButton1"
        Me.RadioButton1.Size = New System.Drawing.Size(68, 17)
        Me.RadioButton1.TabIndex = 0
        Me.RadioButton1.TabStop = True
        Me.RadioButton1.Text = "EQUALS"
        Me.RadioButton1.UseVisualStyleBackColor = True
        '
        'txtTo
        '
        Me.txtTo.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtTo.Location = New System.Drawing.Point(722, 3)
        Me.txtTo.Name = "txtTo"
        Me.txtTo.Size = New System.Drawing.Size(31, 20)
        Me.txtTo.TabIndex = 27
        Me.txtTo.Text = "10"
        Me.txtTo.Visible = False
        '
        'txtFrom
        '
        Me.txtFrom.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtFrom.Location = New System.Drawing.Point(685, 3)
        Me.txtFrom.Name = "txtFrom"
        Me.txtFrom.Size = New System.Drawing.Size(31, 20)
        Me.txtFrom.TabIndex = 26
        Me.txtFrom.Text = "1"
        Me.txtFrom.Visible = False
        '
        'btnRight
        '
        Me.btnRight.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnRight.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnRight.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnRight.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnRight.Location = New System.Drawing.Point(722, 50)
        Me.btnRight.Name = "btnRight"
        Me.btnRight.Size = New System.Drawing.Size(32, 22)
        Me.btnRight.TabIndex = 25
        Me.btnRight.Text = ">>"
        Me.btnRight.UseVisualStyleBackColor = False
        Me.btnRight.Visible = False
        '
        'btnLeft
        '
        Me.btnLeft.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.btnLeft.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnLeft.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnLeft.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnLeft.Location = New System.Drawing.Point(684, 50)
        Me.btnLeft.Name = "btnLeft"
        Me.btnLeft.Size = New System.Drawing.Size(32, 22)
        Me.btnLeft.TabIndex = 24
        Me.btnLeft.Text = "<<"
        Me.btnLeft.UseVisualStyleBackColor = False
        Me.btnLeft.Visible = False
        '
        'recordCount
        '
        Me.recordCount.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.recordCount.AutoSize = True
        Me.recordCount.BackColor = System.Drawing.Color.Transparent
        Me.recordCount.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.recordCount.Location = New System.Drawing.Point(946, 54)
        Me.recordCount.Name = "recordCount"
        Me.recordCount.Size = New System.Drawing.Size(108, 17)
        Me.recordCount.TabIndex = 22
        Me.recordCount.Text = "Records Per Page"
        '
        'GroupPanel1
        '
        Me.GroupPanel1.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel1.Controls.Add(Me.btnPrint)
        Me.GroupPanel1.Controls.Add(Me.btnSearch)
        Me.GroupPanel1.Controls.Add(Me.btnEdit)
        Me.GroupPanel1.Controls.Add(Me.btnClose)
        Me.GroupPanel1.Controls.Add(Me.btnDelete)
        Me.GroupPanel1.Controls.Add(Me.btnAdd)
        Me.GroupPanel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupPanel1.Location = New System.Drawing.Point(0, 117)
        Me.GroupPanel1.Name = "GroupPanel1"
        Me.GroupPanel1.Size = New System.Drawing.Size(1145, 38)
        '
        '
        '
        Me.GroupPanel1.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel1.Style.BackColorGradientAngle = 90
        Me.GroupPanel1.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.GroupPanel1.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderBottomWidth = 1
        Me.GroupPanel1.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.GroupPanel1.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderLeftWidth = 1
        Me.GroupPanel1.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderRightWidth = 1
        Me.GroupPanel1.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel1.Style.BorderTopWidth = 1
        Me.GroupPanel1.Style.CornerDiameter = 4
        Me.GroupPanel1.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded
        Me.GroupPanel1.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center
        Me.GroupPanel1.Style.TextColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelText
        Me.GroupPanel1.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel1.TabIndex = 21
        '
        'btnPrint
        '
        Me.btnPrint.BackColor = System.Drawing.Color.PowderBlue
        Me.btnPrint.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnPrint.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnPrint.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPrint.Image = Global.SchoolMGT.My.Resources.Resources.Print_24x24
        Me.btnPrint.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnPrint.Location = New System.Drawing.Point(391, 0)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(134, 32)
        Me.btnPrint.TabIndex = 27
        Me.btnPrint.Text = "Print"
        Me.btnPrint.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnPrint.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnPrint.UseVisualStyleBackColor = False
        '
        'btnSearch
        '
        Me.btnSearch.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnSearch.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnSearch.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSearch.Location = New System.Drawing.Point(258, 0)
        Me.btnSearch.Name = "btnSearch"
        Me.btnSearch.Size = New System.Drawing.Size(133, 32)
        Me.btnSearch.TabIndex = 26
        Me.btnSearch.Text = "Show Filter Bar"
        Me.btnSearch.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnSearch.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnSearch.UseVisualStyleBackColor = True
        '
        'btnEdit
        '
        Me.btnEdit.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnEdit.Enabled = False
        Me.btnEdit.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnEdit.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnEdit.Image = CType(resources.GetObject("btnEdit.Image"), System.Drawing.Image)
        Me.btnEdit.Location = New System.Drawing.Point(172, 0)
        Me.btnEdit.Name = "btnEdit"
        Me.btnEdit.Size = New System.Drawing.Size(86, 32)
        Me.btnEdit.TabIndex = 25
        Me.btnEdit.Text = "Edit"
        Me.btnEdit.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnEdit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnEdit.UseVisualStyleBackColor = True
        Me.btnEdit.Visible = False
        '
        'btnClose
        '
        Me.btnClose.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClose.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnClose.Location = New System.Drawing.Point(1053, 0)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(86, 32)
        Me.btnClose.TabIndex = 24
        Me.btnClose.Text = "Close"
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClose.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnClose.UseVisualStyleBackColor = True
        '
        'btnDelete
        '
        Me.btnDelete.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnDelete.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnDelete.Location = New System.Drawing.Point(86, 0)
        Me.btnDelete.Name = "btnDelete"
        Me.btnDelete.Size = New System.Drawing.Size(86, 32)
        Me.btnDelete.TabIndex = 21
        Me.btnDelete.Text = "Delete"
        Me.btnDelete.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnDelete.UseVisualStyleBackColor = True
        Me.btnDelete.Visible = False
        '
        'btnAdd
        '
        Me.btnAdd.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnAdd.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAdd.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAdd.Location = New System.Drawing.Point(0, 0)
        Me.btnAdd.Name = "btnAdd"
        Me.btnAdd.Size = New System.Drawing.Size(86, 32)
        Me.btnAdd.TabIndex = 20
        Me.btnAdd.Text = "Add"
        Me.btnAdd.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnAdd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnAdd.UseVisualStyleBackColor = True
        '
        'PgCount
        '
        Me.PgCount.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        '
        '
        '
        Me.PgCount.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.PgCount.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.PgCount.ForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.PgCount.Increment = 10
        Me.PgCount.Location = New System.Drawing.Point(1060, 26)
        Me.PgCount.MaxValue = 99999
        Me.PgCount.MinValue = 10
        Me.PgCount.Name = "PgCount"
        Me.PgCount.ShowUpDown = True
        Me.PgCount.Size = New System.Drawing.Size(80, 22)
        Me.PgCount.TabIndex = 17
        Me.PgCount.Value = 50
        '
        'LabelX1
        '
        Me.LabelX1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.LabelX1.AutoSize = True
        Me.LabelX1.BackColor = System.Drawing.Color.Transparent
        Me.LabelX1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX1.Location = New System.Drawing.Point(946, 31)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(108, 17)
        Me.LabelX1.TabIndex = 16
        Me.LabelX1.Text = "Records Per Page"
        '
        'WinTitle
        '
        Me.WinTitle.AutoSize = True
        Me.WinTitle.Dock = System.Windows.Forms.DockStyle.Top
        Me.WinTitle.Location = New System.Drawing.Point(0, 0)
        Me.WinTitle.Name = "WinTitle"
        Me.WinTitle.Size = New System.Drawing.Size(90, 20)
        Me.WinTitle.TabIndex = 0
        Me.WinTitle.Text = "DATA LIST"
        Me.WinTitle.Visible = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(796, 81)
        Me.Label2.Margin = New System.Windows.Forms.Padding(2, 0, 2, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(66, 20)
        Me.Label2.TabIndex = 31
        Me.Label2.Text = "Date To"
        Me.Label2.Visible = False
        '
        'CMenuStripOperations
        '
        Me.CMenuStripOperations.BackColor = System.Drawing.Color.PaleTurquoise
        Me.CMenuStripOperations.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.CMenuStripOperations.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.DeleteSelectedToolStripMenuItem, Me.DeleteSelectedToolStripMenuItem1})
        Me.CMenuStripOperations.Name = "CMenuStripOperations"
        Me.CMenuStripOperations.Size = New System.Drawing.Size(184, 56)
        '
        'DeleteSelectedToolStripMenuItem
        '
        Me.DeleteSelectedToolStripMenuItem.BackColor = System.Drawing.Color.Transparent
        Me.DeleteSelectedToolStripMenuItem.Font = New System.Drawing.Font("Segoe UI", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DeleteSelectedToolStripMenuItem.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.DeleteSelectedToolStripMenuItem.Name = "DeleteSelectedToolStripMenuItem"
        Me.DeleteSelectedToolStripMenuItem.Size = New System.Drawing.Size(183, 26)
        Me.DeleteSelectedToolStripMenuItem.Text = "Delete Selected"
        '
        'DeleteSelectedToolStripMenuItem1
        '
        Me.DeleteSelectedToolStripMenuItem1.BackColor = System.Drawing.Color.Transparent
        Me.DeleteSelectedToolStripMenuItem1.Enabled = False
        Me.DeleteSelectedToolStripMenuItem1.Font = New System.Drawing.Font("Segoe UI", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.DeleteSelectedToolStripMenuItem1.Name = "DeleteSelectedToolStripMenuItem1"
        Me.DeleteSelectedToolStripMenuItem1.Size = New System.Drawing.Size(183, 26)
        Me.DeleteSelectedToolStripMenuItem1.Text = "Edit Selected"
        '
        'fmaIncomeListForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.SkyBlue
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1151, 398)
        Me.Controls.Add(Me.GroupPanel2)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "fmaIncomeListForm"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "COLLECTION LIST"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        Me.GroupPanel2.ResumeLayout(False)
        CType(Me.TabControl4, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl4.ResumeLayout(False)
        Me.TabControlPanel9.ResumeLayout(False)
        CType(Me.tdbViewer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControlPanel10.ResumeLayout(False)
        CType(Me.tdbViewer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.PanelEx1.ResumeLayout(False)
        Me.PanelEx1.PerformLayout()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.grpBoxSearch.ResumeLayout(False)
        Me.grpBoxSearch.PerformLayout()
        Me.GroupPanel1.ResumeLayout(False)
        CType(Me.PgCount, System.ComponentModel.ISupportInitialize).EndInit()
        Me.CMenuStripOperations.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents PanelEx1 As DevComponents.DotNetBar.PanelEx
    Friend WithEvents WinTitle As System.Windows.Forms.Label
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents PgCount As DevComponents.Editors.IntegerInput
    Friend WithEvents tdbViewer As C1.Win.C1TrueDBGrid.C1TrueDBGrid
    Friend WithEvents GroupPanel1 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents btnAdd As System.Windows.Forms.Button
    Friend WithEvents btnDelete As System.Windows.Forms.Button
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents recordCount As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnRight As System.Windows.Forms.Button
    Friend WithEvents btnLeft As System.Windows.Forms.Button
    Friend WithEvents txtTo As System.Windows.Forms.TextBox
    Friend WithEvents txtFrom As System.Windows.Forms.TextBox
    Friend WithEvents btnPrint As System.Windows.Forms.Button
    Friend WithEvents btnSearch As System.Windows.Forms.Button
    Friend WithEvents btnEdit As System.Windows.Forms.Button
    Friend WithEvents CMenuStripOperations As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents DeleteSelectedToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DeleteSelectedToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents grpBoxSearch As System.Windows.Forms.GroupBox
    Friend WithEvents RadioButton2 As System.Windows.Forms.RadioButton
    Friend WithEvents RadioButton1 As System.Windows.Forms.RadioButton
    Friend WithEvents btnSearchCondition As DevComponents.DotNetBar.ButtonX
    Friend WithEvents txtFilterText As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents TabControl4 As DevComponents.DotNetBar.TabControl
    Friend WithEvents TabControlPanel9 As DevComponents.DotNetBar.TabControlPanel
    Friend WithEvents Button3 As Button
    Friend WithEvents ButtonX11 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents ButtonX12 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents ButtonX13 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents ButtonX14 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents TabItem13 As DevComponents.DotNetBar.TabItem
    Friend WithEvents TabControlPanel10 As DevComponents.DotNetBar.TabControlPanel
    Friend WithEvents tdbViewer1 As C1.Win.C1TrueDBGrid.C1TrueDBGrid
    Friend WithEvents TabItem14 As DevComponents.DotNetBar.TabItem
    Friend WithEvents dtpTo As DateTimePicker
    Friend WithEvents dtpFrom As DateTimePicker
    Friend WithEvents Label2 As Label
    Friend WithEvents Label1 As Label
    Friend WithEvents GroupBox1 As GroupBox
    Friend WithEvents cmbFilter As ComboBox
    Friend WithEvents Label3 As Label
End Class
