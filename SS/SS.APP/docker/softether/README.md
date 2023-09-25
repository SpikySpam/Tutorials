<h1 align="center">Softether VPN</h1>
<h3 align="center">for Docker</h3>

## 🔗 Links

- [Website](https://www.softether.org/)
- [GitHub](https://github.com/SoftEtherVPN/SoftEtherVPN)

## 💾 Setup

- Get the latest version of SoftEther VPN Sever [HERE](https://github.com/SoftEtherVPN/SoftEtherVPN/releases)

- Building Image:

   ```bash
   # You can use ./start.sh with a Digital Ocean Cluster in NY, or
   # Docker Build
   docker compose -f "$TF_VAR_PATH_LBRP_APPS/docker/houdini/softether/docker-compose.yaml" build --no-cache
   docker push lbrpsoftware/softether:$TF_VAR_VERSION_DOCKER_SOFTETHER
   ```

- Configure with **vpnsmgr.exe**

  - Admin

    - Make a connection on port 5555
      - Docker: localhost
      - Kind:   localhost  (port forwarding of the softether service enabled)
      - Ohter:  IP-address (port forwarding of the softether service enabled)
    - Administrator Password: BitWarden
    - ✅ Remote Access VPN Server
    - Yes
    - OK
    - Exit
    - ✅ Enable L2TP Server Function (L2TP over IPsec)
    - IPsec Pre-Shared Key: BitWarden
    - ✅ Disable VPN Azure
    - OK

  - User

    - Username:
    - Auth Type: Password Authentication
    - Password:
    - OK
    - Exit
    - Close

  - Manage Virtual Hub

    - Virtual NAT and Virtual DHCP Server (SecureNAT)
    - Enable SecureNAT
    - OK
    - Exit
    - Exit
    - Exit

-
