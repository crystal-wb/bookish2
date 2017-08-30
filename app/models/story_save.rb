class StorySave < ApplicationRecord
    has_many :integer_tokens, dependent: :destroy
    has_many :boolean_tokens, dependent: :destroy
end
