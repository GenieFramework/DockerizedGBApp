# installing dependencies REQUIREMENT.TXT
using Pkg; 
Pkg.activate(".");
Pkg.instantiate();
# import tensorflow.tf as tf
using GenieFramework; # precompilation
using GenieFramework.Genie;
Core.eval(Main, :(const UserApp = $(@__MODULE__)));
Genie.genie(context = @__MODULE__);
up(async = false);