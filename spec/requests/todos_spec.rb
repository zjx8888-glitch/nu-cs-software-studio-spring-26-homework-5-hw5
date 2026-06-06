require "rails_helper"

RSpec.describe "Todos index filtering", type: :request do
  it "filters todos by category param" do
    Todo.create!(description: "Finish homework", category: "study")
    Todo.create!(description: "Buy groceries", category: "personal")

    get todos_path, params: { category: "study" }

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Finish homework")
    expect(response.body).not_to include("Buy groceries")
  end
end