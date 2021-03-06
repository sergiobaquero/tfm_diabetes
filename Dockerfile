# Builds a Docker image to run docker-example-app2.  The base image will handle
# adding any application files and required dependencies to this image.
#
FROM sergiobaquero/master:baseimage
LABEL maintainer="Sergio Baquero"

# Create a symlink with a unique name to the Flask app's static resources.
# This volume can then get mounted and used by another container.
#RUN ln -s /var/www/app/static /var/www/app2-static

ENV PKL_DIR /results
RUN mkdir -p $PKL_DIR


# Expose the port where uWSGI will run
EXPOSE 5000

# If running this app behind a webserver using the uwsgi protocol (like nginx),
# then use --socket.  Otherwise run with --http to run as a full http server.
CMD ["python3","./src/model/training.py"]
