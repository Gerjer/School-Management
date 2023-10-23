Imports DevExpress.XtraGrid.Views.Grid
Imports SchoolMGT
Imports System.Resources

Public Class SignatoryPresenter
    Private _view As frmSignatorySetup
    Dim ListModel As New SignatoryModel
    Dim FormName As String = ""
    Dim FormID As String = ""
    Dim Designation As String = ""
    Dim DesigID As String = ""
    Dim PersonName As String = ""
    Dim PersonID As String = ""
    Dim RowIndex As Integer
    Dim id As Integer
    Dim str As String = ""
    Dim OPERATION As String = ""

    Public Sub New(view As frmSignatorySetup)
        _view = view

        loadList()
        LoadCombobox()
        loadHandler()


    End Sub


    Private Sub loadHandler()

        AddHandler _view.cmbFormName.SelectedIndexChanged, AddressOf cmbFormName_SelectedIndexChanged
        AddHandler _view.cmbFormName.TextChanged, AddressOf cmbFormName_TextChanged
        AddHandler _view.cmbDesignation.SelectedIndexChanged, AddressOf cmbDesignation_SelectedIndexChanged
        AddHandler _view.cmbDesignation.TextChanged, AddressOf cmbDesignation_TextChanged
        AddHandler _view.cmbPerson.SelectedIndexChanged, AddressOf cmbPerson_SelectedIndexChanged
        AddHandler _view.cmbPerson.TextChanged, AddressOf cmbPerson_TextChanged

        AddHandler _view.GridView1.RowCellClick, AddressOf GridView1_RowCellClick
        AddHandler _view.btnSave.Click, AddressOf btnSave_Click
        AddHandler _view.btnClear.Click, AddressOf btnClear_Click
        AddHandler _view.btnDelete.Click, AddressOf btnDelete_Click

        AddHandler _view.btnFormAdd.Click, AddressOf btnFormAdd_Click
        AddHandler _view.btnDesigAdd.Click, AddressOf btnDesigAdd_Click
        AddHandler _view.btnPersonAdd.Click, AddressOf btnPersonAdd_Click

        '   AddHandler _view.btnFormEdit.Click, AddressOf btnFormDelete_Click
        AddHandler _view.btnDesigEdit.Click, AddressOf btnDesigRemove_Click
        AddHandler _view.btnPersonEdit.Click, AddressOf btnPersonRemove_Click


    End Sub

    Private Sub btnPersonRemove_Click(sender As Object, e As EventArgs)
        str = ""
        If PersonID <> "" Then
            str = PersonName
            If OPERATION = "EDIT" Then
                ListModel.UpdatePerson(PersonID, PersonName, OPERATION)
                MsgBox("Signatory Name has been Updated...!!!", MessageBoxIcon.Information)
            Else
                If MessageBox.Show("Are you sure you want to REMOVE this record?", "Please verify....", MessageBoxButtons.YesNo,
   MessageBoxIcon.Information) = DialogResult.Yes Then
                    ListModel.UpdatePerson(PersonID, Designation, OPERATION)
                    MsgBox("Signatory Name has been Removed...!!!", MessageBoxIcon.Information)
                End If
            End If
            DisplayPerson()
            _view.cmbPerson.Text = str
        Else
            MsgBox("No Item Selected...!!!!", MessageBoxIcon.Warning)
        End If

    End Sub

    Private Sub btnDesigRemove_Click(sender As Object, e As EventArgs)
        str = ""
        If DesigID <> "" Then
            str = Designation
            If OPERATION = "EDIT" Then
                ListModel.UpdatePosition(DesigID, Designation, OPERATION)
                MsgBox("Signatory Position has been Updated...!!!", MessageBoxIcon.Information)
            Else
                If MessageBox.Show("Are you sure you want to REMOVE this record?", "Please verify....", MessageBoxButtons.YesNo,
   MessageBoxIcon.Information) = DialogResult.Yes Then
                    ListModel.UpdatePosition(DesigID, Designation, OPERATION)
                    MsgBox("Signatory Position has been Removed...!!!", MessageBoxIcon.Information)
                End If
            End If

            DisplayDesignation()
            _view.cmbDesignation.Text = str
        Else
            MsgBox("No Item Selected...!!!!", MessageBoxIcon.Warning)
        End If

    End Sub

    Private Sub btnFormDelete_Click(sender As Object, e As EventArgs)

        If FormID > 0 Then
            ListModel.RemoveFormName(FormID)
        End If

    End Sub

    Private Sub btnPersonAdd_Click(sender As Object, e As EventArgs)
        str = ""
        If _view.cmbPerson.SelectedIndex = -1 Then
            str = PersonName
            ListModel.AddPersonName(PersonName)
            MessageBox.Show("Signatory Name has been Added", "Successfully!")

            DisplayPerson()
            _view.cmbPerson.Text = str
        End If
    End Sub

    Private Sub cmbPerson_TextChanged(sender As Object, e As EventArgs)
        PersonName = _view.cmbPerson.Text
        If _view.cmbPerson.Text.Length = 0 Then
            _view.btnPersonEdit.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.cancel_32x321
            OPERATION = "DELETE"
        Else
            _view.btnPersonEdit.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.edit_32x32
            OPERATION = "EDIT"
        End If
    End Sub

    Private Sub btnDesigAdd_Click(sender As Object, e As EventArgs)

        str = ""
        If _view.cmbDesignation.SelectedIndex = -1 Then
            str = Designation
            ListModel.AddDesignationName(Designation)
            MessageBox.Show("Signatory Position has been Added", "Successfully!")

            DisplayDesignation()
            _view.cmbFormName.Text = str
        End If


    End Sub

    Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmSignatorySetup))
    Private Sub cmbDesignation_TextChanged(sender As Object, e As EventArgs)
        Designation = _view.cmbDesignation.Text
        If _view.cmbDesignation.Text.Length = 0 Then
            _view.btnDesigEdit.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.cancel_32x321
            OPERATION = "DELETE"
        Else
            _view.btnDesigEdit.ImageOptions.Image = Global.SchoolMGT.My.Resources.Resources.edit_32x32
            OPERATION = "EDIT"
        End If
    End Sub

    Private Sub cmbFormName_TextChanged(sender As Object, e As EventArgs)
        FormName = _view.cmbFormName.Text
    End Sub

    Private Sub btnFormAdd_Click(sender As Object, e As EventArgs)

        str = ""
        If _view.cmbFormName.SelectedIndex = -1 Then
            str = FormName.ToUpper
            ListModel.AddFormName(FormName.ToUpper)
            MessageBox.Show("Form Name has been Added", "Successfully!")

            DisplayFormName()
            _view.cmbFormName.Text = str
        End If

    End Sub

    Private Sub btnDelete_Click(sender As Object, e As EventArgs)

        If id > 0 Then
            If MessageBox.Show("Are you sure you want to DELETE this record?", "Please verify....", MessageBoxButtons.YesNo,
   MessageBoxIcon.Information) = DialogResult.Yes Then

                ListModel.DeleteRecord(id)

                MessageBox.Show("The record is deleted....", "Successfully !")

                _view.cmbFormName.SelectedIndex = -1
                _view.cmbDesignation.SelectedIndex = -1
                _view.cmbPerson.SelectedIndex = -1

                loadList()

                _view.GridView1.FindFilterText = FormName
                _view.btnDelete.Enabled = False

            End If

        End If

    End Sub

    Private Sub btnClear_Click(sender As Object, e As EventArgs)

        id = 0

        _view.btnSave.Text = "SAVE"
        _view.btnDelete.Enabled = False

        _view.cmbFormName.SelectedIndex = -1
        _view.cmbDesignation.SelectedIndex = -1
        _view.cmbPerson.SelectedIndex = -1

        loadList()

        _view.GridView1.FindFilterText = Nothing

    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs)

        str = ""
        Try
            str = PersonName
            If _view.btnSave.Text = "SAVE" Then

                ListModel.InsertSignatory(PersonID, FormID, DesigID)

                MessageBox.Show("Record Save...", "Successfully!")

                _view.btnSave.Text = "SAVE"
            Else

                ListModel.UpdateSignatory(PersonID, FormID, DesigID, id)

                MessageBox.Show("Record Updated...", "Successfully!")

                _view.btnSave.Text = "SAVE"
            End If

            _view.cmbFormName.SelectedIndex = -1
            _view.cmbDesignation.SelectedIndex = -1
            _view.cmbPerson.SelectedIndex = -1

            loadList()

            _view.GridView1.FindFilterText = str

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Private Sub GridView1_RowCellClick(sender As Object, e As RowCellClickEventArgs)

        Dim view As GridView = DirectCast(sender, GridView)

        If view.RowCount > 0 Then
            RowIndex = view.FocusedRowHandle

            id = view.GetFocusedRowCellDisplayText("id").ToString
            FormID = view.GetFocusedRowCellDisplayText("formID").ToString
            DesigID = view.GetFocusedRowCellDisplayText("positionID").ToString
            PersonID = view.GetFocusedRowCellDisplayText("personID").ToString
            FormName = view.GetGroupRowValue(RowIndex)

            Designation = view.GetFocusedRowCellDisplayText("designation").ToString
            PersonName = view.GetFocusedRowCellDisplayText("name").ToString

            _view.cmbFormName.SelectedValue = FormID
            _view.cmbDesignation.Text = Designation
            _view.cmbPerson.Text = PersonName

            _view.btnSave.Text = "EDIT"
            _view.btnDelete.Enabled = True
        End If

    End Sub

    Private Sub cmbPerson_SelectedIndexChanged(sender As Object, e As EventArgs)
        If _view.cmbPerson.Focused Then

            Try
                Dim drv As DataRowView = DirectCast(_view.cmbPerson.SelectedItem, DataRowView)
                PersonID = drv.Item("id").ToString
                PersonName = drv.Item("name").ToString

            Catch ex As Exception
                _view.cmbPerson.Text = ""
            End Try

        End If
    End Sub

    Private Sub cmbDesignation_SelectedIndexChanged(sender As Object, e As EventArgs)
        If _view.cmbDesignation.Focused Then

            Try
                Dim drv As DataRowView = DirectCast(_view.cmbDesignation.SelectedItem, DataRowView)
                DesigID = drv.Item("id").ToString
                Designation = drv.Item("name").ToString

            Catch ex As Exception
                _view.cmbDesignation.Text = ""
            End Try

        End If
    End Sub

    Private Sub cmbFormName_SelectedIndexChanged(sender As Object, e As EventArgs)

        If _view.cmbFormName.Focused Then

            Try
                Dim drv As DataRowView = DirectCast(_view.cmbFormName.SelectedItem, DataRowView)
                FormID = drv.Item("id").ToString
                FormName = drv.Item("name").ToString

            Catch ex As Exception
                _view.cmbFormName.Text = ""
            End Try

        End If

    End Sub

    Private Sub LoadCombobox()

        DisplayFormName()

        DisplayDesignation()

        DisplayPerson()


    End Sub

    Private Sub DisplayPerson()
        _view.cmbPerson.DataSource = Nothing
        Dim dt As New DataTable
        dt = ListModel.LoadComboPerson()
        _view.cmbPerson.DataSource = dt
        _view.cmbPerson.ValueMember = "id"
        _view.cmbPerson.DisplayMember = "name"
        _view.cmbPerson.SelectedIndex = -1

    End Sub

    Private Sub DisplayDesignation()

        _view.cmbDesignation.DataSource = Nothing
        Dim dt As New DataTable
        dt = ListModel.LoadComboDesignation()
        _view.cmbDesignation.DataSource = dt
        _view.cmbDesignation.ValueMember = "id"
        _view.cmbDesignation.DisplayMember = "name"
        _view.cmbDesignation.SelectedIndex = -1

    End Sub

    Private Sub DisplayFormName()

        _view.cmbFormName.DataSource = ListModel.LoadComboFormName()
        _view.cmbFormName.ValueMember = "id"
        _view.cmbFormName.DisplayMember = "name"
        _view.cmbFormName.SelectedIndex = -1

    End Sub

    Private Sub loadList()

        _view.GridControl1.DataSource = ListModel.LoadList

    End Sub
End Class
