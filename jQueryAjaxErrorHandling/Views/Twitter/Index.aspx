<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="input">
        <span>Enter Twitter Username</span>
        <input id="twitterUsername" type="text" />
        <button id="getTweets">Get Tweets</button>
    </div>
    <div id="output"></div>​

    <script type="text/javascript">
        $(function () {
            $( "#getTweets" ).bind( "click", function() {
                var twitterUsername = $( "#twitterUsername" ).val();
                var url = "http://twitter.com/status/user_timeline/" +
                    twitterUsername + 
                    ".json?count=5&callback=?";
                $.getJSON( url, function( data ) {
                    var twitterList = $( "<ul />" );
                    $.each( data, function( index, item ) {
                        $( "<li />", { "text" : item.text } )
                            .appendTo( twitterList );
                    });
                    $( "#output" ).fadeOut( "fast", function(){
                        $( this ).empty()
                            .append( twitterList )
                            .fadeIn( "slow" );            
                    });
                });
            });​
        });
    </script>
</asp:Content>
