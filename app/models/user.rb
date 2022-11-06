class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
       @highest_rated = self.reviews.map do |rev|
        rev.star_rating
    end.sort.last

    # @prorev = self.products.map do |pro|
    #     pro.reviews
    # end
    # @rev_flat = @prorev.flatten

    # @rev_flat.map do |rev|
    #     rev.star_rating
    # end.sort.last

    # self.products.filter do |pro|
    #     pro
    # end

    self.products.filter do |pro|
        pro.highest_rating == @highest_rated
    end
    end
end
