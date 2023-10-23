Imports System.Windows.Forms
Imports DevExpress.XtraTreeList
Imports DevExpress.XtraTreeList.Nodes
Imports DevExpress.XtraTreeList.Columns
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Base

Public Class frmStudentList
    Dim ListPresenter As StudentList_Presenter


    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New StudentList_Presenter(Me)

    End Sub

    Private Sub expReasonChange_Click(sender As Object, e As EventArgs) Handles expReasonChange.Click

    End Sub
End Class