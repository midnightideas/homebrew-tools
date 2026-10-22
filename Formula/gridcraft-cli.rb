class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.10.0"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.10.0/gridcraft-cli-0.10.0-macos-universal.zip"
        sha256 "e336fce4555a3ef83d6c1aaa3779d0895470f527a35ac28e386166c9f1b850b4"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.10.0/gridcraft-0.10.0-linux-aarch64.tar.gz"
            sha256 "ddf1f0630c45872d52bdc56aa8a2306551efcfe423219196fb04e845283f8520"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.10.0/gridcraft-0.10.0-linux-x86_64.tar.gz"
            sha256 "b78a28605cd34594fc35dfc1ad36a924054571a1382625fb7506fd70cdfb9197"
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
