# stop script on error
set -e

# run pub/sub sample app using certificates downloaded in package
printf "\nRunning pub/sub sample application...\n"
python aws-iot-device-sdk-python/samples/basicPubSub/sensorPub.py -e atatla9jnkhk-ats.iot.us-east-1.amazonaws.com -r root-CA.crt -c Device1.cert.pem -k Device1.private.key
