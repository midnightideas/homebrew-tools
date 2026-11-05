class FilmcraftCli < Formula
    desc "Premiere-style non-linear video editor (CLI)."
    homepage "https://github.com/storytold/filmcraft"
    version "0.17.1"

    on_macos do
        url "https://github.com/storytold/filmcraft/releases/download/v0.17.1/filmcraft-cli-0.17.1-macos-universal.zip"
        sha256 "ca0749fecd44c51caee419d90938d24ce322340d7af1d1660605166f1ecd2755"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.1/filmcraft-0.17.1-linux-aarch64.tar.gz"
            sha256 "225d6d815fad8cdfb720b5ce382196b60edd6ee10a9216660bcdabb28beaaa95"
        else
            url "https://github.com/storytold/filmcraft/releases/download/v0.17.1/filmcraft-0.17.1-linux-x86_64.tar.gz"
            sha256 "397ae9fece559b37863b4b076af46a63b6e4387c35f781709e4efad14fe71ebe"
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
