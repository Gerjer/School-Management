<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class xtrFORM9Details
    Inherits DevExpress.XtraReports.UI.XtraReport

    'XtraReport overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Me.TopMargin = New DevExpress.XtraReports.UI.TopMarginBand()
        Me.BottomMargin = New DevExpress.XtraReports.UI.BottomMarginBand()
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand()
        Me.txtcode = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtCredits = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtFinal = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtDescription = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtCreditsDistribution = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupHeader2 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.txtSemester = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupHeader3 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.txtSchoolName = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupFooter2 = New DevExpress.XtraReports.UI.GroupFooterBand()
        Me.GroupFooter3 = New DevExpress.XtraReports.UI.GroupFooterBand()
        Me.GroupHeader1 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.XrLabel1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.BindingSource1 = New System.Windows.Forms.BindingSource(Me.components)
        CType(Me.BindingSource1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'TopMargin
        '
        Me.TopMargin.HeightF = 50.0!
        Me.TopMargin.Name = "TopMargin"
        '
        'BottomMargin
        '
        Me.BottomMargin.HeightF = 50.0!
        Me.BottomMargin.Name = "BottomMargin"
        '
        'Detail
        '
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.txtcode, Me.txtCredits, Me.txtFinal, Me.txtDescription, Me.txtCreditsDistribution})
        Me.Detail.HeightF = 23.0!
        Me.Detail.Name = "Detail"
        '
        'txtcode
        '
        Me.txtcode.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.txtcode.CanGrow = False
        Me.txtcode.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[subject_code]")})
        Me.txtcode.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtcode.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtcode.Multiline = True
        Me.txtcode.Name = "txtcode"
        Me.txtcode.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtcode.SizeF = New System.Drawing.SizeF(69.44!, 23.0!)
        Me.txtcode.StylePriority.UseBorders = False
        Me.txtcode.StylePriority.UseFont = False
        Me.txtcode.StylePriority.UsePadding = False
        Me.txtcode.StylePriority.UseTextAlignment = False
        Me.txtcode.Text = "subjectcode"
        Me.txtcode.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'txtCredits
        '
        Me.txtCredits.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.txtCredits.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[credtis]")})
        Me.txtCredits.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCredits.LocationFloat = New DevExpress.Utils.PointFloat(396.22!, 0!)
        Me.txtCredits.Multiline = True
        Me.txtCredits.Name = "txtCredits"
        Me.txtCredits.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtCredits.SizeF = New System.Drawing.SizeF(51.39!, 23.0!)
        Me.txtCredits.StylePriority.UseBorders = False
        Me.txtCredits.StylePriority.UseFont = False
        Me.txtCredits.StylePriority.UsePadding = False
        Me.txtCredits.StylePriority.UseTextAlignment = False
        Me.txtCredits.Text = "Credits"
        Me.txtCredits.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'txtFinal
        '
        Me.txtFinal.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.txtFinal.CanGrow = False
        Me.txtFinal.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[finale_grade]")})
        Me.txtFinal.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtFinal.LocationFloat = New DevExpress.Utils.PointFloat(349.69!, 0!)
        Me.txtFinal.Multiline = True
        Me.txtFinal.Name = "txtFinal"
        Me.txtFinal.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtFinal.SizeF = New System.Drawing.SizeF(46.53!, 23.0!)
        Me.txtFinal.StylePriority.UseBorders = False
        Me.txtFinal.StylePriority.UseFont = False
        Me.txtFinal.StylePriority.UsePadding = False
        Me.txtFinal.StylePriority.UseTextAlignment = False
        Me.txtFinal.Text = "Final"
        Me.txtFinal.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'txtDescription
        '
        Me.txtDescription.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.txtDescription.CanGrow = False
        Me.txtDescription.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[descriptive_title]")})
        Me.txtDescription.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtDescription.LocationFloat = New DevExpress.Utils.PointFloat(69.44!, 0!)
        Me.txtDescription.Name = "txtDescription"
        Me.txtDescription.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtDescription.SizeF = New System.Drawing.SizeF(280.25!, 23.0!)
        Me.txtDescription.StylePriority.UseBorders = False
        Me.txtDescription.StylePriority.UseFont = False
        Me.txtDescription.StylePriority.UsePadding = False
        Me.txtDescription.StylePriority.UseTextAlignment = False
        Me.txtDescription.Text = "Subject Name"
        Me.txtDescription.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        Me.txtDescription.WordWrap = False
        '
        'txtCreditsDistribution
        '
        Me.txtCreditsDistribution.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.txtCreditsDistribution.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[inorder]")})
        Me.txtCreditsDistribution.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCreditsDistribution.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtCreditsDistribution.Multiline = True
        Me.txtCreditsDistribution.Name = "txtCreditsDistribution"
        Me.txtCreditsDistribution.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtCreditsDistribution.SizeF = New System.Drawing.SizeF(34.02889!, 13.0!)
        Me.txtCreditsDistribution.StylePriority.UseBorders = False
        Me.txtCreditsDistribution.StylePriority.UseFont = False
        Me.txtCreditsDistribution.StylePriority.UsePadding = False
        Me.txtCreditsDistribution.StylePriority.UseTextAlignment = False
        Me.txtCreditsDistribution.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        Me.txtCreditsDistribution.Visible = False
        '
        'GroupHeader2
        '
        Me.GroupHeader2.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.txtSemester})
        Me.GroupHeader2.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("semester", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.GroupHeader2.HeightF = 19.0!
        Me.GroupHeader2.KeepTogether = True
        Me.GroupHeader2.Name = "GroupHeader2"
        '
        'txtSemester
        '
        Me.txtSemester.BackColor = System.Drawing.Color.Gainsboro
        Me.txtSemester.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.txtSemester.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[semester_ay]")})
        Me.txtSemester.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtSemester.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtSemester.Multiline = True
        Me.txtSemester.Name = "txtSemester"
        Me.txtSemester.Padding = New DevExpress.XtraPrinting.PaddingInfo(50, 2, 0, 0, 100.0!)
        Me.txtSemester.SizeF = New System.Drawing.SizeF(812.0001!, 19.0!)
        Me.txtSemester.StylePriority.UseBackColor = False
        Me.txtSemester.StylePriority.UseBorders = False
        Me.txtSemester.StylePriority.UseFont = False
        Me.txtSemester.StylePriority.UsePadding = False
        Me.txtSemester.StylePriority.UseTextAlignment = False
        Me.txtSemester.Text = "Semester"
        Me.txtSemester.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'GroupHeader3
        '
        Me.GroupHeader3.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.txtSchoolName})
        Me.GroupHeader3.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("school_name_address", DevExpress.XtraReports.UI.XRColumnSortOrder.None)})
        Me.GroupHeader3.HeightF = 19.0!
        Me.GroupHeader3.Level = 2
        Me.GroupHeader3.Name = "GroupHeader3"
        '
        'txtSchoolName
        '
        Me.txtSchoolName.BackColor = System.Drawing.Color.Silver
        Me.txtSchoolName.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.txtSchoolName.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[school_name_address]")})
        Me.txtSchoolName.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtSchoolName.LocationFloat = New DevExpress.Utils.PointFloat(0.0001430511!, 0!)
        Me.txtSchoolName.Multiline = True
        Me.txtSchoolName.Name = "txtSchoolName"
        Me.txtSchoolName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.txtSchoolName.SizeF = New System.Drawing.SizeF(812.0!, 19.0!)
        Me.txtSchoolName.StylePriority.UseBackColor = False
        Me.txtSchoolName.StylePriority.UseBorders = False
        Me.txtSchoolName.StylePriority.UseFont = False
        Me.txtSchoolName.StylePriority.UseTextAlignment = False
        Me.txtSchoolName.Text = "txtSchoolName"
        Me.txtSchoolName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'GroupFooter2
        '
        Me.GroupFooter2.Expanded = False
        Me.GroupFooter2.Name = "GroupFooter2"
        '
        'GroupFooter3
        '
        Me.GroupFooter3.Expanded = False
        Me.GroupFooter3.Level = 2
        Me.GroupFooter3.Name = "GroupFooter3"
        '
        'GroupHeader1
        '
        Me.GroupHeader1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrLabel1})
        Me.GroupHeader1.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("year_level", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.GroupHeader1.HeightF = 19.0!
        Me.GroupHeader1.KeepTogether = True
        Me.GroupHeader1.Level = 1
        Me.GroupHeader1.Name = "GroupHeader1"
        Me.GroupHeader1.Visible = False
        '
        'XrLabel1
        '
        Me.XrLabel1.BackColor = System.Drawing.Color.Transparent
        Me.XrLabel1.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.XrLabel1.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[semester]")})
        Me.XrLabel1.Font = New System.Drawing.Font("Century Gothic", 7.8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.XrLabel1.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.XrLabel1.Multiline = True
        Me.XrLabel1.Name = "XrLabel1"
        Me.XrLabel1.Padding = New DevExpress.XtraPrinting.PaddingInfo(80, 2, 0, 0, 100.0!)
        Me.XrLabel1.SizeF = New System.Drawing.SizeF(812.0001!, 19.0!)
        Me.XrLabel1.StylePriority.UseBackColor = False
        Me.XrLabel1.StylePriority.UseBorders = False
        Me.XrLabel1.StylePriority.UseFont = False
        Me.XrLabel1.StylePriority.UsePadding = False
        Me.XrLabel1.StylePriority.UseTextAlignment = False
        Me.XrLabel1.Text = "Semester"
        Me.XrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'BindingSource1
        '
        Me.BindingSource1.DataSource = GetType(SchoolMGT.Form9Details)
        '
        'xtrFORM9Details
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.TopMargin, Me.BottomMargin, Me.Detail, Me.GroupHeader2, Me.GroupHeader3, Me.GroupFooter2, Me.GroupFooter3, Me.GroupHeader1})
        Me.ComponentStorage.AddRange(New System.ComponentModel.IComponent() {Me.BindingSource1})
        Me.DataSource = Me.BindingSource1
        Me.Font = New System.Drawing.Font("Arial", 9.75!)
        Me.Margins = New System.Drawing.Printing.Margins(18, 20, 50, 50)
        Me.Version = "18.2"
        CType(Me.BindingSource1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Friend WithEvents TopMargin As DevExpress.XtraReports.UI.TopMarginBand
    Friend WithEvents BottomMargin As DevExpress.XtraReports.UI.BottomMarginBand
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents GroupHeader2 As DevExpress.XtraReports.UI.GroupHeaderBand
    Friend WithEvents GroupHeader3 As DevExpress.XtraReports.UI.GroupHeaderBand
    Friend WithEvents GroupFooter2 As DevExpress.XtraReports.UI.GroupFooterBand
    Friend WithEvents GroupFooter3 As DevExpress.XtraReports.UI.GroupFooterBand
    Friend WithEvents txtFinal As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtDescription As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtSemester As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtSchoolName As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtCredits As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtcode As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtCreditsDistribution As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents BindingSource1 As BindingSource
    Friend WithEvents GroupHeader1 As DevExpress.XtraReports.UI.GroupHeaderBand
    Friend WithEvents XrLabel1 As DevExpress.XtraReports.UI.XRLabel
End Class
