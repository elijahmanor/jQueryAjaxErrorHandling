<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<jQueryAjax.Models.PetViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <th>Name</th>
            <th>Color</th>
            <th>Age</th>
        </tr>

    <% foreach (var item in Model) { %>

        <tr>
            <td><%: item.Name %></td>
            <td><%: item.Color %></td>
            <td><%: item.Age %></td>
        </tr>

    <% } %>

    </table>            

</asp:Content>

