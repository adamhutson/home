# create environment variable to format `docker ps` output
# flips output from following:
#
# $ docker ps
# CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS                       PORTS                                                                                                                         NAMES
# 6b171deadf68        grafana/grafana:latest   "/run.sh"                About an hour ago   Up About an hour             0.0.0.0:32780->3000/tcp                                                                                                       grafana
# 4348458c2b2f        prom/prometheus:latest   "/bin/prometheus --c…"   About an hour ago   Up About an hour             0.0.0.0:32779->9090/tcp                                                                                                       prometheus
# c618b6134cf2        cassandra:latest         "docker-entrypoint.s…"   About an hour ago   Up About an hour             0.0.0.0:32778->7000/tcp, 0.0.0.0:32777->7001/tcp, 0.0.0.0:32776->7199/tcp, 0.0.0.0:32775->9042/tcp, 0.0.0.0:32774->9160/tcp   cassandra
# 6393235e7df3        postgres:latest          "docker-entrypoint.s…"   About an hour ago   Up About an hour             0.0.0.0:32773->5432/tcp                                                                                                       postgres
# e32a59aad48d        redis:latest             "docker-entrypoint.s…"   About an hour ago   Up About an hour             0.0.0.0:32772->6379/tcp                                                                                                       redis
# 9bd644095fd7        crate:latest             "docker-entrypoint.…"   About an hour ago   Up About an hour (healthy)   0.0.0.0:32771->4200/tcp, 0.0.0.0:32770->4300/tcp, 0.0.0.0:32769->5432/tcp                                                     crate
#
# to:
#
# $ docker ps --format $FORMAT
# 
# ID	6b171deadf68
# IMAGE	grafana/grafana:latest
# COMMAND	"/run.sh"
# CREATED	About an hour ago
# STATUS	Up About an hour
# PORTS	0.0.0.0:32780->3000/tcp
# NAMES	grafana
# 
# 
# ID	4348458c2b2f
# IMAGE	prom/prometheus:latest
# COMMAND	"/bin/prometheus --c…"
# CREATED	About an hour ago
# STATUS	Up About an hour
# PORTS	0.0.0.0:32779->9090/tcp
# NAMES	prometheus
# 
# 
# ID	c618b6134cf2
# IMAGE	cassandra:latest
# COMMAND	"docker-entrypoint.s…"
# CREATED	About an hour ago
# STATUS	Up About an hour
# PORTS	0.0.0.0:32778->7000/tcp, 0.0.0.0:32777->7001/tcp, 0.0.0.0:32776->7199/tcp, 0.0.0.0:32775->9042/tcp, 0.0.0.0:32774->9160/tcp
# NAMES	cassandra
# 
# 
# ID	6393235e7df3
# IMAGE	postgres:latest
# COMMAND	"docker-entrypoint.s…"
# CREATED	About an hour ago
# STATUS	Up About an hour
# PORTS	0.0.0.0:32773->5432/tcp
# NAMES	postgres
# 
# 
# ID	e32a59aad48d
# IMAGE	redis:latest
# COMMAND	"docker-entrypoint.s…"
# CREATED	About an hour ago
# STATUS	Up About an hour
# PORTS	0.0.0.0:32772->6379/tcp
# NAMES	redis
# 
# 
# ID	9bd644095fd7
# IMAGE	crate:latest
# COMMAND	"/docker-entrypoint.…"
# CREATED	About an hour ago
# STATUS	Up About an hour (healthy)
# PORTS	0.0.0.0:32771->4200/tcp, 0.0.0.0:32770->4300/tcp, 0.0.0.0:32769->5432/tcp
# NAMES	crate
# 

FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
echo $FORMAT 
