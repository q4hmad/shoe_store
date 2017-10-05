class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  
  private
    def capitalize_name
     self.name=(name.titlecase)
    end
end
