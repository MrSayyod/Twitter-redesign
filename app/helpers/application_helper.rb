module ApplicationHelper
  # def uniqued_list
  #   if @uniq_list.include?(current_user)
  #     @uniq_list.delete(current_user)
  #   end
  #   @uniq_list
  # end

  # <% current_user.following.each do |person| %>
  #   <% person.following.each do |ffuser| %>
  #   <% @following_list.push(ffuser) %>
  #   <% @following_list.uniq! %>
  #   <% if @following_list.include?(current_user) %>
  #     <% @following_list.delete(current_user) %>
  #   <% end %>
  #   <% @following_list.each do |x|%>
  #     <ul>
  #       <%= avatar_for(x) %>
  #       <li><%= link_to x.username, x %> followed by <%= person.username %> </li>
  #     </ul>
  #     <% end %>
  #     <% end %>
  #   <% end %>
end
