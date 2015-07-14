FactoryGirl.define do
  factory :installation do
    application 'Verboice'
  end

  factory :event do
    installation
    kind 'channels'
  end
end
