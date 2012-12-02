module DefinitionsHelper
  def nested_definitions(definitions)
  	definitions.map do |definition, sub_definitions|
      render(definition) + content_tag(:div, nested_definitions(sub_definitions), :class => "nested_definitions")
  	end.join.html_safe
  end
end