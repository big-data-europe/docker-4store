# 4store docker

Docker containers to run a standalone 4store repository or a 4store cluster.

## Single node 4store

To deploy a single 4store node run

    docker run -d --name 4store bde2020/4store

This will just deploy a container named "4store" that has 4store installed and run the 4s-boss service. Then run 4store commands using docker exec.
For example to setup a repository named "default" run

    docker exec 4store 4s-backend-setup default

4store stores its data in /var/lib/4store so if you want to keep data also in your host filesystem run 4store as

    docker run -d --name 4store -v /path/in/host:/var/lib/4store bde2020/4store

## Cluster mode

To deploy a 4store cluster start by deploying the 4store datanodes. For example to create a cluster with two datanodes run

    docker run -d --name 4store1 bde2020/4store
    docker run -d --name 4store2 bde2020/4store

Then deploy the 4store master node. This node uses 4s-admin and 4s-boss to add the datanodes to the cluster.

    docker run -d --link 4store1:4store1 --link 4store2:4store2 -e STORE_NODES="4store1;4store2" bde2020/4store-master 

Then as in single node mode you can run other 4store commands using docker exec.
For example if you have a data dump in /home/user/dumps/dump.nt you can create a 2 node cluster, start a store named "default", start it and import the dump by running

    docker run -d --name 4store1 bde2020/4store
    docker run -d --name 4store2 bde2020/4store
    docker run -d --name 4store-master --link 4store1:4store1 --link 4store2:4store2 -e STORE_NODES="4store1;4store2" -v /home/user/dumps:/data bde2020/4store-master
    docker exec 4store-master 4s-admin create-store default
    docker exec 4store-master start-stores -a
    docker exec 4store-master 4s-import default /data/dump.nt -v -a -f ntriples


