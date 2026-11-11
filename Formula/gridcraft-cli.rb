class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.18.0/gridcraft-cli-0.18.0-macos-universal.zip"
        sha256 "4d9b6ef518a5740007a88bcad1551c09bd90f0c6829b1a4622364d85b92f5556"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.18.0/gridcraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "94554b3a3d4aa87acd5bfec36957ecc3d49cf317000d2f8c28bf9fa644c62d4d"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.18.0/gridcraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "69205fd72e48e83e763c53c8f6ca3edc01d38ba8ba0d16e2b184a9c858a4cd5f"
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
