Imports System.Drawing.Printing
Imports DevExpress.XtraReports
Imports DevExpress.XtraReports.UI

Public Class xtrFORM9Details

    Dim ReportModel As New TOR_Model

    Public default_hight As Double = 23


    Public default_xLoc As Double = 447.61
    Public default_yLoc As Double = 0

    Public default_total_width As Double = 364.39

    Dim TotalWidth As Double = 0

    Public cnt_col_credits As Integer


    Dim cdID As String = ""
    Dim creditsHours As String = ""
    Dim row As Integer = 0
    Private Sub Detail_BeforePrint(sender As Object, e As PrintEventArgs) Handles Detail.BeforePrint

        txtCreditsDistribution.Text = If(IsDBNull(_dt_form9(row)("inorder").ToString), 0, _dt_form9(row)("inorder").ToString)
        txtCredits.Text = _dt_form9(row)("credit_hours").ToString

        For Each labels As XRLabel In Detail.Band.Controls.OfType(Of XRLabel)().Where(Function(lbl) lbl.Tag = "credits")

            If labels.Name = txtCreditsDistribution.Text Then
                labels.Text = txtCredits.Text
            Else
                labels.Text = ""
            End If
        Next
        row += 1
    End Sub

    Private Sub xtrFORM9Details_BeforePrint(sender As Object, e As PrintEventArgs) Handles MyBase.BeforePrint

        cnt_col_credits = ReportModel.getReport_TotalColumn(PERSON_ID)

        Dim _width As Double = default_total_width / cnt_col_credits
        Dim _hight As Double = default_hight

        Dim _xLoc As Double = default_xLoc
        Dim _yLoc As Double = default_yLoc


        Dim col As Integer = 1
        While cnt_col_credits >= col

            Dim label As New XRLabel()

            label.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
            label.Font = New System.Drawing.Font("Century Gothic", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
            label.LocationFloat = New DevExpress.Utils.PointFloat(_xLoc, _yLoc)
            label.Multiline = True
            label.Name = col
            label.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
            label.SizeF = New System.Drawing.SizeF(_width, _hight)
            label.Tag = "credits"
            label.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter

            Me.Detail.Controls.Add(label)

            _xLoc = _xLoc + _width

            col += 1
        End While


    End Sub

    Private Sub GroupHeader2_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupHeader2.BeforePrint

    End Sub

    Private Sub GroupHeader3_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupHeader3.BeforePrint

    End Sub
End Class