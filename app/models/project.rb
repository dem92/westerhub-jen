class Project < ApplicationRecord
  mount_uploader :cover, CoverUploader
end
