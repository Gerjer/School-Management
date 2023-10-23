Imports System.Drawing.Printing
'Imports DevExpress.XtraExports.UI
Public Class xtrTORMain

    Private Sub PageFooter_BeforePrint(sender As Object, e As PrintEventArgs) Handles PageFooter.BeforePrint


    End Sub


    Private Sub txtpurpose_PrintOnPage(sender As Object, e As DevExpress.XtraReports.UI.PrintOnPageEventArgs) Handles txtpurpose.PrintOnPage

        If e.PageIndex = e.PageCount - 1 Then

        Else
            XrLabel46.Visible = True
            txtpurpose.Visible = False
            XrLabel45.Visible = False
            XrLabel47.Visible = False
            txtGraduated.Visible = False

            GroupFooter1.Visible = False

            'If e.PageIndex > 0 Then
            '    XrPictureBox2.Visible = False
            'End If
        End If

    End Sub

    Private Sub XrLabel46_PrintOnPage(sender As Object, e As DevExpress.XtraReports.UI.PrintOnPageEventArgs) Handles XrLabel46.PrintOnPage
        If e.PageIndex = e.PageCount - 1 Then
            txtpurpose.Visible = True
            XrLabel45.Visible = True
            XrLabel47.Visible = True
            txtGraduated.Visible = True

            GroupFooter1.Visible = True

            XrLabel46.Visible = False
        End If

        'If e.PageIndex > 0 Then
        '    XrPictureBox2.Visible = False
        'End If

    End Sub

    Private Sub XrPictureBox2_PrintOnPage(sender As Object, e As DevExpress.XtraReports.UI.PrintOnPageEventArgs) Handles XrPictureBox2.PrintOnPage
        If e.PageIndex > 0 Then
            XrPictureBox2.Visible = False
        Else
            XrPictureBox2.Visible = True
        End If



    End Sub

    Private Sub XrLabel45_PrintOnPage(sender As Object, e As DevExpress.XtraReports.UI.PrintOnPageEventArgs) Handles XrLabel45.PrintOnPage

        If e.PageIndex = e.PageCount - 1 Then

        Else
            XrLabel46.Visible = True
            txtpurpose.Visible = False
            XrLabel45.Visible = False
            XrLabel47.Visible = False
            txtGraduated.Visible = False

            GroupFooter1.Visible = False

            'If e.PageIndex > 0 Then
            '    XrPictureBox2.Visible = True
            'End If
        End If
    End Sub

    Private Sub XrLabel47_PrintOnPage(sender As Object, e As DevExpress.XtraReports.UI.PrintOnPageEventArgs) Handles XrLabel47.PrintOnPage
        If e.PageIndex = e.PageCount - 1 Then

        Else
            XrLabel46.Visible = True
            txtpurpose.Visible = False
            XrLabel45.Visible = False
            XrLabel47.Visible = False
            txtGraduated.Visible = False

            GroupFooter1.Visible = False

            'If e.PageIndex > 0 Then
            '    XrPictureBox2.Visible = True
            'End If
        End If
    End Sub

    Private Sub txtGraduated_PrintOnPage(sender As Object, e As DevExpress.XtraReports.UI.PrintOnPageEventArgs) Handles txtGraduated.PrintOnPage
        If e.PageIndex = e.PageCount - 1 Then

        Else
            XrLabel46.Visible = True
            txtpurpose.Visible = False
            XrLabel45.Visible = False
            XrLabel47.Visible = False
            txtGraduated.Visible = False

            GroupFooter1.Visible = False

            'If e.PageIndex > 0 Then
            '    XrPictureBox2.Visible = True
            'End If
        End If
    End Sub
End Class