<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<jQueryAjax.Models.PetViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Update
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Update</h2>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Color) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Color) %>
                <%= Html.ValidationMessageFor(model => model.Color) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Age) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Age) %>
                <%= Html.ValidationMessageFor(model => model.Age) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Adopted) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Adopted) %>
                <%= Html.ValidationMessageFor(model => model.Adopted) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div id="output"></div>

    <script type="text/javascript">

        $(document).ready(function () {
            var options = {
                target: '#output',
                //beforeSubmit: showRequest,
                //success: showResponse,
                //dataType: 'json',
                clearForm: true,
                //error: showError,
                //complete: unBlock
            };

            $('form').ajaxForm(options);
        });

        function showError(xhr, errorType, exception) {
            var errorMessage = exception ? exception : xhr.statusText;
            notify('System Notification', 'error', 'There was an error creating your pet: ' + errorMessage, 'ui-icon-alert');
        }


function x() { 
//Using $.get() Ajax Shorthand Method
$.ajax({
    url: url,
    dataType: 'json',
    data: data,
    success: callback
});
}


        function showRequest(formData, jqForm, options) {
            $.blockUI();

            var queryString = $.param(formData);

            alert('About to submit: \n\n' + queryString);

            return true;
        }

        function showResponse(data, statusText, xhr, form) {
            alert('status: ' + statusText + '\n\n' + 'data: ' + data);
            var icon = data.Success ? 'ui-icon-info' : 'ui-icon-alert';
            var type = data.Success ? 'notice' : 'error';
            var length = data.Messages.length;
            for (var i = 0; i < length; ++i) {
                notify('System Notification', type, data.Messages[i].Message, icon);
            }
        }

        function unBlock(xhr, textStatus) {
            $.unblockUI();
        }

        function notify(title, type, text, icon) {
            $.pnotify({
                pnotify_title: title,
                pnotify_type: type,
                pnotify_text: text,
                pnotify_notice_icon: 'ui-icon ' + icon,
                pnotify_history: false
            });
        }
    </script>

</asp:Content>

