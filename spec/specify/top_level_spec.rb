Feature "top-level block (Feature)" do
end

Story "top-level block (Story)" do
end

Story "top-level story" do
  Ability "ability level" do
    Service "service level" do
    end

    Component "component level" do
      Workflow "workflow level" do
      end
    end

    Component "component level" do
      Workflow "workflow level" do
      end
    end
  end
end

Feature "top levels" do
  Scenario "nesting causes errors" do
    expect {
      Feature "feature" do
        Story "story" do
        end
      end
    }.to raise_error RSpec::Core::ExampleGroup::WrongScopeError
  end

  Scenario "non top-levels cannot be at the top level" do
    expect {
      Ability "top-level block (Ability)" do
      end
    }.to raise_error RSpec::Core::ExampleGroup::WrongScopeError
  end
end
