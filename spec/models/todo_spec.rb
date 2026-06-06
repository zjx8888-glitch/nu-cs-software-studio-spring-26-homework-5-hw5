require "rails_helper"

RSpec.describe Todo, type: :model do
  describe ".with_category" do
    it "returns only todos in the selected category" do
      study_todo = Todo.create!(description: "Finish homework", category: "study")
      Todo.create!(description: "Buy groceries", category: "personal")

      expect(Todo.with_category("study")).to contain_exactly(study_todo)
    end
  end
end