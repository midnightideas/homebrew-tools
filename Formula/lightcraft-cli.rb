class LightcraftCli < Formula
    desc "Lightroom-style photo library and raw development (CLI)."
    homepage "https://github.com/storytold/lightcraft"
    version "0.11.0"

    on_macos do
        url "https://github.com/storytold/lightcraft/releases/download/v0.11.0/lightcraft-cli-0.11.0-macos-universal.zip"
        sha256 "29e057886ef22d22fc48db515d4f6a863d5a5991889c0c8d8e0d4f63fdd095f3"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/lightcraft/releases/download/v0.11.0/lightcraft-0.11.0-linux-aarch64.tar.gz"
            sha256 "c8f3f31193055d3c804536e626b29c70d32a0f8a5ae6551a0b08c5193bf8ddda"
        else
            url "https://github.com/storytold/lightcraft/releases/download/v0.11.0/lightcraft-0.11.0-linux-x86_64.tar.gz"
            sha256 "a2d1be1c52abb81f5a0736624a20ce9287183e0b0955005829f4a9dda41496ba"
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
