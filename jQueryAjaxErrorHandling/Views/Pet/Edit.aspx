<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<jQueryAjax.Models.PetViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

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
                <%= Html.CheckBoxFor(model => model.Adopted)%>
                <%= Html.ValidationMessageFor(model => model.Adopted) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <script type="text/javascript">
        $(function () {

            $("input[type=submit]").click(function () {

                $.ajax({
                    type: "POST",
                    url: "/Pet/Edit",
                    data: $("form").serialize(),
                    dataType: "json",
                    beforeSend: function (xhr) {
                        $.blockUI();
                    },
                    dataFilter: function (data, type) {
                        return filteredMessages(data);
                    },
                    success: function (data, statusCode, xhr) {
                        var icon = data.Success ? 'ui-icon-info' : 'ui-icon-alert';
                        var type = data.Success ? 'notice' : 'error';
                        var length = data.Messages.length;
                        for (var i = 0; i < length; ++i) {
                            notify('System Notification', type, data.Messages[i].Message, icon);
                        }
                    },
                    error: function (xhr, errorType, exception) {
                        var errorMessage = exception ? exception : xhr.statusText;
                        notify('System Notification', 'error', 'There was an error creating your pet: ' + errorMessage, 'ui-icon-alert');
                    },
                    complete: function (xhr, statusCode) {
                        $.unblockUI();
                    }
                });

                return false;
            });

        });

        function filteredMessages(data) {
            data = JSON.parse(data);

            if (data && data.Messages) {
                for (var i = data.Messages.length - 1; i >= 0; --i) {
                    if (data.Messages[i].Code === "DEBUG") {
                        data.Messages.remove(i);
                    }
                }
            }

            return JSON.stringify(data);
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

        // Array Remove - By John Resig (MIT Licensed)
        Array.prototype.remove = function (from, to) {
            var rest = this.slice((to || from) + 1 || this.length);
            this.length = from < 0 ? this.length + from : from;
            return this.push.apply(this, rest);
        };
    </script>

</asp:Content>

