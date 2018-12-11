Feature "feature" do
  Background "establish testing" do
    @value = "testing"
  end

  Background "establish basic math" do
    @result = 1 + 1
  end

  Setup "establish PEMDAS" do
    @answer = 6 / 2 * (1 + 2)
  end

  Teardown "teardown" do
    @value = nil
  end

  Cleanup "cleanup" do
    @result = nil
    @answer = nil
  end

  Scenario "testing" do
    Then "testing is testing" do
      expect(@value).to eq "testing"
      expect(@result).to eq 2
      expect(@answer).to eq 9
    end
  end

  Scenario "qa" do
    Then "testing is not qa" do
      expect(@value).not_to eq "qa"
      expect(@result).to eq 2
    end
  end
end
