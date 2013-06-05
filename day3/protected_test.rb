class ProtectedTest
  def public_method
    puts "Jeder"
    private_method
  end

  protected
  def protected_method
    puts "Protected"
  end

  private
  def private_method
    puts "Private"
  end
end
