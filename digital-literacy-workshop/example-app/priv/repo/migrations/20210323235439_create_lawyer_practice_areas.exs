defmodule Wld.Repo.Migrations.CreateLawyerPracticeAreas do
  use Ecto.Migration

  def change do
    create table(:lawyer_practice_areas, primary_key: false) do
      add :practice_area_id, references(:practice_areas, on_delete: :nothing), primary_key: true
      add :lawyer_id, references(:lawyers, on_delete: :nothing),  primary_key: true
    end

    create index(:lawyer_practice_areas, [:practice_area_id])
    create index(:lawyer_practice_areas, [:lawyer_id])
  end
end
