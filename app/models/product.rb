class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(star_rating:, comment:, user:)
        Review.create(star_rating: star_rating, comment: comment, user_id: user.id, product_id: self.id)
    end

    def print_all_reviews
        self.reviews.map do |review|
            "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
        end
    end

    def average_rating
        self.reviews.average(:star_rating).to_f
    end

    def highest_rating
        self.reviews.map do |rev|
            rev.star_rating
        end.sort.last
    end

    def product_user_reviews
        self.users.map do |user|
            user.reviews 
        end.flatten 
    end
end
