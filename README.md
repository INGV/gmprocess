# gmprocess
Parsing and processing ground motion data from USGS

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

- `gmrecords download -e nc73654060`
- `gmrecords assemble -e nc73654060`
- `gmrecords process -e nc73654060`
- `gmrecords sm -e nc73654060`
- `gmrecords wm -e nc73654060`

# Contribute
Thanks to your contributions!

Here is a list of users who already contributed to this repository:
<a href="https://github.com/ingv/gmprocess/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ingv/gmprocess" />
</a>

# Author
(c) 2019 Valentino Lauciani valentino.lauciani[at]ingv.it

Istituto Nazionale di Geofisica e Vulcanologia, Italia
