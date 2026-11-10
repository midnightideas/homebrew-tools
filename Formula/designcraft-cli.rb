class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.19.0/designcraft-cli-0.19.0-macos-universal.zip"
        sha256 "30245ba54b026437dc5563a3ad483c1217b7ccbe19871dc7261187311d3b7b74"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.19.0/designcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "c9831a8a6f8b87e1c439a8552db269fbd6b38bf92c292669218e02e6122f4cbc"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.19.0/designcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "5055531fe9f60e4da6113770fecf27dfb03984f831fa4ed70730be156a316866"
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
