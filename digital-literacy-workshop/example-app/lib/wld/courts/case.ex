defmodule Wld.Courts.Case do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cases" do
    field :details, :string

    belongs_to :practice_area, Wld.Courts.PracticeArea
    belongs_to :lawyer, Wld.Lawyers.Lawyer

    timestamps()
  end

  @doc false
  def changeset(case, attrs) do
    case
    |> cast(attrs, [:details, :practice_area_id, :lawyer_id])
    |> validate_required([:details, :practice_area_id, :lawyer_id])
  end
end
