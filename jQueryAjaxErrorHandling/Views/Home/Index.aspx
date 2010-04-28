<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
        To learn more about ASP.NET MVC visit <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
    </p>

    <button id="getPet">Get Pet</button>
    <div id="pet"></div>

    <button id="getPets">Get Pets</button>
    <div id="pets"></div>

    <button id="paramTest">Param Test</button>
    <div id="param"></div>

    <script type="text/javascript">
        $(function () {
            $("#getPet").click(function () {
                $.get("/Pet/Details/3", function (data, textStatus, xhr) {
                    $("#pet").html(data);
                });
            });

            $("#getPets").click(function () {
                //Pet/Index has a header & footer, but we are only selecting the table
                $("#pets").load("/Pet/Index table");
            });

            jQuery.ajaxSettings.traditional = true;
            $("#paramTest").click(function () { 
                // This request hits this URL: test.php?a[]=1&a[]=2&a[]=3 which means
                // your PHP or Rails app will see `a` set to ["1","2","3"], without
                // adding any extra [] anywhere.
                $('#param').load('/Pet/Param', {
                    a: [1, 2, 3]
                });

                // This request hits this URL: test.php?a[]=1&a[]=2&a[]=3&b[c]=4&b[d]=5
                // which means your PHP or Rails app not only sees `a` set to
                // ["1","2","3"], but also sees `b` set to `{ c: "4", d: "5" }`,
                $('#param').load('/Pet/Param', {
                    a: [1, 2, 3],
                    b: { c: 4, d: 5 }
                });
            });
        });
    </script>

</asp:Content>

