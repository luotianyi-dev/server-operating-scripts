import os
import toml
from flask import Flask, Response, redirect

app = Flask(__name__)
config_file = os.environ.get("CONFIG_FILE", "config.toml")
print(f"Loading config from {config_file}")
config = toml.load(config_file)
host = config.get("host", "127.0.0.1")
port = config.get("port", 7120)
debug = config.get("debug", True)


@app.errorhandler(404)
def handle_404_error(err_msg):
    return "Not found 404.0", 404


@app.errorhandler(500)
def handle_500_error(err_msg):
    return "Internal server error", 500


@app.route(config["route"])
def handle_request(url: str):
    current_config = toml.load(os.environ.get("CONFIG_FILE", "config.toml"))
    target = current_config.get(url)
    if target is None:
        return f"Not found 404.1", 404

    url = target.get("url")
    if url is None:
        return f"Not found 404.2", 404

    redirect_status = target.get("status", 302)
    if (redirect_status != 302) and (redirect_status != 301):
        redirect_status = 302
    response = Response()
    response.headers["Location"] = url
    response.status_code = redirect_status
    return response


if __name__ == "__main__":
    app.run(host=host, port=port, debug=debug)
