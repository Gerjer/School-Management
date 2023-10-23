Imports DevExpress.XtraExport.Utils
Imports DevExpress.XtraReports.UI
Imports DevExpress.Data

Public Class xtrEnrollmentSlip_ElementaryG123
    Private Sub GroupHeader1_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs) Handles GroupHeader1.BeforePrint


        For x As Integer = 0 To dt_subject_global.Rows.Count - 1

            Dim Subject As String = dt_subject_global(x)("SUBJECT TITLE")

            Select Case Subject
                Case "Mother Tongue"
                    XrLabel19.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel20.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel21.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel22.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Filipino"
                    XrLabel24.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel25.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel26.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel27.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "English"
                    XrLabel29.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel30.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel31.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel32.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Mathematics"
                    XrLabel34.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel35.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel36.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel37.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Science"
                    XrLabel39.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel40.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel41.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel42.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Araling Panlipunan"
                    XrLabel44.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel45.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel46.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel64.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Music"
                    XrLabel116.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel82.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel83.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel84.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Arts"
                    XrLabel117.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel87.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel88.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel89.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Physical Education"
                    XrLabel91.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel92.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel93.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel94.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Health"
                    XrLabel119.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel97.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel98.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel99.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Eduk. sa Pagpapakatao"
                    XrLabel105.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel104.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel103.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel102.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case "Instituitional Computer"
                    XrLabel110.Text = If(IsDBNull(dt_subject_global(x)("SUBJECT TITLE")), "", dt_subject_global(x)("SUBJECT TITLE"))
                    XrLabel109.Text = If(IsDBNull(dt_subject_global(x)("TIME")), "", dt_subject_global(x)("TIME"))
                    XrLabel108.Text = If(IsDBNull(dt_subject_global(x)("DAYS")), "", dt_subject_global(x)("DAYS"))
                    XrLabel107.Text = If(IsDBNull(dt_subject_global(x)("INSTRUCTOR")), "", dt_subject_global(x)("INSTRUCTOR"))
                Case Else
            End Select


        Next







    End Sub
End Class