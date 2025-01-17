defmodule LivebookWeb.Output.JSComponent do
  use LivebookWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div id={"js-output-#{@id}-#{@info.ref}"}
      phx-hook="JSOutput"
      phx-update="ignore"
      data-ref={@info.ref}
      data-assets-base-path={Routes.session_path(@socket, :show_asset, @session_id, @info.assets.hash, [])}
      data-js-path={@info.assets.js_path}
      data-session-token={session_token(@info.pid)}
      data-session-id={@session_id}>
    </div>
    """
  end

  defp session_token(pid) do
    Phoenix.Token.sign(LivebookWeb.Endpoint, "js output", %{pid: pid})
  end
end
