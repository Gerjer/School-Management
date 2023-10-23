Imports System.Windows.Forms

Public Class frmStudentAdmissionEntry

    Dim recordPresenter As AdmissionRecordPresenter


    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        recordPresenter = New AdmissionRecordPresenter(Me)

    End Sub

End Class