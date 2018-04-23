using System;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void cmbMaster_Init(object sender, EventArgs e) {
        ASPxComboBox cmbParent = (ASPxComboBox)sender;
        GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)cmbParent.NamingContainer;
        cmbParent.ClientSideEvents.SelectedIndexChanged = string.Format("function(s, e) {{ OnSelectedIndexChanged(s, e, {0}); }}", templateContainer.VisibleIndex);
    }
    protected void cmbChild_Init(object sender, EventArgs e) {
        ASPxComboBox cmbChild = (ASPxComboBox)sender;
        GridViewDataItemTemplateContainer templateContainer = (GridViewDataItemTemplateContainer)cmbChild.NamingContainer;
        cmbChild.ClientInstanceName = string.Format("cmbChild_{0}", templateContainer.VisibleIndex);
        cmbChild.Callback += new DevExpress.Web.ASPxClasses.CallbackEventHandlerBase(cmbChild_Callback);
    }

    void cmbChild_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
        ASPxComboBox cmbChild = (ASPxComboBox)sender;
        AccessDataSource cmbChildAccessDataSource = (AccessDataSource)cmbChild.NamingContainer.FindControl("asdChild");
        cmbChildAccessDataSource.SelectParameters[0].DefaultValue = e.Parameter;
        cmbChild.DataBindItems();
    }
}
