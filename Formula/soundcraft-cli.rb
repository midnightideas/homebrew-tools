class SoundcraftCli < Formula
    desc "Pro Tools-style digital audio workstation (CLI)."
    homepage "https://github.com/storytold/soundcraft"
    version "0.19.0"

    on_macos do
        url "https://github.com/storytold/soundcraft/releases/download/v0.19.0/soundcraft-cli-0.19.0-macos-universal.zip"
        sha256 "d0bd08082292f972e3435834df437f5d9c8b8f4913586138509d1e1c0ab7d986"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/soundcraft/releases/download/v0.19.0/soundcraft-0.19.0-linux-aarch64.tar.gz"
            sha256 "488ec7ebc0be4f3f274fb058e4d3fefd648c3e984d2b9adfcdc969eebdaf7f3c"
        else
            url "https://github.com/storytold/soundcraft/releases/download/v0.19.0/soundcraft-0.19.0-linux-x86_64.tar.gz"
            sha256 "89a29bf48c299eee593d7cd684b21c8483ca287abc196657ae3f959a1ebc18ad"
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
