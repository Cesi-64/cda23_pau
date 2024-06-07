mkdir -p ./opt/sonarqube/conf
mkdir -p ./opt/sonarqube/data
mkdir -p ./opt/sonarqube/logs
mkdir -p ./opt/sonarqube/extensions

export SONARQUBE_DIR=$(pwd)/opt

docker run \
    -p 9000:9000 \
    -d \
    --name sonarqube \
    --rm \
    --stop-timeout 3600 \
    -v $SONARQUBE_DIR/conf:/opt/sonarqube/conf \
    -v $SONARQUBE_DIR/data:/opt/sonarqube/data \
    -v $SONARQUBE_DIR/logs:/opt/sonarqube/logs \
    -v $SONARQUBE_DIR/extensions:/opt/sonarqube/extensions \
    sonarqube:8.7.1-community

echo "  "
echo "#########################"
echo "SONARQUBE Server is ready"
echo "His IP@ is : $(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}', sonarqube)"