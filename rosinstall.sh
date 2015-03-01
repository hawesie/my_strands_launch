ROSDISTRO_INDEX_URL=https://raw.github.com/ros/rosdistro/master/index.yaml rosinstall_generator desktop_full --rosdistro indigo --wet-only --deps --exclude sicks300 flir_pantilt_d46 scitos_mira joy openni_wrapper > $1
rosinstall_generator strands_desktop --rosdistro indigo --wet-only --deps --exclude sicks300 flir_pantilt_d46 scitos_mira joy openni_wrapper >> $1
