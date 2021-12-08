class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

    # how to run in rake console: Reader.first.subscribe(Magazine.first, 80)
  def subscribe(magazine_instance, price_argument)
    Subscription.create(price: price_argument, magazine_id: magazine_instance.id, reader_id: self.id)
  end

  def cancel_subscription(magazine_instance)
    to_cancel = self.subscriptions.find_by(magazine_id:magazine_instance.id)
    Subscription.destroy(to_cancel.id)
  end

  def total_subscription_price
    price_array = self.subscriptions.map {|subscription| subscription.price }
    price_array.sum
  end
end