<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class fmaCheckVoucherList
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(fmaCheckVoucherList))
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle5 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle4 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Me.ComboItem4 = New DevComponents.Editors.ComboItem()
        Me.ComboItem3 = New DevComponents.Editors.ComboItem()
        Me.ComboItem2 = New DevComponents.Editors.ComboItem()
        Me.ComboItem1 = New DevComponents.Editors.ComboItem()
        Me.WinLabel = New DevComponents.DotNetBar.LabelX()
        Me.GroupPanel1 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.txtBankAccount = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtCheckNo = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtCVNumber = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtPaymentDate = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtJournalAmount = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtVoucherID = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.dtpTo = New DevComponents.Editors.DateTimeAdv.DateTimeInput()
        Me.LabelX1 = New DevComponents.DotNetBar.LabelX()
        Me.GroupPanel2 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.btnPrintList = New System.Windows.Forms.Button()
        Me.btnEdit = New System.Windows.Forms.Button()
        Me.btnPostToJournal = New System.Windows.Forms.Button()
        Me.btnPrint = New System.Windows.Forms.Button()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.btnSearch = New System.Windows.Forms.Button()
        Me.dtpFrom = New DevComponents.Editors.DateTimeAdv.DateTimeInput()
        Me.LabelX5 = New DevComponents.DotNetBar.LabelX()
        Me.GroupPanel3 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.tdbViewer = New C1.Win.C1TrueDBGrid.C1TrueDBGrid()
        Me.GroupPanel4 = New DevComponents.DotNetBar.Controls.GroupPanel()
        Me.lblIsPosted = New DevComponents.DotNetBar.LabelX()
        Me.Panel2 = New System.Windows.Forms.Panel()
        Me.LabelX13 = New DevComponents.DotNetBar.LabelX()
        Me.txtTotalCredit = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.txtTotalDebit = New DevComponents.DotNetBar.Controls.TextBoxX()
        Me.dgvFEES = New DevComponents.DotNetBar.Controls.DataGridViewX()
        Me.Column1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GroupPanel1.SuspendLayout()
        CType(Me.dtpTo, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupPanel2.SuspendLayout()
        CType(Me.dtpFrom, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupPanel3.SuspendLayout()
        CType(Me.tdbViewer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupPanel4.SuspendLayout()
        Me.Panel2.SuspendLayout()
        CType(Me.dgvFEES, System.ComponentModel.ISupportInitialize).BeginInit()
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
        'WinLabel
        '
        Me.WinLabel.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(128, Byte), Integer), CType(CType(0, Byte), Integer))
        Me.WinLabel.Dock = System.Windows.Forms.DockStyle.Top
        Me.WinLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.WinLabel.Location = New System.Drawing.Point(0, 0)
        Me.WinLabel.Name = "WinLabel"
        Me.WinLabel.Size = New System.Drawing.Size(1540, 43)
        Me.WinLabel.TabIndex = 21
        Me.WinLabel.Text = "CHECK VOUCHER LIST"
        Me.WinLabel.TextAlignment = System.Drawing.StringAlignment.Center
        '
        'GroupPanel1
        '
        Me.GroupPanel1.AutoScroll = True
        Me.GroupPanel1.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel1.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel1.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel1.Controls.Add(Me.txtBankAccount)
        Me.GroupPanel1.Controls.Add(Me.txtCheckNo)
        Me.GroupPanel1.Controls.Add(Me.txtCVNumber)
        Me.GroupPanel1.Controls.Add(Me.txtPaymentDate)
        Me.GroupPanel1.Controls.Add(Me.txtJournalAmount)
        Me.GroupPanel1.Controls.Add(Me.txtVoucherID)
        Me.GroupPanel1.Controls.Add(Me.dtpTo)
        Me.GroupPanel1.Controls.Add(Me.LabelX1)
        Me.GroupPanel1.Controls.Add(Me.GroupPanel2)
        Me.GroupPanel1.Controls.Add(Me.dtpFrom)
        Me.GroupPanel1.Controls.Add(Me.LabelX5)
        Me.GroupPanel1.Dock = System.Windows.Forms.DockStyle.Top
        Me.GroupPanel1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel1.Location = New System.Drawing.Point(0, 43)
        Me.GroupPanel1.Name = "GroupPanel1"
        Me.GroupPanel1.Size = New System.Drawing.Size(1540, 173)
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
        Me.GroupPanel1.TabIndex = 186
        Me.GroupPanel1.Text = "Filter"
        '
        'txtBankAccount
        '
        Me.txtBankAccount.AccessibleName = "product_item"
        '
        '
        '
        Me.txtBankAccount.Border.Class = "TextBoxBorder"
        Me.txtBankAccount.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtBankAccount.FocusHighlightEnabled = True
        Me.txtBankAccount.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtBankAccount.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtBankAccount.Location = New System.Drawing.Point(625, 17)
        Me.txtBankAccount.Name = "txtBankAccount"
        Me.txtBankAccount.Size = New System.Drawing.Size(346, 26)
        Me.txtBankAccount.TabIndex = 172
        Me.txtBankAccount.Visible = False
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
        Me.txtCheckNo.Location = New System.Drawing.Point(1023, 63)
        Me.txtCheckNo.Name = "txtCheckNo"
        Me.txtCheckNo.Size = New System.Drawing.Size(136, 26)
        Me.txtCheckNo.TabIndex = 171
        Me.txtCheckNo.Visible = False
        '
        'txtCVNumber
        '
        Me.txtCVNumber.AccessibleName = "product_item"
        '
        '
        '
        Me.txtCVNumber.Border.Class = "TextBoxBorder"
        Me.txtCVNumber.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtCVNumber.FocusHighlightEnabled = True
        Me.txtCVNumber.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCVNumber.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtCVNumber.Location = New System.Drawing.Point(835, 63)
        Me.txtCVNumber.Name = "txtCVNumber"
        Me.txtCVNumber.Size = New System.Drawing.Size(136, 26)
        Me.txtCVNumber.TabIndex = 170
        Me.txtCVNumber.Visible = False
        '
        'txtPaymentDate
        '
        Me.txtPaymentDate.AccessibleName = "product_item"
        '
        '
        '
        Me.txtPaymentDate.Border.Class = "TextBoxBorder"
        Me.txtPaymentDate.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtPaymentDate.FocusHighlightEnabled = True
        Me.txtPaymentDate.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtPaymentDate.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtPaymentDate.Location = New System.Drawing.Point(625, 62)
        Me.txtPaymentDate.Name = "txtPaymentDate"
        Me.txtPaymentDate.Size = New System.Drawing.Size(136, 26)
        Me.txtPaymentDate.TabIndex = 169
        Me.txtPaymentDate.Visible = False
        '
        'txtJournalAmount
        '
        Me.txtJournalAmount.AccessibleName = "product_item"
        '
        '
        '
        Me.txtJournalAmount.Border.Class = "TextBoxBorder"
        Me.txtJournalAmount.FocusHighlightColor = System.Drawing.Color.LightBlue
        Me.txtJournalAmount.FocusHighlightEnabled = True
        Me.txtJournalAmount.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtJournalAmount.ForeColor = System.Drawing.Color.MidnightBlue
        Me.txtJournalAmount.Location = New System.Drawing.Point(413, 62)
        Me.txtJournalAmount.Name = "txtJournalAmount"
        Me.txtJournalAmount.Size = New System.Drawing.Size(136, 26)
        Me.txtJournalAmount.TabIndex = 168
        Me.txtJournalAmount.Visible = False
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
        Me.txtVoucherID.Location = New System.Drawing.Point(413, 18)
        Me.txtVoucherID.Name = "txtVoucherID"
        Me.txtVoucherID.Size = New System.Drawing.Size(136, 26)
        Me.txtVoucherID.TabIndex = 167
        '
        'dtpTo
        '
        '
        '
        '
        Me.dtpTo.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.dtpTo.ButtonDropDown.Visible = True
        Me.dtpTo.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpTo.Location = New System.Drawing.Point(141, 57)
        '
        '
        '
        Me.dtpTo.MonthCalendar.AnnuallyMarkedDates = New Date(-1) {}
        Me.dtpTo.MonthCalendar.ClearButtonVisible = True
        '
        '
        '
        Me.dtpTo.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2
        Me.dtpTo.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpTo.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground
        Me.dtpTo.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.dtpTo.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder
        Me.dtpTo.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1
        Me.dtpTo.MonthCalendar.DisplayMonth = New Date(2016, 4, 1, 0, 0, 0, 0)
        Me.dtpTo.MonthCalendar.MarkedDates = New Date(-1) {}
        Me.dtpTo.MonthCalendar.MonthlyMarkedDates = New Date(-1) {}
        '
        '
        '
        Me.dtpTo.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.dtpTo.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpTo.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.dtpTo.MonthCalendar.TodayButtonVisible = True
        Me.dtpTo.Name = "dtpTo"
        Me.dtpTo.Size = New System.Drawing.Size(246, 26)
        Me.dtpTo.TabIndex = 166
        '
        'LabelX1
        '
        Me.LabelX1.AutoSize = True
        Me.LabelX1.BackColor = System.Drawing.Color.Transparent
        Me.LabelX1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX1.Location = New System.Drawing.Point(14, 62)
        Me.LabelX1.Name = "LabelX1"
        Me.LabelX1.Size = New System.Drawing.Size(76, 21)
        Me.LabelX1.TabIndex = 165
        Me.LabelX1.Text = "DATE TO:"
        '
        'GroupPanel2
        '
        Me.GroupPanel2.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel2.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel2.Controls.Add(Me.btnPrintList)
        Me.GroupPanel2.Controls.Add(Me.btnEdit)
        Me.GroupPanel2.Controls.Add(Me.btnPostToJournal)
        Me.GroupPanel2.Controls.Add(Me.btnPrint)
        Me.GroupPanel2.Controls.Add(Me.btnClose)
        Me.GroupPanel2.Controls.Add(Me.btnSearch)
        Me.GroupPanel2.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GroupPanel2.Location = New System.Drawing.Point(0, 114)
        Me.GroupPanel2.Name = "GroupPanel2"
        Me.GroupPanel2.Size = New System.Drawing.Size(1534, 38)
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
        Me.GroupPanel2.TabIndex = 164
        '
        'btnPrintList
        '
        Me.btnPrintList.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnPrintList.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnPrintList.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPrintList.ForeColor = System.Drawing.Color.Navy
        Me.btnPrintList.Image = Global.SchoolMGT.My.Resources.Resources._1497287047_custom_reports
        Me.btnPrintList.Location = New System.Drawing.Point(737, 0)
        Me.btnPrintList.Name = "btnPrintList"
        Me.btnPrintList.Size = New System.Drawing.Size(175, 32)
        Me.btnPrintList.TabIndex = 28
        Me.btnPrintList.Text = "Print Listing"
        Me.btnPrintList.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnPrintList.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnPrintList.UseVisualStyleBackColor = True
        '
        'btnEdit
        '
        Me.btnEdit.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnEdit.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnEdit.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnEdit.ForeColor = System.Drawing.Color.Navy
        Me.btnEdit.Image = Global.SchoolMGT.My.Resources.Resources.Copy_of_Blocnote_32
        Me.btnEdit.Location = New System.Drawing.Point(562, 0)
        Me.btnEdit.Name = "btnEdit"
        Me.btnEdit.Size = New System.Drawing.Size(175, 32)
        Me.btnEdit.TabIndex = 27
        Me.btnEdit.Text = "Edit"
        Me.btnEdit.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnEdit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnEdit.UseVisualStyleBackColor = True
        Me.btnEdit.Visible = False
        '
        'btnPostToJournal
        '
        Me.btnPostToJournal.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnPostToJournal.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnPostToJournal.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPostToJournal.ForeColor = System.Drawing.Color.Navy
        Me.btnPostToJournal.Image = Global.SchoolMGT.My.Resources.Resources.Save_24x24
        Me.btnPostToJournal.Location = New System.Drawing.Point(350, 0)
        Me.btnPostToJournal.Name = "btnPostToJournal"
        Me.btnPostToJournal.Size = New System.Drawing.Size(212, 32)
        Me.btnPostToJournal.TabIndex = 26
        Me.btnPostToJournal.Text = "Post Journal Entry"
        Me.btnPostToJournal.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnPostToJournal.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnPostToJournal.UseVisualStyleBackColor = True
        Me.btnPostToJournal.Visible = False
        '
        'btnPrint
        '
        Me.btnPrint.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnPrint.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnPrint.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPrint.ForeColor = System.Drawing.Color.Navy
        Me.btnPrint.Image = Global.SchoolMGT.My.Resources.Resources.Print_24x24
        Me.btnPrint.Location = New System.Drawing.Point(175, 0)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(175, 32)
        Me.btnPrint.TabIndex = 25
        Me.btnPrint.Text = "Print"
        Me.btnPrint.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnPrint.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnPrint.UseVisualStyleBackColor = True
        Me.btnPrint.Visible = False
        '
        'btnClose
        '
        Me.btnClose.Dock = System.Windows.Forms.DockStyle.Right
        Me.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClose.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.Image = Global.SchoolMGT.My.Resources.Resources.close
        Me.btnClose.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnClose.Location = New System.Drawing.Point(1406, 0)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(122, 32)
        Me.btnClose.TabIndex = 24
        Me.btnClose.Text = "Close"
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClose.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnClose.UseVisualStyleBackColor = True
        '
        'btnSearch
        '
        Me.btnSearch.Dock = System.Windows.Forms.DockStyle.Left
        Me.btnSearch.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnSearch.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnSearch.ForeColor = System.Drawing.Color.Navy
        Me.btnSearch.Image = Global.SchoolMGT.My.Resources.Resources.zoom
        Me.btnSearch.Location = New System.Drawing.Point(0, 0)
        Me.btnSearch.Name = "btnSearch"
        Me.btnSearch.Size = New System.Drawing.Size(175, 32)
        Me.btnSearch.TabIndex = 20
        Me.btnSearch.Text = "Search"
        Me.btnSearch.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnSearch.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText
        Me.btnSearch.UseVisualStyleBackColor = True
        '
        'dtpFrom
        '
        '
        '
        '
        Me.dtpFrom.BackgroundStyle.Class = "DateTimeInputBackground"
        Me.dtpFrom.ButtonDropDown.Visible = True
        Me.dtpFrom.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpFrom.Location = New System.Drawing.Point(141, 13)
        '
        '
        '
        Me.dtpFrom.MonthCalendar.AnnuallyMarkedDates = New Date(-1) {}
        Me.dtpFrom.MonthCalendar.ClearButtonVisible = True
        '
        '
        '
        Me.dtpFrom.MonthCalendar.CommandsBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground2
        Me.dtpFrom.MonthCalendar.CommandsBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpFrom.MonthCalendar.CommandsBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarBackground
        Me.dtpFrom.MonthCalendar.CommandsBackgroundStyle.BorderTop = DevComponents.DotNetBar.eStyleBorderType.Solid
        Me.dtpFrom.MonthCalendar.CommandsBackgroundStyle.BorderTopColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.BarDockedBorder
        Me.dtpFrom.MonthCalendar.CommandsBackgroundStyle.BorderTopWidth = 1
        Me.dtpFrom.MonthCalendar.DisplayMonth = New Date(2016, 4, 1, 0, 0, 0, 0)
        Me.dtpFrom.MonthCalendar.MarkedDates = New Date(-1) {}
        Me.dtpFrom.MonthCalendar.MonthlyMarkedDates = New Date(-1) {}
        '
        '
        '
        Me.dtpFrom.MonthCalendar.NavigationBackgroundStyle.BackColor2SchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground2
        Me.dtpFrom.MonthCalendar.NavigationBackgroundStyle.BackColorGradientAngle = 90
        Me.dtpFrom.MonthCalendar.NavigationBackgroundStyle.BackColorSchemePart = DevComponents.DotNetBar.eColorSchemePart.PanelBackground
        Me.dtpFrom.MonthCalendar.TodayButtonVisible = True
        Me.dtpFrom.Name = "dtpFrom"
        Me.dtpFrom.Size = New System.Drawing.Size(246, 26)
        Me.dtpFrom.TabIndex = 153
        '
        'LabelX5
        '
        Me.LabelX5.AutoSize = True
        Me.LabelX5.BackColor = System.Drawing.Color.Transparent
        Me.LabelX5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelX5.Location = New System.Drawing.Point(14, 18)
        Me.LabelX5.Name = "LabelX5"
        Me.LabelX5.Size = New System.Drawing.Size(101, 21)
        Me.LabelX5.TabIndex = 152
        Me.LabelX5.Text = "DATE FROM:"
        '
        'GroupPanel3
        '
        Me.GroupPanel3.AutoScroll = True
        Me.GroupPanel3.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel3.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel3.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel3.Controls.Add(Me.tdbViewer)
        Me.GroupPanel3.Dock = System.Windows.Forms.DockStyle.Left
        Me.GroupPanel3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel3.Location = New System.Drawing.Point(0, 216)
        Me.GroupPanel3.Name = "GroupPanel3"
        Me.GroupPanel3.Size = New System.Drawing.Size(1146, 514)
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
        Me.GroupPanel3.TabIndex = 187
        Me.GroupPanel3.Text = "Voucher List"
        '
        'tdbViewer
        '
        Me.tdbViewer.AllowFilter = False
        Me.tdbViewer.AllowHorizontalSplit = True
        Me.tdbViewer.AllowUpdate = False
        Me.tdbViewer.AllowVerticalSplit = True
        Me.tdbViewer.AlternatingRows = True
        Me.tdbViewer.BackColor = System.Drawing.Color.LightBlue
        Me.tdbViewer.Caption = "CHECK VOUCHER LIST"
        Me.tdbViewer.CaptionHeight = 30
        Me.tdbViewer.DirectionAfterEnter = C1.Win.C1TrueDBGrid.DirectionAfterEnterEnum.MoveNone
        Me.tdbViewer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tdbViewer.ExtendRightColumn = True
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
        Me.tdbViewer.Size = New System.Drawing.Size(1140, 493)
        Me.tdbViewer.TabAcrossSplits = True
        Me.tdbViewer.TabIndex = 22
        Me.tdbViewer.Text = "C1TrueDBGrid1"
        Me.tdbViewer.VisualStyle = C1.Win.C1TrueDBGrid.VisualStyle.Office2007Blue
        Me.tdbViewer.PropBag = resources.GetString("tdbViewer.PropBag")
        '
        'GroupPanel4
        '
        Me.GroupPanel4.AutoScroll = True
        Me.GroupPanel4.BackColor = System.Drawing.Color.Transparent
        Me.GroupPanel4.CanvasColor = System.Drawing.SystemColors.Control
        Me.GroupPanel4.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.Office2007
        Me.GroupPanel4.Controls.Add(Me.lblIsPosted)
        Me.GroupPanel4.Controls.Add(Me.Panel2)
        Me.GroupPanel4.Controls.Add(Me.dgvFEES)
        Me.GroupPanel4.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GroupPanel4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupPanel4.Location = New System.Drawing.Point(1146, 216)
        Me.GroupPanel4.Name = "GroupPanel4"
        Me.GroupPanel4.Size = New System.Drawing.Size(394, 514)
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
        Me.GroupPanel4.Style.CornerType = DevComponents.DotNetBar.eCornerType.Rounded
        Me.GroupPanel4.Style.TextColor = System.Drawing.SystemColors.Desktop
        Me.GroupPanel4.Style.TextLineAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Near
        Me.GroupPanel4.TabIndex = 188
        Me.GroupPanel4.Text = "Voucher Details"
        '
        'lblIsPosted
        '
        Me.lblIsPosted.BackColor = System.Drawing.Color.Transparent
        Me.lblIsPosted.Font = New System.Drawing.Font("Modern No. 20", 21.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblIsPosted.ForeColor = System.Drawing.Color.Firebrick
        Me.lblIsPosted.Location = New System.Drawing.Point(3, 281)
        Me.lblIsPosted.Name = "lblIsPosted"
        Me.lblIsPosted.Size = New System.Drawing.Size(646, 32)
        Me.lblIsPosted.TabIndex = 200
        Me.lblIsPosted.Text = "POSTED TO JOURNAL"
        Me.lblIsPosted.TextAlignment = System.Drawing.StringAlignment.Center
        Me.lblIsPosted.Visible = False
        '
        'Panel2
        '
        Me.Panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel2.Controls.Add(Me.LabelX13)
        Me.Panel2.Controls.Add(Me.txtTotalCredit)
        Me.Panel2.Controls.Add(Me.txtTotalDebit)
        Me.Panel2.Location = New System.Drawing.Point(3, 210)
        Me.Panel2.Name = "Panel2"
        Me.Panel2.Size = New System.Drawing.Size(646, 41)
        Me.Panel2.TabIndex = 199
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
        Me.dgvFEES.Location = New System.Drawing.Point(3, 12)
        Me.dgvFEES.Name = "dgvFEES"
        Me.dgvFEES.ReadOnly = True
        Me.dgvFEES.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect
        Me.dgvFEES.Size = New System.Drawing.Size(646, 203)
        Me.dgvFEES.TabIndex = 198
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
        'fmaCheckVoucherList
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.LightBlue
        Me.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch
        Me.ClientSize = New System.Drawing.Size(1540, 730)
        Me.Controls.Add(Me.GroupPanel4)
        Me.Controls.Add(Me.GroupPanel3)
        Me.Controls.Add(Me.GroupPanel1)
        Me.Controls.Add(Me.WinLabel)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "fmaCheckVoucherList"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "CHECK VOUCHER LIST"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        Me.GroupPanel1.ResumeLayout(False)
        Me.GroupPanel1.PerformLayout()
        CType(Me.dtpTo, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupPanel2.ResumeLayout(False)
        CType(Me.dtpFrom, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupPanel3.ResumeLayout(False)
        CType(Me.tdbViewer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupPanel4.ResumeLayout(False)
        Me.Panel2.ResumeLayout(False)
        Me.Panel2.PerformLayout()
        CType(Me.dgvFEES, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ComboItem4 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem3 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem2 As DevComponents.Editors.ComboItem
    Friend WithEvents ComboItem1 As DevComponents.Editors.ComboItem
    Friend WithEvents WinLabel As DevComponents.DotNetBar.LabelX
    Friend WithEvents GroupPanel1 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents dtpFrom As DevComponents.Editors.DateTimeAdv.DateTimeInput
    Friend WithEvents LabelX5 As DevComponents.DotNetBar.LabelX
    Friend WithEvents dtpTo As DevComponents.Editors.DateTimeAdv.DateTimeInput
    Friend WithEvents LabelX1 As DevComponents.DotNetBar.LabelX
    Friend WithEvents GroupPanel2 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents btnClose As Button
    Friend WithEvents btnSearch As Button
    Friend WithEvents GroupPanel3 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents GroupPanel4 As DevComponents.DotNetBar.Controls.GroupPanel
    Friend WithEvents tdbViewer As C1.Win.C1TrueDBGrid.C1TrueDBGrid
    Friend WithEvents Panel2 As Panel
    Friend WithEvents LabelX13 As DevComponents.DotNetBar.LabelX
    Friend WithEvents txtTotalCredit As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtTotalDebit As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents dgvFEES As DevComponents.DotNetBar.Controls.DataGridViewX
    Friend WithEvents btnPrint As Button
    Friend WithEvents txtVoucherID As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents lblIsPosted As DevComponents.DotNetBar.LabelX
    Friend WithEvents btnPostToJournal As Button
    Friend WithEvents txtJournalAmount As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtPaymentDate As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents Column1 As DataGridViewTextBoxColumn
    Friend WithEvents Column2 As DataGridViewTextBoxColumn
    Friend WithEvents Column3 As DataGridViewTextBoxColumn
    Friend WithEvents Column4 As DataGridViewTextBoxColumn
    Friend WithEvents Column5 As DataGridViewTextBoxColumn
    Friend WithEvents txtCVNumber As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtCheckNo As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents txtBankAccount As DevComponents.DotNetBar.Controls.TextBoxX
    Friend WithEvents btnEdit As Button
    Friend WithEvents btnPrintList As Button
End Class
