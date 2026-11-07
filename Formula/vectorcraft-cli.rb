class VectorcraftCli < Formula
    desc "Illustrator-style vector editor (CLI)."
    homepage "https://github.com/storytold/vectorcraft"
    version "0.22.0"

    on_macos do
        url "https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-cli-0.22.0-macos-universal.zip"
        sha256 "190256852e87d06dc98456323a3f614b3d3a4708cfd94148614d4c92f5085fa3"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-0.22.0-linux-aarch64.tar.gz"
            sha256 "e7572bf70b6262fdbe29e6db06c67a7665b12b6c466869035fd9afad3eec9a97"
        else
            url "https://github.com/storytold/vectorcraft/releases/download/v0.22.0/vectorcraft-0.22.0-linux-x86_64.tar.gz"
            sha256 "6e812a92caec4dba23fd74734fa20a327886ef20427b55f2f887fe9334a0933f"
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
