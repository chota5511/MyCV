class Contact < ApplicationRecord
  self.table_name = "contact"

  # Method to check if contact data contain the input keywords
  def Search(keywords)

    # Create keywords pool
    @tmp = keywords.split(" ")

    # Check if data pool contain any keyword of keywords pool
    @tmp.each do |k|

      # Create data pool
      @tmp_data = "#{self.id} #{self.name} #{self.email} #{subject}"

      # If contained then return true
      if(@tmp_data.include? k)
        return true
      end
      return false
    end

    # If not contained then return false
    return false
  end

end
