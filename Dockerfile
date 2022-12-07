FROM julia:latest
WORKDIR /app
COPY . .
EXPOSE 8000

RUN julia --project -e 'using Pkg; Pkg.instantiate(); Pkg.precompile();'

ENV GENIE_HOST "0.0.0.0"
ENV PORT "9001"
ENV WSPORT "9001"

CMD ["julia", "startup.jl"]
