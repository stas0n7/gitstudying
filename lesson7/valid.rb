module Valid
  def valid?
    validate!
  rescue ArgumentError
    false
  end
end
