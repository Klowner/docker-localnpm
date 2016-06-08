#!/bin/sh
set -e

case ${1} in
	app:start|app:help)

	case ${1} in
		app:help)
			echo "Available options:"
			echo " app:start     - Starts local-npm (default)"
			echo " app:help      - Display this help"
			echo ""
			echo "Environment variables:"
			echo " REMOTE_PORT   - port (default: 5080)"
			echo " POUCH_PORT    - pouchdb-server port (default: 16984)"
			echo " LOG           - pouchdb-server log level (error|warn|info|debug)"
			echo " REMOTE        - remote fullfatdb (default: https://registry.npmjs.org"
			echo " REMOTE_SKIM   - remote skimdb (default: https://skimdb.npmjs.com/registry)"
			echo " URL_BASE      - base url you want clients to use for fetching tarballs,"
			echo "                   e.g. if you are using tunneling/proxying"
			echo "                   (default: http://127.0.0.1:5080)"
			echo " DIRECTORY     - directory to store data (default: '/data')"
			;;
		app:start)
			 ./node_modules/.bin/local-npm \
				${REMOTE_PORT+--port} ${REMOTE_PORT} \
				${POUCH_PORT+--pouch-port} ${POUCH_PORT} \
				${LOG+--log} ${LOG} \
				${REMOTE+--remote} ${REMOTE} \
				${REMOTE_SKIM+--remote-skim} ${REMOTE_SKIM} \
				${URL_BASE+--url-base} ${URL_BASE} \
				--directory ${DIRECTORY-/data}

		esac
		;;
	*)
		exec "$@"
		;;
esac
