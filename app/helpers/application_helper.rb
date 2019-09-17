module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}
  end

  def sort_image(column)
    if sort_direction == "asc" && column == sort_column
      " ▲"
    elsif sort_direction == "desc" && column == sort_column
      " ▼"
    end
  end

end
