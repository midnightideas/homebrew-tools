class PhotocraftCli < Formula
    desc "Photoshop-style raster image editor (CLI)."
    homepage "https://github.com/storytold/photocraft"
    version "0.18.0"

    on_macos do
        url "https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-cli-0.18.0-macos-universal.zip"
        sha256 "f360b19576ec9cdf34c063414478ba0eae80152b7c3657da9bf2531cdc215216"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-0.18.0-linux-aarch64.tar.gz"
            sha256 "51ffada255a9e40fa68b8d8055ab538c7b3dbfb9e9a20bc5eca36fe82e7c1fd6"
        else
            url "https://github.com/storytold/photocraft/releases/download/v0.18.0/photocraft-0.18.0-linux-x86_64.tar.gz"
            sha256 "4b8ac8e1146ac9a97e7bfdef16b267d5396a77809fd4e2329b83dad78086574f"
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
