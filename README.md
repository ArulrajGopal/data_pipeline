# ER diagram for the workflow

![image](https://github.com/user-attachments/assets/7e3feb42-b7d3-4dce-899b-c56eec999387)



# data pipeline flow

![image](https://github.com/user-attachments/assets/17c776d1-8d13-47c0-b502-e61b412070a8)




# Setup procedure
1.Setup a linux machine(for the demo, below machine used)

    * Azure Virtual Machine
    * Operating System: Linux (ubuntu-24_04-lts)
    * Standard D2s v3 (2 vcpus, 8 GiB memory)

2.Install Python 

    sudo apt-get install python3.12.3
    python3 --version

3.Clone the Repository

    git clone https://github.com/ArulrajGopal/data_pipeline.git /ProjectFolder/

4.Run setup file

    cd ProjectFolder
    source setup.sh

5.start all components

    # initializes the database, creates a user, and starts all components.
    # starts the web server and the scheduler.
    # activate virtual environment, if not activated
    airflow standalone

    #default username is "admin"
    #password will be saved in "<VENV_DIR>/airflow/simple_auth_manager_passwords.json.generated"
    #VENV_DIR is defined in setup.sh file



# Additional information

   #to activate virtual environment
   #set current working as project directory and run below
   source activate_venv.sh


