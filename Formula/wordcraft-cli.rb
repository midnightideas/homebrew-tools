class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.10.0/wordcraft-cli-0.10.0-macos-universal.zip"
        sha256 "09e3defc57675597f3388fd1b4d4e20b97be3f4e0cd517ae580fc28b421cc1d2"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.10.0/wordcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "77e838120d9da38752ab355066a0987253d9bc95dfddad1c47bac1f180975bbb"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.10.0/wordcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "ca99ea350ba0aea4103fc8020cad98f051c58d9e9fcf670c119d810108cc45ff"
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
