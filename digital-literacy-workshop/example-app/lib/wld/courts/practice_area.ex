defmodule Wld.Courts.PracticeArea do
  use Ecto.Schema
  import Ecto.Changeset

  schema "practice_areas" do
    field :name, :string

    many_to_many :lawyers, Wld.Lawyers.Lawyer, join_through: "lawyer_practice_areas", on_delete: :delete_all

    has_many :cases, Wld.Courts.Case

    timestamps()
  end

  @doc false
  def changeset(practice_area, attrs) do
    practice_area
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
