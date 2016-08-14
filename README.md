# Docker image for dotnet core publish
The image is build in docker registry : https://hub.docker.com/r/xstabel/dotnet-core-publish/
you can pull it :
```
docker pull xstabel/dotnet
```

It's another approach that you can take to publish your app and then make the published app as part of the Docker image. 

Example: Here I would like to publish my app only on Core clr in Windows:

```
dotnet publish --runtime "ubuntu.14.04-x64" -o Mypublishedoutput -c release
```

Then you can run your application like this:

```
dotnet myapp.dll
```

Here I explicitly specify runtime as your app could be targeting both Windows and Linux and since you are sure you want to run on Core Clr, you can avoid packaging other related packages...so that's a reduction in image size!


More info:
Restored packages size is NOT the same as published packages of an application.
In the below scenario the published package has only the required content for running the application...