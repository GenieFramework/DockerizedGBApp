module App

using GenieFramework
@genietools

@handlers begin
  @out message = "Hello World!"

  @onchange isready begin
    @show "App is loaded"
  end
end

@page("/", "app.jl.html")

end
