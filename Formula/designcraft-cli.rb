class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.13.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-cli-0.13.0-macos-universal.zip"
        sha256 "ba49dc1699ed98f27ef8e9336a24a011f086f3d1a46c6f069c2791bf796de960"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-0.13.0-linux-aarch64.tar.gz"
            sha256 "6d75213f93c0db35edf88d84b8ab1382be413f87aca5bdbce88d3485e774d8f5"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.13.0/designcraft-0.13.0-linux-x86_64.tar.gz"
            sha256 "5314d46bc520cf54835a2d1293351be1fed116228e055393019729f04e0f99c2"
        end
    end

    def install
        if OS.mac?
            bin.install "#{name}"
        elsif Hardware::CPU.arm?
            bin.install "bin/#{name}"
        else
            bin.install "bin/#{name}"
        end
    end

    test do
        assert_predicate bin/"#{name}", :exist?
    end

    livecheck do
        url :url
        strategy :github_latest
    end
end
