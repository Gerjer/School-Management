Public Class frmDailyCashCollection

    Private ListPresenter As DailyCollectionPresenter
    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New DailyCollectionPresenter(Me)
    End Sub

End Class