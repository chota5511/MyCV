class Specialized < ApplicationRecord
  self.table_name = "specialized"

  # Method to check if specialized data contain the input keywords
  def Search(keywords)

    # Create key pool
    @tmp = keywords.split(" ")

    # Check if data pool contain any key of key pool
    @tmp.each do |k|

      # Create data pool
      @tmp_data = "#{self.id} #{self.name} #{self.description}"

      # If contained then return true
      if(@tmp_data.include? k)
        return true
      end
    end

    # If not contained then return false
    return false
  end

end
