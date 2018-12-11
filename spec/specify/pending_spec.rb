RSpec.describe "handle pending status for steps" do
  Scenario "pending steps" do
    Given "step without block, with tag", pending: true
    Given "step without block, with message", pending: "wip"
  end
end
