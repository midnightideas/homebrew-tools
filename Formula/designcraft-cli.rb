class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.8.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.8.0/designcraft-cli-0.8.0-macos-universal.zip"
        sha256 "e663f967d9e1c439e0eb7759147be29121da198cdd71cedd4afb3ae0e0336243"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.8.0/designcraft-0.8.0-linux-aarch64.tar.gz"
            sha256 "86419263db3b4c7dfd0bf61948eb1931b32cea56ce9caca5b4b03cd146dd3926"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.8.0/designcraft-0.8.0-linux-x86_64.tar.gz"
            sha256 "96a835fd89ebf6970b7dec93652e1b2f081123a69c78e19998ca6c84ca322d77"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to designcraft-cli-0.8.0-macos-universal/; install just the binary.
            bin.install "designcraft-cli-0.8.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "designcraft-0.8.0-linux-aarch64/bin/#{name}"
        else
            bin.install "designcraft-0.8.0-linux-x86_64/bin/#{name}"
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
