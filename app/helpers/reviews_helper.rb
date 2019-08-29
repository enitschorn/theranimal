module ReviewsHelper
  def rating_display(animal)
    display = ""
    animal.average_rating.times do
      display += '<i class="fas fa-star"></i>'
    end
    (5 - animal.average_rating).times do
      display += '<i class="far fa-star"></i>'
    end
    display.html_safe
  end
end
