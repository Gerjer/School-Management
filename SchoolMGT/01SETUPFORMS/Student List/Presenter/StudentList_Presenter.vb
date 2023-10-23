Imports SchoolMGT
Imports DevExpress.XtraEditors.Repository
Imports DevExpress.XtraEditors
Imports DevExpress.XtraEditors.Controls
Imports DevExpress.Utils.Win
Imports DevExpress.XtraTreeList
Imports DevExpress.XtraTreeList.Nodes
Imports DevExpress.XtraGrid
Imports DevExpress.DataAccess
Imports DevComponents.AdvTree
Imports System.ComponentModel
Imports DevExpress.XtraGrid.Views.Grid
Imports System.Web.UI.Control
Imports DevExpress.Utils
Imports DevExpress.XtraReports.UI

Public Class StudentList_Presenter
    Private _view As frmStudentList
    Dim ListModel As New StudentList_Model
    Dim dt_Filter As New DataTable

    Public Sub New(view As frmStudentList)
        _view = view

        loadComboBox()
        loadHandler()

        '   _view.GridView1.AddNewRow()

        'dt_Filter.Columns.Add("Name")
        'dt_Filter.Columns.Add("ComboBox")


        AcademicYear.Clear()
        YearLevel.Clear()
        Semester.Clear()
        AddmStatus.Clear()
        ScholarShip.Clear()
        CourseGrade.Clear()

        _view.expReasonChange.Expanded = True

    End Sub

    Private addNewRow As InitNewRowEventHandler

    Private Sub loadHandler()

        AddHandler _view.cmbStudentCategory.SelectionChangeCommitted, AddressOf StudentCategory_SelectionChangeCommitted

        AddHandler _view.Panel7.Click, AddressOf Click_ComboBoxEdit

        AddHandler _view.btnSearch.Click, AddressOf Search_Student

        AddHandler _view.btnPrint.Click, AddressOf Print_Student

        AddHandler _view.CheckBox1.CheckedChanged, AddressOf CheckFilterOption
        AddHandler _view.CheckBox2.CheckedChanged, AddressOf CheckFilterOption
        AddHandler _view.CheckBox3.CheckedChanged, AddressOf CheckFilterOption
        AddHandler _view.CheckBox4.CheckedChanged, AddressOf CheckFilterOption
        AddHandler _view.CheckBox5.CheckedChanged, AddressOf CheckFilterOption
        AddHandler _view.CheckBox6.CheckedChanged, AddressOf CheckFilterOption

    End Sub

    Dim StudentList As New List(Of StudentProfileList)

    Private Sub Print_Student(sender As Object, e As EventArgs)

        Cursor.Current = Cursors.WaitCursor


        For i As Integer = 0 To _view.GridView1.DataRowCount - 1

            Dim obj As New StudentProfileList

            With obj
                .id = _view.GridView1.GetRowCellValue(i, "No.")
                .std_number = _view.GridView1.GetRowCellValue(i, "STUDENT NO")
                .last_name = _view.GridView1.GetRowCellValue(i, "LAST NAME")
                .first_name = _view.GridView1.GetRowCellValue(i, "FIRST NAME")
                .middle_name = If(IsDBNull(_view.GridView1.GetRowCellValue(i, "MIDDLE NAME")), "", _view.GridView1.GetRowCellValue(i, "MIDDLE NAME"))
                .gender = _view.GridView1.GetRowCellValue(i, "GENDER")
                .birth_date = _view.GridView1.GetRowCellValue(i, "BIRTH DATE")
                .address = If(IsDBNull(_view.GridView1.GetRowCellValue(i, "ADDRESS")), "", _view.GridView1.GetRowCellValue(i, "ADDRESS"))
            End With

            StudentList.Add(obj)

        Next


        LabeName_List = ListModel.LabelName_List

        Dim report As New xtrStudentListFilter With {.LabelName_List = LabeName_List}
        report.Report.DataSource = StudentList
        report.PrintingSystem.Document.AutoFitToPagesWidth = 1
        report.CreateDocument()
        report.ShowPreview


        StudentList.Clear()

        Cursor.Current = Cursors.Default
    End Sub

    Dim AcademicYear As New List(Of String)
    Dim JoinAcademicYear As String = ""
    Dim YearLevel As New List(Of String)
    Dim JoinYearLevel As String = ""
    Dim Semester As New List(Of String)
    Dim JoinSemester As String = ""
    Dim AddmStatus As New List(Of String)
    Dim JoinAddmStatus As String = ""
    Dim ScholarShip As New List(Of String)
    Dim JoinScholarShip As String = ""
    Dim CourseGrade As New List(Of String)
    Dim JoinCourseGrade As String = ""

    Dim LabeName_List As New List(Of Tuple(Of String, String))

    Private Sub Search_Student(sender As Object, e As EventArgs)

        ListModel.LabelName_List.Clear()
        LabeName_List.Clear()

        AcademicYear.Clear()
        JoinAcademicYear = ""
        YearLevel.Clear()
        JoinYearLevel = ""
        Semester.Clear()
        JoinSemester = ""
        AddmStatus.Clear()
        JoinAddmStatus = ""
        ScholarShip.Clear()
        JoinScholarShip = ""
        CourseGrade.Clear()
        JoinCourseGrade = ""

        For Each ctrl In _view.Panel7.Controls

            If (ctrl.GetType() Is GetType(CheckedComboBoxEdit)) And ctrl.Name.Contains("cmb") Then

                Dim Combo As CheckedComboBoxEdit = New CheckedComboBoxEdit()
                Combo = CType(ctrl, CheckedComboBoxEdit)

                For Each item As CheckedListBoxItem In Combo.Properties.GetItems()

                    If item.CheckState = CheckState.Checked And item.Description.ToString <> "(Select All)" Then

                        Select Case Combo.Tag
                            Case 1
                                AcademicYear.Add(item.Description.ToString)
                                AcademicYear = AcademicYear.Distinct.ToList()
                            Case 2
                                YearLevel.Add(item.Description.ToString)
                                YearLevel = YearLevel.Distinct.ToList()
                            Case 3
                                Semester.Add(item.Description.ToString)
                                Semester = Semester.Distinct.ToList()
                            Case 4
                                AddmStatus.Add(item.Description.ToString)
                                AddmStatus = AddmStatus.Distinct.ToList()
                            Case 5
                                ScholarShip.Add(item.Description.ToString)
                                ScholarShip = ScholarShip.Distinct.ToList()
                            Case 6
                                CourseGrade.Add(item.Description.ToString)
                                CourseGrade = CourseGrade.Distinct.ToList()
                            Case Else

                        End Select


                    End If

                Next



            End If

        Next

        Dim str As String = ""

        If AcademicYear.Count > 0 Then
            JoinAcademicYear = ListModel.getJoinString(AcademicYear, "ACADEMIC YEAR")
            str = " AND students.academice_year IN(" & JoinAcademicYear & ") "
        End If

        If YearLevel.Count > 0 Then
            JoinYearLevel = ListModel.getJoinString(YearLevel, "YEAR LEVEL")
            str += " AND students.year_level IN(" & JoinYearLevel & ") "
        End If

        If Semester.Count > 0 Then
            JoinSemester = ListModel.getJoinString(Semester, "SEMESTER")
            str += " AND students.semester IN(" & JoinSemester & ") "
        End If

        If AddmStatus.Count > 0 Then
            JoinAddmStatus = ListModel.getJoinString(AddmStatus, "ADMISSION STATUS")
            str += " AND students.enrollmentAS IN(" & JoinAddmStatus & ") "
        End If

        If ScholarShip.Count > 0 Then
            JoinScholarShip = ListModel.getJoinString(ScholarShip, "SCHOLARSHIP GRANT")
            str += " AND students.scholarshipgrant IN(" & JoinScholarShip & ") "
        End If

        If CourseGrade.Count > 0 Then
            JoinCourseGrade = ListModel.getJoinString(CourseGrade, "COURSE / GRADE")
            str += " AND courses.course_name IN(" & JoinCourseGrade & ") "
        End If


        Dim dt As New DataTable
        dt = ListModel.getStudentList(str)
        If dt.Rows.Count > 0 Then
            Dim cnt As Integer = 1
            For x As Integer = 0 To dt.Rows.Count - 1
                dt(x)("No.") = cnt
                cnt += 1
            Next


            _view.GridControl1.DataSource = dt
            DesignGridView(_view.GridView1)

        End If

    End Sub

    Private Sub DesignGridView(gridView1 As GridView)

        Dim view As GridView = DirectCast(gridView1, GridView)

        For i As Integer = 0 To view.Columns.Count - 1

            Select Case i
                Case 0
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = HorizontalAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                    view.Columns(i).Width = 100
                Case 1
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                    view.Columns(i).Width = 120

                Case 2, 3, 4
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                    view.Columns(i).Width = 200

                Case 5
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                    view.Columns(i).Width = 100
                Case 6
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Center
                    view.Columns(i).Width = 100
                Case 7
                    view.Columns(i).AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center
                    view.Columns(i).AppearanceCell.TextOptions.HAlignment = HorizontalAlignment.Left
                    view.Columns(i).BestFit()

                Case Else
                    view.Columns(i).Visible = False
            End Select


        Next

    End Sub


    Public Event DynamicPopup_Check(CheckedComboBoxEdit, EventArgs)

    Private Sub Click_ComboBoxEdit(sender As Object, e As EventArgs)



        Dim control As Panel = DirectCast(sender, Panel)

        For Each ctrl As Control In control.Controls
            If TypeOf ctrl Is CheckedComboBoxEdit Then
                AddHandler(DirectCast(ctrl, CheckedComboBoxEdit).Popup), AddressOf Popup

                'Dim CheckBox As CheckedComboBoxEdit = DirectCast(ctrl, CheckedComboBoxEdit)

                'AddHandler CheckBox.Popup, AddressOf DynamicPopup

                'RaiseEvent DynamicPopup_Check(CheckBox, e)

            End If

        Next

    End Sub


    Private Sub CheckFilterOption(sender As Object, e As EventArgs)

        Dim ItemBox As CheckBox = DirectCast(sender, CheckBox)

        addGridView(ItemBox.Text, ItemBox.Tag, ItemBox.CheckState)

    End Sub



    Dim yLOC_lbl As Double = 21
    Dim yLOC_cmb As Double = 21

    Private Sub addGridView(NodeName As String, NodeId As Integer, checkState As CheckState)

        If checkState = 1 Then

            Dim lblName As New System.Windows.Forms.Label

            lblName.AutoSize = True
            lblName.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
            lblName.Location = New System.Drawing.Point(17, yLOC_lbl)
            lblName.Name = "lbl" & NodeId
            lblName.Tag = NodeId
            lblName.Size = New System.Drawing.Size(118, 17)
            lblName.Text = NodeName

            _view.Panel7.Controls.Add(lblName)


            Dim CheckCombo As CheckedComboBoxEdit = New CheckedComboBoxEdit()
            CheckCombo.Name = "cmb" & NodeId
            CheckCombo.Tag = NodeId

            CheckCombo.Properties.Appearance.Font = New System.Drawing.Font("Tahoma", 10.0!)
            CheckCombo.Location = New System.Drawing.Point(224, yLOC_lbl)
            CheckCombo.Properties.Appearance.Options.UseFont = True
            CheckCombo.Properties.Items.AddRange(New DevExpress.XtraEditors.Controls.CheckedListBoxItem() {New DevExpress.XtraEditors.Controls.CheckedListBoxItem(False)})
            CheckCombo.Properties.TextEditStyle = DevExpress.XtraEditors.Controls.TextEditStyles.Standard
            CheckCombo.Size = New System.Drawing.Size(225, 22)

            CheckCombo.Properties.DataSource = ListModel.getDropDownList(_student_category_id, NodeId)
            CheckCombo.Properties.ValueMember = "id"
            CheckCombo.Properties.DisplayMember = "name"

            If NodeId = 5 Then
                CheckCombo.CheckAll()
            End If
            _view.Panel7.Controls.Add(CheckCombo)

            yLOC_lbl += 29


        Else

            Dim ctrl As Control
            For Each ctrl In _view.Panel7.Controls
                If (ctrl.GetType() Is GetType(Label)) And ctrl.Name.Contains("lbl") Then

                    Dim Mylbl As New System.Windows.Forms.Label
                    Mylbl = CType(ctrl, Label)

                    If Mylbl.Text = NodeName Then
                        _view.Panel7.Controls.Remove(Mylbl)
                    End If

                End If
            Next


            For Each ctrl In _view.Panel7.Controls

                If (ctrl.GetType() Is GetType(CheckedComboBoxEdit)) And ctrl.Name.Contains("cmb") Then

                    Dim Combo As CheckedComboBoxEdit = New CheckedComboBoxEdit()
                    Combo = CType(ctrl, CheckedComboBoxEdit)

                    If Combo.Name = "cmb" & NodeId Then
                        _view.Panel7.Controls.Remove(Combo)
                    End If

                End If

            Next

            Dim Panel As System.Windows.Forms.Panel = _view.Panel7

            ClearAllControls(Panel, NodeId, True)

        End If


    End Sub

    Private Sub ClearAllControls(ByRef container As Panel, Tag As Integer, Optional Recurse As Boolean = True)

        yLOC_lbl = 21
        yLOC_cmb = 21
        Dim ctrl As Control
        For Each ctrl In container.Controls
            If (ctrl.GetType() Is GetType(Label)) And ctrl.Name.Contains("lbl") Then

                Dim Mylbl As New System.Windows.Forms.Label
                Mylbl = CType(ctrl, Label)

                Mylbl.Location = New System.Drawing.Point(17, yLOC_lbl)

                yLOC_lbl += 29

            End If


        Next

        For Each ctrl In container.Controls

            If (ctrl.GetType() Is GetType(CheckedComboBoxEdit)) And ctrl.Name.Contains("cmb") Then

                Dim Combo As CheckedComboBoxEdit = New CheckedComboBoxEdit()
                Combo = CType(ctrl, CheckedComboBoxEdit)

                Combo.Location = New System.Drawing.Point(224, yLOC_cmb)

                yLOC_cmb += 29
            End If

        Next

    End Sub





    Private subscribe As Boolean = True
    Dim Tag As Integer = 0

    Private Sub Popup(sender As Object, e As EventArgs)

        Try
            Dim Combo As ComboBoxEdit = DirectCast(sender, ComboBoxEdit)

            Tag = Combo.Tag

            If subscribe Then ' 1st approach
                Dim list As CheckedListBoxControl = (TryCast(sender, IPopupControl)).PopupWindow.Controls.OfType(Of PopupContainerControl)().First().Controls.OfType(Of CheckedListBoxControl)().First()
                AddHandler list.ItemCheck, AddressOf list_ItemCheck
                subscribe = False
            End If

        Catch ex As Exception

        End Try


    End Sub



    Private Sub list_ItemCheck(sender As Object, e As ItemCheckEventArgs)

        'retrieve the embedded CheckedListBoxControl
        Dim list As CheckedListBoxControl = TryCast(sender, CheckedListBoxControl)

        If e.State = 1 Then

            For Each item As CheckedListBoxItem In list.Items

                If item.CheckState And list.SelectedItem.ToString <> "(Select All)" Then

                    Select Case Tag
                        Case 1
                            AcademicYear.Add(list.SelectedItem.ToString)
                            AcademicYear = AcademicYear.Distinct.ToList()
                        Case 2

                        Case Else

                    End Select


                End If

            Next item


        ElseIf e.State = 0 Then

            For Each item As CheckedListBoxItem In list.Items
                item.Enabled = True
            Next item

            Select Case Tag
                Case 1
                    AcademicYear.Remove(list.SelectedItem.ToString)
                    AcademicYear = AcademicYear.Distinct.ToList()
                Case 2

                Case Else

            End Select




        End If


    End Sub




    Private Sub StudentCategory_SelectionChangeCommitted(sender As Object, e As EventArgs)

        Try
            _student_category_id = _view.cmbStudentCategory.SelectedValue

        Catch ex As Exception

        End Try


    End Sub


    Dim dt As New DataTable
    Private Sub loadComboBox()

        dt = Nothing
        dt = ListModel.getCategory
        If dt.Rows.Count > 0 Then
            _view.cmbStudentCategory.DataSource = dt
            _view.cmbStudentCategory.ValueMember = "id"
            _view.cmbStudentCategory.DisplayMember = "name"
            _view.cmbStudentCategory.SelectedIndex = -1
        End If


    End Sub
End Class
