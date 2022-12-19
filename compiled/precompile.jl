using GenieFramework

Genie.loadapp()

include("packages.jl")
using PrecompileSignatures

for p in PACKAGES
  @show "Precompiling signatures for $p"
  Core.eval(@__MODULE__, Meta.parse("import $p"))
  Core.eval(@__MODULE__, Meta.parse("@precompile_signatures($p)"))
end

import Genie.Requests.HTTP

@info "Hitting routes"

Genie.Router.params!(:packages, "Genie, Stipple")

for r in Genie.Router.routes()
  try
    r.action()
  catch
  end
end

const PORT = 8000

try
  @info "Starting server"
  up(PORT)
catch
end

rts = Genie.Router.routes()

try
  #TODO: Ask adrian if I should filter /geniepackagemanager/* /stippleui/* /_devtools_/* tobe hit by HTTP
  for rt in rts
    @time HTTP.request("GET", "http://localhost:$PORT" * rt.path)
  end
catch
end

try
  @info "Stopping server"
  Genie.Server.down!()
catch
end