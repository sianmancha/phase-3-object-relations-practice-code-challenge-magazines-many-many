class Subscription < ActiveRecord::Base
    belongs_to :magazine
    belongs_to :reader

    def print_details
        reader = self.reader.name
        title = self.magazine.title
        price = self.price

        puts "#{reader} subscribed to #{title} for $#{price}"
    end
end