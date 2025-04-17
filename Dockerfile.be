# Stage 1: Build .NET 5
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY BE/be-api/ ./be-api/
WORKDIR /src/be-api
RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 5000
ENTRYPOINT ["dotnet", "be-api.dll"]
