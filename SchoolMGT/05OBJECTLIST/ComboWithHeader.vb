Public Class ComboWithHeader

    Inherits ComboBox
    Private m_PreviouslySelectedIndex As Integer = -1

    Public Sub New()
        MyBase.New()
        Me.DrawMode = DrawMode.OwnerDrawVariable
    End Sub

    Protected Overrides Sub OnDrawItem(ByVal e As System.Windows.Forms.DrawItemEventArgs)
        If e.Index <> -1 Then
            If e.Index = 0 Then
                e.Graphics.FillRectangle(Brushes.LightGray, e.Bounds)
                Dim p As New Pen(Color.Black, 3)
                e.Graphics.DrawRectangle(p, e.Bounds)
                p.Dispose()
                Dim x As New Font(e.Font, FontStyle.Bold)
                e.Graphics.DrawString(Me.Items(e.Index).ToString, x,
                    Brushes.Black, e.Bounds.Left, e.Bounds.Top)
                x.Dispose()
            Else
                If e.State = (DrawItemState.Selected Or DrawItemState.Focus) Then
                    e.Graphics.FillRectangle(SystemBrushes.Highlight, e.Bounds)
                    e.Graphics.DrawString(Me.Items(e.Index).ToString,
                        e.Font, Brushes.White, e.Bounds.Left, e.Bounds.Top)
                Else
                    e.Graphics.FillRectangle(Brushes.White, e.Bounds)
                    e.Graphics.DrawString(Me.Items(e.Index).ToString,
                        e.Font, Brushes.Black, e.Bounds.Left, e.Bounds.Top)
                End If
            End If
        End If
    End Sub

    Protected Overrides Sub OnDropDown(ByVal e As System.EventArgs)
        If Me.Items(0).ToString <> "Header" Then
            Me.Items.Insert(0, "Header")
        End If
        MyBase.OnDropDown(e)
    End Sub
    Protected Overrides Sub OnSelectedIndexChanged(ByVal e As System.EventArgs)
        If Me.SelectedIndex = 0 Then
            Me.SelectedIndex = m_PreviouslySelectedIndex
        Else
            m_PreviouslySelectedIndex = Me.SelectedIndex
        End If
    End Sub

End Class
