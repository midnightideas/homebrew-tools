class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.9.0/designcraft-cli-0.9.0-macos-universal.zip"
        sha256 "1c11a863755b9eb38209c8521bd46c42888260179f016a125b3ba5d293c0cb84"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.9.0/designcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "8ba293ae78d76d990684fe407382e1f848bd06b91f65917593a08911d7c82de1"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.9.0/designcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "9c57880889d6b5c399c450b5321ba6c37c9e54e58ac08161d7857a1115d89755"
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
