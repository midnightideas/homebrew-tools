class DevpodCli < Formula
    desc "Create reproducible development environments from a devcontainer.json"
    homepage "https://www.devpod.sh/"
    version "0.6.15"

    on_macos do
        if Hardware::CPU.arm?
            url "https://github.com/loft-sh/devpod/releases/download/v0.6.15/devpod-darwin-arm64"
            sha256 "0c50934f4199732ff37e89708bc5c028ecda75d854a151cb2644e4ba39f4d7f7"
        else
            url "https://github.com/loft-sh/devpod/releases/download/v0.6.15/devpod-darwin-amd64"
            sha256 "1205fc8626d9daa011479ded3ce7271359714f0d011acfcf739adf90901a6ee8"
        end
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/loft-sh/devpod/releases/download/v0.6.15/devpod-linux-arm64"
            sha256 "9226161e0c9f5a45d0f8d1778f940498e787b650f0e0fcf3c29f1f67e7a3f272"
        else
            url "https://github.com/loft-sh/devpod/releases/download/v0.6.15/devpod-linux-amd64"
            sha256 "cc50bce09229d5a6d448ac1d4494327f4b8f7a20321e5fcee3bfec1aef0d20c5"
        end
    end

    def install
        if OS.mac?
            if Hardware::CPU.arm?
                bin.install "devpod-darwin-arm64" => "devpod"
            else
                bin.install "devpod-darwin-amd64" => "devpod"
            end
        elsif Hardware::CPU.arm?
            bin.install "devpod-linux-arm64" => "devpod"
        else
            bin.install "devpod-linux-amd64" => "devpod"
        end
    end

    test do
        assert_predicate bin/"devpod", :exist?
    end

    livecheck do
        url :url
        strategy :github_latest
    end
end
