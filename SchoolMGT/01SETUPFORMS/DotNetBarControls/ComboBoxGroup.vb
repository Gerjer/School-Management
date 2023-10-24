Public Class ComboBoxGroup
    Private Sub ComboBoxGroup_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim dt As DataTable = DataSource(String.Format("SELECT
	                                0_chart_master.account_code'id',
	                                0_chart_types.`name`'grpname',
	                                CONCAT(0_chart_master.account_code,' - ',0_chart_master.account_name ) 'name'
	
                                FROM
	                                djemfcst_acctng2022.0_chart_types
	                                INNER JOIN djemfcst_acctng2022.0_chart_master ON 0_chart_types.id = 0_chart_master.account_type"))

        grpcmbAccountCode.DataSource = dt
        grpcmbAccountCode.ValueMember = "id"
        grpcmbAccountCode.DisplayMember = "name"
        grpcmbAccountCode.GroupMember = "grpname"


    End Sub

    Private Sub GroupedComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grpcmbAccountCode.SelectedIndexChanged

        If grpcmbAccountCode.Focused = True Then
            Try
                Dim drv As DataRowView = DirectCast(grpcmbAccountCode.SelectedItem, DataRowView)
                Dim id = drv.Item("id").ToString
                Dim name As String = drv.Item("name").ToString
            Catch ex As Exception

            End Try
        End If

    End Sub
End Class