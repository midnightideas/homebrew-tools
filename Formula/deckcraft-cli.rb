class DeckcraftCli < Formula
    desc "PowerPoint-style presentation builder (CLI)."
    homepage "https://github.com/storytold/deckcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/deckcraft/releases/download/v0.16.0/deckcraft-cli-0.16.0-macos-universal.zip"
        sha256 "b9103783105ee3f11baa23d30be4cf0caf2bdce3f4b2bc0a142c12dc22cf08e8"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/deckcraft/releases/download/v0.16.0/deckcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "8258fca0d7e5647d22cce79a1be6cacb9c21426fb06812b90a893752feda1647"
        else
            url "https://github.com/storytold/deckcraft/releases/download/v0.16.0/deckcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "eed572b2f62395d0f5cfe246a728189651e95e4ecdf4c3e0ad87b77a3831e086"
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
