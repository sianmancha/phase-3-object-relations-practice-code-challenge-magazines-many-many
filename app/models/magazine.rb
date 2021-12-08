class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def self.most_popular
        # self.all.sort_by {|magazine| magazine.subscriptions.length}.last
        Magazine.all.sort_by do |magazine| 
            magazine.subscriptions.length
        end.last
    end

    def email_list
		email_array = self.readers.map {|reader| reader.email}
		email_array.join(";")
	end
end