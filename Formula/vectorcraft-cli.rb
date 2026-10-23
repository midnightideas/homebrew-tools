class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.16.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.16.0/vectorcraft-cli-0.16.0-macos-universal.zip"
        sha256 "f68c204642c598ab76e51a773f6aa80e3ff0ed303c78fdf4c36c4dfbad2a76f6"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.16.0/vectorcraft-0.16.0-linux-aarch64.tar.gz"
            sha256 "7a624f47c20c10e4a8c07bba90e30f3da2ff26e5653632f942c7c5404105d02e"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.16.0/vectorcraft-0.16.0-linux-x86_64.tar.gz"
            sha256 "651fac17255271ad1dbc8ba1e8287db9f28e529ba9a14dd0383eca93a2cc5aa6"
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
