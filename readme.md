##  Set Up Debezium Connector to Listen for PostgreSQL Table Changes:  

```curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 127.0.0.1:8083/connectors/ --data "@debezium.json" ```


## Making jdbc sink connection:
 
### Products Sink Connector
 ```
curl -i -X POST -H "Accept: application/json" -H "Content-Type: application/json" \
--data "@jdbc-sink-products.json" \
http://localhost:8083/connectors/

``` 
### Orders Sink Connector
```
curl -i -X POST -H "Accept: application/json" -H "Content-Type: application/json" \
--data "@jdbc-sink-orders.json" \
http://localhost:8083/connectors/ 

```
### Customers Sink Connector
```
curl -i -X POST -H "Accept: application/json" -H "Content-Type: application/json" \
--data "@jdbc-sink-customers.json" \
http://localhost:8083/connectors/

```
