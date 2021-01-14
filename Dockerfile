# Base image
FROM bsantamaria/servercore-chocolatey:1809

# Install git, dotnetcore-sdk
RUN powershell -command "choco install -y git dotnetcore-sdk"

# Install wix
RUN powershell -command "Invoke-WebRequest https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip -OutFile wix.zip; \
                   Expand-Archive .\wix.zip -DestinationPath C:\wix" && \
                   del .\wix.zip && \
                   setx /M PATH "%PATH%;C:\wix"

