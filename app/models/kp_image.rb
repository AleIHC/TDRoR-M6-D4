class KpImage < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end
