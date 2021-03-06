module SecuredRecordsHelper
  def owner_column(record)
    return '' unless record.owner
    content = record.owner.to_label
    content = "<span class='restricted'>#{content}</span>" unless current_login and record.owner == current_login
    content
  end
end