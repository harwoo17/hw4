Rails.application.routes.draw do
  get("/", { controller: "places", action: "index" })

  get("/login", { controller: "sessions", action: "new" })
  post("/sessions", { controller: "sessions", action: "create" })
  get("/logout", { controller: "sessions", action: "destroy" })

  get("/users/new", { controller: "users", action: "new" })
  post("/users", { controller: "users", action: "create" })

  resources "entries"
  resources "places"
end
