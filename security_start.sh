DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting Motion Detection"
sudo motion -bc ${DIR}/conf/motion.conf && echo "Started" || echo "Fail 0_0"
