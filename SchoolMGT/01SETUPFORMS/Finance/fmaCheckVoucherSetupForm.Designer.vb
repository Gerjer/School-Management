<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class fmaCheckVoucherSetupForm
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
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle5 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle4 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(fmaCheckVoucherSetupForm))
        Me.PanelEx1 = New DevComponents.DotNetBar.PanelEx()
        Me.WinLabel = New DevComponents.DotNetBar.LabelX()
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.btnNewVC = New DevComponents.DotNetBar.ButtonX()
        Me.btnSave = New DevComponents.DotNetBar.ButtonX()
        Me.btnCancel = New DevComponents.DotNetBar.ButtonX()
        Me.GroupPanel3 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.btnRemove = New System.Windows.Forms.Button()
        Me.btnClear = New System.Windows.Forms.Button()
        Me.LabelX13 = New DevComponents.DotNetBar.LabelX()
        Me.txtTotalCredit = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtTotalDebit = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.dgvFEES = New DevComponents.DotNetBar.Controls.DataGridViewX()
        Me.LabelX2 = New DevComponents.DotNetBar.LabelX()
        Me.txtAmoutInWords = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.txtDRCRType = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX12 = New DevComponents.DotNetBar.LabelX()
        Me.diCreditAmount = New DevComponents.Editors.DoubleInput()
        Me.LabelX10 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX11 = New DevComponents.DotNetBar.LabelX()
        Me.diDebitAmount = New DevComponents.Editors.DoubleInput()
        Me.btnAddDR = New DevComponents.DotNetBar.ButtonX()
        Me.txtDebit = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.txtDRid = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtPayto = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.diAmount = New DevComponents.Editors.DoubleInput()
        Me.LabelX4 = New DevComponents.DotNetBar.LabelX()
        Me.LabelX3 = New DevComponents.DotNetBar.LabelX()
        Me.txtRemarks = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.GroupPanel1 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.txtVoucherID = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtRequestedBy = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX9 = New DevComponents.DotNetBar.LabelX()
        Me.txtBankAcctNo = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.cmbBankAccount = New DevComponents.DotNetBar.Controls.ComboBoxEx()
        Me.LabelX8 = New DevComponents.DotNetBar.LabelX()
        Me.txtCheckNo = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX7 = New DevComponents.DotNetBar.LabelX()
        Me.txtVoucherNumber = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.LabelX6 = New DevComponents.DotNetBar.LabelX()
        Me.dtpPayDate = New DevComponents.Editors.DateTimeAdv.DateTimeInput()
        Me.LabelX5 = New DevComponents.DotNetBar.LabelX()
        Me.Column1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PanelEx1.SuspendLayout()
        Me.GroupPanel2.SuspendLayout()
        Me.Panel1.SuspendLayout()
        Me.GroupPanel3.SuspendLayout()
        Me.Panel2.SuspendLayout()
        CType(Me.dgvFEES, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox1.SuspendLayout()
        CType(Me.diCreditAmount, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.diDebitAmount, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.diAmount, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupPanel1.SuspendLayout()
        CType(Me.dtpPayDate, System.ComponentModel.ISupportInitialize).BeginInit()
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
        Me.PanelEx1.Name = "PanelEx1"
        Me.PanelEx1.Size = New System.Drawing.Size(1531, 43)
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
        Me.WinLabel.Dock = System.Windows.Forms.DockStyle.Fill
        Me.WinLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.WinLabel.Location = New System.Drawing.Point(0, 0)
        Me.WinLabel.Name = "WinLabel"
        Me.WinLabel.Size = New System.Drawing.Size(1531, 43)
        Me.WinLabel.TabIndex = 20
        Me.WinLabel.Text = "ADD CHECK VOUCHER"
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
        Me.GroupPanel2.Controls.Add(Me.Panel1)
        Me.GroupPanel2.Controls.Add(Me.GroupPanel3)
        Me.GroupPanel2.Controls.Add(Me.GroupPanel1)
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 43)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Padding = New System.Windows.Forms.Padding(10, 0, 10, 0)
        Me.GroupPanel2.Size = New System.Drawing.Size(1531, 774)
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
        'Panel1
        '
        Me.Panel1.BackColor = System.Drawing.Color.Transparent
        Me.Panel1.Controls.Add(Me.btnNewVC)
        Me.Panel1.Controls.Add(Me.btnSave)
        Me.Panel1.Controls.Add(Me.btnCancel)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Panel1.Location = New System.Drawing.Point(10, 711)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Padding = New System.Windows.Forms.Padding(0, 5, 0, 5)
        Me.Panel1.Size = New System.Drawing.Size(1505, 57)
        Me.Panel1.TabIndex = 151
        '
        'btnNewVC
        '
        Me.btnNewVC.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnNewVC.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnNewVC.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnNewVC.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnNewVC.Image = Global.SchoolMGT.My.Resources.Resources.add
        Me.btnNewVC.Location = New System.Drawing.Point(0, 5)
        Me.btnNewVC.Name = "btnNewVC"
        Me.btnNewVC.Size = New System.Drawing.Size(159, 47)
        Me.btnNewVC.TabIndex = 187
        Me.btnNewVC.Text = "Add New Voucher"
        Me.btnNewVC.Tooltip = "New Voucher"
        Me.btnNewVC.Visible = False
        '
        'btnSave
        '
        Me.btnSave.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnSave.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnSave.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnSave.Enabled = False
        Me.btnSave.Location = New System.Drawing.Point(1319, 5)
        Me.btnSave.Name = "btnSave"
        Me.btnSave.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.btnSave.Size = New System.Drawing.Size(93, 47)
        Me.btnSave.TabIndex = 9
        Me.btnSave.Text = "Save"
        '
        'btnCancel
        '
        Me.btnCancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnCancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnCancel.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnCancel.Location = New System.Drawing.Point(1412, 5)
        Me.btnCancel.Name = "btnCancel"
        Me.btnCancel.Shortcuts.Add(DevComponents.DotNetBar.eShortcut.CtrlS)
        Me.btnCancel.Size = New System.Drawing.Size(93, 47)
        Me.btnCancel.TabIndex = 10
        Me.btnCancel.Text = "Cancel"
        '
        'GroupPanel3
        '
        Me.GroupPanel3.AutoScroll = True
        Me.GroupPanel3.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel3.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel3.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel3.Controls.Add(Me.Panel2)
        Me.GroupPanel3.Controls.Add(Me.dgvFEES)
        Me.GroupPanel3.Controls.Add(Me.LabelX2)
        Me.GroupPanel3.Controls.Add(Me.txtAmoutInWords)
        Me.GroupPanel3.Controls.Add(Me.GroupBox1)
        Me.GroupPanel3.Controls.Add(Me.txtPayto)
        Me.GroupPanel3.Controls.Add(Me.LabelX1)
        Me.GroupPanel3.Controls.Add(Me.diAmount)
        Me.GroupPanel3.Controls.Add(Me.LabelX4)
        Me.GroupPanel3.Controls.Add(Me.LabelX3)
        Me.GroupPanel3.Controls.Add(Me.txtRemarks)
        Me.GroupPanel3.Dock = System.Windows.Forms.DockStyle.Top
        Me.GroupPanel3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel3.Location = New System.Drawing.Point(10, 244)
        Me.GroupPanel3.Name = "GroupPanel3"
        Me.GroupPanel3.Size = New System.Drawing.Size(1505, 467)
        '
        '
        '
        Me.GroupPanel3.Style.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.GroupPanel3.Style.BackColorGradientAngle = 90
        Me.GroupPanel3.Style.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.GroupPanel3.Style.BorderBottom = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel3.Style.BorderBottomWidth = 1
        Me.GroupPanel3.Style.BorderColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBorder
        Me.GroupPanel3.Style.BorderLeft = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel3.Style.BorderLeftWidth = 1
        Me.GroupPanel3.Style.BorderRight = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel3.Style.BorderRightWidth = 1
        Me.GroupPanel3.Style.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.GroupPanel3.Style.BorderTopWidth = 1
        Me.GroupPanel3.Style.CornerDiameter = 4
        Me.GroupPanel3.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded
        Me.GroupPanel3.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel3.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel3.TabIndex = 186
        Me.GroupPanel3.Text = "Description"
        '
        'Panel2
        '
        Me.Panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel2.Controls.Add(Me.btnRemove)
        Me.Panel2.Controls.Add(Me.btnClear)
        Me.Panel2.Controls.Add(Me.LabelX13)
        Me.Panel2.Controls.Add(Me.txtTotalCredit)
        Me.Panel2.Controls.Add(Me.txtTotalDebit)
        Me.Panel2.Location = New System.Drawing.Point(847, 217)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(646, 41)
        Me.Panel2.TabIndex = 197
        '
        'btnRemove
        '
        Me.btnRemove.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnRemove.Enabled = False
        Me.btnRemove.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnRemove.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnRemove.ForeColor = System.Drawing.Color.Navy
        Me.btnRemove.Image = Global.SchoolMGT.My.Resources.Resources.cancel_32x32
        Me.btnRemove.Location = New System.Drawing.Point(175, 0)
        Me.btnRemove.Name = "btnRemove"
        Me.btnRemove.Size = New System.Drawing.Size(175, 39)
        Me.btnRemove.TabIndex = 198
        Me.btnRemove.Text = "Remove"
        Me.btnRemove.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnRemove.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnRemove.UseVisualStyleBackColor = True
        '
        'btnClear
        '
        Me.btnClear.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnClear.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClear.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClear.ForeColor = System.Drawing.Color.Navy
        Me.btnClear.Image = Global.SchoolMGT.My.Resources.Resources.cancel
        Me.btnClear.Location = New System.Drawing.Point(0, 0)
        Me.btnClear.Name = "btnClear"
        Me.btnClear.Size = New System.Drawing.Size(175, 39)
        Me.btnClear.TabIndex = 197
        Me.btnClear.Text = "Clear"
        Me.btnClear.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClear.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnClear.UseVisualStyleBackColor = True
        '
        'LabelX13
        '
        Me.LabelX13.AutoSize = True
        Me.LabelX13.BackColor = System.Drawing.Color.Transparent
        Me.LabelX13.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX13.Location = New System.Drawing.Point(361, 10)
        Me.LabelX13.Name = "LabelX13"
        Me.LabelX13.Size = New System.Drawing.Size(56, 21)
        Me.LabelX13.TabIndex = 196
        Me.LabelX13.Text = "TOTAL"
        Me.LabelX13.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'txtTotalCredit
        '
        Me.txtTotalCredit.AccessibleName = "product_item"
        '
        '
        '
        Me.txtTotalCredit.Border.Class = "TextBoxBorder"
        Me.txtTotalCredit.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtTotalCredit.FocusHighlightEnabled = True
        Me.txtTotalCredit.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtTotalCredit.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtTotalCredit.Location = New System.Drawing.Point(543, 5)
        Me.txtTotalCredit.Name = "txtTotalCredit"
        Me.txtTotalCredit.ReadOnly = True
        Me.txtTotalCredit.Size = New System.Drawing.Size(98, 26)
        Me.txtTotalCredit.TabIndex = 194
        Me.txtTotalCredit.Text = "0.00"
        Me.txtTotalCredit.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txtTotalDebit
        '
        Me.txtTotalDebit.AccessibleName = "product_item"
        '
        '
        '
        Me.txtTotalDebit.Border.Class = "TextBoxBorder"
        Me.txtTotalDebit.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtTotalDebit.FocusHighlightEnabled = True
        Me.txtTotalDebit.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtTotalDebit.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtTotalDebit.Location = New System.Drawing.Point(442, 5)
        Me.txtTotalDebit.Name = "txtTotalDebit"
        Me.txtTotalDebit.ReadOnly = True
        Me.txtTotalDebit.Size = New System.Drawing.Size(98, 26)
        Me.txtTotalDebit.TabIndex = 195
        Me.txtTotalDebit.Text = "0.00"
        Me.txtTotalDebit.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'dgvFEES
        '
        Me.dgvFEES.AllowUserToAddRows = False
        Me.dgvFEES.AllowUserToDeleteRows = False
        Me.dgvFEES.AllowUserToResizeColumns = False
        Me.dgvFEES.AllowUserToResizeRows = False
        Me.dgvFEES.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter
        DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.dgvFEES.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.dgvFEES.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgvFEES.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Column1, Me.Column2, Me.Column3, Me.Column4, Me.Column5})
        DataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.dgvFEES.DefaultCellStyle = DataGridViewCellStyle5
        Me.dgvFEES.GridColor = System.Drawing.Color.FromArgb(CType(CType(208, Byte), Integer), CType(CType(215, Byte), Integer), CType(CType(229, Byte), Integer))
        Me.dgvFEES.Location = New System.Drawing.Point(847, 19)
        Me.dgvFEES.Name = "dgvFEES"
        Me.dgvFEES.ReadOnly = True
        Me.dgvFEES.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.dgvFEES.Size = New System.Drawing.Size(646, 203)
        Me.dgvFEES.TabIndex = 156
        '
        'LabelX2
        '
        Me.LabelX2.AutoSize = True
        Me.LabelX2.BackColor = System.Drawing.Color.Transparent
        Me.LabelX2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX2.Location = New System.Drawing.Point(22, 82)
        Me.LabelX2.Name = "LabelX2"
        Me.LabelX2.Size = New System.Drawing.Size(102, 17)
        Me.LabelX2.TabIndex = 155
        Me.LabelX2.Text = "Amount in Words"
        '
        'txtAmoutInWords
        '
        Me.txtAmoutInWords.AccessibleName = "product_item"
        '
        '
        '
        Me.txtAmoutInWords.Border.Class = "TextBoxBorder"
        Me.txtAmoutInWords.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtAmoutInWords.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtAmoutInWords.FocusHighlightEnabled = True
        Me.txtAmoutInWords.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtAmoutInWords.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtAmoutInWords.Location = New System.Drawing.Point(141, 80)
        Me.txtAmoutInWords.Name = "txtAmoutInWords"
        Me.txtAmoutInWords.ReadOnly = True
        Me.txtAmoutInWords.Size = New System.Drawing.Size(699, 22)
        Me.txtAmoutInWords.TabIndex = 154
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.txtDRCRType)
        Me.GroupBox1.Controls.Add(Me.LabelX12)
        Me.GroupBox1.Controls.Add(Me.diCreditAmount)
        Me.GroupBox1.Controls.Add(Me.LabelX10)
        Me.GroupBox1.Controls.Add(Me.LabelX11)
        Me.GroupBox1.Controls.Add(Me.diDebitAmount)
        Me.GroupBox1.Controls.Add(Me.btnAddDR)
        Me.GroupBox1.Controls.Add(Me.txtDebit)
        Me.GroupBox1.Controls.Add(Me.txtDRid)
        Me.GroupBox1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupBox1.Location = New System.Drawing.Point(0, 285)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(1499, 161)
        Me.GroupBox1.TabIndex = 153
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ACCOUNTING ENTRIES"
        '
        'txtDRCRType
        '
        Me.txtDRCRType.AccessibleName = "product_item"
        '
        '
        '
        Me.txtDRCRType.Border.Class = "TextBoxBorder"
        Me.txtDRCRType.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtDRCRType.FocusHighlightEnabled = True
        Me.txtDRCRType.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtDRCRType.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtDRCRType.Location = New System.Drawing.Point(1108, 73)
        Me.txtDRCRType.Name = "txtDRCRType"
        Me.txtDRCRType.Size = New System.Drawing.Size(102, 26)
        Me.txtDRCRType.TabIndex = 193
        Me.txtDRCRType.Visible = False
        '
        'LabelX12
        '
        Me.LabelX12.BackColor = System.Drawing.Color.Transparent
        Me.LabelX12.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX12.Location = New System.Drawing.Point(744, 50)
        Me.LabelX12.Name = "LabelX12"
        Me.LabelX12.Size = New System.Drawing.Size(185, 17)
        Me.LabelX12.TabIndex = 192
        Me.LabelX12.Text = "CREDIT"
        Me.LabelX12.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'diCreditAmount
        '
        '
        '
        '
        Me.diCreditAmount.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.diCreditAmount.Enabled = False
        Me.diCreditAmount.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.diCreditAmount.Increment = 1.0R
        Me.diCreditAmount.Location = New System.Drawing.Point(744, 73)
        Me.diCreditAmount.Name = "diCreditAmount"
        Me.diCreditAmount.ShowUpDown = True
        Me.diCreditAmount.Size = New System.Drawing.Size(185, 26)
        Me.diCreditAmount.TabIndex = 191
        '
        'LabelX10
        '
        Me.LabelX10.BackColor = System.Drawing.Color.Transparent
        Me.LabelX10.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX10.Location = New System.Drawing.Point(6, 50)
        Me.LabelX10.Name = "LabelX10"
        Me.LabelX10.Size = New System.Drawing.Size(506, 17)
        Me.LabelX10.TabIndex = 190
        Me.LabelX10.Text = "CHARTS OF ACCOUNT"
        Me.LabelX10.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'LabelX11
        '
        Me.LabelX11.BackColor = System.Drawing.Color.Transparent
        Me.LabelX11.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX11.Location = New System.Drawing.Point(544, 50)
        Me.LabelX11.Name = "LabelX11"
        Me.LabelX11.Size = New System.Drawing.Size(185, 17)
        Me.LabelX11.TabIndex = 189
        Me.LabelX11.Text = "DEBIT"
        Me.LabelX11.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'diDebitAmount
        '
        '
        '
        '
        Me.diDebitAmount.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.diDebitAmount.Enabled = False
        Me.diDebitAmount.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.diDebitAmount.Increment = 1.0R
        Me.diDebitAmount.Location = New System.Drawing.Point(544, 73)
        Me.diDebitAmount.Name = "diDebitAmount"
        Me.diDebitAmount.ShowUpDown = True
        Me.diDebitAmount.Size = New System.Drawing.Size(185, 26)
        Me.diDebitAmount.TabIndex = 187
        '
        'btnAddDR
        '
        Me.btnAddDR.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton
        Me.btnAddDR.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground
        Me.btnAddDR.Enabled = False
        Me.btnAddDR.Image = Global.SchoolMGT.My.Resources.Resources.add
        Me.btnAddDR.Location = New System.Drawing.Point(975, 66)
        Me.btnAddDR.Name = "btnAddDR"
        Me.btnAddDR.Size = New System.Drawing.Size(114, 33)
        Me.btnAddDR.TabIndex = 186
        Me.btnAddDR.Text = "Add"
        Me.btnAddDR.Tooltip = "COR Print"
        '
        'txtDebit
        '
        Me.txtDebit.AccessibleName = "batches"
        Me.txtDebit.DisplayMember = "Text"
        Me.txtDebit.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.txtDebit.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtDebit.FormattingEnabled = True
        Me.txtDebit.ItemHeight = 20
        Me.txtDebit.Location = New System.Drawing.Point(6, 73)
        Me.txtDebit.Name = "txtDebit"
        Me.txtDebit.Size = New System.Drawing.Size(506, 26)
        Me.txtDebit.TabIndex = 185
        '
        'txtDRid
        '
        Me.txtDRid.AccessibleName = ""
        '
        '
        '
        Me.txtDRid.Border.Class = "TextBoxBorder"
        Me.txtDRid.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtDRid.FocusHighlightEnabled = True
        Me.txtDRid.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtDRid.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtDRid.Location = New System.Drawing.Point(6, 105)
        Me.txtDRid.Name = "txtDRid"
        Me.txtDRid.ReadOnly = True
        Me.txtDRid.Size = New System.Drawing.Size(98, 26)
        Me.txtDRid.TabIndex = 184
        Me.txtDRid.Tag = "batches"
        Me.txtDRid.Visible = False
        '
        'txtPayto
        '
        Me.txtPayto.AccessibleName = "product_item"
        '
        '
        '
        Me.txtPayto.Border.Class = "TextBoxBorder"
        Me.txtPayto.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper
        Me.txtPayto.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtPayto.FocusHighlightEnabled = True
        Me.txtPayto.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtPayto.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtPayto.Location = New System.Drawing.Point(142, 17)
        Me.txtPayto.Name = "txtPayto"
        Me.txtPayto.Size = New System.Drawing.Size(699, 22)
        Me.txtPayto.TabIndex = 2
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.BackColor = System.Drawing.Color.Transparent
        Me.LabelX1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX1.Location = New System.Drawing.Point(23, 19)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(54, 17)
        Me.LabelX1.TabIndex = 15
        Me.LabelX1.Text = "PAID TO"
        '
        'diAmount
        '
        '
        '
        '
        Me.diAmount.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.diAmount.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.diAmount.Increment = 1.0R
        Me.diAmount.Location = New System.Drawing.Point(142, 48)
        Me.diAmount.Name = "diAmount"
        Me.diAmount.ShowUpDown = True
        Me.diAmount.Size = New System.Drawing.Size(185, 22)
        Me.diAmount.TabIndex = 5
        '
        'LabelX4
        '
        Me.LabelX4.AutoSize = True
        Me.LabelX4.BackColor = System.Drawing.Color.Transparent
        Me.LabelX4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX4.Location = New System.Drawing.Point(24, 53)
        Me.LabelX4.Name = "LabelX4"
        Me.LabelX4.Size = New System.Drawing.Size(108, 17)
        Me.LabelX4.TabIndex = 150
        Me.LabelX4.Text = "Amount in Figures"
        '
        'LabelX3
        '
        Me.LabelX3.AutoSize = True
        Me.LabelX3.BackColor = System.Drawing.Color.Transparent
        Me.LabelX3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX3.Location = New System.Drawing.Point(22, 120)
        Me.LabelX3.Name = "LabelX3"
        Me.LabelX3.Size = New System.Drawing.Size(94, 17)
        Me.LabelX3.TabIndex = 19
        Me.LabelX3.Text = "PARTICULARS"
        '
        'txtRemarks
        '
        Me.txtRemarks.AccessibleName = "product_item"
        '
        '
        '
        Me.txtRemarks.Border.Class = "TextBoxBorder"
        Me.txtRemarks.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtRemarks.FocusHighlightEnabled = True
        Me.txtRemarks.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtRemarks.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtRemarks.Location = New System.Drawing.Point(141, 118)
        Me.txtRemarks.Multiline = True
        Me.txtRemarks.Name = "txtRemarks"
        Me.txtRemarks.Size = New System.Drawing.Size(699, 140)
        Me.txtRemarks.TabIndex = 8
        '
        'GroupPanel1
        '
        Me.GroupPanel1.AutoScroll = True
        Me.GroupPanel1.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel1.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel1.Controls.Add(Me.txtVoucherID)
        Me.GroupPanel1.Controls.Add(Me.txtRequestedBy)
        Me.GroupPanel1.Controls.Add(Me.LabelX9)
        Me.GroupPanel1.Controls.Add(Me.txtBankAcctNo)
        Me.GroupPanel1.Controls.Add(Me.cmbBankAccount)
        Me.GroupPanel1.Controls.Add(Me.LabelX8)
        Me.GroupPanel1.Controls.Add(Me.txtCheckNo)
        Me.GroupPanel1.Controls.Add(Me.LabelX7)
        Me.GroupPanel1.Controls.Add(Me.txtVoucherNumber)
        Me.GroupPanel1.Controls.Add(Me.LabelX6)
        Me.GroupPanel1.Controls.Add(Me.dtpPayDate)
        Me.GroupPanel1.Controls.Add(Me.LabelX5)
        Me.GroupPanel1.Dock = System.Windows.Forms.DockStyle.Top
        Me.GroupPanel1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel1.Location = New System.Drawing.Point(10, 0)
        Me.GroupPanel1.Name = "GroupPanel1"
        Me.GroupPanel1.Size = New System.Drawing.Size(1505, 244)
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
        Me.GroupPanel1.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel1.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel1.TabIndex = 185
        Me.GroupPanel1.Text = "Details"
        '
        'txtVoucherID
        '
        Me.txtVoucherID.AccessibleName = "product_item"
        '
        '
        '
        Me.txtVoucherID.Border.Class = "TextBoxBorder"
        Me.txtVoucherID.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtVoucherID.FocusHighlightEnabled = True
        Me.txtVoucherID.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtVoucherID.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtVoucherID.Location = New System.Drawing.Point(403, 13)
        Me.txtVoucherID.Name = "txtVoucherID"
        Me.txtVoucherID.Size = New System.Drawing.Size(136, 26)
        Me.txtVoucherID.TabIndex = 163
        '
        'txtRequestedBy
        '
        Me.txtRequestedBy.AccessibleName = "product_item"
        '
        '
        '
        Me.txtRequestedBy.Border.Class = "TextBoxBorder"
        Me.txtRequestedBy.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtRequestedBy.FocusHighlightEnabled = True
        Me.txtRequestedBy.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtRequestedBy.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtRequestedBy.Location = New System.Drawing.Point(144, 183)
        Me.txtRequestedBy.Name = "txtRequestedBy"
        Me.txtRequestedBy.Size = New System.Drawing.Size(453, 26)
        Me.txtRequestedBy.TabIndex = 162
        '
        'LabelX9
        '
        Me.LabelX9.AutoSize = True
        Me.LabelX9.BackColor = System.Drawing.Color.Transparent
        Me.LabelX9.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX9.Location = New System.Drawing.Point(14, 188)
        Me.LabelX9.Name = "LabelX9"
        Me.LabelX9.Size = New System.Drawing.Size(136, 21)
        Me.LabelX9.TabIndex = 161
        Me.LabelX9.Text = "REQUESTED BY :"
        '
        'txtBankAcctNo
        '
        Me.txtBankAcctNo.AccessibleName = "product_item"
        '
        '
        '
        Me.txtBankAcctNo.Border.Class = "TextBoxBorder"
        Me.txtBankAcctNo.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtBankAcctNo.FocusHighlightEnabled = True
        Me.txtBankAcctNo.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtBankAcctNo.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtBankAcctNo.Location = New System.Drawing.Point(671, 142)
        Me.txtBankAcctNo.Name = "txtBankAcctNo"
        Me.txtBankAcctNo.Size = New System.Drawing.Size(222, 26)
        Me.txtBankAcctNo.TabIndex = 160
        '
        'cmbBankAccount
        '
        Me.cmbBankAccount.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.cmbBankAccount.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.cmbBankAccount.DisplayMember = "Text"
        Me.cmbBankAccount.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed
        Me.cmbBankAccount.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbBankAccount.FormattingEnabled = True
        Me.cmbBankAccount.ItemHeight = 16
        Me.cmbBankAccount.Location = New System.Drawing.Point(141, 147)
        Me.cmbBankAccount.Name = "cmbBankAccount"
        Me.cmbBankAccount.Size = New System.Drawing.Size(456, 22)
        Me.cmbBankAccount.TabIndex = 159
        '
        'LabelX8
        '
        Me.LabelX8.AutoSize = True
        Me.LabelX8.BackColor = System.Drawing.Color.Transparent
        Me.LabelX8.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX8.Location = New System.Drawing.Point(14, 147)
        Me.LabelX8.Name = "LabelX8"
        Me.LabelX8.Size = New System.Drawing.Size(55, 21)
        Me.LabelX8.TabIndex = 158
        Me.LabelX8.Text = "BANK :"
        '
        'txtCheckNo
        '
        Me.txtCheckNo.AccessibleName = "product_item"
        '
        '
        '
        Me.txtCheckNo.Border.Class = "TextBoxBorder"
        Me.txtCheckNo.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtCheckNo.FocusHighlightEnabled = True
        Me.txtCheckNo.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCheckNo.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtCheckNo.Location = New System.Drawing.Point(142, 105)
        Me.txtCheckNo.Name = "txtCheckNo"
        Me.txtCheckNo.Size = New System.Drawing.Size(245, 26)
        Me.txtCheckNo.TabIndex = 157
        '
        'LabelX7
        '
        Me.LabelX7.AutoSize = True
        Me.LabelX7.BackColor = System.Drawing.Color.Transparent
        Me.LabelX7.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX7.Location = New System.Drawing.Point(14, 110)
        Me.LabelX7.Name = "LabelX7"
        Me.LabelX7.Size = New System.Drawing.Size(95, 21)
        Me.LabelX7.TabIndex = 156
        Me.LabelX7.Text = "CHECK NO :"
        '
        'txtVoucherNumber
        '
        Me.txtVoucherNumber.AccessibleName = "product_item"
        '
        '
        '
        Me.txtVoucherNumber.Border.Class = "TextBoxBorder"
        Me.txtVoucherNumber.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtVoucherNumber.FocusHighlightEnabled = True
        Me.txtVoucherNumber.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtVoucherNumber.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtVoucherNumber.Location = New System.Drawing.Point(142, 57)
        Me.txtVoucherNumber.Name = "txtVoucherNumber"
        Me.txtVoucherNumber.Size = New System.Drawing.Size(245, 26)
        Me.txtVoucherNumber.TabIndex = 155
        '
        'LabelX6
        '
        Me.LabelX6.AutoSize = True
        Me.LabelX6.BackColor = System.Drawing.Color.Transparent
        Me.LabelX6.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX6.Location = New System.Drawing.Point(14, 62)
        Me.LabelX6.Name = "LabelX6"
        Me.LabelX6.Size = New System.Drawing.Size(119, 21)
        Me.LabelX6.TabIndex = 154
        Me.LabelX6.Text = "VOUCHER NO :"
        '
        'dtpPayDate
        '
        '
        '
        '
        Me.dtpPayDate.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.dtpPayDate.ButtonDropDown.Visible = True
        Me.dtpPayDate.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpPayDate.Location = New System.Drawing.Point(141, 13)
        '
        '
        '
        Me.dtpPayDate.MonthCalendar.AnnuallyMarkedDates = New Date(-1) {}
        Me.dtpPayDate.MonthCalendar.ClearButtonVisible = True
        '
        '
        '
        Me.dtpPayDate.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2
        Me.dtpPayDate.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpPayDate.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground
        Me.dtpPayDate.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.dtpPayDate.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder
        Me.dtpPayDate.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1
        Me.dtpPayDate.MonthCalendar.DisplayMonth = New Date(2016, 4, 1, 0, 0, 0, 0)
        Me.dtpPayDate.MonthCalendar.MarkedDates = New Date(-1) {}
        Me.dtpPayDate.MonthCalendar.MonthlyMarkedDates = New Date(-1) {}
        '
        '
        '
        Me.dtpPayDate.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.dtpPayDate.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpPayDate.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.dtpPayDate.MonthCalendar.TodayButtonVisible = True
        Me.dtpPayDate.Name = "dtpPayDate"
        Me.dtpPayDate.Size = New System.Drawing.Size(246, 26)
        Me.dtpPayDate.TabIndex = 153
        '
        'LabelX5
        '
        Me.LabelX5.AutoSize = True
        Me.LabelX5.BackColor = System.Drawing.Color.Transparent
        Me.LabelX5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX5.Location = New System.Drawing.Point(14, 18)
        Me.LabelX5.Name = "LabelX5"
        Me.LabelX5.Size = New System.Drawing.Size(54, 21)
        Me.LabelX5.TabIndex = 152
        Me.LabelX5.Text = "DATE :"
        '
        'Column1
        '
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Column1.DefaultCellStyle = DataGridViewCellStyle2
        Me.Column1.HeaderText = "COA CODE"
        Me.Column1.Name = "Column1"
        Me.Column1.ReadOnly = True
        Me.Column1.Resizable = System.Windows.Forms.DataGridViewTriState.[False]
        Me.Column1.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable
        '
        'Column2
        '
        Me.Column2.HeaderText = "DESCRIPTION"
        Me.Column2.Name = "Column2"
        Me.Column2.ReadOnly = True
        Me.Column2.Width = 300
        '
        'Column3
        '
        DataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight
        Me.Column3.DefaultCellStyle = DataGridViewCellStyle3
        Me.Column3.HeaderText = "DEBIT"
        Me.Column3.Name = "Column3"
        Me.Column3.ReadOnly = True
        '
        'Column4
        '
        DataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleRight
        Me.Column4.DefaultCellStyle = DataGridViewCellStyle4
        Me.Column4.HeaderText = "CREDIT"
        Me.Column4.Name = "Column4"
        Me.Column4.ReadOnly = True
        '
        'Column5
        '
        Me.Column5.HeaderText = "type"
        Me.Column5.Name = "Column5"
        Me.Column5.ReadOnly = True
        Me.Column5.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Programmatic
        '
        'fmaCheckVoucherSetupForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.OrangeRed
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.BottomLeftCornerSize = 0
        Me.BottomRightCornerSize = 0
        Me.ClientSize = New System.Drawing.Size(1531, 817)
        Me.Controls.Add(Me.GroupPanel2)
        Me.Controls.Add(Me.PanelEx1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "fmaCheckVoucherSetupForm"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "CHECK VOUCHER"
        Me.PanelEx1.ResumeLayout(False)
        Me.GroupPanel2.ResumeLayout(False)
        Me.Panel1.ResumeLayout(False)
        Me.GroupPanel3.ResumeLayout(False)
        Me.GroupPanel3.PerformLayout()
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        CType(Me.dgvFEES, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.diCreditAmount, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.diDebitAmount, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.diAmount, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupPanel1.ResumeLayout(False)
        Me.GroupPanel1.PerformLayout()
        CType(Me.dtpPayDate, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents PanelEx1 As DevComponents.DotNetBar.PanelEx
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents txtPayto As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX3 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtRemarks As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents WinLabel As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnSave As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnCancel As DevComponents.DotNetBar.ButtonX
    Friend WithEvents LabelX4 As DevComponents.DotNetBar.LabelX
    Friend WithEvents diAmount As DevComponents.Editors.DoubleInput
    Friend WithEvents LabelX5 As DevComponents.DotNetBar.LabelX
    Friend WithEvents dtpPayDate As DevComponents.Editors.DateTimeAdv.DateTimeInput
    Friend WithEvents txtVoucherNumber As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX6 As DevComponents.DotNetBar.LabelX
    Friend WithEvents GroupPanel1 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents Panel1 As Panel
    Friend WithEvents GroupPanel3 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents LabelX8 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtCheckNo As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX7 As DevComponents.DotNetBar.LabelX
    Friend WithEvents cmbBankAccount As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents GroupBox1 As GroupBox
    Friend WithEvents txtBankAcctNo As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX2 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtAmoutInWords As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtRequestedBy As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX9 As DevComponents.DotNetBar.LabelX
    Friend WithEvents dgvFEES As DevComponents.DotNetBar.Controls.DataGridViewX
    Friend WithEvents diDebitAmount As DevComponents.Editors.DoubleInput
    Friend WithEvents btnAddDR As DevComponents.DotNetBar.ButtonX
    Friend WithEvents txtDebit As DevComponents.DotNetBar.Controls.ComboBoxEx
    Friend WithEvents txtDRid As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX12 As DevComponents.DotNetBar.LabelX
    Friend WithEvents diCreditAmount As DevComponents.Editors.DoubleInput
    Friend WithEvents LabelX10 As DevComponents.DotNetBar.LabelX
    Friend WithEvents LabelX11 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtDRCRType As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents LabelX13 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtTotalDebit As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtTotalCredit As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents Panel2 As Panel
    Friend WithEvents txtVoucherID As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents btnClear As Button
    Friend WithEvents btnNewVC As DevComponents.DotNetBar.ButtonX
    Friend WithEvents btnRemove As Button
    Friend WithEvents Column1 As DataGridViewTextBoxColumn
    Friend WithEvents Column2 As DataGridViewTextBoxColumn
    Friend WithEvents Column3 As DataGridViewTextBoxColumn
    Friend WithEvents Column4 As DataGridViewTextBoxColumn
    Friend WithEvents Column5 As DataGridViewTextBoxColumn
End Class
