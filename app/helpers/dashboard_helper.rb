module DashboardHelper
  def material_icon(name)
    content_tag( :i, name, class: 'material-icons')
  end
end
