RSpec.describe "top-level describe block" do
  Scenario "step block (Scenario)" do
    Given "step (Given) - passing" do
      @value
    end

    When "step (When) - passing" do
      @value = "testing"
    end

    Then "step (Then) - passing" do
      expect(@value).to eq "testing"
    end

    expect {
      And "step (And) - failing" do
        expect(@value).to eq "qa"
      end
    }.to raise_error RSpec::Expectations::ExpectationNotMetError

    But "step (But) - passing" do
      expect(@value).to eq "testing"
    end
  end
end
