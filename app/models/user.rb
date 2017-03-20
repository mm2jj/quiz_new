class User < ApplicationRecord

  def image
    name + '.jpg'
  end
end
