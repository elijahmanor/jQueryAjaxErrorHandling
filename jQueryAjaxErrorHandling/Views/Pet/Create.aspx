<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<jQueryAjax.Models.PetViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>

        <fieldset style="width: 375px; float: left;">
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.PetType) %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownListFor(model => model.PetType.Id, new SelectList(Model.PetTypes, "Id", "Name", Model.PetType), "-- Select Type --") %>
                <%= Html.ValidationMessageFor(model => model.PetType) %>
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
                <%= Html.CheckBoxFor(model => model.Adopted) %>
                <%= Html.ValidationMessageFor(model => model.Adopted) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

        <fieldset style="width: 375px; float: right;">
            <legend>Output</legend>
            <div id="output" style="word-wrap: break-word"></div>
        </fieldset>

        <div style="clear: both;"></div>

    <% } %>

    <script type="text/javascript">
        $(function () {
            var output = $("#output");
            $("input[type=submit]").click(function () {
                var formData = $("form").serialize();
                output.append($("<p />", { "text": "About to post... " + formData }));
                $.post("/Pet/Create", formData, function (data, textStatus, xhr) {
                    output.append($("<p />", { "text": "Posted! " + textStatus }));
                    $.pnotify({
                        pnotify_title: 'System Notification',
                        pnotify_text: 'Your pet has been created!',
                        pnotify_notice_icon: 'ui-icon ui-icon-info',
                        pnotify_history: false
                    });
                });

                return false;
            });

            $("#output").ajaxStart(function () {
                $.blockUI();
            });

            $("#output").ajaxSend(function (event, xhr, ajaxOptions) {
                $(this).append($("<p />", { "text": "ajaxSend: " + ajaxOptions.url }));
            });

            $("#output").ajaxComplete(function (event, xhr, ajaxOptions) {
                $(this).append($("<p />", { "text": "ajaxComplete: " + ajaxOptions.url }));
            });

            $("#output").ajaxError(function (event, xhr, ajaxOptions, thrownError) {
                $(this).append($("<p />", { "text": "ajaxError: " + xhr.status + "; responseText: " + xhr.responseText }));
                $.pnotify({
                    pnotify_title: 'System Notification',
                    pnotify_text: 'There was an error creating your pet!',
                    pnotify_notice_icon: 'ui-icon ui-icon-alert',
                    pnotify_history: false
                });
            });

            $("#output").ajaxStop(function () {
                $.unblockUI();
            });

        });
    </script>

</asp:Content>

