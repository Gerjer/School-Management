<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class xtrTORDetails
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
        Me.txtAcademicYear = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtCredits = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtReExam = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtFinal = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtDescription = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtCourseCode = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtTerm = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupHeader2 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.txtCourse = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupHeader3 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.txtSchoolName = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupFooter2 = New DevExpress.XtraReports.UI.GroupFooterBand()
        Me.GroupFooter3 = New DevExpress.XtraReports.UI.GroupFooterBand()
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
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.txtAcademicYear, Me.txtCredits, Me.txtReExam, Me.txtFinal, Me.txtDescription, Me.txtCourseCode, Me.txtTerm})
        Me.Detail.HeightF = 23.13889!
        Me.Detail.Name = "Detail"
        '
        'txtAcademicYear
        '
        Me.txtAcademicYear.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[academic_year]")})
        Me.txtAcademicYear.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtAcademicYear.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtAcademicYear.Multiline = True
        Me.txtAcademicYear.Name = "txtAcademicYear"
        Me.txtAcademicYear.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtAcademicYear.SizeF = New System.Drawing.SizeF(121.0!, 23.0!)
        Me.txtAcademicYear.StylePriority.UseFont = False
        Me.txtAcademicYear.StylePriority.UsePadding = False
        Me.txtAcademicYear.StylePriority.UseTextAlignment = False
        Me.txtAcademicYear.Text = "txtTerm"
        Me.txtAcademicYear.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        Me.txtAcademicYear.Visible = False
        '
        'txtCredits
        '
        Me.txtCredits.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[credits]")})
        Me.txtCredits.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCredits.LocationFloat = New DevExpress.Utils.PointFloat(717.17!, 0!)
        Me.txtCredits.Multiline = True
        Me.txtCredits.Name = "txtCredits"
        Me.txtCredits.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtCredits.SizeF = New System.Drawing.SizeF(82.83!, 23.0!)
        Me.txtCredits.StylePriority.UseFont = False
        Me.txtCredits.StylePriority.UsePadding = False
        Me.txtCredits.StylePriority.UseTextAlignment = False
        Me.txtCredits.Text = "XrLabel1"
        Me.txtCredits.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'txtReExam
        '
        Me.txtReExam.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[re_exam]")})
        Me.txtReExam.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtReExam.LocationFloat = New DevExpress.Utils.PointFloat(634.34!, 0!)
        Me.txtReExam.Multiline = True
        Me.txtReExam.Name = "txtReExam"
        Me.txtReExam.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtReExam.SizeF = New System.Drawing.SizeF(82.83!, 23.0!)
        Me.txtReExam.StylePriority.UseFont = False
        Me.txtReExam.StylePriority.UsePadding = False
        Me.txtReExam.StylePriority.UseTextAlignment = False
        Me.txtReExam.Text = "XrLabel1"
        Me.txtReExam.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'txtFinal
        '
        Me.txtFinal.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[final]")})
        Me.txtFinal.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtFinal.LocationFloat = New DevExpress.Utils.PointFloat(551.5099!, 0!)
        Me.txtFinal.Multiline = True
        Me.txtFinal.Name = "txtFinal"
        Me.txtFinal.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtFinal.SizeF = New System.Drawing.SizeF(82.83!, 23.0!)
        Me.txtFinal.StylePriority.UseFont = False
        Me.txtFinal.StylePriority.UsePadding = False
        Me.txtFinal.StylePriority.UseTextAlignment = False
        Me.txtFinal.Text = "XrLabel1"
        Me.txtFinal.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'txtDescription
        '
        Me.txtDescription.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[description]")})
        Me.txtDescription.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtDescription.LocationFloat = New DevExpress.Utils.PointFloat(226.0!, 0!)
        Me.txtDescription.Multiline = True
        Me.txtDescription.Name = "txtDescription"
        Me.txtDescription.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtDescription.SizeF = New System.Drawing.SizeF(324.67!, 23.0!)
        Me.txtDescription.StylePriority.UseFont = False
        Me.txtDescription.StylePriority.UsePadding = False
        Me.txtDescription.StylePriority.UseTextAlignment = False
        Me.txtDescription.Text = "XrLabel1"
        Me.txtDescription.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'txtCourseCode
        '
        Me.txtCourseCode.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[course_code]")})
        Me.txtCourseCode.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCourseCode.LocationFloat = New DevExpress.Utils.PointFloat(121.0!, 0!)
        Me.txtCourseCode.Multiline = True
        Me.txtCourseCode.Name = "txtCourseCode"
        Me.txtCourseCode.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtCourseCode.SizeF = New System.Drawing.SizeF(105.0!, 23.0!)
        Me.txtCourseCode.StylePriority.UseFont = False
        Me.txtCourseCode.StylePriority.UsePadding = False
        Me.txtCourseCode.StylePriority.UseTextAlignment = False
        Me.txtCourseCode.Text = "XrLabel1"
        Me.txtCourseCode.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'txtTerm
        '
        Me.txtTerm.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[semester]")})
        Me.txtTerm.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtTerm.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtTerm.Multiline = True
        Me.txtTerm.Name = "txtTerm"
        Me.txtTerm.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.txtTerm.SizeF = New System.Drawing.SizeF(121.0!, 23.0!)
        Me.txtTerm.StylePriority.UseFont = False
        Me.txtTerm.StylePriority.UsePadding = False
        Me.txtTerm.StylePriority.UseTextAlignment = False
        Me.txtTerm.Text = "txtTerm"
        Me.txtTerm.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'GroupHeader2
        '
        Me.GroupHeader2.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.txtCourse})
        Me.GroupHeader2.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("course_name", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.GroupHeader2.HeightF = 20.0!
        Me.GroupHeader2.Name = "GroupHeader2"
        '
        'txtCourse
        '
        Me.txtCourse.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[school_address]")})
        Me.txtCourse.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtCourse.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtCourse.Multiline = True
        Me.txtCourse.Name = "txtCourse"
        Me.txtCourse.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.txtCourse.SizeF = New System.Drawing.SizeF(750.0!, 20.0!)
        Me.txtCourse.StylePriority.UseFont = False
        Me.txtCourse.StylePriority.UseTextAlignment = False
        Me.txtCourse.Text = "txtSchoolName"
        Me.txtCourse.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'GroupHeader3
        '
        Me.GroupHeader3.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.txtSchoolName})
        Me.GroupHeader3.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("school_name", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.GroupHeader3.HeightF = 20.0!
        Me.GroupHeader3.Level = 1
        Me.GroupHeader3.Name = "GroupHeader3"
        '
        'txtSchoolName
        '
        Me.txtSchoolName.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[school_name]")})
        Me.txtSchoolName.Font = New System.Drawing.Font("Times New Roman", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txtSchoolName.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtSchoolName.Multiline = True
        Me.txtSchoolName.Name = "txtSchoolName"
        Me.txtSchoolName.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.txtSchoolName.SizeF = New System.Drawing.SizeF(750.0!, 20.0!)
        Me.txtSchoolName.StylePriority.UseFont = False
        Me.txtSchoolName.StylePriority.UseTextAlignment = False
        Me.txtSchoolName.Text = "txtSchoolName"
        Me.txtSchoolName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'GroupFooter2
        '
        Me.GroupFooter2.Expanded = False
        Me.GroupFooter2.Name = "GroupFooter2"
        '
        'GroupFooter3
        '
        Me.GroupFooter3.Expanded = False
        Me.GroupFooter3.Level = 1
        Me.GroupFooter3.Name = "GroupFooter3"
        '
        'BindingSource1
        '
        Me.BindingSource1.DataSource = GetType(SchoolMGT.TOR_SubjectDetails)
        '
        'xtrTORDetails
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.TopMargin, Me.BottomMargin, Me.Detail, Me.GroupHeader2, Me.GroupHeader3, Me.GroupFooter2, Me.GroupFooter3})
        Me.ComponentStorage.AddRange(New System.ComponentModel.IComponent() {Me.BindingSource1})
        Me.DataSource = Me.BindingSource1
        Me.Font = New System.Drawing.Font("Arial", 9.75!)
        Me.Margins = New System.Drawing.Printing.Margins(25, 25, 50, 50)
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
    Friend WithEvents txtReExam As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtFinal As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtDescription As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtCourseCode As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtTerm As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtCourse As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtSchoolName As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtCredits As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents BindingSource1 As BindingSource
    Friend WithEvents txtAcademicYear As DevExpress.XtraReports.UI.XRLabel
End Class
