Imports SchoolMGT
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraGrid.Columns

Public Class frmGraduatesList

    Dim ListPresenter As GraduatesListPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New GraduatesListPresenter(Me)

    End Sub


End Class