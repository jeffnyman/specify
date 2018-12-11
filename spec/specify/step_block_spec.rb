RSpec.describe "top-level describe block" do
  Scenario "step block (Scenario)" do
  end

  scenario "step block (scenario)" do
  end

  Condition "step block (Condition)" do
  end

  condition "step block (condition)" do
  end

  Behavior "step block (Behavior)" do
  end

  behavior "step block (behavior)" do
  end

  Steps "step block (Step)" do
  end

  steps "step block (Step)" do
  end

  Tests "step block (Test)" do
  end

  tests "test block (test)" do
  end

  Rules "step block (Rule)" do
  end

  rules "rule block (rule)" do
  end

  Facts "step block (Fact)" do
  end

  facts "step block (fact)" do
  end
end

Feature "feature" do
  Scenario "scenario" do
    expect {
      Condition "condition" do
      end
    }.to raise_error RSpec::Core::ExampleGroup::WrongScopeError
  end
end
