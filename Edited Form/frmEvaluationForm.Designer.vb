<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class frmEvaluationForm
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
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmEvaluationForm))
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.TabControl4 = New DevComponents.DotNetBar.TabControl()
        Me.TabControlPanel1 = New DevComponents.DotNetBar.TabControlPanel()
        Me.TreeList2 = New DevExpress.XtraTreeList.TreeList()
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.PrintCORToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.EnrollmentSlipToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.LoadEnrollmentSlipToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PrintNewEnrollmentSlipToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.TabItem1 = New DevComponents.DotNetBar.TabItem(Me.components)
        Me.TabControlPanel2 = New DevComponents.DotNetBar.TabControlPanel()
        Me.GridControl1 = New DevExpress.XtraGrid.GridControl()
        Me.GridView1 = New DevExpress.XtraGrid.Views.Grid.GridView()
        Me.TabItem2 = New DevComponents.DotNetBar.TabItem(Me.components)
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.ButtonX2 = New DevComponents.DotNetBar.ButtonX()
        Me.ButtonX1 = New DevComponents.DotNetBar.ButtonX()
        Me.btnSearch = New DevComponents.DotNetBar.ButtonX()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.cmbStudentName = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.GroupPanel4 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.WinLabel = New DevComponents.DotNetBar.LabelX()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Panel1.SuspendLayout()
        CType(Me.TabControl4, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl4.SuspendLayout()
        Me.TabControlPanel1.SuspendLayout()
        CType(Me.TreeList2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.TabControlPanel2.SuspendLayout()
        CType(Me.GridControl1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel2.SuspendLayout()
        Me.GroupPanel4.SuspendLayout()
        Me.SuspendLayout()
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.TabControl4)
        Me.Panel1.Controls.Add(Me.Panel2)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel1.Location = New System.Drawing.Point(0, 0)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(936, 450)
        Me.Panel1.TabIndex = 0
        '
        'TabControl4
        '
        Me.TabControl4.BackColor = System.Drawing.Color.SkyBlue
        Me.TabControl4.CanReorderTabs = False
        Me.TabControl4.Controls.Add(Me.TabControlPanel1)
        Me.TabControl4.Controls.Add(Me.TabControlPanel2)
        Me.TabControl4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl4.Location = New System.Drawing.Point(0, 132)
        Me.TabControl4.Name = "TabControl4"
        Me.TabControl4.SelectedTabFont = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold)
        Me.TabControl4.SelectedTabIndex = 0
        Me.TabControl4.Size = New System.Drawing.Size(936, 318)
        Me.TabControl4.TabIndex = 53
        Me.TabControl4.TabLayoutType = DevComponents.DotNetBar.eTabLayoutType.FixedWithNavigationBox
        Me.TabControl4.Tabs.Add(Me.TabItem1)
        Me.TabControl4.Tabs.Add(Me.TabItem2)
        Me.TabControl4.Text = "TabControl4"
        '
        'TabControlPanel1
        '
        Me.TabControlPanel1.Controls.Add(Me.TreeList2)
        Me.TabControlPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlPanel1.Location = New System.Drawing.Point(0, 26)
        Me.TabControlPanel1.Name = "TabControlPanel1"
        Me.TabControlPanel1.Padding = New System.Windows.Forms.Padding(1)
        Me.TabControlPanel1.Size = New System.Drawing.Size(936, 292)
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
        'TreeList2
        '
        Me.TreeList2.Appearance.FocusedCell.BackColor = System.Drawing.Color.MediumAquamarine
        Me.TreeList2.Appearance.FocusedCell.Options.UseBackColor = True
        Me.TreeList2.Appearance.FocusedRow.BackColor = System.Drawing.Color.MediumAquamarine
        Me.TreeList2.Appearance.FocusedRow.Options.UseBackColor = True
        Me.TreeList2.Appearance.SelectedRow.BackColor = System.Drawing.Color.MediumAquamarine
        Me.TreeList2.Appearance.SelectedRow.Options.UseBackColor = True
        Me.TreeList2.Appearance.SelectedRow.Options.UseFont = True
        Me.TreeList2.Appearance.SelectedRow.Options.UseTextOptions = True
        Me.TreeList2.Appearance.TreeLine.BackColor = System.Drawing.Color.Red
        Me.TreeList2.Appearance.TreeLine.Options.UseBackColor = True
        Me.TreeList2.ContextMenuStrip = Me.ContextMenuStrip1
        Me.TreeList2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TreeList2.Location = New System.Drawing.Point(1, 1)
        Me.TreeList2.Name = "TreeList2"
        Me.TreeList2.Size = New System.Drawing.Size(934, 290)
        Me.TreeList2.TabIndex = 0
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.PrintCORToolStripMenuItem, Me.EnrollmentSlipToolStripMenuItem, Me.LoadEnrollmentSlipToolStripMenuItem, Me.PrintNewEnrollmentSlipToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(251, 92)
        '
        'PrintCORToolStripMenuItem
        '
        Me.PrintCORToolStripMenuItem.Name = "PrintCORToolStripMenuItem"
        Me.PrintCORToolStripMenuItem.Size = New System.Drawing.Size(250, 22)
        Me.PrintCORToolStripMenuItem.Text = "Print COE and Breakdown of Fees"
        '
        'EnrollmentSlipToolStripMenuItem
        '
        Me.EnrollmentSlipToolStripMenuItem.Name = "EnrollmentSlipToolStripMenuItem"
        Me.EnrollmentSlipToolStripMenuItem.Size = New System.Drawing.Size(250, 22)
        Me.EnrollmentSlipToolStripMenuItem.Text = "Print Enrollment Slip"
        Me.EnrollmentSlipToolStripMenuItem.Visible = False
        '
        'LoadEnrollmentSlipToolStripMenuItem
        '
        Me.LoadEnrollmentSlipToolStripMenuItem.Name = "LoadEnrollmentSlipToolStripMenuItem"
        Me.LoadEnrollmentSlipToolStripMenuItem.Size = New System.Drawing.Size(250, 22)
        Me.LoadEnrollmentSlipToolStripMenuItem.Text = "Load Enrollment Slip"
        Me.LoadEnrollmentSlipToolStripMenuItem.Visible = False
        '
        'PrintNewEnrollmentSlipToolStripMenuItem
        '
        Me.PrintNewEnrollmentSlipToolStripMenuItem.Name = "PrintNewEnrollmentSlipToolStripMenuItem"
        Me.PrintNewEnrollmentSlipToolStripMenuItem.Size = New System.Drawing.Size(250, 22)
        Me.PrintNewEnrollmentSlipToolStripMenuItem.Text = "Print New Enrollment Slip"
        '
        'TabItem1
        '
        Me.TabItem1.AttachedControl = Me.TabControlPanel1
        Me.TabItem1.Name = "TabItem1"
        Me.TabItem1.Text = "Student Record"
        '
        'TabControlPanel2
        '
        Me.TabControlPanel2.Controls.Add(Me.GridControl1)
        Me.TabControlPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControlPanel2.Location = New System.Drawing.Point(0, 26)
        Me.TabControlPanel2.Name = "TabControlPanel2"
        Me.TabControlPanel2.Padding = New System.Windows.Forms.Padding(1)
        Me.TabControlPanel2.Size = New System.Drawing.Size(936, 292)
        Me.TabControlPanel2.Style.BackColor1.Color = System.Drawing.Color.FromArgb(CType(CType(142, Byte), Integer), CType(CType(179, Byte), Integer), CType(CType(231, Byte), Integer))
        Me.TabControlPanel2.Style.BackColor2.Color = System.Drawing.Color.FromArgb(CType(CType(223, Byte), Integer), CType(CType(237, Byte), Integer), CType(CType(254, Byte), Integer))
        Me.TabControlPanel2.Style.Border = DevComponents.DotNetBar.eBorderType.SingleLine
        Me.TabControlPanel2.Style.BorderColor.Color = System.Drawing.Color.FromArgb(CType(CType(59, Byte), Integer), CType(CType(97, Byte), Integer), CType(CType(156, Byte), Integer))
        Me.TabControlPanel2.Style.BorderSide = CType(((DevComponents.DotNetBar.eBorderSide.Left Or DevComponents.DotNetBar.eBorderSide.Right) _
            Or DevComponents.DotNetBar.eBorderSide.Bottom), DevComponents.DotNetBar.eBorderSide)
        Me.TabControlPanel2.Style.GradientAngle = 90
        Me.TabControlPanel2.TabIndex = 4
        Me.TabControlPanel2.TabItem = Me.TabItem2
        '
        'GridControl1
        '
        Me.GridControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GridControl1.Location = New System.Drawing.Point(1, 1)
        Me.GridControl1.MainView = Me.GridView1
        Me.GridControl1.Name = "GridControl1"
        Me.GridControl1.Size = New System.Drawing.Size(934, 290)
        Me.GridControl1.TabIndex = 0
        Me.GridControl1.ViewCollection.AddRange(New DevExpress.XtraGrid.Views.Base.BaseView() {Me.GridView1})
        Me.GridControl1.Visible = False
        '
        'GridView1
        '
        Me.GridView1.AppearancePrint.HeaderPanel.BackColor = System.Drawing.Color.Transparent
        Me.GridView1.AppearancePrint.HeaderPanel.BackColor2 = System.Drawing.Color.Transparent
        Me.GridView1.AppearancePrint.HeaderPanel.Options.UseBackColor = True
        Me.GridView1.AppearancePrint.HeaderPanel.Options.UseTextOptions = True
        Me.GridView1.AppearancePrint.HeaderPanel.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        Me.GridView1.AppearancePrint.HeaderPanel.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center
        Me.GridView1.AppearancePrint.HeaderPanel.TextOptions.WordWrap = DevExpress.Utils.WordWrap.Wrap
        Me.GridView1.GridControl = Me.GridControl1
        Me.GridView1.Name = "GridView1"
        Me.GridView1.OptionsPrint.AutoWidth = False
        Me.GridView1.OptionsView.ColumnAutoWidth = False
        Me.GridView1.OptionsView.ShowGroupPanel = False
        Me.GridView1.OptionsView.ShowIndicator = False
        '
        'TabItem2
        '
        Me.TabItem2.AttachedControl = Me.TabControlPanel2
        Me.TabItem2.Name = "TabItem2"
        Me.TabItem2.Text = "TabItem2"
        Me.TabItem2.Visible = False
        '
        'Panel2
        '
        Me.Panel2.BackColor = System.Drawing.Color.MediumAquamarine
        Me.Panel2.Controls.Add(Me.ButtonX2)
        Me.Panel2.Controls.Add(Me.ButtonX1)
        Me.Panel2.Controls.Add(Me.btnSearch)
        Me.Panel2.Controls.Add(Me.LabelX1)
        Me.Panel2.Controls.Add(Me.cmbStudentName)
        Me.Panel2.Controls.Add(Me.GroupPanel4)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Top
        Me.Panel2.Location = New System.Drawing.Point(0, 0)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(936, 132)
        Me.Panel2.TabIndex = 54
        '
        'ButtonX2
        '
        Me.ButtonX2.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.ButtonX2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.ButtonX2.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.ButtonX2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ButtonX2.Image = CType(resources.GetObject("ButtonX2.Image"), System.Drawing.Image)
        Me.ButtonX2.ImageFixedSize = New System.Drawing.Size(25, 25)
        Me.ButtonX2.Location = New System.Drawing.Point(246, 85)
        Me.ButtonX2.Name = "ButtonX2"
        Me.ButtonX2.Shape = New DevComponents.DotNetBar.RoundRectangleShapeDescriptor(5)
        Me.ButtonX2.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F5)
        Me.ButtonX2.Size = New System.Drawing.Size(87, 35)
        Me.ButtonX2.TabIndex = 254
        Me.ButtonX2.Tag = "1"
        Me.ButtonX2.Text = "Edit"
        Me.ButtonX2.Tooltip = "Edit"
        '
        'ButtonX1
        '
        Me.ButtonX1.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.ButtonX1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.ButtonX1.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.ButtonX1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ButtonX1.Image = Global.SchoolMGT.My.Resources.Resources.add
        Me.ButtonX1.ImageFixedSize = New System.Drawing.Size(25, 25)
        Me.ButtonX1.Location = New System.Drawing.Point(154, 85)
        Me.ButtonX1.Name = "ButtonX1"
        Me.ButtonX1.Shape = New DevComponents.DotNetBar.RoundRectangleShapeDescriptor(5)
        Me.ButtonX1.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F5)
        Me.ButtonX1.Size = New System.Drawing.Size(87, 35)
        Me.ButtonX1.TabIndex = 253
        Me.ButtonX1.Tag = "1"
        Me.ButtonX1.Text = "Add"
        Me.ButtonX1.Tooltip = "Add"
        '
        'btnSearch
        '
        Me.btnSearch.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSearch.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None
        Me.btnSearch.ColorTable = DevComponents.DotNetBar.eButtonColor.Office2007WithBackground
        Me.btnSearch.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSearch.Image = CType(resources.GetObject("btnSearch.Image"), System.Drawing.Image)
        Me.btnSearch.ImageFixedSize = New System.Drawing.Size(25, 25)
        Me.btnSearch.Location = New System.Drawing.Point(532, 48)
        Me.btnSearch.Name = "btnSearch"
        Me.btnSearch.Shape = New DevComponents.DotNetBar.RoundRectangleShapeDescriptor(5)
        Me.btnSearch.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.F5)
        Me.btnSearch.Size = New System.Drawing.Size(87, 35)
        Me.btnSearch.SplitButton = True
        Me.btnSearch.TabIndex = 252
        Me.btnSearch.Tag = "1"
        Me.btnSearch.Text = " Find"
        Me.btnSearch.Tooltip = "Find"
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX1.ForeColor = System.Drawing.SystemColors.Desktop
        Me.LabelX1.Location = New System.Drawing.Point(24, 56)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(105, 21)
        Me.LabelX1.TabIndex = 251
        Me.LabelX1.Text = "Student Name"
        '
        'cmbStudentName
        '
        Me.cmbStudentName.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbStudentName.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbStudentName.DisplayMember = "Text"
        Me.cmbStudentName.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbStudentName.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbStudentName.FormattingEnabled = True
        Me.cmbStudentName.ItemHeight = 17
        Me.cmbStudentName.Location = New System.Drawing.Point(154, 56)
        Me.cmbStudentName.Name = "cmbStudentName"
        Me.cmbStudentName.Size = New System.Drawing.Size(372, 23)
        Me.cmbStudentName.TabIndex = 250
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
        Me.GroupPanel4.Size = New System.Drawing.Size(936, 38)
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
        'WinLabel
        '
        Me.WinLabel.BackColor = System.Drawing.Color.Transparent
        Me.WinLabel.Dock = System.Windows.Forms.DockStyle.Fill
        Me.WinLabel.Location = New System.Drawing.Point(0, 0)
        Me.WinLabel.Name = "WinLabel"
        Me.WinLabel.Size = New System.Drawing.Size(934, 36)
        Me.WinLabel.TabIndex = 245
        Me.WinLabel.Text = "STUDENT ADMISSION LIST "
        Me.WinLabel.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'Timer1
        '
        Me.Timer1.Interval = 1000
        '
        'frmEvaluationForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(936, 450)
        Me.Controls.Add(Me.Panel1)
        Me.KeyPreview = True
        Me.Name = "frmEvaluationForm"
        Me.ShowIcon = False
        Me.Text = "STUDENT ADMISSION LIST "
        Me.Panel1.ResumeLayout(False)
        CType(Me.TabControl4, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl4.ResumeLayout(False)
        Me.TabControlPanel1.ResumeLayout(False)
        CType(Me.TreeList2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.TabControlPanel2.ResumeLayout(False)
        CType(Me.GridControl1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        Me.GroupPanel4.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents Panel1 As Panel
    Friend WithEvents TabControl4 As DevComponents.DotNetBar.TabControl
    Friend WithEvents TabControlPanel1 As DevComponents.DotNetBar.TabControlPanel
    Friend WithEvents TabItem1 As DevComponents.DotNetBar.TabItem
    Friend WithEvents Panel2 As Panel
    Friend WithEvents GroupPanel4 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents WinLabel As DevComponents.DotNetBar.LabelX
    Friend WithEvents cmbStudentName As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnSearch As DevComponents.DotNetBar.ButtonX
    Friend WithEvents TreeList2 As DevExpress.XtraTreeList.TreeList
    Friend WithEvents ContextMenuStrip1 As ContextMenuStrip
    Friend WithEvents PrintCORToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ButtonX1 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents ButtonX2 As DevComponents.DotNetBar.ButtonX
    Friend WithEvents Timer1 As Timer
    Friend WithEvents EnrollmentSlipToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents TabControlPanel2 As DevComponents.DotNetBar.TabControlPanel
    Friend WithEvents GridControl1 As DevExpress.XtraGrid.GridControl
    Friend WithEvents GridView1 As DevExpress.XtraGrid.Views.Grid.GridView
    Friend WithEvents TabItem2 As DevComponents.DotNetBar.TabItem
    Friend WithEvents LoadEnrollmentSlipToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents PrintNewEnrollmentSlipToolStripMenuItem As ToolStripMenuItem
End Class
