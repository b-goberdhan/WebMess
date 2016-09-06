class Resource < ActiveRecord::Base

	#scope :status, -> (status) { where status: status }
	mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
 	validates :name, presence: true # Make sure the owner's name is present.
 	validates :attachment, presence: true
 	belongs_to :course
 	scope :course_id, -> (course_id) {where course_id: course_id}
 	
end