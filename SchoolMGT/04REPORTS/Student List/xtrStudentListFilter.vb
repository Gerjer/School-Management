Imports System.Drawing.Printing
Imports DevExpress.XtraReports.UI

Public Class xtrStudentListFilter

    Public LabelName_List As New List(Of Tuple(Of String, String))

    Dim xLabel As Double = 21.88
    Dim yLabel As Double = 10
    Dim yText As Double = 10

    Dim ToTalHeight As Double = 0

    Private Sub xtrStudentListFilter_BeforePrint(sender As Object, e As PrintEventArgs) Handles Me.BeforePrint




    End Sub

    Private Sub GroupHeader2_BeforePrint(sender As Object, e As PrintEventArgs) Handles GroupHeader2.BeforePrint

        ToTalHeight = LabelName_List.Count * 28.7918243

        GroupHeader2.HeightF = ToTalHeight


        For Each value As Tuple(Of String, String) In LabelName_List
            Dim LabelName As String = value.Item1
            Dim TextName As String = value.Item2

            Dim label As New XRLabel()

            label.LocationF = New DevExpress.Utils.PointFloat(21.88, yLabel)
            label.Multiline = True
            '   label.Name = "XrLabel1"
            label.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 96.0!)
            label.SizeF = New System.Drawing.SizeF(162.5!, 23.0!)
            label.Text = LabelName

            GroupHeader2.Controls.Add(label)


            Dim Text As New XRLabel()

            TextName = Replace(TextName, "'", "")

            Text.LocationFloat = New DevExpress.Utils.PointFloat(184.38, yText)
            Text.Multiline = True
            '   Text.Name = "XrLabel6"
            Text.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 10, 0, 0, 100.0!)
            Text.SizeF = New System.Drawing.SizeF(464.5833!, 23.0!)
            Text.Text = ": " & TextName

            GroupHeader2.Controls.Add(Text)

            yLabel += 18
            yText += 18

        Next

    End Sub
End Class