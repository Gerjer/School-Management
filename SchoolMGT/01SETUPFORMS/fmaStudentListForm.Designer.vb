<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class fmaStudentListForm
    Inherits DevComponents.DotNetBar.Office2007Form

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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(fmaStudentListForm))
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.tdbViewer = New C1.Win.C1TrueDBGrid.C1TrueDBGrid()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.stillSpinner = New System.Windows.Forms.PictureBox()
        Me.lblStatus = New DevComponents.DotNetBar.LabelX()
        Me.rollingSpinner = New System.Windows.Forms.PictureBox()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.chkViewDeleted = New System.Windows.Forms.CheckBox()
        Me.GridControl1 = New DevExpress.XtraGrid.GridControl()
        Me.GridView1 = New DevExpress.XtraGrid.Views.Grid.GridView()
        Me.cmbCategory = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX5 = New DevComponents.DotNetBar.LabelX()
        Me.cmbyearbatch = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX3 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX4 = New DevComponents.DotNetBar.LabelX()
        Me.GroupPanel4 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.LabelControl1 = New DevExpress.XtraEditors.LabelControl()
        Me.GroupPanel1 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.btnRetrieve = New DevComponents.DotNetBar.ButtonX()
        Me.btndelete = New DevComponents.DotNetBar.ButtonX()
        Me.btnPrint = New DevComponents.DotNetBar.ButtonX()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.LabelX6 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX7 = New DevComponents.DotNetBar.LabelX()
        Me.btnClearFilter = New DevComponents.DotNetBar.ButtonX()
        Me.btnSearchCondition = New DevComponents.DotNetBar.ButtonX()
        Me.btnRemove = New DevComponents.DotNetBar.ButtonX()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtStudentName = New System.Windows.Forms.TextBox()
        Me.txtBatchID = New System.Windows.Forms.TextBox()
        Me.cmbBatch = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX2 = New DevComponents.DotNetBar.LabelX()
        Me.txtCourseID = New System.Windows.Forms.TextBox()
        Me.cmbCourse = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.CMenuStripOperations = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.AssignScheduleToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ViewAssessmentToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ViewGradesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PreviewCORToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModifyBatchToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModifyScholarshipGrantToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.GrantToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RemoveToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModifyCourseGradeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.MarkAsEnrolledToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ENROLLEDToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NOTENROLLEDToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.WITHDRAWNToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.EnrolledAsToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NEWToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.OLDToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RETURNEEToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.TRANFEREEToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NdBachelorsDegreeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModifyYearLevelToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModifySemesterToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ModifyAdmissionNumberToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ADDDROPSubjectToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.GroupPanel2.SuspendLayout()
        Me.Panel2.SuspendLayout()
        CType(Me.tdbViewer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox2.SuspendLayout()
        CType(Me.stillSpinner, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.rollingSpinner, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        CType(Me.GridControl1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupPanel4.SuspendLayout()
        Me.GroupPanel1.SuspendLayout()
        Me.Panel1.SuspendLayout()
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
        Me.GroupPanel2.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel2.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel2.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel2.Controls.Add(Me.Panel2)
        Me.GroupPanel2.Controls.Add(Me.GroupBox2)
        Me.GroupPanel2.Controls.Add(Me.GroupBox1)
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 0)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Size = New System.Drawing.Size(1139, 446)
        '
        '
        '
        Me.GroupPanel2.Style.BackColor = System.Drawing.Color.Azure
        Me.GroupPanel2.Style.BackColor2 = System.Drawing.Color.MediumAquamarine
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
        Me.GroupPanel2.TabIndex = 17
        '
        'Panel2
        '
        Me.Panel2.AutoScroll = True
        Me.Panel2.Controls.Add(Me.tdbViewer)
        Me.Panel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel2.Location = New System.Drawing.Point(0, 180)
        Me.Panel2.Margin = New System.Windows.Forms.Padding(2)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(1133, 213)
        Me.Panel2.TabIndex = 26
        '
        'tdbViewer
        '
        Me.tdbViewer.AllowHorizontalSplit = True
        Me.tdbViewer.AllowUpdate = False
        Me.tdbViewer.AllowVerticalSplit = True
        Me.tdbViewer.AlternatingRows = True
        Me.tdbViewer.BackColor = System.Drawing.Color.LightBlue
        Me.tdbViewer.Caption = "STUDENT LIST"
        Me.tdbViewer.CaptionHeight = 21
        Me.tdbViewer.DirectionAfterEnter = C1.Win.C1TrueDBGrid.DirectionAfterEnterEnum.MoveNone
        Me.tdbViewer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tdbViewer.ExtendRightColumn = True
        Me.tdbViewer.FilterBar = True
        Me.tdbViewer.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.tdbViewer.ForeColor = System.Drawing.Color.MidnightBlue
        Me.tdbViewer.GroupByCaption = "Drag a column header here to group by that column"
        Me.tdbViewer.Images.Add(CType(resources.GetObject("tdbViewer.Images"), System.Drawing.Image))
        Me.tdbViewer.Location = New System.Drawing.Point(0, 0)
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
        Me.tdbViewer.Size = New System.Drawing.Size(1133, 213)
        Me.tdbViewer.TabAcrossSplits = True
        Me.tdbViewer.TabIndex = 25
        Me.tdbViewer.Text = "C1TrueDBGrid1"
        Me.tdbViewer.VisualStyle = C1.Win.C1TrueDBGrid.VisualStyle.Office2007Blue
        Me.tdbViewer.PropBag = resources.GetString("tdbViewer.PropBag")
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.stillSpinner)
        Me.GroupBox2.Controls.Add(Me.lblStatus)
        Me.GroupBox2.Controls.Add(Me.rollingSpinner)
        Me.GroupBox2.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupBox2.Location = New System.Drawing.Point(0, 393)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(1133, 47)
        Me.GroupBox2.TabIndex = 24
        Me.GroupBox2.TabStop = False
        '
        'stillSpinner
        '
        Me.stillSpinner.Image = Global.SchoolMGT.My.Resources.Resources.spinner_static
        Me.stillSpinner.Location = New System.Drawing.Point(7, 11)
        Me.stillSpinner.Name = "stillSpinner"
        Me.stillSpinner.Size = New System.Drawing.Size(31, 32)
        Me.stillSpinner.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.stillSpinner.TabIndex = 119
        Me.stillSpinner.TabStop = False
        '
        'lblStatus
        '
        Me.lblStatus.Location = New System.Drawing.Point(44, 16)
        Me.lblStatus.Name = "lblStatus"
        Me.lblStatus.Size = New System.Drawing.Size(330, 23)
        Me.lblStatus.TabIndex = 118
        Me.lblStatus.Text = "Search ..."
        '
        'rollingSpinner
        '
        Me.rollingSpinner.Image = Global.SchoolMGT.My.Resources.Resources.spinner
        Me.rollingSpinner.Location = New System.Drawing.Point(7, 11)
        Me.rollingSpinner.Name = "rollingSpinner"
        Me.rollingSpinner.Size = New System.Drawing.Size(31, 32)
        Me.rollingSpinner.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.rollingSpinner.TabIndex = 117
        Me.rollingSpinner.TabStop = False
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.Transparent
        Me.GroupBox1.Controls.Add(Me.chkViewDeleted)
        Me.GroupBox1.Controls.Add(Me.GridControl1)
        Me.GroupBox1.Controls.Add(Me.cmbCategory)
        Me.GroupBox1.Controls.Add(Me.LabelX5)
        Me.GroupBox1.Controls.Add(Me.cmbyearbatch)
        Me.GroupBox1.Controls.Add(Me.LabelX3)
        Me.GroupBox1.Controls.Add(Me.LabelX4)
        Me.GroupBox1.Controls.Add(Me.GroupPanel4)
        Me.GroupBox1.Controls.Add(Me.GroupPanel1)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.txtStudentName)
        Me.GroupBox1.Controls.Add(Me.txtBatchID)
        Me.GroupBox1.Controls.Add(Me.cmbBatch)
        Me.GroupBox1.Controls.Add(Me.LabelX2)
        Me.GroupBox1.Controls.Add(Me.txtCourseID)
        Me.GroupBox1.Controls.Add(Me.cmbCourse)
        Me.GroupBox1.Controls.Add(Me.LabelX1)
        Me.GroupBox1.Dock = System.Windows.Forms.DockStyle.Top
        Me.GroupBox1.Location = New System.Drawing.Point(0, 0)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(1133, 180)
        Me.GroupBox1.TabIndex = 22
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "FILTER"
        '
        'chkViewDeleted
        '
        Me.chkViewDeleted.AutoSize = True
        Me.chkViewDeleted.ForeColor = System.Drawing.Color.Red
        Me.chkViewDeleted.Location = New System.Drawing.Point(10, 117)
        Me.chkViewDeleted.Margin = New System.Windows.Forms.Padding(2)
        Me.chkViewDeleted.Name = "chkViewDeleted"
        Me.chkViewDeleted.Size = New System.Drawing.Size(156, 17)
        Me.chkViewDeleted.TabIndex = 140
        Me.chkViewDeleted.Text = "VIEW DELETED RECORD"
        Me.chkViewDeleted.UseVisualStyleBackColor = True
        Me.chkViewDeleted.Visible = False
        '
        'GridControl1
        '
        Me.GridControl1.EmbeddedNavigator.Margin = New System.Windows.Forms.Padding(2)
        Me.GridControl1.Location = New System.Drawing.Point(286, 116)
        Me.GridControl1.MainView = Me.GridView1
        Me.GridControl1.Margin = New System.Windows.Forms.Padding(2)
        Me.GridControl1.Name = "GridControl1"
        Me.GridControl1.Size = New System.Drawing.Size(229, 15)
        Me.GridControl1.TabIndex = 139
        Me.GridControl1.ViewCollection.AddRange(New DevExpress.XtraGrid.Views.Base.BaseView() {Me.GridView1})
        Me.GridControl1.Visible = False
        '
        'GridView1
        '
        Me.GridView1.DetailHeight = 284
        Me.GridView1.GridControl = Me.GridControl1
        Me.GridView1.Name = "GridView1"
        Me.GridView1.OptionsView.ShowGroupPanel = False
        Me.GridView1.OptionsView.ShowIndicator = False
        '
        'cmbCategory
        '
        Me.cmbCategory.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbCategory.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbCategory.DisplayMember = "Text"
        Me.cmbCategory.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbCategory.Enabled = False
        Me.cmbCategory.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbCategory.FormattingEnabled = True
        Me.cmbCategory.ItemHeight = 17
        Me.cmbCategory.Location = New System.Drawing.Point(109, 87)
        Me.cmbCategory.Name = "cmbCategory"
        Me.cmbCategory.Size = New System.Drawing.Size(300, 23)
        Me.cmbCategory.TabIndex = 138
        '
        'LabelX5
        '
        Me.LabelX5.AutoSize = True
        Me.LabelX5.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX5.Location = New System.Drawing.Point(14, 89)
        Me.LabelX5.Name = "LabelX5"
        Me.LabelX5.Size = New System.Drawing.Size(77, 18)
        Me.LabelX5.TabIndex = 137
        Me.LabelX5.Text = "CATEGORY"
        '
        'cmbyearbatch
        '
        Me.cmbyearbatch.DisplayMember = "Text"
        Me.cmbyearbatch.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbyearbatch.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbyearbatch.FormattingEnabled = True
        Me.cmbyearbatch.ItemHeight = 17
        Me.cmbyearbatch.Location = New System.Drawing.Point(109, 61)
        Me.cmbyearbatch.Name = "cmbyearbatch"
        Me.cmbyearbatch.Size = New System.Drawing.Size(300, 23)
        Me.cmbyearbatch.TabIndex = 136
        '
        'LabelX3
        '
        Me.LabelX3.Anchor = CType((System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.LabelX3.AutoSize = True
        Me.LabelX3.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX3.Location = New System.Drawing.Point(888, 56)
        Me.LabelX3.Name = "LabelX3"
        Me.LabelX3.Size = New System.Drawing.Size(205, 21)
        Me.LabelX3.TabIndex = 112
        Me.LabelX3.Text = "SEARCH STUDENT NAME"
        '
        'LabelX4
        '
        Me.LabelX4.AutoSize = True
        Me.LabelX4.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX4.Location = New System.Drawing.Point(10, 65)
        Me.LabelX4.Name = "LabelX4"
        Me.LabelX4.Size = New System.Drawing.Size(99, 18)
        Me.LabelX4.TabIndex = 135
        Me.LabelX4.Text = "SCHOOL YEAR"
        '
        'GroupPanel4
        '
        Me.GroupPanel4.AutoScroll = True
        Me.GroupPanel4.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel4.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel4.Controls.Add(Me.LabelControl1)
        Me.GroupPanel4.Dock = System.Windows.Forms.DockStyle.Top
        Me.GroupPanel4.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel4.Location = New System.Drawing.Point(3, 16)
        Me.GroupPanel4.Name = "GroupPanel4"
        Me.GroupPanel4.Size = New System.Drawing.Size(1127, 35)
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
        Me.GroupPanel4.TabIndex = 134
        '
        'LabelControl1
        '
        Me.LabelControl1.Anchor = CType((System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.LabelControl1.Appearance.Font = New System.Drawing.Font("Tahoma", 15.0!)
        Me.LabelControl1.Appearance.Options.UseFont = True
        Me.LabelControl1.Location = New System.Drawing.Point(464, 5)
        Me.LabelControl1.Name = "LabelControl1"
        Me.LabelControl1.Size = New System.Drawing.Size(173, 24)
        Me.LabelControl1.TabIndex = 45
        Me.LabelControl1.Text = "GRADE SHEET LIST"
        '
        'GroupPanel1
        '
        Me.GroupPanel1.AutoScroll = True
        Me.GroupPanel1.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel1.Controls.Add(Me.btnRetrieve)
        Me.GroupPanel1.Controls.Add(Me.btndelete)
        Me.GroupPanel1.Controls.Add(Me.btnPrint)
        Me.GroupPanel1.Controls.Add(Me.Panel1)
        Me.GroupPanel1.Controls.Add(Me.btnClearFilter)
        Me.GroupPanel1.Controls.Add(Me.btnSearchCondition)
        Me.GroupPanel1.Controls.Add(Me.btnRemove)
        Me.GroupPanel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupPanel1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel1.Location = New System.Drawing.Point(3, 138)
        Me.GroupPanel1.Name = "GroupPanel1"
        Me.GroupPanel1.Size = New System.Drawing.Size(1127, 39)
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
        Me.GroupPanel1.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel1.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel1.TabIndex = 133
        '
        'btnRetrieve
        '
        Me.btnRetrieve.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnRetrieve.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnRetrieve.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnRetrieve.Image = Global.SchoolMGT.My.Resources.Resources.refresh
        Me.btnRetrieve.ImageFixedSize = New System.Drawing.Size(35, 30)
        Me.btnRetrieve.Location = New System.Drawing.Point(456, 0)
        Me.btnRetrieve.Name = "btnRetrieve"
        Me.btnRetrieve.Size = New System.Drawing.Size(114, 33)
        Me.btnRetrieve.TabIndex = 136
        Me.btnRetrieve.Text = "Retrieve"
        Me.btnRetrieve.Tooltip = "Retreive"
        Me.btnRetrieve.Visible = False
        '
        'btndelete
        '
        Me.btndelete.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btndelete.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btndelete.Dock = System.Windows.Forms.DockStyle.Left
        Me.btndelete.Image = Global.SchoolMGT.My.Resources.Resources.cancel_32x32
        Me.btndelete.ImageFixedSize = New System.Drawing.Size(35, 30)
        Me.btndelete.Location = New System.Drawing.Point(342, 0)
        Me.btndelete.Name = "btndelete"
        Me.btndelete.Size = New System.Drawing.Size(114, 33)
        Me.btndelete.TabIndex = 135
        Me.btndelete.Text = "Delete"
        Me.btndelete.Tooltip = "Delete"
        Me.btndelete.Visible = False
        '
        'btnPrint
        '
        Me.btnPrint.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnPrint.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnPrint.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnPrint.Image = Global.SchoolMGT.My.Resources.Resources.Print_24x24
        Me.btnPrint.ImageFixedSize = New System.Drawing.Size(35, 30)
        Me.btnPrint.Location = New System.Drawing.Point(228, 0)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(114, 33)
        Me.btnPrint.TabIndex = 134
        Me.btnPrint.Text = "Print"
        Me.btnPrint.Tooltip = "Clear Filter"
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.LabelX6)
        Me.Panel1.Controls.Add(Me.LabelX7)
        Me.Panel1.Location = New System.Drawing.Point(568, 3)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(436, 29)
        Me.Panel1.TabIndex = 133
        '
        'LabelX6
        '
        Me.LabelX6.Anchor = System.Windows.Forms.AnchorStyles.Top
        Me.LabelX6.AutoSize = True
        Me.LabelX6.BackColor = System.Drawing.Color.Transparent
        Me.LabelX6.ForeColor = System.Drawing.Color.Red
        Me.LabelX6.Location = New System.Drawing.Point(70, 7)
        Me.LabelX6.Name = "LabelX6"
        Me.LabelX6.SingleLineColor = System.Drawing.SystemColors.AppWorkspace
        Me.LabelX6.Size = New System.Drawing.Size(38, 15)
        Me.LabelX6.TabIndex = 202
        Me.LabelX6.Text = "NOTE :"
        '
        'LabelX7
        '
        Me.LabelX7.Anchor = System.Windows.Forms.AnchorStyles.Top
        Me.LabelX7.AutoSize = True
        Me.LabelX7.BackColor = System.Drawing.Color.Transparent
        Me.LabelX7.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX7.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.LabelX7.Location = New System.Drawing.Point(111, 7)
        Me.LabelX7.Name = "LabelX7"
        Me.LabelX7.SingleLineColor = System.Drawing.SystemColors.AppWorkspace
        Me.LabelX7.Size = New System.Drawing.Size(264, 15)
        Me.LabelX7.TabIndex = 201
        Me.LabelX7.Text = "Double Click on Subject in the list to Enter Grades . . ."
        '
        'btnClearFilter
        '
        Me.btnClearFilter.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnClearFilter.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnClearFilter.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnClearFilter.Image = CType(resources.GetObject("btnClearFilter.Image"), System.Drawing.Image)
        Me.btnClearFilter.ImageFixedSize = New System.Drawing.Size(25, 25)
        Me.btnClearFilter.Location = New System.Drawing.Point(114, 0)
        Me.btnClearFilter.Name = "btnClearFilter"
        Me.btnClearFilter.Size = New System.Drawing.Size(114, 33)
        Me.btnClearFilter.TabIndex = 114
        Me.btnClearFilter.Text = "Clear Filter"
        Me.btnClearFilter.Tooltip = "Clear Filter"
        '
        'btnSearchCondition
        '
        Me.btnSearchCondition.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSearchCondition.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnSearchCondition.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnSearchCondition.Image = Global.SchoolMGT.My.Resources.Resources.zoom
        Me.btnSearchCondition.Location = New System.Drawing.Point(0, 0)
        Me.btnSearchCondition.Name = "btnSearchCondition"
        Me.btnSearchCondition.Size = New System.Drawing.Size(114, 33)
        Me.btnSearchCondition.TabIndex = 111
        Me.btnSearchCondition.Text = "Search"
        Me.btnSearchCondition.Tooltip = "Search"
        '
        'btnRemove
        '
        Me.btnRemove.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnRemove.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnRemove.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnRemove.Image = Global.SchoolMGT.My.Resources.Resources.close
        Me.btnRemove.Location = New System.Drawing.Point(1007, 0)
        Me.btnRemove.Name = "btnRemove"
        Me.btnRemove.Size = New System.Drawing.Size(114, 33)
        Me.btnRemove.TabIndex = 132
        Me.btnRemove.Text = "Close"
        Me.btnRemove.Tooltip = "Add Subject"
        '
        'Label1
        '
        Me.Label1.Anchor = CType((System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Label1.AutoSize = True
        Me.Label1.ForeColor = System.Drawing.Color.DarkGray
        Me.Label1.Location = New System.Drawing.Point(949, 118)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(134, 13)
        Me.Label1.TabIndex = 116
        Me.Label1.Text = "Entry fields then hit ""Enter"""
        Me.Label1.Visible = False
        '
        'txtStudentName
        '
        Me.txtStudentName.Anchor = CType((System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.txtStudentName.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtStudentName.Location = New System.Drawing.Point(876, 83)
        Me.txtStudentName.Multiline = True
        Me.txtStudentName.Name = "txtStudentName"
        Me.txtStudentName.Size = New System.Drawing.Size(251, 32)
        Me.txtStudentName.TabIndex = 113
        Me.txtStudentName.TabStop = False
        Me.txtStudentName.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'txtBatchID
        '
        Me.txtBatchID.Location = New System.Drawing.Point(742, 119)
        Me.txtBatchID.Name = "txtBatchID"
        Me.txtBatchID.Size = New System.Drawing.Size(30, 20)
        Me.txtBatchID.TabIndex = 110
        Me.txtBatchID.Visible = False
        '
        'cmbBatch
        '
        Me.cmbBatch.DisplayMember = "Text"
        Me.cmbBatch.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbBatch.Enabled = False
        Me.cmbBatch.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbBatch.FormattingEnabled = True
        Me.cmbBatch.ItemHeight = 17
        Me.cmbBatch.Location = New System.Drawing.Point(554, 87)
        Me.cmbBatch.Name = "cmbBatch"
        Me.cmbBatch.Size = New System.Drawing.Size(293, 23)
        Me.cmbBatch.TabIndex = 109
        '
        'LabelX2
        '
        Me.LabelX2.AutoSize = True
        Me.LabelX2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX2.Location = New System.Drawing.Point(448, 88)
        Me.LabelX2.Name = "LabelX2"
        Me.LabelX2.Size = New System.Drawing.Size(48, 18)
        Me.LabelX2.TabIndex = 108
        Me.LabelX2.Text = "BATCH"
        '
        'txtCourseID
        '
        Me.txtCourseID.Location = New System.Drawing.Point(445, 95)
        Me.txtCourseID.Name = "txtCourseID"
        Me.txtCourseID.Size = New System.Drawing.Size(30, 20)
        Me.txtCourseID.TabIndex = 107
        Me.txtCourseID.Visible = False
        '
        'cmbCourse
        '
        Me.cmbCourse.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbCourse.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbCourse.DisplayMember = "Text"
        Me.cmbCourse.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbCourse.Enabled = False
        Me.cmbCourse.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbCourse.FormattingEnabled = True
        Me.cmbCourse.ItemHeight = 17
        Me.cmbCourse.Location = New System.Drawing.Point(554, 60)
        Me.cmbCourse.Name = "cmbCourse"
        Me.cmbCourse.Size = New System.Drawing.Size(293, 23)
        Me.cmbCourse.TabIndex = 106
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX1.Location = New System.Drawing.Point(443, 63)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(105, 18)
        Me.LabelX1.TabIndex = 105
        Me.LabelX1.Text = "COURSE/LEVEL"
        '
        'CMenuStripOperations
        '
        Me.CMenuStripOperations.BackColor = System.Drawing.Color.PaleTurquoise
        Me.CMenuStripOperations.ImageScalingSize = New System.Drawing.Size(20, 20)
        Me.CMenuStripOperations.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AssignScheduleToolStripMenuItem, Me.ViewAssessmentToolStripMenuItem, Me.ViewGradesToolStripMenuItem, Me.PreviewCORToolStripMenuItem, Me.ModifyBatchToolStripMenuItem, Me.ModifyScholarshipGrantToolStripMenuItem, Me.ModifyCourseGradeToolStripMenuItem, Me.MarkAsEnrolledToolStripMenuItem, Me.EnrolledAsToolStripMenuItem, Me.ModifyYearLevelToolStripMenuItem, Me.ModifySemesterToolStripMenuItem, Me.ModifyAdmissionNumberToolStripMenuItem, Me.ADDDROPSubjectToolStripMenuItem})
        Me.CMenuStripOperations.Name = "CMenuStripOperations"
        Me.CMenuStripOperations.Size = New System.Drawing.Size(219, 290)
        '
        'AssignScheduleToolStripMenuItem
        '
        Me.AssignScheduleToolStripMenuItem.Name = "AssignScheduleToolStripMenuItem"
        Me.AssignScheduleToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.AssignScheduleToolStripMenuItem.Text = "View Subjects"
        Me.AssignScheduleToolStripMenuItem.Visible = False
        '
        'ViewAssessmentToolStripMenuItem
        '
        Me.ViewAssessmentToolStripMenuItem.Name = "ViewAssessmentToolStripMenuItem"
        Me.ViewAssessmentToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ViewAssessmentToolStripMenuItem.Text = "View Assessment"
        '
        'ViewGradesToolStripMenuItem
        '
        Me.ViewGradesToolStripMenuItem.Name = "ViewGradesToolStripMenuItem"
        Me.ViewGradesToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ViewGradesToolStripMenuItem.Text = "View Grades"
        Me.ViewGradesToolStripMenuItem.Visible = False
        '
        'PreviewCORToolStripMenuItem
        '
        Me.PreviewCORToolStripMenuItem.Name = "PreviewCORToolStripMenuItem"
        Me.PreviewCORToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.PreviewCORToolStripMenuItem.Text = "Preview COR"
        Me.PreviewCORToolStripMenuItem.Visible = False
        '
        'ModifyBatchToolStripMenuItem
        '
        Me.ModifyBatchToolStripMenuItem.Name = "ModifyBatchToolStripMenuItem"
        Me.ModifyBatchToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ModifyBatchToolStripMenuItem.Tag = "1"
        Me.ModifyBatchToolStripMenuItem.Text = "Modify Batch"
        '
        'ModifyScholarshipGrantToolStripMenuItem
        '
        Me.ModifyScholarshipGrantToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.GrantToolStripMenuItem, Me.RemoveToolStripMenuItem})
        Me.ModifyScholarshipGrantToolStripMenuItem.Name = "ModifyScholarshipGrantToolStripMenuItem"
        Me.ModifyScholarshipGrantToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ModifyScholarshipGrantToolStripMenuItem.Tag = "2"
        Me.ModifyScholarshipGrantToolStripMenuItem.Text = "Modify Scholarship"
        '
        'GrantToolStripMenuItem
        '
        Me.GrantToolStripMenuItem.Name = "GrantToolStripMenuItem"
        Me.GrantToolStripMenuItem.Size = New System.Drawing.Size(180, 22)
        Me.GrantToolStripMenuItem.Text = "Grant"
        '
        'RemoveToolStripMenuItem
        '
        Me.RemoveToolStripMenuItem.Name = "RemoveToolStripMenuItem"
        Me.RemoveToolStripMenuItem.Size = New System.Drawing.Size(180, 22)
        Me.RemoveToolStripMenuItem.Text = "Remove"
        '
        'ModifyCourseGradeToolStripMenuItem
        '
        Me.ModifyCourseGradeToolStripMenuItem.Name = "ModifyCourseGradeToolStripMenuItem"
        Me.ModifyCourseGradeToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ModifyCourseGradeToolStripMenuItem.Tag = "3"
        Me.ModifyCourseGradeToolStripMenuItem.Text = "Modify Course / Grade"
        '
        'MarkAsEnrolledToolStripMenuItem
        '
        Me.MarkAsEnrolledToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ENROLLEDToolStripMenuItem, Me.NOTENROLLEDToolStripMenuItem, Me.WITHDRAWNToolStripMenuItem})
        Me.MarkAsEnrolledToolStripMenuItem.Name = "MarkAsEnrolledToolStripMenuItem"
        Me.MarkAsEnrolledToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.MarkAsEnrolledToolStripMenuItem.Text = "Enroll Status"
        '
        'ENROLLEDToolStripMenuItem
        '
        Me.ENROLLEDToolStripMenuItem.Name = "ENROLLEDToolStripMenuItem"
        Me.ENROLLEDToolStripMenuItem.Size = New System.Drawing.Size(157, 22)
        Me.ENROLLEDToolStripMenuItem.Text = "ENROLLED"
        '
        'NOTENROLLEDToolStripMenuItem
        '
        Me.NOTENROLLEDToolStripMenuItem.Name = "NOTENROLLEDToolStripMenuItem"
        Me.NOTENROLLEDToolStripMenuItem.Size = New System.Drawing.Size(157, 22)
        Me.NOTENROLLEDToolStripMenuItem.Text = "NOT ENROLLED"
        '
        'WITHDRAWNToolStripMenuItem
        '
        Me.WITHDRAWNToolStripMenuItem.Name = "WITHDRAWNToolStripMenuItem"
        Me.WITHDRAWNToolStripMenuItem.Size = New System.Drawing.Size(157, 22)
        Me.WITHDRAWNToolStripMenuItem.Text = "WITHDRAWN"
        '
        'EnrolledAsToolStripMenuItem
        '
        Me.EnrolledAsToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NEWToolStripMenuItem, Me.OLDToolStripMenuItem, Me.RETURNEEToolStripMenuItem, Me.TRANFEREEToolStripMenuItem, Me.NdBachelorsDegreeToolStripMenuItem})
        Me.EnrolledAsToolStripMenuItem.Name = "EnrolledAsToolStripMenuItem"
        Me.EnrolledAsToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.EnrolledAsToolStripMenuItem.Text = "Enrolled As"
        '
        'NEWToolStripMenuItem
        '
        Me.NEWToolStripMenuItem.Name = "NEWToolStripMenuItem"
        Me.NEWToolStripMenuItem.Size = New System.Drawing.Size(191, 22)
        Me.NEWToolStripMenuItem.Text = "NEW"
        '
        'OLDToolStripMenuItem
        '
        Me.OLDToolStripMenuItem.Name = "OLDToolStripMenuItem"
        Me.OLDToolStripMenuItem.Size = New System.Drawing.Size(191, 22)
        Me.OLDToolStripMenuItem.Text = "OLD"
        '
        'RETURNEEToolStripMenuItem
        '
        Me.RETURNEEToolStripMenuItem.Name = "RETURNEEToolStripMenuItem"
        Me.RETURNEEToolStripMenuItem.Size = New System.Drawing.Size(191, 22)
        Me.RETURNEEToolStripMenuItem.Text = "RETURNEE"
        '
        'TRANFEREEToolStripMenuItem
        '
        Me.TRANFEREEToolStripMenuItem.Name = "TRANFEREEToolStripMenuItem"
        Me.TRANFEREEToolStripMenuItem.Size = New System.Drawing.Size(191, 22)
        Me.TRANFEREEToolStripMenuItem.Text = "TRANSFEREE"
        '
        'NdBachelorsDegreeToolStripMenuItem
        '
        Me.NdBachelorsDegreeToolStripMenuItem.Name = "NdBachelorsDegreeToolStripMenuItem"
        Me.NdBachelorsDegreeToolStripMenuItem.Size = New System.Drawing.Size(191, 22)
        Me.NdBachelorsDegreeToolStripMenuItem.Text = "2nd Bachelor's Degree"
        '
        'ModifyYearLevelToolStripMenuItem
        '
        Me.ModifyYearLevelToolStripMenuItem.Name = "ModifyYearLevelToolStripMenuItem"
        Me.ModifyYearLevelToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ModifyYearLevelToolStripMenuItem.Tag = "4"
        Me.ModifyYearLevelToolStripMenuItem.Text = "Modify Year Level"
        '
        'ModifySemesterToolStripMenuItem
        '
        Me.ModifySemesterToolStripMenuItem.Name = "ModifySemesterToolStripMenuItem"
        Me.ModifySemesterToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ModifySemesterToolStripMenuItem.Tag = "5"
        Me.ModifySemesterToolStripMenuItem.Text = "Modify Semester"
        '
        'ModifyAdmissionNumberToolStripMenuItem
        '
        Me.ModifyAdmissionNumberToolStripMenuItem.Name = "ModifyAdmissionNumberToolStripMenuItem"
        Me.ModifyAdmissionNumberToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ModifyAdmissionNumberToolStripMenuItem.Tag = "6"
        Me.ModifyAdmissionNumberToolStripMenuItem.Text = "Modify Admission Number"
        '
        'ADDDROPSubjectToolStripMenuItem
        '
        Me.ADDDROPSubjectToolStripMenuItem.Name = "ADDDROPSubjectToolStripMenuItem"
        Me.ADDDROPSubjectToolStripMenuItem.Size = New System.Drawing.Size(218, 22)
        Me.ADDDROPSubjectToolStripMenuItem.Text = "ADD/DROP Subject"
        '
        'ToolTip1
        '
        Me.ToolTip1.IsBalloon = True
        Me.ToolTip1.ToolTipIcon = System.Windows.Forms.ToolTipIcon.Info
        Me.ToolTip1.ToolTipTitle = "Tip"
        '
        'fmaStudentListForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Azure
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1139, 446)
        Me.Controls.Add(Me.GroupPanel2)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "fmaStudentListForm"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Grade Management By Students"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        Me.GroupPanel2.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        CType(Me.tdbViewer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox2.ResumeLayout(False)
        CType(Me.stillSpinner, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.rollingSpinner, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.GridControl1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupPanel4.ResumeLayout(False)
        Me.GroupPanel4.PerformLayout()
        Me.GroupPanel1.ResumeLayout(False)
        Me.Panel1.ResumeLayout(False)
        Me.Panel1.PerformLayout()
        Me.CMenuStripOperations.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents txtCourseID As System.Windows.Forms.TextBox
    Friend WithEvents cmbCourse As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtBatchID As System.Windows.Forms.TextBox
    Friend WithEvents cmbBatch As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX2 As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnSearchCondition As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnClearFilter As DevComponents.DotNetBar.ButtonX
    Friend WithEvents txtStudentName As System.Windows.Forms.TextBox
    Friend WithEvents LabelX3 As DevComponents.DotNetBar.LabelX
    Friend WithEvents tdbViewer As C1.Win.C1TrueDBGrid.C1TrueDBGrid
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents lblStatus As DevComponents.DotNetBar.LabelX
    Friend WithEvents rollingSpinner As System.Windows.Forms.PictureBox
    Friend WithEvents stillSpinner As System.Windows.Forms.PictureBox
    Friend WithEvents CMenuStripOperations As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents AssignScheduleToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ViewAssessmentToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ViewGradesToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents btnRemove As DevComponents.DotNetBar.ButtonX
    Friend WithEvents Label1 As Label
    Friend WithEvents PreviewCORToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents GroupPanel1 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents GroupPanel4 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents LabelControl1 As DevExpress.XtraEditors.LabelControl
    Friend WithEvents Panel1 As Panel
    Friend WithEvents LabelX6 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX7 As DevComponents.DotNetBar.LabelX
    Friend WithEvents ToolTip1 As ToolTip
    Friend WithEvents cmbyearbatch As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX4 As DevComponents.DotNetBar.LabelX
    Friend WithEvents cmbCategory As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents LabelX5 As DevComponents.DotNetBar.LabelX
    Friend WithEvents ModifyBatchToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ModifyScholarshipGrantToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ModifyCourseGradeToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents MarkAsEnrolledToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ENROLLEDToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents NOTENROLLEDToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents WITHDRAWNToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents EnrolledAsToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents NEWToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents OLDToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents RETURNEEToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents TRANFEREEToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents NdBachelorsDegreeToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents GrantToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents RemoveToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ModifyYearLevelToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ModifySemesterToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents ADDDROPSubjectToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents Panel2 As Panel
    Friend WithEvents ModifyAdmissionNumberToolStripMenuItem As ToolStripMenuItem
    Friend WithEvents btnPrint As DevComponents.DotNetBar.ButtonX
    Friend WithEvents GridControl1 As DevExpress.XtraGrid.GridControl
    Friend WithEvents GridView1 As DevExpress.XtraGrid.Views.Grid.GridView
    Friend WithEvents btndelete As DevComponents.DotNetBar.ButtonX
    Friend WithEvents chkViewDeleted As CheckBox
    Friend WithEvents btnRetrieve As DevComponents.DotNetBar.ButtonX
End Class
