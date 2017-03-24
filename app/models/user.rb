class User < ApplicationRecord
  belongs_to :group

  def image
    name + '.jpg'
  end
end
