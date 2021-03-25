defmodule WldWeb.CaseControllerTest do
  use WldWeb.ConnCase

  alias Wld.Courts

  @create_attrs %{details: "some details"}
  @update_attrs %{details: "some updated details"}
  @invalid_attrs %{details: nil}

  def fixture(:case) do
    {:ok, case} = Courts.create_case(@create_attrs)
    case
  end

  describe "index" do
    test "lists all cases", %{conn: conn} do
      conn = get(conn, Routes.case_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cases"
    end
  end

  describe "new case" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.case_path(conn, :new))
      assert html_response(conn, 200) =~ "New Case"
    end
  end

  describe "create case" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.case_path(conn, :create), case: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.case_path(conn, :show, id)

      conn = get(conn, Routes.case_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Case"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.case_path(conn, :create), case: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Case"
    end
  end

  describe "edit case" do
    setup [:create_case]

    test "renders form for editing chosen case", %{conn: conn, case: case} do
      conn = get(conn, Routes.case_path(conn, :edit, case))
      assert html_response(conn, 200) =~ "Edit Case"
    end
  end

  describe "update case" do
    setup [:create_case]

    test "redirects when data is valid", %{conn: conn, case: case} do
      conn = put(conn, Routes.case_path(conn, :update, case), case: @update_attrs)
      assert redirected_to(conn) == Routes.case_path(conn, :show, case)

      conn = get(conn, Routes.case_path(conn, :show, case))
      assert html_response(conn, 200) =~ "some updated details"
    end

    test "renders errors when data is invalid", %{conn: conn, case: case} do
      conn = put(conn, Routes.case_path(conn, :update, case), case: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Case"
    end
  end

  describe "delete case" do
    setup [:create_case]

    test "deletes chosen case", %{conn: conn, case: case} do
      conn = delete(conn, Routes.case_path(conn, :delete, case))
      assert redirected_to(conn) == Routes.case_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.case_path(conn, :show, case))
      end
    end
  end

  defp create_case(_) do
    case = fixture(:case)
    %{case: case}
  end
end
