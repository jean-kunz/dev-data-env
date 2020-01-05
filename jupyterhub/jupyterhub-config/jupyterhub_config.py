# dummy for testing. Don't use this in production!
c.JupyterHub.authenticator_class = 'dummyauthenticator.DummyAuthenticator'
c.DummyAuthenticator.password = "toto"
c.Authenticator.admin_users = {'jean'}

# launch with docker
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
#c.JupyterHub.spawner_class = 'dockerspawner.SystemUserSpawner'

# we need the hub to listen on all ips when it is in a container
c.JupyterHub.hub_ip = '0.0.0.0'
# the hostname/ip that should be used to connect to the hub
# this is usually the hub container's name
c.JupyterHub.hub_connect_ip = 'my-hub'

# pick a docker image. This should have the same version of jupyterhub
# in it as our Hub.
#c.DockerSpawner.image = 'jupyter/base-notebook'
c.DockerSpawner.image = 'jean/my-notebook'

# tell the user containers to connect to our docker network
c.DockerSpawner.network_name = 'jupyterhub'

notebook_dir="/data"
c.DockerSpawner.notebook_dir = notebook_dir

c.DockerSpawner.volumes = { '/Users/jeankunz/jup-hub/{username}': notebook_dir }

#spawn_cmd = "jupyterhub-singleuser"
#c.DockerSpawner.extra_create_kwargs.update({ 'command': spawn_cmd })

# For debugging arguments passed to spawned containers
c.DockerSpawner.debug = True

# delete containers when the stop
c.DockerSpawner.remove = True