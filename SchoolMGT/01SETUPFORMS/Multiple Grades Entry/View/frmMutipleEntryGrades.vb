Imports System.Resources

Public Class frmMutipleEntryGrades
    Dim ListPresenter As MultipleGrade_Presenter
    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New MultipleGrade_Presenter(Me)

    End Sub

    Private Sub GridView1_CustomDrawCell(sender As Object, e As DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs) Handles GridView1.CustomDrawCell

    End Sub
End Class