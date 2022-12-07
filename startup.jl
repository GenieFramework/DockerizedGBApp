using Pkg;
Pkg.activate(".");
using GenieFramework;
using GenieFramework.Genie;
Core.eval(Main, :(const UserApp = $(@__MODULE__)));
Genie.genie(context = @__MODULE__);
up(async = false);