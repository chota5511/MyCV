class Admins < ApplicationRecord
  self.table_name = "admins"

  def verify
    if self.id != nil && self.password != nil then
      # Get Admin user's info from database
      @tmp = Admins.find_by_id(self.id)
      # Check if Admin user ID is available
      if @tmp != nil then
        # Check if User's password on database is match with typed password
        if @tmp.password == self.password
          # Return true if match
          return true
        end
      end
    end
    return false
  end

  # Method to check if admin data contain the input keywords
  def search(keywords)

    # Create keywords pool
    @tmp = keywords.split(" ")

    # Check if data pool contain any keyword of keywords pool
    @tmp.each do |k|

      # Create data pool
      @tmp_data = "#{self.id} #{self.name} #{self.email}"

      # If contained then return true
      if(@tmp_data.include? k)
        return true
      end
    end

    # If not contained then return false
    return false
  end

end
