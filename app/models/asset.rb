class Asset < ActiveRecord::Base
    belongs_to :room
    has_attached_file   :asset, :styles => { :medium => "300x300>", :small => "75x75>" },
                        :url => "/assets/rooms/:id/:style/:basename.:extension",
                        :path => ":rails_root/public/assets/rooms/:id/:style/:basename.:extension"
    validates_attachment_size :asset, :less_than => 2.megabytes
end
