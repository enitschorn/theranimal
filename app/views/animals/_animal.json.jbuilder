json.(animal, :name, :slug, :body, :created_at, :updated_at, :tag_list, :description)

json.favorited signed_in? ? current_user.favorited?(animal) : false
json.favorites_count animal.favorites_count || 0
