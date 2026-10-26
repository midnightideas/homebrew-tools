class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.12.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-cli-0.12.1-macos-universal.zip"
        sha256 "23a0b7b4c2bcb92fb9ba2967d0b50608d98f731601ef653ade645d010f1215ea"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-0.12.1-linux-aarch64.tar.gz"
            sha256 "65465f9077fa1490bc6835515ed7dfbc562b5dfe417493c6c1c07838b149ffab"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.12.1/gridcraft-0.12.1-linux-x86_64.tar.gz"
            sha256 "1c1750dd6d26376cf8c8af22b46dc0ed3d8d5cbb115e555f0fc7d0cf7a9aea9a"
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
