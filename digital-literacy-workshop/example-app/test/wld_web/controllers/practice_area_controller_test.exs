defmodule WldWeb.PracticeAreaControllerTest do
  use WldWeb.ConnCase

  alias Wld.Courts

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:practice_area) do
    {:ok, practice_area} = Courts.create_practice_area(@create_attrs)
    practice_area
  end

  describe "index" do
    test "lists all practice_areas", %{conn: conn} do
      conn = get(conn, Routes.practice_area_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Practice areas"
    end
  end

  describe "new practice_area" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.practice_area_path(conn, :new))
      assert html_response(conn, 200) =~ "New Practice area"
    end
  end

  describe "create practice_area" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.practice_area_path(conn, :create), practice_area: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.practice_area_path(conn, :show, id)

      conn = get(conn, Routes.practice_area_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Practice area"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.practice_area_path(conn, :create), practice_area: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Practice area"
    end
  end

  describe "edit practice_area" do
    setup [:create_practice_area]

    test "renders form for editing chosen practice_area", %{conn: conn, practice_area: practice_area} do
      conn = get(conn, Routes.practice_area_path(conn, :edit, practice_area))
      assert html_response(conn, 200) =~ "Edit Practice area"
    end
  end

  describe "update practice_area" do
    setup [:create_practice_area]

    test "redirects when data is valid", %{conn: conn, practice_area: practice_area} do
      conn = put(conn, Routes.practice_area_path(conn, :update, practice_area), practice_area: @update_attrs)
      assert redirected_to(conn) == Routes.practice_area_path(conn, :show, practice_area)

      conn = get(conn, Routes.practice_area_path(conn, :show, practice_area))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, practice_area: practice_area} do
      conn = put(conn, Routes.practice_area_path(conn, :update, practice_area), practice_area: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Practice area"
    end
  end

  describe "delete practice_area" do
    setup [:create_practice_area]

    test "deletes chosen practice_area", %{conn: conn, practice_area: practice_area} do
      conn = delete(conn, Routes.practice_area_path(conn, :delete, practice_area))
      assert redirected_to(conn) == Routes.practice_area_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.practice_area_path(conn, :show, practice_area))
      end
    end
  end

  defp create_practice_area(_) do
    practice_area = fixture(:practice_area)
    %{practice_area: practice_area}
  end
end
