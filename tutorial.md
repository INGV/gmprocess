Vi riporto una prima lista di comandi che ho usato.

1) Entro nel container utilizzando al mia /data/shake/data_valentino:
```
docker run -it --rm --name gmprocess_container -v /data/shake/data_valentino:/opt/data gmprocess bash
```

2) la prima volta, va eseguito init che crea due directory: `data` e `conf`. In `conf` ci va il file di configurazione `user.yml` :
```
root@dc2d81188309:/opt# cd data
root@dc2d81188309:/opt/data# gmrecords init
Please enter a project title: [default]
Please enter the conf: [/opt/data/conf]
Please enter the data: [/opt/data/data]
Please enter your name and email. This information will be added
to the config file and reported in the provenance of the data
processed in this project.
	Name: Valentino
	Email address: valentn10.lauciani@ingv.it

Created Project: default **Current Project**
	Conf Path: /opt/data/conf
	Data Path: /opt/data/data
root@dc2d81188309:/opt/data#
```
maggiori dettagli sul file di configurazione:
- guida: https://ghsc.code-pages.usgs.gov/esi/groundmotion-processing/contents/manual/config_file.html#
- esempio: https://code.usgs.gov/ghsc/esi/groundmotion-processing/blob/main/src/gmprocess/data/config_production.yml

3) scarico i dati di esempio per l’eventid dell’USGS nc73654060:
```
root@dc2d81188309:/opt/data# gmrecords --eventid nc73654060 download
INFO 2023-10-18 14:23:27 | gmrecords._initialize: Logging level includes INFO.
INFO 2023-10-18 14:23:27 | gmrecords._initialize: PROJECTS_PATH: /opt/data/.gmprocess
--------------------------------------------------------------------------------
Project: default **Current Project**
	Conf Path: /opt/data/conf
	Data Path: /opt/data/data
--------------------------------------------------------------------------------
INFO 2023-10-18 14:23:27 | download.main: Running subcommand 'download'
INFO 2023-10-18 14:23:28 | font_manager._load_fontmanager: generated new fontManager
INFO 2023-10-18 14:23:32 | download.main: Number of events to download: 1
INFO 2023-10-18 14:23:32 | download.main: Starting event: nc73654060
WARNING 2023-10-18 14:23:32 | global_fetcher.fetch_data: Could not instantiate Fetcher CESMDFetcher, due to error
 "Email address is required to retrieve CESMD
data. This tool can download data from the CESMD
website. However, for this to work you will first need
to register your email address using this website:
https://strongmotioncenter.org/cgi-bin/CESMD/register.pl
Then create a custom config file by running the gmsetup
program, and edit the fetchers:CESMDFetcher section
to use your email address."
. . .
. . .
root@dc2d81188309:/opt/data#
```
4) i dati scaricati sono qui:
```
root@dc2d81188309:/opt/data# ll data/nc73654060/
total 292
-rw-r--r-- 1 root root  83657 Oct 18 14:43 event.json
drwxr-xr-x 2 root root 204800 Oct 18 14:41 raw
-rw-r--r-- 1 root root    514 Oct 18 14:43 rupture.json
```

5) collects the data in the raw directory and organizes it into an ASDF file. If we do not specify the event ID, then all of the events in the data directory will be assembled:
```
root@dc2d81188309:/opt/data# gmrecords assemble
INFO 2023-10-18 14:52:52 | gmrecords._initialize: Logging level includes INFO.
INFO 2023-10-18 14:52:52 | gmrecords._initialize: PROJECTS_PATH: /opt/data/.gmprocess
--------------------------------------------------------------------------------
Project: default **Current Project**
	Conf Path: /opt/data/conf
	Data Path: /opt/data/data
--------------------------------------------------------------------------------
INFO 2023-10-18 14:52:52 | assemble.main: Running subcommand 'assemble'
INFO 2023-10-18 14:52:54 | assemble.main: Number of events to assemble: 1
INFO 2023-10-18 14:52:54 | assemble.main: Assembling event nc73654060 (1 of 1)...
. . .
. . .
root@dc2d81188309:/opt/data#
```
