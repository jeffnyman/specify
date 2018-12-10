RSpec.describe "top-level describe block" do
  Scenario "step block (Scenario)" do
    Given "step (Given) - passing" do
      expect("testing").to eq "testing"
    end

    expect {
      Given "step (Given) - failing" do
        expect("testing").to eq "qa"
      end
    }.to raise_error RSpec::Expectations::ExpectationNotMetError
  end
end
