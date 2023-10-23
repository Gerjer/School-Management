Public Class frmStudentRate
    Dim ListPresenter As StudentRate_Presenter
    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New StudentRate_Presenter(Me)

    End Sub

End Class