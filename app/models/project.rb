class Project < ApplicationRecord
  self.table_name = "project"

  # Method to check if project data contain the input keywords
  def search(keywords)

    # Create keywords pool
    @tmp = keywords.split(" ")

    # Check if data pool contain any key of keywords pool
    @tmp.each do |k|

      # Create data pool
      @tmp_data = "#{self.id} #{self.name} #{self.link} #{self.description}"

      # If contained then return true
      if(@tmp_data.include? k)
        return true
      end
    end

    # If not contained then return false
    return false
  end

end
