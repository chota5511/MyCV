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
end
