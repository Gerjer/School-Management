Imports DataDynamics.ActiveReports 
Imports DataDynamics.ActiveReports.Document 

Public Class hr_subRPT_EmpDTR


    

    Private Sub Detail1_Format(ByVal sender As Object, ByVal e As System.EventArgs) Handles Detail1.Format
        Dim dayName As String = Me.txtVacation.Text
        
        

        If dayName = "Saturday" Or dayName = "Sunday" Then
            Me.txtamin.Visible = False
            Me.txtamout.Visible = False
            Me.txtinpm.Visible = False
            Me.txtpmout.Visible = False
            Me.txtLate.Visible = False
            Me.txtUT.Visible = False
            txtFiller.Visible = False

            Me.txtVacation.Visible = True
            If Not Me.txtamin.Text = "" And Not Me.txtamin.Text = "--" Then

                If Me.txtamin.Text.Contains("HOLIDAY") Then
                    Me.txtVacation.Text = "HOLIDAY - " & Me.txtinpm.Text
                    Me.txtVacation.Visible = True
                    Me.txtamin.Text = ""
                    Me.txtamout.Text = ""
                    Me.txtinpm.Text = ""
                    Me.txtpmout.Text = ""
                    Me.txtLate.Text = ""
                    Me.txtUT.Text = ""


                    Me.txtamin.Visible = False
                    Me.txtamout.Visible = False
                    Me.txtinpm.Visible = False
                    Me.txtpmout.Visible = False
                    Me.txtLate.Visible = False
                    Me.txtUT.Visible = False
                    txtFiller.Visible = False
                ElseIf Not Me.txtamin.Text = "" _
               Or Not Me.txtamout.Text = "" _
               Or Not Me.txtinpm.Text = "" _
               Or Not Me.txtpmout.Text = "" Then
                    Me.txtVacation.Visible = False
                    Me.txtamin.Visible = True
                    Me.txtamout.Visible = True
                    Me.txtinpm.Visible = True
                    Me.txtpmout.Visible = True
                    Me.txtLate.Visible = True
                    Me.txtUT.Visible = True
                    txtFiller.Visible = True
                Else
                    Me.txtVacation.Visible = False
                End If

            ElseIf Not Me.txtamin.Text = "" _
                   Or Not Me.txtamout.Text = "" _
                   Or Not Me.txtinpm.Text = "" _
                   Or Not Me.txtpmout.Text = "" Then
                Me.txtVacation.Visible = False
                'Me.txtamin.Text = ""
                'Me.txtamout.Text = ""
                'Me.txtinpm.Text = ""
                'Me.txtpmout.Text = ""
                'Me.txtLate.Text = ""
                'Me.txtUT.Text = ""
                Me.txtamin.Visible = True
                Me.txtamout.Visible = True
                Me.txtinpm.Visible = True
                Me.txtpmout.Visible = True
                Me.txtLate.Visible = True
                Me.txtUT.Visible = True
                txtFiller.Visible = True
            End If

            If Me.txtDTRREMARKS.Text.Length > 0 Then
                If Me.txtDTRREMARKS.Text = "NG" Then
                    'Me.txtVacation.Text = Me.txtDTRREMARKS.Text
                    Me.txtVacation.Visible = True
                    Me.txtamin.Text = ""
                    Me.txtamout.Text = ""
                    Me.txtinpm.Text = ""
                    Me.txtpmout.Text = ""
                    Me.txtLate.Text = ""
                    Me.txtUT.Text = ""
                Else
                    Me.txtVacation.Text = Me.txtDTRREMARKS.Text
                    Me.txtVacation.Visible = True
                    Me.txtamin.Text = ""
                    Me.txtamout.Text = ""
                    Me.txtinpm.Text = ""
                    Me.txtpmout.Text = ""
                    Me.txtLate.Text = ""
                    Me.txtUT.Text = ""
                End If


            End If

        ElseIf Me.txtamin.Text.Contains("HOLIDAY") Then

            If Me.txtDTRREMARKS.Text.Length > 0 Then
                Me.txtVacation.Text = Me.txtDTRREMARKS.Text
                Me.txtVacation.Visible = True
                Me.txtamin.Text = ""
                Me.txtamout.Text = ""
                Me.txtinpm.Text = ""
                Me.txtpmout.Text = ""
                Me.txtLate.Text = ""
                Me.txtUT.Text = ""
            Else
                Me.txtVacation.Text = "HOLIDAY - " & Me.txtinpm.Text
                Me.txtVacation.Visible = True
                Me.txtamin.Text = ""
                Me.txtamout.Text = ""
                Me.txtinpm.Text = ""
                Me.txtpmout.Text = ""
                Me.txtLate.Text = ""
                Me.txtUT.Text = ""

                Me.txtamin.Visible = False
                Me.txtamout.Visible = False
                Me.txtinpm.Visible = False
                Me.txtpmout.Visible = False
                Me.txtLate.Visible = False
                Me.txtUT.Visible = False
                txtFiller.Visible = False

            End If

        ElseIf Me.txtamin.Text.Contains("OB") Then

            If Me.txtDTRREMARKS.Text.Length > 0 Then
                Me.txtVacation.Visible = True
                Me.txtVacation.Text = Me.txtDTRREMARKS.Text
                Me.txtamin.Text = ""
                Me.txtamout.Text = ""
                Me.txtinpm.Text = ""
                Me.txtpmout.Text = ""
                Me.txtLate.Text = ""
                Me.txtUT.Text = ""

                Me.txtamin.Visible = False
                Me.txtamout.Visible = False
                Me.txtinpm.Visible = False
                Me.txtpmout.Visible = False
                Me.txtLate.Visible = False
                Me.txtUT.Visible = False
                txtFiller.Visible = False
            Else
                Me.txtVacation.Visible = False

            End If



        ElseIf Me.txtDTRREMARKS.Text.Contains("LEAVE") Then
            'Me.txtVacation.Text = Me.txtamin.Text

            If Me.txtamin.Text.Length > 0 And Not Me.txtamin.Text = "--" Then
                If Me.txtLate.Text = "-6" Then
                    Me.txtLate.Text = "0"
                End If

                Me.txtVacation.Visible = False
                If Me.txtDTRREMARKS.Text.Contains("SICK") Then
                    'Me.txtVacation.Text = "SICK LEAVE"
                    Me.txtLate.Text += "SL"
                    Me.txtUT.Text += "SL"
                ElseIf Me.txtDTRREMARKS.Text.Contains("VACATION") Then
                    'Me.txtVacation.Text = "VACATION LEAVE"
                    Me.txtLate.Text += "VL"
                    Me.txtUT.Text += "VL"
                ElseIf Me.txtDTRREMARKS.Text.Contains("SPECIAL") Then
                    'Me.txtVacation.Text = "SPECIAL LEAVE"
                    Me.txtLate.Text += "SP"
                    Me.txtUT.Text += "SP"
                ElseIf Me.txtDTRREMARKS.Text.Contains("FORCED") Then
                    'Me.txtVacation.Text = "FORCED LEAVE"
                    Me.txtLate.Text += "FL"
                    Me.txtUT.Text += "FL"
                ElseIf Me.txtDTRREMARKS.Text.Contains("BIRTHDAY") Then
                    'Me.txtVacation.Text = "FORCED LEAVE"
                    Me.txtLate.Text += "BL"
                    Me.txtUT.Text += "BL"
                ElseIf Me.txtDTRREMARKS.Text.Contains("PATERNITY") Then
                    'Me.txtVacation.Text = "FORCED LEAVE"
                    Me.txtLate.Text += "PL"
                    Me.txtUT.Text += "PL"
                ElseIf Me.txtDTRREMARKS.Text.Contains("MATERNITY") Then
                    'Me.txtVacation.Text = "FORCED LEAVE"
                    Me.txtLate.Text += "ML"
                    Me.txtUT.Text += "ML"
                End If

                'Me.txtamin.Text = ""
                'Me.txtamout.Text = ""
                'Me.txtinpm.Text = ""
                'Me.txtpmout.Text = ""
                'Me.txtLate.Text = ""
                'Me.txtUT.Text = ""
            Else
                Me.txtVacation.Visible = True
                Me.txtVacation.Text = Me.txtDTRREMARKS.Text
                Me.txtamin.Text = ""
                Me.txtamout.Text = ""
                Me.txtinpm.Text = ""
                Me.txtpmout.Text = ""
                Me.txtLate.Text = ""
                Me.txtUT.Text = ""

                Me.txtamin.Visible = False
                Me.txtamout.Visible = False
                Me.txtinpm.Visible = False
                Me.txtpmout.Visible = False
                Me.txtLate.Visible = False
                Me.txtUT.Visible = False
                txtFiller.Visible = False
            End If


        ElseIf Me.txtLate.Text.Contains("-6") Then
            Me.txtVacation.Text = ""
            Me.txtVacation.Visible = False
            Me.txtAWOL.Visible = True
            Me.txtAWOL.Text = "- INC -"
            Me.txtLate.Text = ""
            Me.txtUT.Text = ""
            'ElseIf Me.txtamin.Text = "--" And _
            '       Me.txtamout.Text = "--" And _
            '       Me.txtinpm.Text = "--" And _
            '       Me.txtpmout.Text = "--" Then

            '    Dim dayNow As Double = CDbl(Format(Date.Now, "dd"))
            '    Dim dayCtr As Double = CDbl(Me.TextBox1.Text)
            '    If dayCtr < dayNow Then
            '        Me.txtVacation.Text = ""
            '        Me.txtVacation.Visible = False
            '        Me.txtAWOL.Visible = True
            '        Me.txtAWOL.Text = "- AWOL -"
            '        Me.txtLate.Text = ""
            '        Me.txtUT.Text = ""
            '    Else
            '        Me.txtVacation.Text = ""
            '        Me.txtVacation.Visible = False
            '        Me.txtAWOL.Text = ""
            '        Me.txtAWOL.Visible = False
            '    End If
        Else
            Me.txtVacation.Text = ""
            Me.txtVacation.Visible = False
            Me.txtAWOL.Text = ""
            Me.txtAWOL.Visible = False

            Me.txtamin.Visible = True
            Me.txtamout.Visible = True
            Me.txtinpm.Visible = True
            Me.txtpmout.Visible = True
            Me.txtLate.Visible = True
            Me.txtUT.Visible = True
            txtFiller.Visible = True

            'If Me.txtinpm.Text.Length > 0 Then
            '    Dim amINStr() As String = Me.txtinpm.Text.Split(":")
            '    Dim str_tspan1 As Short = amINStr(0)
            '    Dim str_tspan2 As String = amINStr(1)

            '    If str_tspan1 > 12 Then
            '        str_tspan1 = str_tspan1 - 12
            '    End If
            '    Me.txtinpm.Text = str_tspan1 & ":" & str_tspan2
            'End If

            'If Me.txtpmout.Text.Length > 0 Then
            '    Dim amINStr() As String = Me.txtpmout.Text.Split(":")
            '    Dim str_tspan1 As Short = amINStr(0)
            '    Dim str_tspan2 As String = amINStr(1)

            '    If str_tspan1 > 12 Then
            '        str_tspan1 = str_tspan1 - 12
            '    End If
            '    Me.txtpmout.Text = str_tspan1 & ":" & str_tspan2
            'End If

        End If



        If Me.txtUT.Text = "0" Then
            Me.txtUT.Text = ""
        End If

        If Me.txtLate.Text = "0" Then
            Me.txtLate.Text = ""
        End If
    End Sub
End Class
