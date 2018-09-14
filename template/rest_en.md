
.. _rest_api:

========
REST API
========

The REST API allows you to query MQTT clients, sessions, subscriptions, and routes. You can also query and monitor the metrics and statistics of the broker.

--------
Base URL
--------

All REST APIs in the documentation have the following base URL::

    http(s)://host:8080/api/v3/

--------------------
Basic Authentication
--------------------

The HTTP requests to the REST API are protected with HTTP Basic authentication. You can create an application in Dashboard, using appid and appsecret to authenticate.  For example:

.. code-block:: bash

    curl -v --basic -u <appid>:<appsecret> -k http://localhost:8080/api/v3/brokers

----------
API's Info
----------

List all API describe
----------------------

## list_all_api


-----------------
Cluster and Node
-----------------

List all Cluster
-----------------

## list_brokers


Retrieve a Node's Info
----------------------

## get_broker

List all Nodes'statistics in the Cluster
-----------------------------------------

## list_nodes

Retrieve a node's statistics
-----------------------------

## get_node

------------
Connections
------------

List all Connections in the Cluster
------------------------------------

## list_connections


List all Connections on a Node
--------------------------------

## list_node_connections



Retrieve a Connection in the Cluster
-------------------------------------

## lookup_connections


Retrieve a Connection on a Node
--------------------------------

## lookup_node_connections



Kickout a Specified Connection of Cluster
----------------------------------------------

## kickout_connections



---------
Sessions
---------

List all Sessions in the Cluster
---------------------------------

## list_sessions


Retrieve a Session in the Cluster
----------------------------------

## lookup_session


List all Sessions on a Node
----------------------------

## list_node_sessions



Retrieve a Session on a Node
------------------------------

## lookup_node_session




--------------
Subscriptions
--------------


List all Subscriptions in the Cluster
--------------------------------------

## list_subscriptions


List Subscriptions of a Connection in the Cluster
--------------------------------------------------

## lookup_client_subscriptions


List all Subscriptions of a Node
---------------------------------

## list_node_subscriptions

List Subscriptions of a Client on a node
-----------------------------------------
## lookup_client_subscriptions_with_node

-------
Routes
-------

List all Routes in the Cluster
-------------------------------

## list_nodes


Retrieve a Route of Topic in the Cluster
-----------------------------------------

## lookup_routes



------------------
Publish/Subscribe
------------------

Publish Message
----------------

## mqtt_publish

.. NOTE:: The topic parameter is required, other parameters are optional. Payload defaults to empty string, qos defaults to 0, retain defaults to false, client_id defaults to 'http'.

Create a Subscription
----------------------

## mqtt_subscribe


Unsubscribe Topic
------------------

## mqtt_unsubscribe

--------
Plugins
--------

List all Plugins of Cluster
--------------------------------

## list_all_plugins


List all Plugins of a Node
---------------------------

## list_node_plugins


Start a Plugin
---------------

## load_plugin


Start a Plugin
---------------

## unload_plugin


----------
Listeners
----------

List all Listeners of Cluster
----------------------------------

## list_listeners


ist all Listeners of a Node
----------------------------

## list_node_listeners

---------------------------------------
Statistics of packet sent and received
---------------------------------------

Get Statistics in the Cluster
------------------------------

## list_all_metrics

Get Statistics of specified Node
---------------------------------

## list_node_metrics


--------------------------------
Statistics of connected session
--------------------------------

Get Statistics of connected session of Cluster
---------------------------------------------------

## list_stats

Get Statistics of connected session on specified node
------------------------------------------------------

## lookup_node_stats


------------------
Hot configuration
------------------

Get Modifiable configuration items of Cluster
--------------------------------------------------

## get_all_configs

Get Modifiable configuration items of specified node
-----------------------------------------------------

## get_node_configs


Modify configuration items of Cluster
--------------------------------------

## update_config


Modify configuration items of specified node
---------------------------------------------

## update_node_config


--------
Alarms
--------

Get Modifiable alarms of Cluster
-------------------------------------

## list_node_alarms

Get Modifiable alarms of specified node
----------------------------------------

## list_all_alarms



-------
Banned
-------

List all Banned of Cluster
------------------------------

## list_banned

Create a Banned
----------------

## create_banned

Delete a Banned
----------------

## delete_banned



-------------------------
Error Message/Pagination
-------------------------


When the HTTP status code is greater than 500, the response brings back the error message.
-----------------------------------------------------------------------------------

Example Request::

    PUT api/v3/nodes/emqx@127.0.0.1/plugins/emqx_recon/load

Response:

.. code-block:: json

    {
        "message": "already_started"
    }


Paging parameters and information
----------------------------------

The API that uses the _page=1&_limit=10000 parameter in the request example supports paging::

    _page: Current Page
    _limit: Page Size
    
    
Response:

.. code-block:: json    

    {
      "items": [],
      "meta": {
          "page": 1,
          "limit": 10000,
          "count": 2
      }
    }
    
