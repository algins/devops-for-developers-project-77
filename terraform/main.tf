resource "digitalocean_vpc" "default" {
  name = "default"
  region = "ams3"
}

data "digitalocean_ssh_key" "default" {
  name = "igors.algins@gmail.com"
}

resource "digitalocean_droplet" "web1" {
  name = "web1"
  region = "ams3"
  size = "s-1vcpu-1gb"
  image = "ubuntu-24-04-x64"
  vpc_uuid = digitalocean_vpc.default.id
  ssh_keys = [data.digitalocean_ssh_key.default.id]
}

resource "digitalocean_droplet" "web2" {
  name = "web2"
  region = "ams3"
  size = "s-1vcpu-1gb"
  image = "ubuntu-24-04-x64"
  vpc_uuid = digitalocean_vpc.default.id
  ssh_keys = [data.digitalocean_ssh_key.default.id]
}

resource "digitalocean_domain" "default" {
  name = "source.id.lv"
}

resource "digitalocean_certificate" "letsencrypt" {
  name = "letsencrypt"
  type = "lets_encrypt"
  domains = [digitalocean_domain.default.name]
}

resource "digitalocean_loadbalancer" "public" {
  name = "public"
  region = "ams3"
  redirect_http_to_https = true
  enable_backend_keepalive = true
  vpc_uuid = digitalocean_vpc.default.id

  droplet_ids = [
    digitalocean_droplet.web1.id,
    digitalocean_droplet.web2.id
  ]

  forwarding_rule {
    entry_protocol = "http"
    entry_port = 80
    target_protocol = "http"
    target_port = 80
  }

  forwarding_rule {
    entry_protocol = "https"
    entry_port = 443
    target_protocol = "http"
    target_port = 80
    certificate_name = digitalocean_certificate.letsencrypt.name
  }

  healthcheck {
    protocol = "http"
    port = 80
    path = "/login"
    check_interval_seconds = 10
    response_timeout_seconds = 5
    healthy_threshold = 5
    unhealthy_threshold = 3
  }
}

resource "digitalocean_record" "a" {
  domain = digitalocean_domain.default.id
  type = "A"
  name = "@"
  value = digitalocean_loadbalancer.public.ip
  ttl = 1800
}

resource "digitalocean_database_cluster" "postgres" {
  name = "postgres"
  engine = "pg"
  version = "18"
  region = "ams3"
  size = "db-s-1vcpu-1gb"
  node_count = 1
  private_network_uuid = digitalocean_vpc.default.id
}
