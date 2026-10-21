class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.9.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.9.0/gridcraft-cli-0.9.0-macos-universal.zip"
        sha256 "763327fd926920b9a78d27bc8baf24825eb98e89cc26d4fb2c125d753e4eb455"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.9.0/gridcraft-0.9.0-linux-aarch64.tar.gz"
            sha256 "1dbd8d6c053f9c14d2703873809ab6d82d70f9c5ef2142d046733dce3ed5aa24"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.9.0/gridcraft-0.9.0-linux-x86_64.tar.gz"
            sha256 "811482f2e4bb66f8c35d59b79e532e1d0812d362bac24e63fd6ddc0844d66bc9"
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
