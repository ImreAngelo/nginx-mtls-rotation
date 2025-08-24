import os
import platform
import subprocess
import urllib.request
import zipfile
import stat

def download_mkcert():
    system = platform.system().lower()
    arch = platform.machine().lower()
    
    url = "https://dl.filippo.io/mkcert/latest?for="
    filename = "scripts/"

    # Get pre-built binaries for current system
    if system == "windows":
        url += "windows/amd64"
        filename += "mkcert.exe"
    elif system == "darwin":
        url += "darwin/amd64"
        filename += "mkcert"
    elif system == "linux":
        url += "linux/arm64" if "arm" in arch or "aarch" in arch else "linux/amd64"
        filename += "mkcert"
    else:
        raise Exception(f"Unsupported OS: {system}")

    print(f"Downloading mkcert from {url}")
    urllib.request.urlretrieve(url, filename)

    # Make it executable (Linux/macOS)
    if system != "windows":
        st = os.stat(filename)
        os.chmod(filename, st.st_mode | stat.S_IEXEC)

    return filename

def run_mkcert(mkcert_bin, claims = ["localhost", "vault.localhost", "127.0.0.1", "::1"]):
    # Install local CA
    print("Installing local CA...")
    subprocess.run([mkcert_bin, "-install"], check=True)

    # Generate a certificate for localhost
    print("Generating localhost certificate...")
    subprocess.run([mkcert_bin, 
        "-key-file", "services/networking/bootstrap/rootCA.key", 
        "-cert-file", "services/networking/bootstrap/rootCA.crt"
    ] + claims, check=True)

if __name__ == "__main__":
    mkcert_bin = download_mkcert()
    run_mkcert(mkcert_bin)
    print("✅ Done! Certificates generated in current directory.")
