# Tar backup using rotate-backups.py

Back up a path to a encrypted, gziped, tar file.
Provide encryption password in environment variable `ENCRYPT_PASSWORD`.

If desired, a tar exclude pattern file can be provided. Set the path 
in `EXCLUDE_PATTERN_FILE` and make sure that path is bound into the
container.

Makes use of [rotate-backups.py](https://github.com/adamfeuer/rotate-backups).

## Example usage

docker run -e 'ENCRYPT_PASSWORD=XXXXX' -e NAME='some_name' -v /path/to/backup:/backup -v /some/output/path:/output -it muccg/tar-backup:latest
