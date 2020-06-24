SUSML_TIMESTAMP="$(date +'%m-%d-%Y--%H-%M-%S')"
SUSML_DIR_PATH="../logs/$SUSML_TIMESTAMP"
mkdir -p $SUSML_DIR_PATH

source ./env.sh
cp ./wrapper_script.sh "$SUSML_DIR_PATH/wrapper_script.sh"
cp ./env.sh "$SUSML_DIR_PATH/env.sh"
cp ./train_eval_test.sh "$SUSML_DIR_PATH/train_eval_test.sh"
cp ./hostfile "$SUSML_DIR_PATH/hostfile"

mpirun -x SUSML_DIR_PATH=$SUSML_DIR_PATH -n $SUSML_PARALLELISM_LEVEL --map-by socket:pe=1 -hostfile ./hostfile --mca orte_fork_agent bash ./train_eval_test.sh
# horovodrun

unset "${!SUSML_@}"
