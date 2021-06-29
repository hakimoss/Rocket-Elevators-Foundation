class Customer < ApplicationRecord
    belongs_to :company_headquarters_address, class_name: "Address", optional: true
    belongs_to :user, class_name: "User", optional: true
    has_many :buildings
    after_create :verify_email

    def verify_email
        Lead.all.each do |l|
            if l.email == email_of_the_company_contact
                client = DropboxApi::Client.new("EJXyhKB3asEAAAAAAAAAAdy_X_-LUdhwFJSvDr8WrI6abHz0MJTUv3-smE6IKiB2")
                #=> #<DropboxApi::Client ...>
                # file_content = IO.read("#{l.file.blob}")
                puts "-------------------"
                puts "This is the file #{l.file.blob.filename}"
                puts "-------------------"

                #file_content = IO.read "#{l.file.blob.filename}"
               # client.upload "/image.png", file_content
               client.upload("/#{l.file.blob.filename}", l.file)

                #client.upload "/image.png", l.file
                # client.upload "/image.png", file_content
                #=> #<DropboxApi::Metadata::File: @name="image.png" ...>
                
                l.file.destroy
            end
        end
    end
end
