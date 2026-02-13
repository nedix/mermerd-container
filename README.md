# [mermerd-container][project]

Create Mermaid ERD diagrams from live databases.


## Usage


### 1. Run the mermerd command-line utility

This example command connects to a MySQL server running on localhost port 3306.
Replace `root:` with your `username:password` combination.

```shell
docker run \
    --name mermerd \
    --net host \
    --pull always \
    --rm \
    -i \
    -t \
    -v "${PWD}/storage/:/mnt/storage/" \
    mermerd \
    --runConfig "/etc/mermerd/config.yml" \
    --connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"
```


[project]: https://hub.docker.com/r/nedix/mermerd
