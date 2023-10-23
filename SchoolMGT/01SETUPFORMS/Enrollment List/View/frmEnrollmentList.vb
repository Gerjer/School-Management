Imports SchoolMGT
Imports DevExpress.XtraGrid.Views.Grid
Imports DevExpress.XtraGrid.Columns

Public Class frmEnrollmentList

    Dim ListPresenter As EnrollmentListPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New EnrollmentListPresenter(Me)

    End Sub

    'Private Sub gvEnrollmentList_DataSourceChanged(sender As Object, e As EventArgs) Handles gvEnrollmentList.DataSourceChanged
    '    Dim view As GridView = TryCast(sender, GridView)
    '    Dim column As GridColumn = view.Columns("DateOfBirth")
    '    If column.ColumnType Is GetType(DateTime) Then
    '        column.DisplayFormat.FormatType = DevExpress.Utils.FormatType.DateTime
    '        column.DisplayFormat.FormatString = "mm/dd/yyyy"
    '    End If
    'End Sub
End Class