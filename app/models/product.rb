class Product < ActiveRecord::Base

  # attr_accessible  :name, :description, :fetures, :foto
  # belongs_to :gallery
  # mount_uploader :foto, FotoUploader

  mount_uploader :foto, FotoUploader

end
