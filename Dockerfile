# pull latest julia image
FROM julia:latest
WORKDIR /app
COPY . .
EXPOSE 8000

ENV GENIE_HOST "0.0.0.0"
ENV PORT "9001"
ENV WSPORT "8000"

# ENTRYPOINT [“julia”]
# RUN julia test.jl
CMD ["julia", "startup.jl"]