class NullUser
  attr_reader :id

  def nil?
    true
  end

  def blank?
    true
  end

  def owns?(_)
    false
  end
end
