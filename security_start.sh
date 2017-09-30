DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting Motion Detection"
sudo motion -b -f ${DIR}/conf/motion.conf
