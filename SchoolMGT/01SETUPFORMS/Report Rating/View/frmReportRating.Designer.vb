<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmReportRating
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
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmReportRating))
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.TabControl4 = New DevComponents.DotNetBar.TabControl()
        Me.TabControlPanel1 = New DevComponents.DotNetBar.TabControlPanel()
        Me.gcRatingReport = New DevExpress.XtraGrid.GridControl()
        Me.gvRatingReport = New DevExpress.XtraGrid.Views.Grid.GridView()
        Me.GridColumn7 = New DevExpress.XtraGrid.Columns.GridColumn()
        Me.GridColumn8 = New DevExpress.XtraGrid.Columns.GridColumn()
        Me.GridColumn10 = New DevExpress.XtraGrid.Columns.GridColumn()
        Me.GridColumn9 = New DevExpress.XtraGrid.Columns.GridColumn()
        Me.TabItem1 = New DevComponents.DotNetBar.TabItem(Me.components)
        Me.WinLabel = New DevComponents.DotNetBar.LabelX()
        Me.GroupPanel4 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.btnGenerate = New DevComponents.DotNetBar.ButtonX()
        Me.Panel3 = New System.Windows.Forms.Panel()
        Me.GroupPanel6 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.btnSearch = New DevComponents.DotNetBar.ButtonX()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.cmbCourse = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.ComboItem16 = New DevComponents.Editors.ComboItem()
        Me.ComboItem17 = New DevComponents.Editors.ComboItem()
        Me.ComboItem18 = New DevComponents.Editors.ComboItem()
        Me.ComboItem19 = New DevComponents.Editors.ComboItem()
        Me.ComboItem20 = New DevComponents.Editors.ComboItem()
        Me.ComboItem21 = New DevComponents.Editors.ComboItem()
        Me.ComboItem22 = New DevComponents.Editors.ComboItem()
        Me.ComboItem23 = New DevComponents.Editors.ComboItem()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.cmbYearLevel = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem11 = New DevComponents.Editors.ComboItem()
        Me.ComboItem12 = New DevComponents.Editors.ComboItem()
        Me.ComboItem13 = New DevComponents.Editors.ComboItem()
        Me.ComboItem14 = New DevComponents.Editors.ComboItem()
        Me.ComboItem15 = New DevComponents.Editors.ComboItem()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.cmbSemester = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.ComboItem8 = New DevComponents.Editors.ComboItem()
        Me.ComboItem9 = New DevComponents.Editors.ComboItem()
        Me.ComboItem10 = New DevComponents.Editors.ComboItem()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.cmbAcademicYear = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem5 = New DevComponents.Editors.ComboItem()
        Me.ComboItem6 = New DevComponents.Editors.ComboItem()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.cmbCategory = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.ComboItem7 = New DevComponents.Editors.ComboItem()
        Me.ComboItem24 = New DevComponents.Editors.ComboItem()
        Me.ComboItem25 = New DevComponents.Editors.ComboItem()
        Me.Panel1.SuspendLayout()
        CType(Me.TabControl4, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl4.SuspendLayout()
        Me.TabControlPanel1.SuspendLayout()
        CType(Me.gcRatingReport, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.gvRatingReport, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupPanel4.SuspendLayout()
        Me.Panel3.SuspendLayout()
        Me.GroupPanel6.SuspendLayout()
        Me.Panel2.SuspendLayout()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.TabControl4)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel1.Location = New System.Drawing.Point(0, 164)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(968, 286)
        Me.Panel1.TabIndex = 61
        '
        'TabControl4
        '
        Me.TabControl4.BackColor = System.Drawing.Color.SkyBlue
        Me.TabControl4.CanReorderTabs = False
        Me.TabControl4.Controls.Add(Me.TabControlPanel1)
        Me.TabControl4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl4.Location = New System.Drawing.Point(0, 0)
        Me.TabControl4.Name = "TabControl4"
        Me.TabControl4.SelectedTabFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold)
        Me.TabControl4.SelectedTabIndex = 0
        Me.TabControl4.Size = New System.Drawing.Size(968, 286)
        Me.TabControl4.TabIndex = 58
        Me.TabControl4.TabLayoutType = DevComponents.DotNetBar.eTabLayoutType.FixedWithNavigationBox
        Me.TabControl4.Tabs.Add(Me.TabItem1)
        Me.TabControl4.Text = "TabControl4"
        '
        'TabControlPanel1
        '
        Me.TabControlPanel1.Controls.Add(Me.gcRatingReport)
        Me.TabControlPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlPanel1.Location = New System.Drawing.Point(0, 26)
        Me.TabControlPanel1.Name = "TabControlPanel1"
        Me.TabControlPanel1.Padding = New System.Windows.Forms.Padding(1)
        Me.TabControlPanel1.Size = New System.Drawing.Size(968, 260)
        Me.TabControlPanel1.Style.BackColor1.Color = System.Drawing.Color.FromArgb(CType(CType(142, Byte), Integer), CType(CType(179, Byte), Integer), CType(CType(231, Byte), Integer))
        Me.TabControlPanel1.Style.BackColor2.Color = System.Drawing.Color.FromArgb(CType(CType(223, Byte), Integer), CType(CType(237, Byte), Integer), CType(CType(254, Byte), Integer))
        Me.TabControlPanel1.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.TabControlPanel1.Style.BorderColor.Color = System.Drawing.Color.FromArgb(CType(CType(59, Byte), Integer), CType(CType(97, Byte), Integer), CType(CType(156, Byte), Integer))
        Me.TabControlPanel1.Style.BorderSide = CType(((DevComponents.DotNetBar.eBorderSide.Left Or DevComponents.DotNetBar.eBorderSide.Right) _
            Or DevComponents.DotNetBar.eBorderSide.Bottom), DevComponents.DotNetBar.eBorderSide)
        Me.TabControlPanel1.Style.GradientAngle = 90
        Me.TabControlPanel1.TabIndex = 3
        Me.TabControlPanel1.TabItem = Me.TabItem1
        '
        'gcRatingReport
        '
        Me.gcRatingReport.Dock = System.Windows.Forms.DockStyle.Fill
        Me.gcRatingReport.Location = New System.Drawing.Point(1, 1)
        Me.gcRatingReport.MainView = Me.gvRatingReport
        Me.gcRatingReport.Name = "gcRatingReport"
        Me.gcRatingReport.Padding = New System.Windows.Forms.Padding(10)
        Me.gcRatingReport.Size = New System.Drawing.Size(966, 258)
        Me.gcRatingReport.TabIndex = 251
        Me.gcRatingReport.ViewCollection.AddRange(New DevExpress.XtraGrid.Views.Base.BaseView() {Me.gvRatingReport})
        '
        'gvRatingReport
        '
        Me.gvRatingReport.Appearance.FocusedCell.BackColor = System.Drawing.Color.MediumAquamarine
        Me.gvRatingReport.Appearance.FocusedCell.Options.UseBackColor = True
        Me.gvRatingReport.Appearance.FocusedRow.BackColor = System.Drawing.Color.MediumAquamarine
        Me.gvRatingReport.Appearance.FocusedRow.Options.UseBackColor = True
        Me.gvRatingReport.Appearance.SelectedRow.BackColor = System.Drawing.Color.MediumAquamarine
        Me.gvRatingReport.Appearance.SelectedRow.Options.UseBackColor = True
        Me.gvRatingReport.Columns.AddRange(New DevExpress.XtraGrid.Columns.GridColumn() {Me.GridColumn7, Me.GridColumn8, Me.GridColumn10, Me.GridColumn9})
        Me.gvRatingReport.GridControl = Me.gcRatingReport
        Me.gvRatingReport.Name = "gvRatingReport"
        Me.gvRatingReport.OptionsBehavior.Editable = False
        Me.gvRatingReport.OptionsSelection.CheckBoxSelectorField = "INCLUDE"
        Me.gvRatingReport.OptionsSelection.MultiSelect = True
        Me.gvRatingReport.OptionsSelection.MultiSelectMode = DevExpress.XtraGrid.Views.Grid.GridMultiSelectMode.CheckBoxRowSelect
        Me.gvRatingReport.OptionsView.ShowAutoFilterRow = True
        Me.gvRatingReport.OptionsView.ShowGroupPanel = False
        Me.gvRatingReport.OptionsView.ShowIndicator = False
        '
        'GridColumn7
        '
        Me.GridColumn7.AppearanceHeader.Options.UseTextOptions = True
        Me.GridColumn7.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        Me.GridColumn7.AppearanceHeader.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center
        Me.GridColumn7.Caption = "GridColumn7"
        Me.GridColumn7.FieldName = "INCLUDE"
        Me.GridColumn7.Name = "GridColumn7"
        Me.GridColumn7.Width = 100
        '
        'GridColumn8
        '
        Me.GridColumn8.AppearanceHeader.Options.UseTextOptions = True
        Me.GridColumn8.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        Me.GridColumn8.AppearanceHeader.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center
        Me.GridColumn8.Caption = "STUDENT"
        Me.GridColumn8.FieldName = "display_name"
        Me.GridColumn8.Name = "GridColumn8"
        Me.GridColumn8.Visible = True
        Me.GridColumn8.VisibleIndex = 1
        Me.GridColumn8.Width = 450
        '
        'GridColumn10
        '
        Me.GridColumn10.AppearanceCell.Options.UseTextOptions = True
        Me.GridColumn10.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        Me.GridColumn10.AppearanceCell.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center
        Me.GridColumn10.AppearanceHeader.Options.UseTextOptions = True
        Me.GridColumn10.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        Me.GridColumn10.AppearanceHeader.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center
        Me.GridColumn10.Caption = "AVERAGE"
        Me.GridColumn10.FieldName = "Average"
        Me.GridColumn10.Name = "GridColumn10"
        Me.GridColumn10.Visible = True
        Me.GridColumn10.VisibleIndex = 2
        Me.GridColumn10.Width = 340
        '
        'GridColumn9
        '
        Me.GridColumn9.Caption = "GridColumn9"
        Me.GridColumn9.FieldName = "id"
        Me.GridColumn9.Name = "GridColumn9"
        '
        'TabItem1
        '
        Me.TabItem1.AttachedControl = Me.TabControlPanel1
        Me.TabItem1.Name = "TabItem1"
        Me.TabItem1.Text = "Report Ratings List"
        '
        'WinLabel
        '
        Me.WinLabel.BackColor = System.Drawing.Color.Transparent
        Me.WinLabel.Dock = System.Windows.Forms.DockStyle.Fill
        Me.WinLabel.Location = New System.Drawing.Point(0, 0)
        Me.WinLabel.Name = "WinLabel"
        Me.WinLabel.Size = New System.Drawing.Size(966, 36)
        Me.WinLabel.TabIndex = 245
        Me.WinLabel.Text = "REPORT RATING"
        Me.WinLabel.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'GroupPanel4
        '
        Me.GroupPanel4.AutoScroll = True
        Me.GroupPanel4.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel4.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel4.Controls.Add(Me.WinLabel)
        Me.GroupPanel4.Dock = System.Windows.Forms.DockStyle.Top
        Me.GroupPanel4.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel4.Location = New System.Drawing.Point(0, 0)
        Me.GroupPanel4.Name = "GroupPanel4"
        Me.GroupPanel4.Size = New System.Drawing.Size(968, 38)
        '
        '
        '
        Me.GroupPanel4.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel4.Style.BackColorGradientAngle = 90
        Me.GroupPanel4.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.GroupPanel4.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel4.Style.BorderBottomWidth = 1
        Me.GroupPanel4.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.GroupPanel4.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel4.Style.BorderLeftWidth = 1
        Me.GroupPanel4.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel4.Style.BorderRightWidth = 1
        Me.GroupPanel4.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel4.Style.BorderTopWidth = 1
        Me.GroupPanel4.Style.CornerDiameter = 4
        Me.GroupPanel4.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center
        Me.GroupPanel4.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel4.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel4.TabIndex = 249
        '
        'GroupPanel2
        '
        Me.GroupPanel2.AutoScroll = True
        Me.GroupPanel2.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel2.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 38)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Size = New System.Drawing.Size(968, 126)
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
        Me.GroupPanel2.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel2.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel2.TabIndex = 255
        Me.GroupPanel2.Visible = False
        '
        'btnGenerate
        '
        Me.btnGenerate.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnGenerate.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.btnGenerate.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.btnGenerate.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnGenerate.Image = CType(resources.GetObject("btnGenerate.Image"), System.Drawing.Image)
        Me.btnGenerate.ImageFixedSize = New System.Drawing.Size(25, 25)
        Me.btnGenerate.Location = New System.Drawing.Point(744, 34)
        Me.btnGenerate.Name = "btnGenerate"
        Me.btnGenerate.Shape = New DevComponents.DotNetBar.RoundRectangleShapeDescriptor(5)
        Me.btnGenerate.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlP)
        Me.btnGenerate.Size = New System.Drawing.Size(155, 32)
        Me.btnGenerate.TabIndex = 253
        Me.btnGenerate.Tag = "1"
        Me.btnGenerate.Text = "Generate Report"
        Me.btnGenerate.Tooltip = "Print"
        '
        'Panel3
        '
        Me.Panel3.Controls.Add(Me.cmbCategory)
        Me.Panel3.Controls.Add(Me.Label5)
        Me.Panel3.Controls.Add(Me.GroupPanel6)
        Me.Panel3.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel3.Location = New System.Drawing.Point(0, 38)
        Me.Panel3.Name = "Panel3"
        Me.Panel3.Padding = New System.Windows.Forms.Padding(7)
        Me.Panel3.Size = New System.Drawing.Size(968, 126)
        Me.Panel3.TabIndex = 256
        '
        'GroupPanel6
        '
        Me.GroupPanel6.AutoScroll = True
        Me.GroupPanel6.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel6.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel6.Controls.Add(Me.btnSearch)
        Me.GroupPanel6.Controls.Add(Me.Label4)
        Me.GroupPanel6.Controls.Add(Me.cmbCourse)
        Me.GroupPanel6.Controls.Add(Me.Label1)
        Me.GroupPanel6.Controls.Add(Me.cmbYearLevel)
        Me.GroupPanel6.Controls.Add(Me.Label3)
        Me.GroupPanel6.Controls.Add(Me.cmbSemester)
        Me.GroupPanel6.Controls.Add(Me.Label2)
        Me.GroupPanel6.Controls.Add(Me.cmbAcademicYear)
        Me.GroupPanel6.Controls.Add(Me.btnGenerate)
        Me.GroupPanel6.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupPanel6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel6.Location = New System.Drawing.Point(7, 46)
        Me.GroupPanel6.Name = "GroupPanel6"
        Me.GroupPanel6.Size = New System.Drawing.Size(954, 73)
        '
        '
        '
        Me.GroupPanel6.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel6.Style.BackColorGradientAngle = 90
        Me.GroupPanel6.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.GroupPanel6.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel6.Style.BorderBottomWidth = 1
        Me.GroupPanel6.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.GroupPanel6.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel6.Style.BorderLeftWidth = 1
        Me.GroupPanel6.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel6.Style.BorderRightWidth = 1
        Me.GroupPanel6.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel6.Style.BorderTopWidth = 1
        Me.GroupPanel6.Style.CornerDiameter = 4
        Me.GroupPanel6.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded
        Me.GroupPanel6.Style.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center
        Me.GroupPanel6.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel6.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel6.TabIndex = 254
        '
        'btnSearch
        '
        Me.btnSearch.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSearch.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.btnSearch.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.btnSearch.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSearch.Image = Global.SchoolMGT.My.Resources.Resources.zoom
        Me.btnSearch.ImageFixedSize = New System.Drawing.Size(25, 25)
        Me.btnSearch.Location = New System.Drawing.Point(744, 2)
        Me.btnSearch.Name = "btnSearch"
        Me.btnSearch.Shape = New DevComponents.DotNetBar.RoundRectangleShapeDescriptor(5)
        Me.btnSearch.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlP)
        Me.btnSearch.Size = New System.Drawing.Size(155, 32)
        Me.btnSearch.TabIndex = 264
        Me.btnSearch.Tag = "1"
        Me.btnSearch.Text = "<font color=""#ED1C24"">Search</font> / <font color=""#FFC20E"">Filter</font>"
        Me.btnSearch.Tooltip = "Print"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.BackColor = System.Drawing.Color.Transparent
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(405, 39)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(97, 17)
        Me.Label4.TabIndex = 263
        Me.Label4.Text = "Course/Grade"
        '
        'cmbCourse
        '
        Me.cmbCourse.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbCourse.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbCourse.DisplayMember = "Text"
        Me.cmbCourse.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbCourse.DropDownWidth = 300
        Me.cmbCourse.Enabled = False
        Me.cmbCourse.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbCourse.FormattingEnabled = True
        Me.cmbCourse.ItemHeight = 17
        Me.cmbCourse.Items.AddRange(New Object() {Me.ComboItem16, Me.ComboItem17, Me.ComboItem18, Me.ComboItem19, Me.ComboItem20, Me.ComboItem21, Me.ComboItem22, Me.ComboItem23})
        Me.cmbCourse.Location = New System.Drawing.Point(505, 37)
        Me.cmbCourse.Name = "cmbCourse"
        Me.cmbCourse.Size = New System.Drawing.Size(225, 23)
        Me.cmbCourse.TabIndex = 262
        '
        'ComboItem16
        '
        Me.ComboItem16.Text = "-- ALL --"
        '
        'ComboItem17
        '
        Me.ComboItem17.Text = "1st year"
        '
        'ComboItem18
        '
        Me.ComboItem18.Text = "2nd year"
        '
        'ComboItem19
        '
        Me.ComboItem19.Text = "3rd year"
        '
        'ComboItem20
        '
        Me.ComboItem20.Text = "4th year"
        '
        'ComboItem21
        '
        Me.ComboItem21.Text = "5th year"
        '
        'ComboItem22
        '
        Me.ComboItem22.Text = "6th year"
        '
        'ComboItem23
        '
        Me.ComboItem23.Text = "7th year"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.Color.Transparent
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(401, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(76, 17)
        Me.Label1.TabIndex = 261
        Me.Label1.Text = "Year Level"
        '
        'cmbYearLevel
        '
        Me.cmbYearLevel.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbYearLevel.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbYearLevel.DisplayMember = "Text"
        Me.cmbYearLevel.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbYearLevel.DropDownWidth = 253
        Me.cmbYearLevel.Enabled = False
        Me.cmbYearLevel.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbYearLevel.FormattingEnabled = True
        Me.cmbYearLevel.ItemHeight = 17
        Me.cmbYearLevel.Items.AddRange(New Object() {Me.ComboItem2, Me.ComboItem3, Me.ComboItem11, Me.ComboItem12, Me.ComboItem13, Me.ComboItem14, Me.ComboItem15})
        Me.cmbYearLevel.Location = New System.Drawing.Point(505, 6)
        Me.cmbYearLevel.Name = "cmbYearLevel"
        Me.cmbYearLevel.Size = New System.Drawing.Size(225, 23)
        Me.cmbYearLevel.TabIndex = 260
        '
        'ComboItem2
        '
        Me.ComboItem2.Text = "1st Year"
        '
        'ComboItem3
        '
        Me.ComboItem3.Text = "2nd Year"
        '
        'ComboItem11
        '
        Me.ComboItem11.Text = "3rd Year"
        '
        'ComboItem12
        '
        Me.ComboItem12.Text = "4th Year"
        '
        'ComboItem13
        '
        Me.ComboItem13.Text = "5th Year"
        '
        'ComboItem14
        '
        Me.ComboItem14.Text = "6th Year"
        '
        'ComboItem15
        '
        Me.ComboItem15.Text = "7th Year"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.BackColor = System.Drawing.Color.Transparent
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(51, 37)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(63, 17)
        Me.Label3.TabIndex = 259
        Me.Label3.Text = "Semister"
        '
        'cmbSemester
        '
        Me.cmbSemester.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbSemester.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbSemester.DisplayMember = "Text"
        Me.cmbSemester.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbSemester.DropDownWidth = 253
        Me.cmbSemester.Enabled = False
        Me.cmbSemester.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbSemester.FormattingEnabled = True
        Me.cmbSemester.ItemHeight = 17
        Me.cmbSemester.Items.AddRange(New Object() {Me.ComboItem8, Me.ComboItem9, Me.ComboItem10, Me.ComboItem25})
        Me.cmbSemester.Location = New System.Drawing.Point(159, 35)
        Me.cmbSemester.Name = "cmbSemester"
        Me.cmbSemester.Size = New System.Drawing.Size(236, 23)
        Me.cmbSemester.TabIndex = 258
        '
        'ComboItem8
        '
        Me.ComboItem8.Text = "1st Semester"
        '
        'ComboItem9
        '
        Me.ComboItem9.Text = "2nd Semester"
        '
        'ComboItem10
        '
        Me.ComboItem10.Text = "Summer"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.Color.Transparent
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(10, 8)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(103, 17)
        Me.Label2.TabIndex = 257
        Me.Label2.Text = "Academic Year"
        '
        'cmbAcademicYear
        '
        Me.cmbAcademicYear.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbAcademicYear.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbAcademicYear.DisplayMember = "Text"
        Me.cmbAcademicYear.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbAcademicYear.DropDownWidth = 253
        Me.cmbAcademicYear.Enabled = False
        Me.cmbAcademicYear.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbAcademicYear.FormattingEnabled = True
        Me.cmbAcademicYear.ItemHeight = 17
        Me.cmbAcademicYear.Items.AddRange(New Object() {Me.ComboItem4, Me.ComboItem5, Me.ComboItem6})
        Me.cmbAcademicYear.Location = New System.Drawing.Point(159, 5)
        Me.cmbAcademicYear.Name = "cmbAcademicYear"
        Me.cmbAcademicYear.Size = New System.Drawing.Size(236, 23)
        Me.cmbAcademicYear.TabIndex = 256
        '
        'ComboItem4
        '
        Me.ComboItem4.Text = "Summary of Enrollment"
        '
        'ComboItem5
        '
        Me.ComboItem5.Text = "Comparative Previous Data  to Current Data in a Year"
        '
        'ComboItem6
        '
        Me.ComboItem6.Text = "Comparative Data on Transfered Student"
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.Color.MediumAquamarine
        Me.Panel2.Controls.Add(Me.Panel3)
        Me.Panel2.Controls.Add(Me.GroupPanel2)
        Me.Panel2.Controls.Add(Me.GroupPanel4)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel2.Location = New System.Drawing.Point(0, 0)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(968, 164)
        Me.Panel2.TabIndex = 60
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.BackColor = System.Drawing.Color.Transparent
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(15, 14)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(134, 20)
        Me.Label5.TabIndex = 258
        Me.Label5.Text = "Student Category"
        '
        'cmbCategory
        '
        Me.cmbCategory.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbCategory.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbCategory.DisplayMember = "Text"
        Me.cmbCategory.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbCategory.DropDownWidth = 253
        Me.cmbCategory.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbCategory.FormattingEnabled = True
        Me.cmbCategory.ItemHeight = 20
        Me.cmbCategory.Items.AddRange(New Object() {Me.ComboItem1, Me.ComboItem7, Me.ComboItem24})
        Me.cmbCategory.Location = New System.Drawing.Point(169, 11)
        Me.cmbCategory.Name = "cmbCategory"
        Me.cmbCategory.Size = New System.Drawing.Size(571, 26)
        Me.cmbCategory.TabIndex = 259
        '
        'ComboItem1
        '
        Me.ComboItem1.Text = "Summary of Enrollment"
        '
        'ComboItem7
        '
        Me.ComboItem7.Text = "Comparative Previous Data  to Current Data in a Year"
        '
        'ComboItem24
        '
        Me.ComboItem24.Text = "Comparative Data on Transfered Student"
        '
        'ComboItem25
        '
        Me.ComboItem25.Text = "YEARLY"
        '
        'frmReportRating
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(968, 450)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(Me.Panel2)
        Me.Name = "frmReportRating"
        Me.ShowIcon = False
        Me.Text = "REPORT RATING"
        Me.Panel1.ResumeLayout(False)
        CType(Me.TabControl4, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl4.ResumeLayout(False)
        Me.TabControlPanel1.ResumeLayout(False)
        CType(Me.gcRatingReport, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.gvRatingReport, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupPanel4.ResumeLayout(False)
        Me.Panel3.ResumeLayout(False)
        Me.Panel3.PerformLayout()
        Me.GroupPanel6.ResumeLayout(False)
        Me.GroupPanel6.PerformLayout()
        Me.Panel2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents Panel1 As Panel
    Friend WithEvents TabControl4 As DevComponents.DotNetBar.TabControl
    Friend WithEvents TabControlPanel1 As DevComponents.DotNetBar.TabControlPanel
    Friend WithEvents TabItem1 As DevComponents.DotNetBar.TabItem
    Friend WithEvents WinLabel As DevComponents.DotNetBar.LabelX
    Friend WithEvents GroupPanel4 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents btnGenerate As DevComponents.DotNetBar.ButtonX
    Friend WithEvents Panel3 As Panel
    Friend WithEvents Panel2 As Panel
    Friend WithEvents GroupPanel6 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents Label3 As Label
    Friend WithEvents cmbSemester As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents ComboItem8 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem9 As DevComponents.Editors.ComboItem
    Friend WithEvents Label2 As Label
    Friend WithEvents cmbAcademicYear As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem5 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem6 As DevComponents.Editors.ComboItem
    Friend WithEvents Label1 As Label
    Friend WithEvents cmbYearLevel As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem11 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem12 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem13 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem14 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem15 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem10 As DevComponents.Editors.ComboItem
    Friend WithEvents gcRatingReport As DevExpress.XtraGrid.GridControl
    Friend WithEvents gvRatingReport As DevExpress.XtraGrid.Views.Grid.GridView
    Friend WithEvents GridColumn7 As DevExpress.XtraGrid.Columns.GridColumn
    Friend WithEvents GridColumn8 As DevExpress.XtraGrid.Columns.GridColumn
    Friend WithEvents GridColumn10 As DevExpress.XtraGrid.Columns.GridColumn
    Friend WithEvents GridColumn9 As DevExpress.XtraGrid.Columns.GridColumn
    Friend WithEvents cmbCourse As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents ComboItem16 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem17 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem18 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem19 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem20 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem21 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem22 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem23 As DevComponents.Editors.ComboItem
    Friend WithEvents Label4 As Label
    Friend WithEvents btnSearch As DevComponents.DotNetBar.ButtonX
    Friend WithEvents cmbCategory As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem7 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem24 As DevComponents.Editors.ComboItem
    Friend WithEvents Label5 As Label
    Friend WithEvents ComboItem25 As DevComponents.Editors.ComboItem
End Class
