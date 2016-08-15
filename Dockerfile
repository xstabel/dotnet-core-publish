FROM microsoft/dotnet:1.0.0-core

ARG CONT_IMG_PORT
ARG EXEC_APP

RUN apt-get update && apt-get install -y zip tar
ENV IMAGE_SCRIPTS_HOME=/opt/scripts \
    APPLICATION_HOME=/app

#WORKDIR IMAGE_SCRIPTS_HOME
WORKDIR $APPLICATION_HOME

ADD publishout.zip $APPLICATION_HOME/
RUN unzip $APPLICATION_HOME/publishout.zip

ENV CONT_IMG_PORT ${CONT_IMG_PORT:-8080}
ENV EXEC_APP ${EXEC_APP:-POCs.dll}

#Configure the listening port to
ENV ASPNETCORE_URLS http://*:$CONT_IMG_PORT
EXPOSE 8080

ENTRYPOINT ["dotnet","POCs.dll"]
