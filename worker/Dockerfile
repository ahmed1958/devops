# =========================
# Build Stage
# =========================
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src

# Copy csproj and restore dependencies first (better caching)
COPY *.csproj ./
RUN dotnet restore

# Copy everything else
COPY . ./

# Build and publish
RUN dotnet publish -c Release -o /app/publish


# =========================
# Runtime Stage
# =========================
FROM mcr.microsoft.com/dotnet/runtime:7.0

WORKDIR /app

# Copy published output from build stage
COPY --from=build /app/publish .

# Run the worker app
ENTRYPOINT ["dotnet", "Worker.dll"]