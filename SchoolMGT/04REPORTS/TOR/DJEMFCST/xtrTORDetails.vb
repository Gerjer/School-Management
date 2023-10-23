Imports System.Drawing.Printing

Public Class xtrTORDetails
    Private Sub xtrTORDetails_BeforePrint(sender As Object, e As PrintEventArgs) Handles Me.BeforePrint

    End Sub

    Dim dummy1 As String = ""
    Dim dummy2 As String = ""
    Private Sub Detail_BeforePrint(sender As Object, e As PrintEventArgs) Handles Detail.BeforePrint

        'If dummy1 = "" Then
        '    dummy1 = txtTerm.Value
        'ElseIf dummy1 = txtTerm.Value Then
        '    dummy2 = txtAcademicYear.Value
        '    txtTerm.Text = dummy2
        'ElseIf dummy2 = txtTerm.Value Then
        '    txtTerm.Text = ""
        'End If

        'Dim subject_name = txtDescription.Value

        'txtTerm.Value = "roger"
        'txtCourse.Value = "roger"
        'txtFinal.Value = "roger"
        'txtReExam.Value = "roger"
        'txtCredits.Value = "roger"

        If NSTP_CODE = txtCourseCode.Value Then
            txtTerm.Value = ""
            txtCourse.Value = "GRADUATE:"
            txtFinal.Value = ""
            txtReExam.Value = ""
            txtCredits.Value = ""
        End If

    End Sub
End Class