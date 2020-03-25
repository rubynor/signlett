module DocumentsHelper
  def document_status(status)
    status_array = ['Ikke Signert', 'Delvis signert', 'Signert']

    status_array[status]
  end

  def full_name(user)
    user.first_name.concat(" #{user.last_name}")
  end


end
