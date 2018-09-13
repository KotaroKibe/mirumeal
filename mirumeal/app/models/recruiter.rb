class Recruiter < ActiveRecord::Base
    
    has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
    has_many :following_users, through: :following_relationships, source: :followed
    
    # ユーザーを承認する
    def follow(user)
     following_relationships.find_or_create_by(followed_id: other_user.id)
    end

    # 承認しているユーザーをアンフォローする
    def unfollow(user)
     following_relationship = following_relationships.find_by(followed_id: other_user.id)
     following_relationship.destroy if following_relationship
    end

    # あるユーザーを承認しているかどうか？
    def following?(user)
     following_users.include?(user)
    end

end
