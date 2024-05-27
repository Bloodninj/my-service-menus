# Custom KDE Service Menus
This is a small collection of scripts and KDE Service Menu (context menu) items I find useful. Obviously these are designed to be used with KDE, including the `kdialog` tool that comes installed with that.

## Requirements
* `ffmpeg` (with SVT-AV1 support)
* `imagemagick` (with AVIF support)
* `xclip` for copying links to clipboard
* `scp` for file transfers in the `send2vps` script
  
On a Debian- or Ubuntu-based system, you can install these with the following command:
```bash
sudo apt install -y ffmpeg imagemagick xclip scp
```

## Setup
1. Copy the scripts from the `scripts` folder somewhere where they can be run by you - I recommend `~/.local/bin`
2. Copy the desktop entries from the `service-menus` folder to `~/.local/share/kio/servicemenus` (if the `kio` folder does not exist then you are likely on KDE version < 5.85: use `~/.local/share/~/.local/share/kservices5/ServiceMenus` instead)
3. Restart your file browser if needed

## Usage

### Image/video conversion to AVIF
The `img2avif` script uses ImageMagick to convert an input file to AVIF format, placing the output in the same directory. Right-click the input file and the option should be in the context menu (if you have many context menu actions, it may be in the `Actions` sub-menu).

If the input file is GIF format, the script will instead use `ffmpeg` to convert to AVIF format to preserve any potential animation, as AVIF uses the AV1 video codec internally, with no audio and a different extension.

### GIF/video conversion to AV1 WebM
The `vid2av1` script uses `ffmpeg` to convert the input video to a WebM file using AV1 video codec and Ogg Opus audio, saving the output to the same directory.

**Note:** AV1 conversion can take a long time compared to older codecs like H.264 and VP8. Be patient, especially if the input video is large. It will also turn your computer into a rocket engine during conversion.

### Send to VPS
The `send2vps` script takes a file and uses `scp` to transfer it to another computer using SSH. On successful transfer, it copies the public link to your clipboard.

**Note:** Make sure you customise the parameters in `send2vps.sh` for both the VPS/image host and the public URL it will be displayed at.