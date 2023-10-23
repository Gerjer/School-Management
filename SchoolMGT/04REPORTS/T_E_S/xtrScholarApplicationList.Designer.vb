<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Public Class xtrScholarApplicationList
    Inherits DevExpress.XtraReports.UI.XtraReport

    'XtraReport overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.TopMargin = New DevExpress.XtraReports.UI.TopMarginBand()
        Me.BottomMargin = New DevExpress.XtraReports.UI.BottomMarginBand()
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand()
        Me.PrintableComponentContainer1 = New DevExpress.XtraReports.UI.PrintableComponentContainer()
        Me.PageHeader = New DevExpress.XtraReports.UI.PageHeaderBand()
        Me.XrLabel1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel4 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel5 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel6 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrlshcollname = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrlUII = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrlacademicyear = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.XrLabel3 = New DevExpress.XtraReports.UI.XRLabel()
        Me.txtHeader = New DevExpress.XtraReports.UI.XRLabel()
        Me.PageFooter = New DevExpress.XtraReports.UI.PageFooterBand()
        Me.XrPageInfo1 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.XrPageInfo2 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.XrLabel63 = New DevExpress.XtraReports.UI.XRLabel()
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
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.PrintableComponentContainer1})
        Me.Detail.HeightF = 75.0!
        Me.Detail.Name = "Detail"
        '
        'PrintableComponentContainer1
        '
        Me.PrintableComponentContainer1.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.PrintableComponentContainer1.Name = "PrintableComponentContainer1"
        Me.PrintableComponentContainer1.SizeF = New System.Drawing.SizeF(1660.994!, 75.0!)
        '
        'PageHeader
        '
        Me.PageHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrLabel1, Me.XrLabel4, Me.XrLabel5, Me.XrLabel6, Me.xrlshcollname, Me.xrlUII, Me.xrlacademicyear, Me.XrLabel2, Me.XrLabel3, Me.txtHeader})
        Me.PageHeader.HeightF = 144.1667!
        Me.PageHeader.Name = "PageHeader"
        '
        'XrLabel1
        '
        Me.XrLabel1.Font = New System.Drawing.Font("Arial", 15.0!, System.Drawing.FontStyle.Bold)
        Me.XrLabel1.LocationFloat = New DevExpress.Utils.PointFloat(0!, 55.99998!)
        Me.XrLabel1.Multiline = True
        Me.XrLabel1.Name = "XrLabel1"
        Me.XrLabel1.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel1.SizeF = New System.Drawing.SizeF(187.9167!, 23.0!)
        Me.XrLabel1.StylePriority.UseFont = False
        Me.XrLabel1.StylePriority.UseTextAlignment = False
        Me.XrLabel1.Text = "School Name"
        Me.XrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'XrLabel4
        '
        Me.XrLabel4.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Bold)
        Me.XrLabel4.LocationFloat = New DevExpress.Utils.PointFloat(187.9167!, 55.99998!)
        Me.XrLabel4.Multiline = True
        Me.XrLabel4.Name = "XrLabel4"
        Me.XrLabel4.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel4.SizeF = New System.Drawing.SizeF(14.58334!, 23.0!)
        Me.XrLabel4.StylePriority.UseFont = False
        Me.XrLabel4.StylePriority.UseTextAlignment = False
        Me.XrLabel4.Text = ":"
        Me.XrLabel4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'XrLabel5
        '
        Me.XrLabel5.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Bold)
        Me.XrLabel5.LocationFloat = New DevExpress.Utils.PointFloat(187.9167!, 78.99996!)
        Me.XrLabel5.Multiline = True
        Me.XrLabel5.Name = "XrLabel5"
        Me.XrLabel5.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel5.SizeF = New System.Drawing.SizeF(14.58334!, 23.0!)
        Me.XrLabel5.StylePriority.UseFont = False
        Me.XrLabel5.StylePriority.UseTextAlignment = False
        Me.XrLabel5.Text = ":"
        Me.XrLabel5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'XrLabel6
        '
        Me.XrLabel6.Font = New System.Drawing.Font("Arial", 12.0!, System.Drawing.FontStyle.Bold)
        Me.XrLabel6.LocationFloat = New DevExpress.Utils.PointFloat(187.9167!, 102.0!)
        Me.XrLabel6.Multiline = True
        Me.XrLabel6.Name = "XrLabel6"
        Me.XrLabel6.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel6.SizeF = New System.Drawing.SizeF(14.58334!, 23.0!)
        Me.XrLabel6.StylePriority.UseFont = False
        Me.XrLabel6.StylePriority.UseTextAlignment = False
        Me.XrLabel6.Text = ":"
        Me.XrLabel6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'xrlshcollname
        '
        Me.xrlshcollname.Font = New System.Drawing.Font("Arial", 17.0!, System.Drawing.FontStyle.Bold)
        Me.xrlshcollname.LocationFloat = New DevExpress.Utils.PointFloat(202.8756!, 56.00001!)
        Me.xrlshcollname.Multiline = True
        Me.xrlshcollname.Name = "xrlshcollname"
        Me.xrlshcollname.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.xrlshcollname.SizeF = New System.Drawing.SizeF(1458.119!, 23.0!)
        Me.xrlshcollname.StylePriority.UseFont = False
        Me.xrlshcollname.StylePriority.UsePadding = False
        Me.xrlshcollname.StylePriority.UseTextAlignment = False
        Me.xrlshcollname.Text = "DON JOSE ECLEO MEMORIAL FOUNDATION COLLEGE OF SCIENCE AND TECHNOLOGY INCORPORATED" &
    ""
        Me.xrlshcollname.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'xrlUII
        '
        Me.xrlUII.Font = New System.Drawing.Font("Arial", 15.0!, System.Drawing.FontStyle.Bold)
        Me.xrlUII.LocationFloat = New DevExpress.Utils.PointFloat(202.5!, 78.99994!)
        Me.xrlUII.Multiline = True
        Me.xrlUII.Name = "xrlUII"
        Me.xrlUII.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.xrlUII.SizeF = New System.Drawing.SizeF(1458.494!, 23.0!)
        Me.xrlUII.StylePriority.UseFont = False
        Me.xrlUII.StylePriority.UsePadding = False
        Me.xrlUII.StylePriority.UseTextAlignment = False
        Me.xrlUII.Text = "Justiniana Edera, San Jose, Dinagat Islands"
        Me.xrlUII.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'xrlacademicyear
        '
        Me.xrlacademicyear.Font = New System.Drawing.Font("Arial", 15.0!, System.Drawing.FontStyle.Bold)
        Me.xrlacademicyear.LocationFloat = New DevExpress.Utils.PointFloat(202.5!, 102.0!)
        Me.xrlacademicyear.Multiline = True
        Me.xrlacademicyear.Name = "xrlacademicyear"
        Me.xrlacademicyear.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 2, 0, 0, 100.0!)
        Me.xrlacademicyear.SizeF = New System.Drawing.SizeF(1458.494!, 22.99999!)
        Me.xrlacademicyear.StylePriority.UseFont = False
        Me.xrlacademicyear.StylePriority.UsePadding = False
        Me.xrlacademicyear.StylePriority.UseTextAlignment = False
        Me.xrlacademicyear.Text = "Academic Year"
        Me.xrlacademicyear.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'XrLabel2
        '
        Me.XrLabel2.Font = New System.Drawing.Font("Arial", 15.0!, System.Drawing.FontStyle.Bold)
        Me.XrLabel2.LocationFloat = New DevExpress.Utils.PointFloat(0!, 77.33332!)
        Me.XrLabel2.Multiline = True
        Me.XrLabel2.Name = "XrLabel2"
        Me.XrLabel2.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel2.SizeF = New System.Drawing.SizeF(187.9167!, 23.0!)
        Me.XrLabel2.StylePriority.UseFont = False
        Me.XrLabel2.StylePriority.UseTextAlignment = False
        Me.XrLabel2.Text = "Address"
        Me.XrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'XrLabel3
        '
        Me.XrLabel3.Font = New System.Drawing.Font("Arial", 15.0!, System.Drawing.FontStyle.Bold)
        Me.XrLabel3.LocationFloat = New DevExpress.Utils.PointFloat(0!, 102.0!)
        Me.XrLabel3.Multiline = True
        Me.XrLabel3.Name = "XrLabel3"
        Me.XrLabel3.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel3.SizeF = New System.Drawing.SizeF(187.9167!, 23.0!)
        Me.XrLabel3.StylePriority.UseFont = False
        Me.XrLabel3.StylePriority.UseTextAlignment = False
        Me.XrLabel3.Text = "Academic Year"
        Me.XrLabel3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'txtHeader
        '
        Me.txtHeader.Font = New System.Drawing.Font("Arial", 25.0!, System.Drawing.FontStyle.Bold)
        Me.txtHeader.LocationFloat = New DevExpress.Utils.PointFloat(0!, 0!)
        Me.txtHeader.Multiline = True
        Me.txtHeader.Name = "txtHeader"
        Me.txtHeader.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.txtHeader.SizeF = New System.Drawing.SizeF(1660.994!, 55.99998!)
        Me.txtHeader.StylePriority.UseFont = False
        Me.txtHeader.StylePriority.UseTextAlignment = False
        Me.txtHeader.Text = "School Name"
        Me.txtHeader.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'PageFooter
        '
        Me.PageFooter.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrPageInfo1, Me.XrPageInfo2, Me.XrLabel63})
        Me.PageFooter.HeightF = 51.87247!
        Me.PageFooter.Name = "PageFooter"
        '
        'XrPageInfo1
        '
        Me.XrPageInfo1.Font = New System.Drawing.Font("Arial", 12.0!)
        Me.XrPageInfo1.LocationFloat = New DevExpress.Utils.PointFloat(0!, 28.87247!)
        Me.XrPageInfo1.Name = "XrPageInfo1"
        Me.XrPageInfo1.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrPageInfo1.SizeF = New System.Drawing.SizeF(100.0!, 23.0!)
        Me.XrPageInfo1.StylePriority.UseFont = False
        Me.XrPageInfo1.TextFormatString = "Page 1 of {0}"
        '
        'XrPageInfo2
        '
        Me.XrPageInfo2.Font = New System.Drawing.Font("Arial", 12.0!)
        Me.XrPageInfo2.LocationFloat = New DevExpress.Utils.PointFloat(1529.327!, 28.87247!)
        Me.XrPageInfo2.Name = "XrPageInfo2"
        Me.XrPageInfo2.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrPageInfo2.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime
        Me.XrPageInfo2.SizeF = New System.Drawing.SizeF(131.6667!, 19.0!)
        Me.XrPageInfo2.StylePriority.UseFont = False
        Me.XrPageInfo2.TextFormatString = "{0:MM/dd/yyyy h:mm tt}"
        '
        'XrLabel63
        '
        Me.XrLabel63.Font = New System.Drawing.Font("Times New Roman", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.XrLabel63.LocationFloat = New DevExpress.Utils.PointFloat(1424.827!, 28.87247!)
        Me.XrLabel63.Multiline = True
        Me.XrLabel63.Name = "XrLabel63"
        Me.XrLabel63.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.XrLabel63.SizeF = New System.Drawing.SizeF(104.5!, 19.0!)
        Me.XrLabel63.StylePriority.UseFont = False
        Me.XrLabel63.Text = "Date Printed :"
        '
        'xtrScholarApplicationList
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.TopMargin, Me.BottomMargin, Me.Detail, Me.PageHeader, Me.PageFooter})
        Me.Font = New System.Drawing.Font("Arial", 9.75!)
        Me.Landscape = True
        Me.Margins = New System.Drawing.Printing.Margins(22, 22, 50, 50)
        Me.PageHeight = 850
        Me.PageWidth = 1706
        Me.PaperKind = System.Drawing.Printing.PaperKind.Custom
        Me.Version = "18.2"
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Friend WithEvents TopMargin As DevExpress.XtraReports.UI.TopMarginBand
    Friend WithEvents BottomMargin As DevExpress.XtraReports.UI.BottomMarginBand
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents PageHeader As DevExpress.XtraReports.UI.PageHeaderBand
    Friend WithEvents XrLabel1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel4 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel5 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel6 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents xrlshcollname As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents xrlUII As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents xrlacademicyear As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel2 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel3 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents txtHeader As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents PrintableComponentContainer1 As DevExpress.XtraReports.UI.PrintableComponentContainer
    Friend WithEvents PageFooter As DevExpress.XtraReports.UI.PageFooterBand
    Friend WithEvents XrPageInfo1 As DevExpress.XtraReports.UI.XRPageInfo
    Friend WithEvents XrPageInfo2 As DevExpress.XtraReports.UI.XRPageInfo
    Friend WithEvents XrLabel63 As DevExpress.XtraReports.UI.XRLabel
End Class
