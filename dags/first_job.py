import textwrap
from datetime import datetime, timedelta
from airflow.providers.standard.operators.bash import BashOperator


from airflow.sdk import DAG
with DAG(
    "first_job",
    default_args={
        "depends_on_past": False,
        "retries": 1,
        "retry_delay": timedelta(minutes=5),
    },
    description="A simple tutorial DAG",
    schedule=timedelta(days=1),
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=["arul_added_dag"],
) as dag:

    t1 = BashOperator(
        task_id="print_start_time",
        bash_command="date",
    )

    t2 = BashOperator(
        task_id="sleep",
        depends_on_past=False,
        bash_command="sleep 5",
        retries=3,

    )

    t3 = BashOperator(
        task_id="print_end_time",
        depends_on_past=False,
        bash_command="date",
    )

    t1 >> [t2, t3]
