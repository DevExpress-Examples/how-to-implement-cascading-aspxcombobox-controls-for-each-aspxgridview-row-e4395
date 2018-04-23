<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.1, Version=11.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function OnSelectedIndexChanged(s, e, visibleIndex) {
            var cmbChild = eval('cmbChild_' + visibleIndex);
            cmbChild.PerformCallback(s.GetValue());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
            KeyFieldName="EmployeeID">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                    <DataItemTemplate>
                        <dx:ASPxComboBox ID="cmbMaster" runat="server" DataSourceID="adsMaster"
                            ValueType="System.Int32" ValueField="CategoryID" TextField="CategoryName" OnInit="cmbMaster_Init">
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="adsMaster" runat="server" DataFile="~/App_Data/nwind.mdb"
                            SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:AccessDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                    <DataItemTemplate>
                        <dx:ASPxComboBox ID="cmbChild" runat="server" DataSourceID="asdChild"
                            ValueType="System.Int32" ValueField="ProductID" TextField="ProductName" OnInit="cmbChild_Init">
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="asdChild" runat="server" DataFile="~/App_Data/nwind.mdb"
                            SelectCommand="SELECT [ProductID], [ProductName] FROM [Products] WHERE ([CategoryID] = ?)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="-1" Name="CategoryID" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
