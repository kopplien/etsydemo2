class Listing < ActiveRecord::Base

	if Rails.env.devlopment?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "missing.png"

		# relationship of listing and users db 
		belongs_to :user
	else

		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "missing.png",
		:storage => :dropbox,
    	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    	:path => ":style/:id_:filename"

    	# relationship of listing and users db 
		belongs_to :user
    end
    

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :name, :description, :price, presence: true
	# must be numeric and greater than 10  
	validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}

	# this is so images cannot be blank validates_attachment_presence :image


end
