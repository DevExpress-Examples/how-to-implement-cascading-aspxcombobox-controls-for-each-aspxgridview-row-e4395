<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# How to implement cascading ASPxComboBox controls for each ASPxGridView row


<p>1) Use the technique described in the <a href="https://www.devexpress.com/Support/Center/p/K18282">K18282: The general technique of using the Init/Load event handler</a> KB Article to specify the ClientInstanceName property based on the related row's VisibleIndex;<br />2) Use the technique described in the <a href="https://www.devexpress.com/Support/Center/p/E2355">A general technique of using cascading ASPxComboBoxes</a> example to implement the "cascading" behavior between a pair of ASPxComboBox controls defined within the same row.</p>

<br/>


