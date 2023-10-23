Imports System.Drawing.Printing

Public Class xtrDailyCashCollection
    Dim row As Integer = 0
    Private Sub Detail_BeforePrint(sender As Object, e As PrintEventArgs) Handles Detail.BeforePrint


        '    Detail.PageBreak = DevExpress.XtraReports.UI.PageBreak.AfterBand
        '   Detail.PageBreak = DevExpress.XtraReports.UI.PageBreak.BeforeBandExceptFirstEntry

    End Sub
End Class