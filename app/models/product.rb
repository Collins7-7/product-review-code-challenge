class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(star_rating, comment, user)
        Review.create(star_rating: star_rating, comment: comment, user_id: user.id, product_id: self.id)
    end
end