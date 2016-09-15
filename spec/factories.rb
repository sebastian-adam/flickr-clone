FactoryGirl.define do
  factory(:user) do
    user_name "bobthetomato"
    email('bob@tomato.com')
    password('1through9')
    factory(:admin) do
      admin true
    end
  end

  factory(:account) do
    first_name "Bob"
    last_name "Tomato"
    factory :accounts_with_posts do
      transient do
        posts_count 2
      end

      # after(:create) do |account, evaluator|
      #   create_list(:post, evaluator.posts_count, account: account)
      # end
    end
  end

  factory(:post) do
    caption("i follow you")
    location("A pond")
    factory :posts_with_accounts do
      transient do
        accounts_count 2
      end

      # after(:create) do |post, evaluator|
      #   create_list(:account, evaluator.accounts_count, user: user)
      # end
    end
  end
end
