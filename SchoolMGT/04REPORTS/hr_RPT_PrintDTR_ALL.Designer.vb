<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class hr_RPT_PrintDTR_ALL
    Inherits DataDynamics.ActiveReports.ActiveReport3

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
        End If
        MyBase.Dispose(disposing)
    End Sub

    'NOTE: The following procedure is required by the ActiveReports Designer
    'It can be modified using the ActiveReports Designer.
    'Do not modify it using the code editor.
    Private WithEvents PageHeader1 As DataDynamics.ActiveReports.PageHeader
    Private WithEvents Detail1 As DataDynamics.ActiveReports.Detail
    Private WithEvents PageFooter1 As DataDynamics.ActiveReports.PageFooter
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(hr_RPT_PrintDTR_ALL))
        Me.PageHeader1 = New DataDynamics.ActiveReports.PageHeader()
        Me.Label1 = New DataDynamics.ActiveReports.Label()
        Me.Label2 = New DataDynamics.ActiveReports.Label()
        Me.Detail1 = New DataDynamics.ActiveReports.Detail()
        Me.PageFooter1 = New DataDynamics.ActiveReports.PageFooter()
        Me.ReportInfo1 = New DataDynamics.ActiveReports.ReportInfo()
        Me.GroupHeader1 = New DataDynamics.ActiveReports.GroupHeader()
        Me.SubReport1 = New DataDynamics.ActiveReports.SubReport()
        Me.Label3 = New DataDynamics.ActiveReports.Label()
        Me.txtName1 = New DataDynamics.ActiveReports.Label()
        Me.txtMonthOf = New DataDynamics.ActiveReports.Label()
        Me.Label4 = New DataDynamics.ActiveReports.Label()
        Me.Label6 = New DataDynamics.ActiveReports.Label()
        Me.Label7 = New DataDynamics.ActiveReports.Label()
        Me.Label9 = New DataDynamics.ActiveReports.Label()
        Me.Label10 = New DataDynamics.ActiveReports.Label()
        Me.Label11 = New DataDynamics.ActiveReports.Label()
        Me.Label12 = New DataDynamics.ActiveReports.Label()
        Me.Line5 = New DataDynamics.ActiveReports.Line()
        Me.txtdtrDate = New DataDynamics.ActiveReports.TextBox()
        Me.txtEmpNum = New DataDynamics.ActiveReports.TextBox()
        Me.Label16 = New DataDynamics.ActiveReports.Label()
        Me.Label14 = New DataDynamics.ActiveReports.Label()
        Me.Label15 = New DataDynamics.ActiveReports.Label()
        Me.Line1 = New DataDynamics.ActiveReports.Line()
        Me.Line2 = New DataDynamics.ActiveReports.Line()
        Me.txtLateA = New DataDynamics.ActiveReports.TextBox()
        Me.Label13 = New DataDynamics.ActiveReports.Label()
        Me.txtUTA = New DataDynamics.ActiveReports.TextBox()
        Me.GroupFooter1 = New DataDynamics.ActiveReports.GroupFooter()
        Me.PageBreak1 = New DataDynamics.ActiveReports.PageBreak()
        Me.Label5 = New DataDynamics.ActiveReports.Label()
        CType(Me.Label1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ReportInfo1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtName1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtMonthOf, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label4, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label6, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label7, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label9, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label10, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label11, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label12, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtdtrDate, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtEmpNum, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label16, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label14, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label15, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtLateA, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label13, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtUTA, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Label5, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'PageHeader1
        '
        Me.PageHeader1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.Label1, Me.Label2})
        Me.PageHeader1.Height = 0.4166667!
        Me.PageHeader1.Name = "PageHeader1"
        '
        'Label1
        '
        Me.Label1.Border.BottomColor = System.Drawing.Color.Black
        Me.Label1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label1.Border.LeftColor = System.Drawing.Color.Black
        Me.Label1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label1.Border.RightColor = System.Drawing.Color.Black
        Me.Label1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label1.Border.TopColor = System.Drawing.Color.Black
        Me.Label1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label1.Height = 0.1875!
        Me.Label1.HyperLink = Nothing
        Me.Label1.Left = 0!
        Me.Label1.Name = "Label1"
        Me.Label1.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.Label1.Text = "CIVIL SERVICE FORMA No. 48"
        Me.Label1.Top = 0!
        Me.Label1.Width = 3.4375!
        '
        'Label2
        '
        Me.Label2.Border.BottomColor = System.Drawing.Color.Black
        Me.Label2.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label2.Border.LeftColor = System.Drawing.Color.Black
        Me.Label2.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label2.Border.RightColor = System.Drawing.Color.Black
        Me.Label2.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label2.Border.TopColor = System.Drawing.Color.Black
        Me.Label2.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label2.Height = 0.1875!
        Me.Label2.HyperLink = Nothing
        Me.Label2.Left = 0!
        Me.Label2.Name = "Label2"
        Me.Label2.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label2.Text = "DAILY TIME RECORD"
        Me.Label2.Top = 0.1875!
        Me.Label2.Width = 3.4375!
        '
        'Detail1
        '
        Me.Detail1.ColumnSpacing = 0!
        Me.Detail1.Height = 0!
        Me.Detail1.Name = "Detail1"
        '
        'PageFooter1
        '
        Me.PageFooter1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.ReportInfo1})
        Me.PageFooter1.Height = 0.2395833!
        Me.PageFooter1.Name = "PageFooter1"
        '
        'ReportInfo1
        '
        Me.ReportInfo1.Border.BottomColor = System.Drawing.Color.Black
        Me.ReportInfo1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.ReportInfo1.Border.LeftColor = System.Drawing.Color.Black
        Me.ReportInfo1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.ReportInfo1.Border.RightColor = System.Drawing.Color.Black
        Me.ReportInfo1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.ReportInfo1.Border.TopColor = System.Drawing.Color.Black
        Me.ReportInfo1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.ReportInfo1.FormatString = "{RunDateTime:M/d/yy h:mm tt}"
        Me.ReportInfo1.Height = 0.1875!
        Me.ReportInfo1.Left = 0!
        Me.ReportInfo1.Name = "ReportInfo1"
        Me.ReportInfo1.Style = ""
        Me.ReportInfo1.Top = 0!
        Me.ReportInfo1.Width = 1.875!
        '
        'GroupHeader1
        '
        Me.GroupHeader1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.SubReport1, Me.Label3, Me.txtName1, Me.txtMonthOf, Me.Label4, Me.Label6, Me.Label7, Me.Label9, Me.Label10, Me.Label11, Me.Label12, Me.Line5, Me.txtdtrDate, Me.txtEmpNum, Me.Label16, Me.Label14, Me.Label15, Me.Line1, Me.Line2, Me.txtLateA, Me.Label13, Me.txtUTA, Me.Label5})
        Me.GroupHeader1.DataField = "employee_number"
        Me.GroupHeader1.Height = 4.125!
        Me.GroupHeader1.Name = "GroupHeader1"
        '
        'SubReport1
        '
        Me.SubReport1.Border.BottomColor = System.Drawing.Color.Black
        Me.SubReport1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.SubReport1.Border.LeftColor = System.Drawing.Color.Black
        Me.SubReport1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.SubReport1.Border.RightColor = System.Drawing.Color.Black
        Me.SubReport1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.SubReport1.Border.TopColor = System.Drawing.Color.Black
        Me.SubReport1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.SubReport1.CloseBorder = False
        Me.SubReport1.Height = 0.4375!
        Me.SubReport1.Left = 0!
        Me.SubReport1.Name = "SubReport1"
        Me.SubReport1.Report = Nothing
        Me.SubReport1.ReportName = "SubReport1"
        Me.SubReport1.Top = 0.875!
        Me.SubReport1.Width = 3.5!
        '
        'Label3
        '
        Me.Label3.Border.BottomColor = System.Drawing.Color.Black
        Me.Label3.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label3.Border.LeftColor = System.Drawing.Color.Black
        Me.Label3.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label3.Border.RightColor = System.Drawing.Color.Black
        Me.Label3.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label3.Border.TopColor = System.Drawing.Color.Black
        Me.Label3.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label3.Height = 0.1875!
        Me.Label3.HyperLink = Nothing
        Me.Label3.Left = 0!
        Me.Label3.Name = "Label3"
        Me.Label3.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.Label3.Text = "NAME :"
        Me.Label3.Top = 0.125!
        Me.Label3.Width = 0.4375!
        '
        'txtName1
        '
        Me.txtName1.Border.BottomColor = System.Drawing.Color.Black
        Me.txtName1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtName1.Border.LeftColor = System.Drawing.Color.Black
        Me.txtName1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtName1.Border.RightColor = System.Drawing.Color.Black
        Me.txtName1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtName1.Border.TopColor = System.Drawing.Color.Black
        Me.txtName1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtName1.DataField = "Name_Empl"
        Me.txtName1.Height = 0.1875!
        Me.txtName1.HyperLink = Nothing
        Me.txtName1.Left = 0.4375!
        Me.txtName1.Name = "txtName1"
        Me.txtName1.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.txtName1.Text = ""
        Me.txtName1.Top = 0.125!
        Me.txtName1.Width = 3.0!
        '
        'txtMonthOf
        '
        Me.txtMonthOf.Border.BottomColor = System.Drawing.Color.Black
        Me.txtMonthOf.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtMonthOf.Border.LeftColor = System.Drawing.Color.Black
        Me.txtMonthOf.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtMonthOf.Border.RightColor = System.Drawing.Color.Black
        Me.txtMonthOf.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtMonthOf.Border.TopColor = System.Drawing.Color.Black
        Me.txtMonthOf.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtMonthOf.Height = 0.1875!
        Me.txtMonthOf.HyperLink = Nothing
        Me.txtMonthOf.Left = 0!
        Me.txtMonthOf.Name = "txtMonthOf"
        Me.txtMonthOf.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.txtMonthOf.Text = "For the Month of"
        Me.txtMonthOf.Top = 0.3125!
        Me.txtMonthOf.Width = 0.875!
        '
        'Label4
        '
        Me.Label4.Border.BottomColor = System.Drawing.Color.Black
        Me.Label4.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label4.Border.LeftColor = System.Drawing.Color.Black
        Me.Label4.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label4.Border.RightColor = System.Drawing.Color.Black
        Me.Label4.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label4.Border.TopColor = System.Drawing.Color.Black
        Me.Label4.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label4.Height = 0.1875!
        Me.Label4.HyperLink = Nothing
        Me.Label4.Left = 0!
        Me.Label4.Name = "Label4"
        Me.Label4.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label4.Text = "DAY"
        Me.Label4.Top = 0.6875!
        Me.Label4.Width = 0.4375!
        '
        'Label6
        '
        Me.Label6.Border.BottomColor = System.Drawing.Color.Black
        Me.Label6.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label6.Border.LeftColor = System.Drawing.Color.Black
        Me.Label6.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label6.Border.RightColor = System.Drawing.Color.Black
        Me.Label6.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label6.Border.TopColor = System.Drawing.Color.Black
        Me.Label6.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label6.Height = 0.188!
        Me.Label6.HyperLink = Nothing
        Me.Label6.Left = 0.4375!
        Me.Label6.Name = "Label6"
        Me.Label6.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label6.Text = "AM IN"
        Me.Label6.Top = 0.6875!
        Me.Label6.Width = 0.5!
        '
        'Label7
        '
        Me.Label7.Border.BottomColor = System.Drawing.Color.Black
        Me.Label7.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label7.Border.LeftColor = System.Drawing.Color.Black
        Me.Label7.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label7.Border.RightColor = System.Drawing.Color.Black
        Me.Label7.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label7.Border.TopColor = System.Drawing.Color.Black
        Me.Label7.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label7.Height = 0.188!
        Me.Label7.HyperLink = Nothing
        Me.Label7.Left = 1.4375!
        Me.Label7.Name = "Label7"
        Me.Label7.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label7.Text = "PM IN"
        Me.Label7.Top = 0.6875!
        Me.Label7.Width = 0.5!
        '
        'Label9
        '
        Me.Label9.Border.BottomColor = System.Drawing.Color.Black
        Me.Label9.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label9.Border.LeftColor = System.Drawing.Color.Black
        Me.Label9.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label9.Border.RightColor = System.Drawing.Color.Black
        Me.Label9.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label9.Border.TopColor = System.Drawing.Color.Black
        Me.Label9.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label9.Height = 0.1875!
        Me.Label9.HyperLink = Nothing
        Me.Label9.Left = 0.9375!
        Me.Label9.Name = "Label9"
        Me.Label9.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label9.Text = "AM OUT"
        Me.Label9.Top = 0.6875!
        Me.Label9.Width = 0.5!
        '
        'Label10
        '
        Me.Label10.Border.BottomColor = System.Drawing.Color.Black
        Me.Label10.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label10.Border.LeftColor = System.Drawing.Color.Black
        Me.Label10.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label10.Border.RightColor = System.Drawing.Color.Black
        Me.Label10.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label10.Border.TopColor = System.Drawing.Color.Black
        Me.Label10.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label10.Height = 0.188!
        Me.Label10.HyperLink = Nothing
        Me.Label10.Left = 1.9375!
        Me.Label10.Name = "Label10"
        Me.Label10.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label10.Text = "PM OUT"
        Me.Label10.Top = 0.6875!
        Me.Label10.Width = 0.5!
        '
        'Label11
        '
        Me.Label11.Border.BottomColor = System.Drawing.Color.Black
        Me.Label11.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label11.Border.LeftColor = System.Drawing.Color.Black
        Me.Label11.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label11.Border.RightColor = System.Drawing.Color.Black
        Me.Label11.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label11.Border.TopColor = System.Drawing.Color.Black
        Me.Label11.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label11.Height = 0.188!
        Me.Label11.HyperLink = Nothing
        Me.Label11.Left = 2.5!
        Me.Label11.Name = "Label11"
        Me.Label11.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label11.Text = "LATE"
        Me.Label11.Top = 0.6875!
        Me.Label11.Width = 0.5!
        '
        'Label12
        '
        Me.Label12.Border.BottomColor = System.Drawing.Color.Black
        Me.Label12.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label12.Border.LeftColor = System.Drawing.Color.Black
        Me.Label12.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label12.Border.RightColor = System.Drawing.Color.Black
        Me.Label12.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label12.Border.TopColor = System.Drawing.Color.Black
        Me.Label12.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label12.Height = 0.188!
        Me.Label12.HyperLink = Nothing
        Me.Label12.Left = 3.0!
        Me.Label12.Name = "Label12"
        Me.Label12.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; "
        Me.Label12.Text = "UT"
        Me.Label12.Top = 0.6875!
        Me.Label12.Width = 0.5!
        '
        'Line5
        '
        Me.Line5.Border.BottomColor = System.Drawing.Color.Black
        Me.Line5.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line5.Border.LeftColor = System.Drawing.Color.Black
        Me.Line5.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line5.Border.RightColor = System.Drawing.Color.Black
        Me.Line5.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line5.Border.TopColor = System.Drawing.Color.Black
        Me.Line5.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line5.Height = 0!
        Me.Line5.Left = 0!
        Me.Line5.LineWeight = 1.0!
        Me.Line5.Name = "Line5"
        Me.Line5.Top = 1.375!
        Me.Line5.Width = 3.5!
        Me.Line5.X1 = 0!
        Me.Line5.X2 = 3.5!
        Me.Line5.Y1 = 1.375!
        Me.Line5.Y2 = 1.375!
        '
        'txtdtrDate
        '
        Me.txtdtrDate.Border.BottomColor = System.Drawing.Color.Black
        Me.txtdtrDate.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtdtrDate.Border.LeftColor = System.Drawing.Color.Black
        Me.txtdtrDate.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtdtrDate.Border.RightColor = System.Drawing.Color.Black
        Me.txtdtrDate.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtdtrDate.Border.TopColor = System.Drawing.Color.Black
        Me.txtdtrDate.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtdtrDate.DataField = "dtr_date"
        Me.txtdtrDate.Height = 0.1875!
        Me.txtdtrDate.Left = 0.875!
        Me.txtdtrDate.Name = "txtdtrDate"
        Me.txtdtrDate.OutputFormat = resources.GetString("txtdtrDate.OutputFormat")
        Me.txtdtrDate.Style = "ddo-char-set: 0; font-size: 8.25pt; "
        Me.txtdtrDate.Text = Nothing
        Me.txtdtrDate.Top = 0.3125!
        Me.txtdtrDate.Width = 1.5625!
        '
        'txtEmpNum
        '
        Me.txtEmpNum.Border.BottomColor = System.Drawing.Color.Black
        Me.txtEmpNum.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtEmpNum.Border.LeftColor = System.Drawing.Color.Black
        Me.txtEmpNum.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtEmpNum.Border.RightColor = System.Drawing.Color.Black
        Me.txtEmpNum.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtEmpNum.Border.TopColor = System.Drawing.Color.Black
        Me.txtEmpNum.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtEmpNum.DataField = "employee_number"
        Me.txtEmpNum.Height = 0.1979167!
        Me.txtEmpNum.Left = 2.4375!
        Me.txtEmpNum.Name = "txtEmpNum"
        Me.txtEmpNum.Style = "ddo-char-set: 0; font-size: 8.25pt; "
        Me.txtEmpNum.Text = Nothing
        Me.txtEmpNum.Top = 0.3125!
        Me.txtEmpNum.Visible = False
        Me.txtEmpNum.Width = 1.0!
        '
        'Label16
        '
        Me.Label16.Border.BottomColor = System.Drawing.Color.Black
        Me.Label16.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label16.Border.LeftColor = System.Drawing.Color.Black
        Me.Label16.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label16.Border.RightColor = System.Drawing.Color.Black
        Me.Label16.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label16.Border.TopColor = System.Drawing.Color.Black
        Me.Label16.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label16.Height = 0.1875!
        Me.Label16.HyperLink = Nothing
        Me.Label16.Left = 2.0!
        Me.Label16.Name = "Label16"
        Me.Label16.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.Label16.Text = "TOTAL"
        Me.Label16.Top = 1.5!
        Me.Label16.Width = 0.4375!
        '
        'Label14
        '
        Me.Label14.Border.BottomColor = System.Drawing.Color.Black
        Me.Label14.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label14.Border.LeftColor = System.Drawing.Color.Black
        Me.Label14.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label14.Border.RightColor = System.Drawing.Color.Black
        Me.Label14.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label14.Border.TopColor = System.Drawing.Color.Black
        Me.Label14.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label14.Height = 0.1875!
        Me.Label14.HyperLink = Nothing
        Me.Label14.Left = 0!
        Me.Label14.Name = "Label14"
        Me.Label14.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.Label14.Text = "Verified as to the prescribed office hours."
        Me.Label14.Top = 3.25!
        Me.Label14.Width = 3.375!
        '
        'Label15
        '
        Me.Label15.Border.BottomColor = System.Drawing.Color.Black
        Me.Label15.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label15.Border.LeftColor = System.Drawing.Color.Black
        Me.Label15.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label15.Border.RightColor = System.Drawing.Color.Black
        Me.Label15.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label15.Border.TopColor = System.Drawing.Color.Black
        Me.Label15.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label15.Height = 0.1875!
        Me.Label15.HyperLink = Nothing
        Me.Label15.Left = 0!
        Me.Label15.Name = "Label15"
        Me.Label15.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.Label15.Text = "In Charge"
        Me.Label15.Top = 3.8125!
        Me.Label15.Width = 3.375!
        '
        'Line1
        '
        Me.Line1.Border.BottomColor = System.Drawing.Color.Black
        Me.Line1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line1.Border.LeftColor = System.Drawing.Color.Black
        Me.Line1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line1.Border.RightColor = System.Drawing.Color.Black
        Me.Line1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line1.Border.TopColor = System.Drawing.Color.Black
        Me.Line1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line1.Height = 0!
        Me.Line1.Left = 0!
        Me.Line1.LineWeight = 1.0!
        Me.Line1.Name = "Line1"
        Me.Line1.Top = 3.25!
        Me.Line1.Width = 2.125!
        Me.Line1.X1 = 0!
        Me.Line1.X2 = 2.125!
        Me.Line1.Y1 = 3.25!
        Me.Line1.Y2 = 3.25!
        '
        'Line2
        '
        Me.Line2.Border.BottomColor = System.Drawing.Color.Black
        Me.Line2.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line2.Border.LeftColor = System.Drawing.Color.Black
        Me.Line2.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line2.Border.RightColor = System.Drawing.Color.Black
        Me.Line2.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line2.Border.TopColor = System.Drawing.Color.Black
        Me.Line2.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Line2.Height = 0!
        Me.Line2.Left = 0!
        Me.Line2.LineWeight = 1.0!
        Me.Line2.Name = "Line2"
        Me.Line2.Top = 3.8125!
        Me.Line2.Width = 2.125!
        Me.Line2.X1 = 0!
        Me.Line2.X2 = 2.125!
        Me.Line2.Y1 = 3.8125!
        Me.Line2.Y2 = 3.8125!
        '
        'txtLateA
        '
        Me.txtLateA.Border.BottomColor = System.Drawing.Color.Black
        Me.txtLateA.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtLateA.Border.LeftColor = System.Drawing.Color.Black
        Me.txtLateA.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtLateA.Border.RightColor = System.Drawing.Color.Black
        Me.txtLateA.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtLateA.Border.TopColor = System.Drawing.Color.Black
        Me.txtLateA.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtLateA.CanGrow = False
        Me.txtLateA.DataField = "late"
        Me.txtLateA.Height = 0.1875!
        Me.txtLateA.Left = 2.5!
        Me.txtLateA.Name = "txtLateA"
        Me.txtLateA.OutputFormat = resources.GetString("txtLateA.OutputFormat")
        Me.txtLateA.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: top; "
        Me.txtLateA.Text = Nothing
        Me.txtLateA.Top = 1.5!
        Me.txtLateA.Width = 0.5!
        '
        'Label13
        '
        Me.Label13.Border.BottomColor = System.Drawing.Color.Black
        Me.Label13.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label13.Border.LeftColor = System.Drawing.Color.Black
        Me.Label13.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label13.Border.RightColor = System.Drawing.Color.Black
        Me.Label13.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label13.Border.TopColor = System.Drawing.Color.Black
        Me.Label13.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label13.Height = 0.5!
        Me.Label13.HyperLink = Nothing
        Me.Label13.Left = 0!
        Me.Label13.Name = "Label13"
        Me.Label13.Style = "ddo-char-set: 0; text-align: justify; font-size: 8.25pt; "
        Me.Label13.Text = "I CERTIFY on my honor that the above is a true and correct report of the hours of" &
    " work performed, record of which was made daily at the time of arrival and depar" &
    "ture from office."
        Me.Label13.Top = 2.3125!
        Me.Label13.Width = 3.4375!
        '
        'txtUTA
        '
        Me.txtUTA.Border.BottomColor = System.Drawing.Color.Black
        Me.txtUTA.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtUTA.Border.LeftColor = System.Drawing.Color.Black
        Me.txtUTA.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtUTA.Border.RightColor = System.Drawing.Color.Black
        Me.txtUTA.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtUTA.Border.TopColor = System.Drawing.Color.Black
        Me.txtUTA.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtUTA.CanGrow = False
        Me.txtUTA.DataField = "late"
        Me.txtUTA.Height = 0.1875!
        Me.txtUTA.Left = 3.0!
        Me.txtUTA.Name = "txtUTA"
        Me.txtUTA.OutputFormat = resources.GetString("txtUTA.OutputFormat")
        Me.txtUTA.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: top; "
        Me.txtUTA.Text = Nothing
        Me.txtUTA.Top = 1.5!
        Me.txtUTA.Width = 0.5!
        '
        'GroupFooter1
        '
        Me.GroupFooter1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.PageBreak1})
        Me.GroupFooter1.Height = 0.2833333!
        Me.GroupFooter1.Name = "GroupFooter1"
        '
        'PageBreak1
        '
        Me.PageBreak1.Border.BottomColor = System.Drawing.Color.Black
        Me.PageBreak1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.PageBreak1.Border.LeftColor = System.Drawing.Color.Black
        Me.PageBreak1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.PageBreak1.Border.RightColor = System.Drawing.Color.Black
        Me.PageBreak1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.PageBreak1.Border.TopColor = System.Drawing.Color.Black
        Me.PageBreak1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.PageBreak1.Height = 0.025!
        Me.PageBreak1.Left = 0!
        Me.PageBreak1.Name = "PageBreak1"
        Me.PageBreak1.Size = New System.Drawing.SizeF(6.5!, 0.025!)
        Me.PageBreak1.Top = 0.0625!
        Me.PageBreak1.Width = 6.5!
        '
        'Label5
        '
        Me.Label5.Border.BottomColor = System.Drawing.Color.Black
        Me.Label5.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label5.Border.LeftColor = System.Drawing.Color.Black
        Me.Label5.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label5.Border.RightColor = System.Drawing.Color.Black
        Me.Label5.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label5.Border.TopColor = System.Drawing.Color.Black
        Me.Label5.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.Label5.Height = 0.1875!
        Me.Label5.HyperLink = Nothing
        Me.Label5.Left = 1.75!
        Me.Label5.Name = "Label5"
        Me.Label5.Style = "ddo-char-set: 0; text-align: left; font-size: 8.25pt; "
        Me.Label5.Text = ""
        Me.Label5.Top = 0.125!
        Me.Label5.Visible = False
        Me.Label5.Width = 1.3125!
        '
        'hr_RPT_PrintDTR_ALL
        '
        Me.MasterReport = False
        Me.PageSettings.DefaultPaperSize = False
        Me.PageSettings.Margins.Bottom = 0.2!
        Me.PageSettings.Margins.Left = 0.2!
        Me.PageSettings.Margins.Right = 0.2!
        Me.PageSettings.Margins.Top = 0.2!
        Me.PageSettings.PaperHeight = 11.0!
        Me.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.Custom
        Me.PageSettings.PaperName = "Custom paper"
        Me.PageSettings.PaperWidth = 4.0!
        Me.PrintWidth = 3.51875!
        Me.Sections.Add(Me.PageHeader1)
        Me.Sections.Add(Me.GroupHeader1)
        Me.Sections.Add(Me.Detail1)
        Me.Sections.Add(Me.GroupFooter1)
        Me.Sections.Add(Me.PageFooter1)
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-family: Arial; font-style: normal; text-decoration: none; font-weight: norma" &
            "l; font-size: 10pt; color: Black; ", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-size: 16pt; font-weight: bold; ", "Heading1", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-family: Times New Roman; font-size: 14pt; font-weight: bold; font-style: ita" &
            "lic; ", "Heading2", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-size: 13pt; font-weight: bold; ", "Heading3", "Normal"))
        CType(Me.Label1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ReportInfo1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtName1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtMonthOf, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label4, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label6, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label7, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label9, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label10, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label11, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label12, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtdtrDate, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtEmpNum, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label16, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label14, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label15, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtLateA, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label13, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtUTA, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Label5, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents GroupHeader1 As DataDynamics.ActiveReports.GroupHeader
    Friend WithEvents GroupFooter1 As DataDynamics.ActiveReports.GroupFooter
    Friend WithEvents SubReport1 As DataDynamics.ActiveReports.SubReport
    Friend WithEvents Label3 As DataDynamics.ActiveReports.Label
    Friend WithEvents txtName1 As DataDynamics.ActiveReports.Label
    Friend WithEvents txtMonthOf As DataDynamics.ActiveReports.Label
    Friend WithEvents Label4 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label6 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label7 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label9 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label10 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label11 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label12 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label2 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label1 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label13 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label14 As DataDynamics.ActiveReports.Label
    Friend WithEvents Label15 As DataDynamics.ActiveReports.Label
    Friend WithEvents Line1 As DataDynamics.ActiveReports.Line
    Friend WithEvents Line2 As DataDynamics.ActiveReports.Line
    Friend WithEvents txtLateA As DataDynamics.ActiveReports.TextBox
    Friend WithEvents Label16 As DataDynamics.ActiveReports.Label
    Friend WithEvents txtUTA As DataDynamics.ActiveReports.TextBox
    Friend WithEvents Line5 As DataDynamics.ActiveReports.Line
    Friend WithEvents txtdtrDate As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtEmpNum As DataDynamics.ActiveReports.TextBox
    Friend WithEvents PageBreak1 As DataDynamics.ActiveReports.PageBreak
    Friend WithEvents ReportInfo1 As DataDynamics.ActiveReports.ReportInfo
    Friend WithEvents Label5 As DataDynamics.ActiveReports.Label
End Class
