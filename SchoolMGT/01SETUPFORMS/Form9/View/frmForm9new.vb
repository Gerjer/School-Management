Imports DevExpress.XtraGrid.Views.Base
Imports DevExpress.XtraGrid.Views.Grid

Public Class frmForm9new

    Dim RecordPresenter As Form9new_Presenter
    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        RecordPresenter = New Form9new_Presenter(Me)
    End Sub


    Private Sub RepositoryItemLookUpEdit1_Closed(sender As Object, e As DevExpress.XtraEditors.Controls.ClosedEventArgs) Handles RepositoryItemLookUpEdit1.Closed

        RecordPresenter.RepositoryItemLookUpEdit1_Closed(sender, e)

    End Sub

    Private Sub txtAY_TextChanged(sender As Object, e As EventArgs)
        Panel7.Enabled = True
    End Sub

    Private Sub GroupPanel1_Click(sender As Object, e As EventArgs) Handles GroupPanel1.Click

    End Sub
End Class