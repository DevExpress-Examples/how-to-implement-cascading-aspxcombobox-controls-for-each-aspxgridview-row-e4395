Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub cmbMaster_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim cmbParent As ASPxComboBox = CType(sender, ASPxComboBox)
		Dim templateContainer As GridViewDataItemTemplateContainer = CType(cmbParent.NamingContainer, GridViewDataItemTemplateContainer)
		cmbParent.ClientSideEvents.SelectedIndexChanged = String.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex)
	End Sub
	Protected Sub cmbChild_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim cmbChild As ASPxComboBox = CType(sender, ASPxComboBox)
		Dim templateContainer As GridViewDataItemTemplateContainer = CType(cmbChild.NamingContainer, GridViewDataItemTemplateContainer)
		cmbChild.ClientInstanceName = String.Format("cmbChild_{0}", templateContainer.VisibleIndex)
		AddHandler cmbChild.Callback, AddressOf cmbChild_Callback
	End Sub

	Private Sub cmbChild_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
		Dim cmbChild As ASPxComboBox = CType(sender, ASPxComboBox)
		Dim cmbChildAccessDataSource As AccessDataSource = CType(cmbChild.NamingContainer.FindControl("asdChild"), AccessDataSource)
		cmbChildAccessDataSource.SelectParameters(0).DefaultValue = e.Parameter
		cmbChild.DataBindItems()
	End Sub
End Class
