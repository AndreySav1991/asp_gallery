<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<gallery.Models.picture>" %>

 
 
            <div class="editor-label">
                Назва
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.nazva) %>
                <%: Html.ValidationMessageFor(model => model.nazva) %>
            </div>
            
            <div class="editor-label">
                Автор
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.avtor) %>
                <%: Html.ValidationMessageFor(model => model.avtor) %>
            </div>
            
            <div class="editor-label">
                Адреса зображення
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.img) %>
                <%: Html.ValidationMessageFor(model => model.img) %>
            </div>
            
            <div class="editor-label">
               Ціна
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.price) %>
                <%: Html.ValidationMessageFor(model => model.price) %>
            </div>
            
            <p>
                <input type="submit" value="Зберегти" />
            </p>

