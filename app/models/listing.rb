class Listing < ActiveRecord::Base

	if Rails.env.devlopment?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "missing.png"
	else

	has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "missing.png",
			:storage => :dropbox,
    		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    		:path => ":stle/:id_:filename"
    end
    		
	# validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	#  Paperclip.option[:content_type_mappings] = { :png => "image"}
	
end
