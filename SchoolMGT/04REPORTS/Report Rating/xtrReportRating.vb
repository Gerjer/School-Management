Imports System.ComponentModel
Imports System.Drawing.Printing

Public Class xtrReportRating

    Public _student_name As String = ""
    Public _year As String = ""
    Public _course As String = ""
    Public _semester As String = ""
    Public _academic_year As String = ""
    Private Sub xtrReportRating_BeforePrint(sender As Object, e As PrintEventArgs) Handles Me.BeforePrint

        ' XrRichText1.Html = "<html><body><font><pre class='tab'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is certify that  <b><ins> " & _studentname & " </ins></b>  ,a  <ins><b>" & _course & "</b></ins>    student of   <ins><b>" & _schoolname & "</b></ins>    during the Academic Year   <ins><b>" & _academicyear & "</b></ins>  hereby granted Certificate of Transfer effective this date.
        '                                            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Her official transcript of records will be forwarded only upon receipt of the return slip below duly accomplish.</p></pre>.</font></body></html>"


        XrRichText1.Html = "<html><body><font><pre class='tab'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style='font-size:130%;font-family:Comic Sans MS;'>      THIS IS TO CERTIFY that  <b><ins> " & _student_name & " </ins></b>  is a bonafide <ins><b>" & _year & "</b></ins>  student of the 4-Year Bacculaureate Program leading to the Degree of <ins><b>" & _course & "</b></ins><ins> </ins><ins><b>" & _semester & "</b></ins><ins> </ins><ins><b>" & _academic_year & "</b></ins> at Don Jose Ecleo Memorial College, Justiniana Edera,  San Jose,  Dinagat Island,  Philippines. With the following subject and ratings.</p></pre>.</font></body></html>"


    End Sub
End Class