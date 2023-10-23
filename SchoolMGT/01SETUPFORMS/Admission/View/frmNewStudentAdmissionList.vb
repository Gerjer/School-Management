Imports DevExpress.XtraGrid.Views.Grid
Imports SchoolMGT
Imports System.Net.Mail
Imports System.Threading
Imports System.ComponentModel
Imports System.Runtime.InteropServices
Imports System.IO
Imports System.Reflection
Imports System.Version
Imports DevExpress.Data.Filtering
Imports DevExpress.XtraGrid.Columns
Imports DevExpress.XtraGrid.Views.Grid.ViewInfo

Public Class frmNewStudentAdmissionList

    Dim ListPresenter As StudentAdmissionListPresenter

    Public Sub New()

        ' This call is required by the designer.
        InitializeComponent()

        ' Add any initialization after the InitializeComponent() call.

        ListPresenter = New StudentAdmissionListPresenter(Me)

    End Sub


    Private Sub ButtonX3_Click(sender As Object, e As EventArgs) Handles ButtonX3.Click
        Me.Close()
    End Sub



    Private Sub gvStudentAdmission_CustomDrawFooterCell(sender As Object, e As FooterCellCustomDrawEventArgs) Handles gvStudentAdmission.CustomDrawFooterCell
        '     If e.Column.FieldName = "MALE" Then
        '' get the total
        ''      Dim totalValue As Integer = e.Column.SummaryItem.SummaryValue.ToString.AsInt()
        ''     If totalValue <> 100 Then
        'e.Appearance.BackColor = Color.Red
        'e.Appearance.DrawBackground(e.Graphics, e.Cache, e.Bounds)
        'e.Appearance.ForeColor = Color.Red
        'e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
        'e.Appearance.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center
        'e.Appearance.Options.UseTextOptions = True
        ''e.Handled = True
        ''    End If

        e.Bounds.Inflate(-5, -5)
            '      e.Appearance.ForeColor = Color.Teal
            e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
            '       e.Appearance.FontSizeDelta = 3
            e.DefaultDraw()
            '     e.Cache.DrawRectangle(e.Cache.GetPen(Color.DarkOliveGreen, 5), e.Bounds)
            e.Handled = True



        '      End If



    End Sub

    Private Sub gvStudentAdmission_CustomDrawRowFooter(sender As Object, e As DevExpress.XtraGrid.Views.Base.RowObjectCustomDrawEventArgs) Handles gvStudentAdmission.CustomDrawRowFooter
        e.Cache.FillRectangle(e.Cache.GetGradientBrush(Nothing, Color.Transparent, Color.Transparent, Nothing), Nothing)
        e.Handled = True
    End Sub


    'Private Sub gvStudentAdmission_EndGrouping(sender As Object, e As EventArgs) Handles gvStudentAdmission.EndGrouping
    '    Dim view As GridView = TryCast(sender, GridView)
    '    Dim go As GroupOperator = New GroupOperator()

    '    For Each col As GridColumn In view.Columns

    '        If col.GroupIndex >= 0 Then
    '            col.FilterMode = DevExpress.XtraGrid.ColumnFilterMode.DisplayText
    '            go.Operands.Add(New BinaryOperator(col.FieldName, "", BinaryOperatorType.NotEqual))
    '        End If
    '    Next

    '    view.ActiveFilterCriteria = go
    'End Sub

    'Private Sub gvStudentAdmission_CustomDrawCell(sender As Object, e As DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs) Handles gvStudentAdmission.CustomDrawCell
    '    Dim view As GridView = TryCast(sender, GridView)
    '    If e.Column.VisibleIndex = 0 Then
    '        TryCast(e.Cell, GridCellInfo).CellButtonRect = Rectangle.Empty
    '    End If
    'End Sub
End Class