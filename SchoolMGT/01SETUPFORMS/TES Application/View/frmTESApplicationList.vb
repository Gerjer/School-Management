Public Class frmTESApplicationList
    Dim ListPresenter As TESApplicationListPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.
        ListPresenter = New TESApplicationListPresenter(Me)

    End Sub

    Private Sub gcTESApplication_Click(sender As Object, e As EventArgs) Handles gcTESApplication.Click

    End Sub
End Class