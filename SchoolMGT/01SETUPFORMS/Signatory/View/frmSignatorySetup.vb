Public Class frmSignatorySetup

    Dim presenter As SignatoryPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        presenter = New SignatoryPresenter(Me)

    End Sub

End Class