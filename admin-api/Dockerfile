FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY . .
RUN dotnet restore AiAdmin.csproj
RUN dotnet publish AiAdmin.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app

COPY --from=build /app/publish .

# 上传文件持久化目录
VOLUME /app/uploads

EXPOSE 8080
EXPOSE 1883
EXPOSE 8884/udp

ENTRYPOINT ["dotnet", "AiAdmin.dll"]