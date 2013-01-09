module ApplicationHelper
  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end

  def key_to_bs(key)
    case key.to_s
      when "alert" then
        return "alert"
      when "error" then
        return "error"
      when "notice" then
        return "success"
    end
  end
end
