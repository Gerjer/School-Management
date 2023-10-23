Imports SchoolMGT

Public Class frmReportRating

    Dim ListPresenter As ReportRatingLisPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New ReportRatingLisPresenter(Me)

    End Sub


End Class