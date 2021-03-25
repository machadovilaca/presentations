defmodule WldWeb.PracticeAreaController do
  use WldWeb, :controller

  alias Wld.Courts
  alias Wld.Courts.PracticeArea

  def index(conn, _params) do
    practice_areas = Courts.list_practice_areas()
    render(conn, "index.html", practice_areas: practice_areas)
  end

  def new(conn, _params) do
    changeset = Courts.change_practice_area(%PracticeArea{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"practice_area" => practice_area_params}) do
    case Courts.create_practice_area(practice_area_params) do
      {:ok, practice_area} ->
        conn
        |> put_flash(:info, "Practice area created successfully.")
        |> redirect(to: Routes.practice_area_path(conn, :show, practice_area))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    practice_area = Courts.get_practice_area!(id)
    render(conn, "show.html", practice_area: practice_area)
  end

  def edit(conn, %{"id" => id}) do
    practice_area = Courts.get_practice_area!(id)
    changeset = Courts.change_practice_area(practice_area)
    render(conn, "edit.html", practice_area: practice_area, changeset: changeset)
  end

  def update(conn, %{"id" => id, "practice_area" => practice_area_params}) do
    practice_area = Courts.get_practice_area!(id)

    case Courts.update_practice_area(practice_area, practice_area_params) do
      {:ok, practice_area} ->
        conn
        |> put_flash(:info, "Practice area updated successfully.")
        |> redirect(to: Routes.practice_area_path(conn, :show, practice_area))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", practice_area: practice_area, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    practice_area = Courts.get_practice_area!(id)
    {:ok, _practice_area} = Courts.delete_practice_area(practice_area)

    conn
    |> put_flash(:info, "Practice area deleted successfully.")
    |> redirect(to: Routes.practice_area_path(conn, :index))
  end
end
