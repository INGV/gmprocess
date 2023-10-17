# gmprocess
Parsing and processing ground motion data from USGS, in a docker container.
- https://code.usgs.gov/ghsc/esi/groundmotion-processing

## Clone the repository
```
git clone https://github.com/INGV/gmprocess.git
cd gmprocess
```

## Build docker image
```
docker build -t gmprocess .
```

## Run docker container
Before to run docker container, create a local `data` dir:
```
mkdir data
```

now, run the container binding `data` dir:
```
docker run -it --rm --name gmprocess_container -v $(pwd)/data:/opt/data gmprocess bash
```

Once in the docker shell, the following commands should be used to download and process an earthquake:
- `gmrecords`
- `gmrecords download -e nc73654060`

More information on the `gmprocess` command line interface is available [here](https://usgs.github.io/groundmotion-processing/contents/tutorials/cli.html)

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository:
<a href="https://github.com/ingv/gmprocess/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ingv/gmprocess" />
</a>

# Author
(c) 2023 Valentino Lauciani valentino.lauciani[at]ingv.it

Istituto Nazionale di Geofisica e Vulcanologia, Italia
