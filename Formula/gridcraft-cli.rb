class GridcraftCli < Formula
    desc "Excel-style spreadsheet application (CLI)."
    homepage "https://github.com/storytold/gridcraft"
    version "0.19.1"

    on_macos do
        url "https://github.com/storytold/gridcraft/releases/download/v0.19.1/gridcraft-cli-0.19.1-macos-universal.zip"
        sha256 "7c2895ebad0bbd92b65c622ba7e22ada56e0498065dfdbd433111ba1e225eb8a"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/gridcraft/releases/download/v0.19.1/gridcraft-0.19.1-linux-aarch64.tar.gz"
            sha256 "c05373a366e6dded3201380cb82b3a0a137569a1b122d37c1b0ecf01cbd46b75"
        else
            url "https://github.com/storytold/gridcraft/releases/download/v0.19.1/gridcraft-0.19.1-linux-x86_64.tar.gz"
            sha256 "8d97bba2d5bb00fd69ed55064852c1fd914de40d5ecd55ca01c8df81b828946d"
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
