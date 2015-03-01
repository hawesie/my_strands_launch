#/bin/bash

rosservice call /config_manager/save_param /twitter/appKey

rosservice call /config_manager/save_param /twitter/appSecret

rosservice call /config_manager/save_param /twitter/oauthToken

rosservice call /config_manager/save_param /twitter/oauthTokenSecret