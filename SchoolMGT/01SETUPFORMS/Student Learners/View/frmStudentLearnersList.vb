﻿Imports System.Windows.Forms
Imports DevExpress.XtraTreeList
Imports DevExpress.XtraTreeList.Nodes
Imports DevExpress.XtraTreeList.Columns
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Base

Public Class frmStudentLearnersList
    Dim ListPresenter As StudentLearnersListPresenter


    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New StudentLearnersListPresenter(Me)

    End Sub

    Private Sub PrintCORToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PrintCORToolStripMenuItem.Click

        Cursor = Cursors.WaitCursor
        '      ListPresenter.PrintCOR(sender, e)
        Cursor = Cursors.Default

    End Sub


    Private Sub ButtonX1_Click(sender As Object, e As EventArgs) Handles ButtonX1.Click

        fmaStudentAdmissionSetupForm.ShowDialog(Me)


    End Sub



    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        'Dim tick As Integer = CInt(lbltimer.Text)

        'lbltimer.Text = tick + 1

        'If tick = 1 Then
        '    Timer1.Enabled = False
        '    lbltimer.Text = "0"
        '    pbxSearch.Visible = False

        'End If

        '   Timer1_Tick()
    End Sub

End Class