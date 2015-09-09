#!/usr/bin/env python

import rospy
import mongodb_store_msgs.srv as dc_srv
import mongodb_store.util as dc_util
import pymongo
import json
from bson import json_util
from mongodb_store_msgs.msg import  StringPair, StringPairList
from bson.objectid import ObjectId
from datetime import *

MongoClient = dc_util.import_MongoClient()



if __name__ == "__main__":

    rospy.init_node("replacer")
    mongo_client = MongoClient(rospy.get_param("mongodb_host"), rospy.get_param("mongodb_port") )
    # collection = mongo_client['message_store']['ws_observations']
    collection = mongo_client['message_store']['soma']

    # field = '_meta.stored_type'
    # old_value = 'ros_datacentre_msgs/SerialisedMessage'
    # new_value = 'mongodb_store/SerialisedMessage'
    # field = '_meta.stored_class'
    # old_value = 'ros_datacentre_msgs.msg._SerialisedMessage.SerialisedMessage'
    # new_value = 'mongodb_store.msg._SerialisedMessage.SerialisedMessage'
    field = 'map'
    old_value = '/home/gemignani/catkin_workspace/src/spatio-temporal-cues/strands_morse/sapienza/maps/map.yaml'
    new_value = 'sapienza'
    field = 'config'
    old_value = 'config/default.json'
    new_value = 'sapienza'


    print collection.find({field: old_value}).count()
    collection.update({field: old_value}, {'$set': {field: new_value}}, multi = True)
    print collection.find({field: old_value}).count()	

