class DesigncraftCli < Formula
    desc "InDesign-style page layout application (CLI)."
    homepage "https://github.com/storytold/designcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/designcraft/releases/download/v0.17.0/designcraft-cli-0.17.0-macos-universal.zip"
        sha256 "5c7f71f5602f90f2e7334933d2c6ea443f998161828b7992ecce9de84d2008f8"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/designcraft/releases/download/v0.17.0/designcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "1bb183f2e3a3b2a0748fa657f1677c82986a766669379d4f3239dc3c98e2a905"
        else
            url "https://github.com/storytold/designcraft/releases/download/v0.17.0/designcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "bb6f9cec404655350266e98ee10d9b5a154507ed998ad7af47b25335afad1872"
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
