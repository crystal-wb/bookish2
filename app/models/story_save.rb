class StorySave < ApplicationRecord
    has_many :integer_tokens
    has_many :boolean_tokens
end
