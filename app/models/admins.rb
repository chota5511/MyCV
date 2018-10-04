class Admins < ApplicationRecord
  self.table_name = "admins"

  def Verify
    @tmp = Admins.find_by_id(self.id)
    if @tmp != nil then
      if @tmp.password == self.password
        return true
      end
    end
    return false
  end

  # Method to check if admin data contain the input keywords
  def Search(keywords)

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
