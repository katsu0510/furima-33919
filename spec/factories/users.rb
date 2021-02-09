FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'k00000'}
    password_confirmation {'k00000'}
    first_name            {'あ'}
    last_name             {'あ'}
    k_first_name          {'ア'}
    k_last_name           {'ア'}
    birth_day             {'2000-01-01'}

  end
end