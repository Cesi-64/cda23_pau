export SONAR_HOST=172.17.0.2:9000
export SONAR_TOKEN=e40f4bafebb194dbcb8f759ce71d7b830e8698fd
export REPO=$(pwd)
export CONFIG_FILE=$(pwd)/sonar-project.properties

docker run \
    --rm \
    -e SONAR_HOST_URL="http://${SONAR_HOST}" \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=cdapau23 -Dsonar.login=e40f4bafebb194dbcb8f759ce71d7b830e8698fd" \
    -e SONAR_LOGIN="${SONAR_TOKEN}" \
    -v "${REPO}:/usr/src" \
    -v $CONFIG_FILE:/opt/sonar-scanner/conf/sonar-scanner.properties \
    sonarsource/sonar-scanner-cli