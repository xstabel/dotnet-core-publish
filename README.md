Another approach you can take is to publish the app and then make the published app as part of the Docker image:,

Example: Here I would like to run my app only on Core Clr

Run dnu publish --framework dnxcore50 --out ../publishedoutput (Here I explicitly specify framework as your app could be targeting both dnx451 and dnxcore50 and since you are sure you want to run on Core Clr, you can avoid packaging dnx451 related packages...so that's a reduction in image size)
A docker file which can be used against the above the published directory to create the docker image.
FROM microsoft/aspnet:1.0.0-rc1-final-coreclr
COPY . /app/
WORKDIR /app/approot
EXPOSE 5004
ENTRYPOINT ["./kestrel"]
More info:
Restored packages size is NOT the same as published packages of an application.
You can understand why this is the case by opening up the restored packages...For example, in the below scenario the published package has only the required content for running the application.