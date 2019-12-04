########################################################################################
# This shell script gathers the required information to upload test results to Calliope

#######################################################
#Checking required variables

# Is the filename correct?
if ! [ -f "$1" ]; then
  echo "ERROR: Please pass a valid file in the command. Example: sh upload_results_to_calliope.sh results/latest_results.json"
  echo "You can get the lastest file from the folder with the command: 'ls -t results/*.json | head -1'"
  exit 1
else
  report=$1
fi

# Do we have a profile ID
if [[ -z "${PROFILE_ID}" ]]; then
  echo "ERROR: PROFILE_ID env variable needs to be set. Example: export PROFILE_ID=123"
  exit 1
fi

# Do we have an API key
if [[ -z "${API_KEY}" ]]; then
  echo "ERROR: API_KEY env variable needs to be set. Example: export API_KEY=<YOUR_KEY>"
  exit 1
fi

#######################################################
#Checking and setting optional variables

TA_OS="${TA_OS:-undefined}"
TA_BUILD="${TA_BUILD:-undefined}"
TA_PLATFORM="${TA_PLATFORM:-undefined}"
API_URL="${API_URL:-https://app.calliope.pro}"


# Upload test results if the file exists
if [ -f "$report" ]
then
	echo "Uploading test results... Details:"
	echo "   Calliope API: ${API_URL}"
	echo "   Profile ID: ${PROFILE_ID}"
	echo "   TA_OS:${TA_OS}"
	echo "   TA_BUILD:${TA_BUILD}"
    echo "   TA_PLATFORM:${TA_PLATFORM}"

	curl -X POST -H "x-api-key: ${API_KEY}" -H "Content-Type: application/*" --data "@${report}" "${API_URL}/api/v2/profile/${PROFILE_ID}/report/import?os=${TA_OS}&platform=${TA_PLATFORM}&build=${TA_BUILD}"
else
	echo "No results found."
fi