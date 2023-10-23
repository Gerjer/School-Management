<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class hr_subRPT_EmpDTR
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
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(hr_subRPT_EmpDTR))
        Me.PageHeader1 = New DataDynamics.ActiveReports.PageHeader()
        Me.Detail1 = New DataDynamics.ActiveReports.Detail()
        Me.txtDay = New DataDynamics.ActiveReports.TextBox()
        Me.txtamin = New DataDynamics.ActiveReports.TextBox()
        Me.txtamout = New DataDynamics.ActiveReports.TextBox()
        Me.txtinpm = New DataDynamics.ActiveReports.TextBox()
        Me.txtpmout = New DataDynamics.ActiveReports.TextBox()
        Me.txtLate = New DataDynamics.ActiveReports.TextBox()
        Me.txtUT = New DataDynamics.ActiveReports.TextBox()
        Me.txtAWOL = New DataDynamics.ActiveReports.TextBox()
        Me.txtDTRREMARKS = New DataDynamics.ActiveReports.TextBox()
        Me.txtVacation = New DataDynamics.ActiveReports.TextBox()
        Me.txtFiller = New DataDynamics.ActiveReports.TextBox()
        Me.PageFooter1 = New DataDynamics.ActiveReports.PageFooter()
        CType(Me.txtDay, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtamin, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtamout, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtinpm, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtpmout, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtLate, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtUT, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtAWOL, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtDTRREMARKS, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtVacation, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtFiller, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'PageHeader1
        '
        Me.PageHeader1.Height = 0!
        Me.PageHeader1.Name = "PageHeader1"
        '
        'Detail1
        '
        Me.Detail1.ColumnSpacing = 0!
        Me.Detail1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.txtDay, Me.txtamin, Me.txtamout, Me.txtinpm, Me.txtpmout, Me.txtLate, Me.txtUT, Me.txtAWOL, Me.txtDTRREMARKS, Me.txtVacation, Me.txtFiller})
        Me.Detail1.Height = 0.1833333!
        Me.Detail1.Name = "Detail1"
        '
        'txtDay
        '
        Me.txtDay.Border.BottomColor = System.Drawing.Color.Black
        Me.txtDay.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtDay.Border.LeftColor = System.Drawing.Color.Black
        Me.txtDay.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtDay.Border.RightColor = System.Drawing.Color.Black
        Me.txtDay.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtDay.Border.TopColor = System.Drawing.Color.Black
        Me.txtDay.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtDay.DataField = "day"
        Me.txtDay.Height = 0.1875!
        Me.txtDay.Left = 0!
        Me.txtDay.Name = "txtDay"
        Me.txtDay.OutputFormat = resources.GetString("txtDay.OutputFormat")
        Me.txtDay.Style = "ddo-char-set: 0; text-align: center; font-size: 8.25pt; vertical-align: bottom; "
        Me.txtDay.Text = Nothing
        Me.txtDay.Top = 0!
        Me.txtDay.Width = 0.4375!
        '
        'txtamin
        '
        Me.txtamin.Border.BottomColor = System.Drawing.Color.Black
        Me.txtamin.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamin.Border.LeftColor = System.Drawing.Color.Black
        Me.txtamin.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamin.Border.RightColor = System.Drawing.Color.Black
        Me.txtamin.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamin.Border.TopColor = System.Drawing.Color.Black
        Me.txtamin.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamin.CanGrow = False
        Me.txtamin.DataField = "in_am"
        Me.txtamin.Height = 0.1875!
        Me.txtamin.Left = 0.4375!
        Me.txtamin.Name = "txtamin"
        Me.txtamin.OutputFormat = resources.GetString("txtamin.OutputFormat")
        Me.txtamin.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtamin.Text = Nothing
        Me.txtamin.Top = 0!
        Me.txtamin.Width = 0.5!
        '
        'txtamout
        '
        Me.txtamout.Border.BottomColor = System.Drawing.Color.Black
        Me.txtamout.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamout.Border.LeftColor = System.Drawing.Color.Black
        Me.txtamout.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamout.Border.RightColor = System.Drawing.Color.Black
        Me.txtamout.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamout.Border.TopColor = System.Drawing.Color.Black
        Me.txtamout.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtamout.CanGrow = False
        Me.txtamout.DataField = "out_am"
        Me.txtamout.Height = 0.188!
        Me.txtamout.Left = 0.9375!
        Me.txtamout.Name = "txtamout"
        Me.txtamout.OutputFormat = resources.GetString("txtamout.OutputFormat")
        Me.txtamout.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtamout.Text = Nothing
        Me.txtamout.Top = 0!
        Me.txtamout.Width = 0.5!
        '
        'txtinpm
        '
        Me.txtinpm.Border.BottomColor = System.Drawing.Color.Black
        Me.txtinpm.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtinpm.Border.LeftColor = System.Drawing.Color.Black
        Me.txtinpm.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtinpm.Border.RightColor = System.Drawing.Color.Black
        Me.txtinpm.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtinpm.Border.TopColor = System.Drawing.Color.Black
        Me.txtinpm.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtinpm.CanGrow = False
        Me.txtinpm.DataField = "in_pm"
        Me.txtinpm.Height = 0.188!
        Me.txtinpm.Left = 1.4375!
        Me.txtinpm.Name = "txtinpm"
        Me.txtinpm.OutputFormat = resources.GetString("txtinpm.OutputFormat")
        Me.txtinpm.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtinpm.Text = Nothing
        Me.txtinpm.Top = 0!
        Me.txtinpm.Width = 0.5!
        '
        'txtpmout
        '
        Me.txtpmout.Border.BottomColor = System.Drawing.Color.Black
        Me.txtpmout.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtpmout.Border.LeftColor = System.Drawing.Color.Black
        Me.txtpmout.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtpmout.Border.RightColor = System.Drawing.Color.Black
        Me.txtpmout.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtpmout.Border.TopColor = System.Drawing.Color.Black
        Me.txtpmout.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtpmout.CanGrow = False
        Me.txtpmout.DataField = "out_pm"
        Me.txtpmout.Height = 0.188!
        Me.txtpmout.Left = 1.9375!
        Me.txtpmout.Name = "txtpmout"
        Me.txtpmout.OutputFormat = resources.GetString("txtpmout.OutputFormat")
        Me.txtpmout.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtpmout.Text = Nothing
        Me.txtpmout.Top = 0!
        Me.txtpmout.Width = 0.5!
        '
        'txtLate
        '
        Me.txtLate.Border.BottomColor = System.Drawing.Color.Black
        Me.txtLate.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtLate.Border.LeftColor = System.Drawing.Color.Black
        Me.txtLate.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtLate.Border.RightColor = System.Drawing.Color.Black
        Me.txtLate.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtLate.Border.TopColor = System.Drawing.Color.Black
        Me.txtLate.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtLate.CanGrow = False
        Me.txtLate.DataField = "late"
        Me.txtLate.Height = 0.1875!
        Me.txtLate.Left = 2.4375!
        Me.txtLate.Name = "txtLate"
        Me.txtLate.OutputFormat = resources.GetString("txtLate.OutputFormat")
        Me.txtLate.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtLate.Text = Nothing
        Me.txtLate.Top = 0!
        Me.txtLate.Width = 0.5!
        '
        'txtUT
        '
        Me.txtUT.Border.BottomColor = System.Drawing.Color.Black
        Me.txtUT.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtUT.Border.LeftColor = System.Drawing.Color.Black
        Me.txtUT.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtUT.Border.RightColor = System.Drawing.Color.Black
        Me.txtUT.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtUT.Border.TopColor = System.Drawing.Color.Black
        Me.txtUT.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtUT.CanGrow = False
        Me.txtUT.DataField = "undertime"
        Me.txtUT.Height = 0.1875!
        Me.txtUT.Left = 2.9375!
        Me.txtUT.Name = "txtUT"
        Me.txtUT.OutputFormat = resources.GetString("txtUT.OutputFormat")
        Me.txtUT.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtUT.Text = Nothing
        Me.txtUT.Top = 0!
        Me.txtUT.Width = 0.5!
        '
        'txtAWOL
        '
        Me.txtAWOL.Border.BottomColor = System.Drawing.Color.Black
        Me.txtAWOL.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtAWOL.Border.LeftColor = System.Drawing.Color.Black
        Me.txtAWOL.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtAWOL.Border.RightColor = System.Drawing.Color.Black
        Me.txtAWOL.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtAWOL.Border.TopColor = System.Drawing.Color.Black
        Me.txtAWOL.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtAWOL.CanGrow = False
        Me.txtAWOL.DataField = "undertime"
        Me.txtAWOL.Height = 0.1875!
        Me.txtAWOL.Left = 2.4375!
        Me.txtAWOL.Name = "txtAWOL"
        Me.txtAWOL.OutputFormat = resources.GetString("txtAWOL.OutputFormat")
        Me.txtAWOL.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtAWOL.Text = Nothing
        Me.txtAWOL.Top = 0!
        Me.txtAWOL.Visible = False
        Me.txtAWOL.Width = 1.0!
        '
        'txtDTRREMARKS
        '
        Me.txtDTRREMARKS.Border.BottomColor = System.Drawing.Color.Black
        Me.txtDTRREMARKS.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtDTRREMARKS.Border.LeftColor = System.Drawing.Color.Black
        Me.txtDTRREMARKS.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtDTRREMARKS.Border.RightColor = System.Drawing.Color.Black
        Me.txtDTRREMARKS.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtDTRREMARKS.Border.TopColor = System.Drawing.Color.Black
        Me.txtDTRREMARKS.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtDTRREMARKS.DataField = "dtr_remarks"
        Me.txtDTRREMARKS.Height = 0.1875!
        Me.txtDTRREMARKS.Left = 0!
        Me.txtDTRREMARKS.Name = "txtDTRREMARKS"
        Me.txtDTRREMARKS.Style = ""
        Me.txtDTRREMARKS.Text = Nothing
        Me.txtDTRREMARKS.Top = 0.1875!
        Me.txtDTRREMARKS.Visible = False
        Me.txtDTRREMARKS.Width = 1.0625!
        '
        'txtVacation
        '
        Me.txtVacation.Border.BottomColor = System.Drawing.Color.Black
        Me.txtVacation.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtVacation.Border.LeftColor = System.Drawing.Color.Black
        Me.txtVacation.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtVacation.Border.RightColor = System.Drawing.Color.Black
        Me.txtVacation.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtVacation.Border.TopColor = System.Drawing.Color.Black
        Me.txtVacation.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtVacation.CanGrow = False
        Me.txtVacation.DataField = "dname"
        Me.txtVacation.Height = 0.1875!
        Me.txtVacation.Left = 0.4375!
        Me.txtVacation.Name = "txtVacation"
        Me.txtVacation.Style = "text-align: center; "
        Me.txtVacation.Text = Nothing
        Me.txtVacation.Top = 0!
        Me.txtVacation.Width = 3.0!
        '
        'txtFiller
        '
        Me.txtFiller.Border.BottomColor = System.Drawing.Color.Black
        Me.txtFiller.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtFiller.Border.LeftColor = System.Drawing.Color.Black
        Me.txtFiller.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtFiller.Border.RightColor = System.Drawing.Color.Black
        Me.txtFiller.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtFiller.Border.TopColor = System.Drawing.Color.Black
        Me.txtFiller.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtFiller.CanGrow = False
        Me.txtFiller.Height = 0.1875!
        Me.txtFiller.Left = 2.4375!
        Me.txtFiller.Name = "txtFiller"
        Me.txtFiller.OutputFormat = resources.GetString("txtFiller.OutputFormat")
        Me.txtFiller.Style = "ddo-char-set: 0; text-align: center; font-size: 6pt; vertical-align: bottom; "
        Me.txtFiller.Text = Nothing
        Me.txtFiller.Top = 0!
        Me.txtFiller.Width = 0.0875!
        '
        'PageFooter1
        '
        Me.PageFooter1.Height = 0!
        Me.PageFooter1.Name = "PageFooter1"
        '
        'hr_subRPT_EmpDTR
        '
        Me.MasterReport = False
        Me.PageSettings.Margins.Bottom = 0.5!
        Me.PageSettings.Margins.Left = 0.5!
        Me.PageSettings.Margins.Right = 0.5!
        Me.PageSettings.Margins.Top = 0.5!
        Me.PageSettings.PaperHeight = 11.0!
        Me.PageSettings.PaperWidth = 8.5!
        Me.PrintWidth = 3.472917!
        Me.Sections.Add(Me.PageHeader1)
        Me.Sections.Add(Me.Detail1)
        Me.Sections.Add(Me.PageFooter1)
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-family: Arial; font-style: normal; text-decoration: none; font-weight: norma" &
            "l; font-size: 10pt; color: Black; ", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-size: 16pt; font-weight: bold; ", "Heading1", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-family: Times New Roman; font-size: 14pt; font-weight: bold; font-style: ita" &
            "lic; ", "Heading2", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-size: 13pt; font-weight: bold; ", "Heading3", "Normal"))
        CType(Me.txtDay, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtamin, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtamout, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtinpm, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtpmout, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtLate, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtUT, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtAWOL, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtDTRREMARKS, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtVacation, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtFiller, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents txtDay As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtamin As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtamout As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtinpm As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtpmout As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtLate As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtUT As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtVacation As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtAWOL As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtDTRREMARKS As DataDynamics.ActiveReports.TextBox
    Friend WithEvents txtFiller As DataDynamics.ActiveReports.TextBox
End Class
