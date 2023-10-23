Public Class frmSectioning

    Private RecordPresenter As Section_Presenter
    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        RecordPresenter = New Section_Presenter(Me)
    End Sub

End Class