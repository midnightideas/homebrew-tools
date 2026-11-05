class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.16.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.16.1/gridcraft-cli-0.16.1-macos-universal.zip"
        sha256 "09ab14008c219541474487f77d250c00e07975a63efc1e4ea7bd21139b329a74"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.1/gridcraft-0.16.1-linux-aarch64.tar.gz"
            sha256 "f580f5c22406e3781f9dac0f6be1e08de6a6e6e59046a92c9bebe1fc8a4fbd81"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.16.1/gridcraft-0.16.1-linux-x86_64.tar.gz"
            sha256 "429e0334cdd30ed75ebff59453a644114c3cb7e3347991a81b32041d75f41fe4"
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
