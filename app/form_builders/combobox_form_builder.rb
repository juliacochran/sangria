class ComboboxFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Context # for nested content_tag
  include ActionView::Helpers::FormTagHelper #for sanitize_to_id method access

  """Used for autofill for companies
  opts:
    default: if the box should start out with a value, e.g. someone already selected a company on an edit form
    list_id: id of the list of companies from which to autofill from
    form_class: the class of the form element the combobox is inside
    input_id: id of the input itself

  We use these options so that we don't autocomplete on the wrong form or input
  """
  def combobox_tag(name, options, opts= {})
     @template.content_tag(:input, :name => name, :id => sanitize_to_id(name), :type => "text", :value => (opts[:default] || ""), :list => opts[:list_id], :onkeyup => 'inputChanged("' + opts[:form_class] + '", "' + opts[:input_id] + '")') do
       content_tag(:datalist, :id => opts[:list_id]) {options}
     end
  end
end
