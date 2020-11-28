from cloud_tpu_client import Client
import argparse
import json
import os

parser = argparse.ArgumentParser()
parser.add_argument('--target-version',
                     type=str,
                     required=True,
                     help='target TPU Runtime version')

args = parser.parse_args()

tpu_config_env = os.environ.get('TPU_CONFIG')


if not tpu_config_env:
    tf.logging.info('Missing TPU_CONFIG, use CPU/GPU for training.')
    exit()

tpu_node = json.loads(tpu_config_env)

c = Client(tpu_node['tpu_node_name'])
# Wait for the TPU node to be up and Healthy with default runtime
c.wait_for_healthy()
# Change runtime to target_version
c.configure_tpu_version(args.target_version, restart_type='ifNeeded')
c.wait_for_healthy()

# Get the TPU_IP_ADDRESS
# This will be used in the subsequent steps to set XRT_TPUC_CONFIG
endpoints = c.network_endpoints()
for endpoint in endpoints:
    print(endpoint['ipAddress'])

