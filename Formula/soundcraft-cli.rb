class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.7.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.7.0/soundcraft-cli-0.7.0-macos-universal.zip"
        sha256 "a4272112e9ab6e489cfab1b169741f70a5fc151ce1c1b2300cd92d66fa6f9d3d"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.7.0/soundcraft-0.7.0-linux-aarch64.tar.gz"
            sha256 "5b5152464bd6a3ae6c48be026d80e0c4e0da58d581a45fe4b5803d6fcfbbe006"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.7.0/soundcraft-0.7.0-linux-x86_64.tar.gz"
            sha256 "8d7afbe5fe433cb338b7ccee0820285d6ce1bfc8c006d551ca8840c27a911ab2"
        end
    end

    def install
        if OS.mac?
            # macOS zip extracts to soundcraft-cli-0.7.0-macos-universal/; install just the binary.
            bin.install "soundcraft-cli-0.7.0-macos-universal/#{name}"
        elsif Hardware::CPU.arm?
            bin.install "soundcraft-0.7.0-linux-aarch64/bin/#{name}"
        else
            bin.install "soundcraft-0.7.0-linux-x86_64/bin/#{name}"
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
