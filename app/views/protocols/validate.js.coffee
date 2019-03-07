<% if @errors %>
# Display errors on fields
<% else %>
setActiveSubStep("<%= params[:href] %>")
<% end %>
