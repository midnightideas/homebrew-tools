class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.18.0/soundcraft-cli-0.18.0-macos-universal.zip"
        sha256 "e511ff45a5b5b755b7ef8b54e5edf8d5fffdc3e8a1a545972f2bcab18c11efdc"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.18.0/soundcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "7d7749b565ae72a7be3a6754456e1d979b1d0546f718b476c826e1cbc449102f"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.18.0/soundcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "338d1fe72b9692a5d99ff435503df58c853f5b96c2e95b2821d883f31f8b5a66"
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
