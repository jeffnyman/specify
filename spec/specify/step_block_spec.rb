RSpec.describe "top-level describe block" do
  Scenario "step block (Scenario)" do
  end

  Condition "step block (Condition)" do
  end

  Behavior "step block (Behavior)" do
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
