Imports DataDynamics.ActiveReports 
Imports DataDynamics.ActiveReports.Document

Public Class subrpt_StudentSubjectList
    Private Sub Detail1_BeforePrint(sender As Object, e As EventArgs) Handles Detail1.BeforePrint
        If TextBox22.Text = "TOTAL" Then
            TextBox22.Border.TopColor = Color.Black
            TextBox22.Border.TopStyle = BorderLineStyle.Solid
            TextBox22.Style = "color: DarkBlue; ddo-char-set: 0; text-align: right; font-size: 6pt; font-weight: bold;vertical-ali" &
    "gn: middle; "

            TextBox23.Border.TopColor = Color.Black
            TextBox23.Border.TopStyle = BorderLineStyle.Solid
            TextBox23.Style = "color: DarkBlue; ddo-char-set: 0; text-align: right; font-size: 6pt; font-weight: bold;vertical-ali" &
    "gn: middle; "

        ElseIf TextBox22.Text = "PREVIOUS BALANCE" Then
            TextBox22.Style = "color: Tomato; ddo-char-set: 0; text-align: right; font-size: 6pt;font-weight: bold; vertical-ali" &
    "gn: middle; "

            TextBox23.Style = "color: Tomato; ddo-char-set: 0; text-align: right; font-size: 6pt;font-weight: bold; vertical-ali" &
"gn: middle; "

        ElseIf TextBox22.Text = "DISCOUNT" Then
            TextBox22.Style = "color: Maroon; ddo-char-set: 0; text-align: right; font-size: 6pt; font-weight: bold;vertical-ali" &
    "gn: middle; "

            TextBox23.Style = "color: Maroon; ddo-char-set: 0; text-align: right; font-size: 6pt; font-weight: bold;vertical-ali" &
    "gn: middle; "

        ElseIf TextBox22.Text = "TOTAL PAYABLES" Then
            TextBox22.Style = "color: Black; ddo-char-set: 0; text-align: right; font-size: 8pt; font-weight: bold;vertical-ali" &
"gn: middle; "

            TextBox23.Style = "color: Black; ddo-char-set: 0; text-align: right; font-size: 8pt; font-weight: bold;vertical-ali" &
"gn: middle; "

        Else
            TextBox22.Style = "color: Black; ddo-char-set: 0; text-align: right; font-weight: normal; font-size:" &
    " 6pt; vertical-align: middle; "
        End If
    End Sub
End Class
