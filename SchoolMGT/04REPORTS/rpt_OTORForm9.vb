Imports DataDynamics.ActiveReports 
Imports DataDynamics.ActiveReports.Document 

Public Class rpt_OTORForm9

    Sub New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

    End Sub
    Sub New(ByVal studentname As String, ByVal elem As String, _
            ByVal elemyr As String, ByVal hs As String, _
            ByVal hsyr As String, ByVal address As String, _
            ByVal admittedTo As String, ByVal picturepath As String)

        ' This call is required by the Windows Form Designer.
        InitializeComponent()
        Me.txtName.Text = studentname
        Me.txtElem.Text = elem
        Me.txtElemYr.Text = elemyr
        Me.txtHS.Text = hs
        Me.txtHSYr.Text = hsyr
        Me.txtAddress.Text = address
        Me.txtAdmittedTO.Text = admittedTo

        Picture2.Image = System.Drawing.Image.FromFile(picturepath)

        ' Add any initialization after the InitializeComponent() call.

    End Sub

    
   
    Private Sub Detail1_Format(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Detail1.Format


        For Each iControl As DataDynamics.ActiveReports.ARControl In Detail1.Controls
            If TypeOf iControl Is DataDynamics.ActiveReports.TextBox Then

                If CType(iControl, DataDynamics.ActiveReports.TextBox).Name.Contains("txtcd") Then

                    CType(iControl, DataDynamics.ActiveReports.TextBox).Text = ""

                    Dim name As String = ""
                    name = iControl.Name

                    Dim controlNumber As String = name.Replace("txtcd", "")

                    If Me.txtccid.Text = controlNumber Then
                        Try
                            CType(iControl, DataDynamics.ActiveReports.TextBox).Text = Me.txtCredit.Text
                        Catch ex As Exception

                        End Try
                    End If
                End If
                



            End If
        Next
    End Sub

    Private Sub PageHeader1_Format(sender As Object, e As EventArgs) Handles PageHeader1.Format
        TextBox1.Text = COMPANY_NAME
        TextBox2.Text = COMPANY_ADDRESS
        '     Picture1.Image = COMPANY_IMAGE

    End Sub
End Class
