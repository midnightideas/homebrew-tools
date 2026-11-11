class WordcraftCli < Formula
    desc "Word-style word processor CLI for .docx files"
    homepage "https://github.com/storytold/wordcraft"
    version "0.17.0"

    on_macos do
        url "https://github.com/storytold/wordcraft/releases/download/v0.17.0/wordcraft-cli-0.17.0-macos-universal.zip"
        sha256 "edb73c8562541df448884fcddc03540980a4a64939d363ab90b59a08b95b14d0"
    end

    on_linux do
        if Hardware::CPU.arm?
            url "https://github.com/storytold/wordcraft/releases/download/v0.17.0/wordcraft-0.17.0-linux-aarch64.tar.gz"
            sha256 "c172dc50ce4d8b262e49f9f0ef4ba4f988c3bda1669c37b9dd6964e46c9e56db"
        else
            url "https://github.com/storytold/wordcraft/releases/download/v0.17.0/wordcraft-0.17.0-linux-x86_64.tar.gz"
            sha256 "9c744c0c31a3ce25df82680fc75e645d682846faccbe103f4f91a758b19f3687"
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
