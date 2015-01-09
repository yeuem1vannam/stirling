<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
  <% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ',  polymorphic: true' if attribute.polymorphic? %>
  <% end -%>
  <% if attributes.any?(&:password_digest?) -%>
  has_secure_password
  <% end -%>
  <% if Rails.version >= "4.0.0" -%>

  class << self
    def acceptable_attributes
      # Return attributes of array for strong parameter
      # e.g. [:name, :email]
    end
  end
  <% end -%>
end
<% end -%>
