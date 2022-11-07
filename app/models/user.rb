class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
       @highest_rated = self.reviews.map do |rev|
        rev.star_rating
    end.sort.last

    self.products.filter do |pro|
        pro.highest_rating == @highest_rated
    end
    end

    def instance_review
        self.reviews.map do |rev|

        end
    end 

    def remove_reviews(product)
       self.reviews.where(product: product).destroy_all
    end
end
