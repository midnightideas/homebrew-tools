class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.21.1"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.21.1/vectorcraft-cli-0.21.1-macos-universal.zip"
        sha256 "1812e57498785d39485865d8fc7d9f6990f313217a2411c3d303ad17fe6e9181"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.1/vectorcraft-0.21.1-linux-aarch64.tar.gz"
            sha256 "2e6f3026856b0f9609acb1529bb138dcda7bee2e34a285e06549937696ac3604"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.21.1/vectorcraft-0.21.1-linux-x86_64.tar.gz"
            sha256 "383bba06fbde7cb87c7e137937ad516a9a585491c5a927d8631ee54bbf1d4e93"
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
