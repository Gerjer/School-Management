Public Class frmGraduateRecord

    Dim RecordPresener As GraduateRecordPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        RecordPresener = New GraduateRecordPresenter(Me)

    End Sub

    Private Sub gcGraduateEntry_Click(sender As Object, e As EventArgs)

    End Sub
End Class