Imports System.Drawing.Printing
Imports DevExpress.XtraReports.UI
'Imports DevExpress.XtraExports.UI


Public Class xtrFORM9Main

    Dim ReportModel As New TOR_Model

    Public default_width As Double = 32.39
    Public default_hight As Double = 19.5

    Public default_xLoc As Double = 447.61
    Public default_yLoc As Double = 18

    Public default_total_width As Double = 364.39

    Dim TotalWidth As Double = 0

    Dim cnt_col_credits As Integer


    Private Sub xtrFORM9Main_BeforePrint(sender As Object, e As PrintEventArgs) Handles Me.BeforePrint

        cnt_col_credits = ReportModel.getReport_TotalColumn(PERSON_ID)

        TotalWidth = (default_total_width / cnt_col_credits) * cnt_col_credits

    End Sub

    Private Sub GroupHeader5_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupHeader5.BeforePrint

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
            label.Name = "lblcredits" & col
            label.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
            label.SizeF = New System.Drawing.SizeF(_width, _hight)
            label.Text = col
            label.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
            label.BackColor = System.Drawing.Color.Silver

            Me.GroupHeader5.Controls.Add(label)

            _xLoc = _xLoc + _width

            col += 1
        End While

        lblHeader.SizeF = New System.Drawing.SizeF(TotalWidth, 18.5)

    End Sub

    Private Sub GroupHeader4_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupHeader4.BeforePrint




        Dim _width As Double = default_total_width / cnt_col_credits
        Dim _hight As Double = default_hight

        Dim _xLoc As Double = 447.61
        Dim _yLoc As Double = 0


        Dim col As Integer = 1
        While cnt_col_credits >= col

            Dim label As New XRLabel()

            label.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
            label.Font = New System.Drawing.Font("Century Gothic", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
            label.LocationFloat = New DevExpress.Utils.PointFloat(_xLoc, _yLoc)
            label.Multiline = True
            label.Name = "lblTotalPagecredits" & col
            label.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
            label.SizeF = New System.Drawing.SizeF(_width, _hight)
            label.Text = col
            label.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter

            Me.GroupHeader4.Controls.Add(label)

            _xLoc = _xLoc + _width

            col += 1
        End While


    End Sub

    Private Sub GroupFooter1_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupFooter1.BeforePrint

        Dim _width As Double = default_total_width / cnt_col_credits
        Dim _hight As Double = default_hight

        Dim _xLoc As Double = 447.61
        Dim _yLoc As Double = 0


        Dim col As Integer = 1
        While cnt_col_credits >= col

            Dim label As New XRLabel()

            label.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
            label.Font = New System.Drawing.Font("Century Gothic", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
            label.LocationFloat = New DevExpress.Utils.PointFloat(_xLoc, _yLoc)
            label.Multiline = True
            label.Name = "lblGroupSummaryTotal" & col
            label.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
            label.SizeF = New System.Drawing.SizeF(_width, _hight)
            label.Text = col
            label.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter

            Me.GroupFooter1.Controls.Add(label)

            _xLoc = _xLoc + _width

            col += 1
        End While



    End Sub

    Private Sub lblTotalfromPage_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles lblTotalfromPage.PrintOnPage
        If e.PageCount > 1 Then
            If e.PageIndex = 1 Then
                GroupHeader4.Visible = False
            Else
                GroupHeader4.Visible = True
            End If
        Else
            GroupHeader4.Visible = False
        End If

    End Sub

    Private Sub GroupHeader3_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupHeader3.BeforePrint
        Dim width = XrSubreportForm9.WidthF + 34.0
        XrPageInfo1.SizeF = New System.Drawing.SizeF(width, 19.5)

    End Sub

    'Private Sub XrLabel6_PrintOnPage(sender As Object, e As PrintOnPageEventArgs) Handles XrLabel6.PrintOnPage

    '    If e.PageCount > 1 Then
    '        If e.PageIndex = 1 Then
    '            GroupHeader4.Visible = False
    '        Else
    '            GroupHeader4.Visible = True
    '        End If
    '    Else
    '        GroupHeader4.Visible = False
    '    End If

    'End Sub
End Class